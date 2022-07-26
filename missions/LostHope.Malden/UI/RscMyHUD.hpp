class RscMyHUD
{
	idd = 100;
	onLoad = "uiNamespace setVariable ['RscMyHUD', _this select 0];";
	duration = 15;
	fadeIn = 1;
	fadeOut = 1;
	class Controls
	{
        /*
		class RscStructuredText_1100: RscStructuredText
        {
            idc = 1100;
            text = "Health: XXX"; //--- ToDo: Localize;
            x = 0.845469 * safezoneW + safezoneX;
            y = 0.918 * safezoneH + safezoneY;
            w = 0.0567187 * safezoneW;
            h = 0.055 * safezoneH;
            colorText[] = {-1,-1,-1,1};
            colorBackground[] = {-1,-1,-1,0.2};
            colorActive[] = {-1,-1,-1,0};
        };
        */

        class HUD_Foodbar: RscProgressBar
        {
            idc = 1200;
            onLoad = "_this spawn { for '_i' from 0 to 1 step 0.01 do { (_this # 0) progressSetPosition _i; uiSleep 1 } }";
            deletable = 0;
            fade = 0;
            access = 0;
            type = CT_PROGRESS;
            style = ST_VERTICAL;
            colorFrame[] = {0,0,0,1};
            colorBar[] = {1,1,1,1};
            x = 0.87125 * safezoneW + safezoneX;
            y = 0.83 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.099 * safezoneH;
            shadow = 2;
            texture = "#(argb,8,8,3)color(1,1,1,1)";
        };
        class HUD_Healthbar: RscProgressBar
        {
            idc = 1200;
            onLoad = "_this spawn { for '_i' from 0 to 1 step 0.01 do { (_this # 0) progressSetPosition _i; uiSleep 1 } }";
            deletable = 0;
            fade = 0;
            access = 0;
            type = CT_PROGRESS;
            style = ST_VERTICAL;
            colorFrame[] = {0,0,0,1};
            colorBar[] = {1,1,1,1};
            x = 0.809375 * safezoneW + safezoneX;
            y = 0.83 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.099 * safezoneH;
            shadow = 2;
            texture = "#(argb,8,8,3)color(1,1,1,1)";
        };
        class HUD_Waterbar: RscProgressBar
        {
            idc = 1200;
            onLoad = "_this spawn { for '_i' from 0 to 1 step 0.01 do { (_this # 0) progressSetPosition _i; uiSleep 1 } }";
            deletable = 0;
            fade = 0;
            access = 0;
            type = CT_PROGRESS;
            style = ST_VERTICAL;
            colorFrame[] = {0,0,0,1};
            colorBar[] = {1,1,1,1};
            x = 0.933125 * safezoneW + safezoneX;
            y = 0.83 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.099 * safezoneH;
            shadow = 2;
            texture = "#(argb,8,8,3)color(1,1,1,1)";
        };
        class HUD_Healthbar_Picture: RscPicture
        {
            idc = 1201;
            style = ST_PICTURE;
            text = "health.paa";
            x = 0.809375 * safezoneW + safezoneX;
            y = 0.922 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.068 * safezoneH;
        };
        class HUD_Foodbar_Picture: RscPicture
        {
            idc = 1202;
            style = ST_PICTURE;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.87125 * safezoneW + safezoneX;
            y = 0.929 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Waterbar_Picture: RscPicture
        {
            idc = 1203;
            style = ST_PICTURE;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.933125 * safezoneW + safezoneX;
            y = 0.929 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Cash_Picture: RscPicture
        {
            idc = 1204;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.809375 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Bank_Picture: RscPicture
        {
            idc = 1205;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.897031 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Cash_Text: RscStructuredText
        {
            idc = 1100;
            x = 0.840313 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Bank_Text: RscStructuredText
        {
            idc = 1101;
            x = 0.927969 * safezoneW + safezoneX;
            y = 0.775 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Background: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,1,1,1)"; //Set path to pic
            x = 0.793906 * safezoneW + safezoneX;
            y = 0.764 * safezoneH + safezoneY;
            w = 0.195937 * safezoneW;
            h = 0.22 * safezoneH;
            colorText[] = {-1,-1,-1,0.2};
            colorBackground[] = {-1,-1,-1,0.2};
            colorActive[] = {-1,-1,-1,0.2};
        };
	};
};

/* #Kyjypu
$[
	1.063,
	["MainGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1500,"HUD_Foodbar",[1,"",["0.87125 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.04125 * safezoneW","0.099 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"HUD_Healthbar",[1,"",["0.809375 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.04125 * safezoneW","0.099 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1502,"HUD_Waterbar",[1,"",["0.933125 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.04125 * safezoneW","0.099 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"HUD_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.793906 * safezoneW + safezoneX","0.764 * safezoneH + safezoneY","0.195937 * safezoneW","0.22 * safezoneH"],[-1,-1,-1,0.2],[-1,-1,-1,0.2],[-1,-1,-1,0.2],"","-1"],[]],
	[1201,"HUD_Healthbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.809375 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1202,"HUD_Foodbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.87125 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1203,"HUD_Waterbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.933125 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.04125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1204,"HUD_Cash_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.809375 * safezoneW + safezoneX","0.775 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1205,"HUD_Bank_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.897031 * safezoneW + safezoneX","0.775 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"HUD_Cash_Text",[1,"",["0.840313 * safezoneW + safezoneX","0.775 * safezoneH + safezoneY","0.0464063 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"HUD_Bank_Text",[1,"",["0.927969 * safezoneW + safezoneX","0.775 * safezoneH + safezoneY","0.0464063 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

