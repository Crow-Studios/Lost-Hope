/*
  File: fn_cloneGear.sqf
  Author: StevioUK
  Description: Clones target gear onto player
*/
params [
	["_target",objNull,[objNull]]
];

if (isNull _target) exitWith {["DEBUG:", "You have not selected a target", "info", 5 ] call lost_hope_fnc_notificationHint;};

// Cant clone from Yourself Idiot!
if (_target isEqualTo player) exitWith {["DEBUG:", "You can't do that dumbass", "info", 5 ] call lost_hope_fnc_notificationHint;};

//Grab Loadout from Target & Set on Player
player setUnitLoadout (getUnitLoadout _target);

