func int C_Beklauen (var int TheftDex, var int TheftItem, var int TheftGold)
{
	var int bonusdex;
	bonusdex = 0;

	if (Mod_BlickfangAmulett)
	{
		bonusdex = 25;
	};

	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY]+bonusdex >= (TheftDex - Theftdiff))
	{
		if (Npc_IsInState (self, ZS_Talk))
		{
			if (TheftDex <= 20)
			{
				TheftDexGlob = 10; //"Kinderspiel" klappt immer
			}
			else
			{
				TheftDexGlob = TheftDex;
			};

			TheftItemGlob = TheftItem;

			TheftGoldGlob = TheftGold;
		};
		return TRUE;
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_751_NONE_Salandril_NW))
	&& (TheftGold == ItPo_Perm_DEX_Salandril)
	&& (Npc_HasItems(hero, ItPo_Perm_DEX_Salandril) == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gaertner_HierTrank))
	{
		if (Npc_IsInState (self, ZS_Talk))
		{
			if (TheftDex <= 20)
			{
				TheftDexGlob = 10; //"Kinderspiel" klappt immer
			}
			else
			{
				TheftDexGlob = TheftDex;
			};

			TheftItemGlob = TheftItem;

			TheftGoldGlob = TheftGold;
		};
		return TRUE;
	};

};

var int RealAmount;	
	
func void B_Beklauen ()
{	
	var int bonusdex;
	bonusdex = 0;

	if (Mod_BlickfangAmulett)
	{
		bonusdex = 25;
	};

	if (other.attribute[ATR_DEXTERITY]+bonusdex >= TheftDexGlob)
	{
		RealAmount = Hlp_Random(TheftGoldGlob)+((hero.attribute[ATR_DEXTERITY]+bonusdex-TheftDexGlob)*(1+(TheftDexGlob%20)));

		if (RealAmount > TheftGoldGlob)
		{
			RealAmount = TheftGoldGlob;
		};

		TheftGoldGlob = RealAmount;

		B_GiveInvItems (self, other, TheftItemGlob, TheftGoldGlob);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();//B_GivePlayerXP (XP_Ambient);
		Snd_Play ("Geldbeutel");

		B_Göttergefallen(3, 1);

		Mod_CountTaschendiebstahl += 1;
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};	
