INSTANCE Info_Mod_Schoeppe_01_Hi (C_INFO)
{
	npc		= Mod_7372_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_01_Hi_Condition;
	information	= Info_Mod_Schoeppe_01_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Magst du deinen Beruf?";
};

FUNC INT Info_Mod_Schoeppe_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schoeppe_01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Schoeppe_01_Hi_15_00"); //Magst du deinen Beruf?
	AI_Output(self, hero, "Info_Mod_Schoeppe_01_Hi_09_01"); //Beruf? Nein, ich mache das ehrenamtlich, um dem gr��eren Wohl zu dienen.
	AI_Output(self, hero, "Info_Mod_Schoeppe_01_Hi_09_02"); //Ich pers�nlich hasse ja diese stinkenden Menschen, die stinkenden Verbrechen und die stinkenden Ausreden.
	AI_Output(self, hero, "Info_Mod_Schoeppe_01_Hi_09_03"); //Aber ich muss daf�r sorgen, dass wir in Zukunft von solchem Pack verschont bleiben.
};

INSTANCE Info_Mod_Schoeppe_01_Pickpocket (C_INFO)
{
	npc		= Mod_7372_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_01_Pickpocket_Condition;
	information	= Info_Mod_Schoeppe_01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Schoeppe_01_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);

	Info_AddChoice	(Info_Mod_Schoeppe_01_Pickpocket, DIALOG_BACK, Info_Mod_Schoeppe_01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Schoeppe_01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Schoeppe_01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);

		Info_AddChoice	(Info_Mod_Schoeppe_01_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Schoeppe_01_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Schoeppe_01_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Schoeppe_01_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Schoeppe_01_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Schoeppe_01_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Schoeppe_01_EXIT (C_INFO)
{
	npc		= Mod_7372_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_01_EXIT_Condition;
	information	= Info_Mod_Schoeppe_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Schoeppe_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schoeppe_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};