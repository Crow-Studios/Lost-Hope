params ["_unit", "_marker", "_chance", "_itemChance", "_weaponChance", "_type"];

hintSilent "Started loot script";

hintSilent _marker;

private _result = [];

private _houses = _unit nearObjects ["Building", 2000];

if (sunOrMoon != 1) then 
{
	_type = "lost_hope_zombie_vanilla_farmers";
	_chance = _chance * 2;
	_itemChance = _itemChance * 2;
	_weaponChance = _weaponChance * 3;
};

{
	_buildingPos = [_x] call BIS_fnc_buildingPositions;
	hintSilent "Started Spawning Loot";
	{
		if (_x inArea _marker) then {
			switch (_type) do 
			{
				case "military": {_type = selectRandom ["lost_hope_zombie_vanilla_military"]};
				case "farm": {_type = selectRandom ["lost_hope_zombie_vanilla_farmers"]};
				case "city": {_type = selectRandom ["lost_hope_zombie_vanilla_civilians", "lost_hope_zombie_vanilla_police"]};
				case "village": {_type = selectRandom ["lost_hope_zombie_vanilla_farmers", "lost_hope_zombie_vanilla_civilians"]};
				case "town": {_type = selectRandom ["lost_hope_zombie_vanilla_farmers", "lost_hope_zombie_vanilla_civilians"]};
				case "science": {_type = selectRandom ["lost_hope_zombie_vanilla_military", "lost_hope_zombie_vanilla_science"]};
			};
			private _random = random 100;
			hintSilent str _random;
			if (_chance > _random) then
			{
				hint "Started loot spawning script";
				// Move all of these to config, then grab
				private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type) call BIS_fnc_getCfgSubClasses );

				//private _number = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "type");
				private _melee = selectRandom ["WBK_Katana", "Shovel_Russian_Rotated", "WBK_SmallHammer", "Sashka_Russian"];
				private _items = selectRandom ["FirstAidKit", "dev_enzymeCapsule", "MiniGrenade", "B_IR_Grenade", "ToolKit"];

				private _magazinesCount = selectRandom [1, 2];

				private _vests = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "vest") );
				private _uniforms = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "uniform") );
				private _backpack = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "backpack") );
				private _headgear = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "headgear") );
				private _facewear = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "facewear") );

				private _binoculars = ( getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "binoculars") );
				private _armed = ( getNumber (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "armed") );
				private _map = ( getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "map") );
				private _holder = "WeaponHolderSimulated_Scripted" createVehicle [0,0,0]; // WeaponHolderSimulated_Scripted

				_holder addEventHandler ["ContainerOpened", {
					params ["_container", "_unit"];
					_container enableSimulation true;
					_container setVectorUp surfaceNormal position _container;
				}];

				_holder addEventHandler ["ContainerClosed", {
					params ["_container", "_unit"];
					_container enableSimulation false;
					_container setVectorUp surfaceNormal position _container;
				}];

				_holder setPosATL _x;
				_holder setVectorUp surfaceNormal position _holder;
				//_holder enableSimulation false;
				_holder allowDamage false;

				if (_weaponChance >= _random && (_armed isEqualTo 1) ) then {
					private _primary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "primary") );
					private _secondary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "secondary") );
					private _magazinesPrimary = selectRandom ( getArray (configFile >> "CfgWeapons" >> _primary >> "magazines") );
					private _magazinesSecondary = selectRandom ( getArray (configFile >> "CfgWeapons" >> _secondary >> "magazines") );
					if (selectRandom [1,2] == 2) then {
						_holder addWeaponCargoGlobal [_primary,1];
						_holder addMagazineCargoGlobal [_magazinesPrimary, _magazinesCount];
						_result append [[_group, _primary, _magazinesPrimary]];
					} else {
						_holder addWeaponCargoGlobal [_secondary,1];
						_holder addMagazineCargoGlobal [_magazinesSecondary, _magazinesCount];
						_result append [[_group, _secondary, _magazinesSecondary]];
					};
				};

				if (_random <= _weaponChance && !(_armed isEqualTo 1)) then {
					_holder addWeaponCargoGlobal [_melee, 1];
				};

				for "_i" from 0 to 1 do {
					if (_random <= _itemChance) then {
						_holder addItemCargoGlobal [selectRandom [_items, _binoculars, _map], 1];
					};
				};

				for "_i" from 0 to 1 do {
					if (_random <= 30) then {
						_holder addItemCargoGlobal [selectRandom [_vests, _uniforms, _headgear], 1];
					};
				};

				/*
				if (_random <= 20) then {
					_holder addBackpackCargoGlobal [_backpack, 1];
				};
				*/

				_holder setDir random [0, 70, 180];
				
				uiSleep 0.2;

			};
		};
	} forEach _buildingPos;
} forEach _houses;

//[true] call lost_hope_fnc_dev_drawLootLocations;

hintSilent str _result;