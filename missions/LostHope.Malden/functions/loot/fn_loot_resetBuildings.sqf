params ["_time", "_unit"]; // In seconds

_markerTime = [_time, _unit] spawn {
    params ["_time", "_unit"]; // In seconds

    while {true} do {
        uiSleep _time;

        private _buildings = [];

        {
            if (_x distance _unit <= 800) then {
                _x setVariable ["canDelete", false];
            } else {
                _x setVariable ["canDelete", true];
            };

            if ( (_x getVariable "canDelete") ) then {
                deleteVehicle _x;
            };
        } forEach entities "WeaponHolderSimulated_Scripted";
        if !(alive _unit) exitWith {diag_log "BUILDING CLEANUP: Unit has been killed, Aborting and Rerunning"};
        //titleText [format["Resetting Buildings Loot: %1", _buildings], "PLAIN DOWN"];
    };
};