// *************
// SPL_FireStorm  ALIAS INSTANTFIRESTORM
// *************

const int SPL_Cost_InstantFireStorm		= 50;
const int SPL_TEXT_Damage_InstantFireStorm 	= 100;

INSTANCE Spell_Firestorm (C_Spell_Proto)
{
	time_per_mana				= 0;
	damage_per_level			= 	SPL_Damage_InstantFireStorm;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Firestorm	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_InstantFireStorm)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_Firestorm()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_InstantFireStorm;
	};

	B_PrismaAdd(SPL_Damage_InstantFirestorm);
	
	self.aivar[AIV_SelectSpell] += 1;
};

