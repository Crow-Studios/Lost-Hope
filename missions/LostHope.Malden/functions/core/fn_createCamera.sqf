/*
*	Author: Silence
*	Description: Creates camera from given position + 10m up, and sets target
*
*	Arguments:
*	0: _object 		<OBJECT> - Camera position
*	1: _target 		<OBJECT> - Camera target
*
*   Example:
*   [FerryEnd, ferry_boat_end] call lost_hope_fnc_createCamera;
*
*	Return Value: None
*/

// Kinda broken, sometimes camera just cuts out for NO GOOD FUCKIN REASON!

params ["_object", "_target", "_text"];

private _pos = getPosATL _object;

private _cam = "camera" camCreate [(_pos select 0) - 10, (_pos select 1) + 10, (_pos select 2) + 10];

_cam cameraEffect ["EXTERNAL", "BACK"];

_cam camSetFocus [50, 1];

_cam camSetTarget _target;

_cam camCommit 0;

titleText [_text, "BLACK OUT", 15];

_exit = [_cam] spawn {params ["_cam"]; uiSleep 16; camDestroy _cam; _cam cameraEffect ["TERMINATE", "BACK"]};