params ["_unit", "_joinGroup"];

waitUntil {count units _joinGroup <= 5};

["lost_hope_task_trader", "SUCCEEDED"] call lost_hope_fnc_setTaskState;
uiSleep 1;
["lost_hope_task_trader"] call lost_hope_fnc_deleteTask;

[_unit, false, nil, false] call lost_hope_fnc_airdropPlayer;