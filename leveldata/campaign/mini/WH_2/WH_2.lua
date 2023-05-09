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
g_savename={"$40887","$40888","$40889"}
g_ContactText={{"$40751",1},{"$40752",2},{"$40753",1.5}}
g_AnomalyChecked = 0
g_KadFullAttack=0
g_CruiserCaptured = 0
actor_nebula=21
actor_spod = 16
actor_scout=19
actor_mpod=17
KadC_EventPointerID=1
KadC_EventPointer={}
KadC_Ping={}

Events = {}
Events.Intro = 
	{ 
		{ HW2_Wait(1),},
	    { HW2_LocationCardEvent("$40754", 4 ), HW2_Wait( 4 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40755", 10.5), HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_nebula, "$40756", 8.5), HW2_Wait( 1 ), }, 
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        { { "KadC_AddObjective1()", "" , }, },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.NoFindings = 
	{ 
        { HW2_SubTitleEvent(actor_nebula, "$40757", 3.5), HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_nebula, "$40758", 14.5), HW2_Wait( 1 ), }, 
        { { "Rule_AddInterval('KadC_AddEventPointer1',1)", "" , }, },
        { { "KadC_AddPing1()", "" , }, },
        { HW2_SubTitleEvent(actor_nebula, "$40759", 8.5), HW2_Wait( 1 ), }, 
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.NoFindings2 = 
	{ 
        { HW2_SubTitleEvent(actor_scout, "$40760", 2.5), HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_scout, "$40761", 6.5), HW2_Wait( 1 ), }, 
        { { "KadC_AddEventPointer2()", "" , }, },
        { HW2_SubTitleEvent(actor_scout, "$40762", 3.5), HW2_Wait( 4 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40763", 3.5), HW2_Wait( 1 ), }, 
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        { { "KadC_AddObjective2()", "" , }, },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.FoundAlly = 
	{
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_FocusSobGroupWithBuffer('Kad_AllyCmd', 700, 100, 3)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_spod, "$40764", 2), {"Sound_SpeechPlay('data:sound/speech/special/enemy_voice')", "", }, HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_spod, "$40765", 3), {"Sound_SpeechPlay('data:sound/speech/special/enemy_voice')", "", }, HW2_Wait( 1 ), }, 
        { { "SobGroup_FillSobGroupInVolume('TempFocus', 'Player_Ships0', 'E_Ally')","",},HW2_Wait( 1 ), },
        { { "Camera_FocusSobGroupWithBuffer('TempFocus', 700, 100, 3)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_scout, "$40766", 12.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40890", 2), HW2_Wait( 1 ), }, 
        { { "SobGroup_FillShipsByType('TempFocus', 'Player_Ships0', 'kad_mothership')","",},HW2_Wait( 1 ), },
        { { "Camera_FocusSobGroupWithBuffer('TempFocus', 700, 100, 3)","",},HW2_Wait( 1 ), },
        HW2FX_EventEndSet(1,1,1,0,1), 
        { HW2_SubTitleEvent(actor_nebula, "$40767", 7.5), HW2_Wait( 1 ), }, 
        { { "KadC_AddPing2()", "" , }, },
        { { "KadC_AutoSave(1)", "" , }, },
	}
Events.NebulaNearAlly = 
	{
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_FocusSobGroupWithBuffer('Kad_AllyCmd', 700, 100, 3)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_spod, "$40768", 2), {"Sound_SpeechPlay('data:sound/speech/special/enemy_voice')", "", }, HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_spod, "$40769", 2), {"Sound_SpeechPlay('data:sound/speech/special/enemy_voice')", "", }, HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40770", 8), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40771", 14), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40772", 13), HW2_Wait( 1 ), }, 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { { "KadC_AddPing3()", "" , }, },
        { HW2_SubTitleEvent(actor_nebula, "$40773", 11.5), HW2_Wait( 1 ), }, 
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
        { HW2_Wait(5), },
        { HW2_SubTitleEvent(actor_nebula, "$40774", 8), HW2_Wait( 1 ), }, 
	}
Events.NebulaTrigger = 
	{
        { HW2_SubTitleEvent(actor_nebula, "$40775", 2), HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_Interpolate( 'here', 'Cam_Temp', 2)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_nebula, "$40776", 14.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40777", 2), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_scout, "$40778", 4.5), HW2_Wait( 2 ), }, 
        { { "KadC_Ambush()", "" , }, },
        { HW2_SubTitleEvent(actor_nebula, "$40779", 2), HW2_Wait( 7 ), }, 
        { { "KadC_Ambush2()", "" , }, },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.AmbushDefeated = 
	{
        { HW2_SubTitleEvent(actor_nebula, "$40780", 3.5), HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_Interpolate( 'here', 'Cam_Temp', 2)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_nebula, "$40781", 12.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40782", 8), HW2_Wait( 1 ), }, 
        HW2FX_EventEndSet(1,1,1,0,1), 
        { HW2_Wait(6), },
        { HW2_SubTitleEvent(actor_nebula, "$40783", 14.5), HW2_Wait( 1 ), }, 
        { { "KadC_AddPing4()", "" , }, },
        { HW2_Wait(8), },
        { HW2_SubTitleEvent(actor_nebula, "$40784", 10), {"KadC_SalvagerBegin()","",}, HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40785", 9.5), HW2_Wait( 1 ), }, 
        { { "KadC_AddObjective3()", "" , }, },
	}
Events.WreckSite1 = 
	{
        { HW2_SubTitleEvent(actor_scout, "$40786", 12), HW2_Wait( 13 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40787", 2), HW2_Wait( 1 ), }, 
        { { "Player_UnrestrictBuildOption(0, 'kad_m_capshipadvanced')", "" , }, },
        { { "Player_UnrestrictBuildOption(0, 'kad_gunturret')", "" , }, },

	}
Events.WreckSite3 = 
	{
        { HW2_SubTitleEvent(actor_scout, "$40788", 12.5), HW2_Wait( 1 ), }, 
        { { "KadC_WreckSite3()", "" , }, },
        { HW2_SubTitleEvent(actor_scout, "$40789", 12), HW2_Wait( 2 ), }, 
        { HW2_SubTitleEvent(actor_scout, "$40874", 3.5), HW2_Wait( 1 ), }, 
	}
Events.RogueStart = 
	{
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_FocusSobGroupWithBuffer('Kad_AllyCmd', 700, 100, 3)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_scout, "$40790", 7), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_spod, "$40791", 1),{"Sound_SpeechPlay('data:sound/speech/special/enemy_voice')", "", },  HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_scout, "$40792", 7.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_spod, "$40793", 1), {"Sound_SpeechPlay('data:sound/speech/special/enemy_voice')", "", }, HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_spod, "$40794", 3), HW2_Wait( 1 ), }, 
        { { "KadC_RogueStart()", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_scout, "$40795", 3), HW2_Wait( 4 ), }, 
        { { "Camera_FocusSobGroupWithBuffer('Player_Nebula', 700, 100, 3)","",},HW2_Wait( 1 ), },
        HW2FX_EventEndSet(1,1,1,0,1), 
        { HW2_SubTitleEvent(actor_nebula, "$40796", 7.5), HW2_Wait( 5 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40867", 5), HW2_Wait( 3 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40797", 6), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40798", 13), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40799", 4.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40800", 9), HW2_Wait( 1 ), }, 
        { { "KadC_CaptureRogue()", "" , }, },
	}
Events.RougeCaptured = 
	{
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Camera_FocusSobGroupWithBuffer('Kad_MPod', 700, 100, 3)","",},HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_mpod, "$40801", 2), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40802", 1.5), HW2_Wait( 1 ), }, 
        { { "Camera_FocusSobGroupWithBuffer('Kad_AllyCmd', 700, 100, 3)","",},HW2_Wait( 3 ), },
        { { "KadC_RogueExplode()", "" , }, HW2_Wait(5), },
        { HW2_SubTitleEvent(actor_nebula, "$40803", 9.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40804", 1), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40805", 3), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40806", 1), HW2_Wait( 1 ), }, 
        { { "KadC_RetirePod()", "" , }, },
        { HW2_SubTitleEvent(actor_mpod, "$40807", 12), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40808", 3), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40809", 12), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40810", 10), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_mpod, "$40811", 19), HW2_Wait( 5 ), }, 
        HW2FX_EventEndSet(1,1,1,0,1), 
        { { "Sound_MusicPlayType('data:sound/music/ambient/Kad_ambalt', MUS_Ambient)", "" , }, },
        { { "KadC_AutoSave(3)", "" , }, HW2_Wait( 4 ), },
        { HW2_SubTitleEvent(actor_nebula, "$40812", 8.5), HW2_Wait( 1 ), }, 
        { { "Rule_AddInterval('KadC_Unrestrict1',45)", "" , }, HW2_Wait( 4 ), },
	}
Events.New = 
	{
        { HW2_SubTitleEvent(actor_nebula, "$40813", 13.5), HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { 
        	{ "KadC_EventPointer[7]=EventPointer_AddVolume('Inv_Pointer', HW2_rgb(230,230,230), 25000)", "", },
        	HW2_SubTitleEvent(actor_nebula, "$40880", 15.5), HW2_Wait( 1 ), 
        }, 
        { 
        	{ "KadC_Unrestrict2()", "" , }, 
        	HW2_SubTitleEvent(actor_nebula, "$40881", 9.5), HW2_Wait( 1 ), 
        }, 
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.CarrierEscape = 
	{
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { { "Sensors_Toggle(1)", "" , }, { "Universe_SlowDown(0,0)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_nebula, "$40879", 5), HW2_Wait( 1 ), }, 
        {
            { "KadC_Ping[14]=Ping_AddPoint('$40891', 'anomaly', 'ExitPt1')", "" , },
    		{ "KadC_Ping[15]=Ping_AddPoint('$40891', 'anomaly', 'ExitPt2')", "" , },
		},
        { { "Sensors_Toggle(0)", "" , }, { "Universe_SlowDown(1,0)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.FinalFight = 
	{
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_SubTitleEvent(actor_nebula, "$40814", 1), HW2_Wait( 3 ), }, 
        { { "Sensors_Toggle(1)", "" , }, { "Universe_SlowDown(0,0)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_nebula, "$40815", 10), HW2_Wait( 1 ), }, 
        {
            { "KadC_Ping[9]=Ping_AddSobGroup('$40886', 'anomaly', 'Kus_Cmd')", "" , },
    		{ "KadC_Ping[10]=Ping_AddSobGroup('$40886', 'anomaly', 'Tur_Cmd')", "" , },
		},
        { HW2_SubTitleEvent(actor_nebula, "$40816", 5), HW2_Wait( 3 ), }, 
        { { "KadC_FinalFightBegin()", "" , }, HW2_Wait( 3 ), },
        { { "Sensors_Toggle(0)", "" , }, { "Universe_SlowDown(1,0)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
        { { "Sound_MusicPlayType('data:sound/music/battle/b03_swarmers', MUS_Ambient)", "" , }, },
        { { "SobGroup_AbilityActivate('Player_Nebula', AB_Hyperspace, 1)", "" , }, HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_nebula, "$40817", 10), HW2_Wait( 3 ), }, 
        { { "SobGroup_EnterHyperSpaceOffMap('Player_Nebula')", "" , }, },
        { { "Rule_AddInterval('KadC_NebulaExit',1)", "" , }, },
	}
Events.PlayerWin = 
	{
        { HW2_SubTitleEvent(actor_nebula, "$40819", 2), HW2_Wait( 3 ), }, 
        { { "Sound_MusicPlayType('data:sound/music/ambient/a06_mission7and8', MUS_Ambient)", "" , }, },
		HW2FX_EventStartSet(1,0,"Fleet",1,1,1), 
        { HW2_SubTitleEvent(actor_nebula, "$40820", 13), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40821", 8.5), HW2_Wait( 3 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40822", 10), HW2_Wait( 3 ), }, 
        { HW2_SubTitleEvent(actor_nebula, "$40868", 12), HW2_Wait( 1 ), }, 
        { { "KadC_PlayerWin()", "" , }, },
	}
	

function KadC_NebulaExit()
	if (SobGroup_AreAllInHyperspace("Player_Nebula")==1) then
		SobGroup_ExitHyperSpace("Player_Nebula", "Player_HSJump")
		Camera_FocusSobGroupWithBuffer("Player_Nebula", 700, 100, 3)
		Rule_Remove("KadC_NebulaExit")
	end
end
	
function Rule_PlaySaveGameLocationCard()
    Subtitle_Message("$3651", 3)
    Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function KadC_AddObjective1()
	obj_CommenceResourcing = Objective_Add("$40823", OT_Primary)
	Objective_AddDescription(obj_CommenceResourcing, "$40824")
	Rule_AddInterval("KadC_NoFindings",90)
end

function KadC_AddEventPointer1()
	if KadC_EventPointerID>1 then
		EventPointer_Remove(KadC_EventPointer[KadC_EventPointerID-1])
	end
	if KadC_EventPointerID==6 then
		Rule_Remove("KadC_AddEventPointer1")
	else
		KadC_EventPointer[KadC_EventPointerID]=EventPointer_AddVolume("KadPath"..(KadC_EventPointerID-1), HW2_rgb(230,230,230), 700)
		KadC_EventPointerID=KadC_EventPointerID+1
	end
end

function KadC_AddPing1()
	for i=1,3 do
		KadC_Ping[i]=Ping_AddPoint("$40825", "anomaly", "KadPath"..i)
	end
	Objective_SetState(obj_CommenceResourcing, OS_Complete)
	obj_LocateFleet = Objective_Add("$40826", OT_Primary)
	Objective_AddDescription(obj_LocateFleet, "$40827")
	Rule_AddInterval("KadC_PlayerAdvance",6)
	Rule_AddInterval("KadC_ContactPointCheck",1)
	Rule_AddInterval("KadC_RUDeniedCheck",1)
end

function KadC_RUDeniedCheck()
	if (Player_IsShipInVolume(0, "E_RUDenied1")==1)or(Player_IsShipInVolume(0, "E_RUDenied2")==1) then
		Subtitle_Add(actor_scout, "$40872", 13)
		Rule_Remove("KadC_RUDeniedCheck")
	end
end

function KadC_PlayerAdvance()
    SobGroup_AbilityActivate("Player_Nebula", AB_Move, 1)
    Rule_Remove("KadC_PlayerAdvance")
end

function KadC_ContactPointCheck()
	local iFlag=0
	for i=1,3 do
		if (Player_IsShipInVolume(0, "KadPath"..i)==1)and(KadC_Ping[i]~=nil) then
			Subtitle_Add(actor_scout, g_ContactText[i][1],g_ContactText[i][2])
			Ping_Remove(KadC_Ping[i])
			KadC_Ping[i]=nil
		elseif (KadC_Ping[i]==nil) then
			iFlag=iFlag+1
		end
	end
	if iFlag==3 then
    	KadC_Ping[4]=Ping_AddPoint("$40828", "anomaly", "KadPath4")
		Rule_AddInterval("KadC_ContactPointCheck2",1)
    	Rule_Remove("KadC_ContactPointCheck")
    end
end

function KadC_ContactPointCheck2()
 	if (Player_IsShipInVolume(0, "KadPath4")==1)and(KadC_Ping[4]~=nil) then
 		Subtitle_Add(actor_scout, "$40829", 2.5)
 		Ping_Remove(KadC_Ping[4])
 		KadC_Ping[4]=nil
    	KadC_Ping[5]=Ping_AddPoint("$40830", "anomaly", "KadPath5")
   		Rule_Remove("KadC_ContactPointCheck2")
		Rule_AddInterval("KadC_ContactPointCheck3",1)
   	end
end

function KadC_ContactPointCheck3()
 	if (Player_IsShipInVolume(0, "E_PathTrigger")==1)and(KadC_Ping[5]~=nil) then
 		Event_Start("NoFindings2")
 		Ping_Remove(KadC_Ping[5])
 		KadC_Ping[5]=nil
   		Rule_Remove("KadC_ContactPointCheck3")
   	end
end

function KadC_AddEventPointer2()
	KadC_EventPointer[6]=EventPointer_AddVolume("E_Ally", HW2_rgb(230,230,230), 1000)
end

function KadC_AddObjective2()
	obj_EstablishCommunications = Objective_Add("$40831", OT_Primary)
	Objective_AddDescription(obj_EstablishCommunications, "$40832")
	Rule_Add("KadC_WatchAllyContact")
	Rule_Add("KadC_WatchAllyContact2")
end

function KadC_WatchAllyContact2()
	if (Player_IsShipInVolume(0, "E_AllySet1")==1)or(Player_IsShipInVolume(0, "E_AllySet2")==1)or(Player_IsShipInVolume(0, "E_AllySet3")==1) then
		SobGroup_Resource(1, "Kad_Ally")
		Rule_Remove("KadC_WatchAllyContact2")
	end
end

function KadC_WatchAllyContact()
	if (SobGroup_PlayerIsInSensorRange("Kad_Ally", 0)==1) then
	    SetAlliance( 0, 1)
	    SetAlliance( 1, 0)
		Event_Start("FoundAlly")
		Rule_Remove("KadC_WatchAllyContact")
	end
end

function KadC_NoFindings()
	Event_Start("NoFindings")
	Rule_Remove("KadC_NoFindings")
end

function KadC_AddPing2()
	EventPointer_Remove(KadC_EventPointer[6])
    KadC_Ping[6]=Ping_AddPoint("$40833", "anomaly", "E_Ally")
    Ping_AddDescription(KadC_Ping[6], 0, "$40834")
    Rule_Add("KadC_WatchPlayerNebula")
end

function KadC_WatchPlayerNebula()
	if (SobGroup_IsShipNearPoint("Player_Nebula", "E_Ally", 2500)==1) then
		if (KadC_Ping[6]~=nil) then
			Ping_Remove(KadC_Ping[6])
			KadC_Ping[6]=nil
			SobGroup_SobGroupAdd("TempFocus", "Kad_Ally")
			Event_Start("NebulaNearAlly")
		end
	end
end

function KadC_AddPing3()
    KadC_Ping[7]=Ping_AddPoint("$40835", "anomaly", "E_MidTrigger")
    Ping_AddDescription(KadC_Ping[7], 0, "$40836")
	Objective_SetState(obj_EstablishCommunications, OS_Complete)
	Rule_AddInterval("KadC_WatchNebulaTrigger",1)
	Rule_AddInterval("KadC_WatchNebulaTrigger2",1)
end

function KadC_WatchExplode()
	if (SobGroup_IsShipNearPoint("Player_Ships0", "E_MidTrigger", 8000)==1) then
		SobGroup_SetHealth("Temp", 0)
		Rule_Remove("KadC_WatchExplode")
	end
end

function KadC_WatchNebulaTrigger()
	if (SobGroup_IsInVolume("Player_Nebula", "E_MusicChange1")==1)or(SobGroup_IsInVolume("Player_Nebula", "E_MusicChange2")==1) then
		Sound_MusicPlayType("data:sound/music/ambient/Kad_AltGarden", MUS_Ambient)
		Rule_Remove("KadC_WatchNebulaTrigger")
	end
end

function KadC_WatchNebulaTrigger2()
	if (SobGroup_IsInVolume("Player_Nebula", "E_MidTrigger")==1) then
		Event_Start("NebulaTrigger")
		Ping_Remove(KadC_Ping[7])
		Rule_Remove("KadC_WatchNebulaTrigger2")
	end
end

function KadC_Ambush()
	Objective_SetState(obj_LocateFleet, OS_Complete)
	for i=1,4 do
		SobGroup_CloakToggle("Kus_AGrp"..i)
		SobGroup_AttackPlayer("Kus_AGrp"..i, 0)
		Player_FillShipsByType("TempFocus", 3, "kus_attackbomber")
		SobGroup_AttackSobGroupHardPoint("TempFocus", "Player_Nebula", "Engine")
		Player_FillShipsByType("TempFocus", 3, "kus_cloakgenerator_perm")
		SobGroup_MakeDead("TempFocus")
	end
	Rule_AddInterval("KadC_WatchAmbush", 1)
end

function KadC_Ambush2()
	SobGroup_AttackPlayer("Kus_AGrp5", 0)
end

function KadC_WatchAmbush()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(3, "Kus_Destroyer")==0) then
		Player_FillShipsByType("TempFocus", 3, "kus_cloakgenerator")
		SobGroup_SetHealth("TempFocus", 0)
  		KadC_AutoSave(2)
  		Event_Start("AmbushDefeated")
  		Rule_Remove("KadC_WatchAmbush")
	end
end

function KadC_AddPing4()
    KadC_Ping[8]=Ping_AddSobGroup("$40837", "anomaly", "Kad_AllyCmd")
	obj_SecureAlly = Objective_Add("$40838", OT_Primary)
	Objective_AddDescription(obj_SecureAlly, "$40839")
end

function KadC_WatchRogueStart()
	if (Player_IsShipInVolume(0, "E_RogueStart")==1) then
		if (Subtitle_OverlapHelper(0)==1) then
  			Event_Start("RogueStart")
  			Rule_Remove("KadC_WatchRogueStart")
  		end
	end
end

function KadC_RogueStart()
	SobGroup_CreateIfNotExist("Rogue_Engage")
    Player_SetPlayerName(1, "$40856")
    BreakAlliance(0, 1)
    BreakAlliance(1, 0)
	Rule_AddInterval("KadC_RougeEngage",1)
end

function KadC_RougeEngage()
	if (SobGroup_FillSobGroupInVolume("Rogue_Engage", "Player_Ships0", "E_RogueEngage")==1)and(SobGroup_IsDoingAbility("Kad_Ally",AB_Attack)==0) then
		SobGroup_Attack(2,"Kad_Ally", "Rogue_Engage")
		SobGroup_AttackPlayer("Kad_AllyCmd", 0)
		if (SobGroup_CanDoAbility("Kad_AllyCmd",AB_Custom)==1) then
			SobGroup_CustomCommand("Kad_AllyCmd")
		end
	elseif (SobGroup_FillSobGroupInVolume("Rogue_Engage", "Player_Ships0", "E_RogueEngage")==0)and(SobGroup_IsDoingAbility("Kad_Ally",AB_Attack)==1) then
		SobGroup_GuardSobGroup("Kad_Ally", "Kad_AllyCmd")
	end
end

function KadC_CaptureRogue()
	Objective_SetState(obj_SecureAlly, OS_Complete)
	Ping_Remove(KadC_Ping[8])
    KadC_Ping[8]=Ping_AddSobGroup("$40869", "anomaly", "Kad_AllyCmd")
	obj_BoardSupport = Objective_Add("$40840", OT_Primary)
	Objective_AddDescription(obj_BoardSupport, "$40841")
	Player_GrantResearchOption(0, "KadCapital2")
	Rule_Add("KadC_WatchMPod")
	Rule_Add("KadC_WatchRogue")
	Rule_AddInterval("KadC_RougeReinforce1",35)
	Rule_Remove("Subtitle_Overlap")
	SobGroup_SetInvulnerability("Kad_AllyCmd", 0)
end

function KadC_WatchRogue()
	if (SobGroup_Empty("Kad_AllyCmd")==1) then
		Subtitle_Add(actor_nebula, "$40842", 6)
		KadC_MissionFailed()
		Rule_Remove("KadC_WatchRogue")
	elseif (SobGroup_OwnedBy("Kad_AllyCmd")==0) then
		SobGroup_SwitchOwner("Kad_AllyCmd", 2)
		Ping_Remove(KadC_Ping[8])
		Sound_MusicPlay("Data:sound/music/ambient/Empty")
		SobGroup_CreateIfNotExist("Kad_MPod")
		SobGroup_FillShipsByType("Kad_MPod", "Player_Ships0", "kad_militaryfuelpod")
		Event_Start("RougeCaptured")
		Rule_Remove("KadC_WatchRogue")
		Rule_Remove("KadC_WatchMPod")
	end
end

function KadC_RougeReinforce1()
	if (SobGroup_AreAnyOfTheseTypes("Player_Ships1", "kad_resourcefuelpod")==1) then
		SobGroup_SobGroupAdd("Kad_Ally", SobGroup_CreateShip("Kad_Ally", "kad_swarmer"))
	end
	Subtitle_Add(actor_nebula, "$40843", 8)
	SobGroup_ExitHyperSpace("Kad_Ally1", "MBF_Entry1")
	Rule_AddInterval("KadC_RougeReinforce2",90)
	Rule_Remove("KadC_RougeReinforce1")
end

KadC_RougeReinforceWave=1
KadC_RougeReinforce=
{
	{"kad_swarmer","kad_swarmer",},
	{"kad_swarmer","kad_lanceswarmer",},
	{"kad_swarmer","kad_assaultswarmer","kad_lanceswarmer",},
	{"kad_swarmer","kad_lanceswarmer","kad_swarmer","kad_lanceswarmer",},
}

function KadC_RougeReinforce2()
	if (SobGroup_OwnedBy("Kad_AllyCmd")==1) then
		SobGroup_ExitHyperSpace("Kad_Ally"..KadC_RougeReinforceWave, "MBF_Entry"..KadC_RougeReinforceWave)
	end
	if (SobGroup_AreAnyOfTheseTypes("Player_Ships1", "kad_resourcefuelpod")==1) then
		for index,ship in KadC_RougeReinforce[KadC_RougeReinforceWave] do
			SobGroup_SobGroupAdd("Kad_Ally", SobGroup_CreateShip("Kad_Ally", ship))
		end
	end
	if (KadC_RougeReinforceWave==4) then
		Rule_Remove("KadC_RougeReinforce2")
	else
		KadC_RougeReinforceWave=KadC_RougeReinforceWave+1
	end
end

function KadC_WatchMPod()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "kad_militaryfuelpod")==0) then
		Player_UnrestrictBuildOption(0, "kad_militaryfuelpod")
	else
    	Player_RestrictBuildOption(0, "kad_militaryfuelpod")
	end
end

function KadC_SalvagerBegin()
	SobGroup_FilterInclude("Temp", "Player_Ships0", "displayFamily", "Utility")
	SobGroup_MakeSelectable("Temp",0)
	SobGroup_FormStrikeGroup("Temp", "Sphere")
	SobGroup_Move(0, "Temp", "Mid_SalvAdv")
end

function KadC_AddObjective3()
	obj_InvestigateWrecksite = Objective_Add("$40844", OT_Secondary)
	Objective_AddDescription(obj_InvestigateWrecksite, "$40845")
	Rule_AddInterval("KadC_WatchWreck1",1)
	Rule_AddInterval("KadC_WatchWreck2",1)
	Rule_AddInterval("KadC_WatchWreck3",1)
	Rule_AddInterval("KadC_WatchWreck4",1)
	Rule_AddInterval("KadC_WatchAllWreck",1)
	Rule_AddInterval("KadC_WatchWreckAdv",1)
	KadC_Wreck={0,0,0}
	Rule_AddInterval("KadC_WatchRogueStart", 1)
end

function KadC_WatchWreckAdv()
	if (SobGroup_IsInVolume("Temp", "Mid_SalvAdv")==1) then
		SobGroup_MakeSelectable("Temp",1)
		SobGroup_Resource(0, "Temp")
		Rule_Remove("KadC_WatchWreckAdv")
	end
end

function Subtitle_Overlap()
	Rule_Remove("Subtitle_Overlap")
end

function Subtitle_OverlapHelper(iTime)
	if (Rule_Exists("Subtitle_Overlap")==0) then
		if iTime==0 then
			Rule_Add("Subtitle_Overlap")
		else
			Rule_AddInterval("Subtitle_Overlap",iTime)
		end
		return 1
	else
		return 0
	end
end

function KadC_WatchWreck1()
	if (Player_IsShipInVolume(0, "WreckSite1")==1) then
		if (Subtitle_OverlapHelper(28)==1) then
			KadC_Wreck[1]=1
			Event_Start("WreckSite1")
			Rule_AddInterval("KadC_WatchMS2",1)
			Rule_Remove("KadC_WatchWreck1")
		end
	end
end

function KadC_WatchMS2()
	if (SobGroup_HasSubsystem("Player_Nebula", "kad_m_capshipadvanced")==1) then
		if (Subtitle_OverlapHelper(12)==1) then
			Subtitle_Add(actor_nebula, "$40846", 12)
			Player_UnrestrictBuildOption(0, "kad_advancedassaultswarmer")
	    	SobGroup_AbilityActivate("Player_Nebula", AB_HyperspaceInhibitor, 0)
		    Player_UnrestrictResearchOption(0, "Kad_FighterWeaponUpgrade1")
		    Player_RestrictResearchOption(0, "Kad_FighterWeaponUpgrade2")
		    Player_UnrestrictResearchOption(0, "Kad_AirHealthUpgrade1")
		    Player_RestrictResearchOption(0, "Kad_AirHealthUpgrade2")
		    Player_UnrestrictResearchOption(0, "Kad_ShipHealthUpgrade1")
		    Player_RestrictResearchOption(0, "Kad_ShipHealthUpgrade2")
		    Player_UnrestrictResearchOption(0, "Kad_PlatformHealthUpgrade1")
			Rule_Remove("KadC_WatchMS2")
		end
	end
end

function KadC_WatchWreck2()
	if (Player_IsShipInVolume(0, "WreckSite2")==1) then
		if (Subtitle_OverlapHelper(7)==1) then
			KadC_Wreck[2]=1
			Subtitle_Add(actor_nebula, "$40847", 7)
			Sound_SpeechPlay("data:sound/speech/allships/fleet/command_rus_transferred")
			Player_SetRU(0,Player_GetRU(0)+2200)
			Rule_Remove("KadC_WatchWreck2")
		end
	end
end

function KadC_WatchWreck3()
	if (Player_IsShipInVolume(0, "WreckSite3")==1) then
		if (Subtitle_OverlapHelper(32)==1) then
			KadC_Wreck[3]=1
			Event_Start("WreckSite3")
			Rule_Remove("KadC_WatchWreck3")
		end
	end
end

function KadC_WreckSite3()
	SobGroup_SwitchOwner("DerePod", 0)
	SobGroup_CreateShip("DerePod", "kad_swarmer")
	SobGroup_CreateShip("DerePod", "kad_assaultswarmer")
	SobGroup_CreateShip("DerePod", "kad_assaultswarmer")
	SobGroup_SwitchOwner("DerePod", 2)
end

function KadC_WatchWreck4()
	if (Player_IsShipInVolume(0, "WreckSite4a")==1)or(Player_IsShipInVolume(0, "WreckSite4b")==1) then
		if (Subtitle_OverlapHelper(12)==1) then
			Subtitle_Add(actor_scout, "$40848", 12)
			Rule_Remove("KadC_WatchWreck4")
		end
	end
end

function KadC_WatchAllWreck()
	if (KadC_Wreck[1]==1)and(KadC_Wreck[2]==1)and(KadC_Wreck[3]==1) then
		if (Subtitle_OverlapHelper(3)==1) then
			Subtitle_Add(actor_nebula, "$40849", 3)
			Objective_SetState(obj_InvestigateWrecksite, OS_Complete)
			Rule_Remove("KadC_WatchAllWreck")
		end
	end
end

function KadC_RogueExplode()
	SobGroup_SetHealth("Kad_AllyCmd",0)
	SobGroup_SetHealth("Kad_MPod",0.25)
	Objective_SetState(obj_BoardSupport, OS_Complete)
end

function KadC_RetirePod()
    Camera_FocusSobGroupWithBuffer("Kad_MPod", 700, 100, 3)
	SobGroup_SelectSobGroup("Kad_MPod")
	MainUI_UserEvent(eRetire)
	SobGroup_MakeSelectable("Kad_MPod",0)
	SobGroup_ExitHyperSpace("Tur_Cmd", "Inv_TurStart")
	SobGroup_ExitHyperSpace("Tur_Guard", "Inv_TurStart")
	SobGroup_ExitHyperSpace("Kus_Cmd", "Inv_KusStart")
	SobGroup_ExitHyperSpace("Kus_Guard", "Inv_KusStart")
	SobGroup_ExitHyperSpace("Kus_Harvest", "Inv_KusStart")
	SobGroup_ExitHyperSpace("Tur_OuterGuard", "Out_TurStart")
	SobGroup_ExitHyperSpace("Kus_OuterGuard", "Out_KusStart")
end

function KadC_Unrestrict1()
	Event_Start("New")
	Rule_Remove("KadC_Unrestrict1")
end

function KadC_Unrestrict2()
    Player_UnrestrictBuildOption(0, "kad_fuelpod")
    Player_UnrestrictBuildOption(0, "kad_multibeamfrigate")
    Player_UnrestrictBuildOption(0, "kad_probe")
	EventPointer_Remove(KadC_EventPointer[7])
	for i=11,13 do
		KadC_Ping[i]=Ping_AddPoint("$40885", "anomaly", "Probe_T"..(i-10))
	end
	obj_DispatchProbes = Objective_Add("$40882", OT_Primary)
	Objective_AddDescription(obj_DispatchProbes, "$40883")
    Rule_AddInterval("KadC_WatchProbe",1)
    Rule_AddInterval("KadC_WatchHarvesters",1)
    --Rule_AddInterval("KadC_WatchFinalFight",1)
end

function KadC_WatchProbe()
	if (Player_IsShipInVolume(0, "T1_Trigger")==1)or(Player_IsShipInVolume(0, "T3_Trigger")==1) then
		Ping_Remove(KadC_Ping[11])
		Ping_Remove(KadC_Ping[12])
		Ping_Remove(KadC_Ping[13])
		Objective_SetState(obj_DispatchProbes, OS_Complete)
		Event_Start("FinalFight")
		Rule_Remove("KadC_WatchProbe")
	end
	if (Player_IsShipInVolume(0, "Probe_T2")==1) then
		Ping_Remove(KadC_Ping[12])
	end
end

function KadC_WatchFinalFight()
	if (SobGroup_PlayerIsInSensorRange("Kus_Cmd", 0)==1)or(SobGroup_PlayerIsInSensorRange("Kus_Guard", 0)==1)or(SobGroup_PlayerIsInSensorRange("Tur_Cmd", 0)==1)or(SobGroup_PlayerIsInSensorRange("Tur_Guard", 0)==1) then
		Sound_MusicPlay("Data:sound/music/ambient/Empty")
		Event_Start("FinalFight")
		Rule_Remove("KadC_WatchFinalFight")
		Rule_Remove("KadC_WatchWreck1")
		Rule_Remove("KadC_WatchWreck2")
		Rule_Remove("KadC_WatchWreck3")
		Objective_SetState(obj_InvestigateWrecksite, OS_Complete)
	end
end

function KadC_FinalFightBegin()
	obj_DestroyEnemy = Objective_Add("$40850", OT_Primary)
	Objective_AddDescription(obj_DestroyEnemy, "$40851")
    SobGroup_Resource(4, "Kus_Harvest")
    SobGroup_GuardSobGroup("Kus_Cmd", "Kus_Harvest")
    SobGroup_GuardSobGroup("Kus_Guard", "Kus_Cmd")
    SobGroup_GuardSobGroup("Tur_Guard", "Tur_Cmd")
    SobGroup_SetROE("Tur_OuterGuard",0)
    SobGroup_SetROE("Kus_OuterGuard",0)
    SobGroup_FollowPath("Tur_Cmd", "Tur_PatrolPath", 1, 1, 1)
    Rule_AddInterval("KadC_CarrierTimer",1200)
	Rule_AddInterval("KadC_WatchCarrier",1)
	Rule_AddInterval("KadC_WatchKusCarrier",1)
	Rule_AddInterval("KadC_WatchTurCarrier",1)
	Rule_AddInterval("KadC_WatchKusCarrier2",1)
	Rule_AddInterval("KadC_WatchTurCarrier2",1)
	Rule_AddInterval("KadC_WatchPlayerWin",1)
end

function KadC_WatchHarvesters()
	if (SobGroup_Empty("Kus_Cmd")==0) then
		local Kus_Harvesters=SobGroup_Count("Kus_Harvest")
		if (Kus_Harvesters==0) then
			Rule_AddInterval("KadC_WatchHarvesters2",120)
			Rule_Remove("KadC_WatchHarvesters")
		end
	else
		Rule_Remove("KadC_WatchHarvesters")
	end
end

function KadC_WatchHarvesters2()
	if (SobGroup_Empty("Kus_Cmd")==0) then
		for i=1,2 do
			SobGroup_SobGroupAdd("Kus_Harvest", SobGroup_CreateShip("Kus_Cmd","Kus_ResourceCollector1"))
		end
		Rule_AddInterval("KadC_WatchHarvesters3",10)
	end
	Rule_Remove("KadC_WatchHarvesters2")
end

function KadC_WatchHarvesters3()
	if (SobGroup_Empty("Kus_Cmd")==0) then
		SobGroup_GuardSobGroup("Kus_Cmd", "Kus_Harvest")
		Rule_AddInterval("KadC_WatchHarvesters",1)
	end
	SobGroup_Resource(4, "Kus_Harvest")
	Rule_Remove("KadC_WatchHarvesters3")
end

function KadC_WatchKusCarrier()
	if (SobGroup_HealthPercentage("Kus_Cmd")<0.5)or(SobGroup_HealthPercentage("Tur_Cmd")<0.25) then
		SobGroup_Move(4, "Kus_Cmd", "ExitPt1")
		Rule_AddInterval("KadC_WatchKusEscape",1)
		Rule_Remove("KadC_WatchKusCarrier")
	end
end

function KadC_WatchCarrier()
	if (SobGroup_HealthPercentage("Kus_Cmd")<0.25)or(SobGroup_HealthPercentage("Tur_Cmd")<0.25) then
		Rule_Remove("KadC_WatchCarrier")
		Event_Start("CarrierEscape")
	end
end

function KadC_WatchTurCarrier()
	if (SobGroup_HealthPercentage("Tur_Cmd")<0.5)or(SobGroup_HealthPercentage("Kus_Cmd")<0.25) then
		SobGroup_Move(5, "Tur_Cmd", "ExitPt2")
		Rule_AddInterval("KadC_WatchTurEscape",1)
		Rule_Remove("KadC_WatchTurCarrier")
	end
end

function KadC_WatchKusCarrier2()
	if (SobGroup_HealthPercentage("Kus_Cmd")<1) then
		SobGroup_SobGroupAdd("Kus_Guard", SobGroup_CreateShip("Kus_Cmd","Kus_Interceptor"))
		SobGroup_SobGroupAdd("Kus_Guard", SobGroup_CreateShip("Kus_Cmd","Kus_Interceptor"))
		SobGroup_SobGroupAdd("Kus_Guard", SobGroup_CreateShip("Kus_Cmd","Kus_Interceptor"))
		SobGroup_SobGroupAdd("Kus_Guard", SobGroup_CreateShip("Kus_Cmd","Kus_HeavyCorvette"))
		SobGroup_GuardSobGroup("Kus_OuterGuard", "Kus_Cmd")
		Rule_Remove("KadC_WatchKusCarrier2")
	end
end

function KadC_WatchTurCarrier2()
	if (SobGroup_HealthPercentage("Tur_Cmd")<1) then
		SobGroup_SobGroupAdd("Tur_Guard", SobGroup_CreateShip("Tur_Cmd","Tur_Fighter"))
		SobGroup_SobGroupAdd("Tur_Guard", SobGroup_CreateShip("Tur_Cmd","Tur_Fighter"))
		SobGroup_SobGroupAdd("Tur_Guard", SobGroup_CreateShip("Tur_Cmd","Tur_AttackBomber"))
		SobGroup_SobGroupAdd("Tur_Guard", SobGroup_CreateShip("Tur_Cmd","Tur_StandardCorvette"))
		SobGroup_SobGroupAdd("Tur_Guard", SobGroup_CreateShip("Tur_Cmd","Tur_MissileCorvette"))
		SobGroup_SobGroupAdd("Tur_Guard", SobGroup_CreateShip("Tur_Cmd","Tur_MissileCorvette"))
		SobGroup_SobGroupAdd("Tur_Guard", SobGroup_CreateShip("Tur_Cmd","Tur_MinelayerCorvette"))
		SobGroup_GuardSobGroup("Tur_OuterGuard", "Tur_Cmd")
		Rule_Remove("KadC_WatchTurCarrier2")
	end
end

function KadC_CarrierTimer()
	if (Rule_Exists("KadC_WatchTurCarrier")==1) or (Rule_Exists("KadC_WatchKusCarrier")==1) then
		Subtitle_Add(actor_scout, "$40884", 10)
		KadC_Ping[16]=Ping_AddPoint("$40892", "anomaly", "Enemy_RallyPoint")
		Rule_Remove("KadC_CarrierTimer")
		Rule_AddInterval("KadC_TimesOut",1)
		if (Rule_Exists("KadC_WatchTurCarrier")==1) then
			SobGroup_Move(5, "Tur_Cmd", "Enemy_RallyPoint")
			Rule_Remove("KadC_WatchTurCarrier")
		end
		if (Rule_Exists("KadC_WatchKusCarrier")==1) then
			SobGroup_Move(4, "Kus_Cmd", "Enemy_RallyPoint")
			Rule_Remove("KadC_WatchKusCarrier")
		end
	end
end

function KadC_TimesOut()
	if (SobGroup_IsInVolume("Tur_Cmd", "Enemy_RallyPoint")==1) then
		SobGroup_SpawnNewShipInSobGroup(0, "rpg_inhibitor", "rpg_inhibitor", "Player_Ships0", "Enemy_RallyPoint")
		Camera_FocusVolumeWithBuffer("Enemy_RallyPoint", 700, 100, 3)
		SobGroup_EnterHyperSpaceOffMap("Tur_Cmd")
		Rule_Remove("KadC_TimesOut")
		KadC_MissionFailed()
	elseif (SobGroup_IsInVolume("Kus_Cmd", "Enemy_RallyPoint")==1) then
		SobGroup_SpawnNewShipInSobGroup(0, "rpg_inhibitor", "rpg_inhibitor", "Player_Ships0", "Enemy_RallyPoint")
		Camera_FocusVolumeWithBuffer("Enemy_RallyPoint", 700, 100, 3)
		SobGroup_EnterHyperSpaceOffMap("Kus_Cmd")
		Rule_Remove("KadC_TimesOut")
		KadC_MissionFailed()
	end
end

function KadC_WatchKusEscape()
	if (SobGroup_IsInVolume("Kus_Cmd", "ExitPt1")==1) then
		SobGroup_EnterHyperSpaceOffMap("Kus_Cmd")
		KadC_MissionFailed()
	end
end

function KadC_WatchTurEscape()
	if (SobGroup_IsInVolume("Tur_Cmd", "ExitPt2")==1) then
		SobGroup_EnterHyperSpaceOffMap("Tur_Cmd")
		KadC_MissionFailed()
	end
end

function KadC_WatchPlayerWin()
	if (SobGroup_Empty("Kus_Cmd")==1)and(SobGroup_Empty("Tur_Cmd")==1) then
		Rule_Remove("KadC_MissionFailed")
		Rule_Remove("KadC_WatchPlayerWin")
		Objective_SetState(obj_DestroyEnemy, OS_Complete)
		Event_Start("PlayerWin")
	end
end

function KadC_PlayerWin()
	Set_FX_Achievements_Value("KadMiniComplete",1)
	Camera_SetLetterboxStateNoUI(1, 2)
    Universe_Fade(1, 5)
	Rule_AddInterval("KadC_MissionComplete1",5)
end

function KadC_MissionFailed()
	Rule_AddInterval("KadC_MissionFailed1",5)
	Camera_SetLetterboxStateNoUI(1, 2)
    Universe_Fade(1, 5)
    Rule_Remove("KadC_MissionFailed")
end

function KadC_MissionFailed1()
	Rule_AddInterval("KadC_MissionFailed2",5)
	Rule_Remove("KadC_MissionFailed1")
	Subtitle_Message("$40857", 3)
end

function KadC_MissionFailed2()
	Rule_Remove("KadC_MissionFailed2")
	setMissionComplete(0)
end

function KadC_MissionComplete1()
	Rule_AddInterval("KadC_MissionComplete2",5)
	Rule_Remove("KadC_MissionComplete1")
	Subtitle_Message("$40858", 3)
end

function KadC_MissionComplete2()
	Rule_Remove("KadC_MissionComplete2")
    Profile_SetSingleMissionComplete("mini", 4, 1)
    FE_ExitToMainMenu()
    UI_DialogAccept()
end

function KadC_AutoSave(iIndex)
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddIntervalParam("KadC_AutoSaveCommon", iIndex, 1)
end

function KadC_AutoSaveCommon(iIndex)
	Rule_RemoveParam("KadC_AutoSaveCommon", iIndex)
	Campaign_QuickSaveNb(tonumber(iIndex), g_savename[tonumber(iIndex)])
end

function OnInit()
--X system entrance
	XInit("reslist.lua", "")
--
	Sound_EnableAllSpeech(1)
    --Camera_SetLetterboxStateNoUI(1,0)
    CPU_Enable(1, 0)
    CPU_Enable(2, 0)
    CPU_Enable(3, 0)
    CPU_Enable(4, 0)
    CPU_Enable(5, 0)
    Rule_AddInterval("Rule_DisablePlayer",0.1)
    Rule_AddInterval("Rule_Init",1)
    Rule_AddInterval("Mission_Start",10)
    Universe_Fade(1, 0)
--Achievements
		FX_Achievements_Init("FXsingleplayer")
--------
		Councilor_Switch=0
		FX_Common_Rule_OnInit()
	    SobGroup_LoadPersistantData("Kad_Mothership")
end

function Mission_Start()
    Sound_MusicPlayType("data:sound/music/ambient/a06_mission7and8", MUS_Ambient)
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
	for i=1,4 do
		SobGroup_CloakToggle("Kus_AGrp"..i)
	end
	SobGroup_CreateIfNotExist("TempFocus")
    Universe_Fade(0, 2)
    Player_SetPlayerName(1, "$40855")
    Player_SetPlayerName(2, "$40870")
    Player_SetPlayerName(3, "$40859")
    Player_SetPlayerName(4, "$40860")
    Player_SetPlayerName(5, "$40861")
	--Player_SetTeamColours(0, { 0.921, 0.921, 0.365, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(1, { 0.921, 0.921, 0.365, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(2, { 0.921, 0.921, 0.365, }, { 0.9, 0.9, 0.9, })
	--Player_SetTeamColours(3, { 0.365, 0.553, 0.667, }, { 0.8, 0.8, 0.8, })
	--Player_SetTeamColours(4, {.0,.925,.521}, {.100,.100,.100})
	--Player_SetTeamColours(5, {.0,.925,.521}, {.100,.100,.100})
    SetAlliance( 0, 2)
    SetAlliance( 2, 0)
    SetAlliance( 5, 4)
    SetAlliance( 4, 5)
	SobGroup_SetSwitchOwnerFlag("Kad_Ally", 0)
	SobGroup_SetSwitchOwnerFlag("Kad_AllyCmd", 0)
	SobGroup_SetSwitchOwnerFlag("DerePod", 0)
	SobGroup_SetInvulnerability("Kad_AllyCmd", 1)
    Sound_EnableAllSpeech(0)
    Rule_Remove("Rule_Init")
	SobGroup_SobGroupAdd("Kad_Ally", SobGroup_CreateShip("Kad_Ally", "kad_salvager"))
	SobGroup_SobGroupAdd("Kad_Ally", SobGroup_CreateShip("Kad_Ally", "kad_salvager"))
end

function KadC_WatchNebula()
	if (SobGroup_HealthPercentage("Player_Nebula")<0.5) then
		Subtitle_Add(actor_scout, "$40873", 4.5)
		Rule_AddInterval("KadC_WatchNebula2",1)
		Rule_Remove("KadC_WatchNebula")
	end
end

function KadC_WatchNebula2()
	if (SobGroup_Empty("Player_Nebula")==1) then
		KadC_MissionFailed()
		Rule_Remove("KadC_WatchNebula2")
	end
end

function Rule_DisablePlayer()
	dofilepath("player:PLAYERCFG.LUA")
	Player_SetTeamColours(Universe_CurrentPlayer(),{PlayerSetup.teamcolour[1]/255,PlayerSetup.teamcolour[2]/255,PlayerSetup.teamcolour[3]/255,},{PlayerSetup.stripecolour[1]/255,PlayerSetup.stripecolour[2]/255,PlayerSetup.stripecolour[3]/255,})
	SobGroup_Despawn("Player_KTB")
	SobGroup_CreateIfNotExist("Player_Nebula")
	Player_FillShipsByType("Player_Nebula", 0, "kad_mothership")
    SobGroup_AbilityActivate("Player_Nebula", AB_Hyperspace, 0)
    SobGroup_AbilityActivate("Player_Nebula", AB_Scuttle, 0)
    SobGroup_AbilityActivate("Player_Nebula", AB_Retire, 0)
    SobGroup_AbilityActivate("Player_Nebula", AB_Move, 0)
    SobGroup_AbilityActivate("Kad_AllyCmd", AB_AcceptDocking, 0)
    SobGroup_SetSpeed("Player_Nebula", 2.375)
	SobGroup_CreateIfNotExist("Player_FuelPod")
	Player_FillShipsByType("Player_FuelPod", 0, "kad_resourcefuelpod")
    SobGroup_SetSpeed("Player_FuelPod", 1.75)
    Player_RestrictBuildOption(0, "kad_advancedassaultswarmer")
    Player_RestrictBuildOption(0, "kad_probe")
    Player_RestrictBuildOption(0, "kad_fuelpod")
    Player_RestrictBuildOption(0, "kad_gunturret")
    Player_RestrictBuildOption(0, "kad_variationswarmer")
    Player_RestrictBuildOption(0, "kad_m_capshipadvanced")
    Player_RestrictBuildOption(0, "kad_multibeamfrigate")
    Player_RestrictBuildOption(0, "kad_militaryfuelpod")
    Player_RestrictBuildOption(0, "kad_guardianspirit")
    Player_RestrictBuildOption(0, "kad_carrier")
    Player_GrantResearchOption(0, "Kad_NebulaHealthUpgrade")
    Player_GrantResearchOption(1, "Kad_SupportPodHealthUpgrade")
    Player_GrantResearchOption(3, "Kus_DestroyerSpeedDowngrade")
    Player_GrantResearchOption(4, "Kus_CarrierSpeedDowngrade")
    Player_GrantResearchOption(0, "HyperspaceCostUpgrade")
    Player_RestrictResearchOption(0, "Kad_FighterWeaponUpgrade1")
    Player_RestrictResearchOption(0, "Kad_CorvetteWeaponUpgrade1")
    Player_RestrictResearchOption(0, "Kad_AirHealthUpgrade1")
    Player_RestrictResearchOption(0, "Kad_ShipWeaponUpgrade1")
    Player_RestrictResearchOption(0, "Kad_ShipHealthUpgrade1")
    Player_RestrictResearchOption(0, "Kad_PlatformHealthUpgrade1")
    Rule_Remove("Rule_DisablePlayer")
	Rule_AddInterval("KadC_WatchNebula",1)
	Rule_AddInterval("KadC_WatchExplode",1)
end