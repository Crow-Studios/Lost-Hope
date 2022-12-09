params ["_time", "_object"];

private _startEventScript = [_time, _object] spawn {
    params ["_time", "_object"];
    while {true} do {
        uiSleep _time;

        // Check if can start event after X time
        {
            if (_x distance _object <= 300) then {
                startAirdrop = true;
            } else {
                startAirdrop = false;
            };
        } forEach allPlayers - (entities "HeadlessClient_F");

        if (startAirdrop) exitWith {
            // Spawn zombie horde to airdrop

            private _pos = [getPosATL _object, 20, 30, 3, 0, 20, 0] call BIS_fnc_findSafePos; // position, min dist, max dist, dist from buildings

            private _mutant = ["WBK_SpecialZombie_Smasher_3", _pos, EAST] call lost_hope_fnc_spawnMutant;
            
            zombieAirdrop = grpNull;
            for "_i" from 0 to 19 do {

                private _group = ["lost_hope_zombie_vanilla_police", "lost_hope_zombie_vanilla_science", "lost_hope_zombie_vanilla_military"];
                private _group = selectRandom _group;
                private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );

                private _pos = [getPosATL _object, 10, 20, 3, 0, 20, 0] call BIS_fnc_findSafePos; // position, min dist, max dist, dist from buildings

                if (zombieAirdrop isEqualTo grpNull) then {
                    zombieAirdrop = createGroup [EAST, true];
                };

                //if ("triggerman" in _loadout) then {};
                private _joinGroup = [EAST, true] call lost_hope_fnc_createGroup;
                private _zombie = ["C_man_polo_1_F", _pos, _group, _loadout, EAST, "military", _joinGroup] call lost_hope_fnc_spawnZombie;
                [_zombie] join zombieAirdrop;

                uiSleep .2;
            };

            private _amount = 10;

            if (selectRandom [1,2,3] isEqualTo 1) then {
                groupSide = grpNull;
                for "_i" from 0 to (_amount - 1) do {

                    private _group = "lost_hope_zombie_vanilla_military";
                    private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );
                    
                    private _pos = [getPosATL _object, 100, 300, 3, 0, 20, 0] call BIS_fnc_findSafePos;
                    private _unit = ["C_man_polo_1_F", _pos, _group, _loadout, INDEPENDENT, false] call lost_hope_fnc_spawnUnit;

                    if (groupSide isEqualTo grpNull) then {
                        groupSide = createGroup [INDEPENDENT, true];
                    };

                    if !(groupSide isEqualTo grpNull) then {
                        [_unit] join groupSide;
                    };

                    _unit doMove (position _object);

                    uiSleep 0.2;

                };
            };
        };
    };
};