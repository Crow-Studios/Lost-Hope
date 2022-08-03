params ["_boat", "_ferryEnding", "_ferryBeginning"];

private _boatLocation = getPosASL _boat;

private _vectorRotation = vectorDir _boat;

if (_ferryEnding) then {
    [ _boat, _ferryEnd ] spawn BIS_fnc_unitPlay;
};

if (_ferryBeginning) then {
    [ _boat, _ferryBegin ] spawn BIS_fnc_unitPlay;
};

[_boatLocation, _boat, _vectorRotation] spawn {
    params ["_boatLocation", "_boat", "_vectorRotation"];
    uiSleep 22;
    _boat setPosASL _boatLocation;
    _boat setVelocity [0,0,0];
    _boat setVectorDir _vectorRotation;
};