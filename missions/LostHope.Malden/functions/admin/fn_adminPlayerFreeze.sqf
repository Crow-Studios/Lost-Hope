/*
    File: fn_adminFreeze.sqf
    Description: Freezes Player/Disables Input
    Author: StevioUK
*/

if (frozen) then {
    
    frozen = false;
    disableUserInput false;
    disableUserInput true;
    disableUserInput false;
    ["DEBUG:", "You have been Unfrozen", "info", 5 ] call lost_hope_fnc_notificationHint;

} else {

    frozen = true;
    disableUserInput true;
    ["DEBUG:", "You have been Frozen by a Staff Member", "info", 5 ] call lost_hope_fnc_notificationHint;
};