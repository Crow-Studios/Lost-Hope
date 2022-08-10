/*
*	Author: Silence
*	Description: Sets unit loadout
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit to run on
*	0: _path 		<STRING> - Refer loadout hpp files
*	1: _group 		<STRING> - Refer loadout hpp files
*	2: _loadout		<STRING> - Refer loadout hpp files
*	3: _type		<INTEGER> - 1-6
*   
*   Example:
*   [player, "lost_hope_loadouts_zombie", "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_armed", 6] call lost_hope_fnc_setLoadout;
*
*	Return Value: Array
*/

params ["_unit", "_path", "_group", "_loadout", "_type"];

// Grab loadout stuff

if (_type == 7) then {

    private _uniform = getArray (missionConfigFile >> _path >> _group >> _loadout >> "uniform");
    private _vest = getArray (missionConfigFile >> _path >> _group >> _loadout >> "vest");
    private _backpack = getArray (missionConfigFile >> _path >> _group >> _loadout >> "backpack");
    private _headgear = getArray (missionConfigFile >> _path >> _group >> _loadout >> "headgear");
    private _facewear = getArray (missionConfigFile >> _path >> _group >>  _loadout >> "facewear");
    private _nvg = getText (missionConfigFile >> _path >> _group >> _loadout >> "nvg");
    private _binoculars = getText (missionConfigFile >> _path >> _group >> _loadout >> "binoculars");
    private _map = getText (missionConfigFile >> _path >> _group >> _loadout >> "map");
    private _terminal = getText (missionConfigFile >> _path >> _group >> _loadout >> "terminal");
    private _navigation = getText (missionConfigFile >> _path >> _group >> _loadout >> "navigation");
    private _watch = getText (missionConfigFile >> _path >> _group >>  _loadout >> "watch");
    private _chance = getNumber (missionConfigFile >> _path >> _group >>  _loadout >> "chance");

    // Clear loadout
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    _unit forceAddUniform selectRandom _uniform;
    _unit addVest selectRandom _vest;

    _unit addHeadgear selectRandom _headgear;
    _unit addGoggles selectRandom _facewear;

    _unit addItem _map;

} else { 

    private _primary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "primary") );
    private _secondary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "secondary") );

    private _uniform = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "uniform");
    private _vest = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "vest");
    private _backpack = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "backpack");
    private _headgear = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "headgear");
    private _facewear = getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >>  _loadout >> "facewear");
    private _nvg = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "nvg");
    private _binoculars = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "binoculars");
    private _map = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "map");
    private _terminal = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "terminal");
    private _navigation = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "navigation");
    private _watch = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >>  _loadout >> "watch");
    private _chance = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >>  _loadout >> "chance");
    private _armed = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >> _loadout >> "armed");
    //private _type = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group >>  _loadout >> "type");

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

    // Start loadout script

    _unit forceAddUniform selectRandom _uniform;
    _unit addVest selectRandom _vest;

    _unit addHeadgear selectRandom _headgear;
    _unit addGoggles selectRandom _facewear;

    if (_armed isEqualTo 1 && _type isEqualTo 6) then {

        private _allowedMagsPrimary = selectRandom ( [_primary] call BIS_fnc_compatibleMagazines );
        private _allowedMagsSecondary = selectRandom ( [_secondary] call BIS_fnc_compatibleMagazines );

        _unit addMagazines [_allowedMagsPrimary, (selectRandom [2,3])];
        _unit addMagazines [_allowedMagsSecondary, (selectRandom [2,3])];
    
        _unit addWeapon _primary;
        _unit addWeapon _secondary;
    };

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

};