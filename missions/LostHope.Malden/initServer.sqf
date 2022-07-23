private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- MISSION INIT - VITAL -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

zombieGroup = grpNull;
herdGroup = grpNull;

{
    missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true];
    //_x setMarkerAlpha 0;
} forEach allMapMarkers;

[30, _unit] call lost_hope_fnc_resetMarkerTime;

[5, _unit] call lost_hope_fnc_zombieCleanup;