params ["_unit", "_spawnChance", "_armed"];

private _weaponArray = ["arifle_TRG20_F", "arifle_MX_Black_F", "arifle_MX_SW_F"];
private _spawnChance = 5;

private _houses = _unit nearObjects ["house", 100];
{
	_buildingPos = [_x] call BIS_fnc_buildingPositions;
	{
		if (_spawnChance > random 100) then
		{
			// Move all of these to config, then grab
			private _weapons = selectRandom _weaponArray;
			private _magazinesCount = random [1,3,5];
			private _magazines = selectRandom ( [_weapons] call BIS_fnc_compatibleMagazines );
			private _holder = "WeaponHolderSimulated" createVehicle [0,0,0];
			_holder setPos _x;
			if (selectRandom [1,2,3] isEqualTo 2) then {
				_holder addWeaponCargoGlobal [_weapons,1];
				_holder addMagazineCargoGlobal [_magazines, _magazinesCount];
			};
			_holder setDir random [0, 70, 180];
		};
	} forEach _buildingPos;
} forEach _houses;