/*
  File: fn_moveInMe.sqf
  Author: StevioUK
  Description: Moves target into selected vehicle
   
*/

params ["_target"];

if (isNull objectParent player) exitWith {["DEBUG:", "You are not in a vehicle!", "info", 5 ] call lost_hope_fnc_notificationHint;};

_target moveInAny (vehicle player);