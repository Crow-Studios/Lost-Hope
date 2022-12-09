/*
	Execution On: Client/Server
	
	Purpose: Plays sound

	Made by: Silence

    Arguments:
    _object	<OBJECT>
	_sound	<STRING>
    _loop	<BOOL>
	_global	<BOOL>
	
	Example:
	[ player, "lost_hope_ambience_church", false, false ] call lost_hope_mod_fnc_client_fnc_playSound;
	
	DO NOT PLAY THIS ON AN OBJECT NOT DEFINED IN CONFIG (ONLY PLAY ON OBJECTS THAT HAVE loopTime AND maxDistance PARAMETERS IN CONFIG).
*/


params ["_object", "_sound", "_loop", "_global"];

if (is3DEN) exitWith {};

//hideObjectGlobal _object;

if ("Long" in typeOf _object) then {
	hideObjectGlobal _object;
};

if ("Short" in typeOf _object) then {
	hideObjectGlobal _object;
};

_object setVariable ["canPlaySound", true, true];

if (_loop) exitWith {

	private _loopSound = [_object, _sound, _loop, _global] spawn {
	
		params ["_object", "_sound", "_loop", "_global"];
		
		while {alive _object && _object getVariable "canPlaySound"} do {
			
			private _loopTime = getNumber (configFile >> "cfgSounds" >> _sound >> "loopTime");
			private _maxDistance = getNumber (configFile >> "cfgSounds" >> _sound >> "maxDistance");
			
			if (_loopTime == 0) exitWith {
				diag_log "Sound playing in loop, should not be. Please fix";
			};
	
			if (_maxDistance == 0) exitWith {
				diag_log "Sound playing in loop, should not be. Please fix";
			};
			
			if (_global) then {
				[ _object, [_sound, _maxDistance, 1] ] remoteExec ["say3D"];
			} else {
				_object say3D _sound;
			};
			
			_object setVariable ["canPlaySound", false, true];
			
			uiSleep _loopTime;
			
			_object setVariable ["canPlaySound", true, true];
			
		};
		
	};
	
};

if (_global) then {
	private _maxDistance = getNumber (configFile >> "cfgSounds" >> _sound >> "maxDistance");
	[ _object, [_sound, _maxDistance, 1] ] remoteExec ["say3D"];
} else {
	_object say2D _sound;
};

diag_log format ["Sound playing is %1", _sound];