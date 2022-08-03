class levels {
	class rank4 {
		Name = "Developer";
		level = 4;
		function[] =  {"TPtargetToMe", "TPmeToTarget", "EjectTarget", "EjectCrew", "FreezeTarget", "HealTarget", "MassHeal", "MoveInTarget", "MoveTargetIn", "removeGear", "RestrainTarget", "UnrestrainTarget", "playerFreeze", "ESP", "Invisiblilty", 
		"MapMarkers", "GodMode", "setAmmo", "noRec", "fastFire", "CloneGear", "CloneToTarget", "StopTracing", "TraceBullets", "SelfDisconnect", "ForceDisconnect", "endMission"};
	};

	class rank3 {
		Name = "MDev";
		level = 3;
		function[] =  {"TPtargetToMe", "TPmeToTarget", "ESP", "Invisiblilty", 
		"MapMarkers", "GodMode", "setAmmo", "noRec", "fastFire", "CloneGear", "CloneToTarget", "StopTracing", "TraceBullets", "SelfDisconnect"};
	};

	class rank2 {
		Name = "Admin";
		level = 2;
		function[] =  {"TPtargetToMe", "TPmeToTarget", "EjectTarget", "EjectCrew", "FreezeTarget", "HealTarget", "MoveInTarget", "MoveTargetIn", "removeGear", "RestrainTarget", "UnrestrainTarget", "playerFreeze", "ESP", "Invisiblilty", 
		"MapMarkers", "GodMode", "CloneGear", "CloneToTarget", "StopTracing", "TraceBullets", "SelfDisconnect", "ForceDisconnect"};
	};

	class rank1 {
		Name = "Tester";
		level = 1;
		function[] =  {"TPtargetToMe", "TPmeToTarget", "ESP", "Invisiblilty", 
		"MapMarkers", "GodMode", "StopTracing", "TraceBullets", "SelfDisconnect"};
	};
};

/*{"FUNCTION NAME", "Function Variable", "Display Name", scheduled?, onSelectedPlayer?}*/
class functions {
	functionArray[] = {
		{"lost_hope_fnc_teleportTargetToMe", "TPtargetToMe", "TP Target to Me", 0, 1},
		{"lost_hope_fnc_teleportMeToTarget", "TPmeToTarget", "TP Me to Target", 0, 1},
		{"lost_hope_fnc_ejectTarget", "EjectTarget", "Eject Target", 0, 1},
		{"lost_hope_fnc_ejectCrew", "EjectCrew", "Eject Crew", 0, 1},
		{"lost_hope_fnc_adminFreezeTarget", "FreezeTarget", "Freeze/Unfreeze Target", 0, 1},
		{"lost_hope_fnc_healTarget", "HealTarget", "Heal Target", 0, 1},
		{"lost_hope_fnc_massHeal", "MassHeal", "Mass Revive", 0, 0},
		{"lost_hope_fnc_moveMeIn", "MoveInTarget", "Move in Target Vehicle", 0, 1},
		{"lost_hope_fnc_moveInMe", "MoveTargetIn", "Move Target in My Vehicle", 0, 1},
		{"lost_hope_fnc_removeGear", "removeGear", "Remove Gear", 0, 1},
		{"lost_hope_fnc_adminRestrain", "RestrainTarget", "Restrain", 0, 1},
		{"lost_hope_fnc_adminUnrestrain", "UnrestrainTarget", "Unrestrain", 0, 1},
	};

	Toggleable[] = {
		{"lost_hope_fnc_ESP", "ESP", "ESP", 1, 0},
		{"lost_hope_fnc_adminInvisibility", "adminInvisiblilty", "Invisibilty", 0, 0},
		{"lost_hope_fnc_godMode", "godMode", "God Mode", 0, 0},
		{"lost_hope_fnc_setAmmo", "setAmmo", "Set Ammo", 0, 0},
		{"lost_hope_fnc_noRec", "noRec", "No Recoil", 0, 0},
		{"lost_hope_fnc_fastFire", "fastFire", "Fast Fire", 0, 0},
	};

	Development[] = {
		{"lost_hope_fnc_cloneGear", "CloneGear", "Clone Gear", 0, 1},
		{"lost_hope_fnc_cloneToTarget", "CloneToTarget", "Clone Gear On Target", 0, 1},
		{"lost_hope_fnc_stopTracing", "StopTracing", "Stop Tracing Bullets", 0, 0},
		{"lost_hope_fnc_traceBullets", "TraceBullets", "Trace Targets Bullets", 0, 1},
		{"lost_hope_fnc_disconnect", "SelfDisconnect", "Self Disconnect", 0, 0},
		{"lost_hope_fnc_disconnect", "ForceDisconnect", "Force Disconnect", 0, 1},
		{"lost_hope_fnc_endMission", "endMission", "End Mission", 0, 1},
	};
};