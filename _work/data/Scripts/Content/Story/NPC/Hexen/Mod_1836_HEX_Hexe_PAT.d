instance Mod_1836_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_hexe;
	guild 		= GIL_strf;
	id 			= 1836;
	voice 		= 17;
	flags       = 0;																	
	npctype		= NPCTYPE_pat_hexe;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	//EquipItem (self, ItMw_1h_Vlk_Dagger);
	// ------ visuals ------																						
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_OldBrown, BodyTex_N, ITAR_hexe);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1836;
};

FUNC VOID Rtn_Start_1836 ()
{	
	TA_Stand_wp		(07,00,13,00,"WP_PAT_LAGER_06_15");
	TA_Stand_wp		(13,00,07,00,"WP_PAT_LAGER_06_15");	
};
