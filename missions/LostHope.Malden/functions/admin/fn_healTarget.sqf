/*
  File: fn_healTarget.sqf
  Author: StevioUK
  Description: Heals target
   
*/

params ["_target"];

//Checks
if (isNull _target || !alive _target) exitWith {};
	
_target setDamage 0;
_target setOxygenRemaining 1;

["DEBUG:", "Player is now 100% HP", "info", 5 ] call lost_hope_fnc_notificationHint;