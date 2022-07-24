class cfgPatches
{
	class Lost_Hope
	{
		units[] = 
		{
			""
		};
		weapons[] = 
		{
			""
		};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F"};
	};
};

#include "config\cfgMissions.hpp"

class CfgMarkerClasses
{
	class Lost_Hope_Markers
	{
		displayName="Lost Hope Mission - Flags";
	};
};

class cfgMarkers
{
	class Flag;
	class lost_hope_markers_zombie: Flag
	{
		scope = 1; //Accessibility 1=public, 0=private
		name = "Lost Hope Flag - Zombie";
		icon = "\Lost_Hope\markers\lost_hope_zombie.paa";
		texture = "\Lost_Hope\markers\lost_hope_zombie.paa"; 
		color[] = {1, 1, 1, 1};
		shadow = 0;
		markerClass = "Lost_Hope_Markers";
		side = 2;
		size = 32;
		showEditorMarkerColor = 0; //Whether to show icon color in the editor
	};
	class lost_hope_markers_biohazard: Flag
	{
		scope = 1; //Accessibility 1=public, 0=private
		name = "Lost Hope Flag - Biohazard";
		icon = "\Lost_Hope\markers\lost_hope_biohazard.paa";
		texture = "\Lost_Hope\markers\lost_hope_biohazard.paa"; 
		color[] = {1, 1, 1, 1};
		shadow = 0;
		markerClass = "Lost_Hope_Markers";
		side = 2;
		size = 32;
		showEditorMarkerColor = 0; //Whether to show icon color in the editor
	};
};