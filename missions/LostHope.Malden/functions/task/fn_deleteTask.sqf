/*
*	Author: Silence
*	Description: Deletes task
*
*	Arguments:
*	0: _taskID 		<STRING> - Task ID
*/

params ["_taskID"];

[_taskID, true, true] call BIS_fnc_deleteTask;