/*
  File: fn_traceBullets.sqf
  Author: StevioUK
  Description: Shows tracing of bullets on selected player
*/

params [
	["_player",objNull,[objNull]]
];

if (isNull _player) exitWith {hint "you have not selected a player"};

tracingPlayer = _player;
[_player] spawn BIS_fnc_traceBullets;