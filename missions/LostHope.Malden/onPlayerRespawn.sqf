// Calls on each players respawn

UNIT setVariable ["lost_hope"+STEAMID+"continueMarkerScript", true];
UNIT setVariable ["lost_hope"+STEAMID+"continueMarkerScript", true];
UNIT setVariable ["isZombie", false];

[UNIT, "lost_hope_loadouts", "lost_hope_vanilla_civilians", "lost_hope_unit", 7] call lost_hope_fnc_setLoadout;
UNIT setPos (stronghold_respawn modelToWorld [0,0,0]);

_script = [STEAMID, UNIT] spawn {
	diag_log "PLAYER RESPAWN: RUNNING WHILE LOOP FOR GETCLOSESTMARKER";
	params ["STEAMID", "UNIT"];
	while {UNIT getVariable "lost_hope"+STEAMID+"markerCheck"} do {
		if !(alive UNIT) exitWith {diag_log "PLAYER RESPAWN: Unit has been killed, Aborting and Rerunning"};
		[UNIT, 300] spawn lost_hope_fnc_getClosestMarker;
		uiSleep 2;
	};
};

[5, UNIT] call lost_hope_fnc_zombieCleanup;
[5, UNIT] call lost_hope_fnc_loot_resetBuildings;