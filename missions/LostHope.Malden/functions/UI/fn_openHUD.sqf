("HUD" call BIS_fnc_rscLayer) cutRsc ["RscMyHUD", "PLAIN"];

private _cashValue = 100;
private _bankValue = 100;

private _playerNameValue = profileName;
private _playerUIDValue = getPlayerUID player;

private _healthValue = (1 - damage player) * 100;
private _foodValue = 50;
private _waterValue = 100;


private _display = uiNamespace getVariable "RscMyHUD";
private _cashText_GUI = _display displayCtrl 1100;
private _bankText_GUI = _display displayCtrl 1101;

private _playerName_GUI = _display displayCtrl 1102;
private _playerUID_GUI = _display displayCtrl 1104;

private _healthText_GUI = _display displayCtrl 1105;
private _foodText_GUI = _display displayCtrl 1106;
private _waterText_GUI = _display displayCtrl 1107;

_cashText_GUI ctrlSetStructuredText parseText format ["$%1",_cashValue];
_bankText_GUI ctrlSetStructuredText parseText format ["$%1",_bankValue];
_playerName_GUI ctrlSetStructuredText parseText format ["%1",_playerNameValue];

_playerUID_GUI ctrlSetStructuredText parseText format ["%1",_playerUIDValue];
_healthText_GUI ctrlSetStructuredText parseText format ["%1",_healthValue];

_foodText_GUI ctrlSetStructuredText parseText format ["%%1",_foodValue];
_waterText_GUI ctrlSetStructuredText parseText format ["%%1",_waterValue];
