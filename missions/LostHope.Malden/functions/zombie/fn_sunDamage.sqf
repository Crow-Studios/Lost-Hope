params ["_unit"];

waitUntil {sunOrMoon isEqualTo 1};

uiSleep selectRandom [1,2]; // make sure anims aren't perfectly synced

_unit switchMove "WBK_Runner_Calm_Scream";
_unit disableAI "All";

while {alive _unit} do 
{
    uiSleep 1 + selectRandom [1,2]; // make sure anims aren't perfectly synced
    _unit setDamage [damage _unit + 0.2, true];

    if !(alive _unit) exitWith 
    {
        _unit switchMove "IMS_Rifle_Sync_Knife_front_victim_1";
    };
};