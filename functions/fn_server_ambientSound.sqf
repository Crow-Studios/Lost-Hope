// Spawn this, don't use call.... I mean it.

params ["_object", "_sounds", "_time", "_chance"];

while {alive _object} do 
{
    private _randomNumber = random 100;

    if (_randomNumber <= _chance) then {
        [ _object, (selectRandom _sounds), false, true ] call lost_hope_mod_fnc_client_playSound;
    };

    uiSleep _time; // always make this way higher than the length of the sound being played.
};