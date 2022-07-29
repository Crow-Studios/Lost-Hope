/*
*	Author: Silence
*	Description: Starts location init, called by fn_getClosestMarker
*
*	Arguments:
*	0: _distance 		<INTEGER> - 0-500 (not a hard limit)
*	1: _group 		<ARRAY> - Refer cfgZombieLoadouts.hpp
*	2: _position 		<ARRAY> - [X,Y,Z]
*	3: _side 		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*	4: _sound 		<BOOL> - True/false
*	5: _count 		<ARRAy> - [1,3,5]
*   
*   Example:
*   [500, ["lost_hope_zombie_vanilla_police", "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_vanilla_military"], getPosATL player, EAST, false, [1,3,5]] call lost_hope_fnc_markerSetup;
*
*	Return Value: None
*/

params ["_distance", "_group", "_position", "_side", "_sound", "_count", "_name"];

private _sfxUnit = "dev_module_sfx_zombies";

if (_sound) then {
    [_sfxUnit, _position, "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie", _side, _name] call lost_hope_fnc_spawnZombie;
};

if (random [0.1, 0.5, 1] >= 0.8) then {
    ["C_man_polo_1_F", _position, _side, true] call lost_hope_fnc_spawnHorde;
} else {

    for "_i" from 0 to (random _count) do {

        private _group = selectRandom _group;
        private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );

        private _pos = [_position, _distance / 4, _distance / 2, 3, 0, 20, 0] call BIS_fnc_findSafePos; // position, min dist, max dist, dist from buildings
        private _nearestRoad = [_pos, _distance / 2] call BIS_fnc_nearestRoad;

        //if ("triggerman" in _loadout) then {};
        ["C_man_polo_1_F", _pos, _group, _loadout, _side, _name] call lost_hope_fnc_spawnZombie;
    };

};