INSTANCE Info_Mod_Griselda_Hi (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Hi_Condition;
	information	= Info_Mod_Griselda_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Griselda_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_00"); //Was ein Besucher? Und dazu noch ein stattlicher Bursche.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_01"); //Erstaunlich, dir ist es tats�chlich gelungen zu mir vorzudringen
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_02"); //Was?! Wer bist du?
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_03"); //(unschuldig) Ich? Ich bin nur ein altes M�tterchen.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_04"); //Verborgen in einer H�hle mit Schneegeistern?! Das glaube ich kaum. Lass das Gerede und erkl�re dich!
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_05"); //(ironisch) Ohh, ein Mann mit K�pfchen. Und er l�sst sich nichts vorspielen.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_06"); //Nun gut. Ich bin die Mutter einer Schwesternschaft, die sich den magischen K�nsten verschrieben hat.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_07"); //Schwesternschaft magischer K�nste? Du sprichst nicht zuf�llig von Hexen?!
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_08"); //Ohh, welch schlimmes Wort ... "Hexe". Ich ziehe die Umschreibung "Schwester der dunklen Kunst" vor.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_09"); //Was sollen diese Wortspielereien. Was machst du hier und was f�hrst du im Schilde?
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_10"); //Was ich hier mache? Du kamst doch zu mir.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_11"); //Die Frage muss also lauten: Was machst du hier?
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_12"); //Nun ...
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_13"); //Nach Wortspielchen scheint dir nicht das Gem�t zu stehen. Vielleicht darf es dann eine Pr�fung sein.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_14"); //Ja, du siehst mir aus nach einem Mann, den es nach Pr�fungen d�rstet.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_15"); //Pr�fungen? Was meinst du?
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_16"); //Nun, Pr�fungen eben. Sie stellen Menschen auf die Probe, zeigen, ob sie K�pfchen, Mut, St�rke, Geschick besitzen.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_17_17"); //Bew�hrt man sich, so stehen Belohnungen in Aussicht. Was sagst du, mein Held?
};

INSTANCE Info_Mod_Griselda_Pruefung (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung_Condition;
	information	= Info_Mod_Griselda_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nun gut, ich kann es ja mal versuchen mit der Pr�fung.";
};

FUNC INT Info_Mod_Griselda_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_15_00"); //Nun gut, ich kann es ja mal versuchen mit der Pr�fung.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_01"); //Du kannst nun  zeigen, ob du so viel �ber die Sch�pfung wei�t, wie du zu wissen glaubst.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_02"); //Genauer gesagt, den belebten Teil der Sch�pfung, die Wesen und Kreaturen, welche auf dem Erdenrund wandeln, kriechen und krabbeln.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_03"); //In der Arena wird ein Gesch�pf erscheinen und du kannst unter mehreren Wesen eines w�hlen, welches dagegen antreten soll.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_04"); //Dabei erh�ltst du im Kampf die Kontrolle �ber deine Kreatur und kannst sie nach deinem Willen lenken.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_05"); //Triumphierst du, erh�ltst du eine Belohnung.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_06"); //Versuchst du Kampf durch eine R�ckverwandlung zu unterbrechen, gilt er als verloren.

	AI_PlayAni	(self, "T_PRACTICEMAGIC5");

	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_07"); //So, wie du sehen wirst befindet sich nun ein Wolf in der Arena. Triff deine Wahl.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_17_08"); //Mit welcher Kreatur m�chtest du k�mpfen?

	B_StartOtherRoutine	(self, "ARENA");

	Wld_InsertNpc	(Wolf_Griselda_01, "HEXE_ARENA_SPAWN_SOLO_01");

	playerIsTransformed = FALSE;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung, "Snapper.", Info_Mod_Griselda_Pruefung_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung, "Fleischwanze.", Info_Mod_Griselda_Pruefung_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung, "Schaf.", Info_Mod_Griselda_Pruefung_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung_FalscheWahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_FalscheWahl_17_00"); //Hohoho, ganz, wie du w�nscht, mein Dummerchen.
};

FUNC VOID Info_Mod_Griselda_Pruefung_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_C_15_00"); //Snapper.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_C_17_01"); //So soll es sein.

	B_GiveInvItems	(self, hero, ItSc_TrfSnapper, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);
};

FUNC VOID Info_Mod_Griselda_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_B_15_00"); //Fleischwanze.

	Info_Mod_Griselda_Pruefung_FalscheWahl();

	B_GiveInvItems	(self, hero, ItSc_TrfMeatbug, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);
};

FUNC VOID Info_Mod_Griselda_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_A_15_00"); //Schaf.

	Info_Mod_Griselda_Pruefung_FalscheWahl();

	B_GiveInvItems	(self, hero, ItSc_TrfSheep, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);
};

INSTANCE Info_Mod_Griselda_Pruefung2 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung2_Condition;
	information	= Info_Mod_Griselda_Pruefung2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung2_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_00"); //Ohh, entt�uscht bin ich von dir.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_01"); //Das pulsierende Leben w�re dein Lohn gewesen ... Ach, wie bedauerlich, ich verga� zu erw�hnen:
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_02"); //deine Wettschuld soll nun auf dieselbe Weise getilgt werden, hihihi.

		Mod_Griselda_Arena = -1;

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_03"); //Nun, es war wohl nicht allzu schwer die rechte Wahl zu treffen.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_04"); //Zumindest kann ich nun ausschlie�en, dass ein kompletter Narr vor mir steht, hehehe.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_05"); //Nichts f�r ungut, dein Lohn soll etwas der Lebenskraft deines get�teten Gegners sein.

		B_RaiseAttribute_Rest (hero, ATR_HITPOINTS_MAX, 14);

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_06"); //So, nachdem du den ersten Kampf erfolgreich �berstandest, gel�stet es dich da nicht nach einer Fortsetzung?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_07"); //Auch jetzt gibt es wieder Preise f�r den gl�cklichen Knaben zu erringen.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_17_08"); //Diesmal sind es eine Hand voll Gegner, zwei Blutfliegen und zwei Spinnen ... nichts wovor es sich zu f�rchten gilt, nur Bodensatz des Tierreiches.
	};
};

INSTANCE Info_Mod_Griselda_Pruefung3 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung3_Condition;
	information	= Info_Mod_Griselda_Pruefung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will k�mpfen.";
};

FUNC INT Info_Mod_Griselda_Pruefung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung2))
	&& (Mod_Griselda_Arena == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_15_00"); //Ich will k�mpfen.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung3_17_01"); //Triff deine Wahl.

	Wld_InsertNpc	(Blutfliege_Griselda_01, "HEXE_ARENA_TEAM_01");
	Wld_InsertNpc	(Blutfliege_Griselda_02, "HEXE_ARENA_TEAM_02");
	Wld_InsertNpc	(Spinne_Griselda_01, "HEXE_ARENA_TEAM_03");
	Wld_InsertNpc	(Spinne_Griselda_02, "HEXE_ARENA_TEAM_04");

	playerIsTransformed = FALSE;

	Mod_Griselda_Arena = 0;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung3, "Schattenl�ufer.", Info_Mod_Griselda_Pruefung3_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung3, "Skelett.", Info_Mod_Griselda_Pruefung3_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung3, "Harpie.", Info_Mod_Griselda_Pruefung3_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung3_Wahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung3_Wahl_17_00"); //Wie du w�nscht.
};

FUNC VOID Info_Mod_Griselda_Pruefung3_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_C_15_00"); //Schattenl�ufer.

	Info_Mod_Griselda_Pruefung3_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfShadowbeast, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);
};

FUNC VOID Info_Mod_Griselda_Pruefung3_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_B_15_00"); //Skelett.

	Info_Mod_Griselda_Pruefung3_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfSkeleton, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);
};

FUNC VOID Info_Mod_Griselda_Pruefung3_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_A_15_00"); //Harpie.

	Info_Mod_Griselda_Pruefung3_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfHarpie, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);
};

INSTANCE Info_Mod_Griselda_Pruefung4 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung4_Condition;
	information	= Info_Mod_Griselda_Pruefung4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung3))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung4_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_00"); //Ohh, wie ern�chternd, den Giften hielt er nicht stand. Schade, denn als Lohn h�tte dich die F�higkeit erwartet, den Giften zu entrinnen ...
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_01"); //Ach, wie bedauerlich, ich verga� zu erw�hnen: eine Wettschuld soll nun auf dieselbe Weise getilgt werden, hihihi.

		Mod_Griselda_Arena = -1;

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_02"); //Ohh, du hast mich �berrascht. Nicht auf den Kopf gefallen scheinst du zu sein, mein Knabe, hehehe.
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung4_15_03"); //He, was sollte das mit dem Sumpfgolem!?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_04"); //Ohh, ich verga� wohl zu erw�hnen. Aber ich sagte doch "eine Hand voll" und das k�nnen durchaus f�nf sein.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_05"); //Gleicherma�en ist ein Golem auch kein Gesch�pf der Tierwelt.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_06"); //Gr�me dich also nicht, du hast dich mutig geschlagen und Giften getrotzt, so erh�ltst du auch deine Belohnung, die Kraft den Giften zu entrinnen.

		if (Gift < 3)
		{
			Gift += 1;

			PrintScreen	("Deine Widerstandskraft gegen�ber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
		};

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_07"); //Nun, nachdem du dich so wacker geschlagen, wirst du jetzt wohl kaum verzagen und der n�chsten Pr�fung mit Freuden entgegentreten.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_08"); //Dich erwarten nun die Elemente im Ring, ein Golem des Feuers und Eises gleicherma�en.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_09"); //Es scheint gewagt, gar unm�glich beide niederzustrecken, so erlasse ich es dir auch, dich beiden zu stellen.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_10"); //Nur einen musst du in sich zusammensinken lassen und dein Kampf gilt als bestanden.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_11"); //Mehr noch, nicht von der Stelle r�hren werden sie sich.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_17_12"); //Das klingt doch nach einem rechten Kinderspiel. Was sagst du, mein T�ubchen?
	};
};

INSTANCE Info_Mod_Griselda_Pruefung5 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung5_Condition;
	information	= Info_Mod_Griselda_Pruefung5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin so weit.";
};

FUNC INT Info_Mod_Griselda_Pruefung5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung4))
	&& (Mod_Griselda_Arena == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung5_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_15_00"); //Ich bin so weit.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung5_17_01"); //Gut, so triff dein Wahl.

	Wld_InsertNpc	(Firegolem_Griselda_01, "HEXE_ARENA_TEAM_01");
	Wld_InsertNpc	(Icegolem_Griselda_01, "HEXE_ARENA_TEAM_03");

	playerIsTransformed = FALSE;

	Mod_Griselda_Arena = 0;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung5, "Warg.", Info_Mod_Griselda_Pruefung5_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung5, "Bluthund.", Info_Mod_Griselda_Pruefung5_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung5, "Hase.", Info_Mod_Griselda_Pruefung5_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung5_Wahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung5_Wahl_17_00"); //Ganz wie du w�nscht.
};

FUNC VOID Info_Mod_Griselda_Pruefung5_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_C_15_00"); //Warg.

	Info_Mod_Griselda_Pruefung5_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfWarg, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);
};

FUNC VOID Info_Mod_Griselda_Pruefung5_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_B_15_00"); //Bluthund.

	Info_Mod_Griselda_Pruefung5_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfBloodhound, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);
};

FUNC VOID Info_Mod_Griselda_Pruefung5_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_A_15_00"); //Hase.

	Info_Mod_Griselda_Pruefung5_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfRabbit, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);
};

INSTANCE Info_Mod_Griselda_Pruefung6 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung6_Condition;
	information	= Info_Mod_Griselda_Pruefung6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung5))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung6_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_00"); //Ohh, wurde es dem zarten Knaben hei� und kalt im Ringe.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_01"); //Schade, denn als Lohn h�tte dich die Widerstandkraft gegen Hitze und K�lte erwartet ...
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_02"); //Ach, wie bedauerlich, ich verga� zu erw�hnen: deine Wettschuld soll nun auf dieselbe Weise getilgt werden, hihihi.

		Mod_Griselda_Arena = -1;

		Wld_PlayEffect	("INFERNALFIRE", hero, hero, 0, 0, 0, FALSE);

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_03"); //(�berrascht) Ohh ... fast sprachlos machst du mich.
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung6_15_04"); //Warum, es war doch ein Kinderspiel.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_05"); //Nun gut, nun gut. Dann sollst du noch mehr dieser Spiele haben.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_06"); //Zuvor jedoch die Belohnung daf�r, dass du den Elementen trotztest. Die Widerstandkraft gegen sie, soll in dir wachsen.

		PrintScreen	("+5 Schutz vor Feuer und Magie", -1, -1, FONT_SCREEN, 2);

		hero.protection[PROT_FIRE] += 5;
		hero.protection[PROT_MAGIC] += 5;

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_07"); //So, bereit f�r die n�chste Runde?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_08"); //Als n�chstes stellen sich dir 3 langsame, tr�ge Untote entgegen. Und dies nicht mal zu gleicher Zeit.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_09"); //Erst, wenn du einen bezwungen hast, erscheint der n�chste.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_10"); //Ich hoffe, du bist nicht gekr�nkt, wenn ich dich mit dieser anspruchslosen Aufgabe betraue.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_17_11"); //Wenn du bereit bist, so treffe deine Wahl.

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "TRANSFORM");
	};
};

INSTANCE Info_Mod_Griselda_Pruefung7 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung7_Condition;
	information	= Info_Mod_Griselda_Pruefung7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weiter geht's.";
};

FUNC INT Info_Mod_Griselda_Pruefung7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung6))
	&& (Mod_Griselda_Arena == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung7_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_15_00"); //Weiter geht's.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung7_17_01"); //Welches Wesen soll es diesmal sein?

	Wld_InsertNpc	(Zombie_Griselda_01, "HEXE_ARENA_TEAM_01");

	playerIsTransformed = FALSE;

	Mod_Griselda_Arena = 0;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung7, "Snapper.", Info_Mod_Griselda_Pruefung7_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung7, "Keiler.", Info_Mod_Griselda_Pruefung7_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung7, "Golem.", Info_Mod_Griselda_Pruefung7_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung7_Wahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung7_Wahl_17_00"); //Wie du w�nscht.
};

FUNC VOID Info_Mod_Griselda_Pruefung7_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_C_15_00"); //Snapper.

	Info_Mod_Griselda_Pruefung7_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfSnapper, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);
};

FUNC VOID Info_Mod_Griselda_Pruefung7_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_B_15_00"); //Keiler.

	Info_Mod_Griselda_Pruefung7_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfKeiler, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);
};

FUNC VOID Info_Mod_Griselda_Pruefung7_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_A_15_00"); //Golem.

	Info_Mod_Griselda_Pruefung7_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfGolem, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);
};

INSTANCE Info_Mod_Griselda_Pruefung8 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung8_Condition;
	information	= Info_Mod_Griselda_Pruefung8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung7))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung8_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_17_00"); //Ohh, hat das Kn�blein gekr�nkelt?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_17_01"); //Schade, denn als Lohn h�tte dich die Widerstandkraft gegen Krankheiten erwartet ...
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_17_02"); //Ach, wie bedauerlich, ich verga� zu erw�hnen: deine Wettschuld soll nun auf dieselbe Weise getilgt werden, hihihi.

		Mod_Griselda_Arena = -1;

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_17_03"); //Erstaunlich, selbst dem Hauch der Pest wusstest du durch geschickte Wahl zu Widerstehen.
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung8_15_04"); //So soll auch deine Widerstandskraft gegen Krankheiten wachsen.

		if (Krankheit < 4)
		{
			Krankheit += 1;

			PrintScreen	("Deine Resistenzen gegen�ber Erkrankungen sind gestiegen.", -1, -1, FONT_SCREEN, 2);
		};

		if (KHDP < 4)
		{
			KHDP += 1;

			//PrintScreen	("Deine Widerstandskraft gegen�ber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
		};

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_17_05"); //So, gespielt hast du und viele Preise gewonnen. Willst du nicht noch ein letztes Mal spielen und mir die M�glichkeit er�ffnen, alles zur�ck zu gewinnen?
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung8_15_06"); //Was meinst du? Ich glaube ...
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_17_07"); //(kr�chzt) Es ist nicht so, dass du die Wahl h�ttest, hahahaha.
	};
};

INSTANCE Info_Mod_Griselda_Pickpocket (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pickpocket_Condition;
	information	= Info_Mod_Griselda_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Griselda_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Griselda_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);

	Info_AddChoice	(Info_Mod_Griselda_Pickpocket, DIALOG_BACK, Info_Mod_Griselda_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Griselda_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Griselda_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Griselda_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);
};

FUNC VOID Info_Mod_Griselda_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);
};

INSTANCE Info_Mod_Griselda_EXIT (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_EXIT_Condition;
	information	= Info_Mod_Griselda_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Griselda_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Griselda_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};