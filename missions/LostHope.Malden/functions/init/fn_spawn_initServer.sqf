private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- MISSION INIT - VITAL -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

{
    missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true,true];
    //_x setMarkerAlpha 0;
} forEach allMapMarkers;

zombieGroup = grpNull;
hivemindGroup = grpNull;
traderEvent = grpNull;

publicVariable "zombieGroup";
publicVariable "hivemindGroup";
publicVariable "traderEvent";

/*
private _eventScript = [] spawn {
    while {true} do {
        uiSleep 10;

        if (selectRandom [1,2] isEqualTo 2) then {
            private _event = selectRandom ["traderInfested", "traderTakeOver"];
            switch (_event) do 
            {
                case "traderInfested": { [ (selectRandom ["trader_1", "trader_2"]), 600, selectRandom ["military", "farm", "city"] ] spawn lost_hope_fnc_traderInfested };
                case "traderTakeOver": { [ (selectRandom ["trader_1", "trader_2"]), 600 ] spawn lost_hope_fnc_traderTakeOver };
            }
        };
    };
};