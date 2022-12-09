params ["_group", "_time"];

while {count (units _group) != 0} do {
    uiSleep _time;
    
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

        if !( true in _entitiesPlayer ) then {
            deleteVehicle _zombie;
        };

    } forEach units _group;

};