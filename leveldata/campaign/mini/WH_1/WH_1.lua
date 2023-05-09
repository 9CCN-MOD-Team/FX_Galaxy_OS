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

g_playerID = Universe_CurrentPlayer()
g_savename={"$40715","$40716","$40717"}
g_AnomalyChecked = 0
g_KadFullAttack=0
g_CruiserCaptured = 0
TurC_EventPointer = 0
actor_scout=11
actor_worker=12
actor_carrier=6
actor_cruiser=20
TurC_HgnTarget="Kad_AttackWave2"
TurC_KadTarget="Hgn_FleetAc"

Events = {}
Events.Intro = 
	{ 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
		{ 
			{ "Universe_Fade( 1, 0 )", "", },
		},
		{ HW2_Wait(1),},
	    { HW2_LocationCardEvent("$40600", 3 ), HW2_Wait( 1 ), }, 
		{ HW2_LocationCardEvent("$40601", 4), HW2_Wait( 1 ),}, 
		{ HW2_LocationCardEvent("$40602", 12), HW2_Wait( 1 ),}, 
		{ HW2_LocationCardEvent("$40603", 13), HW2_Wait( 1 ),}, 
		--{ HW2_LocationCardEvent("$40604", 8), HW2_Wait( 1 ),}, 
		{ HW2_LocationCardEvent("$40605", 12), HW2_Wait( 1 ),}, 
	    {
	        { "Mission_Start()", "" , }, 
	    },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}

Events.intelevent_start = 
    { 
        { HW2_Wait(4), }, 
        { HW2_SubTitleEvent(actor_carrier, "$40606", 6.5), }, 
        { HW2_Wait(2), }, 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(1), },
        {
            { "Sensors_Toggle(1)", "" , }, 
        },
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_carrier, "$40607", 6), }, 
        {
            { "TurC_AddPing1()", "" , }, HW2_Wait(1),
        },
        { HW2_SubTitleEvent(actor_carrier, "$40608", 9), }, 
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_carrier, "$40609", 5.5), }, 
        {
            { "Sensors_Toggle(0)", "" , }, HW2_Wait(1),
        },
        {
            { "TurC_AddObjective1()", "" , }, 
        },
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.BeginHarvest = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1),
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'Player_Scout', 300, 300, 3 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_scout, "$40610", 12), }, 
        { HW2_Wait(1), }, 
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'Tur_Player', 1500, 1500, 3 )", "" , }, 
       	}, 
        { HW2_SubTitleEvent(actor_carrier, "$40611", 10), }, 
        { HW2_Wait(1), },
        {
            { "TurC_BeginHarvest()", "" , }, 
        },
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.ExtraLine3 = 
    { 
		{ HW2_SubTitleEvent(actor_worker, "$40612", 9), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(actor_scout, "$40613", 5.5), }, 
        { HW2_Wait(1), },
		{ HW2_SubTitleEvent(actor_worker, "$40614", 12.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(actor_scout, "$40615", 2), }, 
        { HW2_Wait(1), },
		{ HW2_SubTitleEvent(actor_worker, "$40616", 13), }, 
        { HW2_Wait(1), }, 
        --{ HW2_SubTitleEvent(actor_worker, "$40617", 10), }, 
        --{ HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_scout, "$40618", 2), }, 
        {
        	{ "Rule_AddInterval('TurC_ExtraLine1',3)", "" , }, 
        },
        { HW2_Wait(1), },
    }
Events.EnemyContact = 
    { 
	    --HW2FX_EventStartSet(1,0,"Fleet",1,0,1), 
		{ HW2_SubTitleEvent(actor_carrier, "$40619", 14), }, 
        { HW2_Wait(1), }, 
        {
        	{ "SobGroup_Clear('Player_Scout')", "" , }, 
        },
        { HW2_SubTitleEvent(actor_cruiser, "$40620", 13), }, 
        { HW2_Wait(1), },
        {
			{ "SobGroup_SobGroupAdd('Player_Scout', SobGroup_CreateShip('Tur_Ally','Tur_Scout'))", "" , }, 
        },
        { HW2_SubTitleEvent(actor_carrier, "$40621", 13), }, 
        { HW2_Wait(5), },
        {
            { "TurC_AllyReact()", "" , }, 
        },
        --HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.Unlock1 = 
    { 
	    --HW2FX_EventStartSet(1,0,"Fleet",1,0,1), 
		--{ HW2_SubTitleEvent(actor_carrier, "$40622", 4.5), }, 
        --{ HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_carrier, "$40673", 17), }, 
        {
            { "TurC_Unlock2()", "" , }, 
        },
        { HW2_Wait(1), }, 
        --{ HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_carrier, "$40623", 10), }, 
        --HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.EnemyDetected = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(1), }, 
        { 
        	{ "Camera_AltFocus( 'Kad_StartingFleet', 1 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_scout, "$40625", 10.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(actor_scout, "$40626", 6), }, 
        { HW2_Wait(1), },
		{ { "Sound_ExitIntelEvent()", "", }, HW2_Letterbox(0),},
        { HW2_Wait(4), },
        { HW2_SubTitleEvent(actor_carrier, "$40627", 12), }, 
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_carrier, "$40720", 6), }, 
        { HW2_Wait(1), },
        {
            { "TurC_AutoSave1()", "" , }, 
        },
        HW2FX_EventEndSet(1,1,1,0,0), 
    }
Events.BuildOptionGranted = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'Tur_Player', 1500, 1500, 3 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_worker, "$40628", 14), }, 
        --{ HW2_Wait(1), }, 
        --{ HW2_SubTitleEvent(actor_carrier, "$40629", 6), }, 
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_carrier, "$40630", 4.5), }, 
        {
            { "TurC_BuildOptionGrant()", "" , }, 
        },
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.KadFullAttack = 
    { 
        { 
        	{ "Rule_AddInterval('TurC_HgnFleetArrive',3)", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_scout, "$40631", 18), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(actor_carrier, "$40632", 13), }, 
        { 
        	{ "TurC_DefendFleet()", "" , }, 
       	}, 
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.HgnFleetArrive = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(1), }, 
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'Hgn_FleetSt', 1500, 1500, 3 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_carrier, "$40633", 9), }, 
        { HW2_Wait(1), }, 
        {
            { "TurC_AutoSave(2)", "" , }, 
            { "Sensors_Toggle(1)", "" , }, 
        },
        { HW2_Wait(1), }, 
        { 
        	{ "TurC_MainBattlePointer()", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_carrier, "$40634", 6), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40635", 10.5), }, 
        {
            { "Sensors_Toggle(0)", "" , }, 
        },
        { HW2_Wait(1), }, 
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'Tur_Ally', 1500, 1500, 3 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_cruiser, "$40636", 13.5), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40637", 12), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_cruiser, "$40638", 22), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_cruiser, "$40718", 9), }, 
		{ { "Sound_ExitIntelEvent()", "", }, HW2_Letterbox(0),},
        { HW2_Wait(2), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40639", 14), }, 
        { HW2_Wait(1), }, 
        {
            --{ "TurC_RallyPointPing()", "" , }, 
            { "TurC_ForceCarrierToMove()", "" , }, 
        },
		{ HW2_SubTitleEvent(actor_carrier, "$40640", 14), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40641", 7), }, 
        HW2FX_EventEndSet(1,1,1,0,0), 
    }
Events.NewAnomaly = 
    { 
        { HW2_Wait(12), }, 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        --{ HW2_Wait(1), }, 
		--{ HW2_SubTitleEvent(actor_scout, "$40642", 14), }, 
        { HW2_Wait(1), }, 
        { 
        	{ "SobGroup_DockSobGroup('Player_Scout', 'Tur_Player')", "" , }, 
        	{ "SobGroup_Stop(0,'Tur_Player')", "", },
       	}, 
		{ HW2_SubTitleEvent(actor_carrier, "$40643", 18), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_scout, "$40644", 4), }, 
        { HW2_Wait(1), }, 
        { 
        	{ "TurC_HuntingBegin()", "" , }, 
       	}, 
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.BeingCaptured = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(actor_cruiser, "$40687", 7), }, 
        { HW2_Wait(1), }, 
        {
            { "Sensors_Toggle(1)", "" , }, 
        },
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(actor_carrier, "$40723", 11), }, 
        { HW2_Wait(1), }, 
        {
            { "TurC_RallyPointPing()", "" , }, 
        },
        { HW2_SubTitleEvent(actor_carrier, "$40724", 5), }, 
        {
            { "Sensors_Toggle(0)", "" , }, 
        },
        { HW2_Wait(1), }, 
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.AllyCaptured = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,0), 
        { HW2_Wait(1), }, 
        --{ 
        --	{ "Camera_FocusSobGroupWithBuffer( 'Tur_Ally', 1500, 1500, 3 )", "" , }, 
       	--}, 
		{ HW2_SubTitleEvent(actor_carrier, "$40645", 11), }, 
        { HW2_Wait(1), }, 
        --{ { "Camera_FocusSobGroupWithBuffer( 'Player_Scout', 500, 500, 3 )", "" , }, }, 
		{ HW2_SubTitleEvent(actor_scout, "$40646", 16.5), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_scout, "$40647", 16), }, 
        { HW2_Wait(1), }, 
		--{ HW2_SubTitleEvent(actor_carrier, "$40648", 2), }, 
        { { "Sound_EnterIntelEvent()", "", },HW2_Letterbox(1),},
        { HW2_Wait(2), }, 
        {
            { "Sensors_Toggle(1)", "" , }, 
        },
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40649", 13), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40650", 16), { "TurC_RSPointer()", "" , }, }, 
        { { "Sound_ExitIntelEvent()", "", },HW2_Letterbox(0),},
        { HW2_Wait(7), }, 
		{ HW2_SubTitleEvent(actor_worker, "$40651", 11), }, 
        --{ HW2_Wait(1), }, 
		--{ HW2_SubTitleEvent(actor_worker, "$40652", 5), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40653", 14), }, 
        { HW2_Wait(1), }, 
        {
            { "Sensors_Toggle(0)", "" , }, 
        	{ "TurC_RebuildFleet()", "" , }, 
        	{ "TurC_AutoSave(3)", "" , }, 
        },
        HW2FX_EventEndSet(1,1,1,0,0), 
    }
Events.LastAnomaly = 
    { 
		{ HW2_SubTitleEvent(actor_carrier, "$40719", 10), }, 
        { HW2_Wait(16), }, 
		{ HW2_SubTitleEvent(actor_scout, "$40654", 13), }, 
        { HW2_Wait(1), }, 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(1), }, 
        {
            { "Sensors_Toggle(1)", "" , }, 
        },
        { HW2_Wait(1), }, 
		{ 
			HW2_SubTitleEvent(actor_scout, "$40655", 13), 
		}, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40656", 13), }, 
        { HW2_Wait(1), }, 
        {
            { "Sensors_Toggle(0)", "" , }, 
        },
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40657", 13), }, 
        { HW2_Wait(1), }, 
		{ 
			{ "TurC_SecureAnomaly()", "" , }, 
		}, 
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.LastAnomalyFound = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(2), }, 
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'kpr_arsenalship', 1500, 1500, 3 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_scout, "$40658", 9.5), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_scout, "$40659", 10), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40660", 3.5), }, 
        { HW2_Wait(1), }, 
        {
            { "Sensors_Toggle(1)", "" , }, 
        },
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40661", 14.5), }, 
        { HW2_Wait(1), }, 
		--{ HW2_SubTitleEvent(actor_carrier, "$40662", 12), }, 
        --{ HW2_Wait(1), }, 
		--{ HW2_SubTitleEvent(actor_carrier, "$40663", 9), }, 
        --{ HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40664", 16), }, 
        {
            { "TurC_ArsenalPointer()", "" , }, 
        },
        { HW2_Wait(1), }, 
        {
            { "Sensors_Toggle(0)", "" , }, 
        },
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.CaptureSucceed = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(2), }, 
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'Player_Drill', 1500, 1500, 3 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_worker, "$40665", 14), }, 
        { 
        	{ "TurC_AutoDock()", "" , }, 
       	}, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40666", 16.5), }, 
        { 
        	{ "Camera_FocusSobGroupWithBuffer( 'Tur_Player', 1500, 1500, 3 )", "" , }, 
       	}, 
		{ HW2_SubTitleEvent(actor_carrier, "$40732", 20), HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_scout, "$40733", 18), HW2_Wait(3), }, 
        {
            { "Sensors_Toggle(1)", "" , }, 
            { "Universe_SlowDown(0, 0)", "" },  
        },
		{ HW2_SubTitleEvent(actor_carrier, "$40734", 16.5), HW2_Wait(1), }, 
        { { "TurC_EventPointer=EventPointer_AddSobGroup('HeavyBoss', HW2_rgb(230,230,230), 1000)", "" , }, HW2_Wait( 3 ), },
		{
			{ "EventPointer_Remove(TurC_EventPointer)", "" , }, 
			{" ping_kadfullattack = Ping_AddSobGroup('$40714', 'anomaly', 'Tur_Ally' )", "" },  
        },
        {
            { "Sensors_Toggle(0)", "" , }, 
            { "Universe_SlowDown(1, 0)", "" },  
        },
        HW2FX_EventEndSet(1,1,1,0,1), 
		{
            { "Timer_Start(0, 540)", "" , }, 
            { "Subtitle_TimeCounter( 0, 40698 )", "" },  
            { "Rule_AddInterval('Mission_FailedCounter',1)", "" },  
        },
        { HW2_Wait(3), }, 
        { 
        	{ "TurC_FinalAttack1()", "" , }, 
       	}, 
    }
Events.CaptureFailed = 
    { 
	    HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_Wait(2), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40667", 15), {"Sound_MusicPlayType('data:sound/music/battle/tur_altbattle', MUS_Ambient)","",},}, 
        --{ HW2_Wait(1), }, 
		--{ HW2_SubTitleEvent(actor_carrier, "$40668", 4), }, 
        { 
        	{ "TurC_FinalAttack3()", "" , }, 
        	HW2_SubTitleEvent(actor_carrier, "$40703", 12.5), 
       	}, 
        HW2FX_EventEndSet(1,1,1,0,1), 
    }
Events.HappyNow = 
    { 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40669", 2), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40670", 13), }, 
    }
Events.ResearchComplete = 
    { 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40721", 20), }, 
        { HW2_Wait(1), }, 
		{ HW2_SubTitleEvent(actor_carrier, "$40722", 21), }, 
    }


function Rule_PlaySaveGameLocationCard()
    Subtitle_Message("$3651", 3)
    Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function TurC_AddPing1()
	ping_anomaly={}
	ping_anomaly[1] = Ping_AddPoint( "$40675", "anomaly", "sphere_vol1" )
	ping_anomaly[2] = Ping_AddPoint( "$40676", "anomaly", "sphere_vol2" )
	ping_anomaly[3] = Ping_AddPoint( "$40677", "anomaly", "sphere_vol3" )
	ping_anomaly[4] = Ping_AddPoint( "$40678", "anomaly", "sphere_vol4" )
end

function TurC_AddObjective1()
	obj_BeginExploration = Objective_Add("$40671", OT_Primary)
	Objective_AddDescription(obj_BeginExploration, "$40672")
	Rule_AddInterval("TurC_AnomalyCheck",1)
	Player_UnrestrictBuildOption(0, "tur_scout")
end

function TurC_ExtraLine1()
	--Subtitle_Add(actor_carrier, "$40673", 10)
	SobGroup_ExitHyperSpace("Tur_Ally", "sphere_startpos2")
	Rule_AddInterval("TurC_ExtraLine2",10)
	Rule_Remove("TurC_ExtraLine1")
end

function TurC_ExtraLine2()
	Subtitle_Add(actor_cruiser, "$40674", 10)
	--Camera_FocusSobGroupWithBuffer("Tur_Ally", 1500, 1500, 3 )
	Rule_AddInterval("TurC_EnemyContact",1)
	Rule_Remove("TurC_ExtraLine2")
end

function TurC_AnomalyCheck()
	for i =1,4 do
		if (SobGroup_FillSobGroupInVolume("Player_Scout", "Player_Ships0", "sphere_vol"..i)==1) then
			g_AnomalyChecked=g_AnomalyChecked+1
			Ping_Remove(ping_anomaly[i])
			Volume_Delete("sphere_vol"..i)
			Volume_AddSphere("sphere_vol"..i, {0,0,0}, 0)
    		SobGroup_MakeUntargeted("Player_Scout")
    		SobGroup_SetSpeed("Kpr_Idle"..i, 0)
    		SobGroup_SwitchOwner("Kpr_Idle"..i, 4)
    		SobGroup_SetSpeed("Kpr_Idle5", 0)
		end
		if (g_AnomalyChecked==2) then
			g_AnomalyChecked=-3
			Subtitle_Add(actor_scout, "$40679", 24)
			break
		elseif (g_AnomalyChecked==-1) then
			Objective_SetState(obj_BeginExploration, OS_Complete)
			Rule_Remove("TurC_AnomalyCheck")
			Event_Start("BeginHarvest")
			break
		end
	end
end

function TurC_BeginHarvest()
	for i=1,2 do
		SobGroup_CreateShip("Tur_Player", "tur_resourcecollector")
	end
	obj_SetupResourcing = Objective_Add("$40680", OT_Primary)
	Objective_AddDescription(obj_SetupResourcing, "$40681")
    SobGroup_AbilityActivate("Tur_Player", AB_Move, 1)
	Rule_AddInterval("TurC_ExtraLine3",30)
	t_EnemyContact=Universe_GameTime()+180
	Rule_AddInterval("TurC_Unlock1",5)
end

function TurC_ExtraLine3()
	if (SobGroup_IsDoingAbility("Player_Ships0", AB_Harvest)==1) then
		Event_Start("ExtraLine3")
		Rule_Remove("TurC_ExtraLine3")
	end
end

function TurC_EnemyContact()
	if (Universe_GameTime()>t_EnemyContact) then
		Event_Start("EnemyContact")
		Rule_Remove("TurC_EnemyContact")
		for i=1,6 do
			SobGroup_CreateShip("Player_Ships2","kad_salvager")
		end
	end
end

function TurC_AllyReact()
	SobGroup_Resource(2,"Player_Ships2")
	SobGroup_FormStrikeGroup("Tur_Ally", "frigate line")
	SobGroup_Move(1,"Tur_Ally", "Tur_Adv1")
    SobGroup_MakeUntargeted("Player_Scout")
    SobGroup_CloakToggle("Player_Scout")
	SobGroup_FollowPath("Player_Scout", "Scout_Adv", 1, 0, 0)
	Rule_AddInterval("TurC_EnemyDetect",1)
	Rule_AddInterval("TurC_AllyEngage",5)
end

function TurC_Unlock1()
	Event_Start("Unlock1")
	Rule_Remove("TurC_Unlock1")
end

function TurC_Unlock2()
    Player_UnrestrictBuildOption(0, "tur_resourcecollector")
    Player_UnrestrictBuildOption(0, "tur_fighter")
    Player_UnrestrictBuildOption(0, "tur_garbage")
    SobGroup_CreateSubSystem("Tur_Player", "tur_ac_frigate")
    Rule_AddInterval("TurC_CollectorNumControl",1)
end

function TurC_AllyEngage()
	SobGroup_FillSobGroupInVolume("Ally_Target", "Player_Ships2", "sphere_TurEngage")
	SobGroup_Attack(1, "Tur_Ally", "Ally_Target")
end

function TurC_EnemyDetect()
	if (SobGroup_IsInVolume("Player_Scout", "Scout_Adv")==1) then
		Rule_Remove("TurC_EnemyDetect")
		SobGroup_SpawnNewShipInSobGroup(1, "rpg_inhibitor", "rpg_inhibitor", "tempvision", "sphere_tempvision")
		SobGroup_SetHidden("tempvision",1)
        Sensors_Toggle(0)
        Sensors_EnableToggle(0) 
		Event_Start("EnemyDetected")
	end
end

function TurC_AutoSave1()
	TurC_KadWaveCount=1
	TurC_KadWaveDelay={100,95,90,85,80,75,70,65}
	TurC_KadWave=
	{
		{kad_swarmer=2,kad_assaultswarmer=1,},
		{kad_swarmer=2,kad_assaultswarmer=2,kad_advancedswarmer=1,},
		{kad_swarmer=2,kad_assaultswarmer=3,kad_lanceswarmer=1,},
		{kad_swarmer=3,kad_assaultswarmer=1,kad_advancedswarmer=1,kad_advancedassaultswarmer=1,},
		{kad_swarmer=2,kad_assaultswarmer=2,kad_advancedswarmer=2,kad_advancedassaultswarmer=2,kad_multibeamfrigate=1,},
		{kad_swarmer=2,kad_assaultswarmer=3,kad_advancedswarmer=2,kad_advancedassaultswarmer=2,kad_multibeamfrigate=2,},
		{kad_swarmer=3,kad_assaultswarmer=4,kad_advancedswarmer=2,kad_multibeamfrigate=3,},
	}
    TurC_AutoSave(1)
    SobGroup_MakeDead("tempvision")
    Rule_AddInterval("TurC_EnemyEngage",20)
	Rule_AddInterval("TurC_KadWaveCreate",1)
	Rule_AddInterval("TurC_KadWaveAttack",5)
	Rule_AddInterval("TurC_KadFullAttackCheck",5)
    Sensors_EnableToggle(1)
end

function TurC_EnemyEngage()
	Subtitle_Add(actor_scout, "$40682", 13)
	Rule_Remove("TurC_EnemyEngage")
end

function TurC_KadWaveCreate()
	Rule_Remove("TurC_KadWaveCreate")
	if TurC_KadWaveCount<8 then
		for ship,num in TurC_KadWave[TurC_KadWaveCount] do
			for i=1,num do
				SobGroup_SobGroupAdd("Kad_AttackWave", SobGroup_CreateShip("Kad_StartingFleet",ship))
			end
		end
		TurC_KadWaveCount=TurC_KadWaveCount+1
		Rule_AddInterval("TurC_KadWaveCreate",TurC_KadWaveDelay[TurC_KadWaveCount])
	end
	if TurC_KadWaveCount<=6 and TurC_KadWaveCount>=4 then
		SobGroup_SobGroupAdd("Kad_AttackWave2", SobGroup_CreateShip("Kad_StartingFleet","kad_fuelpod"))
		Rule_Add("TurC_FuelPodOffLine")
	end
	if TurC_KadWaveCount==3 then
		Event_Start("BuildOptionGranted")
	elseif TurC_KadWaveCount==4 then
		Subtitle_Add(actor_scout, "$40683", 11.5)
	elseif TurC_KadWaveCount==5 then
		Subtitle_Add(actor_carrier, "$40684", 17.5)
		SobGroup_MoveToSobGroup("Kad_AttackWave2", "KadTarget")
	elseif TurC_KadWaveCount==6 then
		TurC_KadFullAttack()
		Event_Start("KadFullAttack")
		Rule_AddInterval("TurC_KadFullAttack",10)
		--SobGroup_FormStrikeGroup("Kad_AttackWave2", "frigate line")
		SobGroup_SetROE( "Kad_AttackWave2", 0)
		Sound_MusicPlayType("data:sound/music/battle/tur_battle", MUS_Ambient)
	elseif TurC_KadWaveCount==7 then
		SobGroup_MoveToSobGroup("Kad_AttackWave2", "KadTarget")
		SobGroup_SetInvulnerabilityOfHardPoint("Kad_AttackWave2", "Generic 1", 1)
	end
	if TurC_KadWaveCount>2 then
		local TurC_TurAllyAir={tur_standardcorvette=4,tur_missilecorvette=2,}
		for ship,num in TurC_TurAllyAir do
			if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(1, ship)<num) then
				SobGroup_SobGroupAdd("Tur_Ally",SobGroup_CreateShip("Tur_Ally",ship))
				break
			end
		end
	end
end

function TurC_FuelPodOffLine()
	xGroupOffline("Kad_AttackWave2")
end

function TurC_KadWaveAttack()
	--SobGroup_FillSubstract("Kad_AttackWave", "Player_Ships2", "Kad_StartingFleet")
	SobGroup_SobGroupAdd("KadTarget", "Player_Ships0")
	SobGroup_SobGroupAdd("KadTarget", "Player_Ships1")
	SobGroup_RemoveType("KadTarget", "tur_scout")
	SobGroup_RemoveType("KadTarget", "tur_vulcanfrigate")
	SobGroup_RemoveType("KadTarget", "tur_ionarrayfrigate")
	SobGroup_Attack(2,"Kad_AttackWave", "KadTarget")
end

function TurC_KadFullAttack()
	TurC_KadWaveAttack()
	SobGroup_FillProximitySobGroup("tempvision", "Kad_AttackWave2", "Tur_Player", 8000)
	if (SobGroup_Empty("tempvision")==0) then
		SobGroup_Attack(2, "tempvision", "Player_Ships0")
		if (Rule_Exists("TurC_FuelPodOffLine")==1) then
			Rule_Remove("TurC_FuelPodOffLine")
		end
		xGroupOnline("tempvision")
	else
		SobGroup_MoveToSobGroup("Kad_AttackWave2", "KadTarget")
	end
end

function TurC_BuildOptionGrant()
    Player_UnrestrictBuildOption(0, "tur_attackbomber")
    Player_UnrestrictBuildOption(0, "tur_standardcorvette")
    Player_UnrestrictBuildOption(0, "tur_missilecorvette")
    Player_UnrestrictResearchOption(0, "Tur_AirHealthUpgrade1")
    Player_RestrictResearchOption(0, "Tur_AirHealthUpgrade2")
    Player_UnrestrictResearchOption(0, "Tur_UtilityHealthUpgrade1")
    Player_RestrictResearchOption(0, "Tur_UtilityHealthUpgrade3")
    Player_UnrestrictResearchOption(0, "Tur_FrigateHealthUpgrade1")
    Player_RestrictResearchOption(0, "Tur_FrigateHealthUpgrade2")
    Player_UnrestrictResearchOption(0, "Tur_LightWeaponUpgrade1")
    Player_RestrictResearchOption(0, "Tur_LightWeaponUpgrade3")
    Player_UnrestrictResearchOption(0, "Tur_HeavyWeaponUpgrade1")
    Player_RestrictResearchOption(0, "Tur_HeavyWeaponUpgrade2")
end

--function TurC_KadFleetPing()
	--ping_kadfullattack = Ping_AddSobGroup("Kadesh Main Fleet", "anomaly", "Kad_AttackWave2" )
	--Camera_FocusSobGroupWithBuffer("Kad_AttackWave2", 2500, 2500, 3)
	--Rule_AddInterval("TurC_HgnFleetArrive",10)
--end

function TurC_DefendFleet()
	obj_DefendFleet = Objective_Add("$40685", OT_Primary)
	Objective_AddDescription(obj_DefendFleet, "$40686")
end

function TurC_HgnFleetArrive()
	if (SobGroup_Count("Kad_AttackWave2")<1) then
		SobGroup_ExitHyperSpace("Hgn_FleetSt", "sphere_HgnArrive")
		SobGroup_ExitHyperSpace("Hgn_FleetAc", "sphere_HgnArrive")
		SobGroup_CreateSubSystem("Hgn_FleetSt", "hgn_c_module_hyperspace")
		SobGroup_CreateSubSystem("Hgn_FleetSt", "hgn_c_production_fighter")
		SobGroup_CreateSubSystem("Hgn_FleetSt", "hgn_c_production_corvette")
		SobGroup_CreateSubSystem("Hgn_FleetSt", "hgn_c_production_frigate")
		Rule_Remove("TurC_HgnFleetArrive")
		SobGroup_SpawnNewShipInSobGroup(1, "rpg_inhibitor", "rpg_inhibitor", "tempvision", "sphere_HgnArrive")
		SobGroup_SetHidden("tempvision",1)
        Sensors_Toggle(0)
        Sensors_EnableToggle(0) 
		Event_Start("HgnFleetArrive")
		Rule_AddInterval("TurC_HgnFleetArrive2",10)
	elseif (SobGroup_Count("Kad_AttackWave2")<3)and(g_KadFullAttack==0) then
		SobGroup_FormStrikeGroup("Tur_Ally", "frigate line")
		TurC_AllyCharge()
		g_KadFullAttack = 1
	end
end

function TurC_HgnFleetArrive2()
	Rule_Remove("TurC_HgnFleetArrive2")
	Rule_Remove("TurC_KadWaveAttack")
	Rule_Remove("TurC_KadFullAttack")
	Rule_Remove("TurC_AllyEngage")
    Sensors_EnableToggle(1) 
    SobGroup_MakeDead("tempvision")
	SobGroup_RemoveType("Hgn_FleetSt", "hgn_ioncannonfrigate")
	Rule_AddInterval("TurC_HgnFleetGrow",5)
	Rule_AddInterval("TurC_KadFleetGrow",5)
	SobGroup_SetInvulnerability("Hgn_FleetSt", 1)
	SobGroup_Move(1,"Player_Scout","sphere_Brawl")
end

function TurC_HgnFleetGrow()
	if (SobGroup_Empty("Hgn_FleetSt")==0) then
		local TurC_HgnFleetKind={"hgn_interceptor","hgn_attackbomber","hgn_pulsarcorvette","hgn_multiguncorvette","hgn_assaultfrigate","hgn_torpedofrigate","hgn_ioncannonfrigate"}
		local iKind=TurC_HgnFleetGrowCheck(TurC_HgnFleetKind[random(1,7)])
		local iTry=0
		while (TurC_HgnFleetGrowCheck(TurC_HgnFleetKind[random(1,7)])~="")and(iTry<=10) do
			iTry=iTry+1
		end
		if (iKind~="") and ((105/61)*SobGroup_Count("Hgn_FleetAc")<SobGroup_Count("Kad_AttackWave2")) then
			SobGroup_SobGroupAdd("Hgn_FleetAc", SobGroup_CreateShip("Hgn_FleetSt",iKind))
		end
		SobGroup_FillSubstract("Kad_AttackWave2", "Player_Ships2", "Kad_AttackWave")
		SobGroup_RemoveType("Kad_AttackWave2", "kad_mothership")
		SobGroup_Attack(3,"Hgn_FleetAc", TurC_HgnTarget)
		TurC_AllyCharge()
	else
		Rule_Remove("TurC_HgnFleetGrow")
		Rule_Remove("TurC_KadFleetGrow")
	end
end

function TurC_KadFleetGrow()
	if (SobGroup_Empty("Kad_StartingFleet")==0) then
		local TurC_KadFleetKind={"kad_swarmer","kad_lanceswarmer","kad_assaultswarmer","kad_advancedswarmer","kad_advancedassaultswarmer","kad_multibeamfrigate","kad_guardianspirit"}
		local iKind=TurC_KadFleetGrowCheck(TurC_KadFleetKind[random(1,7)])
		local iTry=0
		while (TurC_KadFleetGrowCheck(TurC_KadFleetKind[random(1,7)])~="")and(iTry<=10) do
			iTry=iTry+1
		end
		if (iKind~="") and (SobGroup_Count("Kad_AttackWave2")<(105/61)*SobGroup_Count("Hgn_FleetAc")) then
			SobGroup_SobGroupAdd("Kad_AttackWave2", SobGroup_CreateShip("Kad_StartingFleet",iKind))
		end
		SobGroup_Attack(2,"Player_Ships2", TurC_KadTarget)
		if (SobGroup_Empty("Kad_AttackWave")==0) then
			SobGroup_AttackPlayer("Kad_AttackWave", 0)
		end
	else
		Rule_Remove("TurC_HgnFleetGrow")
		Rule_Remove("TurC_KadFleetGrow")
	end
end

function TurC_HgnFleetGrowCheck(iKind)
	local TurC_HgnFleetSize={hgn_interceptor=4,hgn_attackbomber=3,hgn_pulsarcorvette=3,hgn_multiguncorvette=2,hgn_assaultfrigate=5,hgn_torpedofrigate=5,hgn_ioncannonfrigate=5}
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(3, iKind)<TurC_HgnFleetSize[iKind]) then
		return iKind
	else
		return ""
	end
end

function TurC_KadFleetGrowCheck(iKind)
	local TurC_KadFleetSize={kad_swarmer=4,kad_lanceswarmer=2,kad_assaultswarmer=3,kad_advancedswarmer=2,kad_advancedassaultswarmer=2,kad_multibeamfrigate=10,kad_guardianspirit=1}
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(2, iKind)<TurC_KadFleetSize[iKind]) then
		return iKind
	else
		return ""
	end
end

function TurC_AllyCharge()
	--SobGroup_Attack(1,"Tur_Ally","Kad_AttackWave2")
	SobGroup_SetROE( "Tur_Ally", 0)
	SobGroup_RemoveType("Kad_StartingFleet", "kad_multibeamfrigate")
	SobGroup_RemoveType("Kad_StartingFleet", "kad_guardianspirit")
	SobGroup_SetInvulnerability("Kad_StartingFleet", 1)
	--SobGroup_FollowPath("Tur_Ally", "Tur_Adv", 1, 0, 1)
	SobGroup_Move(1,"Tur_Ally", "Tur_Adv2")
	if (SobGroup_HealthPercentage("Tur_Ally")<0.1) then
		SobGroup_SetHealth("Tur_Ally", 0.1)
	end
end

function TurC_MainBattlePointer()
	PointerBrawl = EventPointer_AddVolume("sphere_Brawl", HW2_rgb(230,30,30), 11000)
end

function TurC_RallyPointPing()
	ping_rallypoint = Ping_AddPoint("$40728", "anomaly", "sphere_StopTrigger2")
    SobGroup_MakeSelectable("Tur_Player", 1)
	Objective_SetState(obj_PursueEscort, OS_Complete)
end

function TurC_ForceCarrierToMove()
    SobGroup_MakeSelectable("Tur_Player", 0)
    SobGroup_MoveToSobGroup("Tur_Player", "Tur_Ally")
	Objective_SetState(obj_SetupResourcing, OS_Complete)
	Objective_SetState(obj_DefendFleet, OS_Complete)
	obj_PursueEscort = Objective_Add("$40725", OT_Primary)
	Objective_AddDescription(obj_PursueEscort, "$40726")
	Rule_AddInterval("TurC_NewAnomaly",1)
end

function TurC_NewAnomaly()
	if (SobGroup_IsShipNearPoint("Tur_Player", "sphere_Capture", 25000)==1) then
		Rule_AddInterval("TurC_NewAnomaly2",1)
		Rule_Remove("TurC_NewAnomaly")
		Rule_AddInterval("TurC_MoverCapture",10)
	end
end

function TurC_NewAnomaly2()
	if (SobGroup_IsInVolume("Tur_Player", "sphere_Capture")==1) then
		Rule_Remove("TurC_NewAnomaly2")
		Event_Start("NewAnomaly")
	end
end

function TurC_HuntingBegin()
	for i=1,10 do
		SobGroup_SetInvulnerability("Kpr_Cap"..i, 1)
	end
	Rule_AddInterval("TurC_AllyBeingCaptured",1)
	Rule_AddInterval("TurC_GiveScoutBack",1)
	Rule_Remove("TurC_MoverCapture")
	Rule_AddInterval("TurC_MoverCapture2",10)
	TurC_HgnTarget="Kpr_CapMover"
	TurC_KadTarget="Kpr_CapMover"
end

function TurC_MoverCapture()
	SobGroup_FillShipsByType("CapturedTarget1", "Player_Ships2", "kad_multibeamfrigate")
	SobGroup_FillShipsByType("CapturedTarget2", "Player_Ships2", "kad_guardianspirit")
	SobGroup_FillShipsByType("CapturedTarget3", "Player_Ships3", "hgn_assaultfrigate")
	SobGroup_FillShipsByType("CapturedTarget4", "Player_Ships3", "hgn_torpedofrigate")
	SobGroup_FillShipsByType("CapturedTarget5", "Player_Ships3", "hgn_ioncannonfrigate")
	SobGroup_FillShipsByType("CapturedTarget6", "Player_Ships3", "hgn_destroyer")
	SobGroup_FillShipsByType("CapturedTarget7", "Player_Ships1", "tur_heavycruiser")
	SobGroup_FillShipsByType("CapturedTarget8", "Player_Ships1", "tur_vulcanfrigate")
	SobGroup_FillShipsByType("CapturedTarget9", "Player_Ships1", "tur_ionarrayfrigate")
	SobGroup_Clear("CapturedTarget10")
		for i=1,9 do
			local j=10
			if (i~=1) then
				j=i-1
			end
			SobGroup_FillSobGroupInVolume("CapturedTarget"..j, "CapturedTarget"..i, "sphere_CaptureLarge")
			SobGroup_Clear("CapturedTarget"..i)
			if (SobGroup_Empty("CapturedTarget"..j)==0) then
				SobGroup_CaptureSobGroup("Kpr_Cap"..i, "CapturedTarget"..j)
			else
				SobGroup_Stop(5,"Kpr_Cap"..i)
			end
		end
	if (SobGroup_IsInVolume("Tur_Player", "sphere_Capture")==1) then
		SobGroup_CaptureSobGroup("Kpr_Cap10", "Tur_Player")
	else
		SobGroup_Stop(5,"Kpr_Cap10")
	end
end

function TurC_MoverCapture2()
	SobGroup_FillShipsByType("CapturedTarget1", "Player_Ships2", "kad_multibeamfrigate")
	SobGroup_FillShipsByType("CapturedTarget2", "Player_Ships2", "kad_guardianspirit")
	SobGroup_FillShipsByType("CapturedTarget3", "Player_Ships3", "hgn_assaultfrigate")
	SobGroup_FillShipsByType("CapturedTarget4", "Player_Ships3", "hgn_torpedofrigate")
	SobGroup_FillShipsByType("CapturedTarget5", "Player_Ships3", "hgn_ioncannonfrigate")
	SobGroup_FillShipsByType("CapturedTarget6", "Player_Ships1", "tur_heavycruiser")
	SobGroup_FillShipsByType("CapturedTarget7", "Player_Ships1", "tur_vulcanfrigate")
	SobGroup_FillShipsByType("CapturedTarget8", "Player_Ships1", "tur_ionarrayfrigate")
	SobGroup_FillShipsByType("CapturedTarget9", "Player_Ships3", "hgn_destroyer")
	SobGroup_Clear("CapturedTarget10")
	SobGroup_FillSobGroupInVolume("CapturedTarget10", "Player_Ships0", "sphere_Capture")
	if (SobGroup_AreAnyOfTheseTypes("CapturedTarget10", "tur_ionarrayfrigate, tur_vulcanfrigate, tur_siegedrillfrigate")==1) then
		local Tur_CaptureExcept = {"tur_scout","tur_attackbomber","tur_fighter","tur_standardcorvette","tur_missilecorvette","tur_minelayercorvette","tur_resourcecollector","tur_garbage","tur_carrier"}
		for index,ship in Tur_CaptureExcept do
			SobGroup_RemoveType("CapturedTarget10", ship)
		end
		for i=1,9 do
			SobGroup_CaptureSobGroup("Kpr_Cap"..i, "CapturedTarget10")
		end
	else
		for i=1,9 do
			local j=10
			if (i~=1) then
				j=i-1
			end
			SobGroup_FillSobGroupInVolume("CapturedTarget"..j, "CapturedTarget"..i, "sphere_CaptureLarge")
			SobGroup_Clear("CapturedTarget"..i)
			if (SobGroup_Empty("CapturedTarget"..j)==0) then
				SobGroup_CaptureSobGroup("Kpr_Cap"..i, "CapturedTarget"..j)
			else
				SobGroup_Stop(5,"Kpr_Cap"..i)
			end
		end
	end
	if (SobGroup_IsInVolume("Tur_Player", "sphere_Capture")==1) then
		SobGroup_CaptureSobGroup("Kpr_Cap10", "Tur_Player")
	else
		SobGroup_Stop(5,"Kpr_Cap10")
	end
end

function TurC_AllyBeingCaptured()
	SobGroup_Clear("Tur_BeingCaptured")
	SobGroup_GetSobGroupBeingCapturedGroup("Tur_Ally", "Tur_BeingCaptured")
	if (SobGroup_Empty("Tur_BeingCaptured")==0) then
		Camera_FocusSobGroupWithBuffer("Tur_BeingCaptured", 500, 500, 3 )
		Event_Start("BeingCaptured")
		SobGroup_EnterHyperSpaceOffMap("Kad_StartingFleet")
		SobGroup_EnterHyperSpaceOffMap("Hgn_FleetSt")
		Rule_Remove("TurC_AllyBeingCaptured")
		Rule_AddInterval("TurC_AllyCaptured",1)
		Rule_Remove("TurC_HgnFleetGrow")
		Rule_Remove("TurC_KadFleetGrow")
	end
end

function TurC_GiveScoutBack()
	if (SobGroup_IsDocked("Player_Scout")==1) then
		SobGroup_SwitchOwner("Player_Scout",0)
		Rule_Remove("TurC_GiveScoutBack")
	end
end

function TurC_AllyCaptured()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(1, "tur_heavycruiser")==0) then
		Rule_Remove("TurC_AllyCaptured")
		Sound_MusicPlayType("data:sound/music/ambient/tur_ambient", MUS_Ambient)
		SobGroup_MakeDead("Player_Ships1")
		g_CruiserCaptured = 1
		SobGroup_SetInvulnerability("Tur_Ally", 1)
		SobGroup_Create("CapturedShipsInsideVolume")
		SobGroup_Create("CapturedShipsOutsideVolume")
		--SobGroup_AbilityActivate("Tur_Ally", AB_Attack, 0)
		EventPointer_Remove(PointerBrawl)
		Ping_Remove(ping_rallypoint)
		Event_Start("AllyCaptured")
		Rule_AddInterval("TurC_DoNotChasePlayer",1)
	end
end

function TurC_DoNotChasePlayer()
	SobGroup_FillSobGroupInVolume("CapturedShipsInsideVolume", "Player_Ships5", "sphere_Brawl")
	SobGroup_FillSubstract("CapturedShipsOutsideVolume", "Player_Ships5", "CapturedShipsInsideVolume")
	SobGroup_Stop(5,"CapturedShipsOutsideVolume")
	SobGroup_Clear("CapturedShipsInsideVolume")
	SobGroup_Clear("CapturedShipsOutsideVolume")
end

function TurC_RebuildFleet()
	obj_RebuildFleet = Objective_Add("$40688", OT_Primary)
	Objective_AddDescription(obj_RebuildFleet, "$40689")
	g_LastAnomaly=Universe_GameTime()+80
	Rule_AddInterval("TurC_LastAnomaly",10)
    Player_UnrestrictBuildOption(0, "tur_minelayercorvette")
    Player_UnrestrictBuildOption(0, "tur_vulcanfrigate")
    Player_UnrestrictBuildOption(0, "tur_ionarrayfrigate")
    Player_UnrestrictBuildOption(0, "tur_ac_weapon")
	Player_UnrestrictBuildOption(0, "tur_ac_repair")
    Player_GrantResearchOption(0, "InstaFrigateTech")
    Player_UnrestrictResearchOption(0, "Tur_HeavyWeaponUpgrade2")
    Player_UnrestrictResearchOption(0, "Tur_CapitalWeaponUpgrade1")
    Player_RestrictResearchOption(0, "Tur_HeavyWeaponUpgrade3")
    Player_RestrictResearchOption(0, "Tur_CapitalWeaponUpgrade2")
    TurC_RSPointerRemove()
    Rule_AddInterval("TurC_FrigateNumControl",1)
end


function TurC_LastAnomaly()
	if Event_IsDone("ResearchComplete")==1 and((Universe_GameTime()>g_LastAnomaly)or(SobGroup_IsInVolume("Tur_Player", "sphere_RS1")==1)or(SobGroup_IsInVolume("Tur_Player", "sphere_RS2")==1)or(SobGroup_IsInVolume("Tur_Player", "sphere_RS3")==1)) then
		Rule_Remove("TurC_LastAnomaly")
		Event_Start("LastAnomaly")
	end
end

function TurC_LastPointer()
	Rule_Remove("TurC_LastPointer")
	if PointerLast==nil then
		PointerLast = EventPointer_AddVolume("sphere_ArsFlag", HW2_rgb(230,230,230), 15000)
		Subtitle_Add(actor_scout, "$40729",9.5)
	end
end

function TurC_RSPointer()
	PointerRS={}
	for i=1,3 do
		PointerRS[i] = EventPointer_AddVolume("sphere_RS"..i, HW2_rgb(230,230,230), 2000)
	end
	Player_UnrestrictResearchOption(0, "Tur_FateOfTheEscortFleet")
	obj_ResearchEscort = Objective_Add("$40730", OT_Secondary)
	Objective_AddDescription(obj_ResearchEscort, "$40731")
	Rule_AddInterval("TurC_ResearchComplete",1)
end

function TurC_ResearchComplete()
	if (Player_HasResearch(0, "Tur_FateOfTheEscortFleet")==1)and(Event_IsDone("LastAnomaly")==1) then
		Rule_Remove("TurC_ResearchComplete")
		Objective_SetState(obj_ResearchEscort, OS_Complete)
		Event_Start("ResearchComplete")
	end
end

function TurC_RSPointerRemove()
	for i=1,3 do
		EventPointer_Remove(PointerRS[i])
	end
end

function TurC_SecureAnomaly()
	obj_SecureAnomaly = Objective_Add("$40691", OT_Secondary)
	Objective_AddDescription(obj_SecureAnomaly, "$40692")
	Rule_AddInterval("TurC_LastAnomalyCheck",5)
	Rule_AddInterval("TurC_LastPointer",90)
end

function TurC_LastAnomalyCheck()
	if (SobGroup_PlayerIsInSensorRange("kpr_arsenalship", 0)==1) then
		if PointerLast~=nil then
			EventPointer_Remove(PointerLast)
		else
			PointerLast = 0
		end
		Rule_Remove("TurC_LastAnomalyCheck")
		Event_Start("LastAnomalyFound")
	end
end

function TurC_ArsenalPointer()
	ping_arsenalship = Ping_AddSobGroup("$40693", "anomaly", "kpr_arsenalship" )
	Ping_AddDescription(ping_arsenalship, 0, "$40694")
    Player_UnrestrictBuildOption(0, "tur_siegedrillfrigate")
    g_FullAttackCountDown=Universe_GameTime()+540
	SobGroup_SetSpeed("kpr_arsenalship",0)
	SobGroup_AbilityActivate("kpr_arsenalship",AB_Attack,0)
    Rule_AddInterval("TurC_ArsenalShipCaptureCheck",5)
    Rule_AddInterval("TurC_HappyNow",5)
end

function TurC_ArsenalShipCaptureCheck()
	if (SobGroup_Empty("Player_Drill")==1) then
		SobGroup_GetSobGroupCapturingGroup("kpr_arsenalship", "Player_Drill")
	end
	if (SobGroup_OwnedBy("kpr_arsenalship")==0)then
		SobGroup_SetInvulnerability("kpr_arsenalship",1)
		SobGroup_SwitchOwner("kpr_arsenalship",4)
		Ping_Remove(ping_arsenalship)
		Event_Start("CaptureSucceed")
		for i=1,10 do
			SobGroup_SetInvulnerability("Kpr_Cap"..i, 0)
		end
		Rule_Remove("TurC_ArsenalShipCaptureCheck")
	elseif (Universe_GameTime()>g_FullAttackCountDown) then
		Event_Start("CaptureFailed")
		SobGroup_Attack(5,"Player_Ships5", "Player_Ships0")
		Objective_SetState(obj_SecureAnomaly, OS_Complete)
		Ping_Remove(ping_arsenalship)
		Rule_Remove("TurC_ArsenalShipCaptureCheck")
	end
end

function TurC_HappyNow()
	SobGroup_Clear("Tur_BeingCaptured")
	SobGroup_GetSobGroupCapturingGroup("Tur_Ally", "Tur_BeingCaptured")
	if (SobGroup_CountByPlayer("Tur_BeingCaptured",0)>0) then
		SobGroup_SetHealth("Tur_BeingCaptured",0)
		if (g_CruiserCaptured==1) then
			g_CruiserCaptured = 2
			Event_Start("HappyNow")
		end		
	end
end

function Mission_FailedCounter()
	if (Timer_GetRemaining(0)<300) then
		Subtitle_Add(actor_carrier, "$40695",7)
		Rule_Remove("Mission_FailedCounter")
		Rule_AddInterval("Mission_FailedCounter1",1)
	end
end

function Mission_FailedCounter1()
	if (Timer_GetRemaining(0)<120) then
		Subtitle_Add(actor_carrier, "$40696",12)
		Rule_Remove("Mission_FailedCounter1")
		Rule_AddInterval("Mission_FailedCounter2",1)
	end
end

function Mission_FailedCounter2()
	if (Timer_GetRemaining(0)<1) then
		Subtitle_Add(actor_carrier, "$40697",8)
		Rule_Remove("Mission_FailedCounter2")
		SobGroup_SetHealth("kpr_arsenalship",0)
		Camera_AltFocus("kpr_arsenalship",1)
		TurC_MissionFailed()
	end
end

function TurC_AutoDock()
	SobGroup_FillSobGroupInVolume("Player_Drill", "Player_Ships0", "sphere_ArsFlag")
	SobGroup_DockSobGroup("Player_Drill", "Tur_Player")
	--Rule_AddInterval("TurC_FinalAttack1",20)
end

function TurC_FinalAttack1()
	SobGroup_SetInvulnerability("Tur_Ally", 0)
	Rule_Remove("TurC_DoNotChasePlayer")
	SobGroup_AbilityActivate("Tur_Ally", AB_Attack, 1)
	SobGroup_Clear("Tur_Ally")
	Player_FillShipsByType("Tur_Ally", 5, "tur_heavycruiser")
	--SobGroup_CreateSubSystem("Tur_Ally","tur_hc_weapon")
	Rule_Remove("TurC_FinalAttack1")
	SobGroup_Clear("Kad_AttackWave")
	SobGroup_Clear("Kad_AttackWave2")
	local iArsenalAttackType={"kpr_mover_salvage", "kpr_mover1", "hgn_assaultfrigate","hgn_torpedofrigate","hgn_ioncannonfrigate","kad_multibeamfrigate","kad_guardianspirit","kpr_capturemover","tur_heavycruiser"}
	local iPlayerAttackType={"kpr_mover_salvage", "kpr_mover1", "tur_vulcanfrigate","tur_ionarrayfrigate","tur_heavycruiser","kpr_capturemover"}
	SobGroup_SobGroupAdd("Kad_AttackWave","Player_Ships5")
	SobGroup_SobGroupAdd("Kad_AttackWave2","Player_Ships5")
	for index,ship in iArsenalAttackType do
		SobGroup_RemoveType("Kad_AttackWave", ship)
	end
	for index,ship in iPlayerAttackType do
		SobGroup_RemoveType("Kad_AttackWave2", ship)
	end
	SobGroup_Attack(5,"Kad_AttackWave2", "kpr_arsenalship")
	Subtitle_Add(actor_carrier, "$40699", 19)
	Rule_AddInterval("TurC_FinalAttack2",20)
end

function TurC_FinalAttack2()
	--SobGroup_Attack(5,"Kad_AttackWave", "Tur_Player")
	Rule_Remove("TurC_FinalAttack2")
	Objective_SetState(obj_RebuildFleet, OS_Complete)
	Objective_SetState(obj_SecureAnomaly, OS_Complete)
	Sound_MusicPlayType("data:sound/music/battle/tur_altbattle", MUS_Ambient)
	--Subtitle_Add(actor_carrier, "$40700", 10)
	Rule_AddInterval("TurC_DestroyCruiser",12)
	local TurC_FinalWaveAir={tur_fighter=6,tur_attackbomber=4,tur_standardcorvette=3,tur_missilecorvette=2,}
	for ship,num in TurC_FinalWaveAir do
		while (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(5, ship)<num) do
			SobGroup_SobGroupAdd("Kad_AttackWave",SobGroup_CreateShip("Tur_Ally",ship))
		end
	end
	SobGroup_GuardSobGroup("Kad_AttackWave", "Tur_Ally")
end

function TurC_FinalAttack3()
	SobGroup_SetInvulnerability("Tur_Ally", 0)
	Rule_Remove("TurC_DoNotChasePlayer")
	SobGroup_AbilityActivate("Tur_Ally", AB_Attack, 1)
	SobGroup_Clear("Tur_Ally")
	Player_FillShipsByType("Tur_Ally", 5, "tur_heavycruiser")
	--SobGroup_CreateSubSystem("Tur_Ally","tur_hc_weapon")
	SobGroup_Clear("Kad_AttackWave")
	--SobGroup_Clear("Kad_AttackWave2")
	local iArsenalAttackType={"kpr_arsenalship","kpr_mover_salvage", "kpr_mover1", "kpr_capturemover","tur_heavycruiser"}
	SobGroup_SobGroupAdd("Kad_AttackWave","Player_Ships5")
	--Player_FillShipsByType("Kad_AttackWave2", 5, "tur_heavycruiser")
	for index,ship in iArsenalAttackType do
		SobGroup_RemoveType("Kad_AttackWave", ship)
	end
	--SobGroup_Attack(5,"Kad_AttackWave", "Tur_Player")
	SobGroup_GuardSobGroup("Kad_AttackWave", "Tur_Ally")
	Objective_SetState(obj_RebuildFleet, OS_Complete)
	Objective_SetState(obj_SecureAnomaly, OS_Failed)
	Sound_MusicPlayType("data:sound/music/battle/tur_altbattle", MUS_Ambient)
	obj_DestroyCruiser = Objective_Add("$40701", OT_Primary)
	Objective_AddDescription(obj_DestroyCruiser, "$40702")
	ping_kadfullattack = Ping_AddSobGroup("$40714", "anomaly", "Tur_Ally" )
	Rule_AddInterval("TurC_CruiserDestroyCheck",5)
end

function TurC_DestroyCruiser()
	Rule_Remove("TurC_DestroyCruiser")
	Subtitle_Add(actor_carrier, "$40703", 12.5)
	ping_kadfullattack = Ping_AddSobGroup("$40714", "anomaly", "Tur_Ally" )
	obj_DestroyCruiser = Objective_Add("$40704", OT_Primary)
	Objective_AddDescription(obj_DestroyCruiser, "$40705")
	Rule_AddInterval("TurC_CruiserDestroyCheck",5)
end

function TurC_CruiserDestroyCheck()
	--_ALERT(SobGroup_IsDoingAbility("Tur_Ally", AB_Attack))
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(5, "tur_heavycruiser")==0) then
		Objective_SetState(obj_DestroyCruiser, OS_Complete)
		Subtitle_Add(actor_carrier, "$40727", 17)
		Rule_Remove("TurC_CruiserDestroyCheck")
		Rule_AddInterval("TurC_JumpAway",10)
	elseif (SobGroup_IsDoingAbility("Tur_Ally", AB_Attack)==0) then--if (SobGroup_OwnedBy("kpr_arsenalship")~=4) then
		if (SobGroup_UnderAttack("Tur_Ally")==0) then
			SobGroup_MoveToSobGroup("Tur_Ally", "Tur_Player")--SobGroup_AttackPlayer("Tur_Ally", 0)
		else
			SobGroup_Attack(5,"Tur_Ally", "Tur_Player")
		end
	end
end

function TurC_JumpAway()
	Camera_SetLetterboxStateNoUI(1, 2)
	SobGroup_EnterHyperSpaceOffMap("Tur_Player")
	Set_FX_Achievements_Value("KarosComplete",1)
    Universe_Fade(1, 5)
	Rule_AddInterval("TurC_MissionComplete1",5)
	Rule_Remove("TurC_JumpAway")
end

function TurC_MissionFailCheck()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "tur_carrier")==0) then
		TurC_MissionFailed()
	elseif (g_CruiserCaptured==0) then
		if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(1, "tur_heavycruiser")==0)and(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(5, "tur_heavycruiser")==0) then
			TurC_MissionFailed()
		end
	end
end

function TurC_CollectorNumControl()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "tur_resourcecollector")>=7) then
		Player_RestrictBuildOption(0, "tur_resourcecollector")
	else
		Player_UnrestrictBuildOption(0, "tur_resourcecollector")
	end
end

function TurC_FrigateNumControl()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "tur_ionarrayfrigate")>=5) then
		Player_RestrictBuildOption(0, "tur_ionarrayfrigate")
	else
		Player_UnrestrictBuildOption(0, "tur_ionarrayfrigate")
	end
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "tur_vulcanfrigate")>=5) then
		Player_RestrictBuildOption(0, "tur_vulcanfrigate")
	else
		Player_UnrestrictBuildOption(0, "tur_vulcanfrigate")
	end
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "tur_SiegeDrillfrigate")>=3) then
		Player_RestrictBuildOption(0, "tur_SiegeDrillfrigate")
	else
		Player_UnrestrictBuildOption(0, "tur_SiegeDrillfrigate")
	end
end

function TurC_MissionFailed()
	Rule_AddInterval("TurC_MissionFailed1",5)
	Camera_SetLetterboxStateNoUI(1, 2)
    Universe_Fade(1, 5)
end

function TurC_MissionFailed1()
	Rule_AddInterval("TurC_MissionFailed2",5)
	Rule_Remove("TurC_MissionFailed1")
	Subtitle_Message("$40707", 3)
end

function TurC_MissionFailed2()
	Rule_Remove("TurC_MissionFailed2")
	setMissionComplete(0)
end

function TurC_MissionComplete1()
	Rule_AddInterval("TurC_MissionComplete2",5)
	Rule_Remove("TurC_MissionComplete1")
	Subtitle_Message("$40708", 3)
end

function TurC_MissionComplete2()
	Rule_Remove("TurC_MissionComplete2")
    Profile_SetSingleMissionComplete("mini", 3, 1)
    FE_ExitToMainMenu()
    UI_DialogAccept()
end





function TurC_AutoSave(iIndex)
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddIntervalParam("TurC_AutoSaveCommon", iIndex, 1)
end

function TurC_AutoSaveCommon(iIndex)
	Rule_RemoveParam("TurC_AutoSaveCommon", iIndex)
	Campaign_QuickSaveNb(tonumber(iIndex), g_savename[tonumber(iIndex)])
end

function OnInit()
--X system entrance
	XInit("reslist.lua", "")
--
    --Camera_SetLetterboxStateNoUI(1,0)
    CPU_Enable(1, 0)
    CPU_Enable(2, 0)
    CPU_Enable(3, 0)
    CPU_Enable(4, 0)
    CPU_Enable(5, 0)
    CPU_Enable(6, 0)
    Rule_AddInterval("Rule_Init",1)
    Event_Start("Intro")
    --Universe_Fade(1, 0)
--Achievements
		FX_Achievements_Init("FXsingleplayer")
--------
		Councilor_Switch=0
		FX_Common_Rule_OnInit()
end

function Mission_Start()
    Universe_Fade(0, 2)
    SobGroup_ExitHyperSpace("Tur_Player", "sphere_startpos")
	Camera_AltFocus("Tur_Player", 1)
    Rule_AddInterval("Rule_DisablePlayer",3)
    Rule_AddInterval("TurC_MissionFailCheck",3)
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
    Player_SetPlayerName(0, "$40709")
    Player_SetPlayerName(1, "$40710")
    Player_SetPlayerName(2, "$40711")
    Player_SetPlayerName(3, "$40712")
    Player_SetPlayerName(4, "$40713")
    Player_SetPlayerName(5, "$40713")
	--Player_SetTeamColours(0, { 0.921, 0.921, 0.365, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(1, { 0.921, 0.921, 0.365, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(2, { 0.921, 0.921, 0.365, }, { 0.9, 0.9, 0.9, })
	--Player_SetTeamColours(3, { 0.365, 0.553, 0.667, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(4, {.0,.925,.521}, {.100,.100,.100})
	--Player_SetTeamColours(5, {.0,.925,.521}, {.100,.100,.100})
    SetAlliance( 0, 1)
    SetAlliance( 1, 0)
    SetAlliance( 0, 4)
    SetAlliance( 4, 0)
    SetAlliance( 1, 4)
    SetAlliance( 4, 1)
	SobGroup_SetSwitchOwnerFlag("Player_Scout", 0)
	SobGroup_SetSwitchOwnerFlag("HeavyBoss", 0)
	SobGroup_SetSwitchOwnerFlag("Tur_Ally", 0)
	SobGroup_SetSwitchOwnerFlag("kpr_arsenalship", 0)
    Sound_MusicPlayType("data:sound/music/ambient/tur_ambient", MUS_Ambient)
    Sound_EnableAllSpeech(0)
    Rule_Remove("Rule_Init")
end

function Rule_DisablePlayer()
    SobGroup_AbilityActivate("Tur_Player", AB_Move, 0)
    SobGroup_AbilityActivate("Tur_Player", AB_Scuttle, 0)
    SobGroup_CreateSubSystem("Tur_Player", "tur_ac_weapon")
    NameSobGroup("HeavyBoss", "$40735")
    Player_RestrictBuildOption(0, "tur_scout")
    Player_RestrictBuildOption(0, "tur_resourcecollector")
    Player_RestrictBuildOption(0, "tur_minelayercorvette")
    Player_RestrictBuildOption(0, "tur_ionarrayfrigate")
    Player_RestrictBuildOption(0, "tur_vulcanfrigate")
    Player_RestrictBuildOption(0, "tur_vulcanfrigate")
    Player_RestrictBuildOption(0, "tur_Energyfrigate")
    Player_RestrictBuildOption(0, "tur_SiegeDrillfrigate")
    Player_RestrictBuildOption(0, "tur_resourcecontroller")
    Player_RestrictBuildOption(0, "tur_cloakgenerator")
    Player_RestrictBuildOption(0, "tur_Garbage")
    Player_RestrictBuildOption(0, "tur_shipyard")
    Player_RestrictBuildOption(0, "tur_ac_frigate")
    Player_RestrictBuildOption(0, "tur_ac_hyperspace")
    Player_RestrictBuildOption(0, "tur_ac_heavymissile")
    Player_RestrictBuildOption(0, "tur_ac_weapon")
    Player_RestrictBuildOption(0, "tur_ac_raid")
    Player_RestrictBuildOption(0, "tur_ac_repair")
    Player_RestrictBuildOption(0, "tur_fighter")
    Player_RestrictBuildOption(0, "tur_attackbomber")
    Player_RestrictBuildOption(0, "tur_standardcorvette")
    Player_RestrictBuildOption(0, "tur_missilecorvette")
    Player_RestrictBuildOption(0, "tur_torpedocorvette")
    Player_GrantResearchOption(0, "scoutCloakTech")
    Player_GrantResearchOption(1, "scoutCloakTech")
    Player_GrantResearchOption(1, "Tur_FrigateHealthUpgrade1")
    Player_GrantResearchOption(1, "Tur_FrigateHealthUpgrade2")
    Player_GrantResearchOption(0, "Tur_DrillSpeedUpgrade")
	Player_RestrictResearchOption(0, "Tur_LightWeaponUpgrade1")
	Player_RestrictResearchOption(0, "Tur_HeavyWeaponUpgrade1")
	Player_RestrictResearchOption(0, "Tur_CapitalWeaponUpgrade1")
	Player_RestrictResearchOption(0, "Tur_AirHealthUpgrade1")
	Player_RestrictResearchOption(0, "Tur_FrigateHealthUpgrade1")
	Player_RestrictResearchOption(0, "Tur_UtilityHealthUpgrade1")
	Player_RestrictResearchOption(0, "Tur_FateOfTheEscortFleet")
    Rule_Remove("Rule_DisablePlayer")
    Event_Start("intelevent_start")
end