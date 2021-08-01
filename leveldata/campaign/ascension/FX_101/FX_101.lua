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
actor_makaan = 2
actor_bentusi=18
actor_keeper=3
FXT_EventPointer={}
FXT_Ping={}

Events = {}
Events.Intro = 
	{ 
		{ { "Sound_SetMuteActor('Fleet')", ""}, }, 
	    { HW2_LocationCardEvent("$40901", 4 ), HW2_Wait( 4 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40902", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40903", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40904", 0), HW2_Wait( 1 ), }, 
        { 
        	{ "UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", "" }, 
        	HW2_SubTitleEvent(actor_karan, "$40905", 0), 
        	--{ "Sound_SpeechPlay('data:sound/speech/special/k_ok')", ""}, 
        }, 
        { HW2_SubTitleEvent(actor_karan, "$40906", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40907", 0), HW2_Wait( 1 ), }, 
        { 
	        { "UI_FlashButton('NewTaskbar', 'btnAchievement', -1)", "" }, 
	        HW2_SubTitleEvent(actor_karan, "$40908", 0), 
	        HW2_Wait( 1 ), 
        }, 
		{ { "Rule_AddInterval('FXT_AchievementPopup',1)","" }, },
		{ { "Sound_SetMuteActor('')", ""}, }, 
	}
Events.Achievement = 
	{ 
        { 
        	HW2_SubTitleEvent(actor_karan, "$40909", 0), 
        	--{ "Sound_SpeechPlay('data:sound/speech/missions/tut_03/51053')", ""}, 
        	HW2_Wait( 1 ), 
        }, 
        { HW2_SubTitleEvent(actor_karan, "$40910", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40911", 0), }, 
        { 
	        { "UI_FlashButton('NewTaskbar', 'btnAchievement', -1)", "" }, 
	        HW2_SubTitleEvent(actor_karan, "$40912", 0), 
	        HW2_Wait( 1 ), 
        }, 
		{ { "Rule_AddInterval('FXT_AchievementClose',1)","" }, },
	}
Events.Ability = 
	{ 
        { HW2_SubTitleEvent(actor_karan, "$40913", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40914", 0), HW2_Wait( 1 ), }, 
        {
        	{ "FXT_EventPointer[1] = EventPointer_AddSobGroup('player_deliver', HW2_rgb(230,230,230), 100)", "", }, { "SobGroup_ExitHyperSpace('tur_mine', 'T_MinelayerSpawn')", "", },
        	HW2_SubTitleEvent(actor_karan, "$40915", 0),
        	{ "FXT_AddOBJ1()", "", }, HW2_Wait( 1 ), 
        },
		{ 
			{ "SobGroup_DeployMines('tur_mine', 'T_MinelayerClear', 1)","" }, 
			{ "Rule_AddInterval('FXT_BuildPartner', 1)","" }, 
		},
	}
Events.Mine = 
	{ 
	    { HW2_SubTitleEvent(actor_karan, "$40916", 0), HW2_Wait( 1 ), }, 
        { 
	        { "FXT_EventPointer[2] = EventPointer_AddVolume('T_MinelayerClear', HW2_rgb(230,230,230), 150)", "", }, 
	        HW2_SubTitleEvent(actor_karan, "$40917", 0), 
	        HW2_Wait( 1 ), 
        }, 
		{ { "Rule_AddInterval('FXT_ClearMines', 1)","" }, },

	}
Events.Research = 
	{ 
        { 
	        HW2_SubTitleEvent(actor_karan, "$40918", 0), 
	        --{ "Sound_SpeechPlay('data:sound/speech/missions/tut_03/51070')", ""}, 
	        HW2_Wait( 1 ), 
        }, 
        { 
        	{ "UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", "" }, 
        	HW2_SubTitleEvent(actor_karan, "$40919", 0), 
        	--{ "Sound_SpeechPlay('data:sound/speech/special/k_ok')", ""}, 
        	HW2_Wait( 1 ), 
        }, 
        { HW2_SubTitleEvent(actor_karan, "$40920", 0), HW2_Wait( 1 ), }, 
        { { "Camera_FocusSobGroupWithBuffer('ally_res1', 700, 100, 3)","",}, HW2_SubTitleEvent(actor_karan, "$40921", 10), HW2_Wait( 1 ), }, 
        {
        	{ "FXT_EventPointer[3] = EventPointer_AddSobGroup('ally_res1', HW2_rgb(230,230,230), 100)", "", }, { "FXT_EventPointer[4] = EventPointer_AddSobGroup('ally_res2', HW2_rgb(230,230,230), 100)", "", },
        	HW2_SubTitleEvent(actor_karan, "$40922", 0), HW2_Wait( 2 ),
        }, 
        { 
        	{"FXT_AddOBJ2()", "", }, 
        	{ "EventPointer_Remove(FXT_EventPointer[3])", "", }, { "EventPointer_Remove(FXT_EventPointer[4])", "", }, 
        	{ "UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", "" }, 
        	HW2_SubTitleEvent(actor_karan, "$40923", 0), HW2_Wait( 1 ), 
        	--{ "Sound_SpeechPlay('data:sound/speech/special/k_ok')", ""}, 
        }, 
        {
        	{ "FXT_EventPointer[5] = EventPointer_AddSobGroup('ally_kgate', HW2_rgb(230,230,230), 3000)", "", },
        	HW2_SubTitleEvent(actor_karan, "$40924", 0), 
        	HW2_Wait( 2 ),
        }, 
        { 
	        { "EventPointer_Remove(FXT_EventPointer[5])", "", }, 
	        { "SobGroup_SwitchOwner('ally_kgate', 0)", "", }, 
	        HW2_SubTitleEvent(actor_karan, "$40925", 0), HW2_Wait( 1 ), 
        }, 
        { { "Rule_AddInterval('FXT_BuildCore', 1)","" }, },
	}
Events.Core = 
	{
        { HW2_SubTitleEvent(actor_karan, "$40926", 0), HW2_Wait( 8 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40927", 0), HW2_Wait( 2 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40966", 0), HW2_Wait( 1 ), }, 
        { { "Rule_AddInterval('FXT_BuiltCore', 1)","" }, },
	}
Events.Core2 = 
	{
        { HW2_SubTitleEvent(actor_karan, "$40928", 0), HW2_Wait( 1 ), }, 
        { 
        	{ "UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", "" }, 
        	HW2_SubTitleEvent(actor_karan, "$40929", 0), 
        	--{ "Sound_SpeechPlay('data:sound/speech/special/k_ok')", ""}, 
			HW2_Wait( 1 ), 
		}, 
        { 
	        { "SobGroup_ExitHyperSpace('player_capture', 'CapmoverEntry')", "", },
	    },
        { HW2_SubTitleEvent(actor_karan, "$40930", 0), HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_FocusSobGroupWithBuffer('player_capture', 3000, 100, 3)","",},HW2_Wait( 1 ), },
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        {
        	{ "FXT_EventPointer[6] = EventPointer_AddSobGroup('player_capture', HW2_rgb(230,230,230), 100)", "", },
        	HW2_SubTitleEvent(actor_karan, "$40931", 0), HW2_Wait(1),
        },
        { 
        	{ "EventPointer_Remove(FXT_EventPointer[6])", "", },
        	{ "FXT_EventPointer[7] = EventPointer_AddSobGroup('tur_frig', HW2_rgb(230,230,230), 100)", "", }, 
        	HW2_SubTitleEvent(actor_karan, "$40932", 0), HW2_Wait( 1 ), 
        	
        }, 
        {
        	{ "Rule_AddInterval('FXT_TryToCapture', 1)","" }, 
        	{ "FXT_AddOBJ3()", "", },
        },
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.Capture = 
	{
		{ HW2_Wait(2), },
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_FocusSobGroupWithBuffer('tur_jam', 700, 100, 3)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_karan, "$40933", 0), HW2_Wait( 1 ), }, 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_karan, "$40934", 0), HW2_Wait( 1 ), }, 
        { { "Camera_FocusSobGroupWithBuffer('player_deliver', 3000, 100, 3)","",},HW2_Wait( 1 ), },
        {
        	{ "FXT_EventPointer[8] = EventPointer_AddSobGroup('player_deliver', HW2_rgb(230,230,230), 100)", "", },
        	{ "UI_FlashButton('SubtitleInputScreen', 'btnLaunch', -1)", "" }, 
        	HW2_SubTitleEvent(actor_karan, "$40935", 0), HW2_Wait( 1 ),         	
        }, 
        {
        	{ "Sensors_Toggle(0)", "" , },
        	{ "EventPointer_Remove(FXT_EventPointer[8])", "", }, 
        	HW2_Wait(1), 
        },
        { {"SobGroup_SetInvulnerability('tur_jam', 0)", "", }, },
        { { "Rule_AddInterval('FXT_Deliver', 1)","" }, },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.Deliver = 
	{
		{ HW2_Wait(7), },
		{ {"SobGroup_SwitchOwner('ally_deliver', 0)", "", }, },
        { { "Camera_FocusSobGroupWithBuffer('ally_deliver', 2000, 100, 3)","",},HW2_Wait( 1 ), },
        {
        	{ "FXT_EventPointer[9] = EventPointer_AddSobGroup('ally_deliver', HW2_rgb(230,230,230), 100)", "", },
        	HW2_SubTitleEvent(actor_karan, "$40936", 0), HW2_Wait( 13 ),
        }, 
        { { "Rule_AddInterval('FXT_Delivered', 1)","" }, },
	}
Events.Delivered = 
	{
        { { "EventPointer_Remove(FXT_EventPointer[9])", "", }, },
        { 
	        HW2_SubTitleEvent(actor_karan, "$40937", 0), 
	        --{ "Sound_SpeechPlay('data:sound/speech/special/b_clever')", ""}, 
	        HW2_Wait( 1 ), 
        }, 
        { HW2_SubTitleEvent(actor_karan, "$40938", 0), HW2_Wait( 1 ), }, 
        { 
        	HW2_SubTitleEvent(actor_karan, "$40939", 0), HW2_Wait( 1 ), 
        	{ "FXT_EventPointer[10] = EventPointer_AddSobGroup('tur_jam', HW2_rgb(230,230,230), 100)", "", },
		}, 
        { 
        	{ "Rule_AddInterval('FXT_Captured', 1)","" }, 
        	{ "EventPointer_Remove(FXT_EventPointer[9])", "", },
        },
	}
Events.Captured = 
	{
        { 
	        HW2_SubTitleEvent(actor_karan, "$40940", 0), 
	        --{ "Sound_SpeechPlay('data:sound/speech/missions/tut_01/50040_1')", ""}, 
	        HW2_Wait( 1 ), 
        }, 
        { { "UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", "" }, HW2_SubTitleEvent(actor_karan, "$40941", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40942", 0), { "SobGroup_ExitHyperSpace('plr_keeper', 'Kpr_Entry')", "", }, HW2_Wait( 1 ), }, 
        { { "Camera_FocusSobGroupWithBuffer('plr_keeper', 700, 100, 3)","",}, HW2_SubTitleEvent(actor_karan, "$40964", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40943", 0), { "SobGroup_ExitHyperSpace('vgr_bc', 'Vgr_BCEntry')", "", }, HW2_Wait( 10 ), }, 
        { { "FXT_AddOBJ4()","",}, {"Rule_AddInterval('FXT_Keeper',13)","",}, {"Rule_Add('FXT_Keeper2')","",}, },
	}
Events.Keeper1 = 
	{
        { 
	        HW2_SubTitleEvent(actor_karan, "$40944", 0), 
	        --{ "Sound_SpeechPlay('data:sound/speech/special/45544')", ""}, 
	        HW2_Wait( 1 ), 
        }, 
        { { "SobGroup_EnterHyperSpaceOffMap('vgr_bc')","",},HW2_Wait( 1 ), },
        { { "UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", "" }, HW2_SubTitleEvent(actor_karan, "$40945", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40946", 0), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_karan, "$40947", 0), HW2_Wait( 1 ), }, 
        { { "FXT_Final()","" }, { "UI_SetElementVisible('NewTaskbar','btnHW1SPHyperspace',1)", "", }, },
	}
Events.Keeper2 = 
	{
        { HW2_SubTitleEvent(actor_karan, "$40948", 0), HW2_Wait( 1 ), }, 
        { { "UI_FlashButton('SubtitleInputScreen', 'btnSubtitleOk', -1)", "" }, HW2_SubTitleEvent(actor_karan, "$40949", 0), HW2_Wait( 1 ), }, 
        { 
			{ "SobGroup_SetHealth('plr_keeper',1)","",}, 
			{ "SobGroup_AbilityActivate('plr_keeper', AB_DefenseField, 1)", "", },
			{ "SobGroup_Attack(3, 'vgr_bc', 'plr_keeper')","",}, 
			{"Rule_AddInterval('FXT_Keeper',13)","", {"Rule_Add('FXT_Keeper2')","",},}, 
		},
	}

	
	
function FXT_AchievementPopup()
	if (UI_IsScreenActive("Achievement")==1) then
		UI_StopFlashButton("NewTaskbar", "btnAchievement")
		obj_achievement=Objective_Add("$40950", OT_Primary)
		Objective_AddDescription(obj_achievement, "$40951")
		Event_Start("Achievement")
		Rule_Remove("FXT_AchievementPopup")
	end
end

function FXT_AchievementClose()
	if (UI_IsScreenActive("Achievement")==0) then
		UI_StopFlashButton("NewTaskbar", "btnAchievement")
		Objective_SetState(obj_achievement, OS_Complete)
		Event_Start("Ability")
		Rule_Remove("FXT_AchievementClose")
	end
end

function FXT_BuildPartner()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "kpr_scout")>0) then
		EventPointer_Remove(FXT_EventPointer[1])
		Event_Start("Mine")
		Rule_Remove("FXT_BuildPartner")
	end
end

function FXT_AddOBJ1()
	Player_UnrestrictBuildOption(0, "kpr_scout")
	obj_clearmine=Objective_Add("$40952", OT_Primary)
	Objective_AddDescription(obj_clearmine, "$40953")
	SobGroup_MakeUntargeted("tur_mine")
    SobGroup_AbilityActivate("tur_mine", AB_Attack, 0)
	Rule_AddInterval("FXT_SizeControl1",1)
end

function FXT_SizeControl1()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "kpr_scout")>=2) then
		Player_RestrictBuildOption(0, "kpr_scout")
	else
		Player_UnrestrictBuildOption(0, "kpr_scout")
	end
end

function FXT_SizeControl2()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "kpr_bomber")>=3) then
		Player_RestrictBuildOption(0, "kpr_bomber")
	else
		Player_UnrestrictBuildOption(0, "kpr_bomber")
	end
end

function FXT_AddOBJ2()
	SobGroup_SwitchOwner("ally_res1", 0)
	obj_production=Objective_Add("$40954", OT_Primary)
	Objective_AddDescription(obj_production, "$40955")
	Rule_AddInterval("FXT_SizeControl2",1)
end

function FXT_ClearMines()
    local numberMines = 0
    Selection_Create("AllMissiles")
    Selection_GetMissiles("AllMissiles")
    Selection_Create("IncomingMissiles")
    local defensePointString = "10,1836,3600"
    numberMines = Selection_FilterInclude("IncomingMissiles", "AllMissiles", "NearPoint", defensePointString, "200")
    if (numberMines > 0) then
    	Rule_AddInterval("FXT_ClearMinesCheck",1)
		Rule_Remove("FXT_ClearMines")
    end
end

function FXT_ClearMinesCheck()
    local numberMines = 0
    Selection_Create("AllMissiles")
    Selection_GetMissiles("AllMissiles")
    Selection_Create("IncomingMissiles")
    local defensePointString = "10,1836,3600"
    numberMines = Selection_FilterInclude("IncomingMissiles", "AllMissiles", "NearPoint", defensePointString, "200")
    if (numberMines == 0) then
		EventPointer_Remove(FXT_EventPointer[2])
		SobGroup_SetHealth("tur_mine",0)
		Objective_SetState(obj_clearmine, OS_Complete)
    	Event_Start("Research")
        Rule_Remove("FXT_ClearMinesCheck")
	elseif (numberMines > 4) then
		SobGroup_Move(2, "tur_mine","T_MinelayerClear")
    end
end

function FXT_BuildCore()
	if (Player_HasQueuedBuild(0, "kpr_researchship_1")==1) then
    	Event_Start("Core")
        Rule_Remove("FXT_BuildCore")
	end
end

function FXT_BuiltCore()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "kpr_researchship_2")==1) then
		Objective_SetState(obj_production, OS_Complete)
    	Event_Start("Core2")
        Rule_Remove("FXT_BuiltCore")
	end
end

function FXT_TryToCapture()
	if (SobGroup_PlayerIsInSensorRange("tur_jam", 0)==1) then
    	Event_Start("Capture")
		Rule_Remove("FXT_TryToCapture")
	end
end

function FXT_Deliver()
	if (SobGroup_Empty("InsideHyperspace0")==0) then
    	Event_Start("Deliver")
		Rule_Remove("FXT_Deliver")
	end
end

function FXT_Delivered()
	if (SobGroup_Empty("InsideHyperspace0")==1) then
    	Event_Start("Delivered")
		Rule_Remove("FXT_Delivered")
	end
end

function FXT_AddOBJ3()
	EventPointer_Remove(FXT_EventPointer[7])
	FXT_Ping[1] = Ping_AddSobGroup("$40956", "anomaly", "tur_frig")
	obj_capture=Objective_Add("$40957", OT_Primary)
	Objective_AddDescription(obj_capture, "$40958")
end

function FXT_Captured()
	if (SobGroup_Empty("tur_jam")==1) then
		Subtitle_Add(actor_karan, "$40965",5)
		SobGroup_SobGroupAdd("tur_jam", "tur_frig")
	end
	if (SobGroup_OwnedBy("tur_frig")==0) then
		Ping_Remove(FXT_Ping[1])
    	SobGroup_SetInvulnerability("tur_frig", 0)
    	Objective_SetState(obj_capture, OS_Complete)
    	Event_Start("Captured")
		Rule_Remove("FXT_Captured")
	end
end

function FXT_AddOBJ4()
	SobGroup_Attack(3, 'vgr_bc', 'plr_keeper')
	obj_shield=Objective_Add("$40959", OT_Primary)
	Objective_AddDescription(obj_shield, "$40960")
end

function FXT_Keeper()
	Objective_SetState(obj_shield, OS_Complete)
	Event_Start("Keeper1")
	SobGroup_Stop(3,"vgr_bc")
	Rule_Remove("FXT_Keeper")
	Rule_Remove("FXT_Keeper2")
end

function FXT_Keeper2()
	if (SobGroup_HealthPercentage("plr_keeper")<1) then
		SobGroup_AbilityActivate("plr_keeper", AB_DefenseField, 0)
		Event_Start("Keeper2")
		SobGroup_Stop(3,"vgr_bc")
		Rule_Remove("FXT_Keeper")
		Rule_Remove("FXT_Keeper2")
	end
end

function FXT_Final()
	Player_SetRU(0,Player_GetRU(0)+5000)
	Sound_SpeechPlay('data:sound/speech/allships/fleet/command_rus_transferred')
    SobGroup_AbilityActivate("player_deliver", AB_Move, 1)
    SobGroup_AbilityActivate("plr_keeper", AB_Move, 1)
    SobGroup_AbilityActivate("ally_res1", AB_Move, 1)
    SobGroup_AbilityActivate("ally_res2", AB_Move, 1)
    SobGroup_AbilityActivate("tur_frig", AB_Attack, 1)
    Player_UnrestrictBuildOption(0, "kpr_energy_ioncannon")
    Player_UnrestrictBuildOption(0, "kpr_energy_PhasedCannon")
    Player_UnrestrictBuildOption(0, "kpr_energy_photonBomb")
    Player_UnrestrictBuildOption(0, "kpr_energy_photoncannon")
    Player_UnrestrictBuildOption(0, "kpr_energy_Pulsar")
    Player_UnrestrictBuildOption(0, "kpr_energy_SuperPulsar")
    Player_UnrestrictBuildOption(0, "kpr_carrier")
    Player_UnrestrictBuildOption(0, "kpr_destroyer1")
    Player_UnrestrictBuildOption(0, "kpr_arsenalship")
    Player_UnrestrictBuildOption(0, "Kpr_Dreadnaught")
    Player_UnrestrictBuildOption(0, "kpr_sajuuks")
    Player_UnrestrictBuildOption(0, "kpr_resourcecollector")
    Player_UnrestrictBuildOption(0, "kpr_resourcecontroller")
    Player_UnrestrictBuildOption(0, "Kpr_ProximitySensor")
    Player_UnrestrictBuildOption(0, "kpr_movers")
    Player_UnrestrictBuildOption(0, "kpr_mover1")
    Player_UnrestrictBuildOption(0, "kpr_heavymover")
    Player_UnrestrictBuildOption(0, "kpr_capturemover")
    Player_UnrestrictBuildOption(0, "kpr_assaultfrigate")
    Player_UnrestrictBuildOption(0, "kpr_ioncannonfrigate")
    Player_UnrestrictBuildOption(0, "kpr_destroyerfrigate")
    Player_UnrestrictBuildOption(0, "kpr_defensefieldfrigate")
    Player_UnrestrictBuildOption(0, "kpr_researchship_3")
    SobGroup_SwitchOwner("Player_Ships1",0)
	obj_attack=Objective_Add("$40961", OT_Secondary)
	Objective_AddDescription(obj_attack, "$40962")
	Rule_Remove("FXT_SizeControl1")
	Rule_Remove("FXT_SizeControl2")
	Set_FX_Achievements_Value("TutorialComplete",1)
	Rule_AddInterval("FXT_VgrArrive",170)
end

function FXT_VgrArrive()
	SobGroup_ExitHyperSpace("vgr_fleet", "Vgr_BonusEntry")
	SobGroup_ExitHyperSpace("vgr_carrier", "Vgr_BonusEntry")
 	Rule_AddInterval("FXT_VgrAttack",10)
	Rule_Remove("FXT_VgrArrive")
end

function FXT_VgrAttack()
    SobGroup_Move(3, "vgr_carrier", "Vgr_AtkPoint")
    SobGroup_GuardSobGroup("vgr_fleet", "vgr_carrier")
    Sound_MusicPlayType("data:sound/music/battle/battle_04_alt", MUS_Ambient)
	Rule_AddInterval("FXT_FinalCheck",1)
	SobGroup_CreateSubSystem("vgr_carrier", "vgr_c_production_frigate")
	SobGroup_CreateSubSystem("vgr_carrier", "vgr_c_module_FrigateEW")
	Rule_Remove("FXT_VgrAttack")
end

function FXT_FinalCheck()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(3, "vgr_carrier")==0) then
		Objective_SetState(obj_attack, OS_Complete)
    	Sound_MusicPlayType("data:sound/music/ambient/tutorial", MUS_Ambient)
		Rule_Remove("FXT_FinalCheck")
	end
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
	Sound_SpeechSubtitlePath("speech:missions/FX_101/")
--X system entrance
	XInit("reslist.lua", "")
--
    --Camera_SetLetterboxStateNoUI(1,0)
    CPU_Enable(1, 0)
    CPU_Enable(2, 0)
    CPU_Enable(3, 0)
	Sound_EnableAllSpeech(0)
    Rule_AddInterval("Rule_DisablePlayer",0.1)
    Rule_AddInterval("Rule_Init",1)
    Rule_AddInterval("Mission_Start",1)
    Universe_Fade(1, 0)
--Achievements
		FX_Achievements_Init("FXsingleplayer")
--------
		Councilor_Switch=0
		FX_Common_Rule_OnInit()
---- Stop flash the Turtorial btn in main menu
    if writeto("$fx_done_tutorial.lua") then 
      write("FX_DONE_TUTORIAL = 1")
      writeto()
    else 
      _ALERT("Error happened when write to $fx_done_tutorial.lua")
    end
end

function Mission_Start()
    Sound_MusicPlayType("data:sound/music/ambient/tutorial", MUS_Ambient)
	Sound_EnableAllSpeech(1)
    Event_Start("Intro")
    --Rule_AddInterval("TurC_MissionFailCheck",3)
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
end

function Rule_Init()
	Camera_UseCameraPoint("Cam_Start")
	SobGroup_CreateIfNotExist("TempFocus")
	SobGroup_CreateIfNotExist("kpr_researchship_10")
	SobGroup_CreateIfNotExist("kpr_researchship_20")
	SobGroup_CreateIfNotExist("kpr_researchship_30")
	SobGroup_SetInvulnerability("tur_mine", 1)
    SobGroup_SetInvulnerability("tur_jam", 1)
    SobGroup_SetInvulnerability("tur_frig", 1)
    SobGroup_SetInvulnerability("vgr_bc", 1)
    Universe_Fade(0, 2)
    --Player_SetPlayerName(1, "$40855")
    --Player_SetPlayerName(2, "$40870")
    Player_SetPlayerName(3, "$40963")
	--Player_SetTeamColours(0, { 0.921, 0.921, 0.365, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(1, { 0.921, 0.921, 0.365, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(2, { 0.921, 0.921, 0.365, }, { 0.9, 0.9, 0.9, })
	--Player_SetTeamColours(3, { 0.365, 0.553, 0.667, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(4, {.0,.925,.521}, {.100,.100,.100})
	--Player_SetTeamColours(5, {.0,.925,.521}, {.100,.100,.100})
    SetAlliance( 0, 1)
    SetAlliance( 1, 0)
	--SobGroup_SetSwitchOwnerFlag("Kad_Ally", 0)
	SobGroup_SetSwitchOwnerFlag("tur_frig", 0)
	SobGroup_SetSwitchOwnerFlag("ally_deliver", 0)
	SobGroup_SetSwitchOwnerFlag("ally_kgate", 0)
    Sound_EnableAllSpeech(0)
    SobGroup_Resource(1,"ally_harvester")
    Rule_Remove("Rule_Init")
end

function Rule_DisablePlayer()
    SobGroup_AbilityActivate("player_deliver", AB_Move, 0)
    SobGroup_AbilityActivate("player_deliver", AB_Scuttle, 0)
    SobGroup_AbilityActivate("ally_deliver", AB_Scuttle, 0)
    SobGroup_AbilityActivate("ally_res1", AB_Scuttle, 0)
    SobGroup_AbilityActivate("ally_res2", AB_Scuttle, 0)
    SobGroup_AbilityActivate("player_capture", AB_Scuttle, 0)
    SobGroup_AbilityActivate("ally_kgate", AB_Scuttle, 0)
    SobGroup_AbilityActivate("plr_keeper", AB_Move, 0)
    SobGroup_AbilityActivate("plr_keeper", AB_Move, 0)
    SobGroup_AbilityActivate("ally_res2", AB_Move, 0)
    SobGroup_AbilityActivate("plr_keeper", AB_Move, 0)
    SobGroup_AbilityActivate("tur_frig", AB_Attack, 0)
    Player_RestrictBuildOption(0, "kpr_scout")
    Player_RestrictBuildOption(0, "kpr_energy_ioncannon")
    Player_RestrictBuildOption(0, "kpr_energy_PhasedCannon")
    Player_RestrictBuildOption(0, "kpr_energy_photonBomb")
    Player_RestrictBuildOption(0, "kpr_energy_photoncannon")
    Player_RestrictBuildOption(0, "kpr_energy_Pulsar")
    Player_RestrictBuildOption(0, "kpr_energy_SuperPulsar")
    Player_RestrictBuildOption(0, "kpr_carrier")
    Player_RestrictBuildOption(0, "kpr_destroyer1")
    Player_RestrictBuildOption(0, "kpr_arsenalship")
    Player_RestrictBuildOption(0, "Kpr_Dreadnaught")
    Player_RestrictBuildOption(0, "kpr_sajuuks")
    Player_RestrictBuildOption(0, "kpr_resourcecollector")
    Player_RestrictBuildOption(0, "kpr_resourcecontroller")
    Player_RestrictBuildOption(0, "Kpr_ProximitySensor")
    Player_RestrictBuildOption(0, "kpr_movers")
    Player_RestrictBuildOption(0, "kpr_mover1")
    Player_RestrictBuildOption(0, "kpr_heavymover")
    Player_RestrictBuildOption(0, "kpr_capturemover")
    Player_RestrictBuildOption(0, "kpr_assaultfrigate")
    Player_RestrictBuildOption(0, "kpr_ioncannonfrigate")
    Player_RestrictBuildOption(0, "kpr_destroyerfrigate")
    Player_RestrictBuildOption(0, "kpr_defensefieldfrigate")
    Player_RestrictBuildOption(0, "kpr_researchship_3")
    --Player_GrantResearchOption(0, "Kad_NebulaHealthUpgrade")
	--Player_RestrictResearchOption(0, "Kad_FighterWeaponUpgrade1")
    Rule_Remove("Rule_DisablePlayer")
end