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

groups = [];

{
	if (_x distance _leader >= 800) then {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
	} else {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", false];
	};

	if (_x == _leader) then {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
	};

	_result append [name _leader, _x distance _leader];

} forEach units group _unit;

private _continue = _unit getVariable ("lost_hope"+_localPlayerUID+"continueMarkerScript");

{
	private _markerVar = missionNamespace getVariable ("Lost_Hope_Marker"+_x+"CanRun");
	if ( !( "base" in _x) && (_continue) ) then {

		if ("city" in _x && ([_unit, 600] call lost_hope_fnc_getMarkerDistance) && (_markerVar)) then {
			hintSilent "city is close";
			private _groups = ["lost_hope_zombie_vanilla_police", "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_vanilla_military"];
			private _distance = 400;
			private _count = [30,35,40];
			[_distance, _groups, getMarkerPos _x, EAST, true, _count] call lost_hope_fnc_markerSetup;
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
		};
		if ("town" in _x && ([_unit, 500] call lost_hope_fnc_getMarkerDistance) && (_markerVar)) then {
			hintSilent "town is close";
			private _groups = ["lost_hope_zombie_vanilla_police", "lost_hope_zombie_vanilla_civilians"];
			private _distance = 250;
			private _count = [11,14,17];
			[_distance, _groups, getMarkerPos _x, EAST, false, _count] call lost_hope_fnc_markerSetup;
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
		};
		if ("village" in _x && ([_unit, 400] call lost_hope_fnc_getMarkerDistance) && (_markerVar)) then {
			hintSilent "village is close";
			private _groups = ["lost_hope_zombie_vanilla_civilians"];
			private _distance = 150;
			private _count = [8,11,14];
			[_distance, _groups, getMarkerPos _x, EAST, false, _count] call lost_hope_fnc_markerSetup;
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
		};
		if ("farm" in _x && ([_unit, 300] call lost_hope_fnc_getMarkerDistance) && (_markerVar)) then {
			hintSilent "farm is close";
			private _groups = ["lost_hope_zombie_vanilla_farmers"];
			private _distance = 50;
			private _count = [3,5,7];
			[_distance, _groups, getMarkerPos _x, EAST, false, _count] call lost_hope_fnc_markerSetup;
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
		};
		if ("military" in _x && ([_unit, 500] call lost_hope_fnc_getMarkerDistance) && (_markerVar)) then {
			hintSilent "military base is close";
			private _groups = ["lost_hope_zombie_vanilla_police", "lost_hope_zombie_vanilla_military"];
			private _distance = 230;
			private _count = [20,25,30];
			[_distance, _groups, getMarkerPos _x, EAST, true, _count] call lost_hope_fnc_markerSetup;
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
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