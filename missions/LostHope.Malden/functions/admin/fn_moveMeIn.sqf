/*
  File: fn_moveMeIn.sqf
  Author: StevioUK
  Description: Moves target into selected vehicle
   
*/

params ["_target"];

if (isNull objectParent _target) exitWith {["DEBUG:", "This player is not in a vehicle!", "info", 5 ] call lost_hope_fnc_notificationHint;};

player moveInAny (vehicle _target);