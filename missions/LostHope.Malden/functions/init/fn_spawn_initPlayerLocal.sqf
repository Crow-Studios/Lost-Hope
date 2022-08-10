// Calls on each players load in
/*
*	Author: Silence
*	Description: Sets up player variables, etc
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run on
*	Return Value: None
*/

params ["_unit", "_localPlayerUID"];

_unit setVariable ["food", 100, true];
_unit setVariable ["water", 100, true];
_unit setVariable ["money", 500, true];
_unit setVariable ["bank", 5300, true];
_unit setVariable ["cash", 53250, true];

_unit setVariable ["lost_hope"+_localPlayerUID+"markerCheck", true];
_unit setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
_unit setVariable ["isZombie", false];

_script = [_localPlayerUID, _unit] spawn {
	diag_log "SPAWN INIT PLAYER: RUNNING WHILE LOOP FOR GETCLOSESTMARKER";
	params ["_localPlayerUID", "_unit"];
	while {_unit getVariable "lost_hope"+_localPlayerUID+"markerCheck"} do {
		if !(alive _unit) exitWith {diag_log "SPAWN INIT PLAYER: Unit has been killed, Aborting and Rerunning"};
		[_unit, 300] spawn lost_hope_fnc_getClosestMarker;
		uiSleep 2;
	};
};

//[30, _unit] call lost_hope_fnc_resetMarkerTime;

[5, _unit] call lost_hope_fnc_zombieCleanup;
[5, _unit] call lost_hope_fnc_loot_resetBuildings;
[] spawn lost_hope_fnc_modConflicts;

[_unit, "lost_hope_loadouts_zombie", "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie", 7] call lost_hope_fnc_setLoadout;