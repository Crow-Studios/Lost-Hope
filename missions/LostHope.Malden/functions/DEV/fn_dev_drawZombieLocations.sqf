params ["_draw"];

if (_draw) then {

    ["DEBUG:", "Started Drawing Zombies", "info", 5 ] call lost_hope_fnc_notificationHint;
    _drawIcon_Zombie = addMissionEventHandler ["Draw3D",
    {
        {
            if ( _x getVariable "isZombie" && !(_x getVariable "isMutant") && (_x distance player <= 200) && (count units group _x >= 10) ) exitWith {
                drawIcon3D
                [
                    "Lost_Hope\markers\lost_hope_zombie.paa",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    (leader group _x modelToWorldVisual [0,0,1]),
                    1,1,0,
                    "Zombie Group Leader"
                ];
                drawIcon3D
                [
                    "",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    (leader group _x modelToWorldVisual [0,0,0.7]),
                    0.9,0.9,0,
                    format ["Zombie Group Count: %1", (count units group _x)]
                ];
            };
            if ( _x getVariable "isZombie" && !(_x getVariable "isMutant") && _x distance player <= 200 && (count units group _x <= 10) ) then {
                private _type = _x getVariable ["zombieType", "UNKNOWN"];
                drawIcon3D
                [
                    "Lost_Hope\markers\lost_hope_zombie.paa",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    (_x modelToWorldVisual [0,0,1]),
                    1,1,0,
                    "Zombie (Normal)"
                ];
                drawIcon3D
                [
                    "",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    (_x modelToWorldVisual [0,0,0.7]),
                    1,1,0,
                    format ["Zombie Loadout Type: %1", _type]
                ];
            };

            if (_x getVariable "isMutant" && _x distance player <= 200) then {
                drawIcon3D
                [
                    "Lost_Hope\markers\lost_hope_biohazard.paa",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[0,1,0,1], [1,1,1,1]],
                    (_x modelToWorldVisual [0,0,1]),
                    1,1,0,
                    "Zombie (Necroplague)"
                ];
            };
            
        } forEach allUnits;
    }];

} else {
    ["DEBUG:", "Stopped Drawing All Objects", "info", 5 ] call lost_hope_fnc_notificationHint;
    removeAllMissionEventHandlers "Draw3D";
};