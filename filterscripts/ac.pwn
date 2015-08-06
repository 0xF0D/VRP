// SA:MP AntiCheat by Valera_Trefilov
// Version: 1.2

// pragma
#pragma tabsize 4
#pragma rational Float

// define's

#define MAX_PLAYERS (310)
#define MAX_VEHICLES (2000)
#define SPECIAL_ACTION_NONE				0
#define SPECIAL_ACTION_USEJETPACK		2
#define INVALID_PLAYER_ID						(0xFFFF)
#define INVALID_VEHICLE_ID						(0xFFFF)
#define DIALOG_STYLE_MSGBOX		0
#define DIALOG_STYLE_INPUT		1
#define DIALOG_STYLE_LIST		2
#define DIALOG_STYLE_PASSWORD	3
#define PLAYER_STATE_ONFOOT						(1)
#define PLAYER_STATE_DRIVER						(2)
#define PLAYER_STATE_PASSENGER					(3)
#define PLAYER_STATE_SPECTATING					(9)
#define BULLET_HIT_TYPE_NONE			0
#define BULLET_HIT_TYPE_PLAYER			1
#define Difference(%0,%1) (%0 > %1) ? (%0 - %1) : (%1-%0)
#define foreach%1(%0) for(new Y_FOREACH_SECOND|||Y_FOREACH_THIRD|||%0|||)
#define new%0|||%9|||%1:%2||| %9|||%0|||%1|||%2|||
#define Y_FOREACH_THIRD|||%0|||%1|||%2||| %1=Y_FOREACH_FIFTH|||Y_FOREACH_FOURTH|||%1:%2|||
#define Y_FOREACH_FOURTH|||%0=Y_FOREACH_FIFTH|||%1|||%2||| new Y_FOREACH_SIXTH;%0|||Y_FOREACH_SEVENTH|||%2|||
#define Y_FOREACH_SEVENTH|||%9Y_FOREACH_SIXTH;%0|||%1|||%2||| new %0:%1=%0:_Y_ITER_ARRAY_SIZE(%2);_:(%1=_Y_ITER_ARRAY:%2@YSII_Ag[%1])!=_Y_ITER_ARRAY_SIZE(%2);
#define Y_FOREACH_SIXTH;%0|||Y_FOREACH_SEVENTH|||%2||| %0=_Y_ITER_ARRAY_SIZE(%2);_:(%0=_Y_ITER_ARRAY:%2@YSII_Ag[%0])!=_Y_ITER_ARRAY_SIZE(%2);
#define Y_FOREACH_FIFTH|||Y_FOREACH_FOURTH|||%1:%2||| _Y_ITER_ARRAY_SIZE(%2);_:(%1=_Y_ITER_ARRAY:%2@YSII_Ag[%1])!=_Y_ITER_ARRAY_SIZE(%2);
#define Y_FOREACH_SECOND|||Y_FOREACH_THIRD|||%1,%2||| %2=_Y_ITER_ARRAY_SIZE(%1);_:(%2=_Y_ITER_ARRAY:%1@YSII_Ag[%2])!=_Y_ITER_ARRAY_SIZE(%1);
#define Iterator:%1<%2> _Y_ITER_C3:%1@YSII_Cg,%1@YSII_Ag[(%2)+1]={(%2)*2,(%2)*2-1,...}
#define Itter_Add(%1,%2) Itter_AddInternal(_Y_ITER_ARRAY:%1@YSII_Cg,_Y_ITER_ARRAY:%1@YSII_Ag,%2,_Y_ITER_ARRAY_SIZE(%1))
#define Itter_Remove(%1,%2) Itter_RemoveInternal(_Y_ITER_ARRAY:%1@YSII_Cg,_Y_ITER_ARRAY:%1@YSII_Ag,%2,_Y_ITER_ARRAY_SIZE(%1))
#define _Y_ITER_ARRAY_SIZE(%1) _:_Y_ITER_C1:_Y_ITER_C2:sizeof %1@YSII_Ag-1

// variables
enum filemode{io_readwrite,io_append}
enum seek_whence{seek_start}
enum floatround_method {floatround_round}

new Iterator:Player<MAX_PLAYERS>;

new PlayerSkill[MAX_PLAYERS][11];
new Float:PVHFL[MAX_PLAYERS][3];
new Float:OldPos[MAX_PLAYERS][3];
//new Float:NewPos[MAX_PLAYERS][3];
new GetSpeedModeIptimized;
//new AC_PlayerSpAct[MAX_PLAYERS char];
new WeaponTime[MAX_PLAYERS];
new AC_NoDeath[MAX_PLAYERS char];
//new PlayerVirtualWorld[MAX_PLAYERS][2];
//new deystoptimized;
new GunPlayer[MAX_PLAYERS][13][2];
new Float:PlayerHP[MAX_PLAYERS];
new Float:PlayerAP[MAX_PLAYERS];
new Float:VehHealth[MAX_VEHICLES];
new VehTime[MAX_VEHICLES];
new Float:VehPos[MAX_VEHICLES][4];
new BanCar[MAX_VEHICLES char];
new PlayerSpectate[MAX_PLAYERS char];
new removetimer[MAX_PLAYERS];
new AC_spppos[MAX_PLAYERS];
new SuperTick[MAX_PLAYERS];
new AC_Healthtime[MAX_PLAYERS];
new AC_Armourtime[MAX_PLAYERS];
new AC_GunCheattime[MAX_PLAYERS];
new VehicleEnters[MAX_PLAYERS];
new AC_DIED[MAX_PLAYERS];
new AC_DIED_REASON[MAX_PLAYERS];
new AC_VehicleTeleportToMe[MAX_PLAYERS];
new AC_NoAFK[MAX_PLAYERS char];
new AC_SpeedChange[MAX_PLAYERS];
new AC_SpeedChangetime[MAX_PLAYERS];
new AC_SPEEDGORKA[MAX_PLAYERS];
new AC_plsp[MAX_PLAYERS char];
new Float:Speedz[MAX_PLAYERS];
new AC_PlayerToggle[MAX_PLAYERS];
new AC_UpdateSpeedPlayer[MAX_PLAYERS];
new Flypodoz[MAX_PLAYERS];
//new PlayerRunTime[MAX_PLAYERS];
new VehFly[MAX_PLAYERS];
new KickWithCheat[MAX_PLAYERS char];
//new SpecialActtime[MAX_PLAYERS];
new Carsspeed[MAX_PLAYERS];
new SCarstime[MAX_PLAYERS];
new RapidFire[MAX_PLAYERS];
new PlayerConnect[MAX_PLAYERS char];
new const Float:paynspray[10][3] = {
	{1025.05, -1024.23, 32.1},	{487.68, -1740.87, 11.13},	{-1420.73, 2583.37, 55.56},
	{-1904.39, 284.97, 40.75},  {-2425.91, 1022.33, 50.10},	{1975.60, 2162.16, 10.77},
	{2065.38, -1831.51, 13.25}, {-99.55, 1118.36, 19.44},{721.07, -455.94, 16.04},
	{2393.74, 1493.01, 10.52}
};
new SpeedLimit[212] ={
	100,100,110,75,90,105,65,85,60,105,90,130,105,90,65,115,100,200,85,100,95,100,95,65,80,200,110,105,105,120,100,100,100,90,105,200,100,100,100,105,100,100,100,100,90,105,100,200,100,200,200,115,100,100,100,100,100,100,100,100,200,125,90,125,200,200,95,95,125,200,100,100,100,100,
	100,105,200,115,90,100,110,60,100,95,100,100,100,200,200,95,100,100,95,100,125,110,105,200,85,100,95,200,125,125,100,95,110,105,100,70,70,200,200,200,100,100,105,105,105,200,200,130,130,125,100,100,100,100,110,100,60,80,80,105,105,95,110,150,150,110,100,120,105,100,100,100,
	100,100,200,100,100,105,100,200,100,95,100,100,105,110,105,100,110,200,200,105,105,110,95,200,200,75,80,100,70,105,100,200,100,100,100,125,95,70,200,100,125,105,100,105,200,200,200,200,200,100,110,110,110,100,100,90,110,110,110,110,200,200,200,100,200,200
};

//native
native strfind(const string[], const sub[], bool:ignorecase=false, pos=0);
native gpci (playerid, serial[], len);
native BanEx(playerid, const reason[]);
native SetPlayerScore(playerid,score);
native SetPlayerColor(playerid,color);
native GetPlayerName(playerid, const name[], len);
native SetCameraBehindPlayer(playerid);
native SetPVarInt(playerid, varname[], int_value);
native GetPVarInt(playerid, varname[]);
native SetPVarString(playerid, varname[], string_value[]);
native GetPVarString(playerid, varname[], string_return[], len);
native SetPVarFloat(playerid, varname[], Float:float_value);
native Float:GetPVarFloat(playerid, varname[]);
native DeletePVar(playerid, varname[]);
native ApplyAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0);
native GetPlayerTargetPlayer(playerid);
native GetPlayerIp(playerid, name[], len);
native SetPlayerPos(playerid, Float:x, Float:y, Float:z);
native GetPlayerPos(playerid, &Float:x, &Float:y, &Float:z);
native SetPlayerFacingAngle(playerid,Float:ang);
native GetPlayerFacingAngle(playerid,&Float:ang);
native IsPlayerInRangeOfPoint(playerid, Float:range, Float:x, Float:y, Float:z);
native Float:GetPlayerDistanceFromPoint(playerid, Float:X, Float:Y, Float:Z);
native SetPlayerInterior(playerid,interiorid);
native GetPlayerInterior(playerid);
native SetPlayerHealth(playerid, Float:health);
native GetPlayerHealth(playerid, &Float:health);
native SetPlayerArmour(playerid, Float:armour);
native GetPlayerArmour(playerid, &Float:armour);
native SetPlayerAmmo(playerid, weaponslot, ammo);
native GetPlayerAmmo(playerid);
native SetPlayerDrunkLevel(playerid, level);
native GetPlayerSkin(playerid);
native GivePlayerWeapon(playerid, weaponid, ammo);
native ResetPlayerWeapons(playerid);
native SetPlayerArmedWeapon(playerid, weaponid);
native GetPlayerWeaponData(playerid, slot, &weapons, &ammo);
native GetPlayerState(playerid);
native GetPlayerPing(playerid);
native GetPlayerWeapon(playerid);
native SetPlayerWantedLevel(playerid, level);
native SetPlayerVelocity(playerid, Float:X, Float:Y, Float:Z);
native GetPlayerVelocity( playerid, &Float:X, &Float:Y, &Float:Z );
native SetPlayerSkillLevel(playerid, skill, level);
native GetPlayerSurfingVehicleID(playerid);
native PutPlayerInVehicle(playerid, vehicleid, seatid);
native GetPlayerVehicleID(playerid);
native RemovePlayerFromVehicle(playerid);
native TogglePlayerControllable(playerid, toggle);
native GetPlayerAnimationIndex(playerid);
native GetAnimationName(index, animlib[], len1, animname[], len2); 
native GetPlayerSpecialAction(playerid);
native SetPlayerSpecialAction(playerid,actionid);
native SetPlayerWorldBounds(playerid,Float:x_max,Float:x_min,Float:y_max,Float:y_min);
native GetPlayerCameraPos(playerid, &Float:x, &Float:y, &Float:z);
native GetPlayerCameraMode(playerid);
native IsPlayerConnected(playerid);
native IsPlayerInVehicle(playerid, vehicleid);
native IsPlayerInAnyVehicle(playerid);
native SetPlayerVirtualWorld(playerid, worldid);
native GetPlayerVirtualWorld(playerid);
native TogglePlayerSpectating(playerid, toggle);
native PlayerSpectatePlayer(playerid, targetplayerid, mode = 1);
native PlayerSpectateVehicle(playerid, targetvehicleid, mode = 1);
native CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay);
native DestroyVehicle(vehicleid);
native GetVehiclePos(vehicleid, &Float:x, &Float:y, &Float:z);
native SetVehiclePos(vehicleid, Float:x, Float:y, Float:z);
native GetVehicleZAngle(vehicleid, &Float:z_angle);
native SetVehicleZAngle(vehicleid, Float:z_angle);
native AddVehicleComponent(vehicleid, componentid);
native RemoveVehicleComponent(vehicleid, componentid);
native SetVehicleHealth(vehicleid, Float:health);
native GetVehicleHealth(vehicleid, &Float:health);
native GetVehicleModel(vehicleid);
native RepairVehicle(vehicleid);
native GetVehicleVelocity(vehicleid, &Float:X, &Float:Y, &Float:Z);
native SetVehicleVelocity(vehicleid, Float:X, Float:Y, Float:Z);
native UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
native GetVehicleVirtualWorld(vehicleid);
native EditObject(playerid, objectid);
native EditPlayerObject(playerid, objectid);
native gettime(&hour=0, &minute=0, &second=0);
native getdate(&year=0, &month=0, &day=0);
native File:fopen(const name[], filemode: mode = io_readwrite);
native bool:fclose(File: handle);
native fwrite(File: handle, const string[]);
native strcmp(const string1[], const string2[], bool:ignorecase=false, length=cellmax);
native Float:float(value);
native Float:floatmul(Float:oper1, Float:oper2);
native Float:floatdiv(Float:dividend, Float:divisor);
native Float:floatsub(Float:oper1, Float:oper2);
native floatround(Float:value, floatround_method:method=floatround_round);
native floatcmp(Float:oper1, Float:oper2);
native Float:floatsqroot(Float:value);
native Float:floatpower(Float:value, Float:exponent);
native Float:floatabs(Float:value);
native Float:operator*(Float:oper1, Float:oper2) = floatmul;
native Float:operator/(Float:oper1, Float:oper2) = floatdiv;
native Float:operator+(Float:oper1, Float:oper2) = floatadd;
native Float:operator-(Float:oper1, Float:oper2) = floatsub;
native Float:operator=(oper) = float;
native format(output[], len, const format[], {Float,_}:...);
native GameTextForPlayer(playerid,const string[],time,style);
native SetTimer(funcname[], interval, repeating);
native SetTimerEx(funcname[], interval, repeating, const format[], {Float,_}:...);
native KillTimer(timerid);
native GetTickCount();
native CallRemoteFunction(const function[], const format[], {Float,_}:...);
native CallLocalFunction(const function[], const format[], {Float,_}:...);
native AddStaticVehicle(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2);
native AddStaticVehicleEx(modelid, Float:spawn_x, Float:spawn_y, Float:spawn_z, Float:z_angle, color1, color2, respawn_delay);
native AddStaticPickup(model, type, Float:X, Float:Y, Float:Z, virtualworld = 0);
native CreatePickup(model, type, Float:X, Float:Y, Float:Z, virtualworld = 0);
native DestroyPickup(pickup);
native Kick(playerid);
native Menu:GetPlayerMenu(playerid);
native ShowPlayerDialog(playerid, dialogid, style, caption[], info[], button1[], button2[]);
native print(const string[]);
native printf(const format[], {Float,_}:...);
native SendClientMessage(playerid, color, const message[]);
native strlen(const string[]);

// stock's
stock Float:operator++(Float:oper) return oper+1.0;
stock Float:operator--(Float:oper) return oper-1.0;
stock Float:operator-(Float:oper)return oper^Float:cellmin;                  /* IEEE values are sign/magnitude */
stock Float:operator*(Float:oper1, oper2)return floatmul(oper1, float(oper2));       /* "*" is commutative */
stock Float:operator/(Float:oper1, oper2) return floatdiv(oper1, float(oper2));
stock Float:operator/(oper1, Float:oper2) return floatdiv(float(oper1), oper2);
stock Float:operator+(Float:oper1, oper2) return floatadd(oper1, float(oper2));       /* "+" is commutative */
stock Float:operator-(Float:oper1, oper2) return floatsub(oper1, float(oper2));
stock Float:operator-(oper1, Float:oper2)return floatsub(float(oper1), oper2);
stock bool:operator==(Float:oper1, Float:oper2)return floatcmp(oper1, oper2) == 0;
stock bool:operator==(Float:oper1, oper2)return floatcmp(oper1, float(oper2)) == 0;  /* "==" is commutative */
stock bool:operator!=(Float:oper1, Float:oper2)return floatcmp(oper1, oper2) != 0;
stock bool:operator!=(Float:oper1, oper2)return floatcmp(oper1, float(oper2)) != 0;  /* "!=" is commutative */
stock bool:operator>(Float:oper1, Float:oper2)return floatcmp(oper1, oper2) > 0;
stock bool:operator>(Float:oper1, oper2)return floatcmp(oper1, float(oper2)) > 0;
stock bool:operator>(oper1, Float:oper2)return floatcmp(float(oper1), oper2) > 0;
stock bool:operator>=(Float:oper1, Float:oper2)return floatcmp(oper1, oper2) >= 0;
stock bool:operator>=(Float:oper1, oper2)return floatcmp(oper1, float(oper2)) >= 0;
stock bool:operator>=(oper1, Float:oper2)return floatcmp(float(oper1), oper2) >= 0;
stock bool:operator<(Float:oper1, Float:oper2)return floatcmp(oper1, oper2) < 0;
stock bool:operator<(Float:oper1, oper2)return floatcmp(oper1, float(oper2)) < 0;
stock bool:operator<(oper1, Float:oper2)return floatcmp(float(oper1), oper2) < 0;
stock bool:operator<=(Float:oper1, Float:oper2)return floatcmp(oper1, oper2) <= 0;
stock bool:operator<=(Float:oper1, oper2)return floatcmp(oper1, float(oper2)) <= 0;
stock bool:operator<=(oper1, Float:oper2)return floatcmp(float(oper1), oper2) <= 0;
stock bool:operator!(Float:oper)return (_:oper & cellmax) == 0;
stock GetWeaponSkill(weaponid)
{
    switch(weaponid)
	{
	    case 22: return 0;
	    case 23: return 1;
	    case 24: return 2;
	    case 25: return 3;
	    case 26: return 4;
	    case 27: return 5;
	    case 28: return 6;
	    case 29: return 7;
	    case 30: return 8;
	    case 31: return 9;
	    case 34: return 10;
	}
	return -1;
}
stock IsABike(model)
{
    if (model == 581 || model == 509 || model == 481 || model == 462 || model == 521 || model == 463 || model == 510 || model == 522 || model == 461 || model == 448 || model == 471 || model == 468 || model == 586 )return 1;
    return 0;
}
stock GetSpeed(playerid)
{
	new Float:STt[4];
	if (IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleVelocity(GetPlayerVehicleID(playerid),STt[0],STt[1],STt[2]);
	}
	else
	{
		GetPlayerVelocity(playerid,STt[0],STt[1],STt[2]);
	}
	STt[3] = floatsqroot(floatpower(floatabs(STt[0]), 2.0) + floatpower(floatabs(STt[1]), 2.0) + floatpower(floatabs(STt[2]), 2.0)) * 100.3;
	return floatround(STt[3]);
}
stock GetGunSlot(weaponid)
{
	switch(weaponid)
	{
	    case 0,1:return 0;
	    case 2..9:return 1;
	    case 22..24:return 2;
	    case 25..27:return 3;
	    case 28,29,32:return 4;
	    case 30,31:return 5;
	    case 33,34:return 6;
	    case 35..38:return 7;
	    case 16..18,39:return 8;
	    case 41..43:return 9;
	    case 10..15:return 10;
	    case 44..46:return 11;
	    case 40:return 12;
	}
	return -1;
}
stock UseCar(carid)
{
	foreach(new i:Player)
 	{
  		if(!PlayerConnect{i})continue;
        if(IsPlayerInVehicle(i, carid))
        {
            return 1;
        }
	}
	return 0;
}
stock ProgramLog(logstr[500])
{
    new globallogstr[500];
	new y;
	new m;
	new d;
	new hour;
	new minutes;
	new seconds;
	getdate(y,m,d);
	gettime(hour,minutes,seconds);
	format(globallogstr,sizeof(globallogstr),"[%d.%d.%d %d:%d:%d] %s\r\n",d,m,y,hour,minutes,seconds,logstr);
	new File:logfile=fopen("ac_log.txt",io_append);
	fwrite(logfile,globallogstr);
	fclose(logfile);
	return 1;
}
stock IsABoat(carid)
{
	switch (GetVehicleModel(carid))
	{
		case 472, 473, 493, 595, 484,
		430, 452..454, 446 : return 1;
	}
	return 0;
}
stock Itter_AddInternal(&count, array[], value, size)
{
	if (0 <= value < size && array[value] > size)
	{
		new last = size,next = array[last];
		while (next < value)
		{
			last = next;
			next = array[last];
		}
		array[last] = value;
		array[value] = next;
		++count;
		return 1;
	}
	return 0;
}
stock Itter_RemoveInternal(&count, array[], value, size)
{
	new last;
	return Itter_SafeRemoveInternal(count, array, value, last, size);
}
stock Itter_SafeRemoveInternal(&count, array[], value, &last, size)
{
	if (0 <= value < size && array[value] <= size)
	{
		last = size;
		new
			next = array[last];
		while (next != value)
		{
			last = next;
			next = array[last];
		}
		array[last] = array[value];
		array[value] = size + 1;
		--count;
		return 1;
	}
	return 0;
}

forward PlayerKick(playerid);
//forward PPPDS();
forward OnUpdateCheatPlayers();
forward AC_SetPlayerSkillLevel(playerid, skill, level);
forward AC_SetPlayerPos(playerid,Float:x,Float:y,Float:z);
forward AC_SetPlayerPosFindZ(playerid,Float:x,Float:y,Float:z);
forward AC_PutPlayerInVehicle(playerid,vehicleid,seatid);
forward AC_GivePlayerWeapon(playerid,weaponid,ammo);
forward AC_ResetPlayerWeapons(playerid);
forward AC_SetPlayerHealth(playerid,Float:health);
forward AC_SetPlayerArmour(playerid,Float:armour);
forward AC_AddVehicleComponent(vehicleid, componentid);
forward AC_RemoveVehicleComponent(vehicleid,componentid);
forward UpdateVehiclePos(vehicleid, type);
forward AC_SetVehicleHealth(vehicleid,Float:health);
forward AC_RepairVehicle(vehicleid);
forward AC_CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay);
forward AC_AddStaticVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2);
forward AC_AddStaticVehicleEx(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2,rd);
forward AC_SetVehiclePos(vehicleid,Float:x,Float:y,Float:z);
forward AC_SetVehicleZAngle(vehicleid,Float:angle);
forward AC_PlayerSpectateVehicle(playerid,targetplayerid,mode);
forward AC_PlayerSpectatePlayer(playerid,targetplayerid,mode);
forward AC_RemovePlayerFromVehicle(playerid);
forward AC_TogglePlayerControllable(playerid,toggle);
forward AC_SetPlayerSpecialAction(playerid,actionid);
forward AC_AddStaticPickup(model,type,Float:X,Float:Y,Float:Z,Virtualworld);
forward AC_CreatePickup(model,type,Float:X,Float:Y,Float:Z,Virtualworld);
forward AC_DestroyPickup(pickupid);
forward AC_EditObject(playerid,objectid);
forward AC_EditPlayerObject(playerid,objectid);
forward AC_SetPlayerInterior(playerid,interiorid);
forward AC_SetPlayerVirtualWorld(playerid,worldid);
forward AC_ShowPlayerDialog(playerid,dialogid,style,caption[],info[],button1[],button2[]);
forward AC_SetVehicleVelocity(vehicleid,Float:x,Float:y,Float:z);
forward AC_SetPlayerVelocity(playerid,Float:x,Float:y,Float:z);
forward AC_SetPlayerFacingAngle(playerid,Float:ang);
forward AC_SetPlayerDrunkLevel(playerid,level);
forward AC_SetPlayerWorldBounds(playerid,Float:x_max,Float:x_min,Float:y_max,Float:y_min);
forward AC_SetPlayerAmmo(playerid,weaponslot,ammo);
forward AC_SetPlayerArmedWeapon(playerid,weaponid);
forward AC_SetPlayerWantedLevel(playerid,level);
forward AC_TogglePlayerSpectating(playerid,toggle);
//forward KickCheat(playerid,id);
forward OnFilterScriptInit();
forward OnFilterScriptExit();
forward OnPlayerConnect(playerid);
forward OnPlayerDisconnect(playerid, reason);
forward OnPlayerSpawn(playerid);
forward OnPlayerDeath(playerid, killerid, reason);
forward OnVehicleSpawn(vehicleid);
forward OnPlayerRequestClass(playerid, classid);
forward OnPlayerEnterVehicle(playerid, vehicleid, ispassenger);
forward OnPlayerExitVehicle(playerid, vehicleid);
forward OnPlayerStateChange(playerid, newstate, oldstate);
forward OnVehicleMod(playerid, vehicleid, componentid);
forward OnVehiclePaintjob(playerid, vehicleid, paintjobid);
forward OnVehicleRespray(playerid, vehicleid, color1, color2);
forward OnVehicleDamageStatusUpdate(vehicleid, playerid);
forward OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z);
forward OnPlayerExitedMenu(playerid);
forward OnPlayerUpdate(playerid);
forward OnVehicleStreamIn(vehicleid, forplayerid);
forward OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart);
forward OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart);
forward OnPlayerClickPlayer(playerid, clickedplayerid, source);
forward OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);


/*AntiDeAMX()
{
	new a[][] =
	{
		"Unarmed (Fist)",
		"Brass K"
	};
	#pragma unused a
}
AntiDeAMX2()
{
	new b;
 	#emit load.pri b
 	#emit stor.pri b
}*/

public OnFilterScriptInit()
{
	//print("[W_AC] World AntiCheat 1.0");
	//print("[W_AC] Создатель: Valera_Trefilov");
	//print("[W_AC] Приобретение лицензии и обновлений в VK: vk.com/world.rpgame");
    //AntiDeAMX();
    //AntiDeAMX2();
 	for(new playerid=0; playerid<MAX_PLAYERS;playerid++)
	{
	    PlayerConnect{playerid}=0;
	    SCarstime[playerid]=0;
	    Carsspeed[playerid]=0;
	    //SpecialActtime[playerid]=0;
	    KickWithCheat{playerid}=0;
	    VehFly[playerid]=0;
	    //PlayerRunTime[playerid]=0;
	    Flypodoz[playerid]=0;
	    AC_VehicleTeleportToMe[playerid]=0;
	    PlayerHP[playerid]=0.0;
	    PlayerAP[playerid]=0;
	    //AC_PlayerSpAct{playerid}=0;
	    AC_spppos[playerid]=0;
	    AC_Healthtime[playerid]=0;
	    AC_Armourtime[playerid]=0;
	    AC_GunCheattime[playerid]=0;
	    VehicleEnters[playerid]=INVALID_VEHICLE_ID;
	    AC_NoAFK{playerid}=0;
	    AC_NoDeath{playerid}=0;
	    //NewPos[playerid][0]=0.0;
	    //NewPos[playerid][1]=0.0;
	    //NewPos[playerid][2]=0.0;
	    SuperTick[playerid]=0;
	    AC_SpeedChange[playerid]=0;
	    AC_SPEEDGORKA[playerid]=0;
	    AC_SpeedChangetime[playerid]=0;
	    AC_PlayerToggle[playerid]=1;
	    //PlayerVirtualWorld[playerid][0]=0;
	    //PlayerVirtualWorld[playerid][1]=0;
	    AC_plsp{playerid}=0;
	    AC_DIED[playerid]=0;
	 	AC_DIED_REASON[playerid]=0;
 		PlayerSkill[playerid][0]=0;
		PlayerSkill[playerid][1]=0;
		PlayerSkill[playerid][2]=0;
		PlayerSkill[playerid][3]=0;
		PlayerSkill[playerid][4]=0;
		PlayerSkill[playerid][5]=0;
		PlayerSkill[playerid][6]=0;
		PlayerSkill[playerid][7]=0;
		PlayerSkill[playerid][8]=0;
		PlayerSkill[playerid][9]=0;
		PlayerSkill[playerid][10]=0;
		GunPlayer[playerid][0][0]=0;
		GunPlayer[playerid][1][0]=0;
		GunPlayer[playerid][2][0]=0;
		GunPlayer[playerid][3][0]=0;
		GunPlayer[playerid][4][0]=0;
		GunPlayer[playerid][5][0]=0;
		GunPlayer[playerid][6][0]=0;
		GunPlayer[playerid][7][0]=0;
		GunPlayer[playerid][8][0]=0;
		GunPlayer[playerid][9][0]=0;
		GunPlayer[playerid][10][0]=0;
		GunPlayer[playerid][11][0]=0;
		GunPlayer[playerid][12][0]=0;
		GunPlayer[playerid][0][1]=0;
		GunPlayer[playerid][1][1]=0;
		GunPlayer[playerid][2][1]=0;
		GunPlayer[playerid][3][1]=0;
		GunPlayer[playerid][4][1]=0;
		GunPlayer[playerid][5][1]=0;
		GunPlayer[playerid][6][1]=0;
		GunPlayer[playerid][7][1]=0;
		GunPlayer[playerid][8][1]=0;
		GunPlayer[playerid][9][1]=0;
		GunPlayer[playerid][10][1]=0;
		GunPlayer[playerid][11][1]=0;
		GunPlayer[playerid][12][1]=0;
  		if(IsPlayerConnected(playerid))
	    {
			PlayerConnect{playerid}=1;
			Itter_Add(Player, playerid);
			//AC_plsp{playerid}=1;
			GetPlayerPos(playerid,OldPos[playerid][0],OldPos[playerid][1],OldPos[playerid][2]);
			GetPlayerPos(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2]);
			PlayerHP[playerid] = 100.0;
		}
	}
	//SetTimer("PPPDS",1100,1);
	SetTimer("OnUpdateCheatPlayers",1100,1);
	GetSpeedModeIptimized=GetTickCount();
	return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
	if(PlayerConnect{playerid}==0) return 1;
	GetPlayerPos(playerid,OldPos[playerid][0],OldPos[playerid][1],OldPos[playerid][2]);
	return 1;
}

//public PPPDS()
//{
	//OnUpdateCheatPlayers();
	//GetSpeedModeIptimized=GetTickCount();
// 	return 1;
//}
//native random(max);

forward KickLoh(playerid,name[24]);
public KickLoh(playerid,name[24])
{
	new str[64];
	format(str,64,"Попытка входа %s",name);
	BanEx(playerid,str);
	return 1;
}

//new Palevo[4][128];

//forward PlayerKick(playerid);
//public PlayerKick(playerid)
//{
//	Kick(playerid);
//	return true;
//}

public OnPlayerConnect(playerid)
{
	new ip[32],name[24];
	GetPlayerIp(playerid,ip,32);
	GetPlayerName(playerid,name,24);

	/*new palka = 0;
	if((name[0] > 'a' && name[0] < 'z') || strfind(name,"_",true,1) == -1)
	{
 		SendClientMessage(playerid,0xFF6347AA,"Вы были кикнуты сервером. Ваш ник не соответствует РП режиму.");
		SendClientMessage(playerid,0xFF6347AA,"Пример РП никнейма: Carl_Johnson, Katy_Johnson");
		SendClientMessage(playerid,0xFF6347AA,"{32CD32}Подсказка: нет символа '_' или первая буква не заглавная.");
		SetTimerEx("PlayerKick", 1000, false, "d", playerid);
		return true;
	}

	for (new i; i < strlen(name); i++)
	{
		switch(name[i])
		{
		    case '_':
			{
			    palka++;
			    if(palka > 1)
			    {
				    SendClientMessage(playerid,0xAA3333AA,"Вы были кикнуты сервером. Ваш ник не соответствует РП режиму.");
					SendClientMessage(playerid,0xAA3333AA,"Пример РП никнейма: Carl_Johnson, Katy_Johnson");
					SendClientMessage(playerid,0xAA3333AA,"{32CD32}Подсказка: Несколько символов '_' в нике.");
					SetTimerEx("PlayerKick", 1000, false, "d", playerid);
					break;
			    }
				switch(name[i+1])
				{
				    case 'a'..'z':
					{
					    SendClientMessage(playerid,0xAA3333AA,"Вы были кикнуты сервером. Ваш ник не соответствует РП режиму.");
						SendClientMessage(playerid,0xAA3333AA,"Пример РП никнейма: Carl_Johnson, Katy_Johnson");
						SendClientMessage(playerid,0xAA3333AA,"{32CD32}Подсказка: Фамилия с маленькой буквы.");
						SetTimerEx("PlayerKick", 1000, false, "d", playerid);
						break;
				    }
				}
			}
			case '[',']','{','}','$','#','№','"','@','!',';','%','^',':','?','&','*','(',')','=','+','<','>':
			{
				SendClientMessage(playerid,0xAA3333AA,"Вы были кикнуты сервером.");
				SendClientMessage(playerid,0xAA3333AA,"В вашем нике найдены запрещенные символы.");
				SetTimerEx("PlayerKick", 1000, false, "d", playerid);
				break;
			}
		    case '0'..'9':
		    {
				SendClientMessage(playerid,0xAA3333AA,"Вы были кикнуты сервером.");
				SendClientMessage(playerid,0xAA3333AA,"В вашем нике найдены символы цифр, пожалуйста смените ник.");
				SetTimerEx("PlayerKick", 1000, false, "d", playerid);
				break;
		    }
		}
	}*/

	if(!strcmp(name,"Tim_Starker"))
	{
	    new playerserial[128];
	    gpci(playerid,playerserial,sizeof(playerserial));
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Этот ник заблокирован!");
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Сервер будет намного лучше без тебя (c) Matthew_Cook");
	    printf("Номер компьютера лоха %s: %s",name,playerserial);
	    SetTimerEx("KickLoh", 1000, false, "ds", playerid,name);
	    return 1;
	}
	if(!strcmp(name,"Gordon_Owen"))
	{
	    new playerserial[128];
	    gpci(playerid,playerserial,sizeof(playerserial));
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Этот ник заблокирован!");
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Сервер будет намного лучше без тебя (c) Matthew_Cook");
	    printf("Номер компьютера лоха %s: %s",name,playerserial);
	    SetTimerEx("KickLoh", 1000, false, "ds", playerid,name);
	    return 1;
	}
	if(!strcmp(name,"Alexsander_Zaka"))
	{
	    new playerserial[128];
	    gpci(playerid,playerserial,sizeof(playerserial));
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Этот ник заблокирован!");
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Сервер будет намного лучше без тебя (c) Matthew_Cook");
	    printf("Номер компьютера лоха %s: %s",name,playerserial);
	    SetTimerEx("KickLoh", 1000, false, "ds", playerid,name);
	    return 1;
	}
	/*if(!strcmp(name,"No"))
	{
	    new playerserial[128];
	    gpci(playerid,playerserial,sizeof(playerserial));
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Этот ник заблокирован!");
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Сервер будет намного лучше без тебя (c) Matthew_Cook");
	    printf("Номер компьютера лоха %s: %s",name,playerserial);
	    SetTimerEx("KickLoh", 1000, false, "ds", playerid,name);
	    return 1;
	}
	if(!strcmp(name,"Dmitry_Tracers"))
	{
	    new playerserial[128];
	    gpci(playerid,playerserial,sizeof(playerserial));
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Этот ник заблокирован!");
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Сервер будет намного лучше без тебя (c) Matthew_Cook");
	    printf("Номер компьютера лоха %s: %s",name,playerserial);
	    SetTimerEx("KickLoh", 1000, false, "ds", playerid,name);
	    return 1;
	}
	if(!strcmp(name,"Don_Makkelvin"))
	{
	    new playerserial[128];
	    gpci(playerid,playerserial,sizeof(playerserial));
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Этот ник заблокирован!");
	    SendClientMessage(playerid,-1,"[Система защиты от неадекватов IRP] Сервер будет намного лучше без тебя (c) Matthew_Cook");
	    printf("Номер компьютера лоха %s: %s",name,playerserial);
	    SetTimerEx("KickLoh", 1000, false, "ds", playerid,name);
	    return 1;
	}*/
    PlayerConnect{playerid}=1;
    AC_SetPlayerSpecialAction(playerid,0);
	Itter_Add(Player, playerid);
	CallRemoteFunction("AC_MODE_OnPlayerConnect","i",playerid);
	return 1;
}
public OnPlayerDisconnect(playerid,reason)
{
    if(SCarstime[playerid]!=0)
		SCarstime[playerid]=0;
	if(Carsspeed[playerid]!=0)
	    Carsspeed[playerid]=0;
	//if(SpecialActtime[playerid]!=0)
	 //   SpecialActtime[playerid]=0;
	//if(PlayerRunTime[playerid] != 0)
	//	PlayerRunTime[playerid]=0;
	if(VehFly[playerid] != 0)
		VehFly[playerid]=0;
	if(KickWithCheat{playerid} != 0)
		KickWithCheat{playerid}=0;
	if(Flypodoz[playerid] != 0)
    	Flypodoz[playerid]=0;
	if(SuperTick[playerid] != 0)
    	SuperTick[playerid]=0;
	if(AC_Healthtime[playerid] != 0)
    	AC_Healthtime[playerid]=0;
	if(AC_Armourtime[playerid] != 0)
    	AC_Armourtime[playerid]=0;
	if(AC_GunCheattime[playerid] != 0)
    	AC_GunCheattime[playerid]=0;
    if(VehicleEnters[playerid]!=INVALID_VEHICLE_ID)
	    VehicleEnters[playerid]=INVALID_VEHICLE_ID;
	if(AC_NoAFK{playerid}!=0)
    	AC_NoAFK{playerid}=0;
	//if(AC_PlayerSpAct{playerid} != 0)
    //	AC_PlayerSpAct{playerid}=0;
	if(AC_SpeedChange[playerid] != 0)
    	AC_SpeedChange[playerid]=0;
	if(AC_SPEEDGORKA[playerid] != 0)
    	AC_SPEEDGORKA[playerid]=0;
	if(AC_SpeedChangetime[playerid] != 0)
    	AC_SpeedChangetime[playerid]=0;
	//if(PlayerVirtualWorld[playerid][0] != 0)
    //	PlayerVirtualWorld[playerid][0]=0;
	//if(PlayerVirtualWorld[playerid][1] != 0)
    //	PlayerVirtualWorld[playerid][1]=0;
	if(AC_plsp{playerid} != 0)
    	AC_plsp{playerid}=0;
	if(AC_DIED[playerid] != 0)
    	AC_DIED[playerid]=0;
	if(AC_DIED_REASON[playerid] != 0)
 		AC_DIED_REASON[playerid]=0;
	if(AC_PlayerToggle[playerid] != 1)
    	AC_PlayerToggle[playerid]=1;
	if(AC_VehicleTeleportToMe[playerid] != 0)
		AC_VehicleTeleportToMe[playerid]=0;
	if(AC_NoDeath{playerid} != 0)
    	AC_NoDeath{playerid} = 0;
	if(PlayerConnect{playerid} != 0)
	    PlayerConnect{playerid} = 0;
    Itter_Remove(Player, playerid);
    return 1;
}

public PlayerKick(playerid)
{
	Kick(playerid);
	return true;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
    //if(!PlayerConnect{playerid}) return 1;
    if (GetPlayerInterior(playerid)==0)
	{
  		CallRemoteFunction("OnPlayerCheat","ii",playerid,1);
	 	PlayerConnect{playerid}=0;
		return 1;
	}
	return 0;
}
public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
    //if(!PlayerConnect{playerid}) return 1;
    if (GetPlayerInterior(playerid)==0)
	{
		CallRemoteFunction("OnPlayerCheat","ii",playerid,2);
	 	PlayerConnect{playerid}=0;
		return 1;
	}
	return 0;
}
public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
    //if(!PlayerConnect{playerid}) return 1;
    if (GetPlayerInterior(playerid)==0)
	{
		CallRemoteFunction("OnPlayerCheat","ii",playerid,3);
	 	PlayerConnect{playerid}=0;
		return 1;
	}
	return 0;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    //if(!PlayerConnect{playerid}) return 1;
    VehTime[vehicleid] = 5;
	SuperTick[playerid]=GetTickCount();
	VehicleEnters[playerid]=vehicleid;
	if (!UseCar(vehicleid))
	{
	    SetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
    	SetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
	}
	return 1;
}
public OnPlayerExitVehicle(playerid,vehicleid)
{
    //if(!PlayerConnect{playerid}) return 1;
    VehTime[vehicleid] = 5;
	if (GetVehicleModel(vehicleid)>=400)
	{
	    if (SpeedLimit[GetVehicleModel(vehicleid)-400]==200)
		{
		    GunPlayer[playerid][11][0]=46;
	    	GunPlayer[playerid][11][1]=1;
			AC_GunCheattime[playerid]=3+floatround(GetPlayerPing(playerid)/100);
		}
		GetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
	    GetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
	}
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    //if(!PlayerConnect{playerid}) return 1;
    if (newstate==oldstate)
	{
		CallRemoteFunction("OnPlayerCheat","ii",playerid,4);
	 	PlayerConnect{playerid}=0;
		return 1;
	}
	if (newstate == PLAYER_STATE_DRIVER)
	{
		if (VehicleEnters[playerid]!=GetPlayerVehicleID(playerid))
		{
			CallRemoteFunction("OnPlayerCheat","ii",playerid,6);
	 		PlayerConnect{playerid}=0;
			return 1;
		}
	    if (GetTickCount()-SuperTick[playerid]<300 && !IsABoat(VehicleEnters[playerid]))
		{
		    CallRemoteFunction("OnPlayerCheat","ii",playerid,7);
	 		PlayerConnect{playerid}=0;
			return 1;
		}
	    SuperTick[playerid]=0;
	    removetimer[playerid]=0;
	}
	if (newstate==PLAYER_STATE_PASSENGER)
	{
	    removetimer[playerid]=0;
	}
	if (newstate==PLAYER_STATE_PASSENGER)
	{
		GetPlayerPos(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2]);
		GetPlayerPos(playerid,OldPos[playerid][0],OldPos[playerid][1],OldPos[playerid][2]);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    //if(!PlayerConnect{playerid}) return 1;
	if(hittype==BULLET_HIT_TYPE_PLAYER)
	{
		if(fX>=10 || fY>=10 || fZ>=10 || fX<=-10 || fY<=-10 || fZ<=-10)
		{
        	CallRemoteFunction("OnPlayerCheat","ii",playerid,8);
	 		PlayerConnect{playerid}=0;
		    return 0;
		}
	}
	new slot=GetGunSlot(weaponid);
	if(GetTickCount()-WeaponTime[playerid]<120 && weaponid!=17 && weaponid<=27 || GetTickCount()-WeaponTime[playerid]<30 &&  weaponid>27 && weaponid<=34)
	{
	    RapidFire[playerid]++;
	    if(RapidFire[playerid]>3)
	    {
			CallRemoteFunction("OnPlayerCheat","ii",playerid,9);
			PlayerConnect{playerid}=0;
	    	return 0;
		}
	}
	else if(RapidFire[playerid]>0)
	{
	    RapidFire[playerid]=0;
	}
	WeaponTime[playerid]=GetTickCount();
	if(AC_GunCheattime[playerid]==0)
	{
		if(GunPlayer[playerid][slot][0]!=weaponid)
		{
			CallRemoteFunction("OnPlayerCheat","ii",playerid,10);
	 		PlayerConnect{playerid}=0;
	    	return 0;
		}
	}
 	if (hittype!=BULLET_HIT_TYPE_PLAYER) return 1;

	if(GetVehicleModel(GetPlayerVehicleID(playerid)==447)||weaponid==38) return 0;

 	new Float:AC_Helath;
	new Float:AC_Uron;
	new Float:AC_Armora;
	new Float:AC_UronA;
		 
 	GetPlayerArmour(hitid,AC_Armora);
 	GetPlayerHealth(hitid,AC_Helath);
 	
 	
 	AC_UronA = 0.0;
 	switch(weaponid)
 	{
	     case 1: AC_Uron=1.320000;
	     case 2,3,5,6,7,10,12,14,22: AC_Uron=4.620000;
	     case 4,8,11,13,15: AC_Uron=2.640000;
	     case 9: AC_Uron=13.530000;
	     case 16,35,36,39: AC_Uron=82.500000;
	     case 23: AC_Uron=13.200000;
	     case 24: AC_Uron=46.200000,AC_UronA=15.0;
	     case 25,26:
	     {
	        new Float:AC_POSX;
			new Float:AC_POSY;
			new Float:AC_POSZ;
				
	        GetPlayerPos(playerid,AC_POSX,AC_POSY,AC_POSZ);
	        
	        if(IsPlayerInRangeOfPoint(hitid,5,AC_POSX,AC_POSY,AC_POSZ))
	        	AC_Uron=35.0;
			else if(IsPlayerInRangeOfPoint(hitid,15,AC_POSX,AC_POSY,AC_POSZ))
	        	AC_Uron=20.0;
            else if(IsPlayerInRangeOfPoint(hitid,30,AC_POSX,AC_POSY,AC_POSZ))
	        	AC_Uron=12.0;
            else if(IsPlayerInRangeOfPoint(hitid,50,AC_POSX,AC_POSY,AC_POSZ))
	        	AC_Uron=6.0;
			else
			    AC_Uron=3.0;
	     }
	     case 27: AC_Uron=39.600002;
	     case 28,32: AC_Uron=6.600000;
	     case 29: AC_Uron=8.250000;
		 case 30,31: AC_Uron=9.900000,AC_UronA=8.0;
	     case 33: AC_Uron=24.750001,AC_UronA=10.0;
	     case 34: AC_Uron=41.250000;
	     case 38: AC_Uron=46.200000;
         case 41,42: AC_Uron=0.330000;
 	}
 	new getskill = GetWeaponSkill(weaponid);
 	if(getskill != -1)
 	{
		AC_Uron = AC_Uron-PlayerSkill[playerid][GetWeaponSkill(weaponid)]/100;
		AC_Uron = AC_Uron/2-AC_UronA;
 	}
 	if(AC_Armora<=0)
 	{
	 	AC_Helath -= AC_Uron;
	 	if(AC_Helath<=0)
	 	{
			AC_NoDeath{hitid}=1;
			AC_DIED[hitid]=playerid;
			AC_DIED_REASON[hitid]=weaponid;
			PlayerHP[hitid]=-50.0;
	    	SetPlayerHealth(hitid,-50);
	    	AC_Healthtime[hitid]=gettime()+3+floatround(GetPlayerPing(hitid)/100);
	 	    CallRemoteFunction("AC_BACK_OnPlayerDeath","iii",hitid,playerid,weaponid);
	 	}
	 	else
	 	{
	 	    AC_SetPlayerHealth(hitid,AC_Helath);
		}
 	}
 	else
 	{
 	    AC_Armora-=AC_Uron;
	 	if(AC_Armora<0)
		{
            AC_Armora=0;
		}
	 	AC_SetPlayerArmour(hitid,AC_Armora);
 	}
	return 1;
}


public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	return 1;
}
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
    return 1;
}

public OnPlayerUpdate(playerid)
{
    if(!PlayerConnect{playerid}) return 1;
    if(AC_NoAFK{playerid}!=1)
    {
		AC_NoAFK{playerid}=1;
	}
	new Float:x;
	new Float:y;
	new Float:z;
	new PlayerSpeed=GetSpeed(playerid);
	new vehicleid=GetPlayerVehicleID(playerid);
	new plcarmod=GetVehicleModel(vehicleid);
	if (PlayerSpeed>AC_UpdateSpeedPlayer[playerid])
	{
		AC_UpdateSpeedPlayer[playerid]=PlayerSpeed;
	}
	GetPlayerPos(playerid,x,y,z);
	if (GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
	{
	    if (AC_spppos[playerid]==0)
		{
		    if (VehPos[vehicleid][0]-x>10 || x-VehPos[vehicleid][0]>10 || VehPos[vehicleid][1]-y>10 || y-VehPos[vehicleid][1]>10 ||VehPos[vehicleid][2]-z>20 || z-VehPos[vehicleid][2]>20)return 0;
			VehPos[vehicleid][0]=x;
			VehPos[vehicleid][1]=y;
			VehPos[vehicleid][2]=z;
		}
	    if (x>=20000 || y>=20000 || z>=20000)
		{
	        SetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
        	SetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
			CallRemoteFunction("OnPlayerCheat","ii",playerid,11);
	 		PlayerConnect{playerid}=0;
	        return 0;
	    }
	}
	else if (GetPlayerState(playerid)==PLAYER_STATE_PASSENGER)
	{
	    if (x>=20000 || y>=20000 || z>=20000)
		{
	        SetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
        	SetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
	        return 0;
	    }
	}
	else if (VehicleEnters[playerid]!=INVALID_VEHICLE_ID && GetTickCount()-SuperTick[playerid]>30000)
	{
	    SetTimerEx("UpdateVehiclePos", 2000, false, "ii", VehicleEnters[playerid], 1);
        BanCar{VehicleEnters[playerid]} = 1;
		x=floatround(PVHFL[playerid][0]-x);
		y=floatround(PVHFL[playerid][1]-y);
		z=floatround(PVHFL[playerid][2]-z);
		if (x<70 && y<70 && z<70)
		{
	 		GetPlayerPos(playerid,OldPos[playerid][0],OldPos[playerid][1],OldPos[playerid][2]);
	   		GetPlayerPos(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2]);
		}
    	SetPVarInt(playerid,"AC_PlayerToggleTime",gettime()+5+floatround(GetPlayerPing(playerid)/100));
    	new vehmod=GetVehicleModel(VehicleEnters[playerid]);
    	if (vehmod>=400)
    	{
		    if (SpeedLimit[vehmod-400]==200)
			{
	  			GunPlayer[playerid][11][0]=46;
	    		GunPlayer[playerid][11][1]=1;
				AC_GunCheattime[playerid]=3+floatround(GetPlayerPing(playerid)/100);
			}
		}
		VehicleEnters[playerid]=INVALID_VEHICLE_ID;
		RemovePlayerFromVehicle(playerid);
	}
	if (GetPlayerState(playerid)==PLAYER_STATE_DRIVER && plcarmod>=400)
	{
	    if (PlayerSpeed>=350)
		{
			CallRemoteFunction("OnPlayerCheat","ii",playerid,12);
	 		PlayerConnect{playerid}=0;
			return 1;
		}
	    if (PlayerSpeed-AC_SpeedChange[playerid]>47)
		{
	        AC_SpeedChangetime[playerid]++;
	        if (AC_SpeedChangetime[playerid]==2)
			{
				CallRemoteFunction("OnPlayerCheat","ii",playerid,13);
	 			PlayerConnect{playerid}=0;
				return 1;
			}
            else if (PlayerSpeed-AC_SpeedChange[playerid]>76)
			{
				CallRemoteFunction("OnPlayerCheat","ii",playerid,14);
	 			PlayerConnect{playerid}=0;
				return 1;
			}
		}
		else
		{
			AC_SpeedChangetime[playerid]=0;
		}
		AC_SpeedChange[playerid]=PlayerSpeed;
		if (IsABike(plcarmod))
		{
		    if (SpeedLimit[plcarmod-400]+50<PlayerSpeed)
			{
			    if (AC_SPEEDGORKA[playerid]>0)
				{
			        AC_SPEEDGORKA[playerid]--;
				}
				else
				{
					if((z-Speedz[playerid])<0 && GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],Speedz[playerid])>0.1)
					{
						if(!((Speedz[playerid]-z)>GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],Speedz[playerid])/100*30))
						{
         					CallRemoteFunction("OnPlayerCheat","ii",playerid,15);
	 						PlayerConnect{playerid}=0;
		                    return 1;
						}
						AC_SPEEDGORKA[playerid]=20;
					}
				}
			}
		}
		else if (SpeedLimit[plcarmod-400]+25<PlayerSpeed && GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
		{
		    if (AC_SPEEDGORKA[playerid]>0)
			{
		        AC_SPEEDGORKA[playerid]--;
			}
		    else
			{
				if((z-Speedz[playerid])<0 && GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],Speedz[playerid])>0.1)
				{
					if(!((Speedz[playerid]-z)>GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],Speedz[playerid])/100*30))
					{
						CallRemoteFunction("OnPlayerCheat","ii",playerid,16);
						PlayerConnect{playerid}=0;
	                    return 1;
					}
					AC_SPEEDGORKA[playerid]=20;
				}
			}
		}
	}
	
	GetPlayerPos(playerid,x,y,Speedz[playerid]);

	if (GetPlayerState(playerid)==PLAYER_STATE_DRIVER && plcarmod>=400)
	{
		GetPlayerPos(playerid,x,y,z);
		if (SpeedLimit[plcarmod-400]==200) return 1;
		if((z-PVHFL[playerid][2])>0 && GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2])>0.1)
		{
			if((z-PVHFL[playerid][2])>GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2])/100*80 && PlayerSpeed<40)
			{
				VehFly[playerid]++;
				if (VehFly[playerid]>200 && PlayerSpeed>5)
				{
				    VehFly[playerid]=0;
					CallRemoteFunction("OnPlayerCheat","ii",playerid,24);
					PlayerConnect{playerid}=0;
					return 1;
				}
			}
			else VehFly[playerid]=0;
		}
		else VehFly[playerid]=0;
	}
	if (GetPlayerCameraMode(playerid) == 53)
	{
		new Float:kLibPos[3];
		GetPlayerCameraPos(playerid, kLibPos[0], kLibPos[1], kLibPos[2]);
		if (kLibPos[2] < -50000.0 || kLibPos[2] > 50000.0)
		{
		    Kick(playerid);
		    return 0;
		}
	}
	return 1;
}


public OnFilterScriptExit()
{
	return 1;
}

new allow=0;

public OnUpdateCheatPlayers()
{
	new check=GetTickCount()-GetSpeedModeIptimized;
	new anticount=2000/check;
	//printf("хуек: %d / хуяунт: %d",check,anticount);
	if (check>2500)
	    allow++;
	else
		allow=0;
  	foreach(new playerid:Player)
	{
	    if(!PlayerConnect{playerid}) continue;
		if(!AC_plsp{playerid}) continue;
		if(!AC_NoAFK{playerid}) continue;
		
		new Float:POSX;
		new Float:POSY;
		new Float:POSZ;
		new INTRINDCAT;
		new INSHESYAT;
		new animlib[24];
		new animname[24];
		new PlayerSpeed=GetSpeed(playerid);
		new skin_pl=GetPlayerSkin(playerid);
		new PlayerState=GetPlayerState(playerid);
			
		if(AC_NoAFK{playerid}!=0)
		{
			AC_NoAFK{playerid}=0;
		}
		AC_UpdateSpeedPlayer[playerid]=0;
		
		GetPlayerPos(playerid,POSX,POSY,POSZ);
		
		if (POSZ<-60 && AC_UpdateSpeedPlayer[playerid]>10 && GetPlayerInterior(playerid) == 0 && !IsPlayerInRangeOfPoint(playerid, 5.0, 1177.17, -1323.32, 14.06) && !IsPlayerInRangeOfPoint(playerid, 5.0, -359.76, -45.62, -57.87))
		{
			AC_SetPlayerPosFindZ(playerid,POSX,POSY,POSZ);
			continue;
		}
		if (AC_VehicleTeleportToMe[playerid]>=10)
		{
		    if(KickWithCheat{playerid} < 3)
			{
				KickWithCheat{playerid}++;
				//continue;
			}
			else
			{
			    KickWithCheat{playerid}=0;
				CallRemoteFunction("OnPlayerCheat","ii",playerid,25);
				PlayerConnect{playerid}=0;
				continue;
			}
		}
		AC_VehicleTeleportToMe[playerid]=0;
		if (IsPlayerInAnyVehicle(playerid))
		{
		    INTRINDCAT=200;
		    INSHESYAT=50;
		}
		else
		{
		    INTRINDCAT=120;
		    INSHESYAT=60;
		}
		if (removetimer[playerid]>0)
		{
		    removetimer[playerid]--;
		    if (removetimer[playerid]==0 && IsPlayerInAnyVehicle(playerid))
			{
				CallRemoteFunction("OnPlayerCheat","ii",playerid,26);
				PlayerConnect{playerid}=0;
				continue;
			}
		}
		
 		if (GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)
		{
			CallRemoteFunction("OnPlayerCheat","ii",playerid,17);
			PlayerConnect{playerid}=0;
	 		continue;
		}
		
		GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof(animlib), animname, sizeof(animname));
		
		if (!PlayerSpectate{playerid} && skin_pl!=0 && skin_pl!=76 && PlayerState==PLAYER_STATE_ONFOOT)
		{
	    	if (strcmp(animlib, "PED", true) == 0 && strcmp(animname, "RUN_PLAYER", true) == 0)
			{
			    SetPVarInt(playerid,"PlayerRunTime",GetPVarInt(playerid,"PlayerRunTime")+1);
   				if (GetPVarInt(playerid,"PlayerRunTime")>=10)
				{
					DeletePVar(playerid,"PlayerRunTime");
					CallRemoteFunction("OnPlayerCheat","ii",playerid,22);
					PlayerConnect{playerid}=0;
	        		continue;
				}

			}
			else if(GetPVarInt(playerid,"PlayerRunTime")>0)
			{
				DeletePVar(playerid,"PlayerRunTime");
			}
		}
		
		if (strcmp(animlib, "SWIM", true) == 0 && strcmp(animname, "SWIM_crawl", true) == 0 && PlayerSpeed>20 && PlayerState==PLAYER_STATE_ONFOOT)
		{
			CallRemoteFunction("OnPlayerCheat","ii",playerid,23);
			PlayerConnect{playerid}=0;
			continue;
		}
		if(!(strcmp(animlib, "PED", true) == 0 && strcmp(animname, "FALl_FALl", true) == 0) && !(strcmp(animlib, "PED", true) == 0 && strcmp(animname, "FALl_SKYDIVE", true) == 0)
		&& !(strcmp(animlib, "PARACHUTE", true) == 0 && strcmp(animname, "PARA_OPEN", true) == 0)&& !(strcmp(animlib, "PARACHUTE", true) == 0 && strcmp(animname, "FALl_SKYDIVE_ACCEL", true) == 0)
		&& !(strcmp(animlib, "PARACHUTE", true) == 0 && strcmp(animname, "FALl_SKYDIVE", true) == 0))
		{
			if (PlayerSpeed>=29 && PlayerState==PLAYER_STATE_ONFOOT && GetPlayerSurfingVehicleID(playerid)==INVALID_VEHICLE_ID)
			{
	        	Flypodoz[playerid]++;
		    	if (Flypodoz[playerid]>50)
		    	{
		        	if (strcmp(animlib, "PED", true) == 0 && strcmp(animname, "BIKE_FALLR", true) == 0 || strcmp(animlib, "PED", true) == 0 && strcmp(animname, "KO_SKID_FRONT", true) == 0)
		        	{
	        			if(Flypodoz[playerid]>100)
						{
							CallRemoteFunction("OnPlayerCheat","ii",playerid,20);
							PlayerConnect{playerid}=0;
							continue;
						}
					}
	   				else if (GetPlayerWeapon(playerid)!=46)
	   				{
	    				CallRemoteFunction("OnPlayerCheat","ii",playerid,21);
						PlayerConnect{playerid}=0;
			   			continue;
					}
				}
			}
			else if(Flypodoz[playerid]>0)
			{
				Flypodoz[playerid]=0;
			}
		}
		
		if (PlayerState==PLAYER_STATE_ONFOOT && !strcmp(animname, "CAR_SIT_PRO", false))
		{
			CallRemoteFunction("OnPlayerCheat","ii",playerid,19);
			PlayerConnect{playerid}=0;
			continue;
		}
		
		if((strcmp(animlib, "PARACHUTE", true) == 0 && strcmp(animname, "FALl_SKYDIVE_ACCEL", true) == 0) || (strcmp(animlib, "PARACHUTE", true) == 0 && strcmp(animname, "FALl_SKYDIVE", true) == 0))
		{
 			if (GetPlayerWeapon(playerid)!=46 && PlayerState==PLAYER_STATE_ONFOOT && PlayerSpeed>=10)
			{
				CallRemoteFunction("OnPlayerCheat","ii",playerid,18);
				PlayerConnect{playerid}=0;
	   			continue;
			}
		}

		if (PlayerState==PLAYER_STATE_SPECTATING)
		{
		    if (PlayerSpectate{playerid}==0)
			{
				CallRemoteFunction("OnPlayerCheat","ii",playerid,27);
				PlayerConnect{playerid}=0;
				continue;
			}
		}
		else if (PlayerSpectate{playerid}==1)
		{
		    if (GetPVarInt(playerid,"AC_Spectate")<=gettime() && PlayerSpectate{playerid}!=0)
			{
				PlayerSpectate{playerid}=0;
			}
		}
		if (PlayerState==PLAYER_STATE_DRIVER)
		{
		    new veh=GetPlayerVehicleID(playerid);
		    if (VehicleEnters[playerid]!=GetPlayerVehicleID(playerid))
			{
				CallRemoteFunction("OnPlayerCheat","ii",playerid,28);
				PlayerConnect{playerid}=0;
				continue;
			}
      		foreach(new i:Player)
		    {
		        if(!PlayerConnect{i}) continue;
		        if(GetPlayerVehicleID(i)!=veh || GetPlayerState(i)!=PLAYER_STATE_PASSENGER) continue;
        		OldPos[i][0]=POSX;
		  		OldPos[i][1]=POSY;
		    	OldPos[i][2]=POSZ;
		     	PVHFL[i][0]=POSX;
		      	PVHFL[i][1]=POSY;
		       	PVHFL[i][2]=POSZ;
		       	break;
		    }
		    if (VehTime[GetPlayerVehicleID(playerid)]>0)
		    {
 			  	new Float:vhealth;
				GetVehicleHealth(GetPlayerVehicleID(playerid),vhealth);
		        VehTime[GetPlayerVehicleID(playerid)]--;
		        VehHealth[GetPlayerVehicleID(playerid)]=vhealth;
			}
			else
			{
			    new Float:vhealth;
				GetVehicleHealth(GetPlayerVehicleID(playerid),vhealth);
				if (vhealth>VehHealth[GetPlayerVehicleID(playerid)])
				{
				    new prrrka=0;
					for(new i=0; i<=9; i++)
					{
						if(!IsPlayerInRangeOfPoint(playerid, 20, paynspray[i][0], paynspray[i][1], paynspray[i][2])) continue;
						prrrka++;
						VehHealth[GetPlayerVehicleID(playerid)]=vhealth;
						break;
					}
					if (!prrrka)
					{
					    if (KickWithCheat{playerid} < 3)
					    {
					        KickWithCheat{playerid}++;
					    }
						else
						{
						    KickWithCheat{playerid}=0;
							CallRemoteFunction("OnPlayerCheat","ii",playerid,29);
							PlayerConnect{playerid}=0;
						    continue;
						}
					}
					SetVehicleHealth(GetPlayerVehicleID(playerid),VehHealth[GetPlayerVehicleID(playerid)]);
				}
				else VehHealth[GetPlayerVehicleID(playerid)]=vhealth;
			}
		}
        for(new i=0;i<12;i++)
		{
		    if (AC_GunCheattime[playerid]>0)
		    {
		        AC_GunCheattime[playerid]--;
		        break;
		    }
		    new weaponid;
			new ammo;
		    GetPlayerWeaponData(playerid,i,weaponid,ammo);
		    if (GunPlayer[playerid][i][0]!=weaponid && weaponid!=0)
			{
				if(KickWithCheat{playerid} < 3)
				{
					KickWithCheat{playerid}++;
				}
				else
				{
				    KickWithCheat{playerid}=0;
					CallRemoteFunction("OnPlayerCheat","ii",playerid,30);
					PlayerConnect{playerid}=0;
					continue;
				}
				ResetPlayerWeapons(playerid);
		 		break;
			}
		    if (GunPlayer[playerid][i][1]<ammo)
			{
				if(KickWithCheat{playerid} < 3)
				{
					KickWithCheat{playerid}++;
				}
				else
				{
				    KickWithCheat{playerid}=0;
					CallRemoteFunction("OnPlayerCheat","ii",playerid,31);
					PlayerConnect{playerid}=0;
					continue;
				}
				ResetPlayerWeapons(playerid);
		 		break;
			}
		    GunPlayer[playerid][i][1]=ammo;
		    GunPlayer[playerid][i][0]=weaponid;
		}
		if (PlayerState==PLAYER_STATE_SPECTATING) continue;
		
		if (AC_Healthtime[playerid]<=gettime())
		{
		    new Float:health;
			GetPlayerHealth(playerid,health);
			if (PlayerHP[playerid] < health)
			{
				if (KickWithCheat{playerid} < 2)
				{
                    PlayerHP[playerid]=health;
    				//SetPlayerHealth(playerid,PlayerHP[playerid]);
					KickWithCheat{playerid}++;
				}
				else
				{
				    KickWithCheat{playerid}=0;
     				CallRemoteFunction("OnPlayerCheat","ii",playerid,32);
					PlayerConnect{playerid}=0;
					continue;
				}
			}
			else PlayerHP[playerid] = health;
		}
		//if (SpecialActtime[playerid]>0) SpecialActtime[playerid]--;
		//else
		//{
		  //  if (AC_PlayerSpAct{playerid}!=GetPlayerSpecialAction(playerid))
		   // {
			//	switch (GetPlayerSpecialAction(playerid))
			//	{
			//		case 2,5,6,7,8,11,13,10,12,20,21,22,23,68:
			//		{
			//		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
			//		}
			//		default: AC_PlayerSpAct{playerid} = GetPlayerSpecialAction(playerid);
			//	}
			//}
		//}
		if (AC_Armourtime[playerid] <= gettime())
		{
		    new Float:armour;
			GetPlayerArmour(playerid,armour);
			if (PlayerAP[playerid]<armour)
			{
				CallRemoteFunction("OnPlayerCheat","ii",playerid,33);
				PlayerConnect{playerid}=0;
				continue;
			}
			else PlayerAP[playerid]=armour;
		}
		//if (PlayerVirtualWorld[playerid][1] > 0)
		//{
		//	PlayerVirtualWorld[playerid][1]--;
		//}
		//else if (GetPlayerVirtualWorld(playerid)!=PlayerVirtualWorld[playerid][0])
		//{
		    //SetPlayerVirtualWorld(playerid,PlayerVirtualWorld[playerid][0]);
			//SendClientMessage(playerid,0xFF9900AA,"Вы были кикнуты по подозрению в читерстве! (#034)");
			//PlayerConnect{playerid}=0;
		//	continue;
		//}
		if(AC_GunCheattime[playerid]==0 && GetGunSlot(GetPlayerWeapon(playerid))<12)
		{
			if (GunPlayer[playerid][GetGunSlot(GetPlayerWeapon(playerid))][0]!=GetPlayerWeapon(playerid) && GetPlayerWeapon(playerid)!=0)
			{
				if (KickWithCheat{playerid} < 3)
				{
					KickWithCheat{playerid}++;
				}
				else
				{
				    KickWithCheat{playerid}=0;
                    CallRemoteFunction("OnPlayerCheat","ii",playerid,35);
					PlayerConnect{playerid}=0;
					continue;
				}
				ResetPlayerWeapons(playerid);
				continue;
			}
		}
		new Float:x;
		new Float:y;
	 	new Float:z;
		new Float:ai;
	 	new sp;
		x = floatsqroot(floatpower(floatabs(PVHFL[playerid][0]-OldPos[playerid][0]), 2.0) + floatpower(floatabs(PVHFL[playerid][1]-OldPos[playerid][1]), 2.0) + floatpower(floatabs(PVHFL[playerid][2]-OldPos[playerid][2]), 2.0)) * anticount;
	    if(x>0)
	    {
				x=PVHFL[playerid][0]-POSX;
				y=PVHFL[playerid][1]-POSY;
				z=PVHFL[playerid][2]-POSZ;
				ai = floatround(floatsqroot(floatpower(floatabs(x), 2.0) + floatpower(floatabs(y), 2.0) + floatpower(floatabs(z), 2.0)) * anticount);
				sp=PlayerSpeed;
				if(!(ai-sp>INTRINDCAT && ai/100*INSHESYAT > sp))
				{
				    if(AC_spppos[playerid]>=1)
				    {
				        AC_spppos[playerid]--;
				        OldPos[playerid][0]=POSX;
				        OldPos[playerid][1]=POSY;
				        OldPos[playerid][2]=POSZ;
				        PVHFL[playerid][0]=POSX;
				        PVHFL[playerid][1]=POSY;
				        PVHFL[playerid][2]=POSZ;
		        		continue;
					}
					continue;
				}
		}
		else
		{
		    if(AC_spppos[playerid]>=1)
		    {
		        AC_spppos[playerid]--;
		        OldPos[playerid][0]=POSX;
		        OldPos[playerid][1]=POSY;
		        OldPos[playerid][2]=POSZ;
		        PVHFL[playerid][0]=POSX;
		        PVHFL[playerid][1]=POSY;
		        PVHFL[playerid][2]=POSZ;
		        if(PlayerState==PLAYER_STATE_DRIVER)
		        {
		            new myvehid=GetPlayerVehicleID(playerid);
		        	VehPos[myvehid][0]=POSX;
					VehPos[myvehid][1]=POSY;
					VehPos[myvehid][2]=POSZ;
				}
        		continue;
			}
			x=PVHFL[playerid][0]-POSX;
			y=PVHFL[playerid][1]-POSY;
			z=PVHFL[playerid][2]-POSZ;
			ai = floatround(floatsqroot(floatpower(floatabs(x), 2.0) + floatpower(floatabs(y), 2.0) + floatpower(floatabs(z), 2.0)) * anticount);
			sp=PlayerSpeed;
			if(ai-sp>INTRINDCAT && ai/100*INSHESYAT > sp)
			{
				if(PlayerState==PLAYER_STATE_PASSENGER && allow==0)
				{
				    new mycar=GetPlayerVehicleID(playerid);
    				foreach(new i:Player)
				    {
				        if(!PlayerConnect{i}) continue;
				        if(GetPlayerVehicleID(i)!=mycar) continue;
				        if(GetPlayerState(i)!=PLAYER_STATE_DRIVER) continue;
            			mycar=-1;
			            break;
				    }
				    if(mycar!=-1 && allow==0)
					{
 						CallRemoteFunction("OnPlayerCheat","ii",playerid,36);
						PlayerConnect{playerid}=0;
				        continue;
					}
				}
				else if(GetPlayerSurfingVehicleID(playerid)==INVALID_VEHICLE_ID && sp < 22 && allow==0)
				{
					CallRemoteFunction("OnPlayerCheat","ii",playerid,37);
					PlayerConnect{playerid}=0;
				    continue;
				}
			}
			//if(NewPos[playerid][0] !=0.0 && NewPos[playerid][1] !=0.0 && NewPos[playerid][2] != 0.0)
			//{
                //if(floatround(GetPlayerDistanceFromPoint(playerid, NewPos[playerid][0],NewPos[playerid][1],NewPos[playerid][2]))>200)
                //{
					//CallRemoteFunction("OnPlayerCheat","ii",playerid,47);
					//PlayerConnect{playerid}=0;
                    //continue;
                //}
                //NewPos[playerid][0]=0.0;
                //NewPos[playerid][1]=0.0;
                //NewPos[playerid][2]=0.0;
			//}
			if (AC_PlayerToggle[playerid]==0)
			{
				if(GetPVarInt(playerid,"AC_PlayerToggleTime")<=gettime())
				{
				    if(GetPVarInt(playerid,"AC_PlayerToggleTime")>0 && GetPVarInt(playerid,"AC_PlayerToggleTime")<=gettime())
				        DeletePVar(playerid,"AC_PlayerToggleTime");
				    if (PlayerState!=PLAYER_STATE_PASSENGER && ai>3)
					{
				        if (PlayerState!=PLAYER_STATE_DRIVER && GetPlayerSurfingVehicleID(playerid)==INVALID_VEHICLE_ID)
						{
				            if (GetPVarInt(playerid,"AC_PlayerToggleUpdate")>=2)
							{
								CallRemoteFunction("OnPlayerCheat","ii",playerid,38);
								PlayerConnect{playerid}=0;
								continue;
							}
							else SetPVarInt(playerid,"AC_PlayerToggleUpdate",GetPVarInt(playerid,"AC_PlayerToggleUpdate")+1);
						}
						else if (ai>30)
						{
						    if((POSZ-PVHFL[playerid][2])<0 && GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2])>0.1)
						    {
								if(!((PVHFL[playerid][2]-POSZ)>GetPlayerDistanceFromPoint(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2])/100*60))
								{
									CallRemoteFunction("OnPlayerCheat","ii",playerid,39);
									PlayerConnect{playerid}=0;
				                    continue;
								}
							}
						}
						else if(GetPVarInt(playerid,"AC_PlayerToggleUpdate")>0)
							DeletePVar(playerid,"AC_PlayerToggleUpdate");
					}
					else if(GetPVarInt(playerid,"AC_PlayerToggleUpdate")>0)
						DeletePVar(playerid,"AC_PlayerToggleUpdate");
				}
			}
		}
		OldPos[playerid][0]=POSX;
  		OldPos[playerid][1]=POSY;
    	OldPos[playerid][2]=POSZ;
     	PVHFL[playerid][0]=POSX;
      	PVHFL[playerid][1]=POSY;
       	PVHFL[playerid][2]=POSZ;
	}
	GetSpeedModeIptimized=GetTickCount();
	//SetTimer("OnUpdateCheatPlayers",250,0);
	return 1;
}



public AC_SetPlayerSkillLevel(playerid, skill, level)
{
    //if(!PlayerConnect{playerid}) return 1;
    PlayerSkill[playerid][skill] = level;
	SetPlayerSkillLevel(playerid, skill, level);
	return 1;
}

public AC_SetPlayerPos(playerid,Float:x,Float:y,Float:z)
{
    //if(!PlayerConnect{playerid}) return 1;
    AC_spppos[playerid]=3+floatround(GetPlayerPing(playerid)/100);
	GetPlayerPos(playerid,OldPos[playerid][0],OldPos[playerid][1],OldPos[playerid][2]);
    PVHFL[playerid][0]=x;
    PVHFL[playerid][1]=y;
    PVHFL[playerid][2]=z;
	//NewPos[playerid][0]=x;
	//NewPos[playerid][1]=y;
	//NewPos[playerid][2]=z;
    SetPlayerPos(playerid,x,y,z);
    return 1;
}

public AC_SetPlayerPosFindZ(playerid,Float:x,Float:y,Float:z)
{
    //if(!PlayerConnect{playerid}) return 1;
	if (z<0) z=30;
	if (GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
	{
		AC_SetVehiclePos(GetPlayerVehicleID(playerid),x,y,z);
	}
	else
	{
		AC_SetPlayerPos(playerid,x,y,z);
	}
    return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    //if(!PlayerConnect{playerid}) return 1;
    GameTextForPlayer(playerid, "~r~Wasted", 5000, 0);
    AC_PlayerToggle[playerid]=1;
    if(GetPVarInt(playerid,"AC_PlayerToggleTime")>0)
        DeletePVar(playerid,"AC_PlayerToggleTime");
    if(AC_NoDeath{playerid}==1)
    {
        PlayerHP[playerid] = -50;
        SetPlayerHealth(playerid, -50);
		CallRemoteFunction("AC_BACK_OnPlayerDeath","iii",playerid,AC_DIED[playerid],AC_DIED_REASON[playerid]);
        AC_NoDeath{playerid} = 0;
	}
	else
	{
 		CallRemoteFunction("AC_BACK_OnPlayerDeath","iii",playerid,killerid,reason);
	}
    return 1;
}
public OnPlayerSpawn(playerid)
{
    //if(!PlayerConnect{playerid}) return 1;
	//PlayerVirtualWorld[playerid][0]=GetPlayerVirtualWorld(playerid);
    AC_PlayerToggle[playerid]=1;
    if(GetPVarInt(playerid,"AC_PlayerToggleTime")>0)
        DeletePVar(playerid,"AC_PlayerToggleTime");
    PlayerHP[playerid] = 100.0;
	AC_plsp{playerid}=1;
    GetPlayerPos(playerid,PVHFL[playerid][0],PVHFL[playerid][1],PVHFL[playerid][2]);
    return 1;
}

public AC_PutPlayerInVehicle(playerid,vehicleid,seatid)
{
    //if(!PlayerConnect{playerid}) return 1;
    AC_spppos[playerid]=3+floatround(GetPlayerPing(playerid)/100);
	GetPlayerPos(playerid,OldPos[playerid][0],OldPos[playerid][1],OldPos[playerid][2]);
	new Float:x;
	new Float:y;
	new Float:z;
	GetVehiclePos(vehicleid,x,y,z);
    PVHFL[playerid][0]=x;
    PVHFL[playerid][1]=y;
    PVHFL[playerid][2]=z;
    VehicleEnters[playerid]=vehicleid;
	SuperTick[playerid]=GetTickCount()-1000;
    PutPlayerInVehicle(playerid,vehicleid,seatid);
    //PlayerVirtualWorld[playerid][0]=GetVehicleVirtualWorld(vehicleid);
    return 1;
}


public AC_GivePlayerWeapon(playerid,weaponid,ammo)
{
    //if(!PlayerConnect{playerid}) return 1;
    GunPlayer[playerid][GetGunSlot(weaponid)][0]=weaponid;
    if (ammo > 0) GunPlayer[playerid][GetGunSlot(weaponid)][1]+=ammo;
    else GunPlayer[playerid][GetGunSlot(weaponid)][1]-= ammo;
	GivePlayerWeapon(playerid,weaponid,ammo);
	AC_GunCheattime[playerid]=3+floatround(GetPlayerPing(playerid)/100);
	return 1;
}

public AC_ResetPlayerWeapons(playerid)
{
    //if(!PlayerConnect{playerid}) return 1;
	GunPlayer[playerid][0][0]=0;
	GunPlayer[playerid][1][0]=0;
	GunPlayer[playerid][2][0]=0;
	GunPlayer[playerid][3][0]=0;
	GunPlayer[playerid][4][0]=0;
	GunPlayer[playerid][5][0]=0;
	GunPlayer[playerid][6][0]=0;
	GunPlayer[playerid][7][0]=0;
	GunPlayer[playerid][8][0]=0;
	GunPlayer[playerid][9][0]=0;
	GunPlayer[playerid][10][0]=0;
	GunPlayer[playerid][11][0]=0;
	GunPlayer[playerid][12][0]=0;
	GunPlayer[playerid][0][1]=0;
	GunPlayer[playerid][1][1]=0;
	GunPlayer[playerid][2][1]=0;
	GunPlayer[playerid][3][1]=0;
	GunPlayer[playerid][4][1]=0;
	GunPlayer[playerid][5][1]=0;
	GunPlayer[playerid][6][1]=0;
	GunPlayer[playerid][7][1]=0;
	GunPlayer[playerid][8][1]=0;
	GunPlayer[playerid][9][1]=0;
	GunPlayer[playerid][10][1]=0;
	GunPlayer[playerid][11][1]=0;
	GunPlayer[playerid][12][1]=0;
	ResetPlayerWeapons(playerid);
	AC_GunCheattime[playerid]=3+floatround(GetPlayerPing(playerid)/100);
	return 1;
}

public AC_SetPlayerHealth(playerid,Float:health)
{
	if(AC_Healthtime[playerid]>gettime())return 1;
    //if(!PlayerConnect{playerid}) return 1;
	if(health<0.0)
	{
	    health=0.0;
	}
	if(health>200.0)
	{
	    health = 200.0;
	}
    PlayerHP[playerid] = health;
    SetPlayerHealth(playerid,health);
    AC_Healthtime[playerid]=gettime()+3+floatround(GetPlayerPing(playerid)/100);
    return true;
}

public AC_SetPlayerArmour(playerid,Float:armour)
{
    //if(!PlayerConnect{playerid}) return 1;
    PlayerAP[playerid]=armour;
    SetPlayerArmour(playerid,armour);
    AC_Armourtime[playerid]=gettime()+3+floatround(GetPlayerPing(playerid)/100);
    return true;
}

public AC_AddVehicleComponent(vehicleid, componentid)
{
	AddVehicleComponent(vehicleid, componentid);
	return 1;
}

public AC_RemoveVehicleComponent(vehicleid,componentid)
{
	RemoveVehicleComponent(vehicleid, componentid);
	return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
    //if(!PlayerConnect{playerid}) return 1;
    new Float:Count[2];
    Count[0] = Difference(new_x,VehPos[vehicleid][0]);
    Count[1] = Difference(new_y,VehPos[vehicleid][1]);
	if (passenger_seat!=0)
	{
		new Float:spz;
		spz=floatsqroot(floatpower(floatabs(vel_x),2.0)+floatpower(floatabs(vel_y),2.0))*30.3;
		if (spz>15)
		{
			if (floatround(spz)-Carsspeed[playerid]>=5 || spz>70)
			{
			    SCarstime[playerid]=SCarstime[playerid]+2;
				if (SCarstime[playerid]==6)
				{
					CallRemoteFunction("OnPlayerCheat","ii",playerid,40);
					PlayerConnect{playerid}=0;
					return 1;
				}
				else if (floatround(spz)-Carsspeed[playerid]>=15 && SCarstime[playerid]>3)
				{
					CallRemoteFunction("OnPlayerCheat","ii",playerid,41);
					PlayerConnect{playerid}=0;
					return 1;
				}
			}
			else if (SCarstime[playerid]>=1)
			{
				SCarstime[playerid]--;
			}
		}
		else if (SCarstime[playerid]>=1)
		{
			SCarstime[playerid]--;
		}
		Carsspeed[playerid]=floatround(spz);
	}
	if (Count[0]>10000 || Count[1]>10000) return 0;
    switch(GetVehicleModel(vehicleid))
	{
		case 435, 450, 584, 591, 606..608, 610..611:
		{
			UpdateVehiclePos(vehicleid, 0);
			return 1;
		}
	}
    if((Count[0] > 10 || Count[1] > 10) && !UseCar(vehicleid) && !BanCar{vehicleid})
	{
        if((Count[0] > 25 || Count[1] > 25) && IsPlayerInAnyVehicle(playerid))
		{
			AC_VehicleTeleportToMe[playerid]++;
			return 0;
		}
		else
		{
			AC_VehicleTeleportToMe[playerid]++;
			return 0;
		}
    }
    UpdateVehiclePos(vehicleid, 0);
    VehPos[vehicleid][0]=new_x;
    VehPos[vehicleid][1]=new_y;
    VehPos[vehicleid][2]=new_z;
    return 1;
}


public UpdateVehiclePos(vehicleid, type)
{
    if (type == 1) BanCar{vehicleid} = 0;
    GetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
    GetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
    return 1;
}

public AC_SetVehicleHealth(vehicleid,Float:health)
{
	VehHealth[vehicleid]=health;
	VehTime[vehicleid]=5;
	SetVehicleHealth(vehicleid,health);
	return 1;
}

public AC_RepairVehicle(vehicleid)
{
	VehHealth[vehicleid]=1000;
	VehTime[vehicleid]=5;
	RepairVehicle(vehicleid);
	return 1;
}

public AC_CreateVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay)
{
	new vehicleid=CreateVehicle(vehicletype,x,y,z,rotation,color1,color2,respawn_delay);
	VehPos[vehicleid][0]=x;
	VehPos[vehicleid][1]=y;
	VehPos[vehicleid][2]=z;
	VehPos[vehicleid][2]=rotation;
	VehHealth[vehicleid]=1000;
	VehTime[vehicleid]=5;
	return vehicleid;
}

public AC_AddStaticVehicle(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2)
{
	new vehicleid = AddStaticVehicle(vehicletype,x,y,z,rotation,color1,color2);
	VehPos[vehicleid][0]=x;
	VehPos[vehicleid][1]=y;
	VehPos[vehicleid][2]=z;
	VehPos[vehicleid][2]=rotation;
	VehHealth[vehicleid]=1000;
	VehTime[vehicleid]=5;
	return vehicleid;
}

public AC_AddStaticVehicleEx(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2,rd)
{
	new vehicleid=AddStaticVehicleEx(vehicletype,x,y,z,rotation,color1,color2,rd);
	VehPos[vehicleid][0]=x;
	VehPos[vehicleid][1]=y;
	VehPos[vehicleid][2]=z;
	VehPos[vehicleid][2]=rotation;
	VehHealth[vehicleid]=1000;
	VehTime[vehicleid]=5;
	return vehicleid;
}
public OnVehicleSpawn(vehicleid)
{
    UpdateVehiclePos(vehicleid,0);
	VehHealth[vehicleid]=1000;
	return 1;
}
public OnVehicleStreamIn(vehicleid, forplayerid)
{
    UpdateVehiclePos(vehicleid, 0);
    return 1;
}

public AC_SetVehiclePos(vehicleid,Float:x,Float:y,Float:z)
{
	foreach(new playerid:Player)
 	{
  		if (!PlayerConnect{playerid})continue;
        if (GetPlayerVehicleID(playerid)!=vehicleid && GetPlayerSurfingVehicleID(playerid)!=vehicleid) continue;
        AC_spppos[playerid]=3+floatround(GetPlayerPing(playerid)/100);
        GetPlayerPos(playerid,OldPos[playerid][0],OldPos[playerid][1],OldPos[playerid][2]);
	    PVHFL[playerid][0]=x;
	    PVHFL[playerid][1]=y;
	    PVHFL[playerid][2]=z;
	    break;
    }
	SetVehiclePos(vehicleid,x,y,z);
	VehPos[vehicleid][0]=x;
	VehPos[vehicleid][1]=y;
	VehPos[vehicleid][2]=z;
	return 1;
}

public AC_SetVehicleZAngle(vehicleid,Float:angle)
{
	VehPos[vehicleid][3]=angle;
	SetVehicleZAngle(vehicleid,angle);
	return 1;
}

public AC_PlayerSpectateVehicle(playerid,targetplayerid,mode)
{
	SetPVarInt(playerid,"AC_Spectate",3+floatround(GetPlayerPing(playerid)/100));
	PlayerSpectate{playerid}=1;
	PlayerSpectateVehicle(playerid,targetplayerid,mode);
	return 1;
}

public AC_PlayerSpectatePlayer(playerid,targetplayerid,mode)
{
    SetPVarInt(playerid,"AC_Spectate",3+floatround(GetPlayerPing(playerid)/100));
	PlayerSpectate{playerid}=1;
	PlayerSpectatePlayer(playerid,targetplayerid,mode);
	return 1;
}

public AC_RemovePlayerFromVehicle(playerid)
{
    RemovePlayerFromVehicle(playerid);
    removetimer[playerid]=15;
    RemovePlayerFromVehicle(playerid);
    return 1;
}

public AC_TogglePlayerControllable(playerid,toggle)
{
	if (toggle>1)
	{
		toggle=1;
	}
	if (toggle<0)
	{
		toggle=0;
	}
    AC_PlayerToggle[playerid]=toggle;
    SetPVarInt(playerid,"AC_PlayerToggleTime",gettime()+3+floatround(GetPlayerPing(playerid)/100));
    //AC_PlayerToggleTime[playerid]=3+floatround(GetPlayerPing(playerid)/100);
    TogglePlayerControllable(playerid,toggle);
    return 1;
}



public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    //if(!PlayerConnect{playerid}) return 1;
	if (source)
	{
		CallRemoteFunction("OnPlayerCheat","ii",playerid,42);
		PlayerConnect{playerid}=0;
		return 1;
	}
	return 1;
}
public OnPlayerExitedMenu(playerid)
{
    //if(!PlayerConnect{playerid}) return 1;
	if (GetPlayerMenu(playerid)==Menu:255)
	{
		CallRemoteFunction("OnPlayerCheat","ii",playerid,43);
		PlayerConnect{playerid}=0;
		return 1;
	}
	return 1;
}


public AC_SetPlayerSpecialAction(playerid,actionid)
{
    //if(!PlayerConnect{playerid}) return 1;
	//AC_PlayerSpAct{playerid}=actionid;
	//SpecialActtime[playerid]=3+floatround(GetPlayerPing(playerid)/100);
    SetPlayerSpecialAction(playerid,actionid);
    return 1;
}
public AC_AddStaticPickup(model,type,Float:X,Float:Y,Float:Z,Virtualworld)
{
	return AddStaticPickup(model,type,X,Y,Z,Virtualworld);
}
public AC_CreatePickup(model,type,Float:X,Float:Y,Float:Z,Virtualworld)
{
	return CreatePickup(model,type,X,Y,Z,Virtualworld);
}
public AC_DestroyPickup(pickupid)
{
	return DestroyPickup(pickupid);
}
public AC_EditObject(playerid,objectid)
{
	return EditObject(playerid,objectid);
}
public AC_EditPlayerObject(playerid,objectid)
{
	return EditPlayerObject(playerid,objectid);
}
public AC_SetPlayerInterior(playerid,interiorid)
{
	return SetPlayerInterior(playerid,interiorid);
}
public AC_SetPlayerVirtualWorld(playerid,worldid)
{
	//PlayerVirtualWorld[playerid][0]=worldid;
    //PlayerVirtualWorld[playerid][1]=3+floatround(GetPlayerPing(playerid)/100);
	return SetPlayerVirtualWorld(playerid,worldid);
}
public AC_ShowPlayerDialog(playerid,dialogid,style,caption[],info[],button1[],button2[])
{
	return ShowPlayerDialog(playerid,dialogid,style,caption,info,button1,button2);
}
public AC_SetVehicleVelocity(vehicleid,Float:x,Float:y,Float:z)
{
	return SetVehicleVelocity(vehicleid,x,y,z);
}
public AC_SetPlayerVelocity(playerid,Float:x,Float:y,Float:z)
{
	return SetPlayerVelocity(playerid,x,y,z);
}
public AC_SetPlayerFacingAngle(playerid,Float:ang)
{
	return SetPlayerFacingAngle(playerid,ang);
}
public AC_SetPlayerDrunkLevel(playerid,level)
{
	return SetPlayerDrunkLevel(playerid,level);
}
public AC_SetPlayerWorldBounds(playerid,Float:x_max,Float:x_min,Float:y_max,Float:y_min)
{
	return SetPlayerWorldBounds(playerid,x_max,x_min,y_max,y_min);
}
public AC_SetPlayerAmmo(playerid,weaponslot,ammo)
{
	return SetPlayerAmmo(playerid,weaponslot,ammo);
}
public AC_SetPlayerArmedWeapon(playerid,weaponid)
{
	return SetPlayerArmedWeapon(playerid,weaponid);
}
public AC_SetPlayerWantedLevel(playerid,level)
{
	return SetPlayerWantedLevel(playerid,level);
}
public AC_TogglePlayerSpectating(playerid,toggle)
{
	if (toggle)
	{
	    SetPVarInt(playerid,"AC_Spectate",3+floatround(GetPlayerPing(playerid)/100));
		PlayerSpectate{playerid}=1;
	}
	return TogglePlayerSpectating(playerid,toggle);
}
