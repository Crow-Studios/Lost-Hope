/*
  File: fn_teleportTargetToMe.sqf
  Author: StevioUK
  Description: Teleports target to player (admin)
   
*/

params ["_target"];

//Checks
if (isNil "_target" || isNull _target) exitWith {["DEBUG:", "That player does not exist", "info", 5 ] call lost_hope_fnc_notificationHint;};
if (!(vehicle _target isEqualTo _target)) exitWith {["DEBUG:", "Player is inside of a vehicle", "info", 5 ] call lost_hope_fnc_notificationHint;};

_target setPosATL (getPosATL player);