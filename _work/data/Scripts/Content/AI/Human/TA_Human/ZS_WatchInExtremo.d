
func void zs_WatchInExtremo ()
{
	PrintDebugNpc	(PD_ZS_FRAME,"zs_WatchInExtremo");
	
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode	(self,NPC_WALK);	
	AI_GotoWP		(self, 	self.wp);
	AI_AlignToWP 	(self);	

	AI_PlayAni 		(self, "T_STAND_2_CLAPHANDS");
};

func int zs_WatchInExtremo_Loop ()
{
	PrintDebugNpc				(PD_ZS_LOOP,	"zs_WatchInExtremo_Loop");
    //AI_Wait (self, 1);	
};

func void zs_WatchInExtremo_End ()
{	
	PrintDebugNpc			(PD_ZS_FRAME, "zs_WatchInExtremo_End" );
	AI_PlayAni 				(self, "T_CLAPHANDS_2_STAND");
	AI_ContinueRoutine 		(self);
};