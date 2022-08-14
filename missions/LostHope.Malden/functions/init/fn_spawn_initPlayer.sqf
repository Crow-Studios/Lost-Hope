params ["_localPlayerUID", "_unit"];

diag_log (_unit getVariable "lost_hope_markerCheck");

[5, _unit] spawn lost_hope_fnc_zombieCleanup;
[5, _unit] spawn lost_hope_fnc_loot_resetBuildings;
[] spawn lost_hope_fnc_spawn_modConflicts;

[player, player, 10, true, 30] call lost_hope_fnc_createCamera;
["", "BLACK IN", 10] spawn lost_hope_fnc_screenToBlack;

[_unit, "lost_hope_loadouts_zombie", "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie", 7] call lost_hope_fnc_setLoadout;

while {_unit getVariable "lost_hope_markerCheck"} do {
    if !(alive _unit) exitWith {diag_log "SPAWN INIT PLAYER: Unit has been killed, Aborting and Rerunning"};
    [_unit] spawn lost_hope_fnc_getClosestMarker;
    [_unit, 200, selectRandom ["lost_hope_zombie_vanilla_farmers", "lost_hope_zombie_vanilla_civilians"], EAST, "city"] spawn lost_hope_fnc_ambientZombie;
    uiSleep 5;
};

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
    _unit setVariable ["isPlayer", true];
}];