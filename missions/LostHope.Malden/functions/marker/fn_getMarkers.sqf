/*
*	Author: C R I M Z O N
*	Description: loops through cfgLocations for locations
*
*	Arguments: None
*	Return Value: Array
*/

locationNames = [];

private _locations = ( (missionConfigFile >> "lost_hope_locations") call BIS_fnc_getCfgSubClasses );

{
	private _locations_name = ( getText ( missionConfigFile >> "lost_hope_locations" >> _x >> "name" ) );
	private _locations_groups = ( getArray ( missionConfigFile >> "lost_hope_locations" >> _x >> "groups" ) );
	private _locations_distance = ( getNumber ( missionConfigFile >> "lost_hope_locations" >> _x >> "distance" ) );
	private _locations_count = ( getArray ( missionConfigFile >> "lost_hope_locations" >> _x >> "count" ) );
	private _locations_chance = ( getNumber ( missionConfigFile >> "lost_hope_locations" >> _x >> "chance" ) );
	private _locations_chanceItems = ( getNumber ( missionConfigFile >> "lost_hope_locations" >> _x >> "chanceItems" ) );;
	private _locations_chanceWeapons = ( getNumber ( missionConfigFile >> "lost_hope_locations" >> _x >> "chanceWeapons" ) );;
	locationNames append [[_locations_name, _locations_groups, _locations_distance, _locations_count, _locations_chance, _locations_chanceItems, _locations_chanceWeapons]];

} forEach _locations;


locationNames