const string EchseWache_01_Checkpoint	= "ADW_PATH_TO_BL_09_B";	//WP hinter City-Tor vom Spielstart aus!

instance Info_Mod_EchseWache_01_FirstWarn (C_INFO)
{
	npc		= Mod_12000_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_01_FirstWarn_Condition;
	information	= Info_Mod_EchseWache_01_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int Info_Mod_EchseWache_01_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(hero, EchseWache_01_Checkpoint) <= 1300) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void Info_Mod_EchseWache_01_FirstWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_EchseWache_01_FirstWarn_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, EchseWache_01_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;

	if (Npc_KnowsInfo(hero, Info_Mod_Neku_Hi))
	&& (Mod_ArgezSpawn == FALSE)
	{
		AI_StopProcessInfos	(self);

		AI_GotoWP	(hero, "ADW_PATH_TO_BL_10");

		AI_Teleport (PC_Friend_AW, "ADW_PATH_TO_BL_10");
		B_StartOtherRoutine (PC_Friend_AW, "ATECHSEN");

		Mod_ArgezSpawn = TRUE;
	};
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE Info_Mod_EchseWache_01_SecondWarn (C_INFO)
{
	npc		= Mod_12000_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_01_SecondWarn_Condition;
	information	= Info_Mod_EchseWache_01_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_EchseWache_01_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)	== TRUE)
	&& (Npc_GetDistToWP(hero, EchseWache_01_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50))) 
	{
		return TRUE;
	};
};

func void Info_Mod_EchseWache_01_SecondWarn_Info()
{
	AI_Output (self, hero,"Info_Mod_EchseWache_01_SecondWarn_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.

	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP (hero,EchseWache_01_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE Info_Mod_EchseWache_01_Attack (C_INFO)
{
	npc		= Mod_12000_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_01_Attack_Condition;
	information	= Info_Mod_EchseWache_01_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT Info_Mod_EchseWache_01_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
	&& (Npc_GetDistToWP(hero,EchseWache_01_Checkpoint) < (hero.aivar[AIV_LastDistToWP]-50)))
	{
		return TRUE;
	};
};

func void Info_Mod_EchseWache_01_Attack_Info()
{
	hero.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, hero,"Info_Mod_EchseWache_01_Attack_23_00"); //Schhhhhhhhhhhhhhhhhhhhhhhhhzzz.

	AI_StopProcessInfos	(self);	

	B_Attack (self, hero, AR_GuardStopsIntruder, 0); 
};

INSTANCE Info_Mod_EchseWache_01_EXIT (C_INFO)
{
	npc		= Mod_12000_DRA_Wache_AW;
	nr		= 1;
	condition	= Info_Mod_EchseWache_01_EXIT_Condition;
	information	= Info_Mod_EchseWache_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_EchseWache_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_EchseWache_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};