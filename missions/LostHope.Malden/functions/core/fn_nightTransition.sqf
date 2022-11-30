/*
    Spawn this to avoid weird locality
*/

params ["_sound"];

/*
while {true} do 
{
    if ( ([] call lost_hope_fnc_checkTime) isEqualTo 0) exitWith {
        [ player, _sound, false, false ] remoteExec ["lost_hope_mod_fnc_client_playSound",player];
    };
};
*/