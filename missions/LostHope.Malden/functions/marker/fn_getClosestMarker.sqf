/*
*	Author: Silence, C R I M Z O N
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
	if (_x == _leader) then {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
	};

	_result append [name _leader, _x distance _leader];

} forEach units group _unit;

private _continue = _unit getVariable ("lost_hope"+_localPlayerUID+"continueMarkerScript");

_nearby_locations = [];

locations = call lost_hope_fnc_getMarkers;

{
	private _markerVar = missionNamespace getVariable ("Lost_Hope_Marker"+_x+"CanRun");
	for "_i" from 0 to count locations-1 do {
		_name = ((locations select _i) select 0);

		_groups = ((locations select _i) select 1);

		_distance = ((locations select _i) select 2);

		_count = ((locations select _i) select 3);

		// array append 
		_nearby_locations append [[_name, _groups, _distance, _count]];

		if ( !( "base" in _x) && (_continue) ) then {
			// checks if the player is in the town, and then checks the distance
			if ( _name in _x && ([_unit, _distance] call lost_hope_fnc_getMarkerDistance) && (_markerVar)) then {
				// hint the town
				// ["Location Nearby!!", format ["You are near a %1", _name], "info", 5 ] call lost_hope_fnc_notificationHint;
				[_distance, _groups, getMarkerPos _x, EAST, true, _count] call lost_hope_fnc_markerSetup;
				missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
			};
			// if ("safezone_1" == _x && ([_unit, 75] call lost_hope_fnc_getMarkerDistance)) then {
			// 	["Location Nearby!!", "You are near Safezone_1", "info", 5 ] call lost_hope_fnc_notificationHint;
			// };

			// if ("safezone_2" == _x && ([_unit, 300] call lost_hope_fnc_getMarkerDistance)) then {
			// 	// ["Location Nearby!!", "You are near Safezone_2", "info", 5 ] call lost_hope_fnc_notificationHint;
			// };

		};
	};
} forEach allMapMarkers;



//hint str _continue;

//hint str _result;