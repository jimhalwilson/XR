INSTANCE Mod_1547_PIR_Henry_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Henry";
	guild 		= GIL_out;
	id 			= 1547;
	voice 		= 4;
	flags       = FALSE;												
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	EquipItem (self, ItMw_Krummschwert); 
	
	// ------ Inventory ------
	// H�ndler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal01, BodyTex_P, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1547;
};

FUNC VOID Rtn_Start_1547 ()
{	
	TA_Practice_Sword	(05,00,20,00,"WP_DI_HENRY_PRACTICE_SWORD");
	TA_Practice_Sword	(20,00,05,00,"WP_DI_HENRY_PRACTICE_SWORD");
};