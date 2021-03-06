// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_EXIT (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 999;
	condition	= DIA_Mil_305_Torwache_EXIT_Condition;
	information	= DIA_Mil_305_Torwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_305_Torwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Ich BIN B�rger!  				  
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_PassAsCitizen (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information	= DIA_Mil_305_Torwache_PassAsCitizen_Info;
	important	= TRUE;
};                       
FUNC INT DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{	
	if (Mod_IstLehrling == 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output (self, hero, "DIA_Mil_305_Torwache_PassAsCitizen_03_00"); //Auf dich hab ich gewartet!
	AI_Output (hero, self, "DIA_Mil_305_Torwache_PassAsCitizen_15_01"); //Hab ich was verbrochen?
	AI_Output (self, hero, "DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //(lacht) Bestimmt. Aber darum geht's nicht. Lord Hagen will dich sehen. Geradeaus im Rathaus.
		
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	
	//B_CheckLog();
	AI_StopProcessInfos (self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_305_Checkpoint	= "NW_CITY_UPTOWN_PATH_02";	//WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
//	var int Mil_305_schonmalreingelassen; Hab ich mal in Globals geschrieben, weils im Close Log abgefragt wird Mattes
// -----------------------------------------------------------

instance DIA_Mil_305_Torwache_FirstWarn (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_FirstWarn_Condition;
	information	= DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_305_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (Mil_305_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_305_schonmalreingelassen == TRUE)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_00"); //HALT!

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_01"); //Du wirst in der Stadt als M�rder gesucht! Bis die Sache gekl�rt ist, kann ich dich nicht ins obere Viertel lassen.
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_02"); //Solange du des Diebstahls angeklagt bist, kannst du nicht in obere Viertel!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_03"); //Einen Unruhestifter wie dich kann ich nicht ins obere Viertel lassen.
		};
	
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_04"); //Geh zu Lord Andre und regele die Sache!
	}
	
	// ------ normales Reinkommen ------
	else 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_FirstWarn_03_05"); //Nur B�rger der Stadt und Truppen des K�nigs kommen ins obere Viertel!
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_SecondWarn (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 2;
	condition	= DIA_Mil_305_Torwache_SecondWarn_Condition;
	information	= DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_305_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_SecondWarn_03_00"); //Ich sag's dir zum letzten Mal. Einen Schritt weiter und du begibst dich in die Welt des Schmerzes!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_Attack (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_Attack_Condition;
	information	= DIA_Mil_305_Torwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_305_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_305_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_305_Torwache_Attack_03_00"); //Du hast es so gewollt ...
	AI_StopProcessInfos	(self);	
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};

INSTANCE DIA_Mil_305_Torwache_ToHagen (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_ToHagen_Condition;
	information	= DIA_Mil_305_Torwache_ToHagen_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Mil_305_Torwache_ToHagen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Flucht))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_ToHagen_Info()
{
	AI_Output (self, other,"DIA_Mil_305_Torwache_ToHagen_03_00"); //Stop!
	AI_Output (self, other,"DIA_Mil_305_Torwache_ToHagen_03_01"); //Der B�rger Bodo hat uns davon berichtet dass du ein gesuchter Bandit aus dem Minental bist.
	AI_Output (hero, self,"DIA_Mil_305_Torwache_ToHagen_15_02"); //Was? Ich habe ein wichtiges Anliegen an die Paladine. Geh zu Lord Hagen und sag ihm, dass mich Alissandro geschickt hat, er wird mich sicher empfangen.
	AI_Output (self, other,"DIA_Mil_305_Torwache_ToHagen_03_03"); //Oh nein, das werde ich nicht machen. Du wirst per Haftbefehl gesucht, Freundchen, und deshalb kommst du jetzt einmal sch�n mit.

	AI_StopProcessInfos	(self);	

	B_StartOtherRoutine	(Mod_540_PAL_Andre_NW,	"KNAST");

	AI_Teleport	(hero, "WP_HERO_KNAST"); 

	B_LogEntry	(TOPIC_MOD_AL_FLUCHT, "In der Stadt wurde ich festgenommen. Lord Andre wird mich nun verh�ren.");

	if (Mod_Zellentuer_Knast_01 == 1)
	{
		Mod_Zellentuer_Knast_01 = 0;

		Wld_SendTrigger	("EVT_CITY_PRISON_03");
	};
};

	

// ***************************************************************
//							Ausnahme (PERM)
// ***************************************************************
instance DIA_Mil_305_Torwache_Ausnahme (C_INFO)
{
	npc			 = 	Mil_305_Torwache;
	nr			 = 	2;
	condition	 = 	DIA_Mil_305_Torwache_Ausnahme_Condition;
	information	 = 	DIA_Mil_305_Torwache_Ausnahme_Info;
	permanent    =  TRUE;
	description	 = 	"K�nnen wir nicht mal eine Ausnahme machen?";
};
func int DIA_Mil_305_Torwache_Ausnahme_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Mil_305_Torwache_Ausnahme_Info ()
{
	AI_Output (other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //K�nnen wir nicht mal eine Ausnahme machen?
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //(poltert) Was?! Es gibt Regeln in dieser Stadt! Regeln, die f�r ausnahmslos alle gelten!
	AI_Output (self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //Wenn wir diese Regeln brechen, handeln wir ungerecht gegen alle, die sie einhalten.
};	


// ************************************************************
// 						Pass as MILIZ
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_PassAsMil (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_PassAsMil_Condition;
	information	= DIA_Mil_305_Torwache_PassAsMil_Info;
	permanent 	= TRUE; 
	description	= "Ich geh�re zur Miliz - lass mich rein!";
};                       

FUNC INT DIA_Mil_305_Torwache_PassAsMil_Condition()
{	
	if ((Mod_Gilde == 1)
	|| (Mod_Gilde == 2)
	|| (Mod_Gilde == 3))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PassAsMil_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMil_15_00"); //Ich geh�re zur Miliz - lass mich rein!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_01"); //Andre hat dich also aufgenommen? Dann kannst du ja nicht so'n schlechter Kerl sein!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMil_03_02"); //Du geh�rst ab jetzt zu den Besch�tzern der Stadt! Also sei sch�n freundlich zu den B�rgern!
	
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	//B_CheckLog();
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Pass as MAGE
// ************************************************************

INSTANCE DIA_Mil_305_Torwache_PassAsMage (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 3;
	condition	= DIA_Mil_305_Torwache_PassAsMage_Condition;
	information	= DIA_Mil_305_Torwache_PassAsMage_Info;
	permanent 	= TRUE; 
	description	= "Du wagst es, dich einem Vertreter Innos' in den Weg zu stellen?!";
};                       

FUNC INT DIA_Mil_305_Torwache_PassAsMage_Condition()
{	
	if (other.guild == GIL_VLK)
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PassAsMage_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_00"); //Du wagst es, dich einem Vertreter Innos' in den Weg zu stellen?!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_01"); //�hm ... nein! Nat�rlich nicht! Der Zugang steht den Erw�hlten Innos' frei!
	AI_Output (other, self,"DIA_Mil_305_Torwache_PassAsMage_15_02"); //Bete zu Innos f�r diesen Frevel!
	AI_Output (self, other,"DIA_Mil_305_Torwache_PassAsMage_03_03"); //Ja, Erw�hlter!
	
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	//B_CheckLog();
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
INSTANCE DIA_Mil_305_Torwache_PERM (C_INFO)
{
	npc			= Mil_305_Torwache;
	nr			= 1;
	condition	= DIA_Mil_305_Torwache_PERM_Condition;
	information	= DIA_Mil_305_Torwache_PERM_Info;
	permanent	= TRUE;
	description	= "Wie steht's?";
};        
         
FUNC INT DIA_Mil_305_Torwache_PERM_Condition()
{	
	if (Mil_305_schonmalreingelassen == TRUE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Mil_305_Torwache_PERM_15_00"); //Wie steht's?
	
	if (other.guild == GIL_PAL) 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_01"); //Alles in Ordnung, Kamerad!
	}
	else if (other.guild == GIL_VLK)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_02"); //Wir erf�llen hier nur unsere Pflicht. Danke, dass du mich beachtet hast, Erw�hlter!
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_03"); //Ich muss dich reinlassen, aber reden muss ich mit dir nicht!
	}
	else //GIL_None 
	{
		AI_Output (self, other,"DIA_Mil_305_Torwache_PERM_03_04"); //Was willst du?
	};
	
	AI_StopProcessInfos	(self);
};