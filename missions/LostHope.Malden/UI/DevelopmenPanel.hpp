#define ST_VCENTER        0x0C

class DP {
	idd = 2000;
	onLoad = "uiNamespace setVariable ['DP', _this select 0];";
	class controls {
		class DP_Background: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.144219 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.696094 * safezoneW;
			h = 0.803 * safezoneH;
			colorText[] = {-1,-1,-1,0.5};
			colorBackground[] = {-1,-1,-1,0.5};
			colorActive[] = {-1,-1,-1,0.5};
		};
		class DP_DevToolsList: RscListbox
		{
			idc = 1500;
			x = 0.15453 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.66 * safezoneH;
			onLBDblClick = "[_this] call lost_hope_fnc_executeFunction;";
		};
		class DP_MainText: RscStructuredText
		{
			idc = 1100;
			text = "Crow Studios Development Panel"; //--- ToDo: Localize;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "center";
				valign = "bottom";
				shadow = false;
				shadowColor = "#000000";
				size = "1.3";
			};
		};
		class DP_ExecuteButton: RscButton
		{
			idc = 1600;
			text = "Execute"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class DP_PlayerListbox: RscListbox
		{
			idc = 1501;
			x = 0.293749 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.594 * safezoneH;
		};
		class DP_DTText: RscStructuredText
		{
			idc = 1101;
			text = "Development Tools"; //--- ToDo: Localize;
			style = ST_VCENTER;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.164556 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "center";
				valign = "bottom";
				shadow = false;
				shadowColor = "#000000";
				size = "1.07";
			};
		};
		class DP_PlayerListText: RscStructuredText
		{
			idc = 1102;
			text = "Player List"; //--- ToDo: Localize;
			x = 0.293749 * safezoneW + safezoneX;
			y = 0.164556 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#000000";
				size = "1.05";
			};
		};
		class DP_OpenCLI: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DP_PlayerInfo: RscStructuredText
		{
			idc = 1103;
			text = "Player Info"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.386719 * safezoneW;
			h = 0.649 * safezoneH;
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#000000";
				size = "1";
			};
		};
		class DP_ServerFPS: RscStructuredText
		{
			idc = 1104;
			text = "Server FPS"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#000000";
				size = "1";
			};
		};
		class DP_OpenSteamProfile: RscButton
		{
			idc = 1105;
			text = "Open Steam Profile"; //--- ToDo: Localize;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class DP_ClientFPS: RscStructuredText
		{
			idc = 1106;
			text = "Client FPS"; //--- ToDo: Localize;
			x = 0.569635 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
			class Attributes
			{
				font = "TahomaB";
				color = "#ffffff";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#000000";
				size = "1";
			};
		};
	};	
};


/* #Qamuko
$[
	1.063,
	["DevPanel",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"DP_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.144219 * safezoneW + safezoneX","0.104 * safezoneH + safezoneY","0.696094 * safezoneW","0.803 * safezoneH"],[-1,-1,-1,0.5],[-1,-1,-1,0.5],[-1,-1,-1,0.5],"","-1"],[]],
	[1500,"DP_DevToolsList",[1,"",["0.15453 * safezoneW + safezoneX","0.225 * safezoneH + safezoneY","0.134062 * safezoneW","0.66 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"DP_MainText",[1,"Crow Studios Development Panel",["0.154531 * safezoneW + safezoneX","0.115 * safezoneH + safezoneY","0.654844 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"DP_ExecuteButton",[1,"Execute",["0.29375 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.134062 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"DP_PlayerListbox",[1,"",["0.293749 * safezoneW + safezoneX","0.225 * safezoneH + safezoneY","0.134062 * safezoneW","0.594 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"DP_DTText",[1,"Development Tools",["0.154531 * safezoneW + safezoneX","0.164556 * safezoneH + safezoneY","0.134062 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"DP_PlayerListText",[1,"Player List",["0.293749 * safezoneW + safezoneX","0.164556 * safezoneH + safezoneY","0.134062 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"DP_OpenCLI",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.809375 * safezoneW + safezoneX","0.115 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"DP_PlayerInfo",[1,"",["0.432969 * safezoneW + safezoneX","0.17 * safezoneH + safezoneY","0.386719 * safezoneW","0.649 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"DP_ServerFPS",[1,"Development Tools",["0.432969 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.134062 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1105,"DP_OpenSteamProfile",[1,"Development Tools",["0.685625 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.134062 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1106,"DP_ClientFPS",[1,"Development Tools",["0.569635 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.113437 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]]
]
*/

