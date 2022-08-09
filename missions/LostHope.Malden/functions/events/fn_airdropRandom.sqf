/*
	Filename: fn_airdropRandom.sqf
	Author: StevioUK
	Date: 8/7/22
	Description: This file is responsible for creating an airdrop that at a random point on the map
*/

disableSerialization;

deleteMarker "airdropLocationRANDOM";

//Checks
if (missionNamespace getVariable ["Airdrop_Active", false]) exitWith { };

//Variables
_maxRange = 10000; //Max range for airdrop
_minRange = 6000; //Min range for airdrop
missionNamespace setVariable ["Airdrop_Active", True, true];

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


//TODO

//Add items in the package