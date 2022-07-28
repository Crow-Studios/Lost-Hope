player setVariable ["food", 100, true];
player setVariable ["water", 100, true];
player setVariable ["money", 500, true];
player setVariable ["bank", 5300, true];
player setVariable ["cash", 53250, true];

// Calls on each players load in

private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

[_unit] call lost_hope_fnc_playerInit;

diag_log "Starting the HUD loop";
_loop = [] spawn {
	while {True} do {
		//("HUD" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];	// remove the HUD
		execVM "openHUD.sqf"; //Recreate the hud
		uiSleep 0.1;
	};
};
diag_log "Successfully started the HUD loop";