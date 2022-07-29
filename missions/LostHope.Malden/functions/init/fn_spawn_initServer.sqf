private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- MISSION INIT - VITAL -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

{
    missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true,true];
    //_x setMarkerAlpha 0;
} forEach allMapMarkers;