private _display = uiNamespace getVariable "DP";
private _functionBox = _display displayCtrl 1500;

if (_display isEqualTo displayNull) exitWith {};

private _level = player getVariable ["level", 4];
if (_level < 1) exitWith {closeDialog 0};


_rankName = format["%1%2","rank",_level ];
_availableFunctions = getArray(missionConfigFile >> "levels" >> _rankName >> "function");

_levelRank = getNumber(missionConfigFile >> "levels" >> _rankName >> "level");
if (_availableFunctions isEqualTo []) exitWith {};

_addToList = {
	params ["_funcArr"];

	_FncArr = getArray(missionConfigFile >> "functions" >> "functionArray");
	if !(_FncArr isEqualTo []) then { 

		private _index = _functionBox lbAdd "Administration";
		_functionBox lbSetColor [_index, [1, 0, 0, 1]]; //Colour is RGBA

        {
            _x params ["_function","_variable","_name","_scheduled","_onTarget"];
            if (_variable in _funcArr) then {
                private _value = 0;
				private _index = _functionBox lbAdd _name;
				_functionBox lbSetData [_index, _function];


                if (_scheduled isEqualTo 1) then {
                    if (_onTarget isEqualTo 1) then {
                        _value = 3; //scheduled, ontarget
                    } else {
                        _value = 2; //scheduled, not ontarget
                    };
                } else {
                    if (_onTarget isEqualTo 1) then {
                        _value = 1; //not scheduled, ontarget
                    } else {
                        _value = 0; //not scheduled, not ontarget
                    };
                };
                _functionBox lbSetValue [_index, _value];
            };
        } forEach _FncArr;
		_functionBox lbAdd " ";
	};

	_ToggleFncArr = getArray(missionConfigFile >> "functions" >> "Toggleable");
	if !(_FncArr isEqualTo []) then { 

		private _index = _functionBox lbAdd "Toggleable";
		_functionBox lbSetColor [_index, [0.8, 0.2, 0.2, 1]]; //Colour is RGBA

        {
            _x params ["_function","_variable","_name","_scheduled","_onTarget"];
            if (_variable in _funcArr) then {
                private _value = 0;
				private _index = _functionBox lbAdd _name;
				_functionBox lbSetData [_index, _function];


                if (_scheduled isEqualTo 1) then {
                    if (_onTarget isEqualTo 1) then {
                        _value = 3; //scheduled, ontarget
                    } else {
                        _value = 2; //scheduled, not ontarget
                    };
                } else {
                    if (_onTarget isEqualTo 1) then {
                        _value = 1; //not scheduled, ontarget
                    } else {
                        _value = 0; //not scheduled, not ontarget
                    };
                };
                _functionBox lbSetValue [_index, _value];
            };
        } forEach _ToggleFncArr;
		_functionBox lbAdd " ";
	};

	_DevFncArr = getArray(missionConfigFile >> "functions" >> "Development");
	if !(_FncArr isEqualTo []) then { 

		private _index = _functionBox lbAdd "Development";
		_functionBox lbSetColor [_index, [0.8, 0.47, 0.13, 1]]; //Colour is RGBA

        {
            _x params ["_function","_variable","_name","_scheduled","_onTarget"];
            if (_variable in _funcArr) then {
                private _value = 0;
				private _index = _functionBox lbAdd _name;
				_functionBox lbSetData [_index, _function];


                if (_scheduled isEqualTo 1) then {
                    if (_onTarget isEqualTo 1) then {
                        _value = 3; //scheduled, ontarget
                    } else {
                        _value = 2; //scheduled, not ontarget
                    };
                } else {
                    if (_onTarget isEqualTo 1) then {
                        _value = 1; //not scheduled, ontarget
                    } else {
                        _value = 0; //not scheduled, not ontarget
                    };
                };
                _functionBox lbSetValue [_index, _value];
            };
        } forEach _DevFncArr;
		//_functionBox lbAdd " ";
	};
};

lbClear _functionBox;
[_availableFunctions] call _addToList;
