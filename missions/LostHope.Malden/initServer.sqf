private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- MISSION INIT - VITAL -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

zombieGroup = grpNull;
herdGroup = grpNull;

[30, _unit] call lost_hope_fnc_resetMarkerTime;

[5, _unit] call lost_hope_fnc_zombieCleanup;