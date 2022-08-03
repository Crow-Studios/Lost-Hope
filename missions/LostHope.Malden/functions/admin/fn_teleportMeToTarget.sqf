/*
  File: fn_teleportMeToTarget.sqf
  Author: StevioUK
  Description: Teleports player (admin) to target
   
*/

params ["_target"];

if !(isNull objectParent player) exitWith {["DEBUG:", "You cannot teleport to this player as you are currently inside a vehicle", "info", 5 ] call lost_hope_fnc_notificationHint;};

player setPosATL (_target modelToWorld [0,1,0]);