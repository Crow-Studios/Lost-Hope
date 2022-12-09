/*
    Spawn this to avoid weird locality
*/

params [["_sound", "lost_hope_ambience_church"], ["_time", 10]];

while { true } do 
{
    uiSleep 10;
    if ( ([] call lost_hope_fnc_checkTime) isEqualTo 0 && !(missionNamespace getVariable ["isNight",false])) then { // if it wasn't night
        {
            [ _x, _sound, false, false ] spawn lost_hope_mod_fnc_client_playSound;
        } forEach allPlayers;
        missionNamespace setVariable ["isNight",true,true];
    };

    if (([] call lost_hope_fnc_checkTime) isEqualTo 1 && (missionNamespace getVariable ["isNight",false])) then { // if it was night
        {
            [ _x, _sound, false, false ] spawn lost_hope_mod_fnc_client_playSound;
        } forEach allPlayers;
        missionNamespace setVariable ["isNight",false,true];
    };
};