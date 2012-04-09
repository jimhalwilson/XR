INSTANCE Info_Mod_Turgor_Hi (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_Hi_Condition;
	information	= Info_Mod_Turgor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Turgor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Turgor_Hi_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_01"); //Das w�sste ich auch ganz gern!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_02"); //"Geh nach Relendel", haben sie gesagt, "dort hast du einen freien Markt f�r Sumpfkraut."
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_03"); //Jaahah, aber sie haben nicht verraten, dass es hier was viel Besseres gibt!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_05_04"); //Etwas, dass das ganze beschissene Sumpfkraut unn�tig macht!

	Info_ClearChoices	(Info_Mod_Turgor_Hi);

	Info_AddChoice	(Info_Mod_Turgor_Hi, "(reden lassen und weggehen)", Info_Mod_Turgor_Hi_B);
	Info_AddChoice	(Info_Mod_Turgor_Hi, "Wer sind 'sie'?", Info_Mod_Turgor_Hi_A);
};

FUNC VOID Info_Mod_Turgor_Hi_B()
{
	AI_TurnAway	(hero, self);

	AI_Output(self, hero, "Info_Mod_Turgor_Hi_B_05_00"); //Und erst die Leute hier ... Hey, was soll das werden?!

	Info_ClearChoices	(Info_Mod_Turgor_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Turgor_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Turgor_Hi_A_15_00"); //Wer sind "sie"?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_01"); //Wo komme ich wohl her, h�?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_02"); //Die alten S�cke von Gurus wollten mich wohl loswerden.
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_03"); //Sollen sie doch in ihrem Sumpf vermodern!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_04"); //Ich werde ihnen nicht den Gefallen tun und zur�ckkehren.
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_05"); //Aber hier isses auch nicht viel besser. Die Gurus sind wenigstens ausgeglichen!
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_06"); //In Khorata gehen sich alle gegenseitig auf die Nerven, meckern rum, sind unzufrieden ...
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_07"); //So kann man nicht normal miteinander umgehen.
	AI_Output(hero, self, "Info_Mod_Turgor_Hi_A_15_08"); //F�llt dir was auf?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_09"); //(Pause) Oh, Schei�e. (betroffen) Jaah, tut mir Leid.
	AI_Output(hero, self, "Info_Mod_Turgor_Hi_A_15_10"); //K�nnen wir dann "normal miteinander umgehen"?
	AI_Output(self, hero, "Info_Mod_Turgor_Hi_A_05_11"); //'T�rlich. Haste Fragen oder wie?

	Info_ClearChoices	(Info_Mod_Turgor_Hi);
};

INSTANCE Info_Mod_Turgor_WieLaeufts (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_WieLaeufts_Condition;
	information	= Info_Mod_Turgor_WieLaeufts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie l�uft's?";
};

FUNC INT Info_Mod_Turgor_WieLaeufts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turgor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turgor_WieLaeufts_Info()
{
	AI_Output(hero, self, "Info_Mod_Turgor_WieLaeufts_15_00"); //Wie l�uft's?
	AI_Output(self, hero, "Info_Mod_Turgor_WieLaeufts_05_01"); //Haha, witzig. Das Sumpfkraut w�chst, aber niemand will's haben. Kann's h�chstens noch selbst rauchen.
};

INSTANCE Info_Mod_Turgor_Wasserfall (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_Wasserfall_Condition;
	information	= Info_Mod_Turgor_Wasserfall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Irgendwas stimmt doch mit dem Wasserfall nicht ...";
};

FUNC INT Info_Mod_Turgor_Wasserfall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turgor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Turgor_Wasserfall_Info()
{
	AI_Output(hero, self, "Info_Mod_Turgor_Wasserfall_15_00"); //Irgendwas stimmt doch mit dem Wasserfall nicht ...
	AI_Output(self, hero, "Info_Mod_Turgor_Wasserfall_05_01"); //Sag ich ja, hier sind alle meschugge. Das soll so'n Magier gewesen sein, der den Wasserfall aus dem Fels gezaubert hat.
	AI_Output(self, hero, "Info_Mod_Turgor_Wasserfall_05_02"); //Frag mich nicht, woher das Wasser kommt ...
};

INSTANCE Info_Mod_Turgor_Freudenspender (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_Freudenspender_Condition;
	information	= Info_Mod_Turgor_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich h�tte hier Freudenspender f�r dich.";
};                       

FUNC INT Info_Mod_Turgor_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Turgor_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Turgor_Freudenspender_15_00"); //Ich h�tte hier Freudenspender f�r dich.
	AI_Output(self, hero, "Info_Mod_Turgor_Freudenspender_05_01"); //Meine Fresse, du willst mich jetzt auch noch ruinieren?! Was passiert denn mit meinem Kraut?
	AI_Output(hero, self, "Info_Mod_Turgor_Freudenspender_15_02"); //Also nicht?
	AI_Output(self, hero, "Info_Mod_Turgor_Freudenspender_05_03"); //Schei�e, gib her. (brummelt) Ist einfach viel besser als 'n beschissener Stengel.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Turgor_Pickpocket (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_Pickpocket_Condition;
	information	= Info_Mod_Turgor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Turgor_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Turgor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);

	Info_AddChoice	(Info_Mod_Turgor_Pickpocket, DIALOG_BACK, Info_Mod_Turgor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Turgor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Turgor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Turgor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);
};

FUNC VOID Info_Mod_Turgor_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Turgor_Pickpocket);
};

INSTANCE Info_Mod_Turgor_EXIT (C_INFO)
{
	npc		= Mod_7397_PSINOV_Turgor_REL;
	nr		= 1;
	condition	= Info_Mod_Turgor_EXIT_Condition;
	information	= Info_Mod_Turgor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Turgor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Turgor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};