var int Gestath_ItemsGiven_Chapter_1;
var int Gestath_ItemsGiven_Chapter_2;
var int Gestath_ItemsGiven_Chapter_3;
var int Gestath_ItemsGiven_Chapter_4;
var int Gestath_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Gestath_EIS (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Gestath_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 30); 

		CreateInvItems	(slf, ItRu_TeleportGelato, 1);
		
		// ------ Waffen ------
		CreateInvItems	(slf, ItRw_Crossbow_L_01, 1);
		CreateInvItems	(slf, ItRw_Crossbow_L_02, 1);

		CreateInvItems	(slf, ItRw_Bow_L_01, 1);
		CreateInvItems	(slf, ItRw_Bow_L_02, 1);
		CreateInvItems	(slf, ItRw_Bow_L_03, 1);
		CreateInvItems	(slf, ItRw_Bow_L_04, 1);
		CreateInvItems	(slf, ItRw_Sld_Bow, 1);	

		CreateInvItems (slf, ItMW_Addon_Knife01, 1);

		CreateInvItems (slf, ItWr_Bauplan_Snapperbogen, 1);
			
		// ------ Ringe / Amulette -------
		CreateInvItems (slf, ItBE_Addon_Leather_01, 1); 
		CreateInvItems (slf, ItRi_Dex_02, 1); 
	
		CreateInvItems (slf, ItMi_Stuff_Barbknife_01, 5);
		
		
		Gestath_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Gestath_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItRw_Arrow, 50); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 50); 
		CreateInvItems (slf, ItRw_Bolt, 50); 
		CreateInvItems (slf, ItBe_Addon_DEX_5, 1); 
		
		CreateInvItems	(slf, ItAt_TrollTooth, 2);
		CreateInvItems	(slf, ItAt_ShadowHorn, 1);

		CreateInvItems	(slf, ItRw_Crossbow_M_01, 1);

		CreateInvItems	(slf, ItRw_Bow_M_01, 1);
		CreateInvItems	(slf, ItRw_Bow_M_02, 1);
		
		Gestath_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Gestath_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100); 
		CreateInvItems (slf,ItBe_Addon_DEX_10, 1);

		CreateInvItems	(slf, ItRw_Crossbow_M_02, 1);

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);
		CreateInvItems	(slf, ItRw_Bow_M_04, 1);

		Gestath_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Gestath_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItRw_Arrow, 180); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 160); 

		CreateInvItems	(slf, ItRw_Crossbow_H_01, 1);

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);
		CreateInvItems	(slf, ItRw_Bow_H_02, 1);
		CreateInvItems	(slf, ItRw_Bow_H_03, 1);
		
		Gestath_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Gestath_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItRw_Arrow, 200); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 170); 

		CreateInvItems	(slf, ItRw_Crossbow_H_02, 1);

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);
		
		Gestath_ItemsGiven_Chapter_5 = TRUE;
	};
};

