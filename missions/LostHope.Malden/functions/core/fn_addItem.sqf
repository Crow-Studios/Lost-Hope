params ["_unit", "_item", "_amount"];

if (_unit canAddItemToBackpack _item) then {
    _unit addItemToBackpack [_item, _amount];
} else {
    if (_unit canAddItemToVest _item) then {
        _unit addItemToVest [_item, _amount];
    } else {
        if (_unit canAddItemToUniform _item) then {
            _unit canAddItemToUniform [_item, _amount];
        } else {
            diag_log format ["%1 couldn't fit %2 in any container", _unit, _item];
        };
    };
};