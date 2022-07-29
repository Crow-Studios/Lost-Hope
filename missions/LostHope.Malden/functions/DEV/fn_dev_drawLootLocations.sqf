params ["_draw"];

if (_draw) then {

    ["DEBUG:", "Started Drawing Loot", "info", 5 ] call lost_hope_fnc_notificationHint;
    _drawIcon_Weapon = addMissionEventHandler ["Draw3D",
    {
        {
            drawIcon3D 
            [
                "Lost_Hope\markers\lost_hope_biohazard.paa",
                //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                [[1,0,0,1], [1,1,1,1]],
                (_x modelToWorldVisual [0,0,0.5]),
                2,2,0,
                "Loot Spawn"
            ];
            drawIcon3D
            [
                "",
                //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                [[1,0,0,1], [1,1,1,1]],
                (_x modelToWorldVisual [0,0,0.3]),
                0.9,0.9,0,
                format ["Loot Location: %1", getPosATL _x]
            ];
        } forEach entities "WeaponHolderSimulated_Scripted";
    }];

} else {
    ["DEBUG:", "Stopped Drawing All Objects", "info", 5 ] call lost_hope_fnc_notificationHint;
    removeAllMissionEventHandlers "Draw3D";
};