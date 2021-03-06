instance Mod_7169_OUT_Mann_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mann";
	guild 		= GIL_OUT;
	id 			= 7169;
	voice 		= 3;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P, ITAR_Vlk_02);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh�ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 0); //Grenzen f�r Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7169;
};

FUNC VOID Rtn_PreStart_7169 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_FARM2_HOUSE_IN_05");
  	TA_Stand_Guarding		(22,00,08,00,"NW_FARM2_HOUSE_IN_05");
};

FUNC VOID Rtn_AtDemon_7169 ()
{	
	TA_Practice_Sword		(08,00,22,00,"NW_CASTLEMINE_HUT_03");
  	TA_Practice_Sword		(22,00,08,00,"NW_CASTLEMINE_HUT_03");
};

FUNC VOID Rtn_AtBengar_7169 ()
{	
	TA_Rake_FP		(08,00,22,00,"NW_FARM3_FIELD_03");
  	TA_Sit_Campfire		(22,00,08,00,"NW_FARM3_STABLE_REST_02");
};

FUNC VOID Rtn_AtTaverne_7169()
{	
	TA_Sit_Chair		(20,00,08,00,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Sit_Chair		(08,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");
};