/*
*	Author: Silence
*	Description: Spawns mutant
*
*	Arguments:
*	0: _classname 		<STRING> - Classname to spawn
*	1: _position 		<ARRAY> - [X,Y,Z]
*	2: _side 		<SIDE> - EAST, WEST, GUERILLA, CIVILIAN
*   
*   Example:
*   ["Zombie_Special_OPFOR_Boomer", getPosATL player, EAST] call lost_hope_fnc_spawnMutant;
*   Mutants: ["Zombie_Special_OPFOR_Boomer", "Zombie_Special_OPFOR_Screamer", "WBK_SpecialZombie_Smasher_3"];
*
*	Return Value: None
*/

params ["_classname", "_position", "_side"];

if (hivemindGroup isEqualTo grpNull) then {
    hivemindGroup = createGroup [_side, true];
};

// add another check here
_classname createUnit [_position, hivemindGroup, "mutant = this"];

mutant setVariable ["isZombie", true, true];
mutant setVariable ["canDelete", false, true];
mutant setVariable ["isMutant", true];

mutant addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    [_unit] spawn {
        params ["_unit"];
        uiSleep 10;
        hideBody _unit;
        uiSleep 5;
        deleteVehicle _unit;
    };
}];

mutant