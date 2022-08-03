/*
*	Author: Silence
*	Description: Spawns hivemind
*   Params are quite simple
*/

params ["_position", "_side"];

"dev_hivemind_o" createUnit [_position, hivemindGroup, "hivemind = this"];

hivemind setVariable ["isZombie", true];
hivemind setVariable ["canDelete", false];