params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

waitUntil {getPosATL _projectile select 2 < .2};

_projectile setVelocity [0,0,0];

private _dummy = "#particlesource" createVehicle getPosATL _projectile;
_dummy setPosATL getPosATL _projectile;

[ _dummy, selectRandom ["lost_hope_glass_break_1", "lost_hope_glass_break_2", "lost_hope_glass_break_3"] ] remoteExec ["say3D"];

uiSleep .1;

deleteVehicle _projectile;

private _goo = selectRandom ["lost_hope_bile_1_decal", "lost_hope_bile_2_decal", "lost_hope_bile_3_decal"] createVehicle getPosATL _dummy;
_goo setPosATL getPosATL _dummy;
_goo setVectorUp surfaceNormal position _goo;
_goo setDir selectRandom [30, 60, 90, 120];

{
	if ( _x distance _goo <= 50 && (_x getVariable "isZombie") && !(_x getVariable "isMutant") ) then {
		_x disableAI "AUTOTARGET";
		_x disableAI "TARGET";
		_x forgetTarget _unit;
		_x doMove (position _goo);
		while {_x distance _goo <= 3} do {
			_x forgetTarget _unit;
			_x doMove (position _goo);
			if (_x distance _goo <= 3) exitWith {};
			sleep 0.3;
		};
		_script = [_x, _goo] spawn {
			params ["_zombie", "_goo"];
			if (lifeState _zombie isEqualTo "UNCONSCIOUS") exitWith {};
			waitUntil {_zombie distance _goo <= 3};
			_zombie addForce [[0,0,0], [0,0,0]]; // sets unconscious aswell
			_zombie disableAI "ALL";
			uiSleep 15;
			_zombie enableAI "ALL";
			_zombie setUnconscious false;
		};
	};
} forEach allUnits;

uiSleep 3;

deleteVehicle _dummy; 