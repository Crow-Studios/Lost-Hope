private _display = uiNamespace getVariable "DP";
private _playerBox = _display displayCtrl 1501;

hint str _dev;

{	
	if (isPlayer _x) then {
		_playerBox lbAdd name _x;
		//_playerBox lbSetData [_forEachIndex, getPlayerUID _x];
		_playerID = getPlayerUID _x;
		
		
		{ 
			if(_x isEqualTo _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0.8, 0, 0.8, 1]];
			};
		} forEach DEV;

		{ 
			if(_x isEqualTo _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0.7, 0.93, 0.23, 1]];
			};
		} forEach MDEV;

		{ 
			if(_x isEqualTo _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0.91, 0.62, 0.66, 1]];
			}; 
		} forEach ADMIN_INGAME;

		{ 
			if(_x isEqualTo _playerID) then {
				_playerBox lbSetColor [_forEachIndex, [0, 0, 0, 1]];
			};
		} forEach TESTER;

		diag_log _x;
	};
} forEach playableUnits;