//  File: fn_notificationHint.sqf
//  Author: StevioUK, Silence (Fix)
//  Description: Notification System.

//  Example Uses:
//  [ "Title", "Welcome to the server!" ] call lost_hope_fnc_notificationHint;
//  [ "Title", "Tactical View is Disabled", "warning" ] call lost_hope_fnc_notificationHint;
//  [ "Title", "Cant Spawn Vehicle", "error", 50 ] call lost_hope_fnc_notificationHint;

params [
    ["_titleText", "Notification", [""]],
    ["_text", "",[""] ],
    ["_notiftype", "success", ["",[],{}]],
    ["_speed", 5, [5]]
];

if (isDedicated || !hasInterface) exitWith {};

disableSerialization;
private _display = findDisplay 46;
private _TitleColour = switch (_notiftype) do {
    case "info": {
        [0.129,0.588,0.953,1]; //Blue
    };

    case "error": {
        [0.957,0.263,0.212,1]; //Red
    };

    case "warning": {
        [1,0.757,0.027,1]; //Amber
    };

    case "success": {
        [0.298,0.686,0.314,1]; //Green 
    };

    case "rescued": {
        [0.512,0.214,0.345,1]; //No fucking clue what colour this makes // LMAO
    };

    default {
        [0.298,0.686,0.314,1]; //Same as success. sets colour back to success if something random is entered.
    };
};


playSound "HintExpand";

private _Title = _display ctrlCreate ["RscText", -1];
//Creating Title Control and Setting the Position, Width and Height.

//[0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.0015 * safezoneW, 0.015* safezoneH];

_Title ctrlSetPosition [0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.002 * safezoneW, 0.015* safezoneH];
_Title ctrlSetBackgroundColor _TitleColour;
_Title ctrlSetFade 1;
_Title ctrlCommit 0; //ctrlCommit Updates the Changes i made above
_Title ctrlSetFade 0;
_Title ctrlCommit 0.4;

private _Message = _display ctrlCreate ["RscStructuredText", -1];
//Creating Message Control And Setting Text, Height and width.
_Message ctrlSetStructuredText parseText format ["%1<br/><t size='0.9'>%2</t>", _titleText, _text];
_Message ctrlSetPosition [0.805 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.185 * safezoneW,  0.015* safezoneH];
_Message ctrlCommit 0;
_Message ctrlSetPosition [0.805 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.185 * safezoneW, ((ctrlTextHeight _Message)+ (0.005 * safezoneH))];
_Message ctrlCommit 0;

//Setting Background Colour and Fade
_Message ctrlSetBackgroundColor [0.129,0.129,0.129, 0.9];
_Message ctrlSetFade 1;
_Message ctrlCommit 0;
_Message ctrlSetFade 0;
_Message ctrlCommit 0.4;

//Updating Title Height to Match The Text Height
_Title ctrlSetPosition [0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.002 * safezoneW, ((ctrlTextHeight _Message)+ (0.005 * safezoneH))];
_Title ctrlCommit 0;


//Visualising/Creating The Notification so player can see it on screen.
[_Message, _Title, _speed] spawn {
    disableSerialization;
    _this params ["_message", "_title", "_speed"];
    uiSleep _speed;
    _Message ctrlSetFade 1;
    _Message ctrlCommit 0.3;
    _Title ctrlSetFade 1;
    _Title ctrlCommit 0.3;
    uiSleep 0.35;
    ctrlDelete _Message;
    ctrlDelete _Title;
};

//Finding Position of Title and Text
private _posMessage = (ctrlPosition (_Message)) select 1;
private _posTitle = (ctrlPosition (_Title)) select 1;
private _messageHigh = (ctrlPosition (_Message)) select 3;

//Check if more than one notification is active.
/*
if (count LL_currentNotifications >= 1) then 
{
    private _activeNotifications = 0;
    {
        _x params ["_TitleCtrl", "_MessageCtrl"];

        if (!isNull _TitleCtrl && !isNull _MessageCtrl) then
        {
            //Updating Position of Current Notification to be lower
            _TitleCtrl ctrlSetPosition [0.8035 * safezoneW + safezoneX, (_posTitle + _messageHigh + 1.5 * (0.011 * safezoneH))];
            _MessageCtrl ctrlSetPosition [0.805 * safezoneW + safezoneX, (_posMessage + _messageHigh + 1.5 * (0.011 * safezoneH))];
            _TitleCtrl ctrlCommit 0.3;
            _MessageCtrl ctrlCommit 0.3;

            //Updating Position Variables
            _posMessage = (_posMessage + _messageHigh + 1.5 * (0.011 * safezoneH));
            _posTitle = (_posTitle + _messageHigh + 1.5 * (0.011 * safezoneH));
            _messageHigh = (ctrlPosition (_MessageCtrl)) select 3;
            if (_activeNotifications > 3) then {
                _TitleCtrl ctrlSetFade 1;
                _MessageCtrl ctrlSetFade 1;
                _TitleCtrl ctrlCommit 0.25;
                _MessageCtrl ctrlCommit 0.25;
            };
        };
        _activeNotifications = _activeNotifications + 1;
    } forEach LL_currentNotifications;
};

LL_currentNotifications = ([[_Title, _Message]] + LL_currentNotifications) select {!isNull (_x select 0) && !isNull (_x select 1)};
*/