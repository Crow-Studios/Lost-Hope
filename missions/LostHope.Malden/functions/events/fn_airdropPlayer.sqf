/*
	Filename: fn_airdropPlayer.sqf
	Author: StevioUK/Silence
	Date: 8/7/22
	Description: Creates an airdrop that drops within 100 meters of the player
*/

params ["_unit", "_flareThrown", "_flare", "_boss"];

disableSerialization;

deleteMarker "airdropLocation";

//Checks
if (_unit isEqualTo objNull) exitWith {diag_log "Airdrop: Aborted, no unit/not a unit"};
if (missionNamespace getVariable ["Airdrop_Active", false]) exitWith {["Error", "There is an ongoing airdrop mission right now!", "info", 5] call ["lost_hope_fnc_notificationHint"];};

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
if !(_flareThrown) then {
	_flare = createVehicle ["lost_hope_ammo_flare_1", getPosATL _unit];
};
_flareType = typeOf _flare;
_flarePos = getPosATL _flare;
_grp = createGroup [civilian, true];
"B_RangeMaster_F" createUnit [getPosATL _aircraft,_grp,"pilot = this"];
pilot moveInDriver _aircraft;

//DO NOT CHANGE THESE OR I WILL ~BLEEP~
_aircraft allowDamage false;
_flare allowDamage false;
pilot allowDamage false;

//Hints
["Airdrop", "An airdrop has been called in by a player! Check your maps to find it!", "info", 5] remoteExec ["lost_hope_fnc_notificationHint"];
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
[_aircraft, _airdropDistance_text, _airdrop_picture, _unit, _flare, _flarePos, _flareType, _boss] spawn {
	params ["_aircraft", "_text", "_airdrop_picture", "_unit", "_flare", "_flarePos", "_flareType", "_boss"];
	while {true} do {
		meters = _aircraft distance2D _flarePos;
		"aircraft" setMarkerPos getPosATL _aircraft;
		_text ctrlSetStructuredText parseText format ["The pilot is <t color='#ff0000'>%1</t> meters away from you.", round(meters)];

		sleep .1;

		if (meters <= 3000) then {
			pilot flyInHeight 200;
			_aircraft flyInHeight 200;
		};

		if (meters <= 100) exitWith {
			_text ctrlSetStructuredText parseText format ["The package has been dropped!"]; 
			["Airdrop", "The package has been dropped! Hurry up and look for it!", "info", 5] remoteExec ["lost_hope_fnc_notificationHint"]; 
			uiSleep .75;
			_airdrop_picture ctrlSetText "UI\pictures\Airdrop\airdrop.paa";
			deleteMarker "aircraft";
		};
		
		if ( meters >= 10 && !(alive _flare) ) then {
			_flare = createVehicle [_flareType, _flarePos];
			_flare allowDamage false;
		};

		sleep .1;

		_vel = velocity _aircraft;

		_dir = direction _aircraft;

		_speed = 2; comment "Added speed";

		_aircraft setVelocity [
			(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed),

			(_vel select 2)
		];
	};

	_crate = createVehicle ["C_IDAP_supplyCrate_F", getPosATL _aircraft];
	_crate setPosATL (getPosATL _aircraft);
	_crate allowDamage false;
	uiSleep .2;
	_crate setVelocity [0,0,0];
	clearItemCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	waitUntil {getPosATL _crate select 2 < 100};
	_para = createVehicle ["B_Parachute_02_F", getPosATL _crate];
	_crate attachTo [_para,[0,0,0]];
	_smoke = createVehicle ["lost_hope_ammo_flare_1", getPosATL _crate];
	_smoke attachTo [_crate,[0,0,0]];
	_para setVehicleCargo _crate;
	_lootType = selectRandom ["lost_hope_airdrop_weapons", "lost_hope_airdrop_supplies", "lost_hope_airdrop_clothing", "lost_hope_airdrop_mixed"];

	while {alive _para} do {
		_crate setVectorUp [0,0,1];
		_para setVectorUp [0,0,1];
		_para setVelocity [0,0,-5];
		if ( ( getPosATL _para ) select 2 <= 5 ) then {
			deleteVehicle _para;
		};
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

	// Spawn zombie horde to airdrop

	if (_boss) then {

		private _pos = [getPosATL _crate, 20, 30, 3, 0, 20, 0] call BIS_fnc_findSafePos; // position, min dist, max dist, dist from buildings

		private _mutant = ["WBK_SpecialZombie_Smasher_3", _pos, EAST] call lost_hope_fnc_spawnMutant;

		while {_mutant distance _crate <= 10} do {
			_mutant doMove (position _crate);
			if (_x distance _crate <= 10) exitWith {};
			sleep 0.3;
		};

		for "_i" from 0 to 19 do {

			private _group = ["lost_hope_zombie_vanilla_police", "lost_hope_zombie_vanilla_science", "lost_hope_zombie_vanilla_military"];
			private _group = selectRandom _group;
			private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );

			private _pos = [getPosATL _crate, 10, 20, 3, 0, 20, 0] call BIS_fnc_findSafePos; // position, min dist, max dist, dist from buildings

			//if ("triggerman" in _loadout) then {};
			private _zombie = ["C_man_polo_1_F", _pos, _group, _loadout, EAST, "military"] call lost_hope_fnc_spawnZombie;

			uiSleep .2;
		};

		private _amount = 10;

		if (selectRandom [1,2,3] isEqualTo 1) then {
			groupSide = grpNull;
			for "_i" from 0 to (_amount - 1) do {

				private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie") call BIS_fnc_getCfgSubClasses );
				private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );
				private _armed = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "armed");
				diag_log _armed;
				hint str _armed;

				switch (_armed) do
				{
					case 0: {melee = true};
					case 1: {melee = false};
				};

				diag_log melee;
				
				private _pos = [getPosATL _crate, 100, 300, 3, 0, 20, 0] call BIS_fnc_findSafePos;
				private _unit = ["C_man_polo_1_F", _pos, _group, _loadout, INDEPENDENT, melee] call lost_hope_fnc_spawnUnit;

				if (groupSide isEqualTo grpNull) then {
					groupSide = createGroup [EAST, true];
				};

				if !(groupSide isEqualTo grpNull) then {
					[_unit] join groupSide;
				};

				_unit doMove (position _crate);

				uiSleep 0.2;

			};
		};

	};
	/*
	createMarker ["airdropLocation", getPosATL _aircraft];
	"airdropLocation" setMarkerShape "ELLIPSE";
	"airdropLocation" setMarkerColor "ColorBlue";
	"airdropLocation" setMarkerText "Airdrop Radius";
	"airdropLocation" setMarkerSize [200, 200];
	missionNamespace setVariable [("Lost_Hope_Marker"+"airdropLocation"+"CanRun"),false,true];
	*/

	deleteVehicle _smoke;
	_smoke = createVehicle ["lost_hope_ammo_flare_2", getPosATL _crate];
	_smoke attachTo [_crate,[0,0,0]];

	uiSleep 10;
	("Airdrop" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
	deleteVehicle _aircraft;
	deleteVehicle pilot;
	missionNamespace setVariable ["Airdrop_Active", false, true];

	uiSleep 600;
	deleteVehicle _crate;
};