/*
	Filename: fn_airdropRandom.sqf
	Author: StevioUK
	Date: 8/7/22
	Description: This file is responsible for creating an airdrop that at a random point on the map
*/

/*

disableSerialization;

deleteMarker "airdropLocationRANDOM";

//Checks
if (missionNamespace getVariable ["Airdrop_Active", false]) exitWith { };

//Variables
_maxRange = 10000; //Max range for airdrop
_minRange = 6000; //Min range for airdrop
missionNamespace setVariable ["Airdrop_Active", true, true];

private _randomPos = [nil, ["water"]] call BIS_fnc_randomPos; //Random position not in water within range of player

_aircraft = "C_Plane_Civil_01_racing_F" createVehicle _randomPos;
_aircraft setPosATL [getPosATL _aircraft select 0, getPosATL _aircraft select 1, (getPosATL _aircraft select 2) + 1500];
_grp = createGroup civilian;
"B_RangeMaster_F" createUnit [getPosATL _aircraft, _grp,"pilot = this"];
pilot moveInDriver _aircraft;

//DO NOT CHANGE THESE OR I WILL MOLEST YOUR CAT!
_aircraft allowDamage false;
pilot allowDamage false;
// Ok I won't change them ;)

_randomPos = [nil, ["water"]] call BIS_fnc_randomPos; //Random position not in water
//Hints
["Airdrop", "An airdrop has been called in! Check your maps to locate it!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"];

//Settings
pilot doMove _randomPos;
pilot flyInHeight 600;
_aircraft flyInHeight 600;

_markerstr = createMarker ["aircraft", getPosATL _aircraft];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType "Contact_pencilCircle2";
_markerstr setMarkerColor "ColorRed";
_markerstr setMarkerText "Airdrop Plane";

//Main Method
[_aircraft, _randomPos] spawn {
	params ["_aircraft", "_randomPos"];
	while {true} do {
		meters = _aircraft distance2D _randomPos;
	    "aircraft" setMarkerPos getPosATL _aircraft;

		sleep .1;

		if (meters < 100) exitWith {  ["Airdrop", "The package has been dropped! Check your map", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"]; uiSleep .75; deleteMarker "aircraft";};

		sleep .1;

		_vel = velocity _aircraft;

		_dir = direction _aircraft;

		_speed = 2; comment "Added speed";

		_aircraft setVelocity [

		(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed),

		(_vel select 2)];
	};

	_crate = createVehicle ["C_IDAP_supplyCrate_F", getPosATL _aircraft - [0,0,-2]];
	_para = createVehicle ["B_Parachute_02_F", getPosATL _crate];
	_crate attachTo [_para,[0,0,0]]; 
	_smoke = createVehicle ["SmokeShellRed", getPosATL _crate];
	_smoke attachTo [_crate,[0,0,0]];
	pilot doMove [0,0,1000];

	waitUntil {getPosATL _crate select 2 < 10}; //Wait until package lands and then deploy blue smoke
	["Airdrop", "The package has landed! Hurry up before it is looted!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"];

	createMarker ["airdropLocationRANDOM", getPosATL _aircraft];
	"airdropLocationRANDOM" setMarkerShape "ELLIPSE";
	"airdropLocationRANDOM" setMarkerColor "ColorBlue";
	"airdropLocationRANDOM" setMarkerText "Airdrop Radius";
	"airdropLocationRANDOM" setMarkerSize [200, 200];

	deleteVehicle _smoke;
	_smoke = createVehicle ["SmokeShellBlue", getPosATL _crate];
	_smoke attachTo [_crate,[0,0,0]];

	uiSleep 10;
	deleteVehicle _aircraft;
	deleteVehicle pilot;
	missionNamespace setVariable ["Airdrop_Active", False, true];

	uiSleep 600;
	deleteVehicle _crate;
	
};

*/

/*
	Filename: fn_airdropRandom.sqf
	Author: StevioUK/Silence
	Date: 8/7/22
	Description: Creates an airdrop
*/

disableSerialization;

//Checks
if (_unit isEqualTo objNull) exitWith {diag_log "Airdrop: Aborted, no unit/not a unit"};
if (missionNamespace getVariable ["Airdrop_Active", false]) exitWith {["Error", "There is an ongoing airdrop mission right now!", "info", 5] call ["lost_hope_fnc_notificationHint"];};

//Variables
_maxRange = 10000; //Max range for airdrop
_minRange = 7000; //Min range for airdrop
missionNamespace setVariable ["Airdrop_Active", true, true];

private _randomPos = [nil, ["water"]] call BIS_fnc_randomPos; //Random position not in water
private _randomPosCrate = [nil, ["water"]] call BIS_fnc_randomPos; //Random position not in water

_aircraft = "C_Plane_Civil_01_racing_F" createVehicle _randomPos;
_aircraft setPosATL [getPosATL _aircraft select 0, getPosATL _aircraft select 1, (getPosATL _aircraft select 2) + 1500];
_flare = createVehicle ["lost_hope_ammo_flare_1", _randomPosCrate];
_flarePos = getPosATL _flare;
_grp = createGroup [civilian, true];
"B_RangeMaster_F" createUnit [getPosATL _aircraft,_grp,"pilot = this"];
pilot moveInDriver _aircraft;

//DO NOT CHANGE THESE OR I WILL ~BLEEP~
_aircraft allowDamage false;
_flare allowDamage false;
pilot allowDamage false;

//Hints
["Airdrop", "An airdrop has been spotted! Check your maps to find it!", "info", 5] remoteExec ["lost_hope_fnc_notificationHint"];

//Settings
pilot doMove (_randomPosCrate);
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
[_aircraft, _unit, _flare, _flarePos, _flareType, _boss, _randomPosCrate] spawn {
	params ["_aircraft", "_unit", "_flare", "_flarePos", "_flareType", "_boss", "_randomPosCrate"];
	while {true} do {
		meters = _aircraft distance2D _flarePos;
		"aircraft" setMarkerPos getPosATL _aircraft;

		sleep .1;

		if (meters <= 3000) then {
			pilot flyInHeight 200;
			_aircraft flyInHeight 200;
		};

		if (meters <= 100) exitWith {
			["Airdrop", "The package has been dropped! Hurry up and look for it!", "info", 5] remoteExec ["lost_hope_fnc_notificationHint"]; 
			[true, "lost_hope_task_airdrop", [format["We just picked up a radio signal at Map Grid %1, We heard a plane getting further away and a horrible scream. Take caution.", mapGridPosition _randomPosCrate], "Airdrop Radio Signal", _randomPosCrate], _randomPosCrate, "AUTOASSIGNED", 2, true, "", true] call BIS_fnc_taskCreate;
			uiSleep .75;
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
	_lootType = selectRandom ["lost_hope_airdrop_weapons", "lost_hope_airdrop_mixed"];

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
	["Airdrop", "The package has landed! Hurry before it gets looted!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"];

	[5, _crate] call lost_hope_fnc_canSpawnAirdrop;

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
	deleteVehicle _aircraft;
	deleteVehicle pilot;
	missionNamespace setVariable ["Airdrop_Active", false, true];

	uiSleep 600;
	deleteVehicle _crate;
};