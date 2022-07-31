weaponNames = [];
_weaponMuzzles = [];
_compatibleItems = [];

private _shop = ( (missionConfigFile >> "lost_hope_shop") call BIS_fnc_getCfgSubClasses );


{
	private _weapons = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "weapons" ) );
	private _weapons_mags = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "mags" ) );
	private _weapons_optics = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "optics" ) );
	private _weapons_bipods = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "bipods" ) );
	private _weapons_muzzles = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "muzzles" ) );

	// diag_log _weapons;
	// diag_log _weapons_mags;
	// diag_log _weapons_optics;
	// diag_log _weapons_bipods;
	// diag_log _weapons_muzzles;


	for "_i" from 0 to count _weapons-1 do {

		private _getWeaponNames = ( getText ( configFile >> "CfgWeapons" >> ((_weapons select _i) select 0) >> "displayName") );

		tvAdd [1500, [], _getWeaponNames];

		tvAdd [1500, [_i], "Optics"]; //0
		tvAdd [1500, [_i], "Bipods"]; //1
		tvAdd [1500, [_i], "Muzzle"]; //2

		tvAdd [1500, [_i], "Magazines"]; //3

		tvSetData [1500, [_i], ((_weapons select _i) select 0)];

		for "_k" from 0 to count _weapons_optics-1 do 
		{
			private _getWeaponAccessoryNames = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_optics select _k) select 0) >> "displayName") );
			private _getPicture = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_optics select _k) select 0) >> "picture") );

			tvAdd [1500, [_i, 0], _getWeaponAccessoryNames];
			tvSetData [1500, [_i, 0, _k], ((_weapons_optics select _k) select 0)];
			tvSetPicture [1500, [_i, 0, _k], _getPicture];
		};

		for "_l" from 0 to count _weapons_bipods-1 do 
		{
			private _getPicture = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_bipods select _l) select 0) >> "picture") );
			private _getWeaponAccessoryNames = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_bipods select _l) select 0) >> "displayName") );
			tvAdd [1500, [_i, 1], _getWeaponAccessoryNames];
			tvSetData [1500, [_i, 1, _l], ((_weapons_bipods select _l) select 0)];
			tvSetPicture [1500, [_i, 1, _l], _getPicture];
		};

		for "_p" from 0 to count _weapons_muzzles-1 do
		{

			_compatibleItems = ((_weapons select _i) select 0) call BIS_fnc_compatibleItems;

			private _getMuzzleName = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_muzzles select _p) select 0) >> "displayName") );

			private _getPicture = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_muzzles select _p) select 0) >> "picture") );

			_muzzleClassName = getText (configFile >> "CfgWeapons" >> ((_weapons_muzzles select _p) select 0) >> "_generalMacro");

			_compatibleItems find ((_weapons_muzzles select _p) select 0);

			if (_compatibleItems find ((_weapons_muzzles select _p) select 0) != -1) then 
			{
				tvAdd [1500, [_i, 2], ((_weapons_muzzles select _p) select 0)];
				tvSetData [1500, [_i, 2, _p], _muzzleClassName];
				tvSetPicture [1500, [_i, 2, _p], _getPicture];
			};

			// for "_items" from 0 to count _compatibleItems-1 do {
			// 	if (((_weapons_muzzles select _p) select 0) in _compatibleItems) then 
			// 	{
			// 		diag_log
			// 		tvAdd [1500, [_i, 2], ((_weapons_muzzles select _p) select 0)];
			// 	};
			// };



		};



		for "_m" from 0 to count _weapons_mags-1 do 
		{
			private _getWeaponMagNames = ( getArray (configFile >> "CfgWeapons" >> ((_weapons select _i) select 0) >> "magazines") );
			private _getMagazineNames = ( getText (configFile >> "CfgMagazines" >> ((_weapons_mags select _m) select 0) >> "displayName") );
			private _getMag = ( getText (configFile >> "CfgMagazines" >> ((_weapons_mags select _m) select 0) ) );
			for "_n" from 0 to count _getWeaponMagNames-1 do 
			{
				if (((_weapons_mags select _m) select 0) in _getWeaponMagNames) then 
				{

					tvAdd [1500, [_i, 3], _getMagazineNames];
				};
			};

			tvSetData [1500, [_i, 3, _m], ((_weapons_mags select _m) select 0)];

		};

		// _compatibleItems append getArray ( configFile >> "CfgWeapons" >> ((_weapons select _i) select 0) >> "WeaponSlotsInfo" >> "CowsSlots" >> "compatibleItems");

		// diag_log format ["%1: %2", ((_weapons select _i) select 0), _compatibleItems];
	};
 
} forEach _shop;

