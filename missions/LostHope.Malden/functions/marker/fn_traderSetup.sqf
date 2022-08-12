params ["_marker", "_traderType"];

diag_log "Running Trader Setup";

{
    diag_log [_x, (_x inArea _marker)];
    if (_x inArea _marker) then {
        private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _traderType) call BIS_fnc_getCfgSubClasses );
        private _armed = getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _traderType >> _loadout >> "armed");
        if (_armed isEqualTo 1) then {
            private _unit = ["C_man_polo_2_F", getPosATL _x, _traderType, _loadout, WEST, false] call lost_hope_fnc_spawnUnit;
            _unit setPosATL getPosATL _x;
            _unit setDir (getDir _x);
            _unit disableAI "PATH";
            _unit allowDamage false;
            diag_log format ["A trader sentry has been placed at %1", getPosATL _x];
        };
    };
} forEach allMissionObjects "Sign_Arrow_Pink_F";