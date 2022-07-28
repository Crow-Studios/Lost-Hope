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
                (ASLToAGL getPosASLVisual _x),
                2,2,0,
                "Loot Location"
            ];
        } forEach entities "WeaponHolderSimulated";
    }];

} else {
    ["DEBUG:", "Stopped Drawing All Objects", "info", 5 ] call lost_hope_fnc_notificationHint;
    removeAllMissionEventHandlers "Draw3D";
};