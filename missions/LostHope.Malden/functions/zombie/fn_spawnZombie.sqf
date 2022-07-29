/*
*	Author: Silence
*	Description: Spawns zombie
*
*	Arguments:
*	0: _classname 		<STRING> - Classname to spawn
*	1: _position 		<ARRAY> - [X,Y,Z]
*	2: _group		<STRING> - Refer loadout hpp files
*	3: _loadout		<STRING> - Refer loadout hpp files
*	4: _side 		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*	5: _horde 		<BOOL> - true/false
*   
*   Example:
*   ["C_man_polo_1_F", getPosATL player, "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_armed", EAST, "Farm"] call lost_hope_fnc_spawnZombie;
*
*	Return Value: None
*/

params ["_classname", "_position", "_group", "_loadout", "_side", "_name"];

private _type = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >>  _loadout >> "type");
private _path = "lost_hope_zombie_loadouts";

// add another check here
if (zombieGroup isEqualTo grpNull) then {
    zombieGroup = createGroup [_side, true];
};

switch (_name) do
{
    case "military": {_type = selectRandom [1,2,3,4,5]};
    case "farm": {_type = selectRandom [2,3]};
    case "city": {_type = selectRandom [1,2]};
    case "village": {_type = selectRandom [1,2]};
    case "town": {_type = selectRandom [1,2,3]};
};

_classname createUnit [_position, zombieGroup, "unit = this"];

/*
unit disableAI "AUTOTARGET";
unit disableAI "TARGET";
unit disableAI "FSM";

unit setSkill ["spotTime", 0.1];

unit setUnitCombatMode "BLUE";
*/

unit setVariable ["isZombie", true];
unit setVariable ["canRefresh", true];
unit setVariable ["canDelete", false];

[unit, _path, _group, _loadout, _type] call lost_hope_fnc_setLoadout;

if (_classname == "dev_module_sfx_zombies") then {} else {
    [unit, _type] spawn lost_hope_fnc_convertUnitToZombie;
};