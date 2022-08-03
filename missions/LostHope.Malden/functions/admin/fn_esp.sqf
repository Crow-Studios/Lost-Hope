
if (draw) then {

    [true] call lost_hope_fnc_dev_drawLootLocations;
    [true] call lost_hope_fnc_dev_drawZombieLocations;
	["DEBUG:", "ESP Has Been Enabled", "info", 5 ] call lost_hope_fnc_notificationHint;
	draw = false;

} else {
    [false] call lost_hope_fnc_dev_drawLootLocations;
    [false] call lost_hope_fnc_dev_drawZombieLocations;
	["DEBUG:", "ESP Has Been Disabled", "info", 5 ] call lost_hope_fnc_notificationHint;
	draw = false;
};