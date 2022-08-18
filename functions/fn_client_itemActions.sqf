params ["_unit"];

// Apple
["lost_hope_static_item_apple", "Eat Apple", [], "", true, true, true, [], ""] spawn lost_hope_mod_fnc_client_addItemActions;

// Beans (unopened)
["lost_hope_static_item_BEANZ", "Open Beans", [], "", true, true, true, [], ""] spawn lost_hope_mod_fnc_client_addItemActions;

// Beans (opened)
["lost_hope_static_item_BEANZ_Opened", "Eat Beans", [], "", true, true, true, [], ""] spawn lost_hope_mod_fnc_client_addItemActions;

// Bottle
["lost_hope_static_item_bottle", "Drink Water", [], "", true, true, true, [], ""] spawn lost_hope_mod_fnc_client_addItemActions;

// Bile
["lost_hope_mag_bile", "Use Bile", [], "", true, true, true, [_unit, EAST, 60], "lost_hope_mod_fnc_client_useBile"] spawn lost_hope_mod_fnc_client_addItemActions;