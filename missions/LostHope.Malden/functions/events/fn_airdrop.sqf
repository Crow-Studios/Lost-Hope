params ["_position", "_isVehicle", "_classname", "_type"];

private _vehicle = _classname createVehicle (_position);
_vehicle setPosATL ( _vehicle modelToWorld [0,0,200] );

private _chute = "B_Parachute_02_F" createVehicle (getPosATL _vehicle);

_chute attachTo [_vehicle, [0, 0, 0.1]];

//waitUntil { isTouchingGround _chute };

//deleteVehicle _chute;

//_vehicle setVelocity [0,0,0];