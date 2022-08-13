private _shops = ( (missionConfigFile >> "lost_hope_shop") call BIS_fnc_getCfgSubClasses );


// _getCategoryName = ( getText (missionConfigFile >> "lost_hope_shop" >> _x >> "category_name") );



_categories = [];


{
	_getCategoryName = ( getText (missionConfigFile >> "lost_hope_shop" >> _x >> "category_name") );

	_categories append [[_getCategoryName]];

} forEach _shops;

_categories

// for "_shops" from 0 to count _categories-1 do {
// 	_catName = ((_categories select _shops) select 0);
// 	lbAdd [_itemDropdown, _catName];
// 	// lbAdd [_itemDropdown, _shops];

