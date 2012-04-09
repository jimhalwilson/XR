INSTANCE Info_Mod_Maria_Unheil (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_Unheil_Condition;
	information	= Info_Mod_Maria_Unheil_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich h�rte, dass es dir nicht so gut geht.";
};

FUNC INT Info_Mod_Maria_Unheil_Condition()
{
	if ((Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13))
	&& ((Npc_KnowsInfo(hero, Info_Mod_Bobo_Unheil))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil)))
	&& (Mod_WM_MariaGeheilt == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_15_00"); //Ich h�rte, dass es dir nicht so gut geht.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_17_01"); //Ach, es ist wirklich schlimm. Dieses beklemmende Gef�hl, die Schw�che und diese dunklen Visionen. Und nichts scheint zu helfen.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_17_02"); //Wenn sich nicht meine neue Magd so aufopferungsvoll um mich k�mmern w�rde, w�sste ich nicht, was ich t�te.

	Info_ClearChoices	(Info_Mod_Maria_Unheil);

	if (Npc_HasItems(hero, ItPo_Health_01) > 0)
	|| (Npc_HasItems(hero, ItPo_HealBesessenheit) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Vielleicht kann dir dieser Trank helfen.", Info_Mod_Maria_Unheil_B);
	};
	Info_AddChoice	(Info_Mod_Maria_Unheil, "Das tut mir Leid. Ich w�nsche dir gute Besserung.", Info_Mod_Maria_Unheil_A);
};

FUNC VOID Info_Mod_Maria_Unheil_B()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_B_15_00"); //Vielleicht kann dir dieser Trank helfen.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);

	if (Npc_HasItems(hero, ItPo_HealBesessenheit) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Heilung von Besessenheit", Info_Mod_Maria_Unheil_D);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Essenz der Heilung", Info_Mod_Maria_Unheil_C);
	};
};

FUNC VOID Info_Mod_Maria_Unheil_A()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_A_15_00"); //Das tut mir Leid. Ich w�nsche dir gute Besserung.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

FUNC VOID Info_Mod_Maria_Unheil_D()
{
	B_GiveInvItems	(hero, self, ItPo_HealBesessenheit, 1);

	B_UseItem	(self, ItPo_HealBesessenheit);

	AI_Output(self, hero, "Info_Mod_Maria_Unheil_D_17_00"); //Was ist geschehen? Ich sp�re wie meine Kr�fte zur�ckkehren, mein Geist klar wird.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_D_17_01"); //Wie soll ich dir nur danken ... Geh zu Onar. Er soll dich mit 400 Goldm�nzen entlohnen.

	Mod_WM_MariaGeheilt = 1;
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

FUNC VOID Info_Mod_Maria_Unheil_C()
{
	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);

	AI_Output(self, hero, "Info_Mod_Maria_Unheil_C_17_00"); //Ach, ich danke dir, aber auch das scheint nicht zu helfen.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

INSTANCE Info_Mod_Maria_BelohnungOnar (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_BelohnungOnar_Condition;
	information	= Info_Mod_Maria_BelohnungOnar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bei Onar. Er hat mir nur 200 Goldm�nzen gegeben.";
};

FUNC INT Info_Mod_Maria_BelohnungOnar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_BelohnungMaria))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_BelohnungOnar_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_BelohnungOnar_15_00"); //Ich war bei Onar. Er hat mir nur 200 Goldm�nzen gegeben.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungOnar_17_01"); //Ach, dieser alte Geizkragen. Hmm,� geh zu Wasili. Er soll dir die restlichen Goldm�nzen geben.
};

INSTANCE Info_Mod_Maria_BelohnungWasili (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_BelohnungWasili_Condition;
	information	= Info_Mod_Maria_BelohnungWasili_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wasili hat mir nur 100 Goldm�nzen gegeben.";
};

FUNC INT Info_Mod_Maria_BelohnungWasili_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wasili_BelohnungMaria))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_BelohnungWasili_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_BelohnungWasili_15_00"); //Wasili hat mir nur 100 Goldm�nzen gegeben.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_01"); //Ohh, hmm ... dann bleibt mir nicht anderes �brig. Geschieht ihm auch ganz recht dem alten Schwein.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_02"); //Denkt wohl ich w�sste nichts von seinen Geschichten mit den M�gden und B�uerinnen ...
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_03"); //Wenn du unter Onars Matratze schaust, wirst du bestimmt mehr als genug finden. Aber dass es blo� unter uns bleibt ...

	MOBNAME_XR_ONARSVERSTECK = "Onar's Versteck";
};

INSTANCE Info_Mod_Maria_Pickpocket (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_Pickpocket_Condition;
	information	= Info_Mod_Maria_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Maria_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Maria_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

	Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_BACK, Info_Mod_Maria_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Maria_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Maria_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
};

FUNC VOID Info_Mod_Maria_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
};

INSTANCE Info_Mod_Maria_EXIT (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_EXIT_Condition;
	information	= Info_Mod_Maria_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Maria_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Maria_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};