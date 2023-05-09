-------------------------------------------------------------
--------AchievementList.lua--------2019��08��23��------------
--�� 9CCNMOD�� ������-���� ��д
--����ļ�������FX MOD�еĳɾ�ϵͳ�����гɾ��б�
--�ṹ���£�
--AchievementList = 
--{
--	FirstDeathmatch=																						--�óɾ��ڴ����е�����
--	{
--		localeName="FirstVictory",--"��һ��Ӯ������ս",						--�óɾ�����Ϸ����ʾ������
--		picWhenLocked="DATA:UI/NewUI/Achievement/9ccn.tga",				--�óɾ�δ����ʱ��ͼƬ
--		picWhenUnLocked="DATA:UI/NewUI/Achievement/9ccn2.tga",		--�óɾͽ������ͼƬ
--		GameModeTags={"FX2DM","FXGDM",},													--�óɾ͵���Ϸģʽ��ǩ
--		Conditions=																								--�óɾ͵Ĵ������
--		{
--			{
--				{"IsPlayerWinInDM"},
--			},
--		},
--		descriptionWhenLocked="�˳ɾ���δ����",										--�óɾ�δ����ʱ������
--		descriptionWhenUnLocked="��ϲ���ѽ����˳ɾ�",							--�óɾͽ����������
--		maxValue=1,																								--�óɾ͵ġ������ɶȡ�����һ���ɾ͵ġ���ɶȡ�������Ϊ���ڵ��ڸ�ֵʱ������Ϊ�óɾ������
--		displayPriority = 10                                      --��ʾ���ȼ����ڳɾͽ����У�����ֵԽС����Ŀ������Խǰ�档
--	},
--}
-------------------------------------------------------------
--�ɾ���صĿ��ƺ�����data:scripts/FX_AchievementControl.lua�ж���
-------------------------------------------------------------
-------------------------------------------------------------


AchievementList = 
{
	TutorialComplete=
	{
		localeName="$90079",--"����˹̽�ռ�",
		picWhenLocked="DATA:UI/NewUI/Achievement/Tutoriallocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Tutorialunlocked.tga",
		GameModeTags={"Tutorial",},
		Conditions={},
		descriptionWhenLocked="$90080",
		descriptionWhenUnLocked="$90081",
		maxValue=3,
		displayPriority = 0,
	},
	FirstVictory=
	{
		localeName="$90029",--"��һ��Ӯ������ս",
		picWhenLocked="DATA:UI/NewUI/Achievement/firstwinlocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/firstwinunlocked.tga",
		GameModeTags={"FX2DM","FXPVP",},
		Conditions=
		{
			{
				{"IsPlayerWinInDM"},
			},
		},
		descriptionWhenLocked="$90031",
		descriptionWhenUnLocked="$90032",
		maxValue=1,
		displayPriority = 10,
	},
	FirstVictoryInPVP=
	{
		localeName="$90221",--"��һ��Ӯ�ñ�׼��ս",
		picWhenLocked="DATA:UI/NewUI/Achievement/PVPlocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/PVPunlocked.tga",
		GameModeTags={"FXPVP",},
		Conditions=
		{
			{
				{"IsPlayerWinInMP"},
			},
		},
		descriptionWhenLocked="$90222",
		descriptionWhenUnLocked="$90223",
		maxValue=1,
		displayPriority = 11,
	},
	ManMachine=
	{
		localeName="$90224",--"Ӯ��80�ø�",
		picWhenLocked="DATA:UI/NewUI/Achievement/rep80locked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/rep80unlocked.tga",
		GameModeTags={"Artifact","FXsingleplayer","FX2DM","FXPVP",},
		Conditions=
		{
			{
				{"Function",FXA_Rep80},
			},
		},
		descriptionWhenLocked="$90225",
		descriptionWhenUnLocked="$90226",
		maxValue=1,
		displayPriority = 12,
	},
	PreciousOfBentusi=
	{
		localeName="$90030",--"��ͼ���ı���",
		picWhenLocked="DATA:UI/NewUI/Achievement/benlocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/benunlocked.tga",
		GameModeTags={"FXGDF",},
		Conditions=
		{
			{
				{"ValueDetect","PlayerWin",1},
			},
		},
		descriptionWhenLocked="$90033",
		descriptionWhenUnLocked="$90034",
		maxValue=1,
		displayPriority = 20,
	},
	StarMetalScrolls=
	{
		localeName="$90042",--"�ǽ����",
		picWhenLocked="DATA:UI/NewUI/Achievement/scrolllocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/scrollunlocked.tga",
		GameModeTags={"FX_Path",},
		Conditions={},
		descriptionWhenLocked="$90043",
		descriptionWhenUnLocked="$90044",
		maxValue=33,
		displayPriority = 30,
	},
	CompetenceInChaos=
	{
		localeName="$90049",--"��ˮ����",
		picWhenLocked="DATA:UI/NewUI/Achievement/Arti1locked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Arti1unlocked.tga",
		GameModeTags={"Artifact",},
		Conditions=
		{
			{
				{"IsPlayerWinInDM"},
			},
		},
		descriptionWhenLocked="$90050",
		descriptionWhenUnLocked="$90051",
		maxValue=1,
		displayPriority = 40,
	},
	TreasureHunter=
	{
		localeName="$90052",--"��������",
		picWhenLocked="DATA:UI/NewUI/Achievement/Treasurelocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Treasureunlocked.tga",
		GameModeTags={"Artifact",},
		Conditions={},
		descriptionWhenLocked="$90053",
		descriptionWhenUnLocked="$90054",
		maxValue=20,
		displayPriority = 50,
	},
	ChronospacePioneer=
	{
		localeName="$90055",--"ʱ������",
		picWhenLocked="DATA:UI/NewUI/Achievement/Pioneerlocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Pioneerunlocked.tga",
		GameModeTags={"FXLF",},
		Conditions={},
		descriptionWhenLocked="$90056",
		descriptionWhenUnLocked="$90057",
		maxValue=1,
		displayPriority = 60,
	},
	Friend9CCN=
	{
		localeName="$90058",--"9CCN��������",
		picWhenLocked="DATA:UI/NewUI/Achievement/9ccnlocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/9ccnunlocked.tga",
		GameModeTags={"FXLF",},
		Conditions={},
		descriptionWhenLocked="$90059",
		descriptionWhenUnLocked="$90060",
		maxValue=1,
		displayPriority = 70,
	},
	EdenComplete=
	{
		localeName="$90061",--"����ʹ��",
		picWhenLocked="DATA:UI/NewUI/Achievement/Edenlocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Edenunlocked.tga",
		GameModeTags={"DTsingleplayer",},
		Conditions={},
		descriptionWhenLocked="$90062",
		descriptionWhenUnLocked="$90063",
		maxValue=1,
		displayPriority = 80,
	},
	FalconComplete=
	{
		localeName="$90064",--"�۹���ӥ",
		picWhenLocked="DATA:UI/NewUI/Achievement/Falconlocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Falconunlocked.tga",
		GameModeTags={"DTsingleplayer",},
		Conditions={},
		descriptionWhenLocked="$90065",
		descriptionWhenUnLocked="$90066",
		maxValue=1,
		displayPriority = 90,
	},
	KarosComplete=
	{
		localeName="$90067",--"����˹̽�ռ�",
		picWhenLocked="DATA:UI/NewUI/Achievement/Karoslocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Karosunlocked.tga",
		GameModeTags={"DTsingleplayer",},
		Conditions={},
		descriptionWhenLocked="$90068",
		descriptionWhenUnLocked="$90069",
		maxValue=1,
		displayPriority = 100,
	},
	KadMiniComplete=
	{
		localeName="$90076",
		picWhenLocked="DATA:UI/NewUI/Achievement/Kadminilocked.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Kadminiunlocked.tga",
		GameModeTags={"DTsingleplayer",},
		Conditions={},
		descriptionWhenLocked="$90077",
		descriptionWhenUnLocked="$90078",
		maxValue=1,
		displayPriority = 110,
	},
	TaiMiniComplete=
	{
		localeName="$90132",
		picWhenLocked="DATA:UI/NewUI/Achievement/Tai_Incomplete.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Tai_Complete.tga",
		GameModeTags={"DTsingleplayer",},
		Conditions={},
		descriptionWhenLocked="$90133",
		descriptionWhenUnLocked="$90134",
		maxValue=1,
		displayPriority = 120,
	},
	TaiMiniFullComplete=
	{
		localeName="$90135",
		picWhenLocked="DATA:UI/NewUI/Achievement/Tai_HI.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Tai_HC.tga",
		GameModeTags={"DTsingleplayer",},
		Conditions={},
		descriptionWhenLocked="$90136",
		descriptionWhenUnLocked="$90137",
		maxValue=1,
		displayPriority = 130,
	},
	TutorialFullComplete=
	{
		localeName="$90229",
		picWhenLocked="DATA:UI/NewUI/Achievement/Tai_HI.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/TutFull.tga",
		GameModeTags={"Tutorial",},
		Conditions={},
		descriptionWhenLocked="$90227",
		descriptionWhenUnLocked="$90228",
		maxValue=1,
		displayPriority = 140,
	},
	PathFullComplete=
	{
		localeName="$90230",
		picWhenLocked="DATA:UI/NewUI/Achievement/Tai_HI.tga",
		picWhenUnLocked="DATA:UI/NewUI/Achievement/Path37.tga",
		GameModeTags={"FX_Path",},
		Conditions={
			{
				{"Function",FXA_PathFinish},
			},
		},
		descriptionWhenLocked="$90231",
		descriptionWhenUnLocked="$90232",
		maxValue=1,
		displayPriority = 150,
	},
}