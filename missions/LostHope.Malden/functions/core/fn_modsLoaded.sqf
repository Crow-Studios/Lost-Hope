private _modsLoaded = [];

private _3CB = ( isClass (configFile >> "cfgPatches" >> "UK3CB_BAF_Equipment") );

private _RHS = ( isClass (configFile >> "cfgPatches" >> "rhsusf_weapons") );

private _ACE = ( isClass (configFile >> "cfgPatches" >> "ace_medical") );

_modsLoaded append [_3CB, _RHS, _ACE];

_modsLoaded