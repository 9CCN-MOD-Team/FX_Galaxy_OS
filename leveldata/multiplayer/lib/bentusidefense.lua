
g_shiptype = {"fighter","corvette","frigate","capital",}
g_pressure = 
{
		fighter = 0,
		corvette = 0,
		frigate = 0,
		capital = 0,
}
g_favor = 
{
	{
		fighter = 0,
		corvette = 0,
		frigate = 0,
		capital = 0,
	},
	{
		fighter = 0,
		corvette = 0,
		frigate = 0,
		capital = 0,
	},
	{
		fighter = 0,
		corvette = 0,
		frigate = 0,
		capital = 0,
	},
	{
		fighter = 0,
		corvette = 0,
		frigate = 0,
		capital = 0,
	},
}
g_wave = 1
g_player = 0
g_playerkill = 0
g_playerrace = ""
g_enemyrace = ""
g_eventname = ""
g_eventindex = 0
g_wavecount = {0,0,0,0}
g_bounty = 0.65
g_difficulty = 1
g_pass8 = 0
--��������
g_maxwave = 12
--��һ����������ʱ��
g_WaveTime = 60
--������������
g_racetable = {7,1,2,3,4,5,6,8}
--��������ִ���
g_racename = {"BEN","HGN","VGR","KPR","TAI","KAD","TUR","KUS",}
--����������Ϣ
g_raceinfo = 
{
	BEN = 
	{
		startship = "",
	},
	HGN = 
	{
		name = LocaleText[5],
		--��ͬ���ּ��ƽ��ϵ���������Ϊ1 squadronս����/����ͧ/������/�������൱�ڶ���squadron��ս����
		balance = {1,1.5,2,8},
		--ÿ��������ǿ��
		attackwave = 
		{
			fighter =  {4, 7,10,12,14,16,18,20,22,24,26,28},
			corvette = {2, 4, 6, 8,10,12,14,16,18,20,22,24},
			frigate =  {2, 4, 6, 9,12,15,19,23,27,32,37,42},
			capital =  {0, 0, 0, 0, 1, 1, 2, 2, 3, 4, 5, 6},
			--ÿ���������ʵ��ʱ���ٵ���ֵ
			addition = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,},
		},
		--��ʼ����
		startship = "hgn_carrier",
		--��ʼ������Ҫ�������ϵͳ
		SubNeedCreate = {"hgn_c_production_fighter","hgn_c_production_corvette","hgn_c_production_frigate","Hgn_C_Module_Research","Hgn_C_Module_ResearchAdvanced",},
		--Ĭ�Ͻ����Ľ�����
		grantBI = {"hgn_multiguncorvette",},
		--Ĭ�Ͻ����ĿƼ���
		grantRI = {"Hgn_lbc_AFTech",},
		--Ĭ�Ͻ����Ľ�����
		restrictBI = {"Hgn_AssaultCorvette","Hgn_Shipyard_SPG","Hgn_ECMProbe","Hgn_ProximitySensor","Hgn_Scout","Hgn_MinelayerCorvette","Hgn_MinelayerCorvette","Hgn_Shipyard","Hgn_ResourceCollector","Hgn_ResourceController","Hgn_Probe","hgn_c_module_hyperspace","hgn_c_module_hyperspaceinhibitor","hgn_c_module_research","hgn_c_module_researchadvanced","hgn_c_module_firecontrol","Hgn_C_Sensors_DetectCloaked","hgn_attackdroidelite","Hgn_GunTurret","Hgn_IonTurret",},
		--Ĭ�Ͻ������о���
		restrictRI = {"ScoutPingAbility","SensDisProbe","ECMProbe","RepairAbility","hgn_PlatformWeaponUpgrade1","hgn_PlatformHealthUpgrade1",},
		--��λ����
		ships = 
		{
			--����ܹ�ָ�ӵĸ��ֽ�������������
			fighter = {"Hgn_Interceptor", "Hgn_AttackBomber",},
			corvette = {"Hgn_assaultcorvette", "Hgn_Pulsarcorvette",},
			frigate = {"Hgn_assaultfrigate", "Hgn_torpedofrigate", "Hgn_ioncannonfrigate", "Hgn_marinefrigate", "Hgn_defensefieldfrigate"},
			capital = {"Hgn_Destroyer", "hgn_lightcruiser",},
			--Ӧ����Ҳ�ͬ����Ľ������ű�Ӧˢ����Щ������ÿ��������������ٸ���һ�֣�
			afighter = {"Hgn_Interceptor", "Hgn_assaultcorvette", "Hgn_assaultfrigate", "hgn_lightcruiser",},
			acorvette = {"Hgn_Interceptor", "Hgn_Pulsarcorvette", "Hgn_torpedofrigate", "hgn_lightcruiser",},
			afrigate = {"Hgn_AttackBomber", "Hgn_Pulsarcorvette", "Hgn_ioncannonfrigate", "Hgn_Destroyer",},
			acapital = {"Hgn_AttackBomber", "Hgn_Pulsarcorvette", "Hgn_ioncannonfrigate", "hgn_lightcruiser",},
		},
	},
	VGR = 
	{
		startship = "",
	},
	KPR =
	{
		startship = "",
	},
	TAI = 
	{
		name = LocaleText[4],
		balance = {1,1.5,2,8},
		attackwave = 
		{
			fighter =  {4, 7,10,12,14,16,18,20,22,24,26,28},
			corvette = {2, 4, 6, 8,10,12,14,16,18,20,22,24},
			frigate =  {2, 4, 6, 9,12,15,19,23,27,32,37,42},
			capital =  {0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
			addition = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,},
		},
		startship = "tai_carrier",
		SubNeedCreate = {},
		grantBI = {},
		grantRI = {},
		restrictBI = {"TAI_Scout","TAI_mothership","TAI_carrier","TAI_researchship","TAI_researchstation","TAI_ResourceCollector","TAI_ResourceController","TAI_sensorarray","Tai_M_Hyperspace"},
		restrictRI = {},
		ships = 
		{
			fighter = {"TAI_Interceptor", "TAI_AttackBomber", "TAI_heavydefender", "TAI_defensefighter",},
			corvette = {"TAI_lightcorvette", "TAI_heavycorvette", "TAI_salcapcorvette",},
			frigate = {"TAI_standardfrigate", "TAI_ioncannonfrigate", "TAI_defensefrigate", "TAI_supportfrigate",},
			capital = {"TAI_Destroyer", "TAI_missiledestroyer", "TAI_heavycruiser",},
			afighter = {"TAI_Interceptor", "TAI_lightcorvette", "TAI_standardfrigate", "TAI_missiledestroyer",},
			acorvette = {"TAI_Interceptor", "TAI_heavycorvette", "TAI_standardfrigate", "TAI_missiledestroyer",},
			afrigate = {"TAI_AttackBomber", "TAI_heavycorvette", "TAI_ioncannonfrigate", "TAI_Destroyer",},
			acapital = {"TAI_AttackBomber", "TAI_heavycorvette", "TAI_ioncannonfrigate", "TAI_heavycruiser",},
		},
	},
	KAD = 
	{
		startship = "",
	},
	TUR = 
	{
		name = LocaleText[3],
		balance = {1,1.5,2,8},
		attackwave = 
		{
			fighter =  {4, 7,10,12,14,16,18,20,22,24,26,28},
			corvette = {3, 5, 7, 9,12,15,18,21,24,28,32,36},
			frigate =  {2, 6,10,14,18,21,24,27,30,32,34,36},
			capital =  {0, 0, 0, 0, 1, 1, 2, 2, 3, 4, 5, 6},
			addition = {7, 6, 5, 4, 3, 2, 1, 0, 0, 0, 0, 0},
		},
		startship = "tur_carrier",
		SubNeedCreate = {"tur_ac_Frigate"},
		grantBI = {},
		grantRI = {"InstaFrigateTech", "InstaFrigateadvancedTech",},
		restrictBI = {"tur_HC_hyperspace","tur_ac_hyperspace","tur_scout","tur_shipyard","tur_ResourceController","tur_carrier","tur_cloakgenerator","tur_resourcecollector","tur_Garbage",},
		restrictRI = {"Tur_UtilityHealthUpgrade1", "Tur_FateOfTheEscortFleet"},
		ships = 
		{
			fighter = {"tur_fighter", "tur_attackbomber",},
			corvette = {"tur_standardcorvette", "tur_missilecorvette", "tur_minelayercorvette", "tur_torpedoCorvette",},
			frigate = {"tur_vulcanfrigate", "tur_ionarrayfrigate", "tur_SiegeDrillfrigate", "tur_Energyfrigate",},
			capital = {"tur_carrier","tur_heavycruiser",},
			afighter = {"tur_fighter", "tur_standardcorvette", "tur_vulcanfrigate", "tur_carrier",},
			acorvette = {"tur_fighter", "tur_missilecorvette", "tur_vulcanfrigate", "tur_carrier",},
			afrigate = {"tur_attackbomber", "tur_minelayercorvette", "tur_ionarrayfrigate", "tur_heavycruiser",},
			acapital = {"tur_attackbomber", "tur_minelayercorvette", "tur_ionarrayfrigate", "tur_heavycruiser",},
		},
	},
	KUS=
	{
		name = LocaleText[6],
		balance = {1,1.5,2,8},
		attackwave = 
		{
			fighter =  {4, 7,10,12,14,16,18,20,22,24,26,28},
			corvette = {2, 4, 6, 8,10,12,14,16,18,20,22,24},
			frigate =  {2, 4, 6, 9,12,15,19,23,27,32,37,42},
			capital =  {0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
			addition = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,},
		},
		startship = "kus_carrier",
		SubNeedCreate = {},
		grantBI = {},
		grantRI = {"RATech","PlasmaBombsTech","HyperspaceTech","ResearchTech"},
		restrictBI = {"kus_probe", "kus_resourcerefinery", "kus_dronefrigate","kus_mothership","kus_researchship","kus_researchshipadv","kus_ResourceCollector","kus_researchship_1","kus_researchship_2","kus_researchship_3","kus_researchship_4","kus_researchship_5",},
		restrictRI = {},
		ships = 
		{
			fighter = {"kus_Interceptor", "kus_AttackBomber", "kus_defender", "kus_cloakedfighter",},
			corvette = {"kus_multiguncorvette", "kus_heavycorvette", "kus_salvagecorvette", "kus_commandcorvette"},
			frigate = {"kus_missilefrigate", "kus_assaultfrigate", "kus_ioncannonfrigate",},
			capital = {"kus_Destroyer", "kus_missiledestroyer", "kus_heavycruiser",},
			afighter = {"kus_Interceptor", "kus_multiguncorvette", "kus_missilefrigate", "kus_missiledestroyer",},
			acorvette = {"kus_Interceptor", "kus_multiguncorvette", "kus_assaultfrigate", "kus_missiledestroyer",},
			afrigate = {"kus_AttackBomber", "kus_heavycorvette", "kus_ioncannonfrigate", "kus_Destroyer",},
			acapital = {"kus_AttackBomber", "kus_heavycorvette", "kus_ioncannonfrigate", "kus_heavycruiser",},
		},
	},
}
--��ͼ���ٻ������������ĵ�RU���Լ���������
Ben_Cost = 
{
	kus_missiledestroyer = {3075,3},
	kus_Destroyer = {2775,3},
	kus_heavycruiser = {5550,3},
	TAI_missiledestroyer = {3075,3},
	TAI_Destroyer = {2775,3},
	TAI_heavycruiser = {5550,3},
	tur_carrier = {0,0},--����ben����Ҹ��ִ���ҲҪд����Ӧ���ݣ���һ��������ν���ڶ�������0����
	tur_heavycruiser = {5550,5},
	Hgn_Destroyer = {3000,5},
	hgn_lightcruiser = {6000,3},
}
Def_Event = 
{
	BenOpen = 
	{
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11515",
			time = 2,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11516",
			time = 3.5,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11533",
			time = 10,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11517",
			time = 7,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11518",
			time = 10,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11519",
			time = 8,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11520",
			time = 10,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11521",
			time = 6,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11522",
			time = 7.5,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11523",
			time = 9.5,
		},
		{
			actor = Actor_HW1_BentusiTraders,
			text = "$11524",
			time = 12,
		},
	},
}

Events = {}

Events["endGame"] = 
{
	{
		{
			"wID = Wait_Start(5)",
			"Wait_End(wID)",
		},
	},
}
Events["playerwin"] = 
{
	{
		{"Camera_FocusSobGroupWithBuffer('Ben', 10, 2000, 2)","",},
		{"Subtitle_Add(Actor_HW1_BentusiTraders, '$11525', 4)","",},
		{ "wID = Wait_Start(4)", "Wait_End(wID)", }, 
	},
	{ "wID = Wait_Start(1)", "Wait_End(wID)", }, 
	{
		{"Subtitle_Add(Actor_HW1_BentusiTraders, '$11526', 8)","",},
		{ "wID = Wait_Start(8)", "Wait_End(wID)", }, 
	},
	{ "wID = Wait_Start(1)", "Wait_End(wID)", }, 
	{
		{"Universe_Fade(1, 2)","",},
		{ "wID = Wait_Start(2)", "Wait_End(wID)", }, 
	},
	{
		{"Subtitle_Message('$11527', 9)","",},
		{ "wID = Wait_Start(9)", "Wait_End(wID)", }, 
	},
	{ "wID = Wait_Start(1)", "Wait_End(wID)", }, 
	{
		{"Subtitle_Message('$11528', 16)","",},
		{ "wID = Wait_Start(16)", "Wait_End(wID)", }, 
	},
	{ "wID = Wait_Start(1)", "Wait_End(wID)", }, 
	{
		{"Rule_AddInterval('Def_PlayerWin', 1)","",},
	}
}

