class Airdrop_UI
{
	idd = 300;
	onLoad = "uiNamespace setVariable ['Airdrop', _this select 0];";
	duration = 10e10;
	fadeIn = 3;
	fadeOut = 0;
	class Controls
	{
		class Airdrop_Text: RscStructuredText
		{
			idc = 3000;
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.044 * safezoneH;
			class Attributes
            {
                color = "#FFFFFF";
                align = "center";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
            };
		};
		class Airdrop_Img: RscPicture
		{
			idc = 3200;
			style = ST_PICTURE;
			text = "airdrop.paa";
			x = 0.958907 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
};
/* #Vyfija
$[
	1.063,
	["Airdrop",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1100,"Airdrop_Text",[1,"",["0.886719 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.0670312 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"Airdrop_Img",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.958907 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.0360937 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
