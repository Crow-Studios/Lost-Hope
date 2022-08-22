/*
*	Author: Silence
*	Description: REEE
*
*	Arguments:
*	0: _time 		<INTEGER> - Time in seconds
*	Return Value: None
*/


params ["_time"]; // In seconds

while {true} do {

    uiSleep _time;

    // Dead Bodies
    {

        if (_x getVariable ["isPlayer", false]) then {} else {
            deleteVehicle _x;
        };

    } forEach allDeadMen;

};