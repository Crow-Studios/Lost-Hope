class lost_hope_clothing_hud
{
	idd = 12;
	onLoad = "uiNamespace setVariable ['lost_hope_clothing_hud', _this select 0];";
	class RscPicture_1200: RscPicture
	{
		idc = 1200;
		text = "#(argb,8,8,3)color(1,1,1,1)";
		x = 0.314375 * safezoneW + safezoneX;
		y = 0.247 * safezoneH + safezoneY;
		w = 0.37125 * safezoneW;
		h = 0.506 * safezoneH;
		colorText[] = {-1,-1,-1,0.6};
		colorBackground[] = {-1,-1,-1,0.9};
		colorActive[] = {-1,-1,-1,0.9};
	};
	class RscCombo_2100: RscCombo
	{
		idc = 2100;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.33 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscListbox_1500: RscListbox
	{
		idc = 1500;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.291 * safezoneH + safezoneY;
		w = 0.33 * safezoneW;
		h = 0.374 * safezoneH;
	};
	class BuyBTN: RscButton
	{
		idc = 1600;
		text = "Buy"; //--- ToDo: Localize;
		x = 0.335 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
	class ClostBTN: RscButton
	{
		idc = 1601;
		text = "Close"; //--- ToDo: Localize;
		x = 0.597969 * safezoneW + safezoneX;
		y = 0.676 * safezoneH + safezoneY;
		w = 0.0670312 * safezoneW;
		h = 0.033 * safezoneH;
	};
}
