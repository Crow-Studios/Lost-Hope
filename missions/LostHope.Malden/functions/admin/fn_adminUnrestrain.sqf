/*
    File: fn_adminUnestrain.sqf
    Description: Unestrains Player
    Author: StevioUK
*/
params ["_target"];


//Checks
if (isNull _target || !(_target getVariable ["restrained",FALSE]) || !alive player || !alive _target) exitWith {};

//Unrestrain
_target setVariable ["restrained", nil, true];

//--- Info Variables Reset
_target setVariable ["restrainedBy", nil, true];

