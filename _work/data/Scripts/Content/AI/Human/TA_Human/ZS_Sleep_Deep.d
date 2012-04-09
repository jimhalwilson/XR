// **********
// ZS_GotoBed
// **********

func void ZS_GotoBed_Deep ()					//wichtig, damit Sleep-Wahrnehmungen erst aktiv werden, wenn NSC im Bett liegt
{
	Perception_Set_Betrunken();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
	AI_StartState		(self, ZS_Sleep_Deep, 0, "");
	return;
};

// *****************
// B_AssessSleepTalk
// *****************
/*
steht in normalen Sleep

func void B_AssessSleepTalk()
{
	//B_Say (self, other, "$YOUDISTURBEDMYSLUMBER"); //kommt sonst doppelt
	
	if (C_BodyStateContains(self, BS_LIE))
	{
		AI_UseMob (self, "BEDHIGH"	, -1);
	};
	
	AI_StartState (self, ZS_ObservePlayer, 0, "");
};
*/

// ********
// ZS_Sleep
// ********

func void ZS_Sleep_Deep ()
{
	//Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound			); //geht in ZS_ObservePlayer
	Npc_PercEnable		(self, 	PERC_ASSESSDAMAGE 		, 	B_AssessDamage				);
	Npc_PercEnable 		(self, 	PERC_ASSESSTALK 		, 	B_AssessSleepTalk			);
	
	AI_SetWalkmode 		(self, NPC_WALK);
	
	
};
		
func int ZS_Sleep_Deep_Loop ()	
{
	if (!C_BodyStateContains(self, BS_LIE))
	{
		if (Wld_IsMobAvailable(self,"BEDHIGH"))
		{
			AI_UseMob (self, "BEDHIGH", 1);
		}
		else
		{
			if (Player_GetOutOfMyBedComment == FALSE)
			&& (C_BodyStateContains(hero, BS_LIE))
			&& (Npc_GetDistToNpc (self, hero) <= 500)
			{
				B_TurnToNpc (self, hero);
				B_Say (self, other, "$GETOUTOFMYBED");
				Player_GetOutOfMyBedComment = TRUE;
			};
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Sleep_Deep_End()
{
	if (!Npc_IsInPlayersRoom (self))
	{
		B_Say (self, self, "$AWAKE");
	};
	
	AI_UseMob (self, "BEDHIGH"	, -1);
};
