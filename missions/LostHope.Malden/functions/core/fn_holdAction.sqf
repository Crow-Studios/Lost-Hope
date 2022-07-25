/*
*	Author: Silence
*	Description: Adds a hold action
*
*	Arguments:
*	0: _object 		<OBJECT> - Unit you want to run on
*	1: _text 		<STRING> - Text
*	2: _image 		<STRING> - Path to image
*	3: _condition 		<STRING> - Evaluation conditions
*	4: _action 		<STRING> - Code to run on success
*
*	Example:
*	[cursorObject, "This works!", "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa", "true", {["C_man_polo_1_F", getPosATL player, EAST, true] spawn lost_hope_fnc_spawnHorde}] call lost_hope_fnc_holdAction;
*
*	Return Value: None
*/

// Everything works EXCEPT from the _arguments params, fuck doing that

/*

params ["_object", "_text", "_image", "_condition", "_arguments"];

// "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa"

[
	_object,
	_text,
	_image, _image,
	_condition, _condition, // conditions show, progress
	{ }, // action start
	{ }, // action progress
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		hint "DEBUG: Running Script Completion";
		_arguments;
	}, // action finished
	{ }, // action cancelled
	[], 6, nil, false, false
] call BIS_fnc_holdActionAdd;

*/

[ 
 ferry_boat_start, 
 "Travel To Island", 
 "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa", "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_takeOff2_ca.paa", 
 "true", "true",
 { },
 { },
 { 
  params ["_target", "_caller", "_actionId", "_arguments"]; 
  hint "DEBUG: Running Script Completion"; 
  [_target, false, true] call lost_hope_fnc_playBoatAnimation;
  {
	if (_x distance _caller <= 25) then {
		_x setPos (FerryEnd modelToWorld [0,0,0]);
	};
  } forEach units group _caller;
 },
 { },
 [], 6, nil, false, false 
] call BIS_fnc_holdActionAdd;