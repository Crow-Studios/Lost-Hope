class gunShop {
	idd = 10000;
	onLoad = "uiNamespace setVariable ['gunShop', _this select 0]";
	class controls {
		class mainWeaponsTree: RscTree
		{
			idc = 1500;
			onTreeSelChanged = "call lost_hope_fnc_displaySelectedItem";

			x = 0.304511 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.262367 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
			sizeEx = 0.8 * GUI_GRID_H;
			class ScrollBar : ListScrollBar //ListScrollBar is class name required for Arma 3
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "#(argb,8,8,3)color(1,1,1,1)";
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
				shadow = 0;
			};
		};
		class closeButton: RscButton
		{
			idc = 1601;
			onButtonClick = "closeDialog 2";

			text = "Close"; //--- ToDo: Localize;
			x = 0.391966 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0771668 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {-1,-1,-1,0.8};
			sizeEx = 1 * GUI_GRID_H;
		};
		class buyBtn: RscButton
		{
			idc = 1600;

			text = "Buy"; //--- ToDo: Localize;
			x = 0.304511 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0771668 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {-1,-1,-1,0.8};
			sizeEx = 1 * GUI_GRID_H;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.479422 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.216067 * safezoneW;
			h = 0.121 * safezoneH;
			colorText[] = {-1,-1,-1,0.8};
			colorBackground[] = {-1,-1,-1,0.8};
			colorActive[] = {-1,-1,-1,0.8};
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class ItemName: RscStructuredText
		{
			idc = 1100;

			x = 0.489711 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0977446 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {-1,-1,-1,1};
		};
		class ItemCaliber: RscStructuredText
		{
			idc = 1101;

			x = 0.489711 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0977446 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {-1,-1,-1,1};
		};
		class ItemPrice: RscStructuredText
		{
			idc = 1102;

			x = 0.489711 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0977446 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {-1,-1,-1,1};
		};
		class typeDropdown: RscCombo
		{
			idc = 2100;
			x = 0.304511 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.257223 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {-1,-1,-1,1};
		};
	};
};













