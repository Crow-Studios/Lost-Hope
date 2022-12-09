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

// Test

class CfgFunctions
{
	class lost_hope_mod
	{
		class functions
		{
			// Sound stuff
            class client_playSound 
			{
                file = "\Lost_Hope\functions\fn_client_playSound.sqf";
            };
            class server_ambientSound
			{
                file = "\Lost_Hope\functions\fn_server_ambientSound.sqf";
            };
			// Other stuff
            class client_addItemActions
            {
                file = "Lost_Hope\functions\fn_client_addItemActions.sqf";
            };
            class client_detectThrow
            {
                file = "Lost_Hope\functions\fn_client_detectThrow.sqf";
            };
            class client_itemActions
            {
                file = "Lost_Hope\functions\fn_client_itemActions.sqf";
				postInit = 1;
            };
            class client_addItem
            {
                file = "Lost_Hope\functions\fn_client_addItem.sqf";
            };
            class client_throwBile
            {
                file = "Lost_Hope\functions\fn_client_throwBile.sqf";
            };
            class client_useBile
            {
                file = "Lost_Hope\functions\fn_client_useBile.sqf";
            };
		};
	};
};

class Extended_InitPost_EventHandlers {
	class CAManBase
	{
		class lost_hope_detectThrow
		{
			init = "[(_this select 0)] call lost_hope_mod_fnc_client_detectThrow";
		};
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
		showEditorMarkerColor = 1; //Whether to show icon color in the editor
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
		showEditorMarkerColor = 1; //Whether to show icon color in the editor
	};
};

class CfgSounds {
	sounds[] = {};
	class lost_hope_glass_break_1 {
		name = "lost_hope_glass_break_1";
		sound[] = {"\Lost_Hope\sounds\lost_hope_glass_break_1.ogg", 600, 1.0};
		titles[] = {0, ""};
	};

	class lost_hope_glass_break_2 {
		name = "lost_hope_glass_break_1";
		sound[] = {"\Lost_Hope\sounds\lost_hope_glass_break_2.ogg", 600, 1.0};
		titles[] = {0, ""};
	};
	
	class lost_hope_glass_break_3 {
		name = "lost_hope_glass_break_3";
		sound[] = {"\Lost_Hope\sounds\lost_hope_glass_break_3.ogg", 600, 1.0};
		titles[] = {0, ""};
	};
};

class cfgVehicles 
{
	#include "config\cfgTextures.hpp"
};