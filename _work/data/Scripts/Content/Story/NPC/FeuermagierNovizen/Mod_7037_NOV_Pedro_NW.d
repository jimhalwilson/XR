INSTANCE Mod_7037_NOV_Pedro_NW (Npc_Default) 
{
	// ------ NSC ------
	name 		= "Pedro";
	guild 		= GIL_VLK;
	id 			= 7037;
	voice 		= 9;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: HAUPTSTORY: NOV_600_Pedro ist erst noch immortel -> Pedro klaut das Auge Innos im Kapitel 3, ist sp�ter Knacki auf der Dracheninsel																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] 	= TRUE; //damit du noch ins Kloster kommst, wenn du ihn geschlagen hast
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_PSIONIC", Face_L_Normal_GorNaBar, BodyTex_L, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7037;
};

FUNC VOID Rtn_Start_7037 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
    TA_Stand_Guarding 	(23,00,08,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
};