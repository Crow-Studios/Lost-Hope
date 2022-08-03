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

diag_log "ZOMBIE CLEANUP: RUNNING ZOMBIE CLEANUP SCRIPT";

_zombieTime = [_time, _unit] spawn {
    params ["_time", "_unit"]; // In seconds

    while {alive _unit} do {
        uiSleep _time;

        // Zombie
        {
            if (_x distance _unit <= 800) then {
                _x setVariable ["canDelete", false];
            } else {
                _x setVariable ["canDelete", true];
            };

            if ( (_x getVariable "canDelete") ) then {
                deleteVehicle _x;
            };
        } forEach units zombieGroup;

        // Hivemind
        {
            if (_x distance _unit <= 800) then {
                _x setVariable ["canDelete", false];
            } else {
                _x setVariable ["canDelete", true];
            };

            if ( (_x getVariable "canDelete") ) then {
                deleteVehicle _x;
            };
        } forEach units hivemindGroup;
    
        // Dead Bodies
        { 
            if (_x distance _unit <= 800) then {
                _x setVariable ["canDelete", false];
            } else {
                _x setVariable ["canDelete", true];
            };

            if ( (_x getVariable "canDelete") && !(isPlayer [_x]) ) then {
                //hideBody _x; // No need given the range
                //uiSleep 3;
                deleteVehicle _x;
            };
        } forEach allDeadMen;

        if !(alive _unit) exitWith {diag_log "ZOMBIE CLEANUP: Unit has been killed, Aborting and Rerunning"};
    };
};