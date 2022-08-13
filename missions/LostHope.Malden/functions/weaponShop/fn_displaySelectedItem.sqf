// tvIsSelected 

// if (()) then {
// 	["Location Nearby!!", "reee", "info", 5 ] call lost_hope_fnc_notificationHint;

// };

private _display = uiNamespace getVariable "gunShop";


private _shop = ( (missionConfigFile >> "lost_hope_shop") call BIS_fnc_getCfgSubClasses );
_nameOfGun = _display displayCtrl 1100;
_ItemPrice = _display displayCtrl 1101;

_index = tvCurSel 1500;
_selected = tvData[1500, _index];

_config = [_selected] call lost_hope_fnc_getConfig;

displayName = getText (configFile >> _config >> _selected >> "displayName");

_nameOfGun ctrlSetStructuredText parseText format ["Name : %1", displayName];

{
	private _weapons = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "weapons" ) );
	private _weapons_mags = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "mags" ) );
	private _weapons_optics = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "optics" ) );
	private _weapons_bipods = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "bipods" ) );
	private _weapons_muzzles = ( getArray ( missionConfigFile >> "lost_hope_shop" >> _x >> "muzzles" ) );

	for "_weapon" from 0 to count _weapons-1 do 
	{
		// _item = ((_index select _p) select 2);
		if (_selected in ((_weapons select _weapon) select 0)) then 
		{
			_item = ((_weapons select _weapon) select 2);

			_ItemPrice ctrlSetStructuredText parseText format ["Buy Price : £%1", _item];
		};
	
	};
	// mags

	for "_mags" from 0 to count _weapons_mags-1 do 
	{
		// _item = ((_index select _p) select 2);
		if (_selected in ((_weapons_mags select _mags) select 0)) then 
		{
			_item = ((_weapons_mags select _mags) select 2);

			_ItemPrice ctrlSetStructuredText parseText format ["Buy Price : £%1", _item];

		};
		
	};

	for "_optics" from 0 to count _weapons_optics-1 do 
	{
		// _item = ((_index select _p) select 2);
		if (_selected in ((_weapons_optics select _optics) select 0)) then 
		{
			_item = ((_weapons_optics select _optics) select 2);

			_ItemPrice ctrlSetStructuredText parseText format ["Buy Price : £%1", _item];

		};
		
	};

	for "_bipods" from 0 to count _weapons_bipods-1 do 
	{
		// _item = ((_index select _p) select 2);
		if (_selected in ((_weapons_bipods select _bipods) select 0)) then 
		{
			_item = ((_weapons_bipods select _bipods) select 2);

			_ItemPrice ctrlSetStructuredText parseText format ["Buy Price : £%1", _item];

		};
		
	};

} forEach _shop;
diag_log _index;

// 22:34:37 [4]
// 22:34:39 [4,2]
// 22:34:39 [4,1,2]
// 22:34:40 Loading movesType CfgMovesRabbit_F
// 22:34:40 Creating action map cache
// 22:34:40 [4,1,6]
// 22:34:48 [0]
// 22:34:53 Loading movesType CfgMovesBird
// 22:34:53 Creating action map cache
// 22:34:53 [2,0]
// 22:34:56 [2,0,0]
// 22:35:27 [2,0,10]