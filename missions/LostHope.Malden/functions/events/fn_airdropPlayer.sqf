/*
	Filename: fn_airdropPlayer.sqf
	Author: StevioUK
	Date: 8/7/22
	Description: This file is responsible for creating an airdrop that drops within 100 meters of the player
*/


disableSerialization;

deleteMarker "airdropLocation";

//Checks
if (missionNamespace getVariable ["Airdrop_Active", false]) exitWith {["Error", "There is an ongoing airdrop mission right now!", "info", 5 ] call ["lost_hope_fnc_notificationHint"];};

// UI Creation
("Airdrop" call BIS_fnc_rscLayer) cutRsc ["Airdrop_UI", "PLAIN"]; //Open UI
private _display = uiNamespace getVariable "Airdrop"; //Get the controls
_airdropDistance_text = _display displayCtrl 3000; //Distance text
_airdrop_picture = _display displayCtrl 3200; //Distance text


//Variables
_maxRange = 15000; //Max range for airdrop
_minRange = 12000; //Min range for airdrop
missionNamespace setVariable ["Airdrop_Active", True, true];

private _randomPos = [[[getPosATL player, _maxRange]], [ "water", [getPosATL player, _minRange]]] call BIS_fnc_randomPos; //Random position not in water within range of player

_aircraft = "C_Plane_Civil_01_racing_F" createVehicle _randomPos;
_aircraft setPosATL [getPosATL _aircraft select 0, getPosATL _aircraft select 1, (getPosATL _aircraft select 2) + 2250];
_grp = createGroup civilian;
"B_RangeMaster_F" createUnit [getPosATL _aircraft, _grp,"pilot = this"];
pilot moveInDriver _aircraft;

//DO NOT CHANGE THESE OR I WILL MOLEST YOUR CAT!
_aircraft allowDamage false;
pilot allowDamage false;


//Hints
["Airdrop", "An airdrop has been called in by a player! Check your maps to find it!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"];
_airdrop_picture ctrlSetText "UI\pictures\Airdrop\incoming.paa";

//Settings
pilot doMove (getPosATL player);
pilot flyInHeight 1750;
_aircraft flyInHeight 1750;

_markerstr = createMarker ["aircraft", getPosATL _aircraft];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType "Contact_pencilCircle2";
_markerstr setMarkerColor "ColorRed";
_markerstr setMarkerText "Airdrop Plane";
//_markerstr setMarkerSize [50, 50];

//Main Method
[_aircraft, _airdropDistance_text, _airdrop_picture] spawn {
	params ["_aircraft", "_text", "_airdrop_picture"];
	while {true} do {
		meters = _aircraft distance2D player;
		"aircraft" setMarkerPos getPosATL _aircraft;
		_text ctrlSetStructuredText parseText format ["The pilot is <t color='#ff0000'>%1</t> meters away from you.", round(meters)];

		sleep .1;

		if(meters < 100) exitWith { _text ctrlSetStructuredText parseText format ["The package has been dropped!"]; ["Airdrop", "The package has been dropped! Hurry up and look for it!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"]; uiSleep .75; _airdrop_picture ctrlSetText "UI\pictures\Airdrop\airdrop.paa";};

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
	_airdrop_picture ctrlSetText "UI\pictures\Airdrop\landed.paa";
	_text ctrlSetStructuredText parseText format ["The package has landed!"];
	["Airdrop", "The package has landed! Hurry before it gets looted!", "info", 5 ] remoteExec ["lost_hope_fnc_notificationHint"];

	createMarker ["airdropLocation", getPosATL _aircraft];
	"airdropLocation" setMarkerShape "ELLIPSE";
	"airdropLocation" setMarkerColor "ColorBlue";
	"airdropLocation" setMarkerText "Airdrop Radius";
	"airdropLocation" setMarkerSize [200, 200];

	deleteVehicle _smoke;
	_smoke = createVehicle ["SmokeShellBlue", getPosATL _crate];
	_smoke attachTo [_crate,[0,0,0]];

	uiSleep 10;
	("Airdrop" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
	deleteVehicle _aircraft;
	deleteVehicle pilot;
	missionNamespace setVariable ["Airdrop_Active", False, true];

	uiSleep 600;
	deleteVehicle _crate;
};


//TODO

//Add items in the package