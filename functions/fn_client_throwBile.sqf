params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

diag_log _projectile;

waitUntil {getPosATL _projectile select 2 < .2};

_projectile setVelocity [0,0,0];

private _dummy = "#particlesource" createVehicle getPosATL _projectile;
_dummy setPosATL getPosATL _projectile;

[ _dummy, selectRandom ["lost_hope_glass_break_1", "lost_hope_glass_break_2", "lost_hope_glass_break_3"] ] remoteExecCall ["say3D"];

uiSleep .1;

deleteVehicle _projectile;

private _goo = selectRandom ["lost_hope_bile_1_decal", "lost_hope_bile_2_decal", "lost_hope_bile_3_decal"] createVehicle getPosATL _dummy;
_goo setPosATL getPosATL _dummy;
_goo setVectorUp surfaceNormal position _goo;
_goo setDir selectRandom [30, 60, 90, 120];

uiSleep 3;

deleteVehicle _dummy;