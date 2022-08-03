/*
  File: fn_endMission.sqf
  Author: StevioUK
  Description: RemoteExecuted on target, sends target back to slot selection menu
   
*/
private _result = ["Are you sure?", "Confirm", true, true] call BIS_fnc_guiMessage;

if (_result) then {
	(findDisplay 46) closeDisplay 0;
} else {
  ["DEBUG:", "Dont fucking bother me then!", "info", 5 ] call lost_hope_fnc_notificationHint;
};