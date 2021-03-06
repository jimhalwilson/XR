instance Mod_1966_GRD_Gardist_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_GARDIST; 
	guild 		= GIL_OUT;
	id 			= 1966;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MT_GARDIST;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N,grd_armor_m);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1966;
};

FUNC VOID Rtn_Start_1966()
{	
	TA_Stand_ArmsCrossed	(05,00,20,00,"OW_WOODRUIN_WOLF_SPAWN");
	TA_Stand_ArmsCrossed			(20,00,03,50,"OW_WOODRUIN_WOLF_SPAWN");
    TA_Stand_ArmsCrossed			(03,50,05,00,"OW_WOODRUIN_WOLF_SPAWN");
};
