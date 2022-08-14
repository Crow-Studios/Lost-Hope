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
*	5: _count 		<ARRAY> - [1,3,5]
*	6: _name 		<STRING> - Refer loadout hpp files
*   
*   Example:
*   [500, ["lost_hope_zombie_vanilla_police", "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_vanilla_military"], getPosATL player, EAST, false, "Military"] call lost_hope_fnc_markerSetup;
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
    private _amount = round (random _count);
    hint str (_amount + 1);
    if (sunOrMoon != 1) then {_amount = _amount / 2};
    for "_i" from 0 to (_amount) do {

        private _group = selectRandom _group;
        private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );

        private _pos = [_position, 50, 80, 3, 0, 20, 0] call BIS_fnc_findSafePos; // position, min dist, max dist, dist from buildings
        private _nearestRoad = [_pos, _distance / 2] call BIS_fnc_nearestRoad;

        //if ("triggerman" in _loadout) then {};
        private _zombie = ["C_man_polo_1_F", _pos, _group, _loadout, _side, _name] call lost_hope_fnc_spawnZombie;

        if (_nearestRoad != objNull) then {_zombie setPosATL getPosATL _nearestRoad};
        uiSleep .2;
    };

};