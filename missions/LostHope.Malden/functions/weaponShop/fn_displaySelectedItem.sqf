// tvIsSelected 

// if (()) then {
// 	["Location Nearby!!", "reee", "info", 5 ] call lost_hope_fnc_notificationHint;

// };


_index = tvCurSel 1500;
_selected = tvData[1500, _index];


// tvData [1500, _selected]


// ["Location Nearby!!", format ["You are near a %1", _selected], "info", 5 ] call lost_hope_fnc_notificationHint;

private _display = uiNamespace getVariable "gunShop";

private _ItemPrice = _display displayCtrl 1102;

_ItemPrice ctrlSetStructuredText parseText format ["%1",_selected];

diag_log _selected;