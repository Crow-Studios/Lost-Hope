player setVariable ["food", 100, true];
player setVariable ["water", 100, true];
player setVariable ["money", 500, true];
player setVariable ["bank", 5300, true];
player setVariable ["cash", 53250, true];

// Calls on each players load in
/*
*	Author: Silence
*	Description: Sets up player variables, etc
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run on
*	Return Value: None
*/


params ["_unit"];

diag_log "Starting the HUD loop";
_loop = [] spawn {
	while {True} do {
		//("HUD" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];	// remove the HUD
		execVM "openHUD.sqf"; //Recreate the hud
		uiSleep 0.1;
	};
};
diag_log "Successfully started the HUD loop";

_unit setVariable ["lost_hope"+_localPlayerUID+"markerCheck", true];
_unit setVariable ["lost_hope"+_localPlayerUID+"continueMarkerScript", true];

_unit setVariable ["isZombie", false];
zombieGroup = grpNull;
herdGroup = grpNull;

_script = [_localPlayerUID, _unit] spawn {
	params ["_localPlayerUID", "_unit"];
	while {_unit getVariable "lost_hope"+_localPlayerUID+"markerCheck"} do {
		[_unit, 300] spawn lost_hope_fnc_getClosestMarker;
		uiSleep 5;
	};
};

{
    missionNamespace setVariable [("Lost_Hope_Marker"+_x+"CanRun"),true];
    //_x setMarkerAlpha 0;
} forEach allMapMarkers;

[30, _unit] call lost_hope_fnc_resetMarkerTime;

[5, _unit] call lost_hope_fnc_zombieCleanup;