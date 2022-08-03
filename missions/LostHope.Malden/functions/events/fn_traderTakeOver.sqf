params ["_trader", "_time"];

if (traderEvent isEqualTo grpNull) then {
    traderEvent = createGroup [EAST, true];
};

uiSleep _time;