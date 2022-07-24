params ["_object", "_text", "_condition"];

// lord help me

[
	_object,
	"Kill",
	"\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa", "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa",
	"true", "true",
	{ },
	{ },
	{_condition},
	{ hint "Afraid of death?" },
	[], 6, nil, true, false
] call BIS_fnc_holdActionAdd;