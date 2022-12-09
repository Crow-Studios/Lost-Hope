/*
*	Author: Silence
*	Description: Attempts loot spawn
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run this on
*	1: _marker		<STRING> - Marker string
*	2: _chance		<INTEGER> - 0-100
*	3: _itemChance		<INTEGER> - 0-100
*	4: _weaponChance		<INTEGER> - 0-100
*	5: _type		<STRING> - Refer loadout hpp files
*	Return Value: None
*/


params ["_unit", "_marker", "_chance", "_itemChance", "_weaponChance", "_type"];

diag_log format["SPAWN LOOT TRIGGERED BY: %1 AT MARKER %2 WITH GIVEN CHANCE %3 AS TYPE %4", _unit, _marker, _chance, _type];

private _houses = _unit nearObjects ["Building", 2000];

if (([] call lost_hope_fnc_checkTime) isEqualTo 0) then 
{
	_type = "lost_hope_zombie_vanilla_military";
	_chance = _chance * .8;
	_itemChance = _itemChance * .5;
	_weaponChance = _weaponChance * .9;
};

{
	_buildingPos = [_x] call BIS_fnc_buildingPositions;
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
			private _random = round (random 100);
			if (_chance > _random) then
			{
				// Move all of these to config, then grab
				private _group = selectRandom ( (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type) call BIS_fnc_getCfgSubClasses );

				//private _number = getText (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "type");
				private _melee = selectRandom ["WBK_Katana", "Shovel_Russian_Rotated", "WBK_SmallHammer", "Sashka_Russian"];
				private _items = selectRandom ["FirstAidKit", "dev_enzymeCapsule"];
				private _grenades = selectRandom ["MiniGrenade"];
				private _tools = selectRandom ["ToolKit"];

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
				
				if ( (_weaponChance >= _random) && (_armed isEqualTo 1) ) then {
					diag_log format ["LOOT HAS BEEN SPAWNED AT POS: %1", getPosATL _holder];
					private _primary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "primary") );
					private _secondary = selectRandom ( getArray (missionConfigFile >> "lost_hope_loadouts_zombie" >> _type >> _group >> "secondary") );
					private _magazinesPrimary = selectRandom ( getArray (configFile >> "CfgWeapons" >> _primary >> "magazines") );
					private _magazinesSecondary = selectRandom ( getArray (configFile >> "CfgWeapons" >> _secondary >> "magazines") );
					if (selectRandom [1,2] isEqualTo 2) then {
						_holder addWeaponCargoGlobal [_primary,1];
						_holder addMagazineCargoGlobal [_magazinesPrimary, _magazinesCount];
					} else {
						_holder addWeaponCargoGlobal [_secondary,1];
						_holder addMagazineCargoGlobal [_magazinesSecondary, _magazinesCount];
					};
				};

				/*
				if (_random <= 5 && !(_armed isEqualTo 1)) then {
					_holder addWeaponCargoGlobal [_melee, 1];
				};
				*/

				for "_i" from 0 to random [0, 1, 2] do {
					if (_random <= _itemChance) then {
						_holder addItemCargoGlobal [_items, 1];
					};
				};

				if (_random <= 30) then {
					_holder addItemCargoGlobal [_vests, 1];
				};

				if (_random <= 20) then {
					_holder addItemCargoGlobal [selectRandom [_uniforms, _headgear], 1];
				};

				if (_random <= 10) then {
					_holder addBackpackCargoGlobal [_backpack, 1];
				};

				_holder setDir random [0, 70, 180];
				
				uiSleep 0.2;

			};
		};
	} forEach _buildingPos;
} forEach _houses;