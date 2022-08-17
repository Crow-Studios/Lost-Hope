// pls use spawn to run this script

private _modsLoaded = [] call lost_hope_fnc_modsLoaded;

private _3CB = ( (_modsLoaded) select 0 );

private _RHS = ( (_modsLoaded) select 1 );

private _ACE = ( (_modsLoaded) select 2 );

if (_3CB) then {
    diag_log "MOD CONFLICTS: 3CB LOADED, NO ISSUES"; 
    BAFLoaded = true;
};

if (_3CB && _RHS) exitWith {
    diag_log "MOD CONFLICTS: 3CB AND RHS LOADED, MAJOR ISSUES, ABORTING";
    ["MOD CONFLICTS DETECTED: 3CB AND RHS LOADED AT ONCE. PLEASE USE ONLY ONE MODSET. THANK YOU!", "BLACK", 15] spawn lost_hope_fnc_screenToBlack;
    uiSleep 16;
    failMission "END1";
};

if (_RHS) then {
    diag_log "MOD CONFLICTS: RHS LOADED, NO ISSUES";
    RHSLoaded = true;
};

if (_ACE) then {
    diag_log "MOD CONFLICTS: ACE LOADED, NO ISSUES";
    ACELoaded = true;
};