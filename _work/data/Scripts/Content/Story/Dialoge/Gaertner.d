INSTANCE Info_Mod_Gaertner_Hi (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Hi_Condition;
	information	= Info_Mod_Gaertner_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Gaertner_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaertner_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gaertner_Hi_09_01"); //Ich bin hier der G�rtner. Meine Aufgabe ist es mich um die Pflanze im oberen Viertel zu k�mmern.
	AI_Output(self, hero, "Info_Mod_Gaertner_Hi_09_02"); //Ich kann dir auch ein paar davon verkaufen.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Der G�rtner aus dem oberen Viertel kann mir ein paar Pflanzen verkaufen.");
};

INSTANCE Info_Mod_Gaertner_Dieb (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Dieb_Condition;
	information	= Info_Mod_Gaertner_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was macht die Arbeit?";
};

FUNC INT Info_Mod_Gaertner_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_AndreFertig))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_00"); //Was macht die Arbeit?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_01"); //Viel zu viel Unkraut, aber ansonsten kann ich nicht klagen.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_02"); //Und was hast du heute schon mitgehen gelassen?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_03"); //Oh ...
	AI_PlayAni (hero, "T_YES");
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_04"); //Hast du mir einen Schreck eingejagt. Bin nicht immer auf dem neustem Stand, aber du kommst mir gerade recht.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_05"); //Was gibt's zu tun?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_06"); //Der H�ndler Salandril besitzt einige wertvolle Tr�nke. Bring mir einen, aber du musst aufpassen, er traut keinem �ber den Weg und ist immer wachsam.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_07"); //Ich werd's versuchen.
	
	Log_CreateTopic	(TOPIC_MOD_DIEB_SALANDRIL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_SALANDRIL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_SALANDRIL, "Der G�rtner will, dass ich einen von Salandrils wertvollen Tr�nken stehle.");
};

INSTANCE Info_Mod_Gaertner_HierTrank (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_HierTrank_Condition;
	information	= Info_Mod_Gaertner_HierTrank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du deinen wertvollen Trank.";
};

FUNC INT Info_Mod_Gaertner_HierTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Dieb))
	&& (Npc_HasItems(hero, ItPo_Perm_DEX_Salandril) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_HierTrank_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaertner_HierTrank_15_00"); //Hier hast du deinen wertvollen Trank.

	B_GiveInvItems	(hero, self, ItPo_Perm_DEX_Salandril, 1);
	Npc_RemoveInvItems	(self, ItPo_Perm_DEX_Salandril, 1);
	CreateInvItems	(self, ItPo_Perm_DEX, 1);

	AI_Output(self, hero, "Info_Mod_Gaertner_HierTrank_09_01"); //Unglaublich, du bist ein Naturtalent. Hier hast du eine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Gaertner_HierTrank_09_02"); //Wenn du willst, dann verkauf ich ihn dir.
	
	B_SetTopicStatus	(TOPIC_MOD_DIEB_SALANDRIL, LOG_SUCCESS);

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Gaertner_Trade (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Trade_Condition;
	information	= Info_Mod_Gaertner_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gaertner_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gaertner_Pickpocket (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Pickpocket_Condition;
	information	= Info_Mod_Gaertner_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Gaertner_Pickpocket_Condition()
{
	C_Beklauen	(16, ItPl_Temp_Herb, 2);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

	Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_BACK, Info_Mod_Gaertner_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gaertner_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gaertner_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gaertner_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gaertner_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gaertner_EXIT (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_EXIT_Condition;
	information	= Info_Mod_Gaertner_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gaertner_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};