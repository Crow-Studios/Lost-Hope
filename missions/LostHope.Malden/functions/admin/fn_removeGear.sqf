#include "..\script_macros.hpp"
/*
    File: fn_stripGear.sqf
    Author: StevioUK
*/

params [
    ["_target", objNull, [objNull]]
];

if (isNil "_target" || isNull _target) exitWith {};

//mags
{
	_target removeMagazine _x;

} forEach (magazines _target); 

//primary
if(primaryWeapon _target != "") then {
	_target removeWeaponGlobal (primaryWeapon _target);
};

//secondary
if(secondaryWeapon _target != "") then {
	_target removeWeaponGlobal (secondaryWeapon _target);
};

//pistol
if(handgunWeapon _target != "") then {
	_target removeWeaponGlobal (handgunWeapon _target);
};

removeUniform _target;
removeVest _target;
removeBackpackGlobal _target;
removeGoggles _target;
removeHeadGear _target;
_target unassignItem "ItemGPS";
_target removeItem "ItemGPS";
