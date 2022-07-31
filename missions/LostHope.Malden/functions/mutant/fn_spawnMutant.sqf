/*
*	Author: Silence
*	Description: Spawns zombie
*
*	Arguments:
*	0: _classname 		<STRING> - Classname to spawn
*	1: _position 		<ARRAY> - [X,Y,Z]
*	2: _side 		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*   
*   Example:
*   ["Zombie_Special_OPFOR_Boomer", getPosATL player, EAST] call lost_hope_fnc_spawnMutant;
*   Mutants: ["dev_asymhuman_stage2_o", "dev_toxmut_o", "dev_asymhuman_o"];
*
*	Return Value: None
*/

params ["_classname", "_position", "_side"];

if (hivemindGroup isEqualTo grpNull) then {
    hivemindGroup = createGroup [_side, true];
};

// add another check here
_classname createUnit [_position, hivemindGroup, "unit = this"];

unit setVariable ["isZombie", true];
unit setVariable ["canDelete", false];

for "_i" from 0 to 2 do { // Each mutant is accompanied by 3 normal zombie mutants
    private _type = "lost_hope_zombie_vanilla_scientists";
    private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type) call BIS_fnc_getCfgSubClasses );

    "dev_o_zombie_scientist2_i" createUnit [_position, hivemindGroup, "zombie = this"];
    zombie setVariable ["isZombie", true];
    zombie setVariable ["canDelete", false];
    [zombie, "lost_hope_loadouts_zombie", _type, _group, 1] call lost_hope_fnc_setLoadout;
};