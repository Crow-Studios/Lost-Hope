/*
  File: fn_fastFire.sqf
  Author: StevioUK
  Description: Speedy Bullets
   
*/

if(isNil 'fastFire')then {

	fastFire = [] spawn {
		while {true} do {
			_muzzle = currentMuzzle player;
			if(_muzzle isEqualType '') then {(vehicle player) setWeaponReloadingTime [player, _muzzle, 0];};
			uiSleep 0.1;
		};
	};
    
	["DEBUG:", "Fast Fire: Enabled", "info", 5 ] call lost_hope_fnc_notificationHint;
	

} else {

	terminate fastFire;
	fastFire = nil;
    
	["DEBUG:", "Fast Fire: Disabled", "info", 5 ] call lost_hope_fnc_notificationHint;
};