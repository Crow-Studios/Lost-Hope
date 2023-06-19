//get the controls

_display = uiNamespace getVariable "DP";
_LB_PLAYER = _display displayCtrl 1501; //Gets the player listbox
_LB_FUNCTIONS = _display displayCtrl 1500; //Gets the function listbox

//get the selected function 
_functionTreeSel = lbCurSel _LB_FUNCTIONS;
_functionStr = _LB_FUNCTIONS lbData _functionTreeSel;
_functionType = _LB_FUNCTIONS lbValue _functionTreeSel;

//get the selected player
_playerSelected = lbCurSel _LB_PLAYER;
_playerUIDStr = _LB_PLAYER lbData _playerSelected;

//if ((_functionStr isEqualTo "") || (_functionType isEqualTo 0) || {(_functionStr isEqualTo "-")}) exitWith {};


{
	if(getPlayerUID _x == _playerUIDStr) then {
		target = _x;
		//diag_log getPlayerUID _x;
	};
} forEach allPlayers;



//perform the function appropriately
switch (_functionType) do {
	case 0: {
		[ player ] call compile _functionStr;
	};

	case 1: {
		[ target ] call compile _functionStr;
	};

	case 2: {
		[ player ] spawn compile _functionStr;
	};

	case 3: {
		[ target ] spawn compile _functionStr;
	};

};

//Get the fuction I am executing
//Get a value from the player list box


//Values 0 = //not scheduled, not ontarget
//Values 1 = //not scheduled, ontarget
//Values 2 = //scheduled, not ontarget
//Values 3 = //scheduled, ontarget
