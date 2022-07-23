/*
*	Author: Silence
*	Description: Resets markers variables, etc, to allow zombie spawning
*
*	Arguments:
*	0: _time 		<INTEGER> - Time in seconds
*	1: _unit		<OBJECT> - Unit you want to run on
*	Return Value: None
*/

params ["_time", "_unit"]; // In seconds

_markerTime = [_time, _unit] spawn {
    params ["_time", "_unit"]; // In seconds

    while {true} do {
        uiSleep _time;
        markers = [];

        {
            markers append [_x];
            if ([_unit, _x] call lost_hope_fnc_inMarker) then {
                _index = markers find _x;
                markers deleteAt _index;
            };
        } forEach allMapMarkers;

        //titleText ["", "PLAIN DOWN"];

        {
            missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true];
        } forEach markers;

        titleText [format["Resetting Markers: %1", markers], "PLAIN DOWN"];
    };

};