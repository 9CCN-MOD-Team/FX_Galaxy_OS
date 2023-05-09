----
--主菜单切换代码
dofilepath("data:scripts/FX_SwitchMainMenu.lua")
--加载LW库
dofilepath("data:scripts/LW_functions.lua")
--加载X系统文件
dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")
------
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
--成就系统管理代码
dofilepath("data:scripts/FX_AchievementControl.lua")
--加载公共规则
dofilepath("data:scripts/rules/common.rule")

actor_karan=1
actor_taiidan = 23
FXT_AIAtkStart=0
FXT_AISrdStart=0
FXT_EventPointer={}
FXT_Ping={}

Events = {}
Events.Intro = 
	{ 
		{ { "Sound_SetMuteActor('Fleet')", ""}, }, 
	  { HW2_LocationCardEvent("$41001", 4 ), HW2_Wait( 4 ), }, 
    { HW2_SubTitleEvent(actor_karan, "$41002", 0), HW2_Wait( 1 ), }, 
    { HW2_SubTitleEvent(actor_karan, "$41003", 0), HW2_Wait( 1 ), }, 
    { HW2_SubTitleEvent(actor_karan, "$41004", 0), HW2_Wait( 1 ), }, 
    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
    { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
    { { "FXT_EventPointer_1=EventPointer_AddVolume('Kad_Marker', HW2_rgb(230,230,230), 2400)", "" , },  },
    { HW2_SubTitleEvent(actor_karan, "$41005", 0), HW2_Wait( 1 ), }, 
    { { "EventPointer_Remove(FXT_EventPointer_1)", "" , }, },
		{ { "FXT_EventPointer_2=EventPointer_AddSobGroup('Tai_Ally2', HW2_rgb(230,230,230), 1000)", "" , },  },
    { HW2_SubTitleEvent(actor_karan, "$41006", 0), HW2_Wait( 1 ), }, 
    { { "EventPointer_Remove(FXT_EventPointer_2)", "" , }, },
    { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
    HW2FX_EventEndSet(1,1,1,0,1), 
    { HW2_SubTitleEvent(actor_karan, "$41007", 0), HW2_Wait( 1 ), }, 
    { {"Rule_AddInterval('FXT_AIComOpen',1)", "",}, },
	}
Events.AICom = 
	{ 
    { HW2_SubTitleEvent(actor_karan, "$41010", 0), HW2_Wait( 2 ), }, 
    { HW2_SubTitleEvent(actor_karan, "$41011", 0), HW2_Wait( 1 ), }, 
    { HW2_SubTitleEvent(actor_karan, "$41012", 0), }, 
		{ { "Rule_AddInterval('FXT_TAICom',1)","" }, },
	}
Events.GiveRU = 
	{ 
    { HW2_SubTitleEvent(actor_karan, "$41013", 0), HW2_Wait( 1 ), }, 
    { HW2_SubTitleEvent(actor_karan, "$41014", 0), HW2_Wait( 1 ), }, 
    --It would be cool if the buttons in the Diplomacy Window that the player needs to press will flash, if possible?
		{ { "Rule_AddInterval('FXT_RUGiven',1)","" }, },
	}
Events.RUGiven = 
	{ 
	  { HW2_SubTitleEvent(actor_karan, "$41015", 0), HW2_Wait( 3 ), }, 
    { HW2_SubTitleEvent(actor_taiidan, "$41016", 0), HW2_Wait( 1 ), }, 
    { { "FXT_AILaunch()","" }, },
    { HW2_Wait( 3 ), }, 
	  { HW2_SubTitleEvent(actor_karan, "$41017", 0), HW2_Wait( 1 ), }, 
	  { HW2_SubTitleEvent(actor_karan, "$41018", 0), HW2_Wait( 1 ), }, 
    { HW2_Wait( 3 ), }, 
    {
    	{ "FXT_Ping_1=Ping_AddPoint('$41033', 'anomaly', 'Kad_Marker')", "" , },
			{ "SobGroup_SpawnNewShipInSobGroup(1, 'rpg_inhibitor', 'rpg_inhibitor', 'tempvision', 'Kad_Marker')", "" , }, 
			{ "SobGroup_SetHidden('tempvision',1)", "" , }, 
		},
	  { HW2_SubTitleEvent(actor_karan, "$41019", 0), HW2_Wait( 1 ), }, 
	  { HW2_SubTitleEvent(actor_karan, "$41020", 0), HW2_Wait( 1 ), }, 
		{ { "obj_aiatk=Objective_Add('$41021', OT_Primary)","" }, },
		{ { "Objective_AddDescription(obj_aiatk, '$41022')","" }, },
		{ { "FXT_AIAtkStart=1","" }, },
	}
Events.AIAtk = 
	{ 
    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
    { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
		{
			{ "SobGroup_MakeDead('tempvision')", "" , }, 
			{ "SobGroup_SpawnNewShipInSobGroup(1, 'rpg_inhibitor', 'rpg_inhibitor', 'tempvision', 'Kad_AdvPt')", "" , }, 
			{ "Ping_Remove(FXT_Ping_1)", "" , }, 
		},
	  { HW2_SubTitleEvent(actor_karan, "$41024", 0), HW2_Wait( 1 ), }, 
		{
    	{ "FXT_Ping_2=Ping_AddSobGroup('$41035', 'anomaly', 'Kad_Mothership')", "" , },
			{"SobGroup_ExitHyperSpace('Player_Fleet', 'Player_FleetExit')", "" , },
			{ "FXT_EventPointer_3=EventPointer_AddVolume('Player_FleetExit', HW2_rgb(230,230,230), 1200)", "" , },  
		},
	  { HW2_SubTitleEvent(actor_karan, "$41034", 0), HW2_Wait( 1 ), }, 
	  { HW2_Wait( 4 ), }, 
    { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
    HW2FX_EventEndSet(1,1,1,0,1), 
    { { "EventPointer_Remove(FXT_EventPointer_3)", "" , }, },
		{ { "obj_aiems=Objective_Add('$41025', OT_Primary)","" }, },
		{ { "Objective_AddDescription(obj_aiems, '$41026')","" }, },
		{ { "Rule_AddInterval('FXT_EMSDestroyed',1)","" }, },
	}
Events.AskSurrender = 
	{
        { HW2_SubTitleEvent(actor_karan, "$41027", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$41028", 0), HW2_Wait( 1 ), }, 
				{ { "obj_aisrd=Objective_Add('$41029', OT_Primary)","" }, },
				{ { "Objective_AddDescription(obj_aisrd, '$41030')","" }, },
				{ { "FXT_AISrdStart=1","" }, },
	}
Events.Complete = 
	{
        { HW2_SubTitleEvent(actor_karan, "$41031", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$41032", 0), HW2_Wait( 1 ), }, 
        { { "FXT_Final()","" }, { "UI_SetElementVisible('NewTaskbar','btnHW1SPHyperspace',1)", "", }, },
	}

function AIContactButtonClicked(iChoice, iData)
	if (FXT_AIAtkStart==1)and(iChoice=="AttackNow") then
		Subtitle_Add(actor_karan, "$41023",0)
		Objective_SetState(obj_aiatk, OS_Complete)
		Rule_Remove("FXT_AIAtk")
		SobGroup_FormStrikeGroup("Tai_Fleet", "frigate line")
		SobGroup_Move(1, "Tai_Fleet", "Tai_AdvPt")
		Rule_AddInterval("FXT_KadTrigger", 1)
	end
	if (FXT_AISrdStart==1)and(iChoice=="AgreeSurrender") then
		FXT_Surrender()
	end
end

function FXT_AILaunch()
	for i=1,7 do
		SobGroup_SobGroupAdd("Tai_Fleet",SobGroup_CreateShip("Tai_Ally","tai_interceptor"))
	end
	for i=1,5 do
		SobGroup_SobGroupAdd("Tai_Fleet",SobGroup_CreateShip("Tai_Ally","tai_attackbomber"))
	end
	for i=1,3 do
		SobGroup_SobGroupAdd("Tai_Fleet",SobGroup_CreateShip("Tai_Ally2","tai_lightcorvette"))
	end
	for i=1,3 do
		SobGroup_SobGroupAdd("Tai_Fleet",SobGroup_CreateShip("Tai_Ally2","tai_standardfrigate"))
	end
	for i=1,3 do
		SobGroup_SobGroupAdd("Tai_Fleet",SobGroup_CreateShip("Tai_Ally2","tai_ioncannonfrigate"))
	end
	CPU_RemoveSobGroup(1,"Tai_Fleet")
end

function FXT_AIComOpen()
	if (UI_IsScreenActive("AIContact")==1) then
		--UI_StopFlashButton("NewTaskbar", "btnAchievement")
		obj_aicom=Objective_Add("$41008", OT_Primary)
		Objective_AddDescription(obj_aicom, "$41009")
		Event_Start("AICom")
		Rule_Remove("FXT_AIComOpen")
	end
end

function FXT_TAICom()
	if FX_CurrentAIChoice[1]=="TaskAquire" then
		Event_Start("GiveRU")
		Rule_Remove("FXT_TAICom")
	end
end

function FXT_RUGiven()
	if Player_GetRU(1)>=8000 then
		Event_Start("RUGiven")
		Objective_SetState(obj_aicom, OS_Complete)
		Rule_Remove("FXT_RUGiven")
		Player_SetRU(1,0)
	end
end

function FXT_KadTrigger()
	if SobGroup_IsInVolume("Tai_Fleet", "Kad_MoveTrigger")==1 then
		SobGroup_Move(2, "Kad_Fleet", "Kad_AdvPt")
		Rule_AddInterval("FXT_FightBegin", 1)
		Rule_Remove("FXT_KadTrigger")
	end
end

function FXT_FightBegin()
	if (SobGroup_PlayerIsInSensorRange("Tai_Fleet", 2)==1) then
		SobGroup_Attack(1, "Tai_Fleet", "Kad_Fleet")
		SobGroup_Attack(2, "Kad_Fleet", "Tai_Fleet")
		Event_Start("AIAtk")
		Rule_Remove("FXT_FightBegin")
	end
end

function FXT_EMSDestroyed()
	if SobGroup_Empty("Kad_Mothership")==1 then
		Ping_Remove(FXT_Ping_2)
		SobGroup_MakeDead("tempvision")
		Objective_SetState(obj_aiems, OS_Complete)
		Event_Start("AskSurrender")
		Rule_Remove("FXT_EMSDestroyed")
	end
end

function FXT_Surrender()
--Kad_Carrier despawns, Enemy KAD player disappears from game/diplomacy window.
		Objective_SetState(obj_aisrd, OS_Complete)
		Event_Start("Complete")
end

function FXT_Final()
		-- 设置成就完成度
		local achievement_value = Get_FX_Achievements_Value("TutorialComplete")
		achievement_value = math_or(achievement_value, 2)
		Set_FX_Achievements_Value("TutorialComplete", achievement_value)
end

function singlePlayerHyperspaceButtonPressed()
	Universe_Fade(1, 9)
	UI_SetElementVisible('NewTaskbar','btnHW1SPHyperspace',0)
    SobGroup_EnterHyperSpaceOffMap("Player_Ships0")
    Rule_AddInterval("FXT_End",10)
end

function FXT_End()
	setMissionComplete(1)
end

function OnInit()
	Sound_SpeechSubtitlePath("speech:missions/FX_102/")
--X system entrance
	XInit("reslist.lua", "")
--
  --Camera_SetLetterboxStateNoUI(1,0)
  --CPU_Enable(1, 0)
  --CPU_Enable(2, 0)
  CPU_RemoveSobGroup(1,"Player_Ships1")
  CPU_RemoveSobGroup(2,"Player_Ships2")
  SetAlliance( 0, 1)
  SetAlliance( 1, 0)
	FX_AIContactInit()
	Sound_EnableAllSpeech(0)
  Rule_AddInterval("Rule_DisablePlayer",0.1)
  Rule_AddInterval("Rule_Init",1)
  Rule_AddInterval("Mission_Start",1)
  Universe_Fade(1, 0)
--Achievements
	FX_Achievements_Init("Tutorial")
--------
	Councilor_Switch=0
	FX_Common_Rule_OnInit()
---- Stop flash the Turtorial btn in main menu
	dofilepath("profiles:fx_done_tutorial.lua")
	FX_DONE_TUTORIAL = FX_DONE_TUTORIAL or 0
	FX_DONE_TUTORIAL = math_or(FX_DONE_TUTORIAL, 2)
  if writeto("$fx_done_tutorial.lua") then 
    write("FX_DONE_TUTORIAL = "..FX_DONE_TUTORIAL)
    writeto()
  else 
    _ALERT("Error happened when write to $fx_done_tutorial.lua")
  end
end

function Mission_Start()
    Sound_MusicPlayType("data:sound/music/ambient/tutorial", MUS_Ambient)
		Sound_EnableAllSpeech(1)
    Event_Start("Intro")
    Rule_Remove("Mission_Start")
end

function OnStartOrLoad()
		--成就系统管理代码
		dofilepath("data:scripts/FX_AchievementControl_TableFunctions.lua")
		--主菜单切换
		FX_SwitchMainMenuTo(mainmenu_tanis)
		--------
	FX_Common_Rule_OnStartOrLoad()
	--------
		--X System Reload
		XInitOnLoad()
		-- 显示AI外交按钮
		FX_AIContact_OnStartOrLoad()
end

function Rule_Init()
    Universe_Fade(0, 2)
    Sound_EnableAllSpeech(0)
    Rule_Remove("Rule_Init")
end

function Rule_DisablePlayer()
    SobGroup_AbilityActivate("Player_Carrier", AB_Move, 0)
    SobGroup_AbilityActivate("Player_Carrier", AB_Scuttle, 0)
    --Rule_AddInterval("BuildSpeedUp",1)
    Rule_Remove("Rule_DisablePlayer")
end

function BuildSpeedUp()
		local BuildingFastSpeed=10
    local iPlayer = 0
    local iPlayerCount = Universe_PlayerCount()
    while (iPlayer < iPlayerCount) do
        if (Player_IsAlive(iPlayer) == 1) then
        	SobGroup_SetBuildSpeedMultiplier("Player_Ships"..iPlayer, BuildingFastSpeed)
        end
        iPlayer = iPlayer + 1
    end
end

