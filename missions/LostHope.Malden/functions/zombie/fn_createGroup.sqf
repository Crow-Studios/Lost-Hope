params ["_side", ["_deleteWhenEmpty", true], ["_time",10]];

private _group = createGroup [_side, true];

[_group, _time] spawn lost_hope_fnc_groupInit; 

_group