/*
  File: fn_noRec.sqf
  Author: StevioUK
  Description: Stable gun
   
*/

if(isNil 'noRec')then {

	noRec = [] spawn {
		while {true} do {
			(vehicle player) setUnitRecoilCoefficient 0;
			player setUnitRecoilCoefficient 0;
			player setCustomAimCoef 0;
			player setFatigue 0;
			uiSleep 2;
		};
	};
    
	["DEBUG:", "No Recoil: Enabled", "info", 5 ] call lost_hope_fnc_notificationHint;
	
} else {

	terminate noRec;
	noRec = nil;

	(vehicle player) setUnitRecoilCoefficient 1;
	player setUnitRecoilCoefficient 1;

    ["DEBUG:", "No Recoil: Disabled", "info", 5 ] call lost_hope_fnc_notificationHint;
};