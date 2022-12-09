/*
*	Author: Silence, C R I M Z O N
*	Description: Gets closest marker to unit, framework for mission
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run this on
*	Return Value: None
*/

params ["_unit"];

private _leader = leader (group _unit);

private _localPlayerUID = getPlayerUID _unit;

{

	if (_x distance _leader >= 400) then {
		_x setVariable ["lost_hope_continueMarkerScript", true, true];
	} else {
		_x setVariable ["lost_hope_continueMarkerScript", false, true];
	};

	if (_x isEqualTo _leader) then {
		_x setVariable ["lost_hope_continueMarkerScript", true, true];
	};


} forEach units group _unit;

_nearby_locations = [];

locations = call lost_hope_fnc_getMarkers;

{
	private _continue = _unit getVariable ("lost_hope_continueMarkerScript");
	private _markerVar = missionNamespace getVariable [("Lost_Hope_Marker"+_x+"CanRun"), false];
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

		if ( !( "base" in _x ) && (_continue) && (_markerVar) ) then {
			// checks if the player is in the town, and then checks the distance
			if ( _name in _x && ([_unit, _distance, _x] call lost_hope_fnc_getMarkerDistance) ) then {
				missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false,true];
				//hint str _markerVar;
				// hint the area
				["Location Nearby!", format ["You are near a %1", _name], "info", 5 ] call lost_hope_fnc_notificationHint;

				[_distance, _groups, getMarkerPos _x, EAST, _count, _name] call lost_hope_fnc_markerSetup;
				[_unit, _x, _chance, _chanceItems, _chanceWeapons, _name] spawn lost_hope_fnc_loot_spawnLoot;
				diag_log format["%1 has been triggered by %2", _x, _unit];
				if ("science" in _name) then
				{
					//[getMarkerPos _x, independent] call lost_hope_fnc_spawnHivemind;
					//for "_i" from 0 to 9 do {
						//[selectRandom ["Zombie_Special_OPFOR_Boomer"], getMarkerPos _x, EAST] call lost_hope_fnc_spawnMutant;
					//};
				};
			};

			/*
			if ("safezone_1" isEqualTo _x && ([_unit, 300, _x] call lost_hope_fnc_getMarkerDistance)) then {
				//["Location Nearby!", "You are near Safezone_1", "info", 5] call lost_hope_fnc_notificationHint;
			};
			*/

		};

		if ( (_name in _x) && !([_unit, _distance, _x] call lost_hope_fnc_getMarkerDistance) && !(_markerVar)) then {
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true,true];
			diag_log format["%1 has been reset", _x];
		};

		if ( "trader" in _x && ([_unit, 150, _x] call lost_hope_fnc_getMarkerDistance) && (_markerVar) && (_continue) ) exitWith {
			["Location Nearby!", "You are near a Trader", "info", 10] call lost_hope_fnc_notificationHint;
			[_x, "lost_hope_zombie_vanilla_military"] call lost_hope_fnc_traderSetup;
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),false];
			diag_log format["Trader: %1 has been triggered by %2", _x, _unit];
		};

		if ( "trader" in _x && !([_unit, 150, _x] call lost_hope_fnc_getMarkerDistance) && !(_markerVar) ) then {
			missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true];
			diag_log format["Trader: %1 has been reset", _x];
			private _marker = _x;
			{
				if (_x inArea _marker) then {
					deleteVehicle _x;
					diag_log format ["Unit %1 was deleted at %2", _x, _marker];
				};
			} forEach allUnits;
		};

	};
} forEach allMapMarkers;



//hint str _continue;

//hint str _result;