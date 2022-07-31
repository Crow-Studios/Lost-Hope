params ["_text", "_effect", "_time"];

titleText [_text, _effect, _time];

diag_log format["SCREENTOBLACK: %1, %2, %3",_text, _effect, _time];

uiSleep (_time + 1);

titleText ["", "BLACK IN", 1];