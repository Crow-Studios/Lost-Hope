/*
*	Author: Silence
*	Description: Returns closest marker
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit to base position off of
*/

params ["_unit"];

private _marker = [allMapMarkers, _unit] call BIS_fnc_nearestPosition;

_marker