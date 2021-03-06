INSTANCE Info_Mod_Darrion_Hi (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hi_Condition;
	information	= Info_Mod_Darrion_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_00"); //Willkommen in meiner Schmiede.
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_01"); //Wenn du ein Schwert brauchst, kannst du es bei mir bekommen.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Darrion verkauft Waffen.");
};

INSTANCE Info_Mod_Darrion_Urs (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs_Condition;
	information	= Info_Mod_Darrion_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schmied, hier dein gesegneter Stahl.";
};

FUNC INT Info_Mod_Darrion_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMi_ErzpaketDarrion) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_00"); //Schmied, hier dein gesegneter Stahl.

	B_GiveInvItems	(hero, self, ItMi_ErzpaketDarrion, 1);

	Npc_RemoveInvItems	(self, ItMi_ErzpaketDarrion, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_01"); //(skeptisch) Wirklich? Na, das will ich erst mal die Probe stellen.

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_02"); //So die Klinge w�re dann schon mal geschafft. Ich bringe sie jetzt Gor Na Ran.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_03"); //Er soll sie an den besessenen Pflanzen ausprobieren, die Zurzeit wie Unkraut aus dem Boden schie�en.
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_04"); //Besessene Pflanzen?
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_05"); //Nunja, ein kleines Experiment, das au�er Kontrolle geriet.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_06"); //Die Baals hatten versucht die Sumpfkrauternte zu steigern, indem sie das Kraut magisch beeinflussten ... mit Zaubern, die Beschw�rungen nicht un�hnlich sind.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_07"); //Leider nahm das ganze unkontrollierte, d�monische Ausw�chse an.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_08"); //Das besessene Kraut ist �u�erst aggressiv und hartn�ckig. Kaum hat man mit M�he eine Pflanze erledigt, schie�t schon wo anders eine neue empor.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_09"); //Sollte der Stahl tats�chlich die F�higkeit in sich bergen, D�monisches zu bannen, wird er den Templern ihre Aufgabe um einiges erleichtern.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_10"); //Und nun folge mir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOGORNARAN");
};

INSTANCE Info_Mod_Darrion_Urs2 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs2_Condition;
	information	= Info_Mod_Darrion_Urs2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Urs2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaRan_Urs2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs2_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_00"); //Gut, diese beeindruckende Demonstration des Stahles soll mir gen�gen. Er ist jeden Krautst�ngel in diesem Paket hier Wert.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_01"); //Ach, nimm diese St�ngel hier noch als Bonus ... was zu rauchen f�r unterwegs.

	CreateInvItems	(hero, ItMi_Addon_Joint_02, 3);
	CreateInvItems	(hero, ItMi_Traumruf, 3);

	B_ShowGivenThings	("3 Schwarzer Weiser und 3 Traumruf erhalten");

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_02"); //Danke. Ich hoffe, ihr habt etwas aus der Sache gelernt.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_03"); //Selbstverst�ndlich. So was machen wir nie wieder. Es muss bessere Wege geben, die Krauternte zu steigern.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_04"); //Einige unserer Jungs sind gerade auf ganz Khorinis unterwegs und erproben das Wachstum der Pflanzen auf magisch beeinflussten B�den.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_05"); //(zu sich selbst) Na ja, so meinte ich das eigentlich nicht. Aber was soll�s.
	AI_Output(self, hero, "DEFAULT"); //

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "So, das Krautpaket aus dem Sumpflager h�tte ich.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Darrion_Hueterklinge (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hueterklinge_Condition;
	information	= Info_Mod_Darrion_Hueterklinge_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schmiede mir einer H�terklinge!";
};

FUNC INT Info_Mod_Darrion_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Hueterklinge_15_00"); //Schmiede mir einer H�terklinge!
	AI_Output(self, hero, "Info_Mod_Darrion_Hueterklinge_13_01"); //Hast du alle Zutaten?

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);

	Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, DIALOG_BACK, Info_Mod_Darrion_Hueterklinge_BACK);

	if (Mod_TPL_Hueterklinge_Art == 2)
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(falsche Zutaten geben)", Info_Mod_Darrion_Hueterklinge_B2);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01_Reisfresser) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger_Blut) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw_Scav) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(richtige Zutaten geben)", Info_Mod_Darrion_Hueterklinge_A2);
		};
	}
	else
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(falsche Zutaten geben)", Info_Mod_Darrion_Hueterklinge_B1);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette_Stonehenge) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone_Herrscher) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth_Wolf) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(richtige Zutaten geben)", Info_Mod_Darrion_Hueterklinge_A1);
		};
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine falsche H�terklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01_Reisfresser, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger_Blut, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw_Scav, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine H�terklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine falsche H�terklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette_Stonehenge, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone_Herrscher, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth_Wolf, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Ich habe mir von Darrion eine H�terklinge schmieden lassen. Ich sollte jetzt mal bei Cor Angar vorstellig werden.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

INSTANCE Info_Mod_Darrion_Sumpfmensch (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fortuno hat mir erz�hlt, du hast den heulenden Sumpfmenschen gesehen.";
};

FUNC INT Info_Mod_Darrion_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_00"); //Fortuno hat mir erz�hlt, du hast den heulenden Sumpfmenschen gesehen.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_01"); //Ja, das habe ich, und es h�tte mich beinahe das Leben gekostet! Ich wei� nicht, welchem Gott ich danken soll, aber dass ich noch lebe grenzt an ein Wunder.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_02"); //Wo hast du ihn getroffen?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_03"); //Tief im Sumpf. Ich habe dort fr�her spezielles Sumpfkraut gepflanzt, das an den Randgebieten einfach nicht gedeiht.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_04"); //Als ich vor einigen Wochen dort nach dem Rechten sehen wollte, stand pl�tzlich diese Kreatur vor mir. Ich hab mir fast in die Hosen geschissen!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_05"); //Da hab sogar ich alter Seeb�r mich gef�hlt, wie ein kleines M�dchen!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_06"); //Ich  hab's den andren gesagt und ich sag's dir: Wenn du diesem Monster jemals begegnen solltest, nimm die Beine in die Hand und renn!

	B_StartOtherRoutine	(Mod_951_PSINOV_Fortuno_MT, "START");
	B_StartOtherRoutine	(Mod_1339_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_2008_PSINOV_Ghorim_MT, "START");
	B_StartOtherRoutine	(Mod_1337_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1336_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1338_PSINOV_Novize_MT, "START");

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Wo im Sumpf hast du dein Sumpfkraut gefplanzt?", Info_Mod_Darrion_Sumpfmensch_C);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Du bist fr�her zur See gefahren?", Info_Mod_Darrion_Sumpfmensch_B);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Was f�r spezielles Sumpfkraut hast du da gepflanzt?", Info_Mod_Darrion_Sumpfmensch_A);
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_C()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_C_15_00"); //Wo im Sumpf hast du dein Sumpfkraut gefplanzt?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_C_11_01"); //Irgendwo weit drinnen, aber komm ja nicht auf die Idee da zu suchen, Junge, ich sag's nochmals: das Wesen ist gef�hrlich, das rei�t dir den Arsch auf!
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_B()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_00"); //Du bist fr�her zur See gefahren?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_01"); //Ich war fr�her Pirat, Junge! Und was f�r einer!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_02"); //Warum hast du die Piraten verlassen?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_03"); //Ach, ich hatte das Piratendasein satt, Junge.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_04"); //Und hier? Hier stampf ich tags�ber etwas Kraut, damit die Muskeln nicht rosten, rauch ein bisschen Sumpfkraut und lass mir den restlichen Tag die Sonne auf den Bauch scheinen.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_05"); //Und jetzt lass mich in Ruhe.

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_A()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_A_15_00"); //Was f�r spezielles Sumpfkraut hast du da gepflanzt?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_01"); //Das war ganz was Feines, das hab ich aus dem gro�en Sumpf der ein bisschen von der Piratenbucht entfernt liegt ausgegraben und mitgebracht.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_02"); //Musste ein paar ziemlich h�ssliche Viecher umhaun' um da dran zu kommen.
};

INSTANCE Info_Mod_Darrion_Trade (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Trade_Condition;
	information	= Info_Mod_Darrion_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Darrion_Pickpocket (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Pickpocket_Condition;
	information	= Info_Mod_Darrion_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Darrion_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMiSwordRaw, 5);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_BACK, Info_Mod_Darrion_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Darrion_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Darrion_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Darrion_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Darrion_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Darrion_EXIT (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_EXIT_Condition;
	information	= Info_Mod_Darrion_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Darrion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};