/*
*	Author: Silence
*	Description: Sets unit loadout
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit to run on
*	1: _type 		<STRING> - Refer loadout hpp files
*	2: _loadout		<STRING> - Refer loadout hpp files
*   
*   Example:
*   [player, "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_armed"] call lost_hope_fnc_setLoadout;
*
*	Return Value: Array
*/

params ["_unit", "_type", "_loadout"];

result = [_unit, _type, _loadout];

// Grab loadout stuff

private _primary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "primary") );
private _secondary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "secondary") );
private _uniform = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "uniform");
private _vest = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "vest");
private _backpack = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "backpack");
private _headgear = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "headgear");
private _facewear = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >>  _loadout >> "facewear");
private _nvg = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "nvg");
private _binoculars = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "binoculars");
private _map = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "map");
private _terminal = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "terminal");
private _navigation = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _loadout >> "navigation");
private _watch = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >>  _loadout >> "watch");
private _chance = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >>  _loadout >> "chance");

result append [[_primary, _secondary, _uniform, _vest, _backpack, _headgear, _facewear, _nvg, _binoculars, _map, _terminal, _navigation, _watch, _chance]];

// Clear loadout
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// Variables for further init
private _randomNumber = random [0.1, 0.5, 1];
private _allowedMagsPrimary = selectRandom ( [_primary] call BIS_fnc_compatibleMagazines );
private _allowedMagsSecondary = selectRandom ( [_secondary] call BIS_fnc_compatibleMagazines );

hint str _allowedMagsPrimary;

// Start loadout script

_unit addWeapon _primary;
_unit addWeapon _secondary;

_unit forceAddUniform selectRandom _uniform;
_unit addVest selectRandom _vest;

_unit addHeadgear selectRandom _headgear;
_unit addGoggles selectRandom _facewear;

for "_i" from 0 to (selectRandom [1,2]) do {_unit addMagazine _allowedMagsPrimary};
for "_i" from 1 to (selectRandom [1,2]) do {_unit addMagazine _allowedMagsSecondary};

if (_randomNumber <= _chance && _chance != 1) then {
    _unit addBackpack selectRandom _backpack;
    // Add items
    _unit addItem _nvg;
    _unit addItem _binoculars;
    _unit addItem _map;
    _unit addItem _terminal;
    _unit addItem _navigation;
    _unit addItem _watch;
    // Assign to correct slots
    _unit assignItem _nvg;
    _unit assignItem _binoculars;
    _unit assignItem _terminal;
    // Don't want items like maps going into actual slots, AI don't need them equipped
} else {
    // if chance is 1 in config, means unit wants guaranteed loot
    if (_chance == 1) then {
        _unit addItem _nvg;
        _unit addItem _binoculars;
        _unit addItem _map;
        _unit addItem _terminal;
        _unit addItem _navigation;
        _unit addItem _watch;
        // Assign to correct slots
        _unit assignItem _nvg;
        _unit assignItem _binoculars;
        _unit assignItem _terminal;
    };
};

result