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
*	5: _name 		<STRING> - cfgLocations.hpp
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

if (sunOrMoon != 1) then {
    selectRandom ["Zombie_Special_OPFOR_Leaper_1", "Zombie_Special_OPFOR_Screamer"] createUnit [_position, zombieGroup, "zombie = this"];
    zombie setVariable ["isZombie", true];
    zombie setVariable ["isMutant", false];
    zombie setVariable ["canDelete", false, true];
    zombie setVariable ["zombieType", _name];
} else {

    switch (_name) do
    {
        case "military": {_type = selectRandom [3,4,5,6]};
        case "farm": {_type = selectRandom [2,3]};
        case "city": {_type = selectRandom [1,2,3]};
        case "village": {_type = selectRandom [1,2]};
        case "town": {_type = selectRandom [1,2,3]};
        case "science": {_type = selectRandom [4,5,6]};
    };

    _classname createUnit [_position, zombieGroup, "zombie = this"];

    /*
    zombie disableAI "AUTOTARGET";
    zombie disableAI "TARGET";
    zombie disableAI "FSM";

    zombie setSkill ["spotTime", 0.1];

    zombie setUnitCombatMode "BLUE";
    */

    zombie setVariable ["isZombie", true];
    zombie setVariable ["zombieType", _name];
    zombie setVariable ["canDelete", false, true];

    [zombie, _path, _group, _loadout, _type] call lost_hope_fnc_setLoadout;

    if (_classname == "dev_module_sfx_zombies") then {} else {
        [zombie, _type] spawn lost_hope_fnc_convertUnitToZombie;
    };
    
    zombie addEventHandler ["Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        [_unit] spawn {
            params ["_unit"];
            [_unit] join grpNull;
        };
    }];

};

zombie