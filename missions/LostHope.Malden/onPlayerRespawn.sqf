// Calls on each players respawn


private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

_unit setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
