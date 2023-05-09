-------------------------------------------------------------
--------AchievementList.lua--------2019年08月23日------------
--由 9CCNMOD组 破天者-孤狼 编写
--这个文件定义了FX MOD中的成就系统的所有成就列表
--结构如下：
--AchievementList = 
--{
--	FirstDeathmatch=																						--该成就在代码中的名字
--	{
--		localeName="FirstVictory",--"第一次赢得遭遇战",						--该成就在游戏中显示的名字
--		picWhenLocked="DATA:UI/NewUI/Achievement/9ccn.tga",				--该成就未解锁时的图片
--		picWhenUnLocked="DATA:UI/NewUI/Achievement/9ccn2.tga",		--该成就解锁后的图片
--		GameModeTags={"FX2DM","FXGDM",},													--该成就的游戏模式标签
--		Conditions=																								--该成就的达成条件
--		{
--			{
--				{"IsPlayerWinInDM"},
--			},
--		},
--		descriptionWhenLocked="此成就尚未解锁",										--该成就未解锁时的描述
--		descriptionWhenUnLocked="恭喜你已解锁此成就",							--该成就解锁后的描述
--		maxValue=1,																								--该成就的“最大完成度”：当一个成就的“完成度”被设置为大于等于该值时，即认为该成就已完成
--		displayPriority = 10                                      --显示优先级。在成就界面中，该数值越小的项目会排在越前面。
--	},
--}
-------------------------------------------------------------
--成就相关的控制函数在data:scripts/FX_AchievementControl.lua中定义
-------------------------------------------------------------
-------------------------------------------------------------


AchievementList = 
{
	TutorialComplete=
	{
		localeName="$90079",--"卡洛斯探险家",
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
		localeName="$90029",--"第一次赢得遭遇战",
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
		localeName="$90221",--"第一次赢得标准对战",
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
		localeName="$90224",--"赢得80好感",
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
		localeName="$90030",--"本图西的宝藏",
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
		localeName="$90042",--"星金卷轴",
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
		localeName="$90049",--"浑水摸鱼",
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
		localeName="$90052",--"宝藏猎人",
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
		localeName="$90055",--"时空先驱",
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
		localeName="$90058",--"9CCN的老朋友",
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
		localeName="$90061",--"护花使者",
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
		localeName="$90064",--"帝国雄鹰",
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
		localeName="$90067",--"卡洛斯探险家",
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