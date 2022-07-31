params ["_trader", "_time", "_type"];

// Check if player is near, if player is abort script
{
    if (_x distance getMarkerPos _trader != 125) then {
        continueEvent = true;
    } else {
        continueEvent = false;
    };
} forEach allPlayers - (entities "HeadlessClient_F");

if (continueEvent) then {

    [true, "lost_hope_task_trader", [format["We just got a distress radio call from the trader at Map Grid %1, We heard screamers in the background. It sounded like there was a lot of them.", mapGridPosition getMarkerPos _trader], "Trader Distress Call", _trader], getMarkerPos _trader, "AUTOASSIGNED", 2, true, "", true] call BIS_fnc_taskCreate;

    continueEvent = nil;

    [5, _trader, _type] call lost_hope_fnc_canSpawnEvent;

};