params ["_unit", "_side", "_time"];

if (_unit getVariable ["hasUsedBile", false]) exitWith {hint "You've already used some bile."};

diag_log format ["%1 has used bile", _unit];

private _unitGroup = group _unit;

private _newGroup = createGroup [_side, true];

[_unit] join _newGroup;
_unit setVariable ["hasUsedBile",true,true];

uiSleep _time;

[_unit] join _unitGroup;
_unit setVariable ["hasUsedBile",false,true];