class gunShop {
	idd = 10000;
	class controls {
		class mainWeaponsTree: RscTree
		{
			idc = 1500;
			x = 0.3611 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
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
			text = "Close"; //--- ToDo: Localize;
			x = 0.463989 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0771668 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {-1,-1,-1,0.8};
			sizeEx = 1 * GUI_GRID_H;
			onButtonClick = "closeDialog 2"; 
		};
		class buyBtn: RscButton
		{
			idc = 1600;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.366244 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0771668 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {-1,-1,-1,0.8};
			sizeEx = 1 * GUI_GRID_H;
			onButtonClick = "[] call lost_hope_fnc_buyItem";
		};
	};
};
