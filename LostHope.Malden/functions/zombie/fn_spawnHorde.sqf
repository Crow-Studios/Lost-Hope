/*
*	Author: Silence
*	Description: Spawns zombie
*
*	Arguments:
*	0: _classname 		<STRING> - Classname to spawn
*	1: _position 		<ARRAY> - [X,Y,Z]
*	3: _side		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*   
*   Example:
*   ["C_man_polo_1_F", getPosATL player, EAST, true] call lost_hope_fnc_spawnHorde;
*
*	Return Value: None
*/

params ["_classname", "_position", "_side", "_sound"];

private _sfxUnit = "dev_module_sfx_zombies";

if (_sound) then {
    [_sfxUnit, _position, "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie", _side] call lost_hope_fnc_spawnZombie;
};

result = [];

for "_i" from 0 to (random [10, 15, 20]) do {
    private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie") call BIS_fnc_getCfgSubClasses );
    private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );
    private _pos = [_position, 2, 10, 3, 0, 20, 0] call BIS_fnc_findSafePos;
    if ("armed" in _loadout) then {};
    [_classname, _pos, _group, _loadout, _side, true] call lost_hope_fnc_spawnZombie;
    result append [_group, _loadout];
};

result