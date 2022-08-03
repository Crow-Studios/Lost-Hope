/*
	File: fn_adminFreezeTarget.sqf
	Description: executes a freeze on the selected player
	Author: StevioUK
*/

params [
	["_target",objNull,[objNull]]
];

if (_target isEqualTo objNull) exitWith {};

[] remoteExecCall ["lost_hope_fnc_adminPlayerFreeze",_target];