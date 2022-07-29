params ["_time", "_unit"]; // In seconds

_markerTime = [_time, _unit] spawn {
    params ["_time", "_unit"]; // In seconds

    while {true} do {
        uiSleep _time;

        private _buildings = [];

        {
            if (_x distance _unit <= 700) then {
                _x setVariable ["canDelete", false];
            } else {
                _x setVariable ["canDelete", true];
            };

            if ( (_x getVariable "canDelete") ) then {
                deleteVehicle _x;
            };
        } forEach entities "WeaponHolderSimulated_Scripted";

        titleText [format["Resetting Buildings Loot: %1", _buildings], "PLAIN DOWN"];
    };

};