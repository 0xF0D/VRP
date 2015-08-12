#define NameMode                             "TPPI"
#define ServerName							 "TPPI"
#define PROTECT_CODE                         9851

#define START_MONEY                          50000000
#define START_DONATE                         10000
#define START_NEWVALUTA                      10
#define START_LEVEL                          9

#define FD1									 "Monkey_D_Luffy"
#define FD2                         		 "NickName"
#define FD3                         		 "NickName"
#define FD4                         		 "NickName"

#define MSG_NORPLAYER(%0)					 SCM(%0, COLOR_GREY, "Ошибка: Человек не рядом с вами!")
#define MSG_NOADMIN(%0)						 SCM(%0, COLOR_GREY, "Ошибка: Вы не администратор!")
#define MSG_NOPRAVA(%0)						 SCM(%0, COLOR_GREY, "Ошибка: Вы не уполномочены использовать эту команду!")
#define MSG_BANCHATON(%0)					 SCM(%0, COLOR_GREY, "Ошибка: У Вас бан чата!")
#define MSG_BANCHAT(%0)						 SCM(%0, COLOR_REDD, "[Security] Вы получили бан чата за попытку рекламы!")

native PrintAmxBacktrace();
native PrintNativeBacktrace();

native GetAmxBacktrace(string[], size = sizeof(string));
native GetNativeBacktrace(string[], size = sizeof(string));

#define MAX_HOUSE                            1266
#define TIME_PAINTBALL           			 600
#define REGISTER_PAINTBALL  				 300
#define CHECKPOINT_HOME 					 12
#define VEHICLE_PARAMS_OFF				     0
#define VEHICLE_PARAMS_ON					 1
#define CHECKPOINT_NONE						 0
#define DIALOG_STYLE_MSGBOX					 0
#define DIALOG_STYLE_INPUT					 1
#define DIALOG_STYLE_LIST					 2
#define DIALOG_STYLE_PASSWORD				 3
#define NUMBER_OF_ARMYTRUCKS				 3
#define ADMIN_SPEC_TYPE_NONE				 0
#define FILTERSCRIPT
#define OBJECT_FILE_NAME                     "FurnObjects.txt"

#define COLOR_FADE1                          0xE6E6E6E6
#define COLOR_FADE2                          0xC8C8C8C8
#define COLOR_FADE3                          0xAAAAAAAA
#define COLOR_FADE4                          0x8C8C8C8C
#define COLOR_FADE5                          0x6E6E6E6E
#define COLOR_FADE                           0xC8C8C8C8

#define COLOR_WHITE                          0xFFFFFFAA
#define COLOR_GRAD2                          0xBFC0C2FF
#define COLOR_DARKRED                        0x8B0000AA
#define COLOR_LIGHTBLUE                      0x33CCFFAA
#define COLOR_GREY                           0xAFAFAFAA
#define COLOR_PINK                           0xDC00DDAA
#define COLOR_CYAN                           0xFF8080AA
#define COLOR_WHITE	                         0xFFFFFFAA
#define COLOR_DARKBLUE                       0x0000A0AA
#define COLOR_BLACK	                         0x000000AA
#define COLOR_DARKGOLD                       0x808000AA
#define COLOR_PURPLE                         0xC2A2DAAA
#define COLOR_BROWN                          0x804000AA
#define COLOR_BLACK2                         0x000000ff
#define COLOR_GRAD2                          0xBFC0C2FF
#define COLOR_GRAD1                          0xB4B5B7FF

#if defined                                  CRASHDETECT_INC
#endinput
#endif
#define                                      CRASHDETECT_INC

#undef MAX_VEHICLES
#define MAX_VEHICLES                         1000
#undef MAX_PLAYERS
#define MAX_PLAYERS                          200
#define MAX_HOSPITAL                        (120)
#define MAX_SQL                              256
#define MAX_STR                              144
#define MAX_IP_ADRESS_CONNECT                2

#define dBusiness                            9924
#define dBusinessBank                        9925
#define dBusinessPut                         9927
#define dBusinessGet                         9928

#define FRACTION_COUNT                       10
#define SCM                                  SendClientMessage
#define foreach(%0)                          for(new _i, %0=Players[_i]; _i <players; %0=Players[++_i])
#define SCMF(%0,%1,%2,%3)                    format(format_string, 144, %2,%3) && SCM(%0, %1, format_string)
#define c:%0;                                CMD:%0(playerid,params[])
#define COM:%0;                                CMD:%0(playerid)
#define BYTES_PER_CELL                       4
#define PRESSED(%0)                          (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0)                         (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define IsKicked(%0)                         GetPVarInt(%0, "kicked")

#define publics:%0(%1)                       forward %0(%1); public %0(%1)
#if defined ShowPlayerDialog                 SPD
#endif

#define dSellCar                             4938
#define SMALL_SIZE                           64
#define BIG_SIZE                             512
#define ADM_SIZE                             2046
#define KEY_AIM                              128
publics: Antidm(playerid)                    TogglePlayerControllable(playerid, 1);
#define Antidm(%0)                           SetTimerEx( "Antidm" , 5000 , false , "i" , %0 )

const Float:Radius = 1.7;
const Float:Height = 1.15;

new
	vertmatbi = 0,armmatbi = 0,armmatsf = 0,lspdmatbi = 50000,sfpdmats = 50000,lvpdmats = 50000,fbimats = 50000,yakuzamats = 50000,rmmats = 50000,lcnmats = 50000,rifamatbi = 100000,ballasmatbi = 100000,groovmatbi = 100000,vagosmatbi = 100000,aztekmatbi = 100000,noooc = 1,ghour = 0,gminute = 0,gsecond = 0,
	 ChangeSkinv[MAX_PLAYERS],IDVEH[MAX_PLAYERS],AntiBan[MAX_PLAYERS],gov[MAX_PLAYERS],RegEx:reklamka,ammomer,Cheater[MAX_PLAYERS],objectplayerid,WaitCheat,PlayerInCar[MAX_VEHICLES],gatevorota,ads[MAX_PLAYERS],AlhambraDJID = INVALID_PLAYER_ID,JobsDJ[2],BlockPost[128],block = 0,RB[MAX_PLAYERS] = 255,
	  rbtime[MAX_PLAYERS],Float:GMHP[MAX_PLAYERS][2],Float:VEHHP[MAX_PLAYERS][2],Float:GMARMOUR[MAX_PLAYERS][1],BizWarTime = 0,BizHourTime,parashut,SpawnedCar = 0,summatr[MAX_PLAYERS],idtr[MAX_PLAYERS],paintulicpic,paintulicpic1,paintvnutrpic,paintvnutrpic1,connects,derby[11],helpershouse[MAX_PLAYERS],
	   sellzone[MAX_PLAYERS],Float:PlayerHealth[MAX_PLAYERS],Flood[MAX_PLAYERS],ProposeOffer[MAX_PLAYERS],chekmatlva[10],restoran[2],chekmats[3],TicketOffer[MAX_PLAYERS],TicketMoney[MAX_PLAYERS],udar[MAX_PLAYERS],PlayerDrunk[MAX_PLAYERS],Shot[MAX_PLAYERS],PicCP[MAX_PLAYERS],Text3D:kaznameria,kazna = 0,
	    nalog = 0,Text3D:Block3D[128],createdvehicles[MAX_VEHICLES],createdvehs,caridhouse[MAX_PLAYERS],fuckshoter[MAX_PLAYERS][3],JobCarTime[MAX_PLAYERS],sellgun,sellgun1,sellgun2,sellgun3,sellgun4,PEfir[MAX_PLAYERS],Pefir[MAX_PLAYERS],Float:Fuell[MAX_VEHICLES],Refueling[MAX_PLAYERS],OldFuel[MAX_PLAYERS],
	     PlayerSpectateID[MAX_PLAYERS],PlayerSpec[MAX_PLAYERS],alkogol[MAX_VEHICLES],SwatDoor[MAX_PLAYERS],HealOffer[MAX_PLAYERS],HealPrice[MAX_PLAYERS],InviteOffer[MAX_PLAYERS],FreeOffer[MAX_PLAYERS],SposobOffer[MAX_PLAYERS],FreePrice[MAX_PLAYERS],vehcreat[MAX_VEHICLES],antiwarn[MAX_PLAYERS],minigun[MAX_PLAYERS],
	      connecttime[MAX_PLAYERS],adgo[MAX_PLAYERS],adgov = 0,adgo1[MAX_PLAYERS],carColor1[MAX_PLAYERS],carColor2[MAX_PLAYERS],crashcuff[MAX_PLAYERS],jackcar[MAX_PLAYERS],minstr,ministrcar[5],fight,ring = 0,zakonn = 0,poxititel[MAX_PLAYERS],poxiwenbIu[MAX_PLAYERS],fightid[MAX_PLAYERS],TimeBox[MAX_PLAYERS],TimeBoxAll[MAX_PLAYERS],
	       Float: MGM[5] = 100.0,UMusic[128],Float: MusicU[5] = 100.0,housebuy = 0,fuelbuy = 0,healpric = 100,smspricels = 50,smsls = 0,Text3D:Meh3d[MAX_VEHICLES],keys[MAX_PLAYERS],DrugOffer[MAX_PLAYERS],DrugPrice[MAX_PLAYERS],DrugGram[MAX_PLAYERS],HotdogOffer[MAX_PLAYERS],ZoneOffer[MAX_PLAYERS],ZonePrice[MAX_PLAYERS],
	        HotdogPrice[MAX_PLAYERS],Menu:ChoseSkin,ChosenPlayer[MAX_PLAYERS],IsLocked[MAX_VEHICLES],usemats[MAX_PLAYERS],OldSkin[MAX_PLAYERS],Float: Armour[MAX_PLAYERS],forma[MAX_PLAYERS],proverkaforma[MAX_PLAYERS],unban[MAX_PLAYERS],Army,PlayerAdminMP,Tazer[MAX_PLAYERS],TazerTime[MAX_PLAYERS],TranPlayer[MAX_PLAYERS],
	         MarryWitness[MAX_PLAYERS],MarryWitnessOffer[MAX_PLAYERS],PlayerStoned[MAX_PLAYERS],Medics = 0,Mechanics = 0,Police = 0,MechanicCall = INVALID_PLAYER_ID,PoliceCall = INVALID_PLAYER_ID,MedicCall = INVALID_PLAYER_ID,PlayerTied[MAX_PLAYERS],LiveOffer[MAX_PLAYERS],LiveOfferls[MAX_PLAYERS],TalkingLive[MAX_PLAYERS],
	          TalkingLivels[MAX_PLAYERS],SelectChar[MAX_PLAYERS],SelectCharID[MAX_PLAYERS],SelectCharPlace[MAX_PLAYERS],CharPrice[MAX_PLAYERS],ChosenSkin[MAX_PLAYERS],InviteSkin[MAX_PLAYERS],CP[MAX_PLAYERS],RepairOffer[MAX_PLAYERS],RepairPrice[MAX_PLAYERS],RefillOffer[MAX_PLAYERS],RefillPrice[MAX_PLAYERS],RepairCar[MAX_PLAYERS],
	           CarOffer[MAX_PLAYERS],CarPrice[MAX_PLAYERS],WantedPoints[MAX_PLAYERS],WantedLevel[MAX_PLAYERS],gPlayerCheckpointStatus[MAX_PLAYERS],PlayerCuffed[MAX_PLAYERS],PlayerCuffedTime[MAX_PLAYERS],benzovoz[2],comptruck[2],matsfuravagos[1],matsfuragrove[1], matsfuraactek[1],matsfurarifa[1],matsfuraballas[1],lsnewscar[2],lvpdcar[2],
                swatcar[2],liccar[2],hotdogcar[2], mehanik[2],rentcarsf[2],medicsls[2],sapdpatrul[2], sapdcar[2], fbicar[2],sfpdcar[2],mavlic,armycar[2],vmfcar[2], yakcar[2],ruscar[2],govcar[2], lcncar[2], armcar[2], matscar[2], grovecar[2], ballascar[2], coronoscar[2], vagoscar[2],rifacar[2],bakers[2],hitcar[2],streetcar[2],victim2[2],
	             sportzal[2],ammonac[6],lspic[3],medpic[3],rmpic[2],narkoenter,narkoexit,lcnpic[2],yakexit[2],pdd,buygunzakon[6],fbi,fbi1,lspd[6],sf[5],lvpdpic[7],autoschool1,ash,avtosh[2],marenter[3],bankpic[3],serdce[4],ballasvhod[2],rifa[2],mo[2],vagospic[2],aztecpic[2],grooveexit,swatenter,swatenter2,swatexit,swatexit2,grooveenter,
	              skinshop[2],gunarm[3],zip[2],plen[2],zona,zonaa,sklad[2],PlayerText:FuelShow[MAX_PLAYERS],PlayerText:SpeedShow[MAX_PLAYERS],PlayerText:HealthShow[MAX_PLAYERS],PlayerText:EngineShow[MAX_PLAYERS],PlayerText:LockShow[MAX_PLAYERS],Text:Fuel,Text:VehBox,Text:Speed,Text:Heal,PlayerText:ModelCarTD[MAX_PLAYERS],
	               PlayerText:ModelCar[MAX_PLAYERS],Text:Engines,realtime = 1,wtime = 15,timeshift = 0,shifthour,levelexp = 4,alkofuravagos[1],alkofuragrove[1], alkofuraactek[1],alkofurarifa[1],alkofuraballas[1],Mobile[MAX_PLAYERS],Tel[MAX_PLAYERS],gCarLock[MAX_VEHICLES],MatsArmyCar[MAX_PLAYERS],VertMats[MAX_PLAYERS],
	                Float:TeleportDest[MAX_PLAYERS][3],STimer[MAX_PLAYERS],PlayerText:ShopText[MAX_PLAYERS],PlayerText:ReconPlayerText[MAX_PLAYERS][2],PlayerText:Bizwar[MAX_PLAYERS][3],PlayerText:Capture[MAX_PLAYERS][6],GoCapt[MAX_PLAYERS],ZonsWar[3],CountOnZone[20],FrakCD[20],FracVoina[20],WantNickChange[MAX_PLAYERS],prabota,addd,
	                 red[MAX_PLAYERS],smg[MAX_PLAYERS],carColor[MAX_PLAYERS],ChangeFirstSkin[MAX_PLAYERS],Menu:BuyClothes,telefons,vmfgate,vmfgate2,lspdgate,sfpdgate,sfpdgate3,lvpdgate,lvpdgate3,autogate,fbigate,MSH1[MAX_PLAYERS],MSH2[MAX_PLAYERS],vmfgate3[MAX_PLAYERS],vmfgate1[MAX_PLAYERS],fbigate2[MAX_PLAYERS],lspdgate2[MAX_PLAYERS],
	                  sfpdgate2[MAX_PLAYERS],sfpdgate4[MAX_PLAYERS],lvpdgate2[MAX_PLAYERS],lvpdgate4[MAX_PLAYERS],autogate2[MAX_PLAYERS],pokupkas,ANTI_FLOOD_PICKUP[MAX_PLAYERS],mask[MAX_PLAYERS],merias[2],autoshoppick[4],spawneda,buydom,mashina[MAX_PLAYERS],timerP[MAX_PLAYERS],ProsInfo[MAX_PLAYERS][MAX_VEHICLES],balonCraska[MAX_PLAYERS] = 3,
                       master[2],kazarma[6],VladGzone[5],Text3D: BandText[6],medshlag[2],strpaintball[1000],StartPaintBall,TimerPaintBall,TeamPain[MAX_PLAYERS],KillPain[MAX_PLAYERS],DeathPain[MAX_PLAYERS],RedPlayer,BluePlayer,RedScore,BlueScore,paintball,tpadmin[MAX_PLAYERS],gatelva1,Enter,Enter1,gatesfa,gatelva,gatetimersfa,gatetimerlva,
	                    gatetimerlva1,ORC[MAX_PLAYERS char],BizEnter[MAX_PLAYERS],sellerbiz[MAX_PLAYERS],bizcost[MAX_PLAYERS],forwho[MAX_PLAYERS],mytimer[MAX_PLAYERS],spawncarss,Text:TDSEL[6],Float:Degree[MAX_PLAYERS],Float:lX[MAX_PLAYERS],Float:lY[MAX_PLAYERS],Float:lZ[MAX_PLAYERS],buynewvaluta[MAX_PLAYERS],format_string[144],groves = 0, vagoss = 0, ballass = 0, rifas = 0, aztecas = 0;

new
	bool:EngineState[MAX_PLAYERS],
	 bool:lNews[MAX_PLAYERS],
	  bool:BigEar[MAX_PLAYERS],
	   bool:BigEarSms[MAX_PLAYERS],
	    bool:CellTime[MAX_PLAYERS],
	     bool:PhoneOnline[MAX_PLAYERS],
          bool:UseEnter[MAX_PLAYERS],
	       bool:Music[MAX_PLAYERS],
	        bool:Music2,URLW[128],
	         bool:AlhambraDJ = true,
	          bool:anti[MAX_PLAYERS],
	           bool:TakingLesson[MAX_PLAYERS],
	            bool:boy[MAX_PLAYERS],
	             bool:gcontract[MAX_PLAYERS],
	              bool:times[MAX_PLAYERS],
	               bool:myti[MAX_PLAYERS],
	                bool:clicked[MAX_PLAYERS];
stock bool:AntiFakeKill[MAX_PLAYERS];//

Float:S_GetPlayerDistanceFromPoint(playerid, Float:x, Float:y, Float:z) {
	new NaN_String[5], Float:Distance = GetPlayerDistanceFromPoint(playerid, x, y, z);
	format(NaN_String, 5, "%f", Distance); if(!strcmp(NaN_String, "NaN")) return 3000.0; return Distance;
}
#define GetPlayerDistanceFromPoint S_GetPlayerDistanceFromPoint

stock AC_Spect [ MAX_PLAYERS char];
stock AC_Spect_TogglePlayerSpectating ( playerid , spec) { AC_Spect{playerid} = spec; TogglePlayerSpectating(playerid, spec); return true; }

new scolor1[MAX_PLAYERS];

new dicetime, casino[2];

new semia, player_family [ MAX_PLAYERS ];

enum _fam_enum_
{
	f_id,
	 f_name [ 32 ],
	  f_chat_color,
	   f_creator [ MAX_PLAYER_NAME ],
	    f_creating_data [ 32 ],
	     f_members_amount,
	      f_nationality,
	       f_online,
}
new family_info [ 1000 ] [ _fam_enum_ ];

new family_count = 0;

enum
{
	dFamilyCreate,
	 dFamilyMenu,
	  dFamilyInfo,
	   dFamilyOffMembers,
	    dFamilyOnline,
	     dFamilyChatColor,
	      dFamilyNationality,
	       dFamilyInvite,
}

new family_chat_color[ 5 ] [ 12 ] = { "FFFFFF","FFD39B","FFFF00","54FF9F","98F5FF" };

#define MAX_SALUTE 50
#define SalutTime floatround((400 + random(300)) * 0.26)
new SaluteColorTypes[] = {19122,19123,19124,19125,19126,19127};
enum Salutes
{
Float:height,
Float:SaluteLeanDir,
	SaluteStatus,
	SaluteExplType,
	SaluteObject,
Float:SaluteExplSize,
Float:SaluteClimeSpeed,
Float:SaluteWindOffset,
bool:SaluteInUse
}
new Salut[MAX_OBJECTS][Salutes];
enum Saluts
{
	Salute,
	SaluteTimer,
	SaluteBox,
bool:SaluteUse,
Float:SalutePos[3]
};
new SalutInfo[MAX_SALUTE][Saluts];

new
	Float:PX1,
	 Float:PY1,
	  Float:PZ1,
	   Float:PANGLE1,
	    kicks[MAX_PLAYERS],
	     bans[MAX_PLAYERS],
	      warns[MAX_PLAYERS],
	       pms[MAX_PLAYERS],
	        jails[MAX_PLAYERS]
;

enum VIP_DATA
{
	adSender[24],
	 adText[100],
      adID,
	   adTime,
	    adNumber
}
new gVip[MAX_PLAYERS][VIP_DATA];
new gVipTime;

enum PTEMP
{
	pSpawn,
	 pAFK
}
new pTemp[MAX_PLAYERS][PTEMP];

new Text: 	PaintDraws[5];
new Text:   ANIMATION[3];

new g_MysqlRaceCheck[MAX_PLAYERS];

new MaxSpeedCar[212] = {
	87,81,103,-1,73,91,-1,-1,-1,-1,-1,123,93,-1,-1,106,-1,-1,64,82,93,82,82,-1,75,-1,94,-1,
	 -1,112,-1,-1,-1,-1,92,-1,85,-1,-1,93,-1,-1,-1,-1,62,90,-1,-1,-1,-1,-1,107,-1,-1,-1,-1,-1,-1,87,-1,-1,88 ,-1,79 ,-1,-1,
	  87,87,79,-1,-1,61,-1,-1,82,96,-1,103,75,77,102,-1,-1,-1,-1,-1,-1,-1,-1,77,-1,82,78,-1,119,97,90,-1,-1,-1,-1,-1,119,119,-1,-1,99,92,-1,-1,-1,-1,
	   -1,-1,-1,-1,87,87,91,-1,-1,88,95,-1,-1,-1,-1,87,82,-1,82,-1,-1,-1,90,93,87,96,-1,-1,-1,82,112,91,73,-1,81,82,79,-1,85,80,87,-1,-1,84,87,-1,-1,86,98,94,
	    85,98,-1,-1,91,88,96,-1,-1,-1,-1,-1,-1,-1,87,87,-1,-1,87,85,88,-1,-1,-1,87,87,91,-1,90,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,82,-1,93,95,87,73,-1 };

new SkinMen[62][2] = { {66,1000}, {15,1000},{36,1000},{50,1000},{95,1000},{96,1000},{136,1000},{143,1000},{155,1000},{2,50000},{14,50000},{24,50000},{58,100000},{262,100000},
	{241,100000},{242,100000},{7,300000},{23,300000},{33,300000},{60,500000},{67,500000},{73,500000},{184,500000},{21,700000},{22,700000},{30,700000},{183,700000},{255,700000},
	 {17,1000000},{45,1000000},{82,1000000},{83,1000000},{185,1000000},{290,1000000},{291,1000000},{28,1200000},{29,1200000},{247,1200000},{248,1200000},{254,1200000},{249,1200000},
	  {18,1500000},{19,1500000},{47,1500000},{48,1500000},{101,1500000},{299,1500000},{61,2000000},{121,2000000},{227,2000000},{228,2000000},{292,2000000},{293,2000000},{297,2000000},
	   {122,2500000},{117,3500000},{118,3500000},{296,4000000},{295,4500000},{46,5000000},{208,5000000},{294,5000000} };//Мужские скины

new SkinMale[14][2] = { {192,100000},{216,100000},{193,200000},{194,300000},{11,500000},{219,1000000}, {93,2000000},{211,2000000},{233,2000000},{148,3000000},{169,4000000},{141,5000000},{76,5000000},{150,5000000} };//Женские скины

new Float: SpawnRedTeam[6][3] = { {-970.9683,1061.3138,1345.0305},{-972.9144,1075.1373,1344.9995},{-973.2729,1068.3148,1345.0049},{-969.6520,1051.7035,1345.0487},{-969.9001,1089.8918,1345.0093},{-974.8804,1093.7441,1344.9773} };

new Float: SpawnBlueTeam[6][3] = { {-1132.6630,1045.7203,1345.7483},{-1133.1703,1036.0184,1345.7416},{-1135.8105,1029.1758,1345.7532},{-1132.2930,1024.9067,1345.7262},{-1134.7041,1057.7498,1345.7814},{-1136.4290,1066.7670,1345.7939} };

new	ShopCar[86][2] = {	{400,130000},{567,200000},{549,120000},{547,110000},{546,140000},{543,100000},{527,100000},{526,110000},{518,170000},
	{517,150000},{516,140000},{492,140000},{479,110000},{478,100000},{475,190000},{466,110000},{458,120000},{439,150000},{436,100000},{404,100000},
	 {419,800000},{586,800000},{581,1000000},{461,1000000},{418,700000},{603,750000},{589,770000},{580,1000000},{579,940000},{561,910000},{555,940000},
	  {554,840000},{534,760000},{533,920000},{505,880000},{491,800000},{489,880000},{445,810000},{421,830000},{401,340000},{600,420000},{585,360000},
	   {576,350000},{575,460000},{566,340000},{551,480000},{550,480000},{540,330000},{536,400000},{529,440000},{507,450000},{474,370000},{467,390000},
	    {426,420000},{422,310000},{412,390000},{405,400000},{477,220000},{471,2100000},{468,1900000},{463,2000000},{521,1900000},{602,2000000},{587,2100000},
	     {565,2100000},{562,2200000},{560,2250000},{559,2200000},{558,2100000},{545,1900000},{535,2000000},{480,2400000},{402,4800000},{503,6000000},{502,6000000},
	      {494,6000000},{495,5800000},{424,5000000},{434,4800000},{522,4600000},{541,6000000},{506,5100000},{451,6000000},{429,5400000},{415,5600000},{411,6000000}};

new VehicleNames[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
	 "Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection",
	  "Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
	   "Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder",
	    "Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
	     "Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR3 50","Walton","Regina",
	      "Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood",
	       "Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring A","Hotring B",
	        "Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain",
	         "Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	          "Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover",
	           "Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A",
	            "Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer",
	             "Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor",
	              "Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car","Police Car",
	               "Police Car","Police Ranger","Picador","S.W.A.T.","Alpha","Phoenix","Glendale","Sadler","L Trailer A","L Trailer B",
	                "Stair Trailer","Boxville","Farm Plow","U Trailer" };

new stringer1 [512], stringer [3000];
new Players[MAX_PLAYERS + 50], players = 0;

new Text:Logo[2];

new Text:ReconText[32], Text:SHOPAUTOTEXT[12];

enum pSpec
{
Float:Coords[3],
Float:sPx,
Float:sPy,
Float:sPz,
	sPint,
	sLocal,
	sVirtual,
	sCam
};
new Unspec[MAX_PLAYERS][pSpec];
static LagServer[MAX_PLAYERS];

enum cInfo
{
	cZakaz,
	cHitman
};
new ContractInfo[MAX_PLAYERS][cInfo];

enum SavePlayerPosEnum
{
Float:LastX,
Float:LastY,
Float:LastZ
}

#define SetPlayerSkin SetPlayerSkinEx
enum { CHECKPOINT_1,CHECKPOINT_2,CHECKPOINT_3,CHECKPOINT_4,CHECKPOINT_5,CHECKPOINT_6,CHECKPOINT_7,CHECKPOINT_8,CHECKPOINT_9,CHECKPOINT_10,CHECKPOINT_11,CHECKPOINT_12,CHECKPOINT_13, CHECKPOINT_14,CHECKPOINT_15,CHECKPOINT_16,CHECKPOINT_17,CHECKPOINT_18,CHECKPOINT_19,CHECKPOINT_20, }
enum nInfo
{
	nLcn,
	 nYakuza,
	  nRm,
};
enum fInfo
{
	fLsnews,
	 fBallas,
	  fVagos,
	   fGrove,
	    fAztek,
	     fRifa,
	      fAmmo,
};
new MafiaBank[1][nInfo];
new FracBank[1][fInfo];

new PickupUp[MAX_PLAYERS] = {-1, ...};
enum p_Info
{
Float: PickX,
Float: PickY,
Float: PickZ,
};
new PickupInfo[MAX_PICKUPS][p_Info];

enum aInfo
{
	aAztec,
	 aGrove,
	  aBallas,
	   aRifa,
	    aVagos,
};
new FracAlko[1][aInfo];

#define MAX_BUSINESS 100

enum bInfo
{
	bID,
Float: EnterX,
Float: EnterY,
Float: EnterZ,
Float: ExitX,
Float: ExitY,
Float: ExitZ,
	bOwner[32],
	bPrice,
	bInt,
	bVW,
	bLock,
Text3D:bLabel,
	bMapIcon,
	bPickup,
	bName[32],
	bKrisha,
	bPribil,
Float: BarX,
Float: BarY,
Float: BarZ,
	bLab,
	bCena1,
	bCena2,
	bCena3,
	bCena4,
	bCena5,
	bCena6,
	bCena7,
	bCena8,
	bCena9,
	bVhod,
	bNalog,
	bBank
};
new BizInfo[MAX_BUSINESS][bInfo],BIZES;

enum sbInfo
{
	sID,
	sOwned,
	sOwner[32],
	sMessage[64],
Float:sEntranceX,
Float:sEntranceY,
Float:sEntranceZ,
	sBuyPrice,
	sLocked,
	sPrice,
	sBenz,
	sPriceBenz,
Text3D: sLabel,
	sIcon,
	sTill,
	sbMafia,
};
new SBizzInfo[30][sbInfo];

new Float:gInviteSpawns[0][4] = {
	{222.3489,-8.5845,1002.2109,266.7302}
};
new LessonCar[MAX_PLAYERS]; new LessonStat[MAX_PLAYERS]; new pLessonCar[MAX_PLAYERS];

enum exInfo
{
	ExitName[MAX_PLAYER_NAME],
	ExitTime,
};
new ExitInfo[MAX_PLAYERS][exInfo];

enum sInfo
{
	sID,
bool:sSer,
bool:sDialog,
	Schoice,
	SShout[4],
	SAFK[4],
Float:sPos[4],
	sVirt,
	sInt
}
new RINFO[MAX_PLAYERS][sInfo];

enum pInfo
{
	pID,
	pLevel,
	bAdmin,
	pNames[24],
	pIP[16],
	pMestoJail,
	pIpReg[16],
	pHousecash,
	pHeadValue,
	pContract,
	pDataReg,
	pCar,
	pCar2,
bool:kaptbanda,
bool:kaptmafia,
Float:pFuelcar,
	pNumbercar[25],
	pProz,
	pDRInections,
	pDRInectionsTime,
	pVipRespect,
	pDMInections,
	pNVInections,
	pReg,
	pMats,
	pSex,
	pMuted,
	pExp,
	pCash,
	pKills,
	pPayCheck,
	pJailed,
	pJailTime,
	pDrugs,
	pLRInections,
	pMRInections,
	pRKInections,
	pChar,
	pJob,
	pInt,
	pLocal,
	pModel,
	pPnumber,
	pHelper,
	pVodPrava,
	pFlyLic,
	pBoatLic,
	pFishLic,
	pGunLic,
	pBizLic,
	pPhousekey,
	pPbiskey,
	pPsbiskey,
	pZakonp,
	pSDPistol,
	pDesertEagle,
	pShotGun,
	pMP5,
	pAK47,
	pM4,
	pPayDayHad,
	pTut,
	pWarns,
	punWarns,
	punWarnstime,
	pFuel,
	pMarried,
	pMuteTime,
	pBank,
	pMobile,
	pDostup,
	pBoss,
	pWanted,
	pVipData,
	pVipTime,
	pHouse,
	pGunvmftime,
	pGunfbiTime,
	pGun51Time,
	pGunlspdTime,
	pGunaviaTime,
	pDrugtime,
	pRobTime,
	pExitTied,
	pExitTiedNomer,
	pGrabSkill,
	pGrabTime,
	pReportTime,
	pVerevka,
	pOtmbI4ka,
	pAutoTime,
	pAutoSkill,
	pBoxstyle,
	pKstyle,
	pKickstyle,
	pBoxSkill,
	pKongfuSkill,
	pKickboxSkill,
	pFightSkill,
	pFightSkil,
	pFightTime,
	pHospital,
	pVcol1,
	pVcol2,
	pKolesocar,
	pPokraska,
	pSpoiler,
	pHood,
	pExhaust,
	pLamps,
	pSideskirt,
	pVozdyx,
	pBamper1,
	pBamper2,
	pNitro,
	pGidra,
	pPhone[64],
	pPhonePlayer,
	pFacePass,
	pAvig,
	vig,
	pLogin,
	pSpawn,
	pAmmo[13],
	pGun[13],
	SalonCar,
	SalonTime,
Float:CarX,
Float:CarY,
Float:CarZ,
Float:CarC,
};
new PlayerInfo[MAX_PLAYERS][pInfo];

new TOTAL_HOSPITAL;
new HospTimer[MAX_PLAYERS];
new bool:HospTime[MAX_PLAYERS];
enum E_H_INFO
{
	hospID,
	hName[MAX_PLAYER_NAME + 1],
Float:hX,
Float:hY,
Float:hZ,
	hStatus,
Float:hAngle,
Text3D:hLabelHosp
};
new HospitalInfo[MAX_HOSPITAL][E_H_INFO];


enum hInfo
{
	hID,
Float:hEntrancex,
Float:hEntrancey,
Float:hEntrancez,
Float:hExitx,
Float:hExity,
Float:hExitz,
Float:hCarx,
Float:hCary,
Float:hCarz,
Float:hCarc,
	hOwner[24],
	hValue,
	hHel,
	hInt,
	hLock,
	hOwned,
	hTakings,
	hKlass,
	hVec,
	hVcol1,
	hVcol2,
	hPickup,
	hMIcon,
	hVehSost,
	hMats,
	hStyle,
	hSost,
	hKolesa,
	hBal1,
	hBal2,
	hBal3,
	hBal4,
	hBenz,
	hNarko,
	hSafe,
	hGun1,
	hGun2,
	hGun3,
	hGun4,
	hGun5,
	hGunAmmo1,
	hGunAmmo2,
	hGunAmmo3,
	hGunAmmo4,
	hGunAmmo5
};

new HouseInfo[MAX_HOUSE][hInfo];

enum pHaul
{
	pLoad,
};
enum pMater
{
	zLoad,
};
enum sHaul
{
	sLoad,
};
enum pMatss
{
	gBallas,
	 gVagos,
	  gGrove,
	   gAztek,
	    gRifa,
};

new Furi[1][pMatss];

enum pMat
{
	mCapasity,
	 mLoad,
};

new gMedicBill[MAX_PLAYERS];
new MatHaul[NUMBER_OF_ARMYTRUCKS][pMat];
new PlayerHaul[18][pHaul];
new Mater[6][pMater];
new PlayersHaul[10][sHaul];


new JoinPed[138][1] = {
	{181},
	{180},
	{254},
	{280},//LSPD1
	{281},//LSPD2
	{282},//LSPD3
	{283},//LSPD4
	{284},//LSPD5
	{285},//LSPD6
	{288},//LSPD7
	{76},//LSPD8
	{286},//FBI1
	{163},//FBI2
	{164},//FBI3
	{165},//FBI4
	{166},//FBI5
	{141},//FBI6
	{287},//armySF1
	{191},//armySF2
	{70},//Mediki1
	{274},//Mediki2
	{275},//Mediki3
	{276},//Mediki4
	{219},//Mediki5
	{223},//LCN1
	{124},//LCN2
	{113},//LCN3
	{214},//LCN4
	{120},//YAKUZA1
	{123},//YAKUZA3
	{169},//YAKUZA2
	{186},//YAKUZA4
	{57},//Meria1
	{150},//Meria2
	{98},//Meria3
	{187},//Meria4
	{147},//Meria5
	{280},//SFPD1
	{281},//SFPD2
	{282},//SFPD3
	{283},//SFPD4
	{284},//SFPD5
	{285},//SFPD6
	{288},//SFPD7
	{76},//SFPD8
	{250},//SF NEWS1
	{261},//SF NEWS2
	{211},//SF NEWS3
	{217},//SF NEWS4
	{171},//Kazino1
	{11},//Kazino2
	{59},//Instructors1
	{172},//Instructors2
	{189},//Instructors3
	{240},//Instructors4
	{280},//LVPD1
	{281},//LVPD2
	{282},//LVPD3
	{283},//LVPD4
	{284},//LVPD5
	{285},//LVPD6
	{288},//LVPD7
	{76},//LVPD8
	{112},//Russian mafia1
	{111},//Russian mafia2
	{125},//Russian mafia4
	{272},//Russian mafia3
	{214},//Russian mafia5
	{105},//GROOVE1
	{106},//GROOVE2
	{107},//GROOVE3
	{269},//GROOVE4
	{270},//GROOVE5
	{271},//GROOVE6
	{114},//Aztecas1
	{115},//Aztecas2
	{116},//Aztecas3
	{102},//BALLAS1
	{103},//BALLAS2
	{104},//BALLAS3
	{173},//RIFA2
	{174},//RIFA1
	{175},//RIFA3
	{108},//VAGOS1
	{109},//vagospic[1]
	{110},//VAGOS3
	{287},//Army LV1
	{191},//Army LV2
	{250},//San NEWS1
	{261},//San NEWS2
	{211},//San NEWS3
	{217},//San NEWS4
	{287},//=========Гермаия
	{287},
	{191},
	{287},
	{287},///===========Россия
	{191},
	{287},
	{200},//=========Бомжи мужики
	{230},
	{137},
	{78},
	{79},
	{78},
	{96},///===========Бомжи бабы
	{90},
	{55},
	{185},//хитманы
	{186},//хитманы
	{250},//хитманы
	{295},// Хитманы
	{294},//хитманы
	{60},//Street Racers
	{60},//Street Racers
	{47},//Street Racers
	{217},//Street Racers
	{67},//Street Racers
	{240},//Street Racers
	{170},//Street Racers
	{29},//Street Racers
	{98},//охранник казино ричь
	{195},//Женский скин Ballas
	{226},//Женский скин Rifa
	{190},//Женский скин Vagos
	{56},//Женский скин Gruv
	{41},//Женский скин Aztec
	{117},//Якудза
	{118},//Якудза
	{233},
	{55},// Женский скин Street
	{91},// Женский скин Street
	{216},// Женский скин Street
	{134},// Скин бомжа (М)
	{135},// Скин бомжа (М)
	{136},// Скин бомжа (М)
	{212},// Скин бомжа (М)
	{77}// Скин бомжа (Ж)
};
