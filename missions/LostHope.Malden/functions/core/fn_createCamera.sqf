/*
*	Author: Silence
*	Description: Creates camera from given position + 10m up, and sets target
*
*	Arguments:
*	0: _object 		<OBJECT> - Camera position
*	1: _target 		<OBJECT> - Camera target
*
*   Example:
*   [FerryEnd, ferry_boat_end, 15] call lost_hope_fnc_createCamera;
*
*	Return Value: None
*/

// Kinda broken, sometimes camera just cuts out for NO GOOD FUCKIN REASON!

params ["_object", "_target", "_time", "_animated", "_height"];

private _pos = getPosATL _object;
private _posTarget = getPosATL _target;

private _cam = "camera" camCreate [(_pos select 0) - 10, (_pos select 1), (_pos select 2) + _height];

_cam cameraEffect ["EXTERNAL", "BACK"];

_cam camSetFocus [50, 1];

_cam camSetTarget _target;

if (_animated) then {
    _cam camSetPos [(_posTarget select 0), (_posTarget select 1) + 20, (_posTarget select 2) + _height / 2];
};

_cam camCommit _time;

_exit = [_cam, _time] spawn {params ["_cam", "_time"]; uiSleep (_time + 1); camDestroy _cam; _cam cameraEffect ["TERMINATE", "BACK"]};