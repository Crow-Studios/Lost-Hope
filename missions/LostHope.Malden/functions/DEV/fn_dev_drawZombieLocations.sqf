params ["_draw"];

if (_draw) then {

    ["DEBUG:", "Started Drawing Zombies", "info", 5 ] call lost_hope_fnc_notificationHint;
    _drawIcon_Zombie = addMissionEventHandler ["Draw3D",
    {
        {
            if (_x getVariable "isZombie" && _x distance player <= 300) then {
                private _canDelete = _x getVariable ["canDelete", false];
                drawIcon3D
                [
                    "Lost_Hope\markers\lost_hope_zombie.paa",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    (_x modelToWorldVisual [0,0,1]),
                    1,1,0,
                    format ["Zombie Can Delete: %1", _canDelete]
                ];
                drawIcon3D
                [
                    "",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    (_x modelToWorldVisual [0,0,0.7]),
                    0.9,0.9,0,
                    format ["Zombie Health: %1", round((1-getDammage _x) * 100)]
                ];
            };
        } forEach allUnits;
    }];

} else {
    ["DEBUG:", "Stopped Drawing All Objects", "info", 5 ] call lost_hope_fnc_notificationHint;
    removeAllMissionEventHandlers "Draw3D";
};