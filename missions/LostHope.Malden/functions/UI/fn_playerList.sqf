private _display = uiNamespace getVariable "DP";
private _playerBox = _display displayCtrl 1501;
private _dev = getArray(missionConfigFile >> "staff" >> "developer");
private _mdev = getArray(missionConfigFile >> "staff" >> "mapDev");
private _admin = getArray(missionConfigFile >> "staff" >> "admin");
private _tester = getArray(missionConfigFile >> "staff" >> "tester");
hint str _dev;

{	
	if (isPlayer _x) then {
		_playerBox lbAdd name _x;
		//_playerBox lbSetData [_forEachIndex, getPlayerUID _x];
		_playerID = getPlayerUID _x;
		
		
		{ 
			if(_x == _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0.8, 0, 0.8, 1]];
			};
		} forEach _dev;
		{ 
			if(_x == _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0.7, 0.93, 0.23, 1]];
			};
		} forEach _mdev;

		{ 
			if(_x == _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0.91, 0.62, 0.66, 1]];
			}; 
		} forEach _admin;

		{ 
			if(_x == _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0, 0, 0, 1]];
			};
		} forEach _tester;

		diag_log _x;
	};
} forEach playableUnits;