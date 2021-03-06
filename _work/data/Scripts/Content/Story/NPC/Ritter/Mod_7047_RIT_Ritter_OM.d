instance Mod_7047_RIT_Ritter_OM (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Ritter;
	guild 		= GIL_PAL;
	id 			= 7047;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	aivar[AIV_Partymember] = TRUE;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_P_NormalBald, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7047;
};

FUNC VOID Rtn_Start_7047 ()
{	
	TA_Follow_Player		(08,00,21,00,"OM_122");
	TA_Follow_Player		(21,00,08,00,"OM_122");
};

FUNC VOID Rtn_Tot_7047 ()
{
	TA_Sleep		(08,00,21,00,"TOT");
	TA_Sleep		(21,00,08,00,"TOT");
};