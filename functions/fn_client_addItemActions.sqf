/*
["lost_hope_static_item_apple", "Eat Apple", [], "", true, true, {hint "This Works"}, true] call lost_hope_mod_fnc_addItemActions;
*/

params ["_classname", "_name", "_color", "_icon", "_conditionEnable", "_conditionShow", "_statement", "_remove"];

[
_classname, // item classname (can be a base class)
"CONTAINER", // type
[_name], // name
_color, // color RGBA
_icon, // icon path 
[{conditionEnable},{conditionShow}], // condition to use, condition to show
{
    params ["_unit", "_container", "_item", "_slot", "_params"]; // parameters
    _statement = statement;
    call _statement;
    statement = nil;
    // function here
},
_remove // remove from inventory
] call CBA_fnc_addItemContextMenuOption;

/*
[
"lost_hope_static_item_apple", // item classname (can be a base class)
"CONTAINER", // type
["Eat Apple"], // name
[], // color RGBA
"", // icon path 
[{true},{true}], // condition to use, condition to show
{
    params ["_unit", "_container", "_item", "_slot", "_params"]; // parameters
    hint "This Works";
    // function here
},
true // remove from inventory
] call CBA_fnc_addItemContextMenuOption;
*/