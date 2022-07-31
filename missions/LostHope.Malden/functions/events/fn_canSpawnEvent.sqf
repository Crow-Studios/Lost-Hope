params ["_time", "_trader", "_type"];

_startEventScript = [_time, _trader, _type] spawn {
    params ["_time", "_trader", "_type"];
    while {true} do {
      uiSleep _time;
      hint "Running While Loop";

        // Check if can start event after X time
        {
            if (_x distance getMarkerPos _trader <= 200) then {
                startEvent = true;
            } else {
                startEvent = false;
            };
        } forEach allPlayers - (entities "HeadlessClient_F");

        if (startEvent) exitWith {
            if (traderEvent isEqualTo grpNull) then {
                traderEvent = createGroup [EAST, true];
            };
            for "_i" from 0 to (random [25, 35, 45]) do {

                private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie") call BIS_fnc_getCfgSubClasses );
                private _loadout = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _group) call BIS_fnc_getCfgSubClasses );

                private _pos = [getMarkerPos _trader, 10, 30, 3, 0, 20, 0] call BIS_fnc_findSafePos;

                ["C_man_polo_1_F", _pos, _group, _loadout, EAST, _type] call lost_hope_fnc_spawnZombie;

                unit setPos _pos;

                [unit] join traderEvent;

                unit setVariable ["isZombie", true];
                unit setVariable ["canDelete", false];

                uiSleep 0.2;

            };
            for "_i" from 0 to 3 do
            {
                private _pos = [getMarkerPos _trader, 20, 60, 3, 0, 20, 0] call BIS_fnc_findSafePos; // position, min dist, max dist, dist from buildings
                private _nearestRoad = [_pos, 100] call BIS_fnc_nearestRoad;

                ["C_man_polo_2_F", _pos, "lost_hope_zombie_vanilla_military", "lost_hope_zombie_military_private_triggerman", WEST, false] call lost_hope_fnc_spawnUnit;

                if (_nearestRoad != objNull) then {unit setPosATL getPosATL _nearestRoad};

                unit doMove getMarkerPos _trader;
            };
            waitUntil {count units traderEvent >= 10};
            [] spawn lost_hope_fnc_hasEventFinished;
            [_time, _trader] call lost_hope_fnc_canCancelEvent;
        };
    };
};