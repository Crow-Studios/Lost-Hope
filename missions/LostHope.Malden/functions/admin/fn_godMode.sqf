/*
  File: fn_godMode.sqf
  Author: StevioUK
  Description: Turns on god-mode for admin
   
*/

if (life_god) then {
  
    life_god = false;

    terminate godModeLoop; 

    player allowDamage true;
    
    ["DEBUG:", "God Mode: Disabled", "info", 5 ] call lost_hope_fnc_notificationHint;

    
} else {

    life_god = true;

    godModeLoop = [] spawn { 
        while {true} do { 
            player allowDamage false; 
            player setDamage 0; 
            player setOxygenRemaining 1; 
            player setFatigue 0;  
 
            uiSleep 1; 
        }; 
    }; 

    ["DEBUG:", "God Mode: Enabled", "info", 5 ] call lost_hope_fnc_notificationHint;

};