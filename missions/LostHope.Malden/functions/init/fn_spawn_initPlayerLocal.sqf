/*
*	Author: Silence
*	Description: Sets up player variables, etc
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run on
*	Return Value: None
*/

params ["_unit", "_localPlayerUID"];

_unit setVariable ["lost_hope"+_localPlayerUID+"markerCheck", true];
_unit setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
_unit setVariable ["lost_hope"+_localPlayerUID+"playerMoney", 500000];

_unit setVariable ["isZombie", false];
zombieGroup = grpNull;
herdGroup = grpNull;

_script = [_localPlayerUID, _unit] spawn {
	params ["_localPlayerUID", "_unit"];
	while {_unit getVariable "lost_hope"+_localPlayerUID+"markerCheck"} do {
		[_unit, 300] spawn lost_hope_fnc_getClosestMarker;
		uiSleep 5;
	};
};

{
    missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true];
    //_x setMarkerAlpha 0;
} forEach allMapMarkers;

[30, _unit] call lost_hope_fnc_resetMarkerTime;

[5, _unit] call lost_hope_fnc_zombieCleanup;

// player addAction ["money", {
// 	private _unit = player;

// 	private _localPlayerUID = getPlayerUID _unit;
	
// 	_ree = _unit getVariable ("lost_hope"+_localPlayerUID+"playerMoney");
// 	diag_log _ree;
// }];