params ["_time", "_trader", "_joinGroup"];

private _cancelEventScript = [_time, _trader, _joinGroup] spawn {
    params ["_time", "_trader", "_joinGroup"];

    uiSleep _time;

    // Check if can cancel event after X time
    {
        if (_x distance getMarkerPos _trader >= 200) then {
            cancelEvent = true;
        } else {
            cancelEvent = false;
        };
    } forEach allPlayers - (entities "HeadlessClient_F");

    if (cancelEvent) then {
        ["lost_hope_task_trader", "CANCELED"] call lost_hope_fnc_setTaskState;
        uiSleep 1;
        ["lost_hope_task_trader"] call lost_hope_fnc_deleteTask;
        {
            deleteVehicle _x;
        } forEach units _joinGroup;
    };
};