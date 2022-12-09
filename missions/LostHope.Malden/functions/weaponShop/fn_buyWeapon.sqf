private _display = uiNamespace getVariable "gunShop";

private _shop = ( (missionConfigFile >> "lost_hope_shop") call BIS_fnc_getCfgSubClasses );
private _unit = player;

private _localPlayerUID = getPlayerUID _unit;
// display variables
_index = tvCurSel 1500;
_selected = tvData[1500, _index];

// selecte d item type variables
_itemType = [_selected] call BIS_fnc_itemType;
_currentPlayerPrimaryGun = [primaryWeapon player] call BIS_fnc_itemType;
_currentPlayerSecondaryGun = [secondaryWeapon player] call BIS_fnc_itemType;


_cat = _itemType select 0;
_type = _itemType select 1;


// get config variables
_config = [_selected] call lost_hope_fnc_getConfig;
money = _unit getVariable ("lost_hope"+_localPlayerUID+"playerMoney");
// _unit setVariable ["lost_hope"+_localPlayerUID+"playerMoney", 1000];

displayName = getText (configFile >> _config >> _selected >> "displayName");

// CVHECKING WEAPON ITEM
if (_cat isEqualTo "Weapon") then 
{
    switch(_type) do
	{
	    case "MissileLauncher":
	    {
	        player removeWeapon (secondaryWeapon player);
	    };
		case "RocketLauncher":
		{
		    player removeWeapon (secondaryWeapon player);
		};
	};
};

switch (_cat) do 
{
	
	case "Weapon" : {
		// player forceAddWeapon _selected;
		// [player, _selected, 1] call BIS_fnc_addWeapon;

		// chekcing if the player already has the weapon

		if (_type in ["Shotgun", "AssaultRifle", "MachineGun", "Rifle", "SniperRifle", "SubmachineGun"]) then
		{
			if (primaryWeapon player != _selected) then 
			{
				["Iventory Alert!!", format ["You just bought a %1", displayName], "info", 5 ] call lost_hope_fnc_notificationHint;

				player addWeapon _selected;
			} else {};
		};
		if (_type isEqualTo "Handgun") then 
		{
			if (handgunWeapon player isEqualTo "") then 
			{
				["Iventory Alert!!", format ["You just bought a %1", _selected], "info", 5 ] call lost_hope_fnc_notificationHint;

				player addWeapon _selected;
			} else {};
		};
		

	};
	case "Item": {
		if (_type in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) then 
		{
			if (primaryWeapon player isEqualTo "") then 
			{ 
				player addItemToBackpack _selected;
			} else {
				if ( (_selected in primaryWeaponItems player) ) then 
				{
					player addItemToBackpack _selected;
				} else {
					player addPrimaryWeaponItem _selected;

				};

				if ( (_selected in secondaryWeaponItems player) ) then 
				{
					player addItemToBackpack _selected;

				} else {
					player addWeaponItem [secondaryWeapon player, _selected];

				};
			};
		};
	};

	case "Magazine" : {
		if (_type isEqualTo "Bullet") then 
		{
			_compatibleMag = getArray (configFile >> _config >> currentWeapon player >> "Magazines" );

			if ( _selected in _compatibleMag) then 
			{
				player addMagazine _selected;
			} else {
				player addItemToBackpack _selected;

			};

		};
	};

};