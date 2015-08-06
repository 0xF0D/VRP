	ShopText[playerid] = CreatePlayerTextDraw(playerid,509.000000,180.000000,"Model: Landstalker");
	PlayerTextDrawBackgroundColor(playerid,ShopText[playerid],255);
	PlayerTextDrawFont(playerid,ShopText[playerid],1);
	PlayerTextDrawSetOutline(playerid,ShopText[playerid],1);
	PlayerTextDrawSetShadow(playerid,ShopText[playerid],0);
	PlayerTextDrawLetterSize(playerid,ShopText[playerid],0.270000,1.200000);
	PlayerTextDrawColor(playerid,ShopText[playerid],-1);
	PlayerTextDrawSetProportional(playerid,ShopText[playerid],1);

	ModelCar[playerid] = CreatePlayerTextDraw(playerid,453.332824, 410.666748, "infernus");
	PlayerTextDrawLetterSize(playerid,ModelCar[playerid], 0.205666, 1.313777);
	PlayerTextDrawAlignment(playerid,ModelCar[playerid], 1);
	PlayerTextDrawColor(playerid,ModelCar[playerid], 8388863);
	PlayerTextDrawSetShadow(playerid,ModelCar[playerid], 0);
	PlayerTextDrawSetOutline(playerid,ModelCar[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid,ModelCar[playerid], 51);
	PlayerTextDrawFont(playerid,ModelCar[playerid], 2);
	PlayerTextDrawSetProportional(playerid,ModelCar[playerid], 1);

	ModelCarTD[playerid] = CreatePlayerTextDraw(playerid, 431.333343, 340.977874, "_");
	PlayerTextDrawFont(playerid, ModelCarTD[playerid], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawUseBox(playerid, ModelCarTD[playerid], false);
	PlayerTextDrawTextSize(playerid, ModelCarTD[playerid], 80.333358, 109.096313);
	PlayerTextDrawSetPreviewModel(playerid, ModelCarTD[playerid], 411);
	PlayerTextDrawSetPreviewRot(playerid, ModelCarTD[playerid], 0.000000, 0.000000, 60.000000, 1.000000);
	PlayerTextDrawBackgroundColor(playerid, ModelCarTD[playerid], 0xFFFFFF00);

	ReconPlayerText[playerid][0] = CreatePlayerTextDraw(playerid,589.00, 145.00, "Nik Anson~n~ID: 666");
	PlayerTextDrawAlignment(playerid,ReconPlayerText[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid,ReconPlayerText[playerid][0],  0.240000, 0.899999);
	ReconPlayerText[playerid][1] = CreatePlayerTextDraw(playerid,578.00, 165.00, "1 : 1 / 8~n~0~n~0~n~50~n~0~n~0 / 0~n~86~n~0 : 0 ~n~0 / 0 : 0%~n~0 / 0 : 0%~n~23 : 0");
	PlayerTextDrawLetterSize(playerid,ReconPlayerText[playerid][1], 0.199999, 0.899999);
	for(new x; x < 2; x ++)
	{
		PlayerTextDrawBackgroundColor(playerid,ReconPlayerText[playerid][x], 255);
		PlayerTextDrawFont(playerid,ReconPlayerText[playerid][x], 1);
		PlayerTextDrawColor(playerid,ReconPlayerText[playerid][x], -1);
		PlayerTextDrawSetOutline(playerid,ReconPlayerText[playerid][x], 1);
		PlayerTextDrawSetProportional(playerid,ReconPlayerText[playerid][x], 1);
		PlayerTextDrawSetShadow(playerid,ReconPlayerText[playerid][x],0);
	}

	SpeedShow[playerid] = CreatePlayerTextDraw(playerid, 571.999694, 359.644287, "50 KM/H");
	PlayerTextDrawLetterSize(playerid, SpeedShow[playerid], 0.230333, 1.633184);
	PlayerTextDrawAlignment(playerid, SpeedShow[playerid], 1);
	PlayerTextDrawColor(playerid, SpeedShow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, SpeedShow[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SpeedShow[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedShow[playerid], 51);
	PlayerTextDrawFont(playerid, SpeedShow[playerid], 2);
	PlayerTextDrawSetProportional(playerid, SpeedShow[playerid], 1);

	FuelShow[playerid] = CreatePlayerTextDraw(playerid, 561.999877, 374.992523, "300");
	PlayerTextDrawLetterSize(playerid, FuelShow[playerid], 0.241666, 1.521185);
	PlayerTextDrawAlignment(playerid, FuelShow[playerid], 1);
	PlayerTextDrawColor(playerid, FuelShow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, FuelShow[playerid], 0);
	PlayerTextDrawSetOutline(playerid, FuelShow[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, FuelShow[playerid], 51);
	PlayerTextDrawFont(playerid, FuelShow[playerid], 2);
	PlayerTextDrawSetProportional(playerid, FuelShow[playerid], 1);

	HealthShow[playerid] = CreatePlayerTextDraw(playerid, 562.000000, 389.925872, "1000");
	PlayerTextDrawLetterSize(playerid, HealthShow[playerid], 0.291000, 1.392592);
	PlayerTextDrawAlignment(playerid, HealthShow[playerid], 1);
	PlayerTextDrawColor(playerid, HealthShow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, HealthShow[playerid], 0);
	PlayerTextDrawSetOutline(playerid, HealthShow[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, HealthShow[playerid], 51);
	PlayerTextDrawFont(playerid, HealthShow[playerid], 2);
	PlayerTextDrawSetProportional(playerid, HealthShow[playerid], 1);

	EngineShow[playerid] = CreatePlayerTextDraw(playerid, 566.333251, 405.274169, "OFF");
	PlayerTextDrawLetterSize(playerid, EngineShow[playerid], 0.277666, 1.359407);
	PlayerTextDrawAlignment(playerid, EngineShow[playerid], 1);
	PlayerTextDrawColor(playerid, EngineShow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, EngineShow[playerid], 0);
	PlayerTextDrawSetOutline(playerid, EngineShow[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, EngineShow[playerid], 51);
	PlayerTextDrawFont(playerid, EngineShow[playerid], 2);
	PlayerTextDrawSetProportional(playerid, EngineShow[playerid], 1);

	LockShow[playerid] = CreatePlayerTextDraw(playerid, 514.333496, 420.207366, "UNLOCK");
	PlayerTextDrawLetterSize(playerid, LockShow[playerid], 0.458333, 1.591703);
	PlayerTextDrawAlignment(playerid, LockShow[playerid], 1);
	PlayerTextDrawColor(playerid, LockShow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, LockShow[playerid], 0);
	PlayerTextDrawSetOutline(playerid, LockShow[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, LockShow[playerid], 51);
	PlayerTextDrawFont(playerid, LockShow[playerid], 2);
	PlayerTextDrawSetProportional(playerid, LockShow[playerid], 1);