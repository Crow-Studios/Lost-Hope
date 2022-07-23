/*
*	Author: Silence
*	Description: Checks if unit is in marker
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run this on
*	1: _marker		<STRING> - String of marker
*	Return Value: Bool
*/

params ["_unit", "_marker"];

if (_unit inArea _marker) then {
    inMarker = true;
} else {
    inMarker = false;
};

inMarker