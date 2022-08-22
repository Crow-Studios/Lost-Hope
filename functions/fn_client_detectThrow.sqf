params ["_unit"];

_unit addEventHandler ["Fired",
{

	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	
	if (_ammo isEqualTo "lost_hope_ammo_flare_1") then {
		_projectile setVelocity [0,0,0];
		[_unit, true, _projectile, false] call lost_hope_fnc_airdropPlayer;
	};

	// leaving this here for when we add seperate airdrop types, as opposed to random types
	if (_ammo isEqualTo "lost_hope_ammo_flare_2") then {
		_projectile setVelocity [0,0,0];
		[_unit, true, _projectile, false] call lost_hope_fnc_airdropPlayer;
	};
	
	if (_ammo isEqualTo "lost_hope_ammo_bile") then {
		
		[_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _gunner] spawn lost_hope_mod_fnc_client_throwBile;
		
	};

}];