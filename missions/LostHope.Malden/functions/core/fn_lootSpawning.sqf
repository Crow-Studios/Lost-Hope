params ["_unit", "_radius", "_chance", "_itemChance", "_weaponChance", "_type"];

private = ["arifle_TRG20_F", "arifle_MX_Black_F", "arifle_MX_SW_F"];

private _result = [];

private _houses = _unit nearObjects ["Building", _radius];
{
	_buildingPos = [_x] call BIS_fnc_buildingPositions;
	{
		private _random = random 100;
		if (_chance > _random) then
		{
			// Move all of these to config, then grab
			private _weapons = selectRandom _weaponArray;
			private _magazinesCount = random [1,3,5];
			private _magazines = selectRandom ( [_weapons] call BIS_fnc_compatibleMagazines );
			private _holder = "WeaponHolderSimulated" createVehicle [0,0,0];
			_holder setPosATL _x;
			if (_type) then {
				_holder addWeaponCargoGlobal [_weapons,1];
				_holder addMagazineCargoGlobal [_magazines, _magazinesCount];
			};
			_holder setDir random [0, 70, 180];
			
			// [_result] call lost_hope_fnc_dev_drawLootLocations;

		};
	} forEach _buildingPos;
} forEach _houses;