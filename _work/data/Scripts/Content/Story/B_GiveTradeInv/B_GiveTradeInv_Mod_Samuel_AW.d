var int Samuel_ItemsGiven_Chapter_1;
var int Samuel_ItemsGiven_Chapter_2;
var int Samuel_ItemsGiven_Chapter_3;
var int Samuel_ItemsGiven_Chapter_4;
var int Samuel_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Samuel_AW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Samuel_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,12);
		CreateInvItems (slf, ItFo_Addon_Grog,20);
		CreateInvItems (slf, ItFo_Booze,13);
		CreateInvItems (slf, ItFo_Beer,16);
		CreateInvItems (slf, Itfo_Wine,12);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);
		
		CreateInvItems (slf, Ri_ProtFire02,1);
						
		Samuel_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Samuel_ItemsGiven_Chapter_2 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);

		CreateInvItems (slf, ITWr_Addon_Piratentod,1);
				
		Samuel_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Samuel_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);

		CreateInvItems (slf, ITWr_Addon_Lou_Rezept,1);

		Samuel_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Samuel_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);

		CreateInvItems (slf, ITWr_Addon_Lou_Rezept2,1);
		
		Samuel_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Samuel_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);
		
		Samuel_ItemsGiven_Chapter_5 = TRUE;
	};
};
