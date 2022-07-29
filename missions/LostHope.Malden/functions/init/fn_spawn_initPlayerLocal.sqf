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
_unit setVariable ["isZombie", false];

zombieGroup = grpNull;

_script = [_localPlayerUID, _unit] spawn {
	params ["_localPlayerUID", "_unit"];
	while {_unit getVariable "lost_hope"+_localPlayerUID+"markerCheck"} do {
		[_unit, 300] spawn lost_hope_fnc_getClosestMarker;
		uiSleep 2;
	};
};

//[30, _unit] call lost_hope_fnc_resetMarkerTime;

[5, _unit] call lost_hope_fnc_zombieCleanup;
[5, _unit] call lost_hope_fnc_loot_resetBuildings;

[_unit, "lost_hope_loadouts", "lost_hope_vanilla_civilians", "lost_hope_unit", 7] call lost_hope_fnc_setLoadout;