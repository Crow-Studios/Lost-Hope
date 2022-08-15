params ["_unit"];

_unit addEventHandler ["Fired",
{

	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	
	if (_ammo isEqualTo "lost_hope_ammo_flare_1") then {
		_projectile setVelocity [0,0,0];
		[_unit, true, _projectile] call lost_hope_fnc_airdropPlayer;
	};

	// leaving this here for when we add seperate airdrop types, as opposed to random types
	if (_ammo isEqualTo "lost_hope_ammo_flare_2") then {
		_projectile setVelocity [0,0,0];
		[_unit, true, _projectile] call lost_hope_fnc_airdropPlayer;
	};

}];