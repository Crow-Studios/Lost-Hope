// Calls on each players respawn


private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

_unit setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
_unit setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
_unit setVariable ["isZombie", false];

[_unit, "lost_hope_loadouts", "lost_hope_vanilla_civilians", "lost_hope_unit", 7] call lost_hope_fnc_setLoadout;
_unit setPos (stronghold_respawn modelToWorld [0,0,0]);

_script = [_localPlayerUID, _unit] spawn {
	diag_log "PLAYER RESPAWN: RUNNING WHILE LOOP FOR GETCLOSESTMARKER";
	params ["_localPlayerUID", "_unit"];
	while {_unit getVariable "lost_hope"+_localPlayerUID+"markerCheck"} do {
		if !(alive _unit) exitWith {diag_log "PLAYER RESPAWN: Unit has been killed, Aborting and Rerunning"};
		[_unit, 300] spawn lost_hope_fnc_getClosestMarker;
		uiSleep 2;
	};
};

[5, _unit] call lost_hope_fnc_zombieCleanup;
[5, _unit] call lost_hope_fnc_loot_resetBuildings;