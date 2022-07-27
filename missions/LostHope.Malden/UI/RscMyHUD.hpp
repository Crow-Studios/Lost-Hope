class RscMyHUD
{
	idd = 100;
	onLoad = "uiNamespace setVariable ['RscMyHUD', _this select 0];";
	duration = 15;
	fadeIn = 1;
	fadeOut = 1;
	class Controls
	{
        class HUD_Money_Background: RscPicture
        {
            idc = 1001;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.793907 * safezoneW + safezoneX;
            y = 0.872259 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.132 * safezoneH;
            colorText[] = {-1,-1,-1,0.5};
            colorBackground[] = {-1,-1,-1,0.5};
            colorActive[] = {-1,-1,-1,0.5};
        };
        class HUD_Background: RscPicture
        {
            idc = 1000;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.881562 * safezoneW + safezoneX;
            y = 0.8 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.2 * safezoneH;
            colorText[] = {-1,-1,-1,0.5};
            colorBackground[] = {-1,-1,-1,0.5};
            colorActive[] = {-1,-1,-1,0.5};
        };
        class HUD_Healthbar_Picture: RscPicture
        {
            idc = 1201;
            style = ST_PICTURE;
            text = "UI\pictures\HUD\health.paa";
            x = 0.891875 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Foodbar_Picture: RscPicture
        {
            idc = 1202;
            style = ST_PICTURE;
            text = "UI\pictures\HUD\food.paa"; 
            x = 0.927969 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Waterbar_Picture: RscPicture
        {
            idc = 1203;
            style = ST_PICTURE;
            text = "UI\pictures\HUD\water.paa";
            x = 0.964063 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Cash_Picture: RscPicture
        {
            idc = 1204;
            style = ST_PICTURE;
            text = "UI\pictures\HUD\cash.paa";
            x = 0.799062 * safezoneW + safezoneX;
            y = 0.94 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Bank_Picture: RscPicture
        {
            idc = 1205;
            style = ST_PICTURE;
            text = "UI\pictures\HUD\bank.paa";
            x = 0.799062 * safezoneW + safezoneX;
            y = 0.885 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class HUD_Cash_Text: RscStructuredText
        {
            idc = 1100;
            x = 0.83 * safezoneW + safezoneX;
            y = 0.896 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
            class Attributes
            {
                font = "TahomaB";
                color = "#FFFFFF";
                align = "left";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = ".95";
            };
        };
        class HUD_Bank_Text: RscStructuredText
        {
            idc = 1101;
            x = 0.83 * safezoneW + safezoneX;
            y = 0.95 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
            class Attributes
            {
                font = "TahomaB";
                color = "#FFFFFF";
                align = "left";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = ".95";
            };
        };
        class HUD_PlayerName: RscStructuredText
        {
            idc = 1102;
            x = 0.891875 * safezoneW + safezoneX;
            y = 0.825 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.033 * safezoneH;
            class Attributes
            {
                font = "TahomaB";
                color = "#FFFFFF";
                align = "center";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = ".95";
            };
        };
        class HUD_PlayerUID: RscStructuredText
        {
            idc = 1104;
            x = 0.891875 * safezoneW + safezoneX;
            y = 0.85 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.033 * safezoneH;
            size = 0.035;
            class Attributes
            {
                font = "TahomaB";
                color = "#FFFFFF";
                align = "center";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
            };
        };
        class HUD_Health_Text: RscStructuredText
        {
            idc = 1105;
            x = 0.891875 * safezoneW + safezoneX;
            y = 0.91 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.033 * safezoneH;
            class Attributes
            {
                font = "TahomaB";
                color = "#FFFFFF";
                align = "center";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = ".95";
            };
        };
        class HUD_Food_Text: RscStructuredText
        {
            idc = 1106;
            x = 0.927969 * safezoneW + safezoneX;
            y = 0.91 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.033 * safezoneH;
            class Attributes
            {
                font = "TahomaB";
                color = "#FFFFFF";
                align = "center";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = ".95";
            };
        };
        class HUD_Water_Text: RscStructuredText
        {
            idc = 1107;
            x = 0.964063 * safezoneW + safezoneX;
            y = 0.91 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.033 * safezoneH;
            class Attributes
            {
                font = "TahomaB";
                color = "#FFFFFF";
                align = "center";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = ".95";
            };
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
] OLD
*/ 

/* #Covixu
$[
	1.063,
	["MainGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"HUD_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.881562 * safezoneW + safezoneX","0.764 * safezoneH + safezoneY","0.118594 * safezoneW","0.242 * safezoneH"],[-1,-1,-1,0.5],[-1,-1,-1,0.5],[-1,-1,-1,0.5],"","-1"],[]],
	[1201,"HUD_Healthbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.891875 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1202,"HUD_Foodbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.927969 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1203,"HUD_Waterbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.964063 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1204,"HUD_Cash_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.762969 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1205,"HUD_Bank_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.762969 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"HUD_Cash_Text",[1,"",["0.793906 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0825 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"HUD_Bank_Text",[1,"",["0.793906 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.0825 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1206,"HUD_ServerFPS_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.927969 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0721875 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,0.5],[-1,-1,-1,0.5],[-1,-1,-1,0.5],"","-1"],[]],
	[1102,"HUD_PlayerName",[1,"",["0.891875 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.103125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"HUD_ServerFPS_text",[1,"",["0.936718 * safezoneW + safezoneX","0.703445 * safezoneH + safezoneY","0.0567187 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"HUD_PlayerUID",[1,"",["0.891875 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.103125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1105,"HUD_Healthbar_Text",[1,"",["0.891875 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1106,"HUD_Foodbar_Text",[1,"",["0.927969 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1107,"HUD_Waterbar_Text",[1,"",["0.964063 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1207,"HUD_Money_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.758334 * safezoneW + safezoneX","0.873889 * safezoneH + safezoneY","0.123229 * safezoneW","0.132111 * safezoneH"],[-1,-1,-1,0.5],[-1,-1,-1,0.5],[-1,-1,-1,0.5],"","-1"],[]]
] NEW
*/

/* #Folugu
$[
	1.063,
	["MainGUI",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"HUD_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.881562 * safezoneW + safezoneX","0.764 * safezoneH + safezoneY","0.118594 * safezoneW","0.242 * safezoneH"],[-1,-1,-1,0.5],[-1,-1,-1,0.5],[-1,-1,-1,0.5],"","-1"],[]],
	[1201,"HUD_Healthbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.891875 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1202,"HUD_Foodbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.927969 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1203,"HUD_Waterbar_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.964063 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1204,"HUD_Cash_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.799062 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1205,"HUD_Bank_Picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.799062 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"HUD_Cash_Text",[1,"",["0.83 * safezoneW + safezoneX","0.94 * safezoneH + safezoneY","0.0464063 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"HUD_Bank_Text",[1,"",["0.83 * safezoneW + safezoneX","0.885 * safezoneH + safezoneY","0.0464063 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1206,"HUD_ServerFPS_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.927969 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0721875 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,0.5],[-1,-1,-1,0.5],[-1,-1,-1,0.5],"","-1"],[]],
	[1102,"HUD_PlayerName",[1,"",["0.891875 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.103125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"HUD_ServerFPS_text",[1,"",["0.936718 * safezoneW + safezoneX","0.703445 * safezoneH + safezoneY","0.0567187 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"HUD_PlayerUID",[1,"",["0.891875 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.103125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1105,"HUD_Healthbar_Text",[1,"",["0.891875 * safezoneW + safezoneX","0.896 * safezoneH + safezoneY","0.0257812 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1106,"HUD_Foodbar_Text",[1,"",["0.927969 * safezoneW + safezoneX","0.896 * safezoneH + safezoneY","0.0257812 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1107,"HUD_Waterbar_Text",[1,"",["0.964063 * safezoneW + safezoneX","0.896 * safezoneH + safezoneY","0.0257812 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1207,"HUD_Money_Background",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.793907 * safezoneW + safezoneX","0.872259 * safezoneH + safezoneY","0.0876563 * safezoneW","0.132 * safezoneH"],[-1,-1,-1,0.5],[-1,-1,-1,0.5],[-1,-1,-1,0.5],"","-1"],[]]
]
*/
