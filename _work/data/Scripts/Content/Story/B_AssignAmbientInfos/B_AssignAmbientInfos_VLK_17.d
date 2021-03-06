// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_17_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_17_EXIT_Condition;
	information	= DIA_VLK_17_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_17_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_17_JOIN_Condition;
	information	= DIA_VLK_17_JOIN_Info;
	permanent	= TRUE;
	description = "Was muss ich tun, um B�rger dieser Stadt zu werden?";
};                       

FUNC INT DIA_VLK_17_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	&& (Mod_IstLehrling == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_17_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_VLK_17_JOIN_15_00"); //Was muss ich tun, um B�rger dieser Stadt zu werden?
	AI_Output (self, hero, "DIA_VLK_17_JOIN_17_01"); //Die Handwerksmeister in der Unterstadt haben gro�en Einfluss hier in Khorinis. Du solltest mit einem von ihnen reden.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_17_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_17_PEOPLE_Condition;
	information	= DIA_VLK_17_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer sind die wichtigsten Pers�nlichkeiten dieser Stadt?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_VLK_17_PEOPLE_15_00"); //Wer sind die wichtigsten Pers�nlichkeiten dieser Stadt?
	AI_Output (self, hero, "DIA_VLK_17_PEOPLE_17_01"); //Lord Andre vertritt das Gesetz. Du findest ihn in der Kaserne.
	AI_Output (self, hero, "DIA_VLK_17_PEOPLE_17_02"); //Aber solange du nicht gegen das Gesetz versto�en hast, oder dich der Miliz anschlie�en willst, brauchst du nicht zu ihm zu gehen.
};

INSTANCE Info_VLK_17_Flugblaetter (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_VLK_17_Flugblaetter_Condition;
	information	= Info_VLK_17_Flugblaetter_Info;
	permanent	= 1;
	description = "Ich hab hier ein Flugblatt f�r dich.";
};                       

FUNC INT Info_VLK_17_Flugblaetter_Condition()
{
	if (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (self.aivar[AIV_FLUGBLATTVERTEILT] == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_VLK_17_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_VLK_17_Flugblaetter_17_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_VLK_17_Flugblaetter_17_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	self.aivar[AIV_FLUGBLATTVERTEILT] = 1;

	Mod_Flugblaetter += 1;
};

INSTANCE Info_VLK_17_Rangar (C_INFO) // E1
{
	nr			= 6;
	condition	= Info_VLK_17_Rangar_Condition;
	information	= Info_VLK_17_Rangar_Info;
	permanent	= 0;
	description = "Wusstest du schon ...";
};                       

FUNC INT Info_VLK_17_Rangar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_VLK_1_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_6_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_8_Rangar))
	&& (!Npc_KnowsInfo(hero, Info_VLK_16_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	{
		return TRUE;
	};
};

FUNC VOID Info_VLK_17_Rangar_Info()
{
	AI_Output(hero, self, "Info_Mod_VLK_17_Rangar_15_00"); //Wusstest du schon, dass Rangar eine Aff�re hat?
	AI_Output(self, hero, "Info_Mod_VLK_17_Rangar_17_01"); //Echt? Mit wem denn?
	AI_Output(hero, self, "Info_Mod_VLK_17_Rangar_15_02"); //Mit einem von Alwins Schafen!
	AI_Output(self, hero, "Info_Mod_VLK_17_Rangar_17_03"); //Bist du sicher? Das muss ich sofort weitererz�hlen.

	Mod_DensGeruechtVerbreitet = TRUE;

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Ein Ger�cht ist im Umlauf, da wird Den zufrieden sein.");
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_17_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_17_LOCATION_Condition;
	information	= DIA_VLK_17_LOCATION_Info;
	permanent	= TRUE;
	description = "Was sind die interessantesten Orte hier in Khorinis?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_VLK_17_LOCATION_15_00"); //Was sind die interessantesten Orte hier in Khorinis?
	AI_Output (self, hero, "DIA_VLK_17_LOCATION_17_01"); //(lacht) Vielleicht solltest du das besser einen Mann fragen. Wenn dir nach Unterhaltung ist, solltest du dich am Hafen umsehen.
	AI_Output (self, hero, "DIA_VLK_17_LOCATION_17_02"); //Aber wenn es dir darum geht, etwas zu kaufen, geh zum Marktplatz am Osttor oder in die Unterstadt.
};

INSTANCE Info_Mod_VLK_17_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_VLK_17_Pickpocket_Condition;
	information	= Info_Mod_VLK_17_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90_Female;
};

FUNC INT Info_Mod_VLK_17_Pickpocket_Condition()
{
	C_Beklauen	(60+r_max(30), ItMi_Gold, 200+r_max(50));
};

FUNC VOID Info_Mod_VLK_17_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);

	Info_AddChoice	(Info_Mod_VLK_17_Pickpocket, DIALOG_BACK, Info_Mod_VLK_17_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_VLK_17_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_VLK_17_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_VLK_17_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);
};

FUNC VOID Info_Mod_VLK_17_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);

		Info_AddChoice	(Info_Mod_VLK_17_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_VLK_17_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_VLK_17_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_VLK_17_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_VLK_17_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_VLK_17_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_VLK_17_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_VLK_17_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_VLK_17_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_VLK_17_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_17 (var c_NPC slf)
{
	DIA_VLK_17_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_VLK_17_Flugblaetter.npc				= Hlp_GetInstanceID(slf);
	Info_VLK_17_Rangar.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_VLK_17_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
