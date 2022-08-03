/*

	Filename: 	fn_adminInvisibility.sqf
	Description: Toggles Invisibility on the Admin
	Author: StevioUK

*/

if(!invis) then {


	player setVariable ["invisible", true, true];
	invis = true;
	player hideObjectGlobal true;
	["DEBUG:", "Invisibility: Enabled", "info", 5 ] call lost_hope_fnc_notificationHint;


} else {
	
	player setVariable ["invisible", nil, true];
	player hideObjectGlobal false;
	invis = false;
	
	["DEBUG:", "Invisibility: Disabled", "info", 5 ] call lost_hope_fnc_notificationHint;

};
