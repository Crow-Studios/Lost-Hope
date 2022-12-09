params ["_localPlayerUID", "_unit"];

if (_unit getVariable ["lost_hope_debug_man",false]) then {
    debug_man = true
} else {
    debug_man = false;
}; // debug quickstart

if (debug_man) then {} else {
    [_unit, "lost_hope_loadouts_zombie", "lost_hope_zombie_vanilla_civilians", "lost_hope_zombie", 7] call lost_hope_fnc_setLoadout;
    [] spawn lost_hope_fnc_spawn_modConflicts;

    [player, player, 10, true, 30] call lost_hope_fnc_createCamera;
    ["", "BLACK IN", 10] spawn lost_hope_fnc_screenToBlack;
    playMusic "lost_hope_music_intro";
};

while {_unit getVariable "lost_hope_markerCheck"} do {
    if !(alive _unit) exitWith {};
    [_unit] spawn lost_hope_fnc_getClosestMarker;
    [_unit, 200, "lost_hope_zombie_vanilla_military", EAST, "city"] spawn lost_hope_fnc_ambientZombie;
    uiSleep 5;
};

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
    _unit setVariable ["isPlayer", true];
}];