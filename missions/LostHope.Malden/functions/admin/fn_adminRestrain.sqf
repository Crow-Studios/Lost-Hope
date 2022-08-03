/*
    File: fn_adminRestrain.sqf
    Description: Restrains Player
    Author: StevioUK
*/
params ["_target"];

// Handcuff Sound
//[_target, "handcuff"] remoteExec ["sound", 0];

_restrainedBy = profileName;

//--- Set variables on target
_target setVariable ["restrained", true, true];
_target setVariable ["restrainedBy", _restrainedBy, true];

//--- Run on target
[] remoteExec ["lost_hope_fnc_restrain", _target];