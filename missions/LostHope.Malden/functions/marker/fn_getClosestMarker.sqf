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
	if (_x distance _leader >= 400) then {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
	} else {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", false];
	};
	if (_x == _leader) then {
		_x setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];
	};

	_result append [name _leader, _x distance _leader];

} forEach units group _unit;

_nearby_locations = [];

locations = call lost_hope_fnc_getMarkers;

{
	private _continue = _unit getVariable ("lost_hope"+_localPlayerUID+"continueMarkerScript");
	private _markerVar = missionNamespace getVariable ("Lost_Hope_Marker"+_x+"CanRun");
	for "_i" from 0 to count locations-1 do {
		private _name = ((locations select _i) select 0);

		private _groups = ((locations select _i) select 1);

		private _distance = ((locations select _i) select 2);

		private _count = ((locations select _i) select 3);

		private _chance = ((locations select _i) select 4);

		private _chanceItems = ((locations select _i) select 5);

		private _chanceWeapons = ((locations select _i) select 6);

		// array append
		private _nearby_locations append [[_name, _groups, _distance, _count, _chance, _chanceItems, _chanceWeapons]];

		if ( !( "base" in _x) && (_continue) ) then {
			// checks if the player is in the town, and then checks the distance
			if ( _name in _x && ([_unit, _distance] call lost_hope_fnc_getMarkerDistance) && (_markerVar)) then {
				if ("science" in _name) then 
				{
					//[getMarkerPos _x, independent] call lost_hope_fnc_spawnHivemind;
					for "_i" from 0 to 3 do {
						[selectRandom ["dev_asymhuman_stage2_o", "dev_toxmut_o", "dev_asymhuman_o"], getMarkerPos _x, independent] call lost_hope_fnc_spawnMutant;
					};
				};
				// hint the area
				["Location Nearby!!", format ["You are near a %1", _name], "info", 5 ] call lost_hope_fnc_notificationHint;
				[_distance, _groups, getMarkerPos _x, EAST, false, _count, _name] call lost_hope_fnc_markerSetup;
				[_unit, _x, _chance, _chanceItems, _chanceWeapons, _name] spawn lost_hope_fnc_loot_spawnLoot;
				missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
			};

			if ("safezone_1" == _x && ([_unit, 75] call lost_hope_fnc_getMarkerDistance)) then {
				//["Location Nearby!!", "You are near Safezone_1", "info", 5 ] call lost_hope_fnc_notificationHint;
			};

			if ("safezone_2" == _x && ([_unit, 300] call lost_hope_fnc_getMarkerDistance)) then {
				//["Location Nearby!!", "You are near Safezone_2", "info", 5 ] call lost_hope_fnc_notificationHint;
			};

			if ( (_name in _x) && !([_unit, _distance] call lost_hope_fnc_getMarkerDistance) ) then {
				missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true];
			};

		};
	};
} forEach allMapMarkers;



//hint str _continue;

//hint str _result;