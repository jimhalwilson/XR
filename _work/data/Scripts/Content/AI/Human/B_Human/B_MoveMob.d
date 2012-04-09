// *********
// B_MoveMob
// *********

func void B_MoveMob ()
{	
	var string door; door = Npc_GetDetectedMob(self);

	B_Vergiftet (self);
	
	if (Hlp_StrCmp (door, "DOOR"))
	{
		if (Wld_GetMobState (self,door) == 0)
		{
			Npc_ClearAIQueue (self);
		
			AI_UseMob (self, door, 1);
			AI_UseMob (self, door, -1);		//NSC muss sich am Mobsi abmelden, da sonst die T�r wieder zu geht!
		};
	}
	else
	{
		return;
	};

	AI_ContinueRoutine (self);
};
