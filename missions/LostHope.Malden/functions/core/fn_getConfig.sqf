params["_item"];

private _shop = ( (missionConfigFile >> "lost_hope_shop") call BIS_fnc_getCfgSubClasses );
	
switch true do
{
    case(isClass(configFile >> "CfgMagazines" >> _item)): {"CfgMagazines"};
	case(isClass(configFile >> "CfgWeapons" >> _item)): {"CfgWeapons"};
	case(isClass(configFile >> "CfgVehicles" >> _item)): {"CfgVehicles"};
	case(isClass(configFile >> "CfgGlasses" >> _item)): {"CfgGlasses"};
	default {""};
};


// [_price, 1] call lost_hope_fnc_AddOrSubMoney;