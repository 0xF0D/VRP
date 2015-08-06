	ANIMATION[0] = TextDrawCreate(444.666595, 417.718505, "PRESS");
	TextDrawLetterSize(ANIMATION[0], 0.402000, 1.512888);
	TextDrawAlignment(ANIMATION[0], 1);
	TextDrawColor(ANIMATION[0], -1);
	TextDrawSetShadow(ANIMATION[0], 0);
	TextDrawSetOutline(ANIMATION[0], 1);
	TextDrawBackgroundColor(ANIMATION[0], 51);
	TextDrawFont(ANIMATION[0], 1);
	TextDrawSetProportional(ANIMATION[0], 1);

	ANIMATION[1] = TextDrawCreate(488.000000, 417.718566, "L-ALT");
	TextDrawLetterSize(ANIMATION[1], 0.381999, 1.521185);
	TextDrawAlignment(ANIMATION[1], 1);
	TextDrawColor(ANIMATION[1], -1523963137);
	TextDrawUseBox(ANIMATION[1], true);
	TextDrawBoxColor(ANIMATION[1], 0);
	TextDrawSetShadow(ANIMATION[1], 0);
	TextDrawSetOutline(ANIMATION[1], 1);
	TextDrawBackgroundColor(ANIMATION[1], 51);
	TextDrawFont(ANIMATION[1], 1);
	TextDrawSetProportional(ANIMATION[1], 1);

	ANIMATION[2] = TextDrawCreate(530.666687, 417.303680, "TO STOP ANIM");
	TextDrawLetterSize(ANIMATION[2], 0.330666, 1.554370);
	TextDrawAlignment(ANIMATION[2], 1);
	TextDrawColor(ANIMATION[2], -1);
	TextDrawSetShadow(ANIMATION[2], 0);
	TextDrawSetOutline(ANIMATION[2], 1);
	TextDrawBackgroundColor(ANIMATION[2], 51);
	TextDrawFont(ANIMATION[2], 1);
	TextDrawSetProportional(ANIMATION[2], 1);

	SHOPAUTOTEXT[0] = TextDrawCreate(527.000000, 230.000000, "<<");
	TextDrawLetterSize(SHOPAUTOTEXT[0], 0.220000, 1.199999);

	SHOPAUTOTEXT[1] = TextDrawCreate(581.000000, 230.000000, ">>");
	TextDrawLetterSize(SHOPAUTOTEXT[1], 0.220000, 1.199999);

	SHOPAUTOTEXT[2] = TextDrawCreate(581.000000, 271.000000, ">");
	TextDrawLetterSize(SHOPAUTOTEXT[2], 0.220000, 0.599999);

	SHOPAUTOTEXT[3] = TextDrawCreate(581.000000, 281.000000, ">");
	TextDrawLetterSize(SHOPAUTOTEXT[3], 0.220000, 0.599999);

	SHOPAUTOTEXT[4] = TextDrawCreate(527.000000, 281.000000, "<");
	TextDrawLetterSize(SHOPAUTOTEXT[4], 0.220000, 0.599999);

	SHOPAUTOTEXT[5] = TextDrawCreate(527.000000, 271.000000, "<");
	TextDrawLetterSize(SHOPAUTOTEXT[5], 0.220000, 0.599999);

	for(new s; s < 6; s++)
	{
		TextDrawTextSize(SHOPAUTOTEXT[s], 10.10, 40.40);
		TextDrawAlignment(SHOPAUTOTEXT[s], 2);
		TextDrawBackgroundColor(SHOPAUTOTEXT[s], 255);
		TextDrawFont(SHOPAUTOTEXT[s], 2);
		TextDrawColor(SHOPAUTOTEXT[s], -1);
		TextDrawSetProportional(SHOPAUTOTEXT[s], 1);
		TextDrawSetShadow(SHOPAUTOTEXT[s], 1);
		TextDrawUseBox(SHOPAUTOTEXT[s], 1);
		TextDrawBoxColor(SHOPAUTOTEXT[s], 144);
		TextDrawSetSelectable(SHOPAUTOTEXT[s],true);
	}

	SHOPAUTOTEXT[6] = TextDrawCreate(556.000000, 311.000000, "buy");
	TextDrawLetterSize(SHOPAUTOTEXT[6], 0.450000, 0.899999);
	TextDrawBoxColor(SHOPAUTOTEXT[6], 144);
	TextDrawTextSize(SHOPAUTOTEXT[6], 10.10, 56.56);
	TextDrawSetSelectable(SHOPAUTOTEXT[6], 1);

	SHOPAUTOTEXT[7] = TextDrawCreate(556.000000, 331.000000, "exit");
	TextDrawLetterSize(SHOPAUTOTEXT[7], 0.450000, 0.899999);
	TextDrawBoxColor(SHOPAUTOTEXT[7], 144);
	TextDrawTextSize(SHOPAUTOTEXT[7], 10.10, 56.56);
	TextDrawSetSelectable(SHOPAUTOTEXT[7],true);

	SHOPAUTOTEXT[8] = TextDrawCreate(554.000000, 161.000000, "_");// фон
	TextDrawLetterSize(SHOPAUTOTEXT[8], 0.500000, 22.200017);
	TextDrawSetProportional(SHOPAUTOTEXT[8], 1);
	TextDrawBoxColor(SHOPAUTOTEXT[8], 69);
	TextDrawTextSize(SHOPAUTOTEXT[8], 0.000000, 105.000000);

	for(new e = 6; e < 9; e++)
	{
		TextDrawAlignment(SHOPAUTOTEXT[e], 2);
		TextDrawBackgroundColor(SHOPAUTOTEXT[e], 255);
		TextDrawFont(SHOPAUTOTEXT[e], 3);
		TextDrawColor(SHOPAUTOTEXT[e], -1);
		TextDrawSetProportional(SHOPAUTOTEXT[e], 1);
		TextDrawSetShadow(SHOPAUTOTEXT[e], 1);
		TextDrawUseBox(SHOPAUTOTEXT[e], 1);
	}

	SHOPAUTOTEXT[9] = TextDrawCreate(522.000000, 211.000000, "SELECT CAR");
	SHOPAUTOTEXT[10] = TextDrawCreate(537.000000, 251.000000, "COLOR");
	SHOPAUTOTEXT[11] = TextDrawCreate(541.000000, 165.000000, "INFO");

	for(new r = 9; r < 12; r++)
	{
		TextDrawBackgroundColor(SHOPAUTOTEXT[r], 255);
		TextDrawFont(SHOPAUTOTEXT[r], 2);
		TextDrawSetOutline(SHOPAUTOTEXT[r], 0);
		TextDrawSetShadow(SHOPAUTOTEXT[r], 0);
		TextDrawLetterSize(SHOPAUTOTEXT[r], 0.260000, 1.300000);
		TextDrawColor(SHOPAUTOTEXT[r], -2016477185);
		TextDrawSetProportional(SHOPAUTOTEXT[r], 1);
	}

	PaintDraws[0] = TextDrawCreate(147.666671, 265.322204, "usebox");
	TextDrawLetterSize(PaintDraws[0], 0.000000, 7.703088);
	TextDrawTextSize(PaintDraws[0], 18.000000, 0.000000);
	TextDrawAlignment(PaintDraws[0], 1);
	TextDrawColor(PaintDraws[0], 0);
	TextDrawUseBox(PaintDraws[0], true);
	TextDrawBoxColor(PaintDraws[0], 102);
	TextDrawSetShadow(PaintDraws[0], 0);
	TextDrawSetOutline(PaintDraws[0], 0);
	TextDrawFont(PaintDraws[0], 0);

	PaintDraws[1] = TextDrawCreate(147.666671, 267.811126, "usebox");
	TextDrawLetterSize(PaintDraws[1], 0.000000, 0.605143);
	TextDrawTextSize(PaintDraws[1], 18.000000, 0.000000);
	TextDrawAlignment(PaintDraws[1], 1);
	TextDrawColor(PaintDraws[1], 0);
	TextDrawUseBox(PaintDraws[1], true);
	TextDrawBoxColor(PaintDraws[1], 102);
	TextDrawSetShadow(PaintDraws[1], 0);
	TextDrawSetOutline(PaintDraws[1], 0);
	TextDrawFont(PaintDraws[1], 0);

	PaintDraws[2] = TextDrawCreate(22.000034, 288.296234, "Team Blue:");
	TextDrawLetterSize(PaintDraws[2], 0.309333, 1.313777);
	TextDrawAlignment(PaintDraws[2], 1);
	TextDrawColor(PaintDraws[2], 65535);
	TextDrawSetShadow(PaintDraws[2], 0);
	TextDrawSetOutline(PaintDraws[2], 1);
	TextDrawBackgroundColor(PaintDraws[2], 51);
	TextDrawFont(PaintDraws[2], 2);
	TextDrawSetProportional(PaintDraws[2], 1);

	PaintDraws[3] = TextDrawCreate(22.333322, 307.378082, "Team Red:");
	TextDrawLetterSize(PaintDraws[3], 0.328999, 1.185184);
	TextDrawAlignment(PaintDraws[3], 1);
	TextDrawColor(PaintDraws[3], -16776961);
	TextDrawSetShadow(PaintDraws[3], 0);
	TextDrawSetOutline(PaintDraws[3], 1);
	TextDrawBackgroundColor(PaintDraws[3], 51);
	TextDrawFont(PaintDraws[3], 2);
	TextDrawSetProportional(PaintDraws[3], 1);

	PaintDraws[4] = TextDrawCreate(46.666652, 265.481445, "PAINTBALL");
	TextDrawLetterSize(PaintDraws[4], 0.314999, 1.015110);
	TextDrawAlignment(PaintDraws[4], 1);
	TextDrawColor(PaintDraws[4], -1);
	TextDrawSetShadow(PaintDraws[4], 0);
	TextDrawSetOutline(PaintDraws[4], 1);
	TextDrawBackgroundColor(PaintDraws[4], 51);
	TextDrawFont(PaintDraws[4], 2);
	TextDrawSetProportional(PaintDraws[4], 1);

	Logo[0] = TextDrawCreate(532.666687, 1.659261, "Ethan First");
	TextDrawLetterSize(Logo[0], 0.290999, 1.537777);
	TextDrawAlignment(Logo[0], 1);
	TextDrawColor(Logo[0], COLOR_RED);
	TextDrawSetShadow(Logo[0], 0);
	TextDrawSetOutline(Logo[0], 0);
	TextDrawBackgroundColor(Logo[0], 51);
	TextDrawFont(Logo[0], 2);
	TextDrawSetProportional(Logo[0], 1);

	Logo[1] = TextDrawCreate(556.000183, 14.103709, "RolePlay");
	TextDrawLetterSize(Logo[1], 0.252666, 1.388444);
	TextDrawAlignment(Logo[1], 1);
	TextDrawColor(Logo[1], -2139062017);
	TextDrawSetShadow(Logo[1], 0);
	TextDrawSetOutline(Logo[1], 0);
	TextDrawBackgroundColor(Logo[1], 51);
	TextDrawFont(Logo[1], 2);
	TextDrawSetProportional(Logo[1], 1);


	VehBox = TextDrawCreate(634.666687, 357.411102, "usebox");
	TextDrawLetterSize(VehBox, 0.000000, 9.085803);
	TextDrawTextSize(VehBox, 436.333312, 0.000000);
	TextDrawAlignment(VehBox, 1);
	TextDrawColor(VehBox, 0);
	TextDrawUseBox(VehBox, true);
	TextDrawBoxColor(VehBox, 102);
	TextDrawSetShadow(VehBox, 0);
	TextDrawSetOutline(VehBox, 0);
	TextDrawFont(VehBox, 0);

	Speed = TextDrawCreate(512.999816, 359.229492, "Speed:");
	TextDrawLetterSize(Speed, 0.347333, 1.587555);
	TextDrawAlignment(Speed, 1);
	TextDrawColor(Speed, -5963521);
	TextDrawSetShadow(Speed, 0);
	TextDrawSetOutline(Speed, 1);
	TextDrawBackgroundColor(Speed, 51);
	TextDrawFont(Speed, 2);
	TextDrawSetProportional(Speed, 1);

	Fuel = TextDrawCreate(513.333679, 373.748046, "Fuel:");
	TextDrawLetterSize(Fuel, 0.361333, 1.641481);
	TextDrawAlignment(Fuel, 1);
	TextDrawColor(Fuel, -5963521);
	TextDrawSetShadow(Fuel, 0);
	TextDrawSetOutline(Fuel, 1);
	TextDrawBackgroundColor(Fuel, 51);
	TextDrawFont(Fuel, 2);
	TextDrawSetProportional(Fuel, 1);

	Heal = TextDrawCreate(513.666687, 388.266632, "Heal:");
	TextDrawLetterSize(Heal, 0.340666, 1.633185);
	TextDrawAlignment(Heal, 1);
	TextDrawColor(Heal, -5963521);
	TextDrawSetShadow(Heal, 0);
	TextDrawSetOutline(Heal, 1);
	TextDrawBackgroundColor(Heal, 51);
	TextDrawFont(Heal, 2);
	TextDrawSetProportional(Heal, 1);

	Engines = TextDrawCreate(514.333374, 403.199859, "engine:");
	TextDrawLetterSize(Engines, 0.283333, 1.658074);
	TextDrawAlignment(Engines, 1);
	TextDrawColor(Engines, -5963521);
	TextDrawSetShadow(Engines, 0);
	TextDrawSetOutline(Engines, 1);
	TextDrawBackgroundColor(Engines, 51);
	TextDrawFont(Engines, 2);
	TextDrawSetProportional(Engines, 1);

	ReconText[0] = TextDrawCreate(27.000000, 139.000000, "_");
	TextDrawBoxColor(ReconText[0], -192);
	TextDrawTextSize(ReconText[0], 77.000000, 50.000000);
	TextDrawLetterSize(ReconText[0], 0.00, 13.799999);

	ReconText[1] = TextDrawCreate(26.000000, 140.000000, "_");
	TextDrawBoxColor(ReconText[1], 100);
	TextDrawTextSize(ReconText[1], 77.000000, 50.000000);
	TextDrawLetterSize(ReconText[1], 0.500000, 13.599998);

	ReconText[2] = TextDrawCreate(587.000000, 139.000000, "__");
	TextDrawLetterSize(ReconText[2], 0.500000, 14.799999);
	TextDrawBoxColor(ReconText[2], -192);
	TextDrawTextSize(ReconText[2], 77.000000, 110.000000);

	ReconText[3] = TextDrawCreate(586.000000, 140.000000, "__");
	TextDrawLetterSize(ReconText[3], 0.500000, 14.599998);
	TextDrawBoxColor(ReconText[3], 100);
	TextDrawTextSize(ReconText[3], 0.000000, 105.000000);

	for(new x; x < 4; x++)
	{
		TextDrawAlignment(ReconText[x], 2);
		TextDrawBackgroundColor(ReconText[x], 255);
		TextDrawFont(ReconText[x], 1);
		TextDrawColor(ReconText[x], -1);
		TextDrawSetOutline(ReconText[x], 0);
		TextDrawSetProportional(ReconText[x], 1);
		TextDrawSetShadow(ReconText[x], 0);
		TextDrawUseBox(ReconText[x], 1);
	}

	ReconText[4] = TextDrawCreate(537.00, 165.00, "~g~::Level:~n~~g~::Warns:~n~~r~::Armour:~n~~r~::Health:~n~~b~::CarHP:~n~~b~::Speed:~n~~y~::Ping:~n~~y~::Ammo:~n~~p~::Shot:~n~~p~::TimeShot:~n~~g~::AFKTime:");
	TextDrawLetterSize(ReconText[4],  0.199999, 0.899999);
	TextDrawBackgroundColor(ReconText[4], 255);
	TextDrawFont(ReconText[4], 1);
	TextDrawColor(ReconText[4], -1);
	TextDrawSetOutline(ReconText[4], 1);
	TextDrawSetProportional(ReconText[4], 1);
	TextDrawSetShadow(ReconText[4], 0);


	ReconText[5] = TextDrawCreate(25.00, 147.00, "Change");
	ReconText[6] = TextDrawCreate(25.00, 160.00, "Check >>");
	ReconText[7] = TextDrawCreate(25.00, 173.00, "Drop >>");
	ReconText[8] = TextDrawCreate(25.00, 186.00, "Kick >>");
	ReconText[9] = TextDrawCreate(25.00, 199.00, "Warn");
	ReconText[10] = TextDrawCreate(25.00, 212.00, "Ban >>");
	ReconText[11] = TextDrawCreate(25.00, 225.00, "Stats >>");
	ReconText[12] = TextDrawCreate(25.00, 238.00, "Refresh");
	ReconText[13] = TextDrawCreate(25.00, 251.00, "Exit");
	ReconText[14] = TextDrawCreate(589.00, 261.00, "Help");
	ReconText[15] = TextDrawCreate(75.00, 160.00, "Check GM");
	ReconText[16] = TextDrawCreate(75.00, 173.00, "Check GM 2");
	ReconText[17] = TextDrawCreate(75.00, 186.00, "Check GMCar");
	ReconText[18] = TextDrawCreate(75.00, 199.00, "ResetShot");
	ReconText[19] = TextDrawCreate(75.00, 173.00, "Mute");
	ReconText[20] = TextDrawCreate(75.00, 186.00, "Slap");
	ReconText[21] = TextDrawCreate(75.00, 199.00, "Prison");
	ReconText[22] = TextDrawCreate(75.00, 212.00, "Freeze");
	ReconText[23] = TextDrawCreate(75.00, 225.00, "UnFreeze");
	ReconText[24] = TextDrawCreate(75.00, 186.00, "Kick");
	ReconText[25] = TextDrawCreate(75.00, 199.00, "SKick");
	ReconText[26] = TextDrawCreate(75.00, 212.00, "Ban");
	ReconText[27] = TextDrawCreate(75.00, 225.00, "SBan");
	ReconText[28] = TextDrawCreate(75.00, 238.00, "IBan");
	ReconText[29] = TextDrawCreate(75.00, 225.00, "Stats");
	ReconText[30] = TextDrawCreate(75.00, 238.00, "IWep");
	ReconText[31] = TextDrawCreate(75.00, 251.00, "GetIP");


	for(new x = 5; x < 32; x++)
	{
		TextDrawTextSize(ReconText[x], 10.10, 44.44);
		TextDrawAlignment(ReconText[x], 2);
		TextDrawBackgroundColor(ReconText[x], 255);
		TextDrawFont(ReconText[x], 1);
		TextDrawLetterSize(ReconText[x], 0.20, 0.899999);
		TextDrawColor(ReconText[x], -112);
		TextDrawSetOutline(ReconText[x], 0);
		TextDrawSetProportional(ReconText[x], 1);
		TextDrawSetShadow(ReconText[x], 0);
		TextDrawUseBox(ReconText[x], 1);
		TextDrawBoxColor(ReconText[x], 144);
		TextDrawSetSelectable(ReconText[x], true);
	}