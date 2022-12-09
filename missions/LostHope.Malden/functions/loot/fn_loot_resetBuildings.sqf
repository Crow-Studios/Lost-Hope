/*
*	Author: Silence
*	Description: Resets all weapon holders/deletes them
*
*	Arguments:
*	0: _time		<INTGER> - Time (in seconds)
*	Return Value: None
*/


params ["_time"]; // In seconds

while {true} do {
    uiSleep _time;


    {
        private _entitiesPlayer = [];
        private _entities = _x nearEntities ["CAManBase", 800];
        private _loot = _x;

        {
            if (_x getVariable ["isPlayer", false]) then {
                _entitiesPlayer append [true];
            } else {
                _entitiesPlayer append [false];
            };
        } forEach _entities;

        if !( true in _entitiesPlayer ) then {
            deleteVehicle _loot;
        };
    } forEach entities "WeaponHolderSimulated_Scripted";

    //if !(alive _unit) exitWith {diag_log "BUILDING CLEANUP: Unit has been killed, Aborting and Rerunning"};
};