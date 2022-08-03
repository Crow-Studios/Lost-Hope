/*
*	Author: Silence
*	Description: Sets task state
*
*	Arguments:
*	0: _taskID 		<STRING> - Task ID
*	1: _state 		<STRING> - "SUCCESSFUL", "CANCELED", more are available on wiki (BIS_fnc_taskSetState)
*/

params ["_taskID", "_state"];

[_taskID, _state, true] call BIS_fnc_taskSetState;