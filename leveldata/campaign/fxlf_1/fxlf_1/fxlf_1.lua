--加载LW库
dofilepath("data:scripts/LW_functions.lua")
--主菜单切换代码
dofilepath("data:scripts/FX_SwitchMainMenu.lua")

dofilepath("locale:localetext.lua")
--加载X系统文件
dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")
----------------
dofilepath("data:scripts/scar/restrict.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")

dofilepath("data:leveldata/campaign/fxlf_1/fxlf_1/res/LF_Enemy.lua")
dofilepath("data:leveldata/campaign/fxlf_1/fxlf_1/res/LF_Fleet.lua")
dofilepath("data:leveldata/campaign/fxlf_1/fxlf_1/res/LF_Event.lua")

dofilepath("locale:leveldata/campaign/fx_spfleet/fx_fleetset.lua") 
dofilepath("data:leveldata/campaign/fx_spfleet/fx_fleetUI.lua") 

--加载debug文件
dofilepath("data:scripts/debug.lua")
--加载公共规则
dofilepath("data:scripts/rules/common.rule")
------------------
--成就系统管理代码
dofilepath("data:scripts/FX_AchievementControl.lua")

--Enemy定义敌人的种类/个数
--Event定义事件
--Fleet定义援军种类/UI等等
--主LUA定义各个Wave
--每个Wave的构成：
ATK_Waves={}

intro_event_index=0
g_BountyRecord=0

g_spawn={}
g_spawn[1]=0
g_spawn[2]=0
g_spawn[3]=0
g_spawn[4]=0
g_spawn[5]=0
g_spawn[6]=0
g_spawn[7]=0
g_spawn[8]=0

g_waveInterval=195
--g_waveInterval=30

function StartWave(Wave_Index)

	dout("SPAWNING WAVE_"..Wave_Index)
	--Wave Intro

	Subtitle_Add(Actor_FleetIntel, TEXT_Wave_Intro[Wave_Index], 5)--INTRO TEXT
	LocationCard(LocaleText[7]..Wave_Index..LocaleText[8], 5)

	--SPAWNs

  WAVE_Spawn_Enemy(Wave_Index,1)--defined in ENEMY.lua
  WAVE_Spawn_Enemy(Wave_Index,2)
  WAVE_Spawn_Enemy(Wave_Index,3)
  WAVE_Spawn_Enemy(Wave_Index,4)
  g_spawn[Wave_Index]=1

	--  Subtitle_Add(Actor_FleetIntel, TEXT_Wave_Enemy[Wave_Index], 5)--ENEMY TEXT

	WAVE_Spawn_Ally(Wave_Index)--defined in FLEET.lua

	-- Subtitle_Add(Actor_FleetIntel, TEXT_Wave_Fleet[Wave_Index], 5)--LF TEXT
	 		
	--Timer
	--Timer_Start(Wave_Index,WAVE_TimePeriod)
	--Subtitle_TimeCounter(Wave_Index, 90900)

	--Music
	Sound_MusicPlay(LF_MusicTable[Wave_Index])
	
	Rule_Add("Rule_PlaySaveGameLocationCard")
	--注意，必须延迟一秒进行自动保存，否则会出现每读一次档都会多刷出一份兵来的问题——破天者-孤狼
	Rule_AddIntervalParam("Rule_SaveTheGameMissionStart", Wave_Index, 1)
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end

function Rule_SaveTheGameMissionStart(Wave_Index)
	Rule_RemoveParam("Rule_SaveTheGameMissionStart", Wave_Index)
	Campaign_QuickSaveNb(tonumber(Wave_Index), "FXLF_WAVE_%d")
end

function Bounty()
  local Bounty_Tmp=Stats_TotalKillsInRUs(0)
  if Bounty_Tmp-g_BountyRecord>0 then
    Player_SetRU( 0,Player_GetRU(0)+ 0.21*(Bounty_Tmp-g_BountyRecord) ) 
    g_BountyRecord=Bounty_Tmp
  end
end

function OnInit()
	--X system entrance
	XInit("reslist.lua", "")
	--
	Ping_AddSobGroup("$100002", "anomaly", "SiMuXiao")
	Rule_AddInterval("FX_SPFLEET_InitRoll",10)
	Rule_AddInterval("FX_SPFLEET_UPDATE",0.5)
	Rule_Add("InitRule")
	Rule_AddInterval("Bounty",10)
	Sound_SetMuteActor("All_")
	Sound_EnableAllSpeech(0)  
	
	Councilor_Switch = 0
	FX_Common_Rule_OnInit() 
		FX_Achievements_Init("FXsingleplayer")
--------
		FX_Common_Rule_OnInit()
end
function OnStartOrLoad()
		--成就系统管理代码
		dofilepath("data:scripts/FX_AchievementControl_TableFunctions.lua")
	--主菜单切换
	FX_SwitchMainMenuTo(mainmenu_tanis)
	--------
	FX_Common_Rule_OnStartOrLoad()
	--------
	FXLF_UI_Init()
	--X System Reload
	XInitOnLoad()
end

function InitRule()
	nccnOwned={}
	for i=1,LF_BuyCount do
		nccnOwned[i]=0
	end
	MPRestrict()
	Event_Start("intelevent_first")	
	Rule_Add("Intro_Done")
	Rule_Remove("InitRule")

	SobGroup_AbilityActivate("Derelicts",AB_Steering,0)
	Player_SetPlayerName(0, "$100003")
	Player_SetPlayerName(1, "$100004")
	Player_SetPlayerName(2, "$100005")
	Player_SetPlayerName(3, "$100005")
	dofilepath("player:PLAYERCFG.LUA")
	Player_SetTeamColours(Universe_CurrentPlayer(),{PlayerSetup.teamcolour[1]/255,PlayerSetup.teamcolour[2]/255,PlayerSetup.teamcolour[3]/255,},{PlayerSetup.stripecolour[1]/255,PlayerSetup.stripecolour[2]/255,PlayerSetup.stripecolour[3]/255,})
	Player_SetBadgeTexture(Universe_CurrentPlayer(), PlayerSetup.emblem)
	SetAlliance(0, 2)
	SetAlliance(2, 0)
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	SetAlliance(0, 3)
	SetAlliance(3, 0)
	CPU_Enable(1, 0)
	CPU_Enable(2, 0)
	CPU_Enable(3, 0)
	Rule_AddInterval("Gameover", 1)
	--JUMPHOLE
   
	SobGroup_Create("JumpGroup1")
	SobGroup_Create("JumpGroup2")
	SobGroup_Create("JumpGroup3")
	SobGroup_Create("JumpGroup4")
	SobGroup_Create("JumpGroup5")

	SobGroup_Create("InHS1")
	SobGroup_Create("InHS2")
	SobGroup_Create("InHS3")
	SobGroup_Create("InHS4")
	SobGroup_Create("InHS5")
   
	Volume_AddSphere("Jump1", {550000,0,0},50000)
	Volume_AddSphere("Exit1", {15000,0,0},6500)
    
	Volume_AddSphere("Jump2", {-550000,0,0},50000)
	Volume_AddSphere("Exit2", {-15000,0,0},6500)
    
	Volume_AddSphere("Jump3", {0,0,550000},50000)
	Volume_AddSphere("Exit3", {0,0,15000},6500)
    
	Volume_AddSphere("Jump4", {0,0,-550000},50000)
	Volume_AddSphere("Exit4", {0,0,-15000},6500)
    
	Volume_AddSphere("Jump5", {0,550000,0},50000)
	Volume_AddSphere("Exit5", {0,0,0},6500)
   
	Volume_AddSphere("INNER", {0,0,0},300000)
  
	Rule_AddInterval("Jump", 1)
	Rule_AddInterval("Exit", 3)
 
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Production_Fighter")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Production_Corvette")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Production_Frigate")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Module_Research")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Module_ResearchAdvanced")
	--SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Module_hyperspace")
	--注释掉下面这行，因为在FXG的科技树中希格拉航母并没有平台模块——破天者-孤狼
	--SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Module_PlatformControl")
 
	Hyperspace_SetStateForPlayer(0,0)
	Hyperspace_SetStateForPlayer(1,0)
	Sound_MusicPlay("data:sound/music/staging/STAGING_04")   
end

function Jump()
	if(Player_IsShipInVolume(1,"Jump1") == 1)then
		Player_FillSobGroupInVolume("JumpGroup1", 1,"Jump1")
		SobGroup_SobGroupAdd("InHS1", "JumpGroup1")
		if(SobGroup_Count("JumpGroup1") > 0) then
			--  SobGroup_EnterHyperSpaceOffMap("JumpGroup1")
			SobGroup_Despawn("JumpGroup1")
		end
		SobGroup_Clear("JumpGroup1")
	end
  
	if(Player_IsShipInVolume(1,"Jump2") == 1)then
		Player_FillSobGroupInVolume("JumpGroup2", 1,"Jump2")
		SobGroup_SobGroupAdd("InHS2", "JumpGroup2")
		if(SobGroup_Count("JumpGroup2") > 0) then
			--  SobGroup_EnterHyperSpaceOffMap("JumpGroup2")
			SobGroup_Despawn("JumpGroup2")
		end
		SobGroup_Clear("JumpGroup2")
	end
   
	if(Player_IsShipInVolume(1,"Jump3") == 1)then
		Player_FillSobGroupInVolume("JumpGroup3", 1,"Jump3")
		SobGroup_SobGroupAdd("InHS3", "JumpGroup3")
		if(SobGroup_Count("JumpGroup3") > 0) then
			--  SobGroup_EnterHyperSpaceOffMap("JumpGroup3")
			SobGroup_Despawn("JumpGroup3")
		end
		SobGroup_Clear("JumpGroup3")
	end
	
  if(Player_IsShipInVolume(1,"Jump4") == 1)then
		Player_FillSobGroupInVolume("JumpGroup4", 1,"Jump4")
		SobGroup_SobGroupAdd("InHS4", "JumpGroup4")
		if(SobGroup_Count("JumpGroup4") > 0) then
			-- SobGroup_EnterHyperSpaceOffMap("JumpGroup4")
			SobGroup_Despawn("JumpGroup4")
		end
		SobGroup_Clear("JumpGroup4")
	end

	if(Player_IsShipInVolume(0,"Jump5") == 1)then
		Player_FillSobGroupInVolume("JumpGroup5", 0,"Jump5")
		SobGroup_SobGroupAdd("InHS5", "JumpGroup5")
		if(SobGroup_Count("JumpGroup5") > 0) then
			-- SobGroup_EnterHyperSpaceOffMap("JumpGroup4")
			SobGroup_Despawn("JumpGroup5")
		end
		SobGroup_Clear("JumpGroup5")
	end
end

function Exit()
	if (SobGroup_Count("InHS1") > 0) then
		dout("TRYING TO EXIT 1")
		if (SobGroup_AreAllInHyperspace("InHS1") == 1) then
			SobGroup_ExitHyperSpace("InHS1","Exit1")
			SobGroup_Clear("InHS1")
		end
	end
	if (SobGroup_Count("InHS2") > 0) then
		dout("TRYING TO EXIT 2")
		if (SobGroup_AreAllInHyperspace("InHS2") == 1) then
			SobGroup_ExitHyperSpace("InHS2","Exit2")
			SobGroup_Clear("InHS2")
		end
	end
	if (SobGroup_Count("InHS3") > 0) then
		dout("TRYING TO EXIT 3")
		if (SobGroup_AreAllInHyperspace("InHS3") == 1) then
			SobGroup_ExitHyperSpace("InHS3","Exit3")
			SobGroup_Clear("InHS3")
		end
	end
	if (SobGroup_Count("InHS4") > 0) then
		dout("TRYING TO EXIT 4")
		if (SobGroup_AreAllInHyperspace("InHS4") == 1) then
			SobGroup_ExitHyperSpace("InHS4","Exit4")
			SobGroup_Clear("InHS4")
		end
	end  
	if (SobGroup_Count("InHS5") > 0) then
		dout("TRYING TO EXIT 5")
		if (SobGroup_AreAllInHyperspace("InHS5") == 1) then
			--SobGroup_ExitHyperSpaceSobGroup("InHS5", "SiMuXiao", 1000)
			SobGroup_ExitHyperSpace("InHS5","Exit5")
			--Camera_FocusSobGroupWithBuffer("InHS5", 100, 1000, 0)
			SobGroup_Clear("InHS5")
		end
	end
end

function Intro_Done()
	if Event_IsDone("intelevent_first")  then
		dout("DONE")
		Rule_Remove("Intro_Done")
		Rule_AddInterval("StartWaves",g_waveInterval)
		Rule_AddInterval("ENEMY_Maintain",10)--defined in ENEMY.lua
		LocationCard("INTRO DONE", 5)	
	end	
end

function StartWaves()
	if(g_wavenow>Wave_Count) then
		Rule_Remove("StartWaves")
		FinalWave()
	else
		StartWave(g_wavenow) 
		--WAVE_BringThemBack(g_wavenow) --AXED. we use jumphole now
		g_wavenow=g_wavenow+1
	end
end

function FinalWave()
	Volume_Delete("Exit4")
	Volume_AddSphere("Exit4", {0,0,-25000},6500)

	SobGroup_Create("IMMGROUP")
	SpawnFinalWave()
	Rule_AddInterval("WINRULE",1)
end

function SpawnFinalWave()
	Subtitle_Add(Actor_FleetIntel, TEXT_Wave_FINAL, 5)--ENEMY TEXT

	SobGroup_SpawnNewShipInSobGroup(1, "CoJ_battleshipnoshield_normal", "BBSquad1","IMMGROUP", "vol_Enemy4")
	SobGroup_SpawnNewShipInSobGroup(1, "CoJ_battleshipnoshield_normal", "BBSquad2","IMMGROUP", "vol_Enemy4")
	--SobGroup_SetMadState("IMMGROUP", "Maingunon")
	SobGroup_SpawnNewShipInSobGroup(1, "unk_immortal", "IMM","IMMGROUP", "vol_Enemy4")

	for i=1,15 do
		SobGroup_SpawnNewShipInSobGroup(1, "CoJ_AssaultFrigate_v2", "FFSquad"..i,"IMMGROUP", "vol_Enemy4")
	end
    
	Rule_AddInterval("IMMATK",5)
	Rule_Remove("ENEMY_Maintain")
end

function IMMATK()
	SobGroup_AttackPlayer("IMMGROUP", 0)
end

function WINRULE()
	if SobGroup_HealthPercentage("IMMGROUP")<0.5 then
		SobGroup_EnterHyperSpaceOffMap("IMMGROUP")
		Subtitle_Add(Actor_FleetIntel, WININFO,20)
		Rule_AddInterval("LAST",15)
		Rule_Remove("WINRULE")
	end
end

function LAST()
	Event_Start("endGame")
	--Universe_Fade( 1, 3 )	
	waitForEnd_Win()
	Rule_Remove("LAST")
end

function InitRule_Old()
	Sound_MusicPlay("data:sound/music/staging/STAGING_04")

	SobGroup_AbilityActivate("PlayerShip", AB_Move, 0)
	SobGroup_AbilityActivate("PlayerShip", AB_Scuttle, 0)
	SobGroup_AbilityActivate("PlayerShip", AB_Attack, 0)
    
	Player_RestrictBuildOption(0,"hgn_scout")
	Player_RestrictBuildOption(0,"hgn_interceptor")
	Player_RestrictBuildOption(0,"hgn_attackbomber")
	Player_RestrictBuildOption(0,"hgn_assaultcorvette")
	Player_RestrictBuildOption(0,"hgn_pulsarcorvette")
	Player_RestrictBuildOption(0,"hgn_torpedofrigate")
	Player_RestrictBuildOption(0,"hgn_assaultfrigate")
	Player_RestrictBuildOption(0,"hgn_ioncannonfrigate")
	Player_RestrictBuildOption(0,"hgn_marinefrigate")
	Player_RestrictBuildOption(0,"hgn_defmsfrigate")
	Player_RestrictBuildOption(0,"hgn_shipyard")
	Player_RestrictBuildOption(0,"hgn_defensefieldfrigate")
	Player_RestrictBuildOption(0,"hgn_minelayercorvette")
	Player_RestrictBuildOption(0,"hgn_c_module_hyperspace")
	Player_RestrictBuildOption(0,"hgn_c_module_cloakgenerator")
	Player_RestrictBuildOption(0,"hgn_c_module_research")
	Player_RestrictBuildOption(0,"hgn_c_module_researchadvanced")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Production_Fighter")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Production_Corvette")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Production_Frigate")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Module_hyperspace")
	SobGroup_CreateSubSystem("PlayerCarrier", "Hgn_C_Module_PlatformControl")

	Player_SetPlayerName(0, "$100006")
	Player_SetPlayerName(1, "$100007")
	Player_SetPlayerName(2, "$100008")
	Player_SetPlayerName(3, "$100008")
	SetAlliance(0, 1)
	SetAlliance(1, 0)
	SetAlliance(0, 2)
	SetAlliance(2, 0)
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	CPU_Enable(1, 0)
	CPU_Enable(2, 0)
	CPU_Enable(3, 0)
	Universe_EnableCmd(0, MUI_ScuttleCommand)
	Universe_EnableCmd(0, MUI_MoveCommand)
	Universe_AllowPlayerOrders(0)
	Camera_AllowControl(0)
	Event_Start("intelevent_first")
	Rule_Remove("InitRule")
	NISDisableInterface(1)    
	Rule_AddInterval("Gameover", 1)
end

Events["endGame"] = {{{"wtID = Wait_Start(5)", "Wait_End(wtID)"},},}

function waitForEnd()
	if (Event_IsDone("endGame")) then
		setMissionComplete(0)
		--setGameOver()
	end
end

function waitForEnd_Win()
	if (Event_IsDone("endGame")) then
		setMissionComplete(1)
		Set_FX_Achievements_Value("ChronospacePioneer",1)
		--setGameOver()
	end
end

function Gameover()
	if SobGroup_HealthPercentage("SiMuXiao")==0 then
	  Subtitle_Add(Actor_FleetIntel, GAMEOVERINFO,20)
	  Event_Start("endGame")
	  --Universe_Fade( 1, 3 )	
	  waitForEnd()
	end
end




