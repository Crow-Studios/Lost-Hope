createDialog "gunShop";

[] call lost_hope_fnc_getWeapons;

// _classes = 'true' configClasses (configFile >> 'CfgVehicles');
// for '_i' from 0 to 10 do
// {
//  	tvAdd [1500, [], configName selectRandom _classes];
// 	for '_j' from 0 to 10 do
// 	{
// 		tvAdd [1500, [_i], configName selectRandom _classes];
// 		for '_k' from 0 to 10 do
// 		{
// 			tvAdd [1500, [_i, _j], configName selectRandom _classes];
// 		};
// 	};
// };