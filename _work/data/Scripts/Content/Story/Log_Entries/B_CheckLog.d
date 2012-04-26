// ***************************************************
//  	B_CheckLog ()	
// ***************************************************

func void B_CheckLog ()	
{	
};

FUNC VOID B_StartMangel()
{
	if (Mod_Pat_MangelStarted == 0)
	{
		Log_CreateTopic	(TOPIC_MOD_FM_MANGEL, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_FM_MANGEL, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Durch die lange Belagerung fehlt es in Patherion an vielen Dingen.");

		Mod_Pat_MangelStarted = 1;
	};
};

FUNC VOID B_StopMangel()
{
	if (Mod_Pat_MangelStarted == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Furgas_MangelQuest2))
	{
		B_SetTopicStatus	(TOPIC_MOD_FM_MANGEL, LOG_SUCCESS);
		B_LogEntry	(TOPIC_MOD_FM_MANGEL, "Durch die lange Belagerung fehlt es in Patherion an vielen Dingen.");

		Mod_Pat_MangelStarted = 2;
	};
};