/*
	Filename: fn_airdropPlayer.sqf
	Author: StevioUK/Silence
	Date: 8/7/22
	Description: Creates an airdrop that drops within 100 meters of the player
*/

params ["_unit"];

disableSerialization;

deleteMarker "airdropLocation";

//Checks
if (_unit isEqualTo objNull) exitWith {};
if (missionNamespace getVariable ["Airdrop_Active", false]) exitWith {["Error", "There is an ongoing airdrop mission right now!", "info", 5 ] call ["lost_hope_fnc_notificationHint"];};

// UI Creation
("Airdrop" call BIS_fnc_rscLayer) cutRsc ["Airdrop_UI", "PLAIN"]; //Open UI
private _display = uiNamespace getVariable "Airdrop"; //Get the controls
_airdropDistance_text = _display displayCtrl 3000; //Distance text
_airdrop_picture = _display displayCtrl 3200; //Distance text


//Variables
_maxRange = 15000; //Max range for airdrop
_minRange = 12000; //Min range for airdrop
missionNamespace setVariable ["Airdrop_Active", true, true];

private _randomPos = [[[getPosATL _unit, _maxRange]], [ "water", [getPosATL _unit, _minRange]]] call BIS_fnc_randomPos; //Random position not in water within range of player

_aircraft = "C_Plane_Civil_01_racing_F" createVehicle _randomPos;
_aircraft setPosATL [getPosATL _aircraft select 0, getPosATL _aircraft select 1, (getPosATL _aircraft select 2) + 1500];
_grp = createGroup civilian;
"B_RangeMaster_F" createUnit [getPosATL _aircraft, _grp,"pilot = this"];
pilot moveInDriver _aircraft;

//DO NOT CHANGE THESE OR I WILL ~BLEEP~
_aircraft allowDamage false;
pilot allowDamage false;

//Hints
["Airdrop", "An airdrop has been called in by a player! Check your maps to find it!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"];
_airdrop_picture ctrlSetText "UI\pictures\Airdrop\incoming.paa";

//Settings
pilot doMove (getPosATL _unit);
pilot flyInHeight 700;
_aircraft flyInHeight 700;

_aircraftstr = createMarker ["aircraft", getPosATL _aircraft];
_aircraftstr setMarkerShape "ICON";
_aircraftstr setMarkerType "Contact_pencilCircle2";
_aircraftstr setMarkerColor "ColorRed";
_aircraftstr setMarkerText "Airdrop Plane";
//_aircraftstr setMarkerSize [50, 50];
missionNamespace setVariable [("Lost_Hope_Marker"+_aircraftstr+"CanRun"),false,true];

//Main Method
[_aircraft, _airdropDistance_text, _airdrop_picture, _unit] spawn {
	params ["_aircraft", "_text", "_airdrop_picture", "_unit"];
	while {true} do {
		meters = _aircraft distance2D _unit;
		"aircraft" setMarkerPos getPosATL _aircraft;
		_text ctrlSetStructuredText parseText format ["The pilot is <t color='#ff0000'>%1</t> meters away from you.", round(meters)];

		sleep .1;

		if (meters <= 3000) then {
			pilot flyInHeight 200;
			_aircraft flyInHeight 200;
		};

		if (meters <= 100) exitWith {
			_text ctrlSetStructuredText parseText format ["The package has been dropped!"]; 
			["Airdrop", "The package has been dropped! Hurry up and look for it!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"]; 
			uiSleep .75;
			_airdrop_picture ctrlSetText "UI\pictures\Airdrop\airdrop.paa";
			deleteMarker "aircraft";
		};
		
		/*
		if (meters >= 100) exitWith {
			["Airdrop", "The package drop has been cancelled, the flare has burnt out!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"]; 
			deleteMarker "aircraft";
			_text ctrlSetStructuredText parseText format ["The package has been aborted."]; 
			_airdrop_picture ctrlSetText "UI\pictures\Airdrop\airdrop.paa";
			_airdrop_picture ctrlSetTextColor [1, 0, 0, 1];
			deleteVehicle _aircraft;
			deleteVehicle pilot;
		};
		*/

		// Add flare gun model/object, base off of that, in meantime if the player isn't close to dropsite hint notifcation that it was cancelled and delete the plane as normal

		sleep .1;

		_vel = velocity _aircraft;

		_dir = direction _aircraft;

		_speed = 2; comment "Added speed";

		_aircraft setVelocity [
			(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed),

			(_vel select 2)
		];
	};

	_crate = createVehicle ["C_IDAP_supplyCrate_F", getPosATL _aircraft - [0,0,-10]];
	_crate allowDamage false;
	_crate setVelocity [0,0,0];
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	waitUntil {getPosATL _crate select 2 < 100};
	_para = createVehicle ["B_Parachute_02_F", getPosATL _crate];
	_crate attachTo [_para,[0,0,0]];
	_smoke = createVehicle ["SmokeShellRed", getPosATL _crate];
	_smoke attachTo [_crate,[0,0,0]];
	_lootType = selectRandom ["lost_hope_airdrop_weapons", "lost_hope_airdrop_supplies", "lost_hope_airdrop_clothing", "lost_hope_airdrop_mixed"];

	while {alive _para} do {
		_crate setVectorUp [0,0,0];
		_para setVectorUp [0,0,0];
		_para setVelocity [0,0,-5];
		uiSleep .01;
	};

	// Loot initialisation - Silence

	private _weapons = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "weapons");
	private _items = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "items");
	private _explosives = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "explosives");
	private _uniforms = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "uniforms");
	private _vests = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "vests");
	private _backpack = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "backpack");
	private _headgear = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "headgear");
	private _nvg = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "nvg");
	private _terminal = getArray (missionConfigFile >> "lost_hope_airdrops" >> _lootType >> "terminal");

	//result = [_weapons, _items, _explosives, _uniforms, _vests, _backpack, _headgear, _nvg, _terminal];
	//hint str result;

	for "_i" from 0 to 9 do { // If it's 0-10 it adds 11 weapons
		private _gun = selectRandom _weapons;
		private _mags = selectRandom ( [_gun] call BIS_fnc_compatibleMagazines );
		if (_lootType isEqualTo "lost_hope_airdrop_weapons" || _lootType isEqualTo "lost_hope_airdrop_mixed") then {
			_crate addItemCargoGlobal [_gun, 1];
			_crate addItemCargoGlobal [ _mags, (selectRandom [2, 5, 7]) ];
		};
	};


	for "_i" from 0 to 3 do {
		_crate addItemCargoGlobal [selectRandom _items, 5];
	};

	for "_i" from 0 to 1 do {
		_crate addItemCargoGlobal [selectRandom _uniforms, 5];
	};

	for "_i" from 0 to 1 do {
		_crate addItemCargoGlobal [selectRandom _vests, 5];
	};

	// Skip backpack because it uses a seperate command

	for "_i" from 0 to 1 do {
		_crate addItemCargoGlobal [selectRandom _headgear, 2];
	};

	if (random 100 <= 20) then {
		_crate addItemCargoGlobal [selectRandom _explosives, 1];
	};

	_crate addItemCargoGlobal [selectRandom _nvg, 5];
	_crate addItemCargoGlobal [selectRandom _terminal, 1];
	
	// Loot End

	pilot doMove [0,0,1000];

	waitUntil {getPosATL _crate select 2 < 10}; //Wait until package lands and then deploy blue smoke
	_crate setVectorUp surfaceNormal position _para;
	_para setVectorUp surfaceNormal position _para;
	_airdrop_picture ctrlSetText "UI\pictures\Airdrop\landed.paa";
	_text ctrlSetStructuredText parseText format ["The package has landed!"];
	["Airdrop", "The package has landed! Hurry before it gets looted!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"];

	/*
	createMarker ["airdropLocation", getPosATL _aircraft];
	"airdropLocation" setMarkerShape "ELLIPSE";
	"airdropLocation" setMarkerColor "ColorBlue";
	"airdropLocation" setMarkerText "Airdrop Radius";
	"airdropLocation" setMarkerSize [200, 200];
	missionNamespace setVariable [("Lost_Hope_Marker"+"airdropLocation"+"CanRun"),false,true];
	*/

	deleteVehicle _smoke;
	_smoke = createVehicle ["SmokeShellBlue", getPosATL _crate];
	_smoke attachTo [_crate,[0,0,0]];

	uiSleep 10;
	("Airdrop" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
	deleteVehicle _aircraft;
	deleteVehicle pilot;
	missionNamespace setVariable ["Airdrop_Active", false, true];

	uiSleep 600;
	deleteVehicle _crate;
};


//TODO

//Add items in the package