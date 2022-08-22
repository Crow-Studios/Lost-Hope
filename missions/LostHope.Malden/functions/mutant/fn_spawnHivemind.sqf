/*
*	Author: Silence
*	Description: Spawns hivemind
*   Params are quite simple
*/

params ["_classname", "_position", "_side"];

if (hivemindGroup isEqualTo grpNull) then {
    hivemindGroup = createGroup [_side, true];
};

_classname createUnit [_position, hivemindGroup, "hivemind = this"];

hivemind setVariable ["isZombie", true, true];
hivemind setVariable ["canDelete", false, true];

hivemind