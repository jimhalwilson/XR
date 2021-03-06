INSTANCE Info_Mod_Alax_Hi (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_Hi_Condition;
	information	= Info_Mod_Alax_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alax_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alax_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_00"); //He, was trampelst du hier so laut rum? Ich brauche absolute Konzentration beim Tr�nkebrauen.
	AI_Output(hero, self, "Info_Mod_Alax_Hi_15_01"); //Als w�re es hier drin so still ...
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_02"); //Nun ... das mag ja stimmen. Aber als ehemaliger Guru des Schl�fers entspricht es nun mal meiner Gewohnheit.
	AI_Output(hero, self, "Info_Mod_Alax_Hi_15_03"); //Du warst Guru im Sumpflager?
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_04"); //(ungeduldig) Das habe ich doch gerade gesagt.
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_05"); //Nachdem Xardas jedoch den Schl�fer bezwungen hatte und die Barriere zum Einsturz brachte, verstand es sich f�r mich von selbst, dass ich seinem Beispiel folgen w�rde.
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_06"); //Letztendlich hat er mich von dieser Irrlehre, wie auch von der Gefangenschaft in der Kolonie befreit.
	AI_Output(self, hero, "Info_Mod_Alax_Hi_14_07"); //Also bin ich Alchemist in den Reihen der D�monenmagier geworden.
};

INSTANCE Info_Mod_Alax_AlchemieLehrer (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_AlchemieLehrer_Condition;
	information	= Info_Mod_Alax_AlchemieLehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir etwas �ber Alchemie beibringen?";
};

FUNC INT Info_Mod_Alax_AlchemieLehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alax_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_15_00"); //Kannst du mir etwas �ber Alchemie beibringen?
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_14_01"); //Warum bei Beliar sollte ich das tun?
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_15_02"); //Ich m�chte mich den Gaunern anschlie�en. Dazu brauche ich jedoch eure Stimmen.
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_15_03"); //W�rdest du mir nach dieser Aufgabe eventuell deine Stimme geben.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_14_04"); //Wenn du alle Pakete bekommen kannst, dann werde ich dir nat�rlich meine Stimme geben.
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_15_05"); //Abgemacht. Wo soll ich die Pakete abholen?
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_14_06"); //Alle drei H�ndler findest du in der Stadt. Ihre Namen sind Meldor, Borka und zuletzt Jason, ein Milizion�r.
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_15_07"); //Jemand von der Miliz handelt mit Sumpfkraut?
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_14_08"); //Meinst du die halten sich alle an ihre Regeln?
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_15_09"); //Nein. Also gut, ich werde die drei mal aufsuchen.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_14_10"); //Gut. Komm wieder, wenn du die Pakete hast.

	Log_CreateTopic	(TOPIC_MOD_ALAX_ZUTATEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ALAX_ZUTATEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Bevor mir Alax etwas �ber Alchemie beibringt, soll ich ihm erst mal von 13 Tr�nken, Gew�chsen oder sonstigen Zutaten meiner Wahl je 6 St�ck bringen.");

	Info_ClearChoices	(Info_Mod_Alax_AlchemieLehrer);

	Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer, "Weil ich ein netter Kerl bin.", Info_Mod_Alax_AlchemieLehrer_B);
	Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer, "Ich habe Xardas damals geholfen den Schl�fers zu verbannen.", Info_Mod_Alax_AlchemieLehrer_A);
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_C()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_C_15_00"); //Von welchen?
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_C_14_01"); //�berrasch mich ... oder anders gesagt: Stiehl mir nicht mehr Zeit und lass mich in Ruhe weiterarbeiten.

	Log_CreateTopic	(TOPIC_MOD_ALAX_ZUTATEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ALAX_ZUTATEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ALAX_ZUTATEN, "Ich habe mit Alax gesprochen, einem er Gauner der Assassinen. Er will mir seine Stimme geben, aber nur, wenn ich ihm drei Pakete voller Sumpfkraut bringe, die eigentlich von verschiedenen 'H�ndlern' der Stadt h�tten geliefert werden m�ssen. Dieser Personen sind Meldor, Borka und Jason. Wenn ich von ihnen die Pakete erhalten habe, soll ich mich wieder bei Alax melden.");

	Info_ClearChoices	(Info_Mod_Alax_AlchemieLehrer);
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_B()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_B_15_00"); //Weil ich ein netter Kerl bin.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_B_14_01"); //Netter Kerl?! Dann geh doch zu den weichgesp�lten Feuermagiern und bitte sie um deren Gunst.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_B_14_02"); //Wenn ICH dir etwas beibringen soll, besorg mir erst von 13 verschiedenen Tr�nken, Gew�chsen oder anderen Ingredienzien jeweils sechs St�ck. Dann k�nnen wir weiterreden.

	Info_Mod_Alax_AlchemieLehrer_C();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer_A()
{
	AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer_A_15_00"); //Ich habe Xardas damals geholfen den Schl�fers zu verbannen.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_A_14_01"); //Haha, nat�rlich ... und ich habe Innos� heilige Jungfrauen gesch�ndet. Verarschen kann ich mich selbst.
	AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer_A_14_02"); //Wenn ich dir wirklich etwas beibringen soll, besorg mir erst von 13 verschiedenen Tr�nken, Gew�chsen oder anderen Ingredienzien jeweils sechs St�ck.

	Info_Mod_Alax_AlchemieLehrer_C();
};

INSTANCE Info_Mod_Alax_AlchemieLehrer2 (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_AlchemieLehrer2_Condition;
	information	= Info_Mod_Alax_AlchemieLehrer2_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Zutaten geben)";
};

FUNC INT Info_Mod_Alax_AlchemieLehrer2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alax_AlchemieLehrer))
	&& (Mod_Alax_Zutaten < 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Verteiler()
{
	Info_ClearChoices	(Info_Mod_Alax_AlchemieLehrer2);

	if (Mod_Alax_Zutaten < 13)
	{
		if (!Mod_Alax_Zutat_Zwillingsdorn)
		&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Zwillingsdorn geben", Info_Mod_Alax_AlchemieLehrer2_Zwillingsdorn);
		};
		if (!Mod_Alax_Zutat_Schwefel)
		&& (Npc_HasItems(hero, ItMi_Sulfur) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Schwefel geben", Info_Mod_Alax_AlchemieLehrer2_Schwefel);
		};
		if (!Mod_Alax_Zutat_SchwarzePerle)
		&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Schwarze Perle geben", Info_Mod_Alax_AlchemieLehrer2_SchwarzePerle);
		};
		if (!Mod_Alax_Zutat_Pech)
		&& (Npc_HasItems(hero, ItMi_Pitch) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Pech geben", Info_Mod_Alax_AlchemieLehrer2_Pech);
		};
		if (!Mod_Alax_Zutat_Kohle)
		&& (Npc_HasItems(hero, ItMi_Coal) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Kohle geben", Info_Mod_Alax_AlchemieLehrer2_Kohle);
		};
		if (!Mod_Alax_Zutat_Heilwurzel)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_03) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilwurzel geben", Info_Mod_Alax_AlchemieLehrer2_Heilwurzel);
		};
		if (!Mod_Alax_Zutat_Heilpflanze)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilpflanze geben", Info_Mod_Alax_AlchemieLehrer2_Heilpflanze);
		};
		if (!Mod_Alax_Zutat_Heilkraut)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_02) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilkraut geben", Info_Mod_Alax_AlchemieLehrer2_Heilkraut);
		};
		if (!Mod_Alax_Zutat_Heilknospe)
		&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Heilknospe geben", Info_Mod_Alax_AlchemieLehrer2_Heilknospe);
		};
		if (!Mod_Alax_Zutat_GletscherQuartz)
		&& (Npc_HasItems(hero, ItMi_Quartz) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Gletscher-Quartz geben", Info_Mod_Alax_AlchemieLehrer2_GletscherQuartz);
		};
		if (!Mod_Alax_Zutat_Feuerwurzel)
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_03) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Feuerwurzel geben", Info_Mod_Alax_AlchemieLehrer2_Feuerwurzel);
		};
		if (!Mod_Alax_Zutat_Feuernessel)
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Feuernessel geben", Info_Mod_Alax_AlchemieLehrer2_Feuernessel);
		};
		if (!Mod_Alax_Zutat_Feuerkraut)
		&& (Npc_HasItems(hero, ItPl_Mana_Herb_02) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Feuerkraut geben", Info_Mod_Alax_AlchemieLehrer2_Feuerkraut);
		};
		if (!Mod_Alax_Zutat_Bergkristall)
		&& (Npc_HasItems(hero, ItMi_Rockcrystal) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Bergkristall geben", Info_Mod_Alax_AlchemieLehrer2_Bergkristall);
		};
		if (!Mod_Alax_Zutat_Aquamarin)
		&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 6)
		{
			Info_AddChoice	(Info_Mod_Alax_AlchemieLehrer2, "6x Aquamarin geben", Info_Mod_Alax_AlchemieLehrer2_Aquamarin);
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_15_00"); //Das waren 13mal 6.
		AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_14_01"); //Tatsache ... W�re eigentlich gar nicht n�tig gewesen. Wie ich mittlerweile erfahren habe, warst du tats�chlich der Helfer meines Meisters im Kampf gegen den Schl�fer ...
		AI_Output(hero, self, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_15_02"); //Was?!
		AI_Output(self, hero, "Info_Mod_Alax_AlchemieLehrer2_Verteiler_14_03"); //Wie dem auch sei, was soll ich dir beibringen?

		B_GivePlayerXP	(600);

		CurrentNQ += 1;

		B_SetTopicStatus	(TOPIC_MOD_ALAX_ZUTATEN, LOG_SUCCESS);

		Log_CreateTopic	(TOPIC_MOD_LEHRER_BELIARFESTUNG, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_BELIARFESTUNG, "Alax kann mich in der Kunst der Alchemie unterweisen.");
	};
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Info()
{
	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Zwillingsdorn()
{
	B_GiveInvItems	(hero, self, ItPl_Zwillingsdorn, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Zwillingsdorn = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Schwefel()
{
	B_GiveInvItems	(hero, self, ItMi_Sulfur, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Schwefel = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_SchwarzePerle()
{
	B_GiveInvItems	(hero, self, ItMi_DarkPearl, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_SchwarzePerle = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Pech()
{
	B_GiveInvItems	(hero, self, ItMi_Pitch, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Pech = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Kohle()
{
	B_GiveInvItems	(hero, self, ItMi_Coal, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Kohle = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilwurzel()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_03, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilwurzel = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilpflanze()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilpflanze = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilkraut()
{
	B_GiveInvItems	(hero, self, ItPl_Health_Herb_02, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilkraut = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Heilknospe()
{
	B_GiveInvItems	(hero, self, ItPl_Heilknospe, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Heilknospe = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_GletscherQuartz()
{
	B_GiveInvItems	(hero, self, ItMi_Quartz, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_GletscherQuartz = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Feuerwurzel()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_03, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Feuerwurzel = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Feuernessel()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_01, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Feuernessel = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Feuerkraut()
{
	B_GiveInvItems	(hero, self, ItPl_Mana_Herb_02, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Feuerkraut = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Bergkristall()
{
	B_GiveInvItems	(hero, self, ItMi_Rockcrystal, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Bergkristall = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

FUNC VOID Info_Mod_Alax_AlchemieLehrer2_Aquamarin()
{
	B_GiveInvItems	(hero, self, ItMi_Aquamarine, 6);

	Mod_Alax_Zutaten += 1;

	Mod_Alax_Zutat_Aquamarin = TRUE;

	Info_Mod_Alax_AlchemieLehrer2_Verteiler();
};

INSTANCE Info_Mod_Alax_Lehrer (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_Lehrer_Condition;
	information	= Info_Mod_Alax_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir etwas �ber die Alchemie bei.";
};

FUNC INT Info_Mod_Alax_Lehrer_Condition()
{	
	if (Mod_Alax_Zutaten == 13)
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Alax_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Alax_Lehrer_15_00"); //Bring mir etwas �ber die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Alax_Lehrer_14_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Alax_Lehrer);
	Info_AddChoice 		(Info_Mod_Alax_Lehrer,DIALOG_BACK,Info_Mod_Alax_Lehrer_BACK);

	if (PLAYER_TALENT_ALCHEMY[POTION_Regeneration] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Regenerationstrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Regeneration)), Info_Mod_Alax_Lehrer_Regeneration);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank der leichten Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Alax_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Leichter Heiltrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Alax_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank der schnellen Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Alax_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Alax_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Alax_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Alax_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Alax_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank des leichten Mana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Alax_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Leichte Manatrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Alax_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Alax_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Alax_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Alax_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Alax_Lehrer, B_BuildLearnString ("Trank der Geschwindigkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Alax_Lehrer_Speed);
	};
};
FUNC VOID Info_Mod_Alax_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Alax_Lehrer);
};
FUNC VOID Info_Mod_Alax_Lehrer_Regeneration()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Regeneration);
};
FUNC VOID Info_Mod_Alax_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Alax_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Alax_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Alax_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Alax_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Alax_Pickpocket (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_Pickpocket_Condition;
	information	= Info_Mod_Alax_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Alax_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Alax_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

	Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_BACK, Info_Mod_Alax_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alax_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alax_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alax_Pickpocket);
};

FUNC VOID Info_Mod_Alax_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

		Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alax_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alax_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alax_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alax_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alax_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alax_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alax_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alax_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alax_EXIT (C_INFO)
{
	npc		= Mod_7502_KDS_Alax_MT;
	nr		= 1;
	condition	= Info_Mod_Alax_EXIT_Condition;
	information	= Info_Mod_Alax_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alax_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alax_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};