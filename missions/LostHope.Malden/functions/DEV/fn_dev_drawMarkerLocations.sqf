params ["_draw"];

if (_draw) then {

    ["DEBUG:", "Started Drawing Markers", "info", 5 ] call lost_hope_fnc_notificationHint;
    _drawIcon_Marker = addMissionEventHandler ["Draw3D",
    {
        {
            private _markerPos = getMarkerPos _x;
            private _playerPos = getPosATL player;
            if (_markerPos distance player <= 1000) then {
                drawIcon3D 
                [
                    "a3\ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    ([_markerPos select 0 ,_markerPos select 1, 100]),
                    2.7,2.7,0, // Text size, multiple of 9
                    "Marker Area"
                ];
                drawIcon3D
                [
                    "",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,1,1,1], [1,1,1,1]],
                    ([_markerPos select 0, _markerPos select 1, 100]),
                    0.9,0.9,0, // Text size, multiple of 9
                    format ["Can Run Marker Scripts: %1", missionNamespace getVariable [("Lost_Hope_Marker"+_x+"CanRun"), false]]
                ];
                drawIcon3D
                [
                    "",
                    //"a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                    [[1,0,0,1], [1,1,1,1]],
                    ([_markerPos select 0, _markerPos select 1, 100]),
                    1.8,1.8,0, // Text size, multiple of 9
                    format ["Marker Type: %1", _x]
                ];
            };
            // drawLine3D 
            // [
            //     [_playerPos select 0, _playerPos select 1, 1.7],
            //     [_markerPos select 0, _markerPos select 1, 100],
            //     [1,1,1,1]
            // ];
        } forEach allMapMarkers;
    }];

} else {
    ["DEBUG:", "Stopped Drawing All Objects", "info", 5 ] call lost_hope_fnc_notificationHint;
    removeAllMissionEventHandlers "Draw3D";
};