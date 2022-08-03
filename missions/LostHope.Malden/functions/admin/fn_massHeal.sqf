/*
    File: fn_massRev.sqf
    Author: StevioUK
    Description: Opens Mass Revive Dialog
*/

{
    _x setDamage 0;
} forEach units player ;

["DEBUG:", "Everyone is now fully healed", "info", 5 ] call lost_hope_fnc_notificationHint;