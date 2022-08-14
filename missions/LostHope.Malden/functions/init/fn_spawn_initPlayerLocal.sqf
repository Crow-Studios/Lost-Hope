// Calls on each players load in
/*
*	Author: Silence
*	Description: Sets up player variables, etc
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run on
*	Return Value: None
*/

params ["_unit", "_localPlayerUID"];

_unit setVariable ["food", 100, true];
_unit setVariable ["water", 100, true];
_unit setVariable ["money", 500, true];
_unit setVariable ["bank", 5300, true];
_unit setVariable ["cash", 53250, true];

_unit setVariable ["lost_hope"+_localPlayerUID+"playerMoney", 500000];
// Add missionProfileNamespace checks to here to see if they already have data set

[_unit] spawn lost_hope_fnc_spawn_setVariables;
[_localPlayerUID, _unit] spawn lost_hope_fnc_spawn_initPlayer;

// player addAction ["money", {
// 	private _unit = player;

// 	private _localPlayerUID = getPlayerUID _unit;
	
// 	_ree = _unit getVariable ("lost_hope"+_localPlayerUID+"playerMoney");
// 	diag_log _ree;
// }];
