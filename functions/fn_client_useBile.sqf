params ["_unit", "_side", "_time"];

if (_unit getVariable ["hasUsedBile", false]) exitWith {hint "You've already used some bile.", [player, "lost_hope_mag_bile", 1] call lost_hope_mod_fnc_client_addItem};

private _unitGroup = group _unit;

private _newGroup = createGroup [_side, true];

[_unit] join _newGroup;
_unit setVariable ["hasUsedBile",true,true];

uiSleep _time;

[_unit] join _unitGroup;
_unit setVariable ["hasUsedBile",false,true];