/*
  File: fn_cloneToTarget.sqf
  Author: StevioUK
  Description: Clones player gear onto target
*/
params [
	["_target",objNull,[objNull]]
];

if (isNull _target) exitWith {["DEBUG:", "You have not selected a target", "info", 5 ] call lost_hope_fnc_notificationHint;};

// Cant clone to yourself Idiot!
if (_target isEqualTo player) exitWith {["DEBUG:", "You can't do that dumbass", "info", 5 ] call lost_hope_fnc_notificationHint;};

//Grab Loadout from player & set on target
_target setUnitLoadout (getUnitLoadout player);

