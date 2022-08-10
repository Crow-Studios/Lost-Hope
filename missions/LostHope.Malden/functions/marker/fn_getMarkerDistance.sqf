/*
*	Author: Silence
*	Description: Gets distance from marker to unit
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run this on
*	1: _radius		<INTEGER> - 0-1000 (not a hard limit, just general idea)
*	Return Value: BOOL
*/

params ["_unit", "_radius", "_marker"];

dstnc = _unit distance getMarkerPos _marker <= _radius;

dstnc