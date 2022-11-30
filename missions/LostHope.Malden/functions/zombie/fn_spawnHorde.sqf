/*
*	Author: Silence
*	Description: Spawns zombie horde
*
*	Arguments:
*	0: _classname 		<STRING> - Classname to spawn
*	1: _position 		<ARRAY> - [X,Y,Z]
*	3: _side		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*	3: _sound		<BOOL> - True/false
*   
*   Example:
*   ["C_man_polo_1_F", getPosATL player, EAST, true] spawn lost_hope_fnc_spawnHorde;
*
*	Return Value: None
*/

params ["_classname", "_position", "_side", "_sound"];

private _joinGroup = [EAST, true] call lost_hope_fnc_createGroup;

for "_i" from 0 to (random [20, 30, 40]) do {

    private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie") call BIS_fnc_getCfgSubClasses );
    private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );

    private _pos = [_position, 50, 200, 3, 0, 20, 0] call BIS_fnc_findSafePos;
    private _nearestRoad = [_pos, 500] call BIS_fnc_nearestRoad;

    if ("triggerman" in _loadout) exitWith {};
    private _zombie = [_classname, _pos, _group, _loadout, _side, _name, _joinGroup] call lost_hope_fnc_spawnZombie;

    if (_nearestRoad != objNull) then {_zombie setPosATL getPosATL _nearestRoad};

    uiSleep 0.2;

};