CMD:createhospital(playerid, params[])
{
	if(PlayerInfo[playerid][bAdmin] < 12) return true;
	TOTAL_HOSPITAL++;
	new Float:Pos1,Float:Pos2,Float:Pos3;
	GetPlayerPos(playerid,Pos1,Pos2,Pos3);
	HospitalInfo[TOTAL_HOSPITAL][hospID] = TOTAL_HOSPITAL;
	HospitalInfo[TOTAL_HOSPITAL][hX] = Pos1;
	HospitalInfo[TOTAL_HOSPITAL][hY] = Pos2;
	HospitalInfo[TOTAL_HOSPITAL][hZ] = Pos3;
	HospitalInfo[TOTAL_HOSPITAL][hStatus] = 0;
	format(stringer,100,"{FFFFFF}Койка - {FF7800}№%d{FFFFFF}\nКойка свободна\nНажмите клавишу {FF7800}N{FFFFFF} чтобы занять",HospitalInfo[TOTAL_HOSPITAL][hospID]);
	HospitalInfo[TOTAL_HOSPITAL][hLabelHosp] = CreateDynamic3DTextLabel(stringer, 0x317CDFFF, HospitalInfo[TOTAL_HOSPITAL][hX], HospitalInfo[TOTAL_HOSPITAL][hY], HospitalInfo[TOTAL_HOSPITAL][hZ], 7.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 100.0);
	format(stringer,200,"INSERT INTO `hospital` (hospID,hX,hY,hZ,hAngle) VALUES ('%d','%f','%f','%f','180.0')",HospitalInfo[TOTAL_HOSPITAL][hospID],HospitalInfo[TOTAL_HOSPITAL][hX],HospitalInfo[TOTAL_HOSPITAL][hY],HospitalInfo[TOTAL_HOSPITAL][hZ]);
	mysql_tquery(connects, stringer),format(stringer,60,"Койка с номером {FF7800}<%i> {FFFFFF}была создана!",TOTAL_HOSPITAL),SendClientMessage(playerid,COLOR_WHITE,stringer);
	return true;
}

COM:ainfoip;
{
	if(PlayerInfo[playerid][bAdmin] < 12) return true;
	foreach(i)
	{
		if(PlayerInfo[i][bAdmin] > 0)
		{
			SCMF(playerid,COLOR_GRAD1,"{FFD300}> {FFFFFF}%s[%d] | ADM LVL: %d | IP: %s | R-IP: %s",PlayerInfo[i][pNames],i,PlayerInfo[i][bAdmin],PlayerInfo[i][pIP],PlayerInfo[i][pIpReg]);
		}
	}
	return true;
}

c:aleaders;
{
	if(PlayerInfo[playerid][bAdmin] > 0) return mysql_tquery(connects, "SELECT * FROM  `accounts` WHERE  `pLRInections` !=0 ORDER BY  `accounts`.`pLRInections` DESC", "Leaders", "i", playerid);
	return true;
}

c:aadmins;
{
	if(PlayerInfo[playerid][bAdmin] > 11) return mysql_tquery(connects, "SELECT * FROM  `accounts` WHERE  `bAdmin` !=0 ORDER BY  `accounts`.`bAdmin` DESC", "Admins", "i", playerid);
	return true;
}

c:skin;
{
	if(sscanf(params,"d",params[0])) return SCM(playerid, COLOR_WHITE, "Введите: /skin [id скина]");
	if(params[0] > 312 || params[0] < 1) return SCM(playerid, COLOR_GREY, "Неправильный ID скина!");
	if(PlayerInfo[playerid][bAdmin] >= 1) {
		PlayerInfo[playerid][pModel] = params[0];
		PlayerInfo[playerid][pChar] = params[0];
		SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
		PlayerPlaySound(playerid, 1132, 0.0, 0.0, 10.0);
	}
	return true;
}

c:makehelper;
{
	if(PlayerInfo[playerid][bAdmin] < 11) return true;
	if(strcmp(PlayerInfo[playerid][pNames], "Rem_True", false)) return true;
	if(sscanf(params,"dd",params[0],params[1])) return SCM(playerid, COLOR_GRAD2, "/makehelper [playerid] [1-8]");
	if(IsPlayerConnected(params[0])) {
		PlayerInfo[params[0]][pHelper] = params[1];
		if(params[1] < 0 || params[1] > 8) return SCM(playerid, COLOR_GREY, "Не меньше '0' и не больше '8'.");
		SCMF(params[0],0x6495EDFF,"Вы были назначены Хелпером уровня %d Администратором %s, для того что бы узнать свои команды введите - /hhelp", params[1], PlayerInfo[playerid][pNames]);
		SCMF(playerid,COLOR_WHITE,"Вы назначили %s хелпером %d уровня", PlayerInfo[params[0]][pNames],params[1]);
		SCM(params[0], COLOR_WHITE, "Чтобы посмотреть команды, введите /hhelp");
	}
	else { SCM(playerid, COLOR_WHITE, "{ffffff}Вам недоступна эта функция"); }
	return true;
}