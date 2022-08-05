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
	class weaponShop {
		class openShopDialog {};
		class getWeapons {}; 
		class displaySelectedItem {};
		class getCategories {};
	};
};