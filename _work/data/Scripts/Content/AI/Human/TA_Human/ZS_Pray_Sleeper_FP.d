// ********************
// NSC betet an Pray-FP
// ********************

func void ZS_Pray_Sleeper_FP ()
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
		
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};		
};

func int ZS_Pray_Sleeper_FP_Loop ()
{
	if (CurrentLevel != FLIEGENDEINSEL_ZEN)
	{
		if (Npc_IsOnFP (self, "PRAY"))
		{	
			if (!C_BodyStateContains(self, BS_SIT))
			{
				AI_PlayAniBS (self, "T_STAND_2_PRAY", BS_SIT);		
			}
			else
			{
				AI_PlayAniBS (self, "T_PRAY_RANDOM", BS_SIT);
			};		
		}
		else if (Wld_IsFPAvailable(self,"PRAY"))
		{
			AI_GotoFP 		(self, "PRAY");
			AI_StandUp 		(self);
			AI_AlignToFP 	(self);
		};
	}
	else
	{
		if (Npc_IsOnFP (self, "STAND"))
		{	
			if (!C_BodyStateContains(self, BS_SIT))
			{
				AI_PlayAniBS (self, "T_STAND_2_PRAY", BS_SIT);		
			}
			else
			{
				AI_PlayAniBS (self, "T_PRAY_RANDOM", BS_SIT);
			};		
		}
		else if (Wld_IsFPAvailable(self,"STAND"))
		{
			AI_GotoFP 		(self, "STAND");
			AI_StandUp 		(self);
			AI_AlignToFP 	(self);
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Pray_Sleeper_FP_End ()
{
	AI_PlayAni (self, "T_PRAY_2_STAND");	
};


