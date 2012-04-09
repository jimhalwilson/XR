instance Mod_7641_BUD_Buddler_MT (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Buddler;
	npctype =						NPCTYPE_mt_buddler;
	guild =							GIL_out;      
	level =							2;

	voice =							2;
	id =							7641;


	//-------- abilities --------
	B_SetAttributesToChapter	(self, 1);

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Thief", 74,  1, VLK_ARMOR_L);

	Mdl_SetModelFatness (self, 0);
    	
 	fight_tactic	=	FAI_HUMAN_COWARD;

	CreateInvItems	(self, ItMw_SentenzaRost, 1);

	//-------- Talents --------                                    
	B_SetFightSkills	(self, 10);
	
	//-------- inventory --------                                    
	B_CreateAmbientInv	(self);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_7641;
};

FUNC VOID Rtn_start_7641 ()
{
	TA_Stand_WP	(22,00,06,30,"OW_PATH_07_15_CAVE3");
	TA_Stand_WP	(06,30,22,00,"OW_PATH_07_15_CAVE3");
};










