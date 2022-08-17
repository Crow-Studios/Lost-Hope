params ["_unit", "_item", "_amount"];

if (_unit canAddItemToBackpack _item) then {
    for "_i" from 0 to (_amount - 1) do {
        _unit addItemToBackpack _item;
    };
} else {
    if (_unit canAddItemToVest _item) then {
        for "_i" from 0 to (_amount - 1) do {
            _unit addItemToVest _item;
        };
    } else {
        if (_unit canAddItemToUniform _item) then {
            for "_i" from 0 to (_amount - 1) do {
                _unit canAddItemToUniform _item;
            };
        } else {
            diag_log format ["%1 couldn't fit %2 in any container", _unit, _item];
        };
    };
};