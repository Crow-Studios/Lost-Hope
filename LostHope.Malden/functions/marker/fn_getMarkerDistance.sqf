/*
*	Author: Silence
*	Description: Gets distance from marker to unit
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run this on
*	1: _radius		<INTEGER> - 0-1000 (not a hard limit, just general idea)
*	Return Value: Integer
*/

params ["_unit", "_radius"];

dstnc = _unit distance getMarkerPos _x <= _radius;

dstnc