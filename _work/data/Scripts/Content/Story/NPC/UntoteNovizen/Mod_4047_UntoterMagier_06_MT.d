instance Mod_4047_UntoterMagier_06_MT (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Untoter Magier";
	Npctype 		=		Npctype_UNTOTERMAGIER;
	guild 		=		GIL_STRF;
	level 		=		20;
	 	
	voice 		=		2;
	id 			=		4047;
		
	//-------- abilities --------
	B_SetAttributesToChapter	(self, 4);


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 15, 0,"Hum_Head_FatBald", 201,  1, ITAR_UntoterMagier);

	Mdl_SetModelFatness(self,0);
	
	B_SetFightSkills	(self, 65);
	B_CreateAmbientInv 	(self);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
	
		
	//-------- inventory --------

	        
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4047;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_4047 ()
{
	TA_Stand_WP	(02,00,08,00,"PALTO_26");
	TA_Stand_WP	(08,00,02,00,"PALTO_26"); 
};