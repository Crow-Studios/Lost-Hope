private _shop = ( (missionConfigFile >> "lost_hope_shop") call BIS_fnc_getCfgSubClasses );

private _display = uiNamespace getVariable "gunShop";

_itemDropdown = _display displayCtrl 2100;

_categories = [];

_shops = call lost_hope_fnc_getCategories;

// lbAdd [_itemDropdown, "slhkg"];
// for "_p" from 0 to count _shops-1 do 
// {
// 	_name = ((_shops select _p) select 0);
// 	lbAdd [2100, _name];
// 	lbSetData [2100, _p, _name];
// 	_itemDropdown ctrlAddEventHandler [ "LBSelChanged", {
// 		_index = lbCurSel (_this select 0);
// 		selData = lbData [2100, _index];

		// [_selData] call loadWeapons;
{
	// diag_log (_shops select _p) select 0;

	private _weapons         = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "weapons" ) );
	private _weapons_mags    = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "mags" ) );
	private _weapons_optics  = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "optics" ) );
	private _weapons_bipods  = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "bipods" ) );
	private _weapons_muzzles = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "muzzles" ) );

	for "_i" from 0 to count _weapons-1 do {

		private _getWeaponNames   = ( getText ( configFile >> "CfgWeapons" >> ((_weapons select _i) select 0) >> "displayName") );
		private _getWeaponPicture = ( getText ( configFile >> "CfgWeapons" >> ((_weapons select _i) select 0) >> "picture") );



		tvAdd [1500, [], _getWeaponNames];

		tvAdd [1500, [_i], "Optics"]; //0
		tvAdd [1500, [_i], "Bipods"]; //1
		tvAdd [1500, [_i], "Muzzle"]; //2

		tvAdd [1500, [_i], "Magazines"]; //3

		tvSetData [1500, [_i], ((_weapons select _i) select 0)];
		tvSetPicture [1500, [_i], _getWeaponPicture];
		// tvSetData [1500, [_i], ((_weapons select _i) select 2)];

		for "_k" from 0 to count _weapons_optics-1 do 
		{
			private _getWeaponAccessoryNames = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_optics select _k) select 0) >> "displayName") );
			private _getPicture 			 = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_optics select _k) select 0) >> "picture") );

			tvAdd 	     [1500, [_i, 0],     _getWeaponAccessoryNames];
			tvSetData 	 [1500, [_i, 0, _k], ((_weapons_optics select _k) select 0)];
			tvSetPicture [1500, [_i, 0, _k], _getPicture];
		};

		for "_l" from 0 to count _weapons_bipods-1 do 
		{
			private _getPicture = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_bipods select _l) select 0) >> "picture") );
			private _getWeaponAccessoryNames = ( getText ( configFile >> "CfgWeapons" >> ((_weapons_bipods select _l) select 0) >> "displayName") );
			tvAdd 		 [1500, [_i, 1],     _getWeaponAccessoryNames];
			tvSetData    [1500, [_i, 1, _l], ((_weapons_bipods select _l) select 0)];
			tvSetPicture [1500, [_i, 1, _l], _getPicture];
		};

		{

			private _getWeaponMagNames = ( getArray (configFile >> "CfgWeapons" >> ((_weapons select _i) select 0) >> "magazines") );
			private _getMagazineNames  = ( getText (configFile >> "CfgMagazines" >> (_x select 0) >> "displayName") );
			private _getMagPicture 	   = ( getText (configFile >> "CfgMagazines" >> (_x select 0) >> "picture") );
			if ((_x select 0) in _getWeaponMagNames) then 
			{
				tvAdd [1500, [_i, 3], _getMagazineNames];
				for "_m" from 0 to count _x do 
				{
					tvSetData [1500, [_i, 3, _m], (_x select 0)];
					tvSetPicture [1500, [_i, 3, _m], _getMagPicture];
				};
			};
			// diag_log (_x select 0);
		} forEach _weapons_mags;
	};

} forEach _shop;

// 		// diag_log _selData;
// 	}];
// };







// x[0]