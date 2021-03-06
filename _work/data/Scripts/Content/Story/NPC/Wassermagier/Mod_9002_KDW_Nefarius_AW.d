INSTANCE Mod_9002_KDW_Nefarius_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nefarius";
	guild 		= GIL_NOV; 
	id 			= 9002;
	voice 		= 5;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMW_Addon_Stab03);																
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_P_NormalBart_Nefarius, BodyTex_P, ITAR_KDW_L_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_9002;
};

FUNC VOID Rtn_Start_9002 ()
{	
	TA_Study_WP	(06,50,07,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(07,50,08,35,"PORTALTEMPEL");
	TA_Study_WP	(08,35,09,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(09,50,10,45,"PORTALTEMPEL");
	TA_Study_WP	(10,45,11,15,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(11,15,12,50,"PORTALTEMPEL");

	TA_Study_WP	(12,50,13,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(13,50,14,35,"PORTALTEMPEL");
	TA_Study_WP	(14,35,15,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(15,50,16,45,"PORTALTEMPEL");
	TA_Study_WP	(16,45,17,15,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(17,15,18,50,"PORTALTEMPEL");

	TA_Study_WP	(18,50,19,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(19,50,20,35,"PORTALTEMPEL");
	TA_Study_WP	(20,35,21,50,"ADW_ENTRANCE_PLATEAU_11A");
	TA_Study_WP	(21,50,22,00,"PORTALTEMPEL");

	TA_Smalltalk 	(22,00,06,50,"ADW_ENTRANCE_BUILDING2_03");
};

FUNC VOID Rtn_Plagegeister_9002 ()
{	
	TA_Smalltalk 	(06,50,22,00,"ADW_ENTRANCE_BUILDING2_03");
	TA_Smalltalk 	(22,00,06,50,"ADW_ENTRANCE_BUILDING2_03");
};

FUNC VOID Rtn_InTempel_9002 ()
{	
	TA_Study_WP	(12,50,13,50,"ADW_PORTALTEMPEL_03B");
	TA_Study_WP	(13,50,12,50,"ADW_PORTALTEMPEL_03B");
};