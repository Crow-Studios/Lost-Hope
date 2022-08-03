/*
  File: fn_bolt.sqf
  Author: StevioUK
  Description: Self-Explanatory
   
*/

if(isNil 'unlimAmm')then {

	unlimAmm = [] spawn {
        while {true} do {
			if(local vehicle player)then{
				vehicle player setAmmo [currentWeapon vehicle player, 1000000];
			};
			player setAmmo [primaryWeapon player, 1000000];
			(vehicle player) setVehicleAmmo 1;
			//player setFatigue 0;
			uiSleep 0.3;
        };
    };
    
	["DEBUG:", "Unlimited Ammo: Enabled", "info", 5 ] call lost_hope_fnc_notificationHint;

} else {

	terminate unlimAmm;
	unlimAmm = nil;
	["DEBUG:", "Unlimited Ammo: Disabled", "info", 5 ] call lost_hope_fnc_notificationHint;

};