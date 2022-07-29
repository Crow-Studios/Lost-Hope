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
*   Mutants: ["dev_asymhuman_stage2_o", "dev_toxmut_o", "dev_asymhuman_o", "Zombie_Special_OPFOR_Boomer", "Zombie_Special_OPFOR_Screamer", "Zombie_Special_OPFOR_Leaper_2"];
*
*	Return Value: None
*/

params ["_classname", "_position", "_side"];

// add another check here
if (zombieGroup isEqualTo grpNull) then {
    zombieGroup = createGroup [_side, true];
};

_classname createUnit [_position, zombieGroup, "unit = this"];

[unit] join grpNull;

unit setVariable ["isZombie", true];
unit setVariable ["canDelete", false];