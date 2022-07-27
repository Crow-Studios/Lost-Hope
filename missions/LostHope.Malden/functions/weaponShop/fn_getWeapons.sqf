weaponNames = [];

private _shop = ( (missionConfigFile >> "lost_hope_shop") call BIS_fnc_getCfgSubClasses );

{
	private _weapons = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "weapons" ) );
	private _weapons_mags = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "mags" ) );
	private _weapons_accs = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "accs" ) );
	for "_i" from 0 to count _weapons-1 do {
		tvAdd [1500, [], ((_weapons select _i) select 1)];

		tvAdd [1500, [_i], "Accessories"];
		for "_j" from 0 to count _weapons-1 do {

			for "_k" from 0 to count _weapons_accs-1 do {
				// tvAdd [1500, [_i, _j], ];
				private _getWeaponAccessoryNames = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_accs select _k) select 0) >> "displayName") );
				// private _getWeaponAccessoryClass = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_accs select _k) select 0) >> "_generalMacro") );
				// if ("optic" in _getWeaponAccessoryClass) then {
				// 	// tvAdd [1500, [_i, _j, _k], _getWeaponAccessoryNames];
				// }
				tvAdd [1500, [_i, _j], _getWeaponAccessoryNames];

			};
		};


		tvAdd [1500, [_i], "Magazines"];
		for "_l" from 0 to count _weapons-1 do {
			for "_m" from 0 to count _weapons_mags-1 do {
				private _getWeaponMagNames = ( getArray (configFile >> "CfgWeapons" >> ((_weapons select _i) select 0) >> "magazines") );
				private _getMagazineNames = ( getText (configFile >> "CfgMagazines" >> ((_weapons_mags select _m) select 0) >> "displayName") );

				for "_n" from 0 to count _getWeaponMagNames-1 do {
					if (((_weapons_mags select _m) select 0) in _getWeaponMagNames) then {
						tvAdd [1500, [_i, _l], _getMagazineNames];
					};
				};
			};
		};
	};

} forEach _shop;
// ["Location Nearby!!", format ["%1", weaponNames], "info", 5 ] call lost_hope_fnc_notificationHint;
// configFile >> "CfgWeapons" >> "arifle_AK12_arid_F" >> "magazines"
// configFile >> "CfgMagazines" >> "30rnd_762x39_AK12_Arid_Mag_F"