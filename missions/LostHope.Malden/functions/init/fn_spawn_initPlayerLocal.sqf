player setVariable ["food", 100, true];
player setVariable ["water", 100, true];
player setVariable ["money", 500, true];
player setVariable ["bank", 5300, true];
player setVariable ["cash", 53250, true];

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

/*
diag_log "Starting the HUD loop";
_loop = [] spawn {
	while {True} do {
		//("HUD" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];	// remove the HUD
		call lost_hope_fnc_openHUD; //Recreate the hud
		uiSleep 0.1;
	};
};
diag_log "Successfully started the HUD loop";
*/ // Fix this piece of shit

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

[_unit, "lost_hope_loadouts", "lost_hope_vanilla_civilians", "lost_hope_unit", 7] call lost_hope_fnc_setLoadout;