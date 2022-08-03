/*
*	Author: Silence
*	Description: Spawns zombie herd
*
*	Arguments:
*	0: _position 		<STRING> - Classname to spawn
*	1: _radius 		<ARRAY> - [X,Y,Z]
*   
*   Example:
*   [getPosATL player, 1000] spawn lost_hope_fnc_spawnHerd;
*
*	Return Value: None
*/

// Ignore this, was a test, didn't work


/*
params ["_position", "_radius"];

private _sfxUnit = "dev_module_sfx_zombies";

_markerHerd = [_position] spawn {
    params ["_position"];
    createMarker ["herdMove", _position, 1];
    "herdMove" setMarkerText "Herd Movement";
    "herdMove" setMarkerType "mil_objective";
    "herdMove" setMarkerColor "ColorRed";
    "herdMove" setMarkerSize [1, 1];
    missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
    while {count units herdGroup <= 15} do {
        "herdMove" setMarkerPos getPos leader herdGroup;
    };
};
*/