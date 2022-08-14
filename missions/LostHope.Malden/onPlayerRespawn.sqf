// Calls on each players respawn

private _unit = player;

private _localPlayerUID = getPlayerUID _unit;

[_unit] call lost_hope_fnc_spawn_setVariables;

_unit setPos (stronghold_respawn modelToWorld [0,0,0]);

[_unit] spawn lost_hope_fnc_spawn_setVariables;
[_localPlayerUID, _unit] spawn lost_hope_fnc_spawn_initPlayer;