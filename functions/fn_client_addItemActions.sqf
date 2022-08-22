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
[{params ["_unit", "_container", "_item", "_slot", "_params"]; _unit == vehicle _unit && (_params select 0)},{params ["_unit", "_container", "_item", "_slot", "_params"]; _unit == vehicle _unit && (_params select 1) }], // condition to use, condition to show
{
    params ["_unit", "_container", "_item", "_slot", "_params"]; // parameters
    
    (_params select 2) spawn compile (_params select 3);
    // function here
},
_remove, // remove from inventory
[_conditionEnable, _conditionShow, _param, _function] // extra params passed
] call CBA_fnc_addItemContextMenuOption;

diag_log format ["A CBA Action Was Added. Params: %1, %2, %3, %4, %5, %6, %7, %8, %9", _classname, _name, _color, _icon, _conditionEnable, _conditionShow, _remove, _param, _function];

/*["Battle_fulton_harness", ["CONTAINER","CLOTHES"], ["Deploy Fulton Harness"], [], "", [{true},{params ["_unit", "_container", "_item", "_slot", "_params"];_unit == vehicle _unit}], {
    params ["_unit", "_container", "_item", "_slot", "_params"];
    [_unit,_item] call Battle_fnc_deploy_harness;
},true] call CBA_fnc_addItemContextMenuOption;
*/