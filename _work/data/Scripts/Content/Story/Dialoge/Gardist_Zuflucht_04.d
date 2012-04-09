INSTANCE Info_Mod_Gardist_Zuflucht_04_Hi (C_INFO)
{
	npc		= Mod_1920_GRD_Gardist_MT;
	nr		= 1;
	condition	= Info_Mod_Gardist_Zuflucht_04_Hi_Condition;
	information	= Info_Mod_Gardist_Zuflucht_04_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alissandro schickt mich.";
};

FUNC INT Info_Mod_Gardist_Zuflucht_04_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_GotoZufluchten))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gardist_Zuflucht_04_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Gardist_Zuflucht_04_Hi_15_00"); //Alissandro schickt mich, du sollst ins Sektenlager gehen.
	AI_Output(self, hero, "Info_Mod_Gardist_Zuflucht_04_Hi_09_01"); //In Ordnung, ich mach mich sofort auf den Weg.

	B_StartOtherRoutine	(self, "PSICAMP");
};

INSTANCE Info_Mod_Gardist_Zuflucht_04_EXIT (C_INFO)
{
	npc		= Mod_1920_GRD_Gardist_MT;
	nr		= 1;
	condition	= Info_Mod_Gardist_Zuflucht_04_EXIT_Condition;
	information	= Info_Mod_Gardist_Zuflucht_04_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gardist_Zuflucht_04_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gardist_Zuflucht_04_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};