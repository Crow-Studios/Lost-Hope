/*
*	Author: Silence
*	Description: Gets closest marker to unit, framework for mission
*
*	Arguments:
*	0: _time 		<INTEGER> - Time in seconds
*	1: _unit		<OBJECT> - Unit you want to run on
*	Return Value: None
*/


params ["_time", "_unit"]; // In seconds

_zombieTime = [_time, _unit] spawn {
    params ["_time", "_unit"]; // In seconds

    while {true} do {
        uiSleep _time;
        {
            if (_x distance _unit <= 400) then {
                _x setVariable ["canDelete", false];
            } else {
                _x setVariable ["canDelete", true];
            };

            if ( (_x getVariable "canDelete") ) then {
                deleteVehicle _x;
            };
        } forEach units zombieGroup;
    };
};