params ["_unit"];

_unit setVariable ["lost_hope_markerCheck", true, true];
_unit setVariable ["lost_hope_continueMarkerScript", true, true];
_unit setVariable ["lost_hope_continueAmbientZombieScript", true, true];
_unit setVariable ["lost_hope_spawnAmbientZombie", true, true];
_unit setVariable ["isZombie", false];

/*
Variables not set here:
    BAFLoaded
    RHSLoaded
    ACELoaded
> Refer fn_spawn_modConflicts.sqf for more info
*/