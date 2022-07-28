// Calls on each players load in

private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

[_unit] call lost_hope_fnc_playerInit;