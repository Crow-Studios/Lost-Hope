/*
*	Author: Silence
*	Description: Converts unit to zombie, preserves loadout
*
*	Arguments:
*	0: _unit 		<OBJECT> - Unit you want to run this on
*	1: _type		<INTEGER> - 0-1000 (not a hard limit, just general idea)
*	Return Value: Array - [entity, name of entity, AI type, loadout]

* Types:
*    1 - Crawler
*    2 - Walker
*    3 - Shambler
*    4 - Runner (Calm)
*    5 - Runner (Angry)
*    6 - Triggerman
*/

params ["_unit", "_type"];

result = [];

[_unit, _type] call WBK_LoadAIThroughEden;

uiSleep 0.5;

private _anim = selectRandom ["WBK_Middle_GetUpUnconscious", "WBK_Crawler_To_Idle"];

unit switchMove _anim;
unit playMoveNow _anim;

result append [_unit, name _unit, _type];

result