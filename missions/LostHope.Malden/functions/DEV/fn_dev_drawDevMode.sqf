params ["_draw", ["_drawMarker", false]];

[_drawMarker] call lost_hope_fnc_dev_drawMarkerLocations;

[_draw] call lost_hope_fnc_dev_drawZombieLocations;

[_draw] call lost_hope_fnc_dev_drawLootLocations;