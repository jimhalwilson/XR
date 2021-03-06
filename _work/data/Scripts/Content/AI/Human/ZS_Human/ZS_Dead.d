// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgef�hrt
// wird auch vom Spieler ausgef�hrt
// *****************************************

func void ZS_Dead ()
{
	if (MeetsRespawnCondition(self)) {
		AddToRespawnArray(self);
	};

	if (!self.aivar[AIV_PARTYMEMBER])
	&& (Mod_WiederkehrRing)
	{
		Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500);
	};

	// ------ aivars resetten ------
	B_SetAivar(self, AIV_RANSACKED, FALSE);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1553_PIR_GEISTERPIRAT_DI))
	{
		Wld_SendTrigger	("EVT_DI_SCHATZHOEHLE_01");

		B_LogEntry	(TOPIC_MOD_PIRATEN_DI, "Der Geist ist besiegt. Jetzt m�ssen wir nur noch die �brigen Skelette und Zombies t�ten und dann kann der Schatz gehoben werden.");

		if (Npc_HasItems(hero, ItMi_Geisterrune) == 1)
		{
			Npc_RemoveInvItems	(hero, ItMi_Geisterrune, 1);
			CreateInvItems	(hero, ItMi_Geisterrune_Voll, 1);
		};

		Mod_GeisterpiratWurdeGekillt = 1;
	};	

	if (self.guild == GIL_DRACONIAN)
	&& (C_NpcIsHero(other))
	&& (Mod_Echsis != 1)
	{
		Mod_Echsis = 1;
	};

	if (CurrentLevel == XERESWELT_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Lord_Ghost_Xeres))
		{
			Mod_Xeres_Geister_Tot += 1;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DemonLord_Xeres))
		&& (Mod_XW_Kap6 == 12)
		{
			Mod_XW_Kap6 = 13;

			AI_Teleport	(self, "TOT");

			Wld_InsertNpc	(Minotaurus_Xeres, "ARENA_01");
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Minotaurus_Xeres))
		&& (Mod_XW_Kap6 == 13)
		{
			Mod_XW_Kap6 = 14;

			AI_Teleport	(self, "TOT");

			Wld_InsertNpc	(Balrog_Xeres, "ARENA_01");
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Balrog_Xeres))
		&& (Mod_XW_Kap6 == 14)
		{
			Mod_XW_Kap6 = 15;

			AI_Teleport	(self, "TOT");

			AI_Teleport	(Xeres_02, "ARENA_01");
			B_StartOtherRoutine	(Xeres_02, "START");
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Hammel_Lobart_01))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Hammel_Lobart_02))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Hammel_Lobart_03))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Hammel_Lobart_04))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_01))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_02))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_03))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_04))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_05))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_06))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_07))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_08))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_09))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_10))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_11))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_12))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_13))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_14))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_15))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sheep_Lobart_16))
	{
		Mod_LobartsSchafeTot += 1;
	};

	if (C_NpcIsHero(other))
	&& (self.guild > GIL_SEPERATOR_HUM)
	{
		Mod_MonsterGekillt += 1;
	};

	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM)
	{
		Mod_Echsis_GolemKiller += 1;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattensnapper))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feuersnapper))
	{
		if (Bosskampf_Pass_NW == 1)
		{
			Wld_SendTrigger	("BOSSKAMPF_PASS");

			Bosskampf_Pass_NW = 0;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Giant_Rat_Friedel))
	{
		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7519_OUT_Tyrus_REL))
		{
			Mod_REL_Wettstreit_Tyrus += 1;
		}
		else if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7518_OUT_Davon_REL))
		{
			Mod_REL_Wettstreit_Davon += 1;
		}
		else
		{
			Mod_REL_Wettstreit_Hero += 1;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Snapper_Gaan))
	{
		Mod_GaanSnapperOrni += 1;

		if (Mod_GaanSnapperOrni == 3)
		{
			AI_Teleport	(Mod_763_NONE_Gaan_NW, "NW_PASS_04");
			B_StartOtherRoutine	(Mod_763_NONE_Gaan_NW, "SNAPPER");
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7024_OUT_Sabitsch_MT))
	{
		if (Mod_SabitschTot == 0)
		{
			Mod_SabitschTot = 1;

			AI_Teleport	(Mod_962_STT_Scatty_MT, "OCR_CAMPFIRE_I_1");
			B_StartOtherRoutine	(Mod_962_STT_Scatty_MT, "SABITSCH");
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7191_OUT_Florentius_MT))
	{
		Mod_NL_HatFlorentiusGekillt = 1;
	};

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wolf_Griselda_01))
		{
			if (playerIsTransformed == FALSE)
			{
				Mod_Griselda_Arena = 1;
			}
			else
			{
				Mod_Griselda_Arena = 2;
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Blutfliege_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Blutfliege_Griselda_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Spinne_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Spinne_Griselda_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SwampGolem_Griselda_01))
		{
			if (playerIsTransformed == FALSE)
			{
				Mod_Griselda_Arena = 1;
			}
			else
			{
				if (Mod_Griselda_Arena == 0)
				{
					Mod_Griselda_Arena = 1;
				}
				else if (Mod_Griselda_Arena == 1)
				{
					Mod_Griselda_Arena -= 1;
				};

				Mod_Griselda_Arena += 1;

				if (Mod_Griselda_Arena == 5)
				{
					Wld_InsertNpc	(SwampGolem_Griselda_01, "HEXE_ARENA_SPAWN_SOLO_01");
				};
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Firegolem_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Icegolem_Griselda_01))
		{
			if (playerIsTransformed == FALSE)
			{
				Mod_Griselda_Arena = 1;
			}
			else
			{
				Mod_Griselda_Arena = 2;

				B_MagicHurtNpc (hero, Firegolem_Griselda_01, 99999);
				B_MagicHurtNpc (hero, Icegolem_Griselda_01, 99999);				
			};
		};
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_Griselda_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_Griselda_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_Griselda_03))
		{
			if (playerIsTransformed == FALSE)
			{
				Mod_Griselda_Arena = 1;
			}
			else
			{
				if (Mod_Griselda_Arena == 0)
				{
					Mod_Griselda_Arena = 1;
				}
				else if (Mod_Griselda_Arena == 1)
				{
					Mod_Griselda_Arena -= 1;
				};

				Mod_Griselda_Arena += 1;

				if (Mod_Griselda_Arena == 2)
				{
					Wld_InsertNpc	(Zombie_Griselda_02, "HEXE_ARENA_SPAWN_SOLO_01");
				}
				else if (Mod_Griselda_Arena == 3)
				{
					Wld_InsertNpc	(Zombie_Griselda_03, "HEXE_ARENA_SPAWN_SOLO_01");
				};
			};
		};
	};

	B_GiveDeathInv(self);

	if (self.guild == GIL_SHEEP)
	&& (Mod_WM_IsWarg == 1)
	{
		Mod_WM_SheepKiller += 1;

		if (Mod_WM_SheepKiller == 5)
		{
			B_StartOtherRoutine	(Mod_104_BAU_Rega_NW, "WOLF");
			B_StartOtherRoutine	(Mod_783_BAU_Elena_NW, "WOLF");
			B_StartOtherRoutine	(Mod_1403_BAU_Baeuerin_NW, "WOLF");
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7387_Signalfeuer_AW))
	{
		Wld_SendTrigger	("SIGNALFEUER_01_01");
		Wld_SendTrigger	("SIGNALFEUER_01_02");

		Mod_EchsenQuest_02 += 1;

		if (Mod_EchsenQuest_02 == 5)
		{
			Wld_SendTrigger	("BIGSIGNALFEUER");
			Wld_SendTrigger	("BIGSIGNALFEUER_01");

			Mod_EchsenQuest_02 = 6;

			B_GivePlayerXP	(500);

			B_LogEntry_More	(TOPIC_MOD_ECHSEN_VERTRAUEN, TOPIC_MOD_ECHSEN_SIGNALFEUER, "Ich habe vier Signalfeuer entfacht.", "Die Feuer brennen.");
			B_SetTopicStatus	(TOPIC_MOD_ECHSEN_SIGNALFEUER, LOG_SUCCESS);
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7388_Signalfeuer_AW))
	{
		Wld_SendTrigger	("SIGNALFEUER_02_01");
		Wld_SendTrigger	("SIGNALFEUER_02_02");

		Mod_EchsenQuest_02 += 1;

		if (Mod_EchsenQuest_02 == 5)
		{
			Wld_SendTrigger	("BIGSIGNALFEUER");
			Wld_SendTrigger	("BIGSIGNALFEUER_01");

			Mod_EchsenQuest_02 = 6;

			B_GivePlayerXP	(500);

			B_LogEntry_More	(TOPIC_MOD_ECHSEN_VERTRAUEN, TOPIC_MOD_ECHSEN_SIGNALFEUER, "Ich habe vier Signalfeuer entfacht.", "Die Feuer brennen.");
			B_SetTopicStatus	(TOPIC_MOD_ECHSEN_SIGNALFEUER, LOG_SUCCESS);
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7389_Signalfeuer_AW))
	{
		Wld_SendTrigger	("SIGNALFEUER_03_01");
		Wld_SendTrigger	("SIGNALFEUER_03_02");

		Mod_EchsenQuest_02 += 1;

		if (Mod_EchsenQuest_02 == 5)
		{
			Wld_SendTrigger	("BIGSIGNALFEUER");
			Wld_SendTrigger	("BIGSIGNALFEUER_01");

			Mod_EchsenQuest_02 = 6;

			B_GivePlayerXP	(500);

			B_LogEntry_More	(TOPIC_MOD_ECHSEN_VERTRAUEN, TOPIC_MOD_ECHSEN_SIGNALFEUER, "Ich habe vier Signalfeuer entfacht.", "Die Feuer brennen.");
			B_SetTopicStatus	(TOPIC_MOD_ECHSEN_SIGNALFEUER, LOG_SUCCESS);
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7390_Signalfeuer_AW))
	{
		Wld_SendTrigger	("SIGNALFEUER_04_01");
		Wld_SendTrigger	("SIGNALFEUER_04_02");

		Mod_EchsenQuest_02 += 1;

		if (Mod_EchsenQuest_02 == 5)
		{
			Wld_SendTrigger	("BIGSIGNALFEUER");
			Wld_SendTrigger	("BIGSIGNALFEUER_01");

			Mod_EchsenQuest_02 = 6;

			B_GivePlayerXP	(500);

			B_LogEntry_More	(TOPIC_MOD_ECHSEN_VERTRAUEN, TOPIC_MOD_ECHSEN_SIGNALFEUER, "Ich habe vier Signalfeuer entfacht.", "Die Feuer brennen.");
			B_SetTopicStatus	(TOPIC_MOD_ECHSEN_SIGNALFEUER, LOG_SUCCESS);
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Matrone))
	{
		TUG_Matronen += 1;

		if (TUG_Matronen < 4)
		{
			Print (ConcatStrings(IntToString(4-TUG_Matronen), " Matronen �brig"));
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fake_Hero))
	{
		B_LogEntry	(TOPIC_MOD_URIZIEL, "Der Gestaltwandler in Jharkendar ist besiegt. Ich brauche noch seinen Seelenstein.");
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattenlord_999_Urnol))
	{
		B_LogEntry	(TOPIC_MOD_URIZIEL, "Urnol ist tot. Jetzt nur noch seinen Seelenstein holen ...");
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_537_NONE_Lehmar_NW))
	{
		Mod_LehmarTot = 1;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Undead))
	{
		B_LogEntry	(TOPIC_MOD_URIZIEL, "Ein untoter Drache ... jetzt ist er tot. Nur noch den Seelenstein mitnehmen und es kann weitergehen.");
	};

	if (self.guild < GIL_SEPERATOR_HUM)
	&& (C_NpcIsHero(other))
	&& (Piratenhut_Equipped == 1)
	{
		var int BlackbartsRandi;
		BlackbartsRandi = Hlp_Random(21);

		if (BlackbartsRandi == 0)
		{
			CreateInvItems	(self, ItMi_GoldRing, 1);
		}
		else
		{
			CreateInvItems	(self, ItMi_Gold, BlackbartsRandi);
		};
	};

	if (Seele_unterwegs == TRUE)
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_SEELE))
	{
		B_KillNpc (hero);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
	&& (Mod_WM_Boeden >= 14)
	{
		CreateInvItems	(Mod_783_BAU_Elena_NW, ItWr_InubisZettel, 1);
		CreateInvItems	(Mod_783_BAU_Elena_NW, ItWr_ElenaNotiz, 1);
		CreateInvItems	(Mod_783_BAU_Elena_NW, ItKe_Elena, 1);
	};
	
	if (Seele_unterwegs==TRUE)
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Hero))
	{
		B_KillNpc (PC_seele);
	};
		
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(engel))
	{
		Wld_PlayEffect ("MFX_engel_HEAVENLIGHT2", self, self, 0, 0, 0, FALSE);
		B_RemoveNpc(self);
	};
		
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1082_BAU_Rufus_MT))
	&& (C_NpcIsHero(other))
	{
		Mod_SLD_Rufus = 5;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swampshark_Undead))
	&& (Npc_HasItems(hero, ItMi_SumpfhaiStein) == 1)
	&& ((C_NpcIsHero(other))
	|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_1219_TPL_Templer_MT))
	|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_1218_TPL_Templer_MT)))
	{
		Mod_Sekte_UDS_Stein += 1;
	};

	if (Parasit_Perk == TRUE)
	{
		Npc_ChangeAttribute(hero, ATR_HITPOINTS, (self.attribute[ATR_HITPOINTS_MAX]/10));
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1113_GRD_Fletcher_MT))
	{
		B_LogEntry	(TOPIC_MOD_AL_KillMission, "Fletcher ist tot.");
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1902_STT_Ian_MT))
	{
		B_LogEntry	(TOPIC_MOD_AL_KillMission, "Ian ist tot.");
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1025_KGD_Cathran_MT))
	{
		B_LogEntry	(TOPIC_MOD_AL_KillMission, "Cathran ist tot.");
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Thorge_TUG))
	{
		Mod_Thorge_Skelette -= 1;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7174_DEM_Randolph_NW))
	&& (Mod_Randolph_Started == 11)
	{
		Mod_Randolph_Started = 13;

		B_SetTopicStatus	(TOPIC_MOD_AKIL_RANDOLPH, LOG_SUCCESS);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonSnapper_Bergwelt))
	{
		DragonSnapper_Bergwelt_Counter += 1;

		if (DragonSnapper_Bergwelt_Counter == 10)
		{
			Wld_SendTrigger	("EVT_BW_TOR");

			DragonSnapper_Bergwelt_Counter = 11;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1859_HEX_Hexenqueen_PAT))
	{
		Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

		B_StartOtherRoutine	(Mod_1771_KDF_Aaron_PAT, "BOSS");

		Mod_FM_AtHexe = 4;

		AI_Teleport	(PC_Hero, "WP_PAT_WEG_183");
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattenlord_999_Urnol))
	{
		Mod_IstUrnolTot = TRUE;
	};
		

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1741_PSITPL_Templer_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1742_PSITPL_Templer_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1743_PSITPL_Templer_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1744_PSITPL_Templer_MT)))
	{
		Mod_PalaStory_Mine_Sektis += 1;

		if (Mod_PalaStory_Mine_Sektis == 4)
		{
			B_LogEntry	(TOPIC_MOD_MILIZ_MINE, "Die 'Banditen' sind erledigt. Ich sollte Lord Andre davon berichten, dass wieder die Sektenspinner anwesend waren.");

			Mod_PalaStory_Mine_Sektis = 5;
		};
	};

	if (C_NpcIsSeelenpeiniger(self))
	{
		self.wp = "TOT";
		AI_Teleport	(self, "TOT");
		B_RemoveNpc	(self);
	};

	var C_ITEM AxtTest;

	AxtTest = Npc_GetReadiedWeapon(other);

	if (Hlp_IsItem(AxtTest, ItMw_AxtDesUntergangs))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PC_Hero))
	{
		AxtDamage += 2;

		AxtUpgrade = 0;
	};

	if (self.npctype == NPCTYPE_PAT_HEXE)
	{
		var string Hexentext;

		Mod_FM_Hexencounter -= 1;

		if (Mod_FM_Hexencounter > 1)
		{
			Hexentext = ConcatStrings("Noch ", IntToString (Mod_FM_Hexencounter));
			Hexentext = ConcatStrings(Hexentext, " Hexen �brig!");
		}
		else if (Mod_FM_Hexencounter == 1)
		{
			Hexentext = ConcatStrings("Noch ", IntToString (Mod_FM_Hexencounter));
			Hexentext = ConcatStrings(Hexentext, " Hexe �brig!");
		}
		else
		{
			Hexentext = "Alle Hexen erledigt!";
		};

		AI_PrintScreen	(Hexentext, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_s_Pat))
	{
		B_StartOtherRoutine	(Mod_1771_KDF_Aaron_PAT, "FLUCHT");
		Wld_InsertNpc	(Mod_1772_KDF_Gizar_PAT,	"WP_PAT_WEG_161");
	};

	if (self.aivar[AIV_ZAEHMEN] == TRUE)
	{
		Monster_Gezaehmt = FALSE;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_02))
	&& (Mod_Xeres_Ende == 0)
	{
		B_StartOtherRoutine	(PC_Friend_XW, "ARENA");

		Mod_Xeres_Ende = 1;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Friend_XW))
	&& (Mod_Xeres_Ende == 1)
	{
		Mod_Xeres_Ende = 2;

		B_LogEntry	(TOPIC_MOD_ARGEZ, "Argez, der letzte Machttr�ger von Xeres, ist tot. Damit ist der Weg zu seiner Vernichtung offen.");
		B_SetTopicStatus	(TOPIC_MOD_ARGEZ, LOG_SUCCESS);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_03))
	&& (Mod_Xeres_Ende == 2)
	{
		Mod_Xeres_Ende = 3;

		B_LogEntry	(TOPIC_MOD_XERES, "Xeres ist besiegt und das �bel damit beseitigt.");
		B_SetTopicStatus	(TOPIC_MOD_XERES, LOG_SUCCESS);

		B_Extro_AVI();
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7315_BK_Bshydal_AW))
	{
		Npc_ExchangeRoutine	(Mod_7315_BK_Bshydal_AW,	"TOT");

		AI_Teleport	(Mod_7315_BK_Bshydal_AW,	"TOT");

		Mod_BEL_Bshydal = 2;
	};

	if (self.guild > GIL_SEPERATOR_HUM)
	{
		Monster_Hat += 1;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Lurker_H�hle))
	{
		Mod_KG_LURKER += 1;
	};
	
	if (Mod_Balthasar_Wolf < 3)
	&& ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Balthi_YWolf1))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Balthi_YWolf2))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Balthi_YWolf3)))
	{
		Mod_Balthasar_Wolf += 1;

		if (Mod_Balthasar_Wolf == 3)
		{
			B_StartOtherRoutine	(Mod_101_BAU_Balthasar_NW, "START");
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rabbit_Gomez))
	{
		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_517_DMR_Gomez_MT))
		{
			Mod_Gomez_HasenKiller += 1;
		}
		else
		{
			Mod_Gomez_HasenKiller2 += 1;
		};
	};

	if (other.guild == GIL_DRACONIAN)
	&& (self.guild == GIL_SWAMPGOLEM)
	{
		other.exp += 1;

		B_EchsenBody(other);
	};
	
	// ------ XP ------
	B_EXPVerteiler (self, other);

	// ------ Greg ------

	var int GiftChance;
	GiftChance = 0;
	
	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	&& (GGD_Sumpfgasdrohne_Time == 0)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		{
			//other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);

			// Wahrscheinlichkeit, eine Vergiftung zu erleiden

			if (Gift == 0)
			{
				GiftChance = 100; //100%
			}
			else if (Gift == 1)
			{
				GiftChance = 85; //- 15%
			}
			else if (Gift == 2)
			{
				GiftChance = 72; //nochmal -15% vom Rest
			}
			else if (Gift == 3)
			{
				GiftChance = 61; //nochmal -15% vom Rest
			};

			if (Hlp_Random(100) < GiftChance)
			{
				// Zeit erh�hen

				if (Giftdampf == 0)
				{
					GGD_Sumpfgasdrohne_Time += 10;
				}
				else if (Giftdampf == 1) // 20% weniger
				{
					GGD_Sumpfgasdrohne_Time += 8;
				}
				else if (Giftdampf == 2) // 40% weniger
				{
					GGD_Sumpfgasdrohne_Time += 6;
				}
				else if (Giftdampf == 3) // 60% weniger
				{
					GGD_Sumpfgasdrohne_Time += 4;
				}
				else if (Giftdampf == 4) // 80% weniger
				{
					GGD_Sumpfgasdrohne_Time += 2;
				};

				// neuer Schaden

				if (Giftdampf == 0)
				{
					GGD_Sumpfgasdrohne_Damage = 20;
				}
				else if (Giftdampf == 1) // 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage = 18;
				}
				else if (Giftdampf == 2) // noch mal 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage += 16;
				}
				else if (Giftdampf == 3) // und noch mal 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage = 14;
				}
				else if (Giftdampf == 4) // und noch mal 10% weniger
				{
					GGD_Sumpfgasdrohne_Damage = 13;
				};
			};
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Lich_11008_NW))
	&& (Mod_NL_HasKamm < 2)
	{
		self.wp = "TOT";
		AI_Teleport	(self, "TOT");
		B_RemoveNpc (self);

		Wld_InsertNpc	(Lich_11008_NW, "LICH");
	};

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11069_Emma_REL))
		&& (Mod_Metzger_Schaf < 4)
		{
			Mod_Metzger_Schaf = 3;
		};
	};
	
	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM)
	&& (GGD_Sumpfgolem_Time == 0)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		&& (Mod_TrfSkeleton2 == 0)
		{
			//other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);

			// Wahrscheinlichkeit, eine Vergiftung zu erleiden

			if (Gift == 0)
			{
				GiftChance = 100; //100%
			}
			else if (Gift == 1)
			{
				GiftChance = 85; //- 15%
			}
			else if (Gift == 2)
			{
				GiftChance = 72; //nochmal -15% vom Rest
			}
			else if (Gift == 3)
			{
				GiftChance = 61; //nochmal -15% vom Rest
			};

			if (Hlp_Random(100) < GiftChance)
			{
				// Zeit erh�hen

				if (Giftdampf == 0)
				{
					GGD_Sumpfgolem_Time += 10;
				}
				else if (Giftdampf == 1) // 20% weniger
				{
					GGD_Sumpfgolem_Time += 8;
				}
				else if (Giftdampf == 2) // 40% weniger
				{
					GGD_Sumpfgolem_Time += 6;
				}
				else if (Giftdampf == 3) // 60% weniger
				{
					GGD_Sumpfgolem_Time += 4;
				}
				else if (Giftdampf == 4) // 80% weniger
				{
					GGD_Sumpfgolem_Time += 2;
				};

				// neuer Schaden

				if (Giftdampf == 0)
				{
					GGD_Sumpfgolem_Damage = 20;
				}
				else if (Giftdampf == 1) // 10% weniger
				{
					GGD_Sumpfgolem_Damage = 18;
				}
				else if (Giftdampf == 2) // noch mal 10% weniger
				{
					GGD_Sumpfgolem_Damage = 16;
				}
				else if (Giftdampf == 3) // und noch mal 10% weniger
				{
					GGD_Sumpfgolem_Damage = 14;
				}
				else if (Giftdampf == 4) // und noch mal 10% weniger
				{
					GGD_Sumpfgolem_Damage = 13;
				};
			};
		};
	};
	
	if (Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;		
	};
		
	// ------ weil sonst H�ndler bevor man zum ersten Mal TRADE gew�hlt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN!!!!!!!!!!!!!!!

	// ------ Monster-Inventory abh�ngig vom Spieler-Talent ------
	B_GiveDeathInv(self);

	B_ClearRuneInv(self); //klaue alle runen!!
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	B_SetAivar(self, AIV_NpcSawPlayerCommit, CRIME_NONE);
	
	// ------ Equippte Waffen k�nnen nicht genommen werden! ------
	AI_UnequipWeapons (self);

	B_AutoPlundering(self, other);

	if (self.guild == GIL_GOBBO)
	|| (self.guild == GIL_GOBBO_SKELETON)
	|| (self.guild == GIL_SUMMONED_GOBBO_SKELETON)
	|| (self.guild == GIL_SKELETON)
	{
		//Npc_SetToFightMode (self, 0);

		Npc_RemoveInvItems	(self, ItMw_1h_Bau_Mace, 1);
		Npc_RemoveInvItems	(self, ItMw_1h_MISC_Sword, 1);
		Npc_RemoveInvItems	(self, ItMw_Matronenkeule, 1);
	};

	if (self.aivar[AIV_VictoryXPGiven] == TRUE)
	{
		B_PraxisErfahrung(other, self);

		self.aivar[AIV_VictoryXPGiven] = 2;
	};
	
	self.aivar[AIV_TAPOSITION] = FALSE;

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Nightmare))
	{
		Wld_InsertNpc(Nightmare_Skeleton,	Npc_GetNearestWP(self));
	};
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		B_DragonKillCounter (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_CONTINUE;
};
