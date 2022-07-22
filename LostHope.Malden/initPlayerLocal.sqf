// Calls on each players load in

private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

_unit setVariable ["lost_hope"+_localPlayerUID+"markerCheck", true];
_unit setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
_unit setVariable ["isZombie", false];

_script = [_localPlayerUID, _unit] spawn {
	params ["_localPlayerUID", "_unit"];
	while {_unit getVariable "lost_hope"+_localPlayerUID+"markerCheck"} do {
		[_unit, 300] call lost_hope_fnc_getClosestMarker;
		uiSleep 1;
	};
};