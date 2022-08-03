/*
  File: fn_ejectTarget.sqf
  Author: StevioUK
  Description: Ejects target from vehicle
*/

params ["_target"];

if (isNull objectParent _target) exitWith {};

_crew = crew vehicle _target;

{moveOut _x} forEach _crew;

