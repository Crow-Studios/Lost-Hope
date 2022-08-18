/*
["lost_hope_static_item_apple", "Eat Apple", [], "", true, true, true, [], ""] call lost_hope_mod_fnc_addItemActions;
*/

params ["_classname", "_name", "_color", "_icon", "_conditionEnable", "_conditionShow", "_remove", "_param", "_function"];

[
_classname, // item classname (can be a base class)
"CONTAINER", // type
[_name], // name
_color, // color RGBA
_icon, // icon path 
[{params ["_unit", "_container", "_item", "_slot", "_params"]; (_params select 0)},{params ["_unit", "_container", "_item", "_slot", "_params"]; (_params select 1) }], // condition to use, condition to show
{
    params ["_unit", "_container", "_item", "_slot", "_params"]; // parameters
    
    (_params select 2) spawn compile (_params select 3);
    // function here
},
_remove, // remove from inventory
[_conditionEnable, _conditionShow, _param, _function] // extra params passed
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