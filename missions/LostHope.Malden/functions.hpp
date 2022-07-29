class lost_hope
{
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
		class dev_drawIndividualZombies {};
	};

	class loot {
		class loot_spawnLoot {};
		class loot_resetBuildings {};
	};

};