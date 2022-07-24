	// Civ
class lost_hope_vanilla_civilians
{
	class lost_hope_unit
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
		type = 4;
	};
	class lost_hope_melee
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
		type = 3;
	};
	class lost_hope_armed
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
// Police
class lost_hope_vanilla_police
{
	class lost_hope_police_CBRN
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
	class lost_hope_police
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