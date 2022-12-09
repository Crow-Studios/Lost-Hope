private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- MISSION INIT - VITAL -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- \\

{
    missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true,true];
    if ( !("misc" in _x) && !("island" in _x) && !("safezone" in _x) && !("trader" in _x) ) then {
        _x setMarkerAlpha 0;
    };
} forEach allMapMarkers;

private _eventScript = [] spawn {
    while {true} do {
        uiSleep 1200;

        if (selectRandom [1] isEqualTo 1) then {
            private _event = selectRandom ["traderInfested"];
            switch (_event) do
            {
                case "traderInfested": { [ (selectRandom ["trader_1", "trader_2", "trader_3"]), 600, selectRandom ["military", "farm", "city"] ] spawn lost_hope_fnc_traderInfested };
                //case "traderTakeOver": { [ (selectRandom ["trader_1", "trader_2"]), 600 ] spawn lost_hope_fnc_traderTakeOver };
            };
        };
    };
};

[600] spawn lost_hope_fnc_bodyCleanup;
[5] spawn lost_hope_fnc_loot_resetBuildings;
["lost_hope_ambience_church", 5] spawn lost_hope_fnc_nightTransition;