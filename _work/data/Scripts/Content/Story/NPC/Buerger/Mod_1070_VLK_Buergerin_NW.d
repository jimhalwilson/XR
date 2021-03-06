instance Mod_1070_VLK_Buergerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;
	guild 		= GIL_PAL;
	id 			= 1070;
	voice 		= 17;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_L_7);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1070;
};

FUNC VOID Rtn_Start_1070 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"NW_CITY_HABOUR_04");
    TA_Stand_Guarding	(22,00,08,00,"NW_CITY_MERCHANT_SHOP01_IN_01");
};
