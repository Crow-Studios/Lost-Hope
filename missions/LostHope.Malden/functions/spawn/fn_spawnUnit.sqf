/*
*	Author: Silence
*	Description: Spawns unit
*
*	Arguments:
*	0: _classname 		<STRING> - Classname to spawn
*	1: _position 		<ARRAY> - [X,Y,Z]
*	3: _group		<STRING> - Refer loadout hpp files
*	4: _loadout		<STRING> - Refer loadout hpp files
*	5: _side 		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*	6: _isMelee		<BOOL> - true/false
*   
*   Examples:
*   ["C_man_polo_1_F", getPosATL player, "lost_hope_vanilla_police", "lost_hope_police_CBRN", EAST, false] call lost_hope_fnc_spawnUnit;
*   ["C_man_polo_1_F", getPosATL player, "lost_hope_vanilla_civilians", "lost_hope_melee", EAST, true] call lost_hope_fnc_spawnUnit;
*
*	Return Value: Unit
*/

params ["_classname", "_position", "_group", "_loadout", "_side", "_isMelee"];

private _path = "lost_hope_zombie_loadouts";
private _grp = createGroup [_side, true];

if (_isMelee) then {_classname = "B_soldier_Melee_RUSH_fists"};

_classname createUnit [_position, _grp, "unit = this"];

[unit, _path, _group, _loadout, 6] call lost_hope_fnc_setLoadout;

unit