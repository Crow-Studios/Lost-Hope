params ["_unit", "_radius", "_group", "_side", "_name"];

private _zombieAmount = 2;
private _time = 600; // 10 minutes/600 seconds

if ( ( _unit getVariable ["lost_hope_continueAmbientZombieScript", false] ) && ( _unit getVariable ["lost_hope_spawnAmbientZombie", false] ) && !(_unit inArea "safezone_1") ) then {
    // Make sure it doesn't spawn an extra zombie, 1 extra zombie per player quickly adds up with a lot of players
    private _joinGroup = [EAST, true] call lost_hope_fnc_createGroup;
    for "_i" from 0 to (_zombieAmount - 1) do {
        private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );
        private _pos = [getPosATL _unit, _radius / 3, _radius / 2, 1, 0, 20, 0] call BIS_fnc_findSafePos;
        private _zombie = ["C_man_polo_1_F", _pos, _group, _loadout, EAST, "Military", _joinGroup] call lost_hope_fnc_spawnZombie;
        doStop _zombie;
        _zombie doMove (getPosATL _unit);
    };
    _unit setVariable ["lost_hope_spawnAmbientZombie", false];
    uiSleep (_time - 1);
    _unit setVariable ["lost_hope_spawnAmbientZombie", true];
};