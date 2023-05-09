--加载公共规则
dofilepath("data:scripts/rules/common.rule")
--主菜单切换代码
dofilepath("data:scripts/FX_SwitchMainMenu.lua")
--加载LW库
dofilepath("data:scripts/LW_functions.lua")
--成就系统管理代码
dofilepath("data:scripts/FX_AchievementControl.lua")
--加载X系统文件
dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")
------
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
--dofilepath("data:scripts/SCAR/DT.lua")
dofilepath("data:scripts/SCAR/Location_Card.lua")
dofilepath("locale:leveldata/campaign/DT_1/textlen.lua")

obj_prim_destroywaveone = "$40532"
obj_prim_destroywaveone_id = 0
obj_prim_destroywavetwo = "$40534"
obj_prim_destroywavetwo_id = 0
obj_prim_detectwavethree = "$40536"
obj_prim_detectwavethree_id = 0
obj_prim_keepalive = "$40540"
obj_prim_keepalive_id = 0
obj_prim_run = "$40574"
obj_prim_run_id = 0
obj_prim_protectmakaan = "$40542"
obj_prim_protectmakaan_id = 0
obj_prim_protectstation = "$40555"
obj_prim_protectstation_id = 0
obj_prim_protectstation2 = "$40576"
obj_prim_protectstation2_id = 0
g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
g_pointer_default = 0
g_save_id = 0
ping_wavethree = "$40538"
ping_wavethree_id = 0

Events = {}
Events.intelevent_start = 
    { 
        { 
            { "Camera_AllowControl(0)", "", }, 
            { "Sensors_EnableCameraZoom( 0 )", "", }, 
            { "Universe_EnableSkip(1)", "", }, }, 
	{ HW2_Wait( 1 ), },
        { 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(27, "$40500", 12), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(27, "$40501", 11), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(26, "$40502", 4), }, 
        { HW2_Wait(1), }, 
        { 
            { "SobGroup_FormHyperspaceGate('Player_Hyperspacegate1', 'Player_Hyperspacegate2')", "", }, HW2_Wait(2), }, 
        { HW2_Wait(9), }, 
        {
            { "Camera_FocusSobGroupWithBuffer( 'Player_CarrierLS', 2000, 2000, 3 )", "" , }, }, 
        { 
            { "SobGroup_Attack(1, 'AI_Fighters0', 'Player_Resourcecollector')", "", }, }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(26, "$40503", 4.5), }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'Player_Hyperspacegate1', 2000, 2000, 3 )", "" , }, HW2_SubTitleEvent(27, "$40504", 17), }, 
        { HW2_SubTitleEvent(27, "$40505", 6.5), }, 
        { HW2_SubTitleEvent(26, "$40506", 4), }, 
        { 
	    { "SobGroup_Launch('Player_Fighters', 'Player_Sadisishaba')", "", }, 
	    { "Rule_Add('Rule_Setoff')", "", }, 
            { "Camera_Interpolate('here', 'Cam_Start0', 3)", "" , }, HW2_SubTitleEvent(27, "$40507", 6.5), },
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(28, "$40508", 7), }, 
        { 
            { "obj_prim_destroywaveone_id = Objective_Add( obj_prim_destroywaveone, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_destroywaveone_id, '$40533')", "", }, }, 
        { 
            { "Camera_AllowControl(1)", "", }, 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Sensors_EnableCameraZoom( 1 )", "", }, 
            { "Universe_EnableSkip(0)", "", }, 
            { "Camera_FocusSobGroupWithBuffer( 'Player_Hyperspacegate1', 2000, 2000, 3 )", "" , }, 
        }, 
    }
Events.intelevent_protectresourcepoint = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(26, "$40509", 4.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(28, "$40510", 2.5), }, 
        { HW2_Wait(1), }, 
        {
            { "SobGroup_DockSobGroup('Player_Fighters', 'Player_CarrierLS')", "", }, }, 
        {
            { "Camera_FocusSobGroupWithBuffer( 'Player_Sadisishaba', 2000, 2000, 3 )", "" , }, HW2_SubTitleEvent(27, "$40511", 11), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(27, "$40512", 18), }, 
        { HW2_Wait(1), }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'Player_CarrierLS', 2000, 2000, 3 )", "" , }, HW2_SubTitleEvent(26, "$40513", 9.5), },
        { HW2_Wait(1), }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
        }, 
    }
Events.intelevent_destroywavetwo = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", },HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(26, "$40514", 11.5), }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'AI_Fighters2', 2000, 2000, 3 )", "" , }, HW2_SubTitleEvent(27, "$40515", 17), }, 
        { HW2_SubTitleEvent(26, "$40516", 4.5), }, 
        { HW2_Wait(1), }, 
        { 
            { "obj_prim_destroywavetwo_id = Objective_Add( obj_prim_destroywavetwo, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_destroywavetwo_id, '$40535')", "", }, }, 
        { 
            { "SobGroup_SwitchOwner('Player_Resourcecollector', 0)", "", }, 
            { "SobGroup_SwitchOwner('Player_Resourcecontroller', 0)", "", }, }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
        }, 
    }
Events.intelevent_detectwavethree = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(27, "$40517", 11), }, 
        { HW2_Wait(1), }, 
        { 
            { "Player_UnrestrictBuildOption(0, 'vgr_bomber')", "", }, }, 
        { 
            { "Sensors_Toggle( 1 )", "", }, }, 
        { HW2_Wait(2), }, 
        {
            { "g_pointer_default = HW2_CreateEventPointerVolume( 'Point1' )", "", }, 
            { "ping_wavethree_id = Ping_AddPoint( ping_wavethree, 'anomaly', 'Point1' )", "", }, 
            { "Ping_AddDescription(ping_wavethree_id, 0, '$40539')", "", }, 
            { "Subtitle_TimeCounter( 1, 40577 )", "", }, }, 
        { HW2_SubTitleEvent(27, "$40518", 13), }, 
        { HW2_Wait(1), }, 
        { 
            { "SobGroup_SwitchOwner('Player_Scout', 0)", "", }, }, 
        { 
            { "obj_prim_detectwavethree_id = Objective_Add( obj_prim_detectwavethree, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_detectwavethree_id, '$40537')", "", }, }, 
        { 
            { "EventPointer_Remove(g_pointer_default)", "", }, 
            { "Sensors_Toggle( 0 )", "", }, HW2_Wait(2), }, 
        { HW2_SubTitleEvent(26, "$40519", 3), }, 
        { HW2_Wait(1), }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
             { "Universe_EnableSkip(0)", "", }, 
        }, 
    }
Events.intelevent_wavethreedetected = 
    { 
        { 
            { "Universe_AllowPlayerOrders( 0 )", "", }, 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'Player_Scout', 2000, 2000, 3 )", "" , }, 
            HW2_SubTitleEvent(26, "$40520", 14), 
            { "Sound_MusicPlay('Data:sound/music/battle/battle_01')", ""},
        }, 
        { HW2_Wait(3), }, 
        { HW2_SubTitleEvent(26, "$40521", 12), }, 
        { 
            { "SobGroup_SetHealth('Player_Scout', 0)", "", }, HW2_SubTitleEvent(26, "$40522", 11.5), 
            { "Sensors_Toggle( 1 )", "", }, }, 
        { 
            { "Universe_AllowPlayerOrders( 1 )", "", }, }, 
        { HW2_Wait(1), }, 
        { 
            { "Sensors_Toggle( 0 )", "", }, }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(27, "$40523", 11), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(27, "$40524", 13), }, 
        { HW2_Wait(1), }, 
        { 
            { "obj_prim_keepalive_id = Objective_Add( obj_prim_keepalive, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_keepalive_id, '$40541')", "", }, }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
        }, 
    }
Events.intelevent_run = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'AI_Wavethree2', 2000, 2000, 3 )", "" , }, }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(26, "$40559", 11), }, 
        { HW2_Wait(1), }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'Player_CarrierLS', 2000, 2000, 3 )", "" , }, HW2_SubTitleEvent(26, "$40560", 12.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(27, "$40561", 8), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(27, "$40562", 9), }, 
        { HW2_Wait(1), }, 
        { 
            { "obj_prim_run_id = Objective_Add( obj_prim_run, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_run_id, '$40575')", "", }, 
            { "SobGroup_AbilityActivate('Player_CarrierLS', AB_Move, 1)", "",},
        }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
        }, 
    }
Events.intelevent_agamemnonappears = 
    { 
        { 
            { "Camera_AllowControl(0)", "", },
            { "Camera_Interpolate('here', 'Cam_Start1', 2)", "", }, 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(27, "$40526", 7), }, 
        { 
            { "SobGroup_ExitHyperSpace('Player_Agamemnon', 'Point2')", "", }, 
            { "Sound_MusicPlay('Data:sound/music/battle/battle_keeper')", ""},
        }, 
        { HW2_Wait(5), }, 
        { 
            { "Camera_Interpolate('here', 'Cam_Start11', 9)", "", }, 
		}, 
        { HW2_SubTitleEvent(Actor_Makaan, "$40527", 3), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(Actor_Makaan, "$40528", 11.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(Actor_Makaan, "$40529", 16.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(Actor_Makaan, "$40550", 8), }, 
	{ 
	    { "Camera_AllowControl(1)", "", }, }, 
        { HW2_Wait(2), }, 
        { HW2_SubTitleEvent(27, "$40551", 22), }, 
        { HW2_Wait(1), }, 
        { 
            { "obj_prim_protectmakaan_id = Objective_Add( obj_prim_protectmakaan, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_protectmakaan_id, '$40543')", "", }, }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'Player_CarrierLS', 2000, 2000, 3 )", "" , }, }, 
        { HW2_SubTitleEvent(26, "$40552", 21), }, 
        { HW2_Wait(1), }, 
        { 
            { "Camera_UseCameraPoint( 'Cam_Start6' )", "", }, }, 
        { 
            { "SobGroup_ExitHyperSpace('AI_Leftwave', 'Point14')", "", }, HW2_SubTitleEvent(27, "$40563", 8.5), }, 
        { HW2_Wait(1), }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "SobGroup_SetInvulnerability('Player_CarrierLS', 0)", "",},
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
            { "Camera_FocusRestore()", "", }, 
        }, 
    }
Events.intelevent_aiwavetwoarrive = 
    { 
        { 
            { "Camera_UseCameraPoint( 'Cam_Start7' )", "", }, 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
        }, 
        { 
            { "SobGroup_ExitHyperSpace('AI_Rightwave', 'Point15')", "", }, HW2_SubTitleEvent(27, "$40564", 4), }, 
        { HW2_SubTitleEvent(27, "$40565", 10), }, 
        { HW2_Wait(1), }, 
        {
        	{ "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), 
            { "SobGroup_ExitHyperSpace('AI_Carrier1', 'Point18')", "", }, HW2_Wait(1), 
            { "SobGroup_ExitHyperSpace('AI_Carrier2', 'Point20')", "", }, HW2_SubTitleEvent(27, "$40566", 14), 
            { "Camera_FocusSobGroupWithBuffer('AI_Carrier1', 2500, 2500, 3)", "", }, 
        }, 
        { HW2_Wait(6), }, 
        { HW2_SubTitleEvent(27, "$40567", 14), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(27, "$40568", 4), }, 
        { HW2_Wait(1), }, 
        { 
            { "obj_prim_protectstation_id = Objective_Add( obj_prim_protectstation, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_protectstation_id, '$40573')", "", }, }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
            { "Camera_FocusRestore()", "", }, 
        }, 
    }
Events.intelevent_carriersarrive = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { 
            { "Camera_UseCameraPoint( 'Cam_Start3' )", "", }, 
            { "SobGroup_ExitHyperSpace('Player_Carrier2', 'Point19')", "", }, HW2_Wait(6), }, 
        { HW2_SubTitleEvent(28, "$40569", 15), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(28, "$40570", 2.5), }, 
        { HW2_Wait(2), }, 
        { HW2_SubTitleEvent(27, "$40571", 5), }, 
        { HW2_Wait(1), }, 
        { 
            { "obj_prim_protectstation2_id = Objective_Add( obj_prim_protectstation2, OT_Primary )", "", }, 
            { "Objective_AddDescription( obj_prim_protectstation2_id, '$40572')", "", }, }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
            { "Camera_FocusRestore()", "", }, 
        }, 
    }
Events.intelevent_waveonearrive = 
    { 
        { 
            { "Camera_UseCameraPoint( 'Cam_Start8' )", "", }, 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { 
            { "SobGroup_ExitHyperSpace('Player_Carrier0', 'Point16')", "", }, HW2_Wait(6), }, 
        { HW2_SubTitleEvent(28, "$40553", 9), }, 
        { HW2_Wait(1), }, 
        { 
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2), 
            { "Universe_EnableSkip(0)", "", }, 
            { "Camera_FocusRestore()", "", }, 
        }, 
    }
Events.intelevent_wavetwoarrive = 
    { 
        { 
            { "Camera_UseCameraPoint( 'Cam_Start9' )", "", }, 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, }, 
        { 
            { "SobGroup_ExitHyperSpace('Player_Carrier1', 'Point17')", "", }, HW2_Wait(6), }, 
        { HW2_SubTitleEvent(28, "$40554", 15), }, 
        { HW2_Wait(1), }, 
        { 
            { "Sound_SetMuteActor('')", "", }, 
            { "Universe_EnableSkip(0)", "", }, 
            { "Camera_FocusRestore()", "", }, 
        }, 
    }
Events.intelevent_playerwins = 
    { 
        { 
            { "Universe_AllowPlayerOrders( 0 )", "", }, 
            { "Universe_EnableSkip(1)", "", }, 
            { "Sound_EnterIntelEvent()", "", }, 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sensors_EnableCameraZoom( 0 )", "", }, 
            { "Sensors_Toggle( 0 )", "", }, 
            { "SobGroup_DeSelectAll()", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(26, "$40556", 11), }, 
        { HW2_Wait(1), }, 
        { 
            { "Camera_FocusSobGroupWithBuffer( 'Player_Sadisishaba', 2000, 2000, 3 )", "" , HW2_Wait(3), }, 
            { "SobGroup_ExitHyperSpace('Player_Carrier4', 'Point8')", "", HW2_Wait(3), }, 
        }, 
        { HW2_Wait(10), }, 
		{ 
	    	{ "Player_InstantDockAndParade( 0, 'Player_CarrierLS', 0 )", "", }, 
	    }, 
        { 
            { "Universe_Fade( 1, 2 )", "", }, }, 
        { HW2_LocationCardEvent("$40545", 5.5), }, 
        { HW2_Wait(2), }, 
        { 
	    	{ "Profile_SetSingleMissionComplete('mini', 2, 1)", "", }, 
	    	{ "FE_ExitToMainMenu()", "", }, 
	    	{ "UI_DialogAccept()", "", }, 
        }, 
    }
Events.intelevent_playerloses0 = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, }, 
        { 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(26, "$40557", 5.5), }, 
        { HW2_Wait(1), }, 
        { 
            { "Universe_Fade( 1, 2 )", "", }, HW2_Wait(3), }, 
        { HW2_LocationCardEvent("$40544", 5.5), }, 
        { HW2_Wait(2), }, 
        { 
            { "Camera_AllowControl(1)", "", }, 
            { "setMissionComplete( 0 )", "", }, 
        }, 
    }
Events.intelevent_playerloses1 = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, }, 
        { 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(26, "$40530", 5.5), }, 
        { HW2_Wait(1), }, 
        { 
            { "Universe_Fade( 1, 2 )", "", }, HW2_Wait(3), }, 
        { HW2_LocationCardEvent("$40544", 5.5), }, 
        { HW2_Wait(2), }, 
        { 
            { "Camera_AllowControl(1)", "", }, 
            { "setMissionComplete( 0 )", "", }, 
        }, 
    }
Events.intelevent_playerloses2 = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, }, 
        { 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(27, "$40531", 5.5), }, 
        { HW2_Wait(1), }, 
        { 
            { "Universe_Fade( 1, 2 )", "", }, HW2_Wait(3), }, 
        { HW2_LocationCardEvent("$40544", 5.5), }, 
        { HW2_Wait(2), }, 
        { 
            { "Camera_AllowControl(1)", "", }, 
            { "setMissionComplete( 0 )", "", }, 
        }, 
    }
Events.intelevent_playerloses3 = 
    { 
        { 
            { "Universe_EnableSkip(1)", "", }, }, 
        { 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, HW2_Letterbox(1), HW2_Wait(2), }, 
        { HW2_SubTitleEvent(27, "$40558", 5.5), }, 
        { HW2_Wait(1), }, 
        { 
            { "Universe_Fade( 1, 2 )", "", }, HW2_Wait(3), }, 
        { HW2_LocationCardEvent("$40544", 5.5), }, 
        { HW2_Wait(2), }, 
        { 
            { "Camera_AllowControl(1)", "", }, 
            { "setMissionComplete( 0 )", "", }, 
        }, 
    }
function Rule_PlaySaveGameLocationCard()
    Subtitle_Message("$3651", 3)
    Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function OnInit()
--X system entrance
	XInit("reslist.lua", "")
--
    Camera_SetLetterboxStateNoUI(1,0)
    CPU_Enable(1, 0)
    CPU_Enable(2, 0)
    Rule_Add("Rule_Init")
    Universe_Fade(1, 0)
		FX_Achievements_Init("DTsingleplayer")
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
		--X System Reload
		XInitOnLoad()
end

function Rule_Init()
    Camera_SetLetterboxStateNoUI(0,0)
    Camera_Interpolate("here", "Cam_Start4", 11)
    Universe_Fade(0, 6)
    DT_L(1, 3)
    SetAlliance( 0, 2)
    SetAlliance( 2, 0)
    Rule_Remove("Rule_Init")
end

function Rule_Start()
    --DT()
    UI_SetElementVisible("ResourceMenu", "SupportUnitsFrame", 0)
    Sound_MusicPlayType("data:sound/music/ambient/AMB_03", MUS_Ambient)
    Sound_SpeechSubtitlePath("speech:missions/DT_1/")
    Player_SetPlayerName(0, "$40547")
    Player_SetPlayerName(1, "$40548")
    Player_SetPlayerName(2, "$40549")
	dofilepath("player:PLAYERCFG.LUA")
    SobGroup_Resource( 1, "Player_Resourcecollector")
    Event_Start("intelevent_start")
    Rule_Add("Rule_DisablePlayer")
    Rule_Add("Rule_Startset")
    Rule_Add("Rule_PlayerWins")
    Rule_Add("Rule_Save1")
    Rule_Add("Rule_PlayerLose")
    Sound_EnableAllSpeech(0)
end

function Rule_DisablePlayer()
    SobGroup_SetSpeed("AI_Fighters0", 0.3)
    SobGroup_AbilityActivate("Player_Scout", AB_Attack, 0)
    SobGroup_AbilityActivate("Player_CarrierLS", AB_Guard, 0)
    SobGroup_AbilityActivate("Player_CarrierLS", AB_Move, 0)
    SobGroup_AbilityActivate("Player_CarrierLS", AB_Scuttle, 0)
    SobGroup_CreateSubSystem("Player_CarrierLS", "Vgr_C_Module_NuclearBomb")
    Player_RestrictBuildOption(0, "Vgr_Destroyer")
    Player_RestrictBuildOption(0, "Vgr_BattleCruiser")
    Player_RestrictBuildOption(0, "Vgr_Shipyard")
    Player_RestrictBuildOption(0, "Vgr_Probe")
    Player_RestrictBuildOption(0, "Vgr_WeaponPlatform_gun")
    Player_RestrictBuildOption(0, "Vgr_ResourceCollector")
    Player_RestrictBuildOption(0, "Vgr_ResourceController")
    Player_RestrictBuildOption(0, "Vgr_Scout")
    Player_RestrictBuildOption(0, "Vgr_Interceptor")
    Player_RestrictBuildOption(0, "Vgr_Bomber")
    Player_RestrictBuildOption(0, "Vgr_LanceFighter")
    Player_RestrictBuildOption(0, "Vgr_MissileCorvette")
    Player_RestrictBuildOption(0, "Vgr_LaserCorvette")
    Player_RestrictBuildOption(0, "Vgr_MinelayerCorvette")
    Player_RestrictBuildOption(0, "Vgr_CommandCorvette")
    Player_RestrictBuildOption(0, "Vgr_AssaultFrigate")
    Player_RestrictBuildOption(0, "Vgr_HeavyMissileFrigate")
    Player_RestrictBuildOption(0, "Vgr_InfiltratorFrigate")
    Player_RestrictBuildOption(0, "Vgr_WeaponPlatform_missile")
    Player_RestrictBuildOption(0, "Vgr_C_Module_FrigateInfiltrator")
    Player_RestrictBuildOption(0, "Vgr_C_Module_FrigateEW")
    Player_RestrictBuildOption(0, "Vgr_EWFighter")
    Player_RestrictBuildOption(0, "Vgr_C_Module_FrigateArtillery")
    Player_RestrictBuildOption(0, "Vgr_C_Module_CorvetteLaser")
    Player_RestrictBuildOption(0, "Vgr_C_Module_FighterLance")
    Player_RestrictBuildOption(0, "Vgr_C_Module_NuclearBomb")
    Player_RestrictBuildOption(0, "Vgr_C_Production_Frigate")
    Player_RestrictBuildOption(0, "Vgr_C_Module_Research")
    Player_RestrictBuildOption(0, "Vgr_C_MissileVolley")
    Player_RestrictBuildOption(0, "Vgr_C_MissileVolley_F")
    Player_RestrictBuildOption(0, "Vgr_C_Module_Hyperspace")
    Player_RestrictBuildOption(0, "Vgr_HyperSpace_Platform")
    Player_RestrictBuildOption(0, "Vgr_Probe_Prox")
    Player_RestrictBuildOption(0, "Vgr_Probe_ECM")
    Player_RestrictBuildOption(0, "Vgr_ArtilleryFrigate")
    Player_RestrictBuildOption(0, "Vgr_PlanetKillerMissile")
    Rule_Remove("Rule_DisablePlayer")
end

function Rule_Startset()
	NameSobGroup("Player_CarrierLS", "$40581")
    SobGroup_SetSwitchOwnerFlag("Player_Fighters", 0)
    SobGroup_SetSwitchOwnerFlag("Player_Resourcecollector", 0)
    SobGroup_SetSwitchOwnerFlag("Player_Resourcecontroller", 0)
    SobGroup_SetSwitchOwnerFlag("Player_Scout", 0)
    SobGroup_DockSobGroupInstant("Player_Fighters", "Player_Sadisishaba")
    SobGroup_DockSobGroupInstant("AI_Fighters3", "AI_Carrier1")
    SobGroup_DockSobGroupInstant("AI_Fighters5", "AI_Carrier2")
    SobGroup_DockSobGroupInstant("Player_Bombers0", "Player_Carrier0")
    SobGroup_DockSobGroupInstant("Player_Bombers1", "Player_Carrier1")
    SobGroup_DockSobGroupInstant("Player_Bombers2", "Player_Carrier2")
    SobGroup_Despawn("Player_Agamemnon")
    SobGroup_Despawn("AI_Fighters4")
    SobGroup_Despawn("AI_Wavethree1")
    SobGroup_Despawn("AI_Wavethree2")
    SobGroup_Despawn("AI_Wavethree3")
    SobGroup_Despawn("AI_Leftwave")
    SobGroup_Despawn("AI_Rightwave")
    SobGroup_Despawn("Player_Carrier0")
    SobGroup_Despawn("Player_Carrier1")
    SobGroup_Despawn("Player_Carrier2")
    SobGroup_Despawn("Player_Carrier4")
    SobGroup_EnterHyperSpaceOffMap("AI_Carrier1")
    SobGroup_EnterHyperSpaceOffMap("AI_Carrier2")
    Rule_Add("Rule_Beginfirsttest") 
    Rule_Add("Rule_BDT")
    Rule_Remove("Rule_Startset")
		Player_SetBadgeTexture(0, "DATA:Badges/Vaygr.tga")
		Player_SetTeamColours(0, { 0.1, 0.1, 0.1, }, { 0.667, 0.553, 0.365, })
		Player_SetBadgeTexture(1, "DATA:Badges/Taiidan.tga")
		Player_SetTeamColours(1, { 0.667, 0.553, 0.365, }, { 0.553, 0.365, 0.667, })
		Player_SetBadgeTexture(2, "DATA:Badges/Vaygr.tga")
		Player_SetTeamColours(2, { 0.9, 0.9, 0.9, }, { 0.1, 0.1, 0.1, })
end

function Rule_Save1()
    if  Event_IsDone("intelevent_start") == 1 then
        Rule_Add("Rule_PlaySaveGameLocationCard")
        Rule_AddInterval("Rule_Saveone", 1)
        Rule_Remove("Rule_Save1")
    end
end

function Rule_Saveone()
    Rule_Remove("Rule_Saveone")
    g_save_id = (g_save_id + 1)
    Campaign_QuickSaveNb(g_save_id, "$40578")
end

function Rule_BDT()
    if  Event_IsDone("intelevent_start") == 1 then
	UI_ShowScreen("NewTaskbar", ePopup)
	UI_ShowScreen("ResourceMenu", ePopup)
	SobGroup_SetSpeed("AI_Fighters0", 1)
	Rule_Remove("Rule_BDT")
    end
end

function Rule_Beginfirsttest()
    if  SobGroup_IsGateDeployed("Player_Hyperspacegate1", "Player_Hyperspacegate2") == 1 then
        SobGroup_UseHyperspaceGate("Player_Scout", "Player_Hyperspacegate2")
        Rule_Add("Rule_Waveonedestroyed") 
        Rule_Remove("Rule_Beginfirsttest")
    end
end

function Rule_Setoff()
    if  SobGroup_IsDoingAbility("Player_Fighters", AB_HyperspaceViaGate) == 0 then
	SobGroup_UseHyperspaceGate("Player_Fighters", "Player_Hyperspacegate2")
    else
        SobGroup_SwitchOwner("Player_Fighters", 0)
	Rule_Remove("Rule_Setoff")
    end
end

function Rule_Waveonedestroyed()
    if  SobGroup_Empty("AI_Fighters0")==1 then
        Objective_SetState(obj_prim_destroywaveone_id, OS_Complete)
        Event_Start("intelevent_protectresourcepoint")
        Timer_Start(0, 90)
        Rule_Add("Rule_Protectresoursepoint")
        Rule_Add("Rule_Wavetwoattack")
        Rule_Remove("Rule_Waveonedestroyed")
    end
end

function Rule_Protectresoursepoint()
    if  Event_IsDone("intelevent_protectresourcepoint") == 1 then
        Player_UnrestrictBuildOption(0, "vgr_weaponplatform_gun")
        Player_UnrestrictBuildOption(0, "vgr_interceptor")
        Rule_Remove("Rule_Protectresoursepoint")
    end
end

function Rule_Wavetwoattack()
    if  Timer_GetRemaining(0) < 1 then
        SobGroup_Attack(1, "AI_Fighters1", "Player_Resourcecollector")
        SobGroup_AttackPlayer("AI_Fighters2", 0)
        Rule_Add("Rule_Resettarget1") 
        Rule_Add("Rule_Wavetwodetected")
        Rule_Remove("Rule_Wavetwoattack")
    end
end

function Rule_Resettarget1()
    if  SobGroup_IsInVolume("Player_Resourcecollector", "Point0") == 0 then
        if  SobGroup_Empty("AI_Fighters1") == 0 then
            SobGroup_Attack(1, "AI_Fighters1", "Player_CarrierLS")
            Rule_Remove("Rule_Resettarget1")
        end
    end
end

function Rule_Wavetwodetected()
    if  SobGroup_IsInVolume("AI_Fighters2", "Point0") == 1 then
        Event_Start("intelevent_destroywavetwo")
        Rule_Add("Rule_Wavetwodestroyed") 
        Rule_Remove("Rule_Wavetwodetected")
    end
end

function Rule_Wavetwodestroyed() 
    if  SobGroup_Empty("AI_Fighters1") == 1 then
        if  SobGroup_Empty("AI_Fighters2") == 1 then
            Objective_SetState(obj_prim_destroywavetwo_id, OS_Complete)
            Event_Start("intelevent_detectwavethree")
            Timer_Start(1, 240)
            Rule_Add("Rule_Wavethreedetected")
            Rule_Remove("Rule_Wavetwodestroyed")
        end
    end
end

function Rule_Wavethreedetected()
    if  SobGroup_IsInVolume("Player_Scout", "Point1") == 1 then
        Subtitle_TimeCounterEnd()
        SobGroup_Spawn("AI_Wavethree1", "Point9")
        SobGroup_Spawn("AI_Wavethree3", "Point13")
        SobGroup_Spawn("AI_Fighters4", "Point11")
        SobGroup_AttackPlayer("AI_Wavethree3", 0)
        Ping_Remove(ping_wavethree_id)
        Objective_SetState(obj_prim_detectwavethree_id, OS_Complete)
        SobGroup_Attack(1, "AI_Fighters4", "Player_Scout")
        SobGroup_AttackPlayer("AI_Wavethree1", 0)
        SobGroup_SetInvulnerability("Player_Scout", 1)
        Event_Start("intelevent_wavethreedetected")
        Timer_End(1)
        Timer_Start(2, 240)
        Rule_Add("Rule_PlaySaveGameLocationCard")
        Rule_AddInterval("Rule_Savetwo", 1)
        Rule_Add("Rule_GuardBC")
        Rule_Add("Rule_Keepalive")
        Rule_Remove("Rule_Wavethreedetected")
    elseif  Timer_GetRemaining(1) < 1 then
            SobGroup_ExitHyperSpace("AI_Wavethree2", "Point8")
            SobGroup_ExitHyperSpace("AI_Leftwave", "Point8")
            SobGroup_ExitHyperSpace("AI_Rightwave", "Point8")
            Rule_Add("Rule_Beginattack")
            Rule_Remove("Rule_Wavethreedetected")
    end
end

function Rule_Beginattack()
    if  SobGroup_AreAllInRealSpace("AI_Wavethree2") == 1 then
        if  SobGroup_AreAllInRealSpace("AI_Leftwave") == 1 then
            if  SobGroup_AreAllInRealSpace("AI_Rightwave") == 1 then
                SobGroup_Attack(1, "AI_Wavethree2", "Player_Sadisishaba")
                SobGroup_Attack(1, "AI_Leftwave", "Player_Sadisishaba")
                SobGroup_Attack(1, "AI_Rightwave", "Player_Sadisishaba")
                Rule_Remove("Rule_Beginattack")
            end
        end
    end
end

function Rule_Savetwo()
    Rule_Remove("Rule_Savetwo")
    g_save_id = (g_save_id + 1)
    Campaign_QuickSaveNb(g_save_id, "$40579")
end

function Rule_GuardBC()
    if  SobGroup_Empty("Player_Scout") == 1 then
        SobGroup_GuardSobGroup("AI_Fighters4", "AI_Wavethree3")
        Rule_Remove("Rule_GuardBC")
    end
end

function Rule_Keepalive()
    if  Timer_GetRemaining(2) < 1 then
        if  SobGroup_PlayerIsInSensorRange("AI_Wavethree1", 0) == 1 then
            SobGroup_ExitHyperSpaceSobGroup("AI_Wavethree2", "AI_Wavethree1", 3000)
            SobGroup_GuardSobGroup("AI_Wavethree2", "AI_Wavethree1")
            Event_Start("intelevent_run")
            Timer_Start(3, 60)
            Rule_Add("Rule_Run")
            Rule_Remove("Rule_Keepalive")
        else
            SobGroup_ExitHyperSpaceSobGroup("AI_Wavethree2", "AI_Wavethree1", 3000)
            SobGroup_GuardSobGroup("AI_Wavethree2", "AI_Wavethree1")
            Timer_Start(3, 5)
            Rule_Add("Rule_Run2")
            Rule_Remove("Rule_Keepalive")
        end
    end
end

function Rule_Run()
    if  Timer_GetRemaining(3) < 1 then
        Objective_SetState(obj_prim_keepalive_id, OS_Complete)
        Objective_SetState(obj_prim_run_id, OS_Complete)
        Camera_FocusSave()
        Event_Start("intelevent_agamemnonappears")
        SobGroup_SetInvulnerability("Player_CarrierLS", 1)
        Timer_Start(4, 100)
        Rule_Add("Rule_PlaySaveGameLocationCard")
        Rule_AddInterval("Rule_Savethree", 1)
        Rule_Add("Rule_Resettarget2")
        Rule_Add("Rule_Resettarget3")
        Rule_Add("Rule_Aiwavetwoarrive")
        Rule_Add("Rule_Protectstation")
        Rule_Remove("Rule_Run")
    end 
end

function Rule_Run2()
    if  Timer_GetRemaining(3) < 1 then
        Objective_SetState(obj_prim_keepalive_id, OS_Complete)
		Camera_FocusSave()
        Event_Start("intelevent_agamemnonappears")
        SobGroup_SetInvulnerability("Player_CarrierLS", 1)
        Timer_Start(4, 100)
        Rule_Add("Rule_PlaySaveGameLocationCard")
        Rule_AddInterval("Rule_Savethree", 1)
        Rule_Add("Rule_Resettarget2")
        Rule_Add("Rule_Resettarget3")
        Rule_Add("Rule_Aiwavetwoarrive")
        Rule_Add("Rule_Protectstation")
        Rule_Remove("Rule_Run2")
    end
end

function Rule_Savethree()
    Rule_Remove("Rule_Savethree")
    g_save_id = (g_save_id + 1)
    Campaign_QuickSaveNb(g_save_id, "$40580")
end

function Rule_Resettarget2()
    if  SobGroup_AreAllInRealSpace("Player_Agamemnon") == 1 then
        SobGroup_AbilityActivate("Player_Agamemnon", AB_Move, 0)
        Camera_UseCameraPoint("Cam_Start2") 
        SobGroup_Attack(1, "AI_Wavethree1", "Player_Agamemnon")
        SobGroup_Attack(1, "AI_Wavethree2", "Player_Agamemnon")
        SobGroup_AttackPlayer("Player_Agamemnon", 1)
        Rule_Remove("Rule_Resettarget2")
    end
end

function Rule_Resettarget3()
    if  SobGroup_AreAllInRealSpace("AI_Leftwave") == 1 then
        SobGroup_Attack(1, "AI_Leftwave", "Player_Agamemnon")
        Rule_Remove("Rule_Resettarget3")
    end
end

function Rule_Aiwavetwoarrive()
    if  Timer_GetRemaining(4) < 1 and (Event_IsDone("intelevent_agamemnonappears")==1) then
    	Camera_FocusSave()
        Event_Start("intelevent_aiwavetwoarrive")
        Timer_Start(5, 60)
        Rule_Add("Rule_Resettarget4")
        Rule_Remove("Rule_Aiwavetwoarrive")
    end
end

function Rule_Resettarget4()
    if  SobGroup_AreAllInRealSpace("AI_Rightwave") == 1 then
        SobGroup_Attack(1, "AI_Rightwave", "Player_Agamemnon")
        Rule_Add("Rule_Resettarget7")
        Rule_Remove("Rule_Resettarget4")
    end
end

function Rule_Resettarget7()
    if  SobGroup_AreAllInRealSpace("AI_Carrier1") == 1 then
        if  SobGroup_AreAllInRealSpace("AI_Carrier2") == 1 then
            Rule_Add("Rule_Carriersarrive")
            SobGroup_Create("AI_Interceptors")
            SobGroup_Create("AI_AttackBombers")
            Rule_AddInterval("Rule_Resettarget13", 10)
            Rule_AddInterval("Rule_Resettarget9", 40)
            Rule_AddInterval("Rule_Resettarget10", 50)
            Rule_Remove("Rule_Resettarget7")
        end
    end
end

function Rule_Resettarget13()
    Rule_Remove("Rule_Resettarget13")
    SobGroup_Attack(1, "AI_Carrier1", "Player_Sadisishaba")
    SobGroup_Attack(1, "AI_Carrier2", "Player_Sadisishaba")
    SobGroup_Launch("AI_Fighters3", "AI_Carrier1")
    SobGroup_Launch("AI_Fighters5", "AI_Carrier2")
end

function Rule_Resettarget9()
    if  SobGroup_Empty("AI_Carrier1") == 0 then
        SobGroup_CreateShip("AI_Carrier1", "Tai_interceptor")
        Rule_AddInterval("Rule_Resettarget15", 5)
    else
        Rule_Remove("Rule_Resettarget9")
    end 
end

function Rule_Resettarget10()
    if  SobGroup_Empty("AI_Carrier2") == 0 then
        SobGroup_CreateShip("AI_Carrier2", "Tai_AttackBomber")
        Rule_AddInterval("Rule_Resettarget16", 5)
    else
        Rule_Remove("Rule_Resettarget10")
    end 
end

function Rule_Resettarget15()
    Rule_Remove("Rule_Resettarget15")
    Player_FillShipsByType("AI_Interceptors", 1, "Tai_interceptor")
    Rule_AddInterval("Rule_Resettarget11", 1)
end

function Rule_Resettarget11()
    Rule_Remove("Rule_Resettarget11")
    SobGroup_AttackPlayer("AI_Interceptors", 0)
end

function Rule_Resettarget16()
    Rule_Remove("Rule_Resettarget16")
    Player_FillShipsByType("AI_AttackBombers", 1, "Tai_AttackBomber")
    Rule_AddInterval("Rule_Resettarget12", 1)
end

function Rule_Resettarget12()
    Rule_Remove("Rule_Resettarget12")
    SobGroup_Attack(1, "AI_AttackBombers", "Player_Sadisishaba")
end

function Rule_Carriersarrive()
    if  Timer_GetRemaining(5) < 1  and (Event_IsDone("intelevent_aiwavetwoarrive")==1) then
		Camera_FocusSave()
        Event_Start("intelevent_carriersarrive")
        Objective_SetState(obj_prim_protectstation_id, OS_Complete)
        Timer_Start(6, 30)
        Rule_Add("Rule_Resettarget8")
        Rule_Remove("Rule_Carriersarrive")
    end
end

function Rule_Resettarget8()
    if  SobGroup_AreAllInRealSpace("Player_Carrier2") == 1 then
        Rule_AddInterval("Rule_Resettarget14", 10)
        Rule_Add("Rule_Waveonearrive")
        Rule_Remove("Rule_Resettarget8")
    end
end

function Rule_Resettarget14()
    Rule_Remove("Rule_Resettarget14")
    SobGroup_Launch("Player_Bombers2", "Player_Carrier2")
    SobGroup_AttackPlayer("Player_Carrier2", 1)
    SobGroup_AttackPlayer("AI_Carrier1", 2)
    SobGroup_AttackPlayer("AI_Carrier2", 2)
    SobGroup_AttackPlayer("Player_Bombers2", 1)
end

function Rule_Waveonearrive()
    if  Timer_GetRemaining(6) < 1  and (Event_IsDone("intelevent_carriersarrive")==1) then
		Camera_FocusSave()
        Event_Start("intelevent_waveonearrive")
        Timer_Start(7, 60)
        Rule_Add("Rule_Resettarget5")
        Rule_Add("Rule_Wavetwoarrive")
        Rule_Remove("Rule_Waveonearrive")
    end
end

function Rule_Resettarget5()
    if  SobGroup_AreAllInRealSpace("Player_Carrier0") == 1 then
        SobGroup_Launch("Player_Bombers0", "Player_Carrier0")
        SobGroup_Attack(2, "Player_Carrier0", "AI_Leftwave")
        SobGroup_Attack(2, "Player_Bombers0", "AI_Leftwave")
        Rule_Remove("Rule_Resettarget5")
    end
end

function Rule_Wavetwoarrive()
    if  Timer_GetRemaining(7) < 1  and (Event_IsDone("intelevent_waveonearrive")==1) then
		Camera_FocusSave()
        Event_Start("intelevent_wavetwoarrive")
        Rule_Add("Rule_Resettarget6")
        Rule_Remove("Rule_Wavetwoarrive")
    end
end

function Rule_Resettarget6()
    if  SobGroup_AreAllInRealSpace("Player_Carrier1") == 1 then
        SobGroup_Launch("Player_Bombers1", "Player_Carrier1")
        SobGroup_Attack(2, "Player_Carrier1", "AI_Rightwave")
        SobGroup_Attack(2, "Player_Bombers1", "AI_Rightwave")
        Rule_Remove("Rule_Resettarget6")
    end
end

function Rule_Protectstation()
    if  SobGroup_Empty("AI_Fighters4") == 1 then
        if  SobGroup_Empty("AI_Wavethree1") == 1 then
            if  SobGroup_Empty("AI_Wavethree3") == 1 then
                if  SobGroup_Empty("AI_Wavethree2") == 1 then
                    if  SobGroup_Empty("AI_Leftwave") == 1 then
                        if  SobGroup_Empty("AI_Rightwave") == 1 then
                            if  SobGroup_Empty("AI_Carrier1") == 1 then
                                if  SobGroup_Empty("AI_Carrier2") == 1 then
                                    if  SobGroup_Empty("AI_Fighters3") == 1 then
                                        if  SobGroup_Empty("AI_Fighters5") == 1 then
                                            if  SobGroup_Empty("AI_Interceptors") == 1 then
                                        	if  SobGroup_Empty("AI_AttackBombers") == 1 then
                                                    Objective_SetState(obj_prim_protectstation2_id, OS_Complete)
                                                    Objective_SetState(obj_prim_protectmakaan_id, OS_Complete)
                                                    Rule_Remove("Rule_Protectstation")
                                        	end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function Rule_PlayerWins()
    if  Objective_GetState(obj_prim_destroywaveone_id) == OS_Complete then
        if  Objective_GetState(obj_prim_destroywavetwo_id) == OS_Complete then
            if  Objective_GetState(obj_prim_detectwavethree_id) == OS_Complete then
                if  Objective_GetState(obj_prim_keepalive_id) == OS_Complete then
                    if  Objective_GetState(obj_prim_protectstation_id) == OS_Complete then
                        if  Objective_GetState(obj_prim_protectstation2_id) == OS_Complete then
                            if  Objective_GetState(obj_prim_protectmakaan_id) == OS_Complete then
                                Event_Start("intelevent_playerwins")
                                Set_FX_Achievements_Value("FalconComplete",1)
                                Rule_Remove("Rule_PlayerWins")
                            end
                        end
                    end
                end
            end
        end
    end 
end

function Rule_PlayerLose()
    if  SobGroup_Empty("Player_CarrierLS")==1 then
        Event_Start("intelevent_playerloses0")
        Rule_Remove("Rule_PlayerLose")
    elseif  SobGroup_Empty("Player_Sadisishaba")==1 then
            Event_Start("intelevent_playerloses1")
            Rule_Remove("Rule_PlayerLose")
    elseif  SobGroup_Empty("Player_Agamemnon")==1 then
            Event_Start("intelevent_playerloses2")
            Rule_Remove("Rule_PlayerLose")
    elseif  SobGroup_Empty("Player_Resourcecollector")==1 then
            if  SobGroup_Empty("Player_Resourcecontroller")==1 then
                Event_Start("intelevent_playerloses3")
                Rule_Remove("Rule_PlayerLose")
            end
    end
end