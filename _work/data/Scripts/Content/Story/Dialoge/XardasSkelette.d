FUNC VOID Info_Mod_XardasThroughSkeletteStart()
{
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_00"); //Bist du es, mein Freund?
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_01"); //Wenn nein, verzieh dich!
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_02"); //Wenn ja, Gl�ckwunsch!
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_03"); //Ich hatte die Suche schon aufgegeben, und nur meine treuen Helfer hier arbeiten weiter unerm�dlich.
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_04"); //Ich hoffe blo�, dass meine Skelette bei ihrer Suche nicht allzu viele versch�ttete Sektenspinner freigelegt haben.
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_05"); //Wer wei�, was Cor Kalom zu Lebzeiten alles mit ihnen angestellt hat.
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_06"); //Aber wenn du den Einsturz irgendwie �berlebt hast, sollten die paar Untote auch kein Hindernis f�r dich darstellen.
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_07"); //Ich habe dir oben bei der Schl�fer-Statue einen Zettel mit Instruktionen hinterlassen.
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_08"); //Dort findest du alles, was du zum weiteren Vorgehen ben�tigst.
	AI_Output(self, hero, "Info_Mod_XardasThroughSkeletteStart_14_09"); //Komm schleunigst zur�ck zu mir!

	Mod_OT_XardasNachricht = 1;
};

INSTANCE Info_Mod_XardasSkelett_01_Hi (C_INFO)
{
	npc		= Monster_11055_Skelett_OT;
	nr		= 1;
	condition	= Info_Mod_XardasSkelett_01_Hi_Condition;
	information	= Info_Mod_XardasSkelett_01_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_XardasSkelett_01_Hi_Condition()
{
	if (Mod_OT_XardasNachricht == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_XardasSkelett_01_Hi_Info()
{
	Info_Mod_XardasThroughSkeletteStart();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_XardasSkelett_02_Hi (C_INFO)
{
	npc		= Monster_11056_Skelett_OT;
	nr		= 1;
	condition	= Info_Mod_XardasSkelett_02_Hi_Condition;
	information	= Info_Mod_XardasSkelett_02_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_XardasSkelett_02_Hi_Condition()
{
	if (Mod_OT_XardasNachricht == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_XardasSkelett_02_Hi_Info()
{
	Info_Mod_XardasThroughSkeletteStart();

	AI_StopProcessInfos	(self);
};