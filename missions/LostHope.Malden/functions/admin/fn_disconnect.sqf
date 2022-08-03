/*
  File: fn_disconnect.sqf
  Author: StevioUK
  Description: Disconnects player/target to slot menu
*/

params [
  ["_target",objNull,[objNull]]
];

if (isNull _target) then {_target = player};

[] remoteExecCall ["lost_hope_fnc_endMission",_target];

