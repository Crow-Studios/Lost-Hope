/*
*	Author: Silence
*	Description: N/A
*
*	Arguments:
*	0: _time 		<INTEGER> - Time in seconds
*	Return Value: None
*/


params ["_time"]; // In seconds

// literally pointless now, only use to hog up performance...

diag_log "ZOMBIE CLEANUP: RUNNING ZOMBIE CLEANUP SCRIPT";

while {true} do {
    uiSleep _time;

    // Zombie
    {
        private _entitiesPlayer = [];
        private _entities = _x nearEntities ["CAManBase", 800];
        private _zombie = _x;

        {
            if (_x getVariable ["isPlayer", false]) then {
                _entitiesPlayer append [true];
            } else {
                _entitiesPlayer append [false];
            };
        } forEach _entities;

        diag_log _entitiesPlayer;

        if !( true in _entitiesPlayer ) then {
            deleteVehicle _zombie;
        };

    } forEach units zombieGroup;

    // Hivemind
    {
        private _entitiesPlayer = [];
        private _entities = _x nearEntities ["CAManBase", 800];
        private _zombie = _x;

        {
            if (_x getVariable ["isPlayer", false]) then {
                _entitiesPlayer append [true];
            } else {
                _entitiesPlayer append [false];
            };
        } forEach _entities;

        diag_log _entitiesPlayer;

        if !( true in _entitiesPlayer ) then {
            deleteVehicle _zombie;
        };
    } forEach units hivemindGroup;

    //if !(alive _unit) exitWith {diag_log "ZOMBIE CLEANUP: Unit has been killed, Aborting and Rerunning"};
};