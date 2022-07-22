/*
*	Author: Silence
*	Description: Gets closest marker to unit, framework for mission
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run this on
*	1: _radius		<INTEGER> - 0-1000 (not a hard limit, just general idea)
*	Return Value: None
*/

params ["_unit", "_radius"];

private _leader = leader (group _unit);

private _localPlayerUID = getPlayerUID _unit;

private _result = [];

{
	if (_x distance _leader >= 800) then {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
	} else {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", false];
	};
	_result append [name _leader, _x distance _leader];
} forEach units group _unit;

private _continue = _unit getVariable "lost_hope"+_localPlayerUID+"continueMarkerScript";

{
	if ( !( "base" in _x) && (_continue) ) then {

		if ("city" in _x && ([_unit, 750] call lost_hope_fnc_getMarkerDistance)) then {
			hintSilent "city is close"; 
		};
		if ("town" in _x && ([_unit, 600] call lost_hope_fnc_getMarkerDistance)) then {
			hintSilent "town is close"; 
		};
		if ("village" in _x && ([_unit, 400] call lost_hope_fnc_getMarkerDistance)) then {
			hintSilent "village is close";
		};
		if ("farm" in _x && ([_unit, 300] call lost_hope_fnc_getMarkerDistance)) then {
			hintSilent "farm is close";
		};
		if ("military" in _x && ([_unit, 500] call lost_hope_fnc_getMarkerDistance)) then {
			hintSilent "military base is close";
		};
		if ("safezone_2" == _x && ([_unit, 300] call lost_hope_fnc_getMarkerDistance)) then {
			hintSilent "stronghold safezone is close";
		};
		if ("safezone_1" == _x && ([_unit, 75] call lost_hope_fnc_getMarkerDistance)) then {
			hintSilent "mercenary safezone is close";
		};
		//_result append [_x];
	};
} forEach allMapMarkers;

//hint str _continue;

//hint str _result;