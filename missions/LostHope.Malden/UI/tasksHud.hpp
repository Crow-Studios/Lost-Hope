class Tasks {
	idd = 500;
	onLoad = "uiNamespace setVariable ['Tasks', _this select 0]";
	class controls {
		class TraderBG: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.216405 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.484688 * safezoneW;
			h = 0.528 * safezoneH;
			colorText[] = {-1,-1,-1,0.9};
		};
		class TraderTasksCategories: RscListbox
		{
			idc = 1500;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.495 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class TraderText: RscStructuredText
		{
			idc = 1100;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class Tasks: RscListbox
		{
			idc = 1501;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.495 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
	};
};
