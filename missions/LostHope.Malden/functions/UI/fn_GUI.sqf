createDialog "DP";
call lost_hope_fnc_admin;
private _display = uiNamespace getVariable "DP";

private _playerInfo = _display displayCtrl 1103;
private _playerBox = _display displayCtrl 1501;

_playerInfo ctrlSetStructuredText parseText format [
	"SELECTED PLAYER STATS <br />
	<t align='left'> NAME: %1 <br />
	STEAM ID: %2 <br />
	HEALTH: %3 <br />
	FOOD: %4 <br />
	WATER: %5 <br />
	CURRENT POSITION: %5 <br />
	LOADOUT: %5 <br />
	SWAY VALUE: %5 <br />
	RECOIL VALUE: %5 <br />
	LEVEL: %5 <br /></t>", 
	profileName, 
	getPlayerUID player
];

private _dev = getArray(missionConfigFile >> "staff" >> "developer");
private _mdev = getArray(missionConfigFile >> "staff" >> "mapDev");
private _admin = getArray(missionConfigFile >> "staff" >> "admin");
private _tester = getArray(missionConfigFile >> "staff" >> "tester");
hint str _dev;

{	
	if (isPlayer _x) then {
		_playerBox lbAdd name _x;
		_playerBox lbSetData [_forEachIndex, getPlayerUID _x];
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



//_playerInfo ctrlSetStructuredText parseText format ["PLAYER STEAM ID: %1 <br />", getPlayerUID player];
//TODO

//Get the player sway amount, money amount, water, food, and health amount
//Get the players loadout and their magazines
//Check the players virtual inventory (If we ever get one)
//Grab is steam ID, Playtime on server
//At the click of a button check the players activites whilst on the server
//
//