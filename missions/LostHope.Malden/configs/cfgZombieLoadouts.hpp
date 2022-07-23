	// Civ
	class lost_hope_zombie_vanilla_civilians
	{
		class lost_hope_zombie
		{
			primary[] = {""};
			secondary[] = {""};
			uniform[] = {"U_C_Journalist", "U_C_Poloshirt_redwhite", "U_C_Poloshirt_burgundy", "U_Marshal"};
			vest[] = {""};
			backpack[] = {"B_LegStrapBag_black_F", "B_Messenger_Black_F", "B_Messenger_IDAP_F"};
			headgear[] = {"H_Watchcap_blk", "H_Booniehat_tan", "H_Cap_blk", "H_Cap_surfer", "H_Hat_tan"};
			facewear[] = {"G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "None"};
			nvg = "";
			binoculars = "Binocular";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.2;
			type = 3;
		};
		class lost_hope_zombie_melee
		{
			primary[] = {""};
			secondary[] = {"Knife_m3", "Knife_kukri", "Shovel_Russian_Rotated", "WBK_SmallHammer"};
			uniform[] = {"U_C_Poloshirt_tricolour", "U_C_WorkerCoveralls", "U_C_Poor_1", "U_OrestesBody"};
			vest[] = {""};
			backpack[] = {"GoG_HolsterSwordVestBack"};
			headgear[] = {"H_Cap_marshal", "H_MilCap_blue", "H_Shemag_olive", "H_StrawHat_dark", "H_Hat_tan"};
			facewear[] = {"G_Respirator_yellow_F", "G_Blindfold_01_black_F", "G_Sport_Checkered", "None"};
			nvg = "";
			binoculars = "Binocular";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.1;
			type = 4;
		};
		class lost_hope_zombie_triggerman
		{
			primary[] = {"sgun_HunterShotgun_01_F"};
			secondary[] = {""};
			uniform[] = {"U_BG_leader", "U_C_Poor_1", "U_OrestesBody"};
			vest[] = {"V_Rangemaster_belt", "V_BandollierB_blk", "V_Chestrig_blk"};
			backpack[] = {"B_Static_Designator_01_weapon_F", "I_E_HMG_01_A_Weapon_F", "B_SCBA_01_F", "I_E_HMG_01_support_F"};
			headgear[] = {"H_Cap_marshal", "H_MilCap_blue", "H_Shemag_olive", "H_StrawHat_dark", "H_Hat_tan"};
			facewear[] = {"G_Respirator_yellow_F", "G_RegulatorMask_F", "None"};
			nvg = "";
			binoculars = "Binocular";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.3;
			type = 6;
		};
	};
	// Civ (Farmers)
	class lost_hope_zombie_vanilla_farmers
	{
		class lost_hope_zombie_farmer
		{
			primary[] = {""};
			secondary[] = {""};
			uniform[] = {"U_BG_Guerilla3_1", "U_BG_Guerilla2_3", "U_Marshal"};
			vest[] = {""};
			backpack[] = {"B_LegStrapBag_black_F", "B_Messenger_Black_F", "B_Messenger_IDAP_F"};
			headgear[] = {"H_Watchcap_blk", "H_Booniehat_tan", "H_Cap_blk", "H_Cap_surfer", "H_Hat_tan"};
			facewear[] = {"G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "None"};
			nvg = "";
			binoculars = "Binocular";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.2;
			type = 2;
		};
		class lost_hope_zombie_farmer_triggerman
		{
			primary[] = {"sgun_HunterShotgun_01_F"};
			secondary[] = {""};
			uniform[] = {"U_C_HunterBody_grn", "U_OrestesBody", "U_C_WorkerCoveralls"};
			vest[] = {"V_Rangemaster_belt", "V_BandollierB_blk", "V_Chestrig_blk"};
			backpack[] = {""};
			headgear[] = {"H_Cap_marshal", "H_MilCap_blue", "H_StrawHat_dark", "H_Hat_tan"};
			facewear[] = {"G_Respirator_yellow_F", "G_RegulatorMask_F", "None"};
			nvg = "";
			binoculars = "Binocular";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.4;
			type = 6;
		};
	};
	// Police
	class lost_hope_zombie_vanilla_police
	{
		class lost_hope_zombie_police_CBRN_triggerman
		{
			primary[] = {"arifle_MX_Black_F", "SMG_03C_black"};
			secondary[] = {""};
			uniform[] = {"U_C_CBRN_Suit_01_Blue_F", "U_C_CBRN_Suit_01_White_F"};
			vest[] = {"V_CarrierRigKBT_01_light_Olive_F", "V_LegStrapBag_black_F", "V_CarrierRigKBT_01_heavy_Olive_F"};
			backpack[] = {"B_Static_Designator_01_weapon_F", "B_SCBA_01_F", "I_E_HMG_01_support_F"};
			headgear[] = {"H_Cap_marshal", "H_MilCap_blue", "H_Shemag_olive", "H_StrawHat_dark", "H_Hat_tan"};
			facewear[] = {"G_Respirator_yellow_F", "G_RegulatorMask_F", "None"};
			nvg = "";
			binoculars = "Binocular";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.6;
			type = 6;
		};
		class lost_hope_zombie_police
		{
			primary[] = {"hgun_PDW2000_F", "sgun_HunterShotgun_01_sawedoff_F"};
			secondary[] = {""};
			uniform[] = {"U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"};
			vest[] = {"V_Rangemaster_belt", "V_TacVest_blk_POLICE", "V_Press_F"};
			backpack[] = {"B_Messenger_Gray_F", "B_CivilianBackpack_01_Everyday_Vrana_F"};
			headgear[] = {"H_MilCap_gen_F", "H_Beret_gen_F"};
			facewear[] = {"G_Respirator_yellow_F", "G_Respirator_blue_F", "None"};
			nvg = "";
			binoculars = "Binocular";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.4;
			type = 5;
		};
	};

	// Military
	class lost_hope_zombie_vanilla_military
	{
		class lost_hope_zombie_military_private_triggerman
		{
			primary[] = {"arifle_TRG20_F", "arifle_Mk20_F"};
			secondary[] = {"dev_weapon_scanner"};
			uniform[] = {"U_B_CombatUniform_mcam", "U_B_CTRG_3", "U_B_CombatUniform_mcam_tshirt"};
			vest[] = {"V_PlateCarrier1_blk", "V_PlateCarrier1_rgr", "V_PlateCarrierL_CTRG", "V_PlateCarrierIA2_dgtl", "V_CarrierRigKBT_01_heavy_Olive_F"};
			backpack[] = {"B_SCBA_01_F", "B_TacticalPack_ocamo", "B_TacticalPack_mcamo"};
			headgear[] = {"H_HelmetHBK_headset_F", "H_HelmetHBK_ear_F", "H_HelmetB_light_snakeskin", "H_CrewHelmetHeli_B", "H_HelmetSpecB_snakeskin"};
			facewear[] = {"G_AirPurifyingRespirator_02_black_F", "G_RegulatorMask_F", "G_Balaclava_blk"};
			nvg = "";
			binoculars = "Rangefinder";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.7;
			type = 6;
		};
		class lost_hope_zombie_military_private
		{
			primary[] = {"arifle_TRG20_F", "arifle_Mk20_F"};
			secondary[] = {""};
			uniform[] = {"U_B_CombatUniform_mcam", "U_B_CTRG_3", "U_B_CombatUniform_mcam_tshirt"};
			vest[] = {"V_PlateCarrier1_blk", "V_PlateCarrierL_CTRG", "V_CarrierRigKBT_01_heavy_Olive_F"};
			backpack[] = {"B_TacticalPack_mcamo"};
			headgear[] = {"H_HelmetHBK_ear_F", "H_HelmetB_light_snakeskin", "H_HelmetSpecB_snakeskin"};
			facewear[] = {"G_AirPurifyingRespirator_02_black_F", "G_RegulatorMask_F", "G_Balaclava_blk"};
			nvg = "";
			binoculars = "Rangefinder";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.5;
			type = 5;
		};
		class lost_hope_zombie_military_sergeant_triggerman
		{
			primary[] = {"arifle_MX_SW_F", "arifle_Katiba_GL_F"};
			secondary[] = {""};
			uniform[] = {"U_B_GhillieSuit", "U_B_CTRG_1", "U_I_OfficerUniform"};
			vest[] = {"V_PlateCarrier1_blk", "V_PlateCarrier1_rgr", "V_PlateCarrierL_CTRG", "V_PlateCarrierIA2_dgtl", "V_CarrierRigKBT_01_heavy_Olive_F"};
			backpack[] = {"B_SCBA_01_F", "B_TacticalPack_ocamo", "B_TacticalPack_mcamo"};
			headgear[] = {"H_HelmetHBK_headset_F", "H_HelmetHBK_ear_F", "H_HelmetB_light_snakeskin", "H_CrewHelmetHeli_B", "H_HelmetSpecB_snakeskin"};
			facewear[] = {"G_AirPurifyingRespirator_02_black_F", "G_RegulatorMask_F", "G_Balaclava_blk"};
			nvg = "";
			binoculars = "Rangefinder";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.9;
			type = 6;
		};
		class lost_hope_zombie_military_sergeant
		{
			primary[] = {""};
			secondary[] = {"dev_weapon_scanner"};
			uniform[] = {"U_B_GhillieSuit", "U_B_CTRG_1", "U_I_OfficerUniform"};
			vest[] = {"V_PlateCarrier1_blk", "V_PlateCarrier1_rgr", "V_PlateCarrierL_CTRG", "V_PlateCarrierIA2_dgtl", "V_CarrierRigKBT_01_heavy_Olive_F"};
			backpack[] = {"B_SCBA_01_F", "B_TacticalPack_ocamo"};
			headgear[] = {"H_PilotHelmetHeli_O", "H_HelmetSpecB_snakeskin"};
			facewear[] = {"G_AirPurifyingRespirator_02_black_F", "G_RegulatorMask_F", "G_Balaclava_blk"};
			nvg = "";
			binoculars = "";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 0.9;
			type = 6;
		};
		class lost_hope_zombie_military_pilot
		{
			primary[] = {""};
			secondary[] = {""};
			uniform[] = {"U_B_PilotCoveralls", "U_I_pilotCoveralls", "U_B_HeliPilotCoveralls"};
			vest[] = {""};
			backpack[] = {""};
			headgear[] = {"H_CrewHelmetHeli_B", "H_PilotHelmetHeli_O"};
			facewear[] = {"G_AirPurifyingRespirator_02_black_F", "G_RegulatorMask_F", "G_Bandanna_beast"};
			nvg = "ACE_NVG_Gen1";
			binoculars = "";
			map = "ItemMap";
			terminal = "ItemGPS";
			navigation = "ItemCompass";
			watch = "ItemWatch";
			chance = 1;
			type = 1;
		};
	};