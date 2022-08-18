params ["_unit", "_side", "_time"];

diag_log format ["%1 has used bile", _unit];

private _unitGroup = group _unit;

_unit setVariable ["isZombie", true];

[_unit] join zombieGroup;

uiSleep _time;

[_unit] join _unitGroup;
_unit setVariable ["isZombie", false];