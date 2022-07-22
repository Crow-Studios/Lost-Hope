/*
*	Author: Silence
*	Description: Spawns zombie
*
*	Arguments:
*	0: _classname 		<STRING> - Classname to spawn
*	1: _position 		<ARRAY> - [X,Y,Z]
*	3: _group		<STRING> - Refer loadout hpp files
*	4: _loadout		<STRING> - Refer loadout hpp files
*	5: _side 		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*   
*   Example:
*   ["C_man_polo_1_F", getPosATL player, "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_armed", EAST, false] call lost_hope_fnc_spawnZombie;
*
*	Return Value: None
*/

params ["_classname", "_position", "_group", "_loadout", "_side", "_horde"];

private _type = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >>  _loadout >> "type");

if (_type == 6 && _horde) then
{
    _type = selectRandom [1,2,3,4,5];
};

private _grp = createGroup [_side, true];

_classname createUnit [_position, _grp, "unit = this"];

unit setVariable ["isZombie", true];

[unit, _group, _loadout] call lost_hope_fnc_setLoadout;

if (_classname == "dev_module_sfx_zombies") then {} else {
    [unit, _type] call lost_hope_fnc_convertUnitToZombie;
};