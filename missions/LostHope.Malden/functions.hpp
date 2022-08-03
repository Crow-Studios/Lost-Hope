class lost_hope
{
	class UI {
		class openHUD {};
		class playerList {};
		class executeFunction {};
		class GUI {};
		class admin {};
	};
	
	class init {
		class spawn_initServer {};
		class spawn_initPlayerLocal {};
	};

	class core {
		class holdAction {};
		class zombieCleanup {};
		class notificationHint {};
		class playBoatAnimation {};
		class createCamera {};
		class screenToBlack {};
	};

	class marker {
		class getClosestMarker {};
		class returnClosestMarker {};
		class getMarkerDistance {};
		class markerSetup {};
		class resetMarkerTime {};
		class inMarker {};
		class getMarkers {};
	};

	class spawn {
		class setLoadout {};
		class spawnUnit {};
	};

	class zombie {
		class convertUnitToZombie {};
		class spawnZombie {};
		class spawnHorde {};
		class spawnHerd {};
	};

	class DEV {
		class dev_drawLootLocations {};
		class dev_drawZombieLocations {};
	};

	class admin {
		class adminPlayerFreeze {};
		class adminFreezeTarget {};
		class teleportTargetToMe {};
		class teleportMeToTarget {};
		class ejectTarget {};
		class ejectCrew {};
		class healTarget {};
		class massHeal {};
		class moveMeIn {};
		class moveInMe {};
		class removeGear {};
		class adminRestrain {};
		class adminUnrestrain {};
		class adminInvisibility {};
		class godMode {};
		class cloneGear {};
		class cloneToTarget {};
		class stopTracing {};
		class traceBullets {};
		class disconnect {};
		class endMission {};
		class setAmmo {};
		class noRec {};
		class fastFire {};
		class esp {};
	};

	class loot {
		class loot_spawnLoot {};
		class loot_resetBuildings {};
	};

	class mutant {
		class spawnMutant {};
		class spawnHivemind {};
	};

	class events {
		class canCancelEvent {};
		class hasEventFinished {};
		class traderInfested {};
		class traderTakeOver {};
		class canSpawnEvent {};
	};

	class task {
		class deleteTask {};
		class setTaskState {};
	};

};