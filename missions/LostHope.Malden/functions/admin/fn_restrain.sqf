#include "..\script_macros.hpp"
/*
    File: fn_restrain.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: StevioUK
    Description: Restrains the client.
*/

private _player = player;
private _vehicle = vehicle player;

closeDialog 0;


player setVariable ["Disable_Embarking", true];
player setVariable ["Disable_Disembarking", nil];

while { player getVariable ["restrained", false] } do {
    if (isNull objectParent player) then {
        player playMove "AmovPercMstpSnonWnonDnon_Ease";
    };

    private _state = vehicle player;
    waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable ["restrained", false]) || vehicle player != _state};

    if (!alive player) exitWith {
        player setVariable ["restrained",nil,true];
        player setVariable ["Escorting",nil,true];
        detach _player;
    };

    if (!(isNull objectParent player) && {player getVariable ["Disable_Embarking", false]}) then {
        player action["eject",vehicle player];
    };

    if (!(isNull objectParent player) && !(vehicle player isEqualTo _vehicle)) then {
        _vehicle = vehicle player;
    };

    if (isNull objectParent player && {player getVariable ["Disable_Disembarking", false]}) then {
        private _damage = getDammage player;
        player moveInCargo _vehicle;
        player setDamage _damage;
    };

    if (!(isNull objectParent player) && {player getVariable ["Disable_Disembarking", false]} && (driver (vehicle player) isEqualTo player)) then {
        player action["eject",vehicle player];
        player moveInCargo _vehicle;
    };

    if (!(isNull objectParent player) && {player getVariable ["Disable_Disembarking", false]}) then {
        _turrets = [[-1]] + allTurrets _vehicle;
        {
            if (_vehicle turretUnit [_x select 0] isEqualTo player) then {
                player action["eject",vehicle player];
                uisleep 1;
                player moveInCargo _vehicle;
            };
        } forEach _turrets;
    };
};

disableUserInput true;
disableUserInput false;

if ( alive player ) then {
    player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
    player setVariable ["Escorting",nil,true];
    detach player;
	
};