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

private _sfxUnit = "dev_module_sfx_zombies";

if (_sound) then {
    [_sfxUnit, _position, "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie", _side, _name] call lost_hope_fnc_spawnZombie;
};

result = [];

for "_i" from 0 to (random [20, 30, 40]) do {

    private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie") call BIS_fnc_getCfgSubClasses );
    private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );

    private _pos = [_position, 50, 200, 3, 0, 20, 0] call BIS_fnc_findSafePos;
    private _nearestRoad = [_pos, 500] call BIS_fnc_nearestRoad;

    if ("triggerman" in _loadout) then {};
    [_classname, _pos, _group, _loadout, _side, _name] call lost_hope_fnc_spawnZombie;
    result append [_group, _loadout];

    if (_nearestRoad != objNull) then {unit setPosATL getPosATL _nearestRoad};

    uiSleep 0.2;

};

result