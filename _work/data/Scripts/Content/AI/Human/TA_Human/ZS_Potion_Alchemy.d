// *************************
// NSC benutzt Alchemietisch
// *************************

FUNC VOID ZS_Potion_Alchemy ()
{	
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self,NPC_WALK);
		
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
	if (Npc_HasItems (self,ItMi_Flask) == 0)
	{
		CreateInvItem (self,ItMi_Flask);				
	};
};

FUNC int ZS_Potion_Alchemy_Loop ()
{
	// ------ SK: Sollte schon f�r das neue Mobsi funzen ------
	// ------ Alchemie-Tisch benutzen ------

	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"LAB"))
	{
		AI_UseMob (self, "LAB", 1);		
	};
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Potion_Alchemy_End ()
{
	AI_UseMob (self, "LAB", -1);
};


