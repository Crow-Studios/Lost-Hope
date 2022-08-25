class lost_hope
{
	class UI {
		class openHUD {};
	};
	
	class init {
		class spawn_initServer {};
		class spawn_initPlayerLocal {};
		class spawn_initPlayer {};
		class spawn_modConflicts {};
		class spawn_setVariables {};
	};

	class core {
		class holdAction {};
		class zombieCleanup {};
		class bodyCleanup {};
		class notificationHint {};
		class playBoatAnimation {};
		class createCamera {};
		class screenToBlack {};
		class modsLoaded {};
		class getConfig {};
	};

	class marker {
		class getClosestMarker {};
		class returnClosestMarker {};
		class getMarkerDistance {};
		class markerSetup {};
		class resetMarkerTime {};
		class inMarker {};
		class getMarkers {};
		class traderSetup {};
	};

	class spawn {
		class setLoadout {};
		class spawnUnit {};
	};

	class zombie {
		class ambientZombie {};
		class convertUnitToZombie {};
		class spawnZombie {};
		class spawnHorde {};
		class spawnHerd {};
	};

	class DEV {
		class dev_drawLootLocations {};
		class dev_drawZombieLocations {};
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
		class canSpawnAirdrop {};
		class airdropPlayer {};
		class airdropRandom {};
	};

	class task {
		class deleteTask {};
		class setTaskState {};
	};

	class weaponShop {
		class openShopDialog {};
		class getWeapons {}; 
		class displaySelectedItem {};
		class getCategories {};
		class buyWeapon {};
	};
	class traderTasksSystem {
		class OpenTraderDialog {};
	};
};