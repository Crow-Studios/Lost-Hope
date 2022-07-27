// Calls on each players load in

private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

[_unit] call lost_hope_fnc_playerInit;

diag_log "Creating Layer HUD";
call lost_hope_fnc_openHUD;
diag_log "Successfully created the HUD";