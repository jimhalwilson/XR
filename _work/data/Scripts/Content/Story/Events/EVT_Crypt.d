//****************************
// 	EVT_CRYPT_01 (Funktion, die beim �ffnen der truhe in Raum 3 der Crypta ausgef�hrt wird)
//****************************
var int EVT_CRYPT_01_OneTime;
func void EVT_CRYPT_01 ()
{
	if (EVT_CRYPT_01_OneTime == FALSE)
	{
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_01_SPAWN_01");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_01_SPAWN_02");
		Wld_InsertNpc 	(Skeleton, 			"EVT_CRYPT_ROOM_01_SPAWN_03");
		Wld_InsertNpc 	(Skeleton, 			"EVT_CRYPT_ROOM_01_SPAWN_04");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_01_SPAWN_05");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_01_SPAWN_06");
		Wld_InsertNpc 	(SkeletonMage, 			"EVT_CRYPT_ROOM_01_SPAWN_07");

		EVT_CRYPT_01_OneTime = TRUE;
	};
};

//****************************
// 	EVT_CRYPT_02 (Funktion, die beim �ffnen der truhe in Raum 3 der Crypta ausgef�hrt wird)
//****************************

var int EVT_CRYPT_02_OneTime;
func void EVT_CRYPT_02 ()
{
	if (EVT_CRYPT_02_OneTime == FALSE)
	{
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_02_SPAWN_01");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_02_SPAWN_02");
		Wld_InsertNpc 	(Skeleton, 			"EVT_CRYPT_ROOM_02_SPAWN_03");
		Wld_InsertNpc 	(Skeleton, 			"EVT_CRYPT_ROOM_02_SPAWN_04");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_02_SPAWN_05");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_02_SPAWN_06");
		Wld_InsertNpc 	(SkeletonMage, 			"EVT_CRYPT_ROOM_02_SPAWN_07");
		
		EVT_CRYPT_02_OneTime = TRUE;
	};	
};

//****************************
// 	EVT_CRYPT_03 (Funktion, die beim �ffnen der truhe in Raum 3 der Crypta ausgef�hrt wird)
//****************************

var int EVT_CRYPT_03_OneTime;
func void EVT_CRYPT_03 ()
{
	if (EVT_CRYPT_03_OneTime == FALSE)
	{
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_03_SPAWN_01");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_03_SPAWN_02");
		Wld_InsertNpc 	(Skeleton, 			"EVT_CRYPT_ROOM_03_SPAWN_03");
		Wld_InsertNpc 	(Skeleton, 			"EVT_CRYPT_ROOM_03_SPAWN_04");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_03_SPAWN_05");
		Wld_InsertNpc 	(Lesser_Skeleton, 		"EVT_CRYPT_ROOM_03_SPAWN_06");
		Wld_InsertNpc 	(SkeletonMage, 			"EVT_CRYPT_ROOM_03_SPAWN_07");
		
		EVT_CRYPT_03_OneTime = TRUE;
	};
};

//****************************
// 	EVT_CRYPT_FINAL (Funktion, die beim �ffnen aller truhen der Crypta ausgef�hrt wird)
//****************************

var int EVT_CRYPT_FINAL_OneTime;
func void EVT_CRYPT_FINAL ()
{
	if (EVT_CRYPT_FINAL_OneTime == FALSE)
	{
		Wld_InsertNpc 	(Skeleton_Lord_Ghost, 		"EVT_CRYPT_ROOM_01_SPAWNMAIN");
		Wld_InsertNpc 	(Skeleton_Lord_Ghost, 		"EVT_CRYPT_ROOM_02_SPAWNMAIN");
		Wld_InsertNpc 	(Skeleton_Lord_Ghost,		"EVT_CRYPT_ROOM_03_SPAWNMAIN");
		Wld_InsertNpc 	(Skeleton_Lord_Ghost,		"EVT_CRYPT_ROOM_FINAL_SPAWN_01");
		Wld_InsertNpc 	(Skeleton_Lord_Ghost, 		"EVT_CRYPT_ROOM_FINAL_SPAWN_02");
		Wld_InsertNpc 	(Skeleton_Lord_Ghost, 		"EVT_CRYPT_ROOM_FINAL_SPAWN_06");
		
		EVT_CRYPT_FINAL_OneTime = TRUE;
	};
};

//****************************
// 	EVT_CRYPT_ROOM_01_TRIGGERENTRANCE 
//****************************

func void EVT_CRYPT_ROOM_01_TRIGGERENTRANCE ()
{
};

func void EVT_CRYPT_ROOM_02_TRIGGERENTRANCE ()
{
};

func void EVT_CRYPT_ROOM_03_TRIGGERENTRANCE ()
{
};
