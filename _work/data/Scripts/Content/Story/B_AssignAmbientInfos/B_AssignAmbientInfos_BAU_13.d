// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_BAU_13_EXIT_13_00"); //Saftiges Korn solle auf deinen Feldern wachsen.

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mehr �ber die S�ldner wissen!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_BAU_13_JOIN_15_00"); //Ich will mehr �ber die S�ldner wissen!
	AI_Output (self, hero, "DIA_BAU_13_JOIN_13_01"); //Wenn du mal �rger mit ihnen hast, geh zu Lares. Das machen wir Bauern auch so. Er ist sehr hart zu seinen Leuten.
	AI_Output (self, hero, "DIA_BAU_13_JOIN_13_02"); //Wenn sich einer von ihnen nicht benimmt, nimmt er ihn sich zur Brust.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_BAU_13_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, hero, "DIA_BAU_13_PEOPLE_13_01"); //Onar ist der Boss.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Was kannst du mir �ber die Gegend hier erz�hlen?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_BAU_13_LOCATION_15_00"); //Was kannst du mir �ber die Gegend hier erz�hlen?
	AI_Output (self, hero, "DIA_BAU_13_LOCATION_13_01"); //Es gibt drei H�fe hier. Onars im Osten und Sekobs im Norden das Tals.
	AI_Output (self, hero, "DIA_BAU_13_LOCATION_13_02"); //Im S�dwesten gibt es einen Aufgang zur Hochebene. Dort liegt Bengars Hof.
};

INSTANCE Info_Mod_BAU_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BAU_13_Pickpocket_Condition;
	information	= Info_Mod_BAU_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_BAU_13_Pickpocket_Condition()
{
	C_Beklauen	(8+r_max(12), ItMi_Gold, 10+r_max(22));
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);

	Info_AddChoice	(Info_Mod_BAU_13_Pickpocket, DIALOG_BACK, Info_Mod_BAU_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BAU_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BAU_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);

		Info_AddChoice	(Info_Mod_BAU_13_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_BAU_13_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_BAU_13_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_BAU_13_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_BAU_13_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_BAU_13_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_BAU_13_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_BAU_13_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BAU_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
