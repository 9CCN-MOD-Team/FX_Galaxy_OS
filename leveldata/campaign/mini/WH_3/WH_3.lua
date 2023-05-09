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

dofilepath("locale:leveldata/campaign/WH_3/m01.lua")

g_playerID = Universe_CurrentPlayer()
g_savename={"$41081","$41082"}
actor_BS = 31
actor_CC = 30
actor_HC = 8
actor_AF = 29
TaiC_EventPointerID = 1
TaiC_EventPointer = {}
TaiC_EventPointerID2 = 1
TaiC_EventPointer2 = {}
TaiC_Ping = {}
TaiC_Ping2 = {}
TaiC_EventPointer_1=0
TaiC_EventPointer_2=0
TaiC_EventPointer_3=0
TaiC_EventPointer_4=0
TaiC_EventPointer_5=0
TaiC_EventPointer_6=0
TaiC_EventPointer_7=0
TaiC_EventPointer_8=0
TaiC_EventPointer_9=0
TaiC_EventPointer_10=0
TaiC_SO3=0
obj_DTB = 0
obj_ITA = 0
obj_STB = 0
obj_PTA = 0
obj_PTV = 0
obj_SO = {}
TaiC_Ping_1=0
TaiC_Ping_2=0
TaiC_Ping_3=0
TaiC_Ping_4=0
TaiC_Ping_5=0
TaiC_Ping_6=0
TaiC_Ping_7=0
TaiC_Ping_8=0
TaiC_FXID = 0
TaiC_RU=0
Vgr_EliteCC = 0
Vgr_FleeCode={0,0,0,0,}

function Obj_Helper(iName,iDesc,iKind)
	local iObj=Objective_Add(iName, iKind)
	Objective_AddDescription(iObj, iDesc)
	return iObj
end

Events = {}
Events.Chatter = 
{
	{ HW2_Wait(0.5),},
	{ HW2_SubTitleEvent(28, "$41134", 0), },
}
Events.Intro = 
	{ 
		HW2FX_EventStartSet(0,0,"Emperor",1,1,1), 
	    { HW2_LocationCardEvent("$41001", 3 ),},
		{ {"Universe_Fade(0, 2)", "",}, { "SobGroup_MoveToPoint(3, 'Vgr_OPDD', {5777, 2799, 62619})", "",}, { "Camera_Interpolate('Camera1', 'Camera2', 9)", "",}, },
		{ HW2_Wait(3.5),},
	    { { "TaiC_FXID=FX_PlayEffectBetweenPoints('ion_beam_combo_new_tai', 'EffectPoint02', 'EffectPoint01', 0.5)", "" , }, { "Sound_SpeechPlay('data:sound/sfx/etg/WEAPON/FRIGATE/IMPACT/WEAPON_FRIGATE_ION_CANNON_BEAM_HIT')", "" , }, HW2_Wait( 3 ), }, 
        { { "SobGroup_SetHealth('Vgr_OPDD', 0)", "" , }, { "FX_StopEffect(TaiC_FXID)", "" , }, }, 
        --{ { "Rule_Remove('Camera_TrackFromPosition')", "" , }, }, 
        { { "SobGroup_Move(0, 'P_BS', 'Player_Adv')", "" , }, { "SobGroup_MoveToPoint(0, 'Tai_rrCarrier', {767, 3200, 57306})", "" , }, }, 
		{ HW2_Wait(3), },
		{ { "Mission_Start()","",}, },
		{ HW2_Wait(2), },
		{ HW2_SubTitleEvent(actor_HC, "$41119", 0), HW2_Wait(3),},
		{ { "GameEvent_UnListen(5000)","",}, {"Rule_Add('CameraShakeCheck')", "",}, },
		{ HW2_SubTitleEvent(actor_HC, "$41120", 0), HW2_Wait(2),},
		{ HW2_SubTitleEvent(actor_AF, "$41121", 0), HW2_Wait(2),},
		{ HW2_SubTitleEvent(actor_HC, "$41122", 0), HW2_Wait(2),},
		{ HW2_SubTitleEvent(actor_AF, "$41123", 0), HW2_Wait(4),},
		{ HW2_SubTitleEvent(actor_AF, "$41124", 0), HW2_Wait(3),},
		{ HW2_SubTitleEvent(actor_BS, "$41002", 6), HW2_Wait( 1 ), }, 
		{ HW2_SubTitleEvent(actor_CC, "$41003", 5.5), HW2_Wait( 3 ), }, 
		    { { "Rule_AddInterval('TaiC_StageForce',1)", "" , },  },
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { { "TaiC_EventPointer_1=EventPointer_AddVolume('Vgr_BlockadeSphere', HW2_rgb(230,230,230), 2000)", "" , }, }, 
        { HW2_Wait(2), },
		{ HW2_SubTitleEvent(actor_BS, "$41004", 10), HW2_Wait( 3 ), }, 
		{ { "EventPointer_Remove(TaiC_EventPointer_1)", "" , }, HW2_Wait(1), },
		{ { "obj_DTB = Obj_Helper('$41098', '$41099', OT_Primary)", "" , }, HW2_Wait(1), },
        { { "TaiC_Ping_1=Ping_AddPoint('$41065', 'anomaly', 'Vgr_BlockadeSphere')", "" , }, {"Ping_LabelVisible(TaiC_Ping_1, 1)","",}, HW2_Wait(1), },
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        { { "Rule_AddInterval('TaiC_VgrBlockade',1)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.BlockadeDestroyed = 
	{ 
        { HW2_SubTitleEvent(actor_BS, "$41005", 2), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_CC, "$41006", 4), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_BS, "$41007", 3), { "SobGroup_Stop(0,'Player_Ships0')", "" , }, HW2_Wait( 3 ), }, 
		HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
        { HW2_SubTitleEvent(actor_BS, "$41008", 12), HW2_Wait( 2 ), }, 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_BS, "$41009", 17.5), HW2_Wait( 1 ), }, 
        {
        	{ "TaiC_EventPointer_2=EventPointer_AddSobGroup('M_TutRoid', HW2_rgb(230,230,230), 1000)", "" , }, 
        	{ "TaiC_EventPointer_3=EventPointer_AddSobGroup('M_FakeRoid1', HW2_rgb(230,230,230), 1000)", "" , }, 
        	{ "TaiC_EventPointer_4=EventPointer_AddSobGroup('M_FakeRoid2', HW2_rgb(230,230,230), 1000)", "" , }, 
        	{ "SobGroup_SwitchOwner('P_BS', 3)", "" , }, 
        	{ "SobGroup_SwitchOwner('P_Tai1', 3)", "" , }, 
        	{ "SobGroup_SwitchOwner('P_Tai2', 3)", "" , }, 
        	{ "SobGroup_FormStrikeGroup('P_Tai1', 'Capital Phalanx')", "" , }, 
        	{ "SobGroup_FormStrikeGroup('P_Tai2', 'Capital Phalanx')", "" , }, 
        },
		{ { "obj_ITA = Obj_Helper('$41083', '$41084', OT_Primary)", "" , }, HW2_Wait(1), },
        {
        	{ "SobGroup_SwitchOwner('Tai_rrCarrier', 0)", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'tai_scout')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'tai_scout')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'tai_scout')", "" , }, 
        	{ "SobGroup_SwitchOwner('Tai_rrCarrier', 3)", "" , }, 
        	{ "Rule_AddInterval('TaiC_FleetHold',1)", "" , }, 
        },
        { HW2_SubTitleEvent(actor_BS, "$41010", 18), HW2_Wait( 1 ), }, 
		{
			{ "EventPointer_Remove(TaiC_EventPointer_2)", "" , }, 
			{ "EventPointer_Remove(TaiC_EventPointer_3)", "" , }, 
			{ "EventPointer_Remove(TaiC_EventPointer_4)", "" , }, 
			{ "TaiC_Ping_2=Ping_AddSobGroup('$41066', 'anomaly', 'M_FakeRoid1')", "" , }, 
			{ "TaiC_Ping_3=Ping_AddSobGroup('$41066', 'anomaly', 'M_FakeRoid2')", "" , }, 
			{ "TaiC_Ping_4=Ping_AddSobGroup('$41066', 'anomaly', 'M_TutRoid')", "" , }, 
			{ "Ping_LabelVisible(TaiC_Ping_2, 1)","",}, 
			{ "Ping_LabelVisible(TaiC_Ping_3, 1)","",}, 
			{ "Ping_LabelVisible(TaiC_Ping_4, 1)","",}, 
			{ "SobGroup_Resource(3, 'Tai_StageForce')", "" , }, 
			{ "Rule_AddInterval('TaiC_ScoutRoid',1)", "" , }, 
		},
        { { "Sensors_Toggle(0)", "" , }, HW2_Wait(1), },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.RoidScouted = 
	{ 
        { HW2_SubTitleEvent(actor_HC, "$41069", 4.5), { "SobGroup_Stop(0,'Player_Ships0')", "" , }, HW2_Wait( 1 ), }, 
		HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
		{ { "Camera_FocusSobGroupWithBuffer('M_TutRoid', 1000, 1000, 4)", "" , }, { "SobGroup_SwitchOwner('M_TutRoid', 3)", "" , }, },
        { HW2_SubTitleEvent(actor_HC, "$41070", 9.5), HW2_Wait( 2 ), }, 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_BS, "$41011", 15), HW2_Wait( 2 ), }, 
        {
        	{ "SobGroup_SwitchOwner('Tai_rrCarrier', 0)", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_Interceptor')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_Interceptor')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_Interceptor')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_Interceptor')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_AttackBomber')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_AttackBomber')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_AttackBomber')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'tai_lightcorvette')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'tai_heavycorvette')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'tai_heavycorvette')", "" , }, 
        	{ "Objective_SetState(obj_ITA, OS_Complete)", "" , }, 
        	{ "SobGroup_SwitchOwner('Tai_rrCarrier', 3)", "" , }, 
			{ "TaiC_Ping_5=Ping_AddSobGroup('$41071', 'anomaly', 'M_TutRoid')", "" , }, 
			{ "Ping_AddDescription(TaiC_Ping_5, 0, '$41101')","",}, 
			{ "Ping_LabelVisible(TaiC_Ping_5, 1)","",}, 
			{ "Sensors_Toggle(0)", "" , }, 
        },
        { HW2_Wait(3), },
		{
			{ "Camera_FocusSobGroupWithBuffer('Tai_rrCarrier', 1000, 1000, 3)", "" , },
        	{ "SobGroup_SwitchOwner('M_TutRoid', 1)", "" , }, 
		},
        { HW2_Wait(3), },
        {
        	{ "SobGroup_SwitchOwner('Tai_rrCarrier', 0)", "" , }, 
        	{ "SobGroup_SobGroupAdd('Tai_Support',SobGroup_CreateShip('Tai_rrCarrier', 'tai_supportfrigate'))", "" , }, 
        	{ "SobGroup_SwitchOwner('Tai_rrCarrier', 3)", "" , }, 
        },
        { HW2_Wait(5), },
        HW2FX_EventEndSet(1,1,1,0,1), 
		{
		    {"Camera_FocusSobGroupWithBuffer('Tai_Support', 500, 500, 3)", "" , }, 
			{"Sound_SpeechPlay('data:sound/speech/missions/WH_3/2_0supportfrigate_clear')", "", }, 
		}, 
		{ HW2_Wait(2),},
		{ {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/2_1awaitingorders')", "", }, }, 
		{ HW2_Wait(2),},
		{ { "obj_STB = Obj_Helper('$41085', '$41086', OT_Primary)", "" , }, { "Rule_AddInterval('TaiC_SecureBase',1)", "" , }, HW2_Wait(1), },
	}
Events.BaseDocked = 
	{
		{ {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_22_roidacquired')", "", }, }, 
		{ HW2_Wait(2),},
		{ {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_23_standingdown')", "", }, }, 
		{ HW2_Wait(2),},
		HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
        {
        	{"Objective_SetState(obj_STB, OS_Complete)", "" , },
		    {"Camera_FocusSobGroupWithBuffer('M_TutRoid', 1000, 1000, 3)", "" , }, 
		}, 
        { HW2_SubTitleEvent(actor_HC, "$41013", 3), HW2_Wait( 1 ), }, 
		--{ { "Camera_FocusSobGroupWithBuffer('M_TutRoid', 1000, 1000, 4)", "" , },},
        { HW2_SubTitleEvent(actor_BS, "$41014", 5), HW2_Wait( 2 ), }, 
        { { "Sensors_Toggle(1)", "" , }, HW2_Wait(1), },
        { HW2_SubTitleEvent(actor_BS, "$41015", 15), { "Rule_AddInterval('TaiC_AddEventPointer',1)", "" , }, HW2_Wait( 6 ), },
        { HW2_SubTitleEvent(actor_BS, "$41016", 13), { "TaiC_EventPointer_5=EventPointer_AddVolume('CorridorPointer', HW2_rgb(230,230,230), 17000)", "" , }, HW2_Wait(5), },
        { HW2_SubTitleEvent(actor_BS, "$41017", 15), { "EventPointer_Remove(TaiC_EventPointer_5)", "" , }, { "Rule_AddInterval('TaiC_AddEventPointer2',1)", "" , }, HW2_Wait( 4 ), },
        { HW2_SubTitleEvent(actor_BS, "$41018", 10.5), HW2_Wait( 2 ), { "Rule_AddInterval('TaiC_41019',150)", "" , }, { "TaiC_EventPointer_6=EventPointer_AddSobGroup('Tai_rrCarrier', HW2_rgb(230,230,230), 1000)", "" , }, }, 
        { { "SobGroup_SwitchOwner('Tai_rrCarrier', 0)", "" , }, { "SobGroup_SwitchOwner('P_Controller', 0)", "" , },  { "SobGroup_AbilityActivate('Tai_rrCarrier', AB_Attack, 1)", "" , }, HW2_Wait(2), },
        {
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_resourcecollector')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_resourcecollector')", "" , }, 
        	{ "SobGroup_CreateShip('Tai_rrCarrier', 'TAI_resourcecollector')", "" , }, 
        	{ "SobGroup_FollowPath('Vgr_Patrol1', 'Vgr_Patrol1', 1, 1, 1)", "" , }, 
        	{ "SobGroup_FollowPath('Vgr_Patrol2', 'Vgr_Patrol2', 1, 1, 1)", "" , }, 
        	{ "SobGroup_FollowPath('Vgr_Patrol3', 'Vgr_Patrol3', 1, 1, 1)", "" , }, 
        	{ "SobGroup_FollowPath('Vgr_Patrol4', 'Vgr_Patrol4', 1, 1, 1)", "" , }, 
        	{ "SobGroup_FollowPath('Vgr_Patrol5', 'Vgr_Patrol5', 1, 1, 1)", "" , }, 
        	{ "EventPointer_Remove(TaiC_EventPointer_6)", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_Scout')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_Interceptor')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_AttackBomber')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_LightCorvette')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_HeavyCorvette')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_SalcapCorvette')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_StandardFrigate')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_IonCannonFrigate')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_SupportFrigate')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_DefenseFrigate')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_ResourceCollector')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_HeavyDefender')", "" , }, 
        	{ "Player_UnrestrictBuildOption(0, 'Tai_DefenseFighter')", "" , }, 
        	--{ "SobGroup_AbilityActivate('Tai_rrCarrier', AB_Builder, 1)", "" , }, 
    		{ "SobGroup_AbilityActivate('Tai_rrCarrier', AB_Move, 1)", "" , }, 
			--{ "SobGroup_SwitchOwner('P_Ben', 0)", "" , }, 
        },
		{ { "obj_PTA = Obj_Helper('$41087', '$41088', OT_Primary)", "" , }, { "Sensors_Toggle(0)", "" , }, { "SobGroup_SetAutoLaunch('M_TutRoid', ShipHoldLaunch)", "" , },  HW2_Wait(1), },
        { { "KadC_AutoSave(1)", "" , }, },
        HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.SOA = 
	{
        { HW2_SubTitleEvent(actor_AF, "$41022", 6), {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_30_assumingposition')", "", }, HW2_Wait( 1 ), }, 
        { { "Timer_Start(1,180)","",}, {"Subtitle_TimeCounter( 1, 41091 )", "",}, HW2_Wait( 10 ), },
        { HW2_SubTitleEvent(actor_AF, "$41023", 5), {"Rule_AddInterval( 'TaiC_SOATimer90', 1 )", "",}, HW2_Wait( 5 ), }, 
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol1')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_bomber', 'vgr_bomber', 'Vgr_SOA', 'A_Vol1')","",}, 
        	HW2_Wait( 1 ), 
        },
        {
        	--{"SobGroup_Move(1, 'Vgr_SOA', 'A_VgrRallyPt')", "",},
        	{"TaiC_SOAAttack()", "",},
        	HW2_Wait( 5 ), 
        },
        { {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_31_incoming')", "", }, HW2_Wait( 3 ), },
        { {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_32_defensedelta')", "", }, HW2_Wait( 5 ), },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol2')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_lancefighter', 'vgr_lancefighter', 'Vgr_SOA', 'A_Vol2')","",}, 
        	HW2_Wait( 1 ), 
        },
        {
        	{"TaiC_SOAAttack()", "",},
        	HW2_Wait( 15 ), 
        },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_bomber', 'vgr_bomber', 'Vgr_SOA', 'A_Vol2')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_bomber', 'vgr_bomber', 'Vgr_SOA', 'A_Vol2')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_missilecorvette', 'vgr_missilecorvette', 'Vgr_SOA', 'A_Vol2')","",}, 
        	HW2_Wait( 1 ), 
        },
        {
        	{"TaiC_SOAAttack()", "",},
        	HW2_Wait( 10 ), 
        },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol1')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol1')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_lasercorvette', 'vgr_lasercorvette', 'Vgr_SOA', 'A_Vol1')","",}, 
        	HW2_Wait( 1 ), 
        },
        {
        	{"TaiC_SOAAttack()", "",},
        	HW2_Wait( 20 ), 
        },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol2')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_missilecorvette', 'vgr_missilecorvette', 'Vgr_SOA', 'A_Vol2')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_bomber', 'vgr_bomber', 'Vgr_SOA', 'A_Vol2')","",}, 
        	HW2_Wait( 1 ), 
        },
        {
        	{"TaiC_SOAAttack()", "",},
        	HW2_Wait( 7 ), 
        },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol1')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_lancefighter', 'vgr_lancefighter', 'Vgr_SOA', 'A_Vol1')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_lasercorvette', 'vgr_lasercorvette', 'Vgr_SOA', 'A_Vol1')","",}, 
        	HW2_Wait( 1 ), 
        },
        {
        	{"TaiC_SOAAttack()", "",},
        	HW2_Wait( 7 ), 
        },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_heavymissilefrigate', 'vgr_heavymissilefrigate', 'Vgr_SOA', 'A_Vol3')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_bomber', 'vgr_bomber', 'Vgr_SOA', 'A_Vol1')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol1')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_interceptor', 'vgr_interceptor', 'Vgr_SOA', 'A_Vol1')","",}, 
        	HW2_Wait( 7 ), 
        },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_lasercorvette', 'vgr_lasercorvette', 'Vgr_SOA', 'A_Vol3')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_assaultfrigate', 'vgr_assaultfrigate', 'Vgr_SOA', 'A_Vol2')","",}, 
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'vgr_lancefighter', 'vgr_lancefighter', 'Vgr_SOA', 'A_Vol1')","",}, 
        	HW2_Wait( 1 ), 
        },
        {
        	{"TaiC_SOAAttack()", "",},
        },
	}
Events.SOAComplete = 
	{
		{ { "Subtitle_TimeCounterEnd()", "",}, { "Timer_End(1)", "",}, {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_22_roidacquired')", "", }, HW2_Wait( 3 ), },
		{ {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_23_standingdown')", "", }, HW2_Wait( 3 ), },
        {
        	{ "SobGroup_SpawnNewShipInSobGroup(1, 'taic_container', 'taic_container', 'TaiC_Container', 'A_RuSpawn')","",}, 
        	HW2_Wait( 1 ), 
        },
        { { "SobGroup_SetHealth('TaiC_Container', 0)","",}, },
        { HW2_SubTitleEvent(actor_AF, "$41026", 15), HW2_Wait( 1 ), }, 
        { { "TaiC_Ping_6=Ping_AddPoint('$41100', 'anomaly', 'A_RuSpawn')", "" , }, { "Ping_LabelVisible(TaiC_Ping_6, 1)","",}, {"Ping_Remove(TaiC_Ping[1])", "",},},
        { HW2_SubTitleEvent(actor_CC, "$41027", 7), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_CC, "$41028", 2), HW2_Wait( 1 ), }, 
        { {"Objective_SetState(obj_SO[1], OS_Complete)", "",}, { "TaiC_RU=Stats_GatheredRUSalvage(0)+3400","",}, { "Rule_AddInterval('TaiC_RUCheck',1)","",}},
	}
Events.SOAFailed = 
	{
		{ { "Subtitle_TimeCounterEnd()", "",}, { "Timer_End(1)", "",}, },
        { HW2_SubTitleEvent(actor_CC, "$41029", 9), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_HC, "$41030", 7), {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_24_abortconfirm')", "", }, HW2_Wait( 3 ), }, 
        { {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_25_abortmission')", "", }, {"TaiC_SOAFailed()", "",}, HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_CC, "$41031", 1.5), HW2_Wait( 1 ), }, 
	}
Events.SOB = 
	{
		HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
        { HW2_SubTitleEvent(actor_AF, "$41032", 8), { "Camera_FocusSobGroupWithBuffer('M_BRoid', 1000, 1000, 4)", "" , }, HW2_Wait( 3 ), }, 
        { { "Camera_ZoomClose(0)", "" , }, HW2_Wait( 2 ), }, 
        { { "SobGroup_SetHealth('Vgr_BPlatform',0)", "" , }, { "SobGroup_SetHealth('Vgr_ECMProbe',0)", "" , }, HW2_Wait( 2 ), }, 
        { HW2_SubTitleEvent(actor_AF, "$41033", 14), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_CC, "$41034", 2), HW2_Wait( 1 ), }, 
        HW2FX_EventEndSet(1,1,1,0,1), 
        { {"Ping_Remove(TaiC_Ping[2])", "",}, { "SobGroup_SetAutoLaunch('M_BRoid', ShipHoldLaunch)", "" , },  {"Objective_SetState(obj_SO[2], OS_Complete)", "",}, HW2_Wait( 10 ), }, 
        { HW2_SubTitleEvent(actor_BS, "$41035", 13), HW2_Wait( 30 ), }, 
        {
        	HW2_SubTitleEvent(actor_BS, "$41036", 18), 
        	{ "TaiC_EventPointer_5=EventPointer_AddVolume('vol_array', HW2_rgb(230,230,230), 1000)", "" , },
        	--{ "TaiC_EventPointer_6=EventPointer_AddVolume('vol_controllers', HW2_rgb(230,230,230), 1000)", "" , },
        	{ "TaiC_EventPointer_7=EventPointer_AddVolume('vol_frigates', HW2_rgb(230,230,230), 1000)", "" , },
        	{ "SobGroup_ExitHyperSpace('P_Array', 'vol_array')", "" , },
        	--{ "SobGroup_ExitHyperSpace('P_Controller', 'vol_controllers')", "" , },
        	{ "SobGroup_ExitHyperSpace('P_Frigate', 'vol_frigates')", "" , },
        	HW2_Wait( 20 ), 
        }, 
        {
        	{ "EventPointer_Remove(TaiC_EventPointer_5)", "" , },
        	--{ "EventPointer_Remove(TaiC_EventPointer_6)", "" , },
        	{ "EventPointer_Remove(TaiC_EventPointer_7)", "" , },
        }, 
	}
Events.SOCComplete = 
	{
        { HW2_SubTitleEvent(actor_CC, "$41042", 9.5), HW2_Wait( 4 ), }, 
		--HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
		{ { "SobGroup_MoveToSobGroup('TaiC_SOCPlayerV', 'M_CRoid')", "" , }, {"Camera_FocusSobGroupWithBuffer('TaiC_SOCPlayerV', 500, 500, 3)", "" , }, }, 
		{ HW2_Wait( 3 ), }, 
        { { "Camera_TrackSobGroup('TaiC_SOC')", "" , },  { "Universe_Fade(1, 3)", "" , }, HW2_Wait( 4 ), }, 
        { HW2_SubTitleEvent(actor_AF, "$41043", 1.5), {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_30_assumingposition')", "", }, {"Rule_Remove('Camera_TrackSobGroup')", "", }, {"Camera_AltFocus('M_CRoid', 0)", "",}, HW2_Wait( 2 ), }, 
        { HW2_SubTitleEvent(actor_AF, "$41044", 3.5), {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_34_acquisition')", "", }, HW2_Wait( 3 ), }, 
        { HW2_SubTitleEvent(actor_AF, "$41045", 2), {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_35_maccomplished')", "", }, HW2_Wait( 1 ), }, 
        { { "Universe_Fade(0, 3)", "" , }, {"SobGroup_SwitchOwner('M_CRoid', 3)", "",}, {"SobGroup_AbilityActivate('Tai_ScoutFleet', AB_Sensors, 1)", "",}, }, 
        --HW2FX_EventEndSet(1,1,1,0,1), 
        { HW2_Wait( 4 ), },
        { HW2_SubTitleEvent(actor_HC, "$41046", 14.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_HC, "$41047", 15), HW2_Wait( 3 ), }, 
        { HW2_SubTitleEvent(actor_BS, "$41048", 13.5), HW2_Wait( 2 ), }, 
        { HW2_SubTitleEvent(actor_BS, "$41049", 2), HW2_Wait( 1 ), }, 
        { {"Objective_SetState(obj_SO[3], OS_Complete)", "",}, {"Ping_Remove(TaiC_Ping[3])", "",}, },
	}
Events.SOCFailed = 
	{
        { HW2_SubTitleEvent(actor_CC, "$41040", 14), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_CC, "$41041", 2), HW2_Wait( 1 ), }, 
        { {"Objective_SetState(obj_SO[3], OS_Failed)", "",},  {"Ping_Remove(TaiC_Ping[3])", "",},},
	}
Events.SOC = 
	{
        { HW2_SubTitleEvent(actor_CC, "$41037", 11), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_CC, "$41038", 7), HW2_Wait( 1 ), }, 
	}
Events.SO3 = 
	{
        { HW2_SubTitleEvent(actor_BS, "$41050", 12.5), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_CC, "$41051", 6), {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_40_rogerthat')", "", }, HW2_Wait( 3 ), }, 
        { {"Sound_SpeechPlay('data:sound/speech/missions/WH_3/T_41_allunitsretreat')", "", }, {"TaiC_Retreat()","",}, HW2_Wait( 3 ), }, 
        { HW2_SubTitleEvent(actor_BS, "$41053", 5.5), HW2_Wait( 1 ), }, 
	}
Events.FinalBattleNormal = 
	{
		{ HW2_Wait( 13 ), }, 
		HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
		{ { "Sensors_Toggle(1)", "" , }, { "Sound_MusicPlayType('Data:sound/music/ambient/Empty', MUS_Ambient)", "",},},
        { HW2_SubTitleEvent(actor_BS, "$41092", 4), HW2_Wait( 1 ), }, 
        { { "TaiC_EventPointer_8=EventPointer_AddVolume('CorridorBS1', HW2_rgb(230,230,230), 2800)", "" , }, HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_BS, "$41094", 12.5), HW2_Wait( 1 ), }, 
        { { "TaiC_Ping_7=Ping_AddPoint('$41062', 'anomaly', 'CorridorBS1')", "" , }, { "Ping_AddDescription(TaiC_Ping_7, 0, '$41117')","",}, { "Ping_LabelVisible(TaiC_Ping_7, 1)","",}, {"EventPointer_Remove(TaiC_EventPointer_8)", "",}, HW2_Wait( 3 ), },
		{
			{ "Sensors_Toggle(0)", "" , },
			{ "Sound_MusicPlayType('data:sound/music/battle/b04_evilempire', MUS_Ambient)", "",},
			{ "SobGroup_SwitchOwner('P_BS',0)", "",},
			{ "SobGroup_SwitchOwner('P_Tai1',0)", "",},
			{ "SobGroup_SwitchOwner('P_Tai2',0)", "",},
			{ "SobGroup_SwitchOwner('Tai_StageForce',0)", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_production_fighter')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_production_corvette')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_production_frigate')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_corvettelaser')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_fighterlance')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_FrigateArtillery')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_FrigateEW')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_FrigateInfiltrator')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_hyperspace')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_nuclearbomb')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_research')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Base','vgr_c_production_frigate')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Base','vgr_c_module_hyperspace')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_EliteCC1','vgr_c_module_corvettelaser')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_EliteCC1','vgr_c_production_frigate')", "",},
			{ "SobGroup_AbilityActivate('Vgr_Base',AB_Move, 0)", "",},
			{ "SobGroup_AbilityActivate('Vgr_Shipyard',AB_Move, 0)", "",},
			{ "CPU_Enable(1, 1)","",},
			{ "CPU_RemoveSobGroup(1, 'Vgr_BaseDefCC')","",},
			{ "Player_GrantResearchOption(1, 'cpuplayers_dynamic')", "",},
			{ "CPU_RemoveSobGroup(1, 'Vgr_EliteCC1')", "",},
			{ "CPU_RemoveSobGroup(1, 'Vgr_EliteCC2')", "",},
			{ "NameSobGroup('Vgr_EliteCC1', '$41111')", "",},
			--{ "CPU_RemoveSobGroup(1, 'Vgr_BaseFleet')", "",},
			{ "SobGroup_GuardSobGroup('Vgr_BaseFleet', 'Vgr_Station')", "",},
			{ "Rule_Remove('TaiC_FleetHold')","",},
		},
        HW2FX_EventEndSet(1,1,1,0,1), 
		{ { "obj_PTV = Obj_Helper('$41089', '$41090', OT_Primary)", "" , }, HW2_Wait(10), },
		{ {"TaiC_ScoutFleet()","",}, { "Rule_AddInterval('Vgr_BaseFleet', 1)","",},},
	}
Events.FinalBattleHard = 
	{
		{ HW2_Wait( 13 ), }, 
		HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
		{ { "Sensors_Toggle(1)", "" , }, },
        { HW2_SubTitleEvent(actor_BS, "$41093", 18), HW2_Wait( 1 ), }, 
        { { "TaiC_EventPointer_8=EventPointer_AddVolume('CorridorBS1', HW2_rgb(230,230,230), 2800)", "" , }, HW2_Wait( 1 ), },
        { HW2_SubTitleEvent(actor_BS, "$41094", 12.5), HW2_Wait( 1 ), }, 
        { { "TaiC_Ping_7=Ping_AddPoint('$41062', 'anomaly', 'CorridorBS1')", "" , }, { "Ping_AddDescription(TaiC_Ping_7, 0, '$41117')","",}, { "Ping_LabelVisible(TaiC_Ping_7, 1)","",}, {"EventPointer_Remove(TaiC_EventPointer_8)", "",}, HW2_Wait( 3 ), },
		{
			{ "Sensors_Toggle(0)", "" , },
			{ "Sound_MusicPlayType('data:sound/music/battle/b04_evilempire', MUS_Ambient)", "",},
			{ "SobGroup_SwitchOwner('P_BS',0)", "",},
			{ "SobGroup_SwitchOwner('P_Tai1',0)", "",},
			{ "SobGroup_SwitchOwner('P_Tai2',0)", "",},
			{ "SobGroup_SwitchOwner('Tai_StageForce',0)", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateShip('Vgr_Shipyard','vgr_resourcecollector')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_production_fighter')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_production_corvette')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_production_frigate')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_corvettelaser')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_fighterlance')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_FrigateArtillery')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_FrigateEW')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_FrigateInfiltrator')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_hyperspace')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_nuclearbomb')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Shipyard','vgr_ms_module_research')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Base','vgr_c_production_frigate')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_Base','vgr_c_module_hyperspace')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_EliteCC1','vgr_c_module_corvettelaser')", "",},
			{ "SobGroup_CreateSubSystem('Vgr_EliteCC1','vgr_c_production_frigate')", "",},
			{ "SobGroup_AbilityActivate('Vgr_Base',AB_Move, 0)", "",},
			{ "SobGroup_AbilityActivate('Vgr_Shipyard',AB_Move, 0)", "",},
			{ "CPU_Enable(1, 1)","",},
			{ "CPU_RemoveSobGroup(1, 'Vgr_BaseDefCC')","",},
			{ "Player_GrantResearchOption(1, 'cpuplayers_dynamic')", "",},
			{ "CPU_RemoveSobGroup(1, 'Vgr_EliteCC1')", "",},
			{ "CPU_RemoveSobGroup(1, 'Vgr_EliteCC2')", "",},
			{ "NameSobGroup('Vgr_CC1', '$41111')", "",},
			--{ "CPU_RemoveSobGroup(1, 'Vgr_BaseFleet')", "",},
			{ "SobGroup_GuardSobGroup('Vgr_BaseFleet', 'Vgr_Base')", "",},
			{ "Rule_Remove('TaiC_FleetHold')","",},
		},
        HW2FX_EventEndSet(1,1,1,0,1), 
		{ { "obj_PTV = Obj_Helper('$41089', '$41090', OT_Primary)", "" , }, HW2_Wait(10), },
		{ {"TaiC_ScoutFleet()","",}, { "Rule_AddInterval('Vgr_BaseFleet', 1)","",}, {"Rule_AddInterval('TaiC_Hard1',1)", "",}, {"Rule_AddInterval('TaiC_Hard2',1)", "",}, HW2_Wait(10), },
        { HW2_SubTitleEvent(actor_BS, "$41096", 13), HW2_Wait( 1 ), }, 
        { { "Timer_Start(2,900)","",}, {"Subtitle_TimeCounter( 2, 41097 )", "",}, {"Rule_AddInterval('TaiC_Timer900', 1 )", "",}, HW2_Wait( 1 ), },
	}
Events.Ambush = 
	{
		{ HW2_Wait( 4 ), }, 
		HW2FX_EventStartSet(1,0,"Emperor",1,1,1), 
		{ HW2_Wait( 2 ), }, 
		{ {"Camera_Interpolate('here', 'Camera3', 3)", "",}, },
    { HW2_SubTitleEvent(actor_BS, "$41136", 8), HW2_Wait( 5 ), }, 
    { {"Camera_FocusRestore()", "",}, { "SobGroup_MakeDead('tempvision')", "" , }, },
    HW2FX_EventEndSet(1,1,1,0,1), 
	}
Events.PlayerWin = 
	{
        { HW2_SubTitleEvent(actor_BS, "$41057", 4), HW2_Wait( 5 ), }, 
        { HW2_SubTitleEvent(actor_BS, "$41058", 19), HW2_Wait( 2 ), }, 
        { HW2_SubTitleEvent(actor_BS, "$41059", 17), HW2_Wait( 1 ), }, 
        { HW2_SubTitleEvent(actor_BS, TaiC_41060(), 15.5), HW2_Wait( 1 ), }, 
        { { "UI_SetElementVisible('NewTaskbar','btnHW1SPHyperspace',1)", "", },  }, 
	}
	
function TaiC_RUCheck()
	if (Stats_GatheredRUSalvage(0)>TaiC_RU) then
		Ping_Remove(TaiC_Ping_6)
		Rule_Remove("TaiC_RUCheck")
		--SobGroup_ResetAvoidanceIgnore(<sSobGroupName>)
	else
		SobGroup_AvoidanceIgnore("Player_Ships0", "M_ARoid")
	end
end

function Vgr_BaseFleet()
	local iShip=0
	SobGroup_Clear("Vgr_OutBase")
	SobGroup_FillShipsByIndexRange("Vgr_OutBase", "Vgr_BaseFleet", 0, 1)
	while(SobGroup_Empty("Vgr_OutBase")==0)do
		if (SobGroup_IsInVolume("Vgr_OutBase", "CorridorVgrStage")==0) then
			SobGroup_Move(1,"Vgr_OutBase", "CorridorVgrStage")
		end
		SobGroup_Clear("Vgr_OutBase")
		iShip=iShip+1
		SobGroup_FillShipsByIndexRange("Vgr_OutBase", "Vgr_BaseFleet", iShip, 1)
	end
end

function TaiC_Hard1()
	for i=1,3 do
		SobGroup_FillSobGroupInVolume("TaiC_Hard", "Player_Ships0", "Reinforce1_Trigger"..i)
		if (SobGroup_AreAnyOfTheseTypes("TaiC_Hard", "Tai_BattleShip")==1) then
			Sound_SpeechPlay('data:sound/speech/allships/emperor/status_hyperspaceunitemerging_1')
			Subtitle_Add(actor_BS, "$41054", 4.5)
			SobGroup_ExitHyperSpace("Vgr_Reinforce1", "Vgr_Reinforce1")
			TaiC_EventPointer_9=EventPointer_AddVolume('Vgr_Reinforce1', HW2_rgb(230,230,230), 1500)
			Rule_AddInterval("TaiC_KillBS1",1)
			Rule_Remove("TaiC_Hard1")
			break
		end
	end
end

function TaiC_Hard2()
	for i=1,3 do
		SobGroup_FillSobGroupInVolume("TaiC_Hard", "Player_Ships0", "Reinforce2_Trigger"..i)
		if (SobGroup_AreAnyOfTheseTypes("TaiC_Hard", "Tai_BattleShip")==1) then
			Sound_SpeechPlay('data:sound/speech/allships/emperor/status_hyperspaceunitemerging_1')
			Subtitle_Add(actor_BS, "$41054", 4.5)
			SobGroup_ExitHyperSpace("Vgr_Reinforce2", "Vgr_Reinforce2")
			TaiC_EventPointer_10=EventPointer_AddVolume('Vgr_Reinforce1', HW2_rgb(230,230,230), 1200)
			SobGroup_Create("Vgr_Infil")
			Rule_AddInterval("TaiC_KillBS2",1)
			Rule_Remove("TaiC_Hard2")
			break
		end
	end
end

function TaiC_Timer900()
	if Timer_GetRemaining(2)<=0 then
		Subtitle_Add(actor_BS, "$41063", 1.5)
		Rule_Remove("TaiC_Timer900")
		Rule_AddInterval("TaiC_Kill",3)
	end
end

function TaiC_Kill()
	Subtitle_Add(actor_BS, "$41064", 3)
	Rule_Remove("TaiC_Kill")
	SobGroup_ExitHyperSpaceSobGroup("Vgr_KillFleet", "P_BS", 3000)
	Rule_AddInterval("TaiC_KillBS",1)
end

function TaiC_KillBS()
	if SobGroup_AreAllInRealSpace("Vgr_KillFleet")==1 then
		SobGroup_Attack(5,"Vgr_KillFleet", "P_BS")
		Rule_Remove("TaiC_KillBS")
	end
end

function TaiC_KillBS1()
	if SobGroup_AreAllInRealSpace("Vgr_Reinforce1")==1 then
		SobGroup_Attack(5,"Vgr_Reinforce1", "P_BS")
		Rule_Remove("TaiC_KillBS1")
	end
end

function TaiC_KillBS2()
	if SobGroup_AreAllInRealSpace("Vgr_Reinforce2")==1 then
		SobGroup_Attack(5,"Vgr_Reinforce2", "P_BS")
		SobGroup_FillShipsByType("Vgr_Infil", "Vgr_Reinforce2", "vgr_infiltratorfrigate")
		SobGroup_CloakToggle("Vgr_Infil")
		SobGroup_CaptureSobGroup("Vgr_Infil", "Player_Ships0")
		Rule_Remove("TaiC_KillBS2")
	end
end

function singlePlayerHyperspaceButtonPressed()
	Set_FX_Achievements_Value("TaiMiniComplete",1)
	Camera_SetLetterboxStateNoUI(1, 2)
    Universe_Fade(1, 5)
	UI_SetElementVisible('NewTaskbar','btnHW1SPHyperspace',0)
    --SobGroup_EnterHyperSpaceOffMap("Player_Ships0")
    Rule_AddInterval("FXT_End1",5)
end

function FXT_End1()
	Subtitle_Message("$41061", 3)
    Rule_AddInterval("FXT_End",5)
    Rule_Remove("FXT_End1")
end

function FXT_End()
    Profile_SetSingleMissionComplete("mini", 5, 1)
    FE_ExitToMainMenu()
    UI_DialogAccept()
end

function KadC_MissionFailed()
	Rule_AddInterval("KadC_MissionFailed1",5)
	Sound_MusicPlayType("data:sound/speech/allships/emperor/status_dreadnaughtdestroyed_report_1", MUS_Ambient)
	Camera_SetLetterboxStateNoUI(1, 2)
    Universe_Fade(1, 5)
    Rule_Remove("KadC_MissionFailed")
end

function KadC_MissionFailed1()
	Rule_AddInterval("KadC_MissionFailed2",5)
	Rule_Remove("KadC_MissionFailed1")
	Subtitle_Message("$41118", 3)
end

function KadC_MissionFailed2()
	Rule_Remove("KadC_MissionFailed2")
	setMissionComplete(0)
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
	Sound_SpeechSubtitlePath("speech:missions/WH_3/")
	Sound_EnableAllSpeech(1)
    --Camera_SetLetterboxStateNoUI(1,0)
    CPU_Enable(1, 0)
    CPU_Enable(2, 0)
    CPU_Enable(3, 0)
    CPU_Enable(4, 0)
    CPU_Enable(5, 0)
    Rule_AddInterval("Rule_DisablePlayer",0.1)
    Rule_Add("Rule_Init")
    --Rule_AddInterval("Mission_Start",10)
    Universe_Fade(1, 0)
--Achievements
		FX_Achievements_Init("FXsingleplayer")
--------
		Councilor_Switch=0
		FX_Common_Rule_OnInit()
	    --SobGroup_LoadPersistantData("Kad_Mothership")
	  Rule_Remove("CameraShakeCheck")
end

function TaiC_P1Engage()
	if (SobGroup_UnderAttack("P_Tai1")==1) then
		SobGroup_Attack(0, "P_Tai1", "Vgr_Sentry")
		Rule_Remove("TaiC_P1Engage")
	end
end

function Mission_Start()
	Universe_AllowPlayerOrders(1)
    --Rule_AddInterval("TurC_MissionFailCheck",3)
	Rule_AddInterval("TaiC_WatchTBB",1)
    Rule_Remove("Mission_Start")
    Camera_FocusSobGroupWithBuffer("P_BS", 1000, 1000, 3)
	Camera_AllowControl(1)
    SobGroup_Move(0, "P_Tai1", "Player_Adv")
    Rule_AddInterval("TaiC_P1Engage",1)
    --SobGroup_Move(0, "P_Tai2", "Player_Adv")
    SobGroup_Attack(0, "P_Tai2", "Vgr_Sentry")
    SobGroup_Attack(1, "Vgr_Craft","P_Tai2")
    SobGroup_Attack(1, "Vgr_Sentry", "P_Tai2")
    --SobGroup_RepairSobGroup("Tai_Repair", "Tai_StageForce")
	SobGroup_Create("Tai_StageForce1")
	SobGroup_Create("Tai_StageForce2")
	SobGroup_Create("Vgr_StageForce1")
	SobGroup_Create("Vgr_StageForce2")
	SobGroup_Create("Tai_Blockade")
	SobGroup_Create("Vgr_FleetHold")
	SobGroup_Create("Tai_Blockade")
	SobGroup_Create("Tai_Support")
	SobGroup_Create("Tai_BaseDock")
	SobGroup_SetSwitchOwnerFlag("P_BS",0)
	SobGroup_SetSwitchOwnerFlag("P_Tai1",0)
	SobGroup_SetSwitchOwnerFlag("P_Tai2",0)
	SobGroup_SetSwitchOwnerFlag("M_TutRoid",0)
	SobGroup_SetSwitchOwnerFlag("M_BRoid",0)
	SobGroup_SetSwitchOwnerFlag("Tai_rrCarrier",0)
end

function TaiC_StageForce()
	SobGroup_FillSobGroupInVolume("Tai_StageForce1", "Tai_StageForce", "StageFleet1")
	SobGroup_FillSobGroupInVolume("Tai_StageForce2", "Tai_StageForce", "StageFleet2")
	SobGroup_FillSobGroupInVolume("Vgr_StageForce1", "Player_Ships1", "StageFleet1")
	SobGroup_FillSobGroupInVolume("Vgr_StageForce2", "Player_Ships1", "StageFleet2")
	if (SobGroup_Empty("Vgr_StageForce1")==0) then
		SobGroup_Attack(3, "Tai_StageForce1", "Vgr_StageForce1")
		SobGroup_Attack(1, "Vgr_StageForce1", "Tai_StageForce1")
	end
	if (SobGroup_Empty("Vgr_StageForce2")==0) then
		SobGroup_Attack(3, "Tai_StageForce2", "Vgr_StageForce2")
		SobGroup_Attack(1, "Vgr_StageForce2", "Tai_StageForce2")
	end
end

function TaiC_VgrBlockade()
	SobGroup_FillSobGroupInVolume("Tai_Blockade", "Player_Ships0", "Vgr_BlockadeSphere")
	if (SobGroup_Empty("Tai_Blockade")==0) then
		SobGroup_Attack(1, "Vgr_Blockade", "Tai_Blockade")
		Rule_Remove("TaiC_VgrFleeCreate")
	end
	if (SobGroup_Empty("Vgr_Blockade")==1) then
		Objective_SetState(obj_DTB, OS_Complete)
		Ping_Remove(TaiC_Ping_1)
    	Sound_MusicPlayType("data:sound/music/ambient/amb_12", MUS_Ambient)
		Event_Start("BlockadeDestroyed")
		Rule_Remove("TaiC_VgrBlockade")
		Rule_Remove("TaiC_VgrFleeCreate")
	end
end

function TaiC_FleetHold()
	SobGroup_FillSobGroupInVolume("Vgr_FleetHold", "Player_Ships1", "FleetHoldSphere")
	SobGroup_RemoveType("Vgr_FleetHold", "vgr_probe_ecm")
	if (SobGroup_Empty("Vgr_FleetHold")==0) then
		SobGroup_Attack(3, "P_BS", "Vgr_FleetHold")
		SobGroup_Attack(3, "P_Tai1", "Vgr_FleetHold")
		SobGroup_Attack(3, "P_Tai2", "Vgr_FleetHold")
		if SobGroup_OwnedBy("Tai_rrCarrier")==3 then
			SobGroup_Attack(3, "Tai_rrCarrier", "Vgr_FleetHold")
		end
	else
		SobGroup_Move(3, "P_BS", "FleetHoldSphere")
		SobGroup_ParadeSobGroup("P_Tai1", "P_BS", 0)--SobGroup_Move(3, "P_Tai2", "FleetHoldSphere")
		SobGroup_ParadeSobGroup("P_Tai2", "P_BS", 0)--SobGroup_Move(3, "P_Tai2", "FleetHoldSphere")
		if SobGroup_OwnedBy("Tai_rrCarrier")==3 then
			SobGroup_ParadeSobGroup("Tai_rrCarrier", "P_BS", 0)--SobGroup_Move(3, "P_Tai1", "FleetHoldSphere")
		end
	end
end

function TaiC_ScoutRoid()
	if (SobGroup_IsInVolume("Player_Ships0", "S_FakeRoid1")==1)and(TaiC_Ping_2~=0) then
		Subtitle_Add(actor_HC, "$41067", 11)
		Ping_Remove(TaiC_Ping_2)
		TaiC_Ping_2 = 0
	elseif (SobGroup_IsInVolume("Player_Ships0", "S_FakeRoid2")==1)and(TaiC_Ping_3~=0) then
		Subtitle_Add(actor_HC, "$41068", 12)
		Ping_Remove(TaiC_Ping_3)
		TaiC_Ping_3 = 0
	elseif (SobGroup_IsInVolume("Player_Ships0", "S_TutRoidTrigger")==1) then
		if (TaiC_Ping_2~=0) then
			Ping_Remove(TaiC_Ping_2)
		end
		if (TaiC_Ping_3~=0) then
			Ping_Remove(TaiC_Ping_3)
		end
		Ping_Remove(TaiC_Ping_4)
		Rule_Remove("TaiC_ScoutRoid")
		Event_Start("RoidScouted")
	end
end

function TaiC_SecureBase()
	if (SobGroup_Empty("Vgr_TutGuard")==1) then
		SobGroup_SwitchOwner("M_TutRoid", 3)
		SobGroup_SetAutoLaunch("M_TutRoid", ShipHoldStayDockedAlways)
		Subtitle_Add(actor_BS, "$41012", 5)
		SobGroup_SwitchOwner("Tai_rrCarrier", 0)
		SobGroup_CreateShip("Tai_rrCarrier", "TAI_Interceptor")
		SobGroup_SwitchOwner("Tai_rrCarrier", 3)
		Rule_AddInterval("TaiC_DockBase",1)
		Rule_Remove("TaiC_SecureBase")
	end
end

function TaiC_DockBase()
	SobGroup_GetSobGroupDockedWithGroup("M_TutRoid", "Tai_BaseDock")
	if (SobGroup_Empty("Tai_BaseDock")==0) then
		Ping_Remove(TaiC_Ping_5)
		Event_Start("BaseDocked")
		Rule_Remove("TaiC_DockBase")
	end
end

function TaiC_AddEventPointer()
	local EPG={"M_ARoid","M_RoidE2","M_RoidE3","M_BRoid","M_CRoid","M_RoidE4"}
	if TaiC_EventPointerID>1 then
		EventPointer_Remove(TaiC_EventPointer[TaiC_EventPointerID-1])
	end
	if TaiC_EventPointerID==7 then
		Rule_Remove("TaiC_AddEventPointer")
	else
		TaiC_EventPointer[TaiC_EventPointerID]=EventPointer_AddSobGroup(EPG[TaiC_EventPointerID], HW2_rgb(230,230,230), 1000)
		TaiC_EventPointerID=TaiC_EventPointerID+1
	end
end

function TaiC_AddEventPointer2()
	local EPG={"M_ARoid","M_BRoid","M_CRoid"}
	local PTS={"$41072", "$41073", "$41074", }
	local PD1={"$41102", "$41104", "$41106", }
	local PD2={"$41103", "$41105", "$41107", }
	local SON={"$41075", "$41077", "$41079", }
	local SOD={"$41076", "$41078", "$41080", }
	if TaiC_EventPointerID2>1 then
		EventPointer_Remove(TaiC_EventPointer2[TaiC_EventPointerID2-1])
		TaiC_Ping[TaiC_EventPointerID2-1]=Ping_AddSobGroup(PTS[TaiC_EventPointerID2-1], "anomaly", EPG[TaiC_EventPointerID2-1])
		Ping_AddDescription(TaiC_Ping[TaiC_EventPointerID2-1], 0, PD1[TaiC_EventPointerID2-1])
		Ping_AddDescription(TaiC_Ping[TaiC_EventPointerID2-1], 1, PD2[TaiC_EventPointerID2-1])
		Ping_LabelVisible(TaiC_Ping[TaiC_EventPointerID2-1], 1)
		obj_SO[TaiC_EventPointerID2-1] = Obj_Helper(SON[TaiC_EventPointerID2-1], SOD[TaiC_EventPointerID2-1], OT_Secondary)
	end
	if TaiC_EventPointerID2==4 then
		Rule_Remove("TaiC_AddEventPointer2")
	else
		TaiC_EventPointer2[TaiC_EventPointerID2]=EventPointer_AddSobGroup(EPG[TaiC_EventPointerID2], HW2_rgb(230,230,230), 1000)
		TaiC_EventPointerID2=TaiC_EventPointerID2+1
	end
end

function TaiC_41019()
	Subtitle_Add(actor_BS, "$41019", 19)
	Rule_AddInterval("TaiC_41020",20)
	TaiC_SOTime=Universe_GameTime()+1200
	Rule_AddInterval("TaiC_FinalBattle7",420)
	Rule_Remove("TaiC_41019")
end

function TaiC_41020()
	Subtitle_Add(actor_BS, "$41020", 17)
	SobGroup_Create("TaiC_SOA")
	SobGroup_Create("TaiC_SOC")
	SobGroup_Create("TaiC_41039")
	SobGroup_Create("Vgr_SOA")
	SobGroup_Create("TaiC_Container")
	SobGroup_Create("TaiC_SOAPlayer")
	SobGroup_Create("TaiC_SOBPlayer")
	SobGroup_Create("TaiC_SOCPlayer")
	SobGroup_SetSwitchOwnerFlag("TaiC_SOA",0)
	SobGroup_SetSwitchOwnerFlag("M_ARoid",0)
	SobGroup_SetSwitchOwnerFlag("Vgr_CFleet",0)
	SobGroup_SwitchOwner("M_BRoid",0)
	SobGroup_AbilityActivate("M_BRoid", AB_Scuttle, 0)
	SobGroup_SetAutoLaunch("M_BRoid", ShipHoldStayDockedAlways)
	Rule_AddInterval("TaiC_SOA",1)
	Rule_AddInterval("TaiC_SOB",1)
	Rule_AddInterval("TaiC_SOC",1)
	Rule_AddInterval("TaiC_41039",1)
	Rule_AddInterval("TaiC_FinalBattle",10)
	Rule_Remove("TaiC_41020")
	for i=1,4 do
		TaiC_Ping2[i]=Ping_AddPoint("$41133", "anomaly", "Detect_Marker"..i)
		Ping_LabelVisible(TaiC_Ping2[i], 1)
	end
end

function TaiC_41039()
	for i=1,5 do
		SobGroup_FillSobGroupInVolume("TaiC_41039", "Player_Ships0", "Detect_Warning"..i)
		if (SobGroup_AreAnyFromTheseAttackFamilies("TaiC_41039", "Frigate, SmallCapitalShip, BigCapitalShip")==1) then
			Subtitle_Add(actor_BS, "$41039", 16.5)
			Rule_Remove("TaiC_41039")
			Rule_AddInterval("TaiC_41055",1)
			break
		end
	end
end

function TaiC_41055()
	for i=1,6 do
		SobGroup_FillSobGroupInVolume("TaiC_41039", "Player_Ships0", "Detect_Trigger"..i)
		if (SobGroup_AreAnyFromTheseAttackFamilies("TaiC_41039", "Frigate, SmallCapitalShip, BigCapitalShip")==1) then
			for i=1,3 do
				if (Objective_GetState(obj_SO[i])==OS_Complete) then
					TaiC_SO3=TaiC_SO3+1
				else
					Objective_SetState(obj_SO[i],OS_Failed)
					Ping_Remove(TaiC_Ping[i])
				end
			end
			Subtitle_Add(actor_BS, "$41055", 2)
			Event_Start("FinalBattleHard")
	        Objective_SetState(obj_PTA, OS_Complete)
			Rule_Remove("TaiC_FinalBattle7")
			Rule_Remove("TaiC_FinalBattle12")
			Rule_Remove("TaiC_FinalBattle")
			Rule_Remove("TaiC_41055")
			KadC_AutoSave(2)
			break
		end
	end
end

function TaiC_FinalBattle7()
	SobGroup_Move(3, "Tai_StageForce", "StageForceRallySphere")
	Rule_AddInterval("TaiC_FinalBattle12",420)
	Rule_Remove("TaiC_FinalBattle7")
end

function TaiC_FinalBattle12()
	Subtitle_Add(actor_BS, "$41052", 11)
	Sound_MusicPlayType("data:sound/music/ambient/tai_meg", MUS_Ambient)
	Rule_Remove("TaiC_FinalBattle12")
end

function TaiC_FinalBattle()
	if TaiC_SOTime<Universe_GameTime() then
		for i=1,3 do
			if (Objective_GetState(obj_SO[i])==OS_Complete) then
				TaiC_SO3=TaiC_SO3+1
			else
				Objective_SetState(obj_SO[i],OS_Failed)
				Ping_Remove(TaiC_Ping[i])
			end
		end
        Subtitle_Add(actor_BS, "$41021", 12.5)
        if TaiC_SO3>1 then
        	Event_Start("FinalBattleNormal")
        else
        	Event_Start("FinalBattleHard")
        end
        Objective_SetState(obj_PTA, OS_Complete)
    Rule_AddInterval("TaiC_VgrBaseCC",1)
    SobGroup_CreateIfNotExist("BaseCCTrigger")
		Rule_Remove("TaiC_FinalBattle")
		Rule_Remove("TaiC_41039")
		Rule_Remove("TaiC_41055")
		KadC_AutoSave(2)
	elseif (Objective_GetState(obj_SO[1])==OS_Complete) and  (Objective_GetState(obj_SO[2])==OS_Complete) and (Objective_GetState(obj_SO[3])==OS_Complete) and (TaiC_SO3==0) and(Event_IsDone("SOAComplete")==1) and(Event_IsDone("SOB")==1) and(Event_IsDone("SOCComplete")==1) then
		Event_Start("SO3")
		TaiC_SOTime = Universe_GameTime() + 210
		TaiC_SO3 = 1
		Set_FX_Achievements_Value("TaiMiniFullComplete",1)
	end
end

function TaiC_VgrBaseCC()
	SobGroup_FillSobGroupInVolume("BaseCCTrigger", "Player_Ships0", "Vgr_ExtraDefCCTrigger")
	if (SobGroup_AreAnyFromTheseAttackFamilies("BaseCCTrigger", "SmallCapitalShip, BigCapitalShip")==1) then
		SobGroup_SetHidden( "Vgr_BaseDefCC", 0)
		SobGroup_Attack(1, "Vgr_BaseDefCC", "BaseCCTrigger")
		Rule_AddInterval("TaiC_41135",12)
		Rule_Remove("TaiC_VgrBaseCC")
	end
	SobGroup_Clear("BaseCCTrigger")
end

function TaiC_41135()
	Subtitle_Add(actor_BS, "$41135", 6)
	Rule_Remove("TaiC_41135")
end

function TaiC_Retreat()
	SobGroup_FillSobGroupInVolume("TaiC_SOAPlayer", "Player_Ships0", "SiteA")
	SobGroup_FillSobGroupInVolume("TaiC_SOBPlayer", "Player_Ships0", "SiteB")
	SobGroup_FillSobGroupInVolume("TaiC_SOCPlayer", "Player_Ships0", "SiteC")
	SobGroup_ParadeSobGroup("TaiC_SOAPlayer", "P_BS", 0)
	SobGroup_ParadeSobGroup("TaiC_SOBPlayer", "P_BS", 0)
	SobGroup_ParadeSobGroup("TaiC_SOCPlayer", "P_BS", 0)
end

function TaiC_ScoutFleet()
	if (Objective_GetState(obj_SO[3])==OS_Complete) then
		SobGroup_ParadeSobGroup("Tai_ScoutFleet", "P_BS", 0)
		SobGroup_SetSwitchOwnerFlag("Tai_ScoutFleet",0)
		SobGroup_SwitchOwner("Tai_ScoutFleet", 0)
	    SobGroup_AbilityActivate("Tai_ScoutFleet", AB_Move, 1)
	    SobGroup_AbilityActivate("Tai_ScoutFleet", AB_Attack, 1)
	    Subtitle_Add(actor_BS, "$41095", 10)
	end
	for i=1,4 do
		Ping_Remove(TaiC_Ping2[i])
	end
	SobGroup_FollowPath("Vgr_EliteCC1", "Vgr_CC1", 1, 1, 1)
	SobGroup_Create("TaiC_CorridorBS1")
	SobGroup_Create("TaiC_Hard")
	SobGroup_Create("Vgr_CCAttack")
	SobGroup_Create("Vgr_OutBase")
	Rule_AddInterval("TaiC_CorridorBS1",1)
	Rule_AddInterval("TaiC_PlayerWin",1)
	Rule_AddInterval("Vgr_EliteCC1", 1)
end

function Vgr_EliteCC1()
	if (SobGroup_IsInVolume("Vgr_EliteCC1", "Vgr_CC")==1)and(Vgr_EliteCC==0) then
		Vgr_EliteCC=1
		SobGroup_FollowPath("Vgr_EliteCC1", "Vgr_CC2", 1, 1, 1)
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_missilecorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_missilecorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_bomber"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_bomber"))
	elseif (SobGroup_IsInVolume("Vgr_EliteCC1", "Vgr_CC")==0)and(Vgr_EliteCC==1) then
		Vgr_EliteCC=2
		SobGroup_Attack(1,"Vgr_CCAttack","Player_Ships0")
	elseif (SobGroup_IsInVolume("Vgr_EliteCC1", "Vgr_CC")==1)and(Vgr_EliteCC==2) then
		Vgr_EliteCC=3
		SobGroup_FollowPath("Vgr_EliteCC1", "Vgr_CC2", 1, 1, 1)
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_missilecorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_missilecorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_bomber"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_bomber"))
	elseif (SobGroup_IsInVolume("Vgr_EliteCC1", "Vgr_CC")==0)and(Vgr_EliteCC==3) then
		Vgr_EliteCC=4
		SobGroup_Attack(1,"Vgr_CCAttack","Player_Ships0")
	elseif (SobGroup_IsInVolume("Vgr_EliteCC1", "Vgr_CC")==1)and(Vgr_EliteCC==4) then
		Vgr_EliteCC=5
		SobGroup_FollowPath("Vgr_EliteCC1", "Vgr_CC2", 1, 1, 1)
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_missilecorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_missilecorvette"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_bomber"))
		SobGroup_SobGroupAdd("Vgr_CCAttack",SobGroup_CreateShip("Vgr_EliteCC1", "vgr_bomber"))
	elseif (SobGroup_IsInVolume("Vgr_EliteCC1", "Vgr_CC")==0)and(Vgr_EliteCC==5) then
		Rule_Remove("Vgr_EliteCC1")
		SobGroup_Attack(1,"Vgr_CCAttack","Player_Ships0")
	end
end

function TaiC_ShipyardDestroy()
	if (SobGroup_Empty("Vgr_Shipyard")==1) then
		Ping_Remove(TaiC_Ping_10)
		Rule_Remove("TaiC_ShipyardDestroy")
	end
end

function TaiC_StationDestroy()
	if (SobGroup_Empty("Vgr_Station")==1) then
		Ping_Remove(TaiC_Ping_9)
		Rule_Remove("TaiC_StationDestroy")
	end
end

function TaiC_CorridorBS1()
	SobGroup_FillSobGroupInVolume("TaiC_CorridorBS1", "Player_Ships0", "CorridorBS1")
	if (SobGroup_AreAnyFromTheseAttackFamilies("TaiC_CorridorBS1", "SmallCapitalShip, BigCapitalShip")==1) then
		Ping_Remove(TaiC_Ping_7)
		TaiC_Ping_8=Ping_AddPoint("$41062", "anomaly", "CorridorBS2")
		Ping_AddDescription(TaiC_Ping_8, 0, "$41117")
		Ping_LabelVisible(TaiC_Ping_8, 1)
		SobGroup_Create("TaiC_CorridorBS2")
		Rule_AddInterval("TaiC_CorridorBS2",1)
		Rule_Remove("TaiC_CorridorBS1")
	end
end

function TaiC_CorridorBS2()
	SobGroup_FillSobGroupInVolume("TaiC_CorridorBS2", "Player_Ships0", "CorridorBS2")
	if (SobGroup_AreAnyFromTheseAttackFamilies("TaiC_CorridorBS1", "SmallCapitalShip, BigCapitalShip")==1) then
		Ping_Remove(TaiC_Ping_8)
		TaiC_Ping_9=Ping_AddSobGroup("$41108", "anomaly", "Vgr_Station")
		TaiC_Ping_10=Ping_AddSobGroup("$41109", "anomaly", "Vgr_Shipyard")
		Rule_AddInterval("TaiC_ShipyardDestroy",1)
		Rule_AddInterval("TaiC_StationDestroy",1)
		Ping_LabelVisible(TaiC_Ping_9, 1)
		Ping_LabelVisible(TaiC_Ping_10, 1)
		SobGroup_Create("TaiC_Ambush")
		Rule_AddInterval("TaiC_Ambush",1)
	    Subtitle_Add(actor_BS, "$41056", 14.5)
		Rule_Remove("TaiC_CorridorBS2")
		SobGroup_Spawn("Vgr_Station", "Vgr_Station")
	end
end

function TaiC_Ambush()
	SobGroup_FillSobGroupInVolume("TaiC_Ambush", "Player_Ships0", "AmbushTrigger")
	if (SobGroup_AreAnyOfTheseTypes("TaiC_Ambush", "Tai_BattleShip")==1) then
		SobGroup_ExitHyperSpace("Vgr_EliteCC2", "AmbushExit")
		Subtitle_Add(actor_BS, "$41137", 4)
		Rule_AddInterval("TaiC_Ambush2",1)
		Event_Start("Ambush")
		SobGroup_SpawnNewShipInSobGroup(0, "rpg_inhibitor", "rpg_inhibitor", "tempvision", "AmbushExit")
		Rule_Remove("TaiC_Ambush")
	end
end

function TaiC_Ambush2()
	if (SobGroup_AreAllInRealSpace("Vgr_EliteCC2")==1) then
		SobGroup_FormStrikeGroup("Vgr_EliteCC2", "Capital Phalanx")
		SobGroup_Attack(1, "Vgr_EliteCC2", "P_BS")
		SobGroup_Create("Vgr_CC2")
		SobGroup_FillShipsByType("Vgr_CC2", "Vgr_EliteCC2", "Vgr_Carrier")
		NameSobGroup("Vgr_CC2", "$41110")
		SobGroup_CreateSubSystem("Vgr_CC2", "vgr_c_production_frigate")
		SobGroup_CreateSubSystem("Vgr_CC2", "vgr_c_module_hyperspace")
		Rule_AddInterval("Vgr_EliteCC2",40)
		Rule_Remove("TaiC_Ambush2")
		Camera_FocusSave()
	end
end

function Vgr_EliteCC2()
	if (SobGroup_Empty("Vgr_CC2")==0) then
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_interceptor"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_interceptor"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_interceptor"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_bomber"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_bomber"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_lancefighter"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_lasercorvette"))
		SobGroup_SobGroupAdd("Vgr_EliteCC2",SobGroup_CreateShip("Vgr_CC2","vgr_missilecorvette"))
		SobGroup_Attack(1,"Vgr_EliteCC2","Player_Ships0")
	else
		Rule_Remove("Vgr_EliteCC2")
	end
end

function TaiC_PlayerWin()
	if (SobGroup_Empty("Vgr_Shipyard")==1)and(SobGroup_Empty("Vgr_Station")==1) then
		Timer_End(2)
        Objective_SetState(obj_PTV, OS_Complete)
    	Sound_MusicPlayType("data:sound/music/ambient/a04_mission5", MUS_Ambient)
		Event_Start("PlayerWin")
		Rule_Remove("TaiC_PlayerWin")
		Rule_Remove("TaiC_Timer900")
	end
end

function TaiC_SOC()
	if (Objective_GetState(obj_SO[3])==OS_Failed) then
		Rule_Remove("TaiC_SOC")
	end
	SobGroup_FillSobGroupInVolume("TaiC_SOCPlayer", "Player_Ships0", "CWarning")
	if (SobGroup_Empty("TaiC_SOCPlayer")==0) then
		Rule_Remove("TaiC_SOC")
		SobGroup_Create("TaiC_SOCPlayerV")
		Event_Start("SOC")
		Rule_AddInterval("TaiC_SOC2",1)
		SobGroup_Spawn("Tai_ScoutFleet", "Tai_Scout")
	end
end

function SobGroup_RemoveSobGroup(sg1,sg2)
	SobGroup_CreateIfNotExist("SobGroupTempRemoveGroup")
	SobGroup_FillSubstract("SobGroupTempRemoveGroup", sg1, sg2)
	SobGroup_Clear(sg1)
	SobGroup_Copy(sg1,"SobGroupTempRemoveGroup")
end

function TaiC_SOC2()
	if (Objective_GetState(obj_SO[3])==OS_Failed) then
		Rule_Remove("TaiC_SOC2")
	end
	SobGroup_Clear("TaiC_SOC")
	SobGroup_FillCompare("TaiC_SOC", "Vgr_CFleet", "Player_Ships0")
	if SobGroup_Count("TaiC_SOC")>0 then
		SobGroup_SobGroupAdd("TaiC_SOCPlayerV","TaiC_SOC")
		Sound_SpeechPlay("data:sound/speech/allships/emperor/status_enemyfrigatecaptured_1")
		SobGroup_RemoveSobGroup("Vgr_CFleet", "TaiC_SOC")
	end
	SobGroup_FillSobGroupInVolume("TaiC_SOCPlayer", "Player_Ships0", "SiteC")
	if (SobGroup_Empty("TaiC_SOCPlayer")==0) then
		SobGroup_Attack(1, "Vgr_CFleet", "TaiC_SOCPlayer")
	else
		SobGroup_Stop(1, "Vgr_CFleet")
	end
	if (SobGroup_Empty("Vgr_CFleet")==1) then
		if (SobGroup_Empty("TaiC_SOCPlayerV")==0) then
			Event_Start("SOCComplete")
		else
			Event_Start("SOCFailed")
		end
		Rule_Remove("TaiC_SOC2")
	end
end

function TaiC_SOB()
	if (Objective_GetState(obj_SO[2])==OS_Failed) then
		Rule_Remove("TaiC_SOB")
	end
	SobGroup_FillSobGroupInVolume("TaiC_SOBPlayer", "Player_Ships0", "SiteB")
	SobGroup_RemoveType("TaiC_SOBPlayer", "meg_gehenna_1")
	if (SobGroup_Empty("TaiC_SOBPlayer")==0) then
		SobGroup_Attack(1, "Vgr_BFleet", "TaiC_SOBPlayer")
		if SobGroup_AreAnyFromTheseAttackFamilies("TaiC_SOBPlayer", "Fighter")==1 then
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_lightcorvette")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_heavycorvette")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_salcapcorvette")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_standardfrigate")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_ioncannonfrigate")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_defensefrigate")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_supportfrigate")
			SobGroup_Attack(1, "Vgr_BPlatform", "TaiC_SOBPlayer")
		elseif SobGroup_AreAnyFromTheseAttackFamilies("TaiC_SOBPlayer", "Corvette")==1 then
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_standardfrigate")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_ioncannonfrigate")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_defensefrigate")
			SobGroup_RemoveType("TaiC_SOBPlayer", "tai_supportfrigate")
			SobGroup_Attack(1, "Vgr_BPlatform", "TaiC_SOBPlayer")
		else
			SobGroup_Attack(1, "Vgr_BPlatform", "TaiC_SOBPlayer")
		end
	else
		SobGroup_Stop(1, "Vgr_BFleet")
	end
	SobGroup_Clear("TaiC_SOBPlayer")
	SobGroup_GetSobGroupDockedWithGroup("M_BRoid", "TaiC_SOBPlayer")
	if (SobGroup_Empty("TaiC_SOBPlayer")==0) then
		Event_Start("SOB")
		Sound_SpeechPlay("data:sound/speech/missions/WH_3/T_22_roidacquired")
		SobGroup_SwitchOwner("M_BRoid",3)
		SobGroup_Attack(1, "Vgr_BFleet", "Player_Ships0")
		Rule_Remove("TaiC_SOB")
	end
end

function TaiC_SOA()
	if (Objective_GetState(obj_SO[1])==OS_Failed) then
		Rule_Remove("TaiC_SOA")
	end
	if (SobGroup_FillSobGroupInVolume("TaiC_SOA", "Player_Ships0", "SiteA")==1) then
		if (SobGroup_AreAnyFromTheseAttackFamilies("TaiC_SOA", "Frigate")==1) then
			local iShip=0
			SobGroup_Clear("TaiC_SOA")
			SobGroup_FillShipsByIndexRange("TaiC_SOA", "Player_Ships0", 0, 1)
			while(SobGroup_Empty("TaiC_SOA")==0)do
				if (SobGroup_IsInVolume("TaiC_SOA", "SiteA")==1)and(SobGroup_AreAnyFromTheseAttackFamilies("TaiC_SOA", "Frigate")==1) then
					Rule_Remove("TaiC_SOA")
					SobGroup_SwitchOwner("TaiC_SOA", 3)
				    SobGroup_AbilityActivate("TaiC_SOA", AB_Attack, 0)
				    SobGroup_AbilityActivate("TaiC_SOA", AB_Move, 0)
    				Event_Start("SOA")
					break
				end
				SobGroup_Clear("TaiC_SOA")
				iShip=iShip+1
				SobGroup_FillShipsByIndexRange("TaiC_SOA", "Player_Ships0", iShip, 1)
			end
		end
	end
end

function TaiC_SOAAttack()
	SobGroup_FillSobGroupInVolume("TaiC_SOAPlayer", "Player_Ships0", "SiteA")
	if (SobGroup_Empty("TaiC_SOAPlayer")==0) then
		SobGroup_Attack(1, "Vgr_SOA", "TaiC_SOAPlayer")
	else
		SobGroup_Attack(1, "Vgr_SOA", "TaiC_SOA")
	end
end

function TaiC_SOATimer90()
	if (Timer_GetRemaining(1)<=90)and(SobGroup_Empty("TaiC_SOA")==0) then
		Subtitle_Add(actor_AF, "$41024", 1.5)
		Rule_Remove("TaiC_SOATimer90")
		Rule_AddInterval("TaiC_SOATimer40", 1)
	elseif (SobGroup_Empty("TaiC_SOA")==1) then
		Event_Start("SOAFailed")
		Rule_Remove("TaiC_SOATimer90")
	end
end

function TaiC_SOATimer40()
	if (Timer_GetRemaining(1)<=40)and(SobGroup_Empty("TaiC_SOA")==0) then
		Subtitle_Add(actor_AF, "$41025", 1.5)
		Rule_Remove("TaiC_SOATimer40")
		Sound_SpeechPlay("data:sound/speech/missions/WH_3/T_33_keepitclose")
		Rule_AddInterval("TaiC_SOATimer00", 1)
	elseif (SobGroup_Empty("TaiC_SOA")==1) then
		Event_Start("SOAFailed")
		Rule_Remove("TaiC_SOATimer40")
	end
end

function TaiC_SOATimer00()
	if (Timer_GetRemaining(1)<=0)and(SobGroup_Empty("TaiC_SOA")==0) then
		Rule_Remove("TaiC_SOATimer00")
		Sound_SpeechPlay("data:sound/speech/missions/WH_3/T_33_keepitclose")
		Event_Start("SOAComplete")
		SobGroup_SwitchOwner("TaiC_SOA",0)
	    SobGroup_AbilityActivate("TaiC_SOA", AB_Attack, 1)
	    SobGroup_AbilityActivate("TaiC_SOA", AB_Move, 1)
		SobGroup_SwitchOwner("M_ARoid",3)
	elseif (SobGroup_Empty("TaiC_SOA")==1) then
		Event_Start("SOAFailed")
		Rule_Remove("TaiC_SOATimer00")
	end
end

function TaiC_SOAFailed()
	--SobGroup_Clear("TaiC_SOA")
	--SobGroup_FillSobGroupInVolume("TaiC_SOA", "Player_Ships0", "A_Abort")
	--SobGroup_ParadeSobGroup("TaiC_SOA", "P_BS", 0)
	Objective_SetState(obj_SO[1], OS_Failed)
	Ping_Remove(TaiC_Ping[1])
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
    Event_Start("Intro")
    Universe_AllowPlayerOrders(0)
    Event_Start("Chatter")
	Sound_MusicPlayType('data:sound/music/battle/battle_01', MUS_Ambient)
    SobGroup_SetHealth("Vgr_OPDD", 0.03)
	--Camera_TrackSobGroupFromPosition("Vgr_OPDD",{6211, 2960, 61617})
	Camera_UseCameraPoint("Camera1")
	SobGroup_SetROE("P_Tai1", PassiveROE)
	SobGroup_SetROE("P_Tai2", PassiveROE)
	--Camera_UseCameraPoint("Cam_Start")
    Player_SetPlayerName(1, "$41112")
    Player_SetPlayerName(2, "$41113")
    Player_SetPlayerName(3, "$41114")
    Player_SetPlayerName(4, "$41115")
    Player_SetPlayerName(5, "$41116")
    SetAlliance( 1, 2)
    SetAlliance( 2, 1)
    SetAlliance( 0, 3)
    SetAlliance( 3, 0)
    SetAlliance( 1, 5)
    SetAlliance( 5, 1)
    SetAlliance( 2, 5)
    SetAlliance( 5, 2)
    SetAlliance( 0, 4)
    SetAlliance( 4, 0)
    SetAlliance( 3, 4)
    SetAlliance( 4, 3)
	SobGroup_Create("Vgr_Flee")
	SobGroup_Create("Vgr_Flee1")
	SobGroup_Create("Vgr_Flee2")
	SobGroup_Create("Vgr_Flee3")
	SobGroup_Create("Vgr_Flee4")
    SobGroup_AbilityActivate("Player_Ships4", AB_Sensors, 0)
    --Sound_EnableAllSpeech(0)
    Rule_Remove("Rule_Init")
    Rule_AddInterval("TaiC_VgrFleeCreate",1)
	Rule_AddInterval("TaiC_VgrFlee",1)
	SobGroup_SetHidden( "Vgr_BaseDefCC", 1)
end

function TaiC_VgrFleeCreate()
	if Vgr_FleeCode[1]==0 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_interceptor", "vgr_interceptor", "Vgr_Flee1", "Vgr_GateVol1")
		SobGroup_SetHealth("Vgr_Flee1", random(20,40)/100)
		Vgr_FleeCode[1]=26
	elseif Vgr_FleeCode[1]==16 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_missilecorvette", "vgr_missilecorvette", "Vgr_Flee1", "Vgr_GateVol1")
		SobGroup_SetHealth("Vgr_Flee1", random(20,40)/100)
		Vgr_FleeCode[1]=44
	elseif Vgr_FleeCode[1]==28 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_missilecorvette", "vgr_missilecorvette", "Vgr_Flee1", "Vgr_GateVol1")
		SobGroup_SetHealth("Vgr_Flee1", random(20,40)/100)
		Vgr_FleeCode[1]=56
	elseif Vgr_FleeCode[1]==46 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_lancefighter", "vgr_lancefighter", "Vgr_Flee1", "Vgr_GateVol1")
		SobGroup_SetHealth("Vgr_Flee1", random(20,40)/100)
		Vgr_FleeCode[1]=14
	elseif Vgr_FleeCode[1]>0 then
		Vgr_FleeCode[1]=Vgr_FleeCode[1]-1
	end
	if Vgr_FleeCode[2]==0 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_interceptor", "vgr_bomber", "Vgr_Flee2", "Vgr_GateVol2")
		SobGroup_SetHealth("Vgr_Flee2", random(20,40)/100)
		Vgr_FleeCode[2]=56
	elseif Vgr_FleeCode[2]==32 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_missilecorvette", "vgr_lasercorvette", "Vgr_Flee2", "Vgr_GateVol2")
		SobGroup_SetHealth("Vgr_Flee2", random(20,40)/100)
		Vgr_FleeCode[2]=30
	elseif Vgr_FleeCode[2]>0 then
		Vgr_FleeCode[2]=Vgr_FleeCode[2]-1
	end
	if Vgr_FleeCode[3]==0 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_interceptor", "vgr_interceptor", "Vgr_Flee3", "Vgr_GateVol3")
		SobGroup_SetHealth("Vgr_Flee3", random(20,40)/100)
		Vgr_FleeCode[3]=32
	elseif Vgr_FleeCode[3]==22 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_missilecorvette", "vgr_bomber", "Vgr_Flee3", "Vgr_GateVol3")
		SobGroup_SetHealth("Vgr_Flee3", random(20,40)/100)
		Vgr_FleeCode[3]=50
	elseif Vgr_FleeCode[3]==34 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_missilecorvette", "vgr_interceptor", "Vgr_Flee3", "Vgr_GateVol3")
		SobGroup_SetHealth("Vgr_Flee3", random(20,40)/100)
		Vgr_FleeCode[3]=62
	elseif Vgr_FleeCode[3]==52 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_lancefighter", "vgr_lancefighter", "Vgr_Flee3", "Vgr_GateVol3")
		SobGroup_SetHealth("Vgr_Flee3", random(20,40)/100)
		Vgr_FleeCode[3]=20
	elseif Vgr_FleeCode[3]>0 then
		Vgr_FleeCode[3]=Vgr_FleeCode[3]-1
	end
	if Vgr_FleeCode[4]==0 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_interceptor", "vgr_heavymissilefrigate", "Vgr_Flee4", "Vgr_GateVol4")
		SobGroup_SetHealth("Vgr_Flee4", random(20,40)/100)
		Vgr_FleeCode[4]=46
	elseif Vgr_FleeCode[4]==32 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_missilecorvette", "vgr_artilleryfrigate", "Vgr_Flee4", "Vgr_GateVol4")
		SobGroup_SetHealth("Vgr_Flee4", random(20,40)/100)
		Vgr_FleeCode[4]=72
	elseif Vgr_FleeCode[4]==48 then
		SobGroup_SpawnNewShipInSobGroup(2, "vgr_missilecorvette", "vgr_missilecorvette", "Vgr_Flee4", "Vgr_GateVol4")
		SobGroup_SetHealth("Vgr_Flee4", random(20,40)/100)
		Vgr_FleeCode[4]=30
	elseif Vgr_FleeCode[4]>0 then
		Vgr_FleeCode[4]=Vgr_FleeCode[4]-1
	end
end

function TaiC_VgrFlee()
	for i=1,4 do
		SobGroup_MoveToPoint(2,"Vgr_Flee"..i, {791, 3193, 21454})
	end
	SobGroup_FillSobGroupInVolume("Vgr_Flee", "Player_Ships2", "Vgr_ExitSphere")
	SobGroup_MakeDead("Vgr_Flee")
	if SobGroup_Count("Player_Ships2")==0 then
		Rule_Remove("TaiC_VgrFlee")
	end

end

function TaiC_WatchTBB()
	if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "tai_battleship")==0)and(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(3, "tai_battleship")==0) then
		KadC_MissionFailed()
		Rule_Remove("TaiC_WatchTBB")
	end
end

function Rule_DisablePlayer()
	dofilepath("player:PLAYERCFG.LUA")
	Player_SetTeamColours(Universe_CurrentPlayer(),{PlayerSetup.teamcolour[1]/255,PlayerSetup.teamcolour[2]/255,PlayerSetup.teamcolour[3]/255,},{PlayerSetup.stripecolour[1]/255,PlayerSetup.stripecolour[2]/255,PlayerSetup.stripecolour[3]/255,})
    --SobGroup_AbilityActivate("Tai_rrCarrier", AB_Builder, 0)
    SobGroup_AbilityActivate("Tai_ScoutFleet", AB_Move, 0)
    SobGroup_AbilityActivate("Tai_ScoutFleet", AB_Attack, 0)
    SobGroup_AbilityActivate("Tai_rrCarrier", AB_Attack, 0)
    Player_RestrictResearchOption(0, "Tai_CapitalWeaponUpgrade2")
    Player_RestrictResearchOption(0, "Tai_FrigateWeaponUpgrade2")
    Player_RestrictResearchOption(0, "Tai_AirWeaponUpgrade2")
    Player_RestrictResearchOption(0, "Tai_CapitalHealthUpgrade3")
    Player_RestrictResearchOption(0, "Tai_FrigateHealthUpgrade3")
    Player_RestrictResearchOption(0, "Tai_AirHealthUpgrade3")
    Player_RestrictResearchOption(0, "Tai_CapitalHealthUpgrade1")
    Player_RestrictResearchOption(0, "Tai_FrigateHealthUpgrade1")
    Player_RestrictResearchOption(0, "Tai_AirHealthUpgrade1")
    Player_GrantResearchOption(0, "Tai_CapitalHealthUpgrade2")
    Player_GrantResearchOption(0, "Tai_CapitalWeaponUpgrade1")
    Player_GrantResearchOption(0, "Tai_FrigateHealthUpgrade2")
    Player_GrantResearchOption(0, "Tai_FrigateWeaponUpgrade1")
    Player_GrantResearchOption(0, "Tai_AirWeaponUpgrade1")
    Player_GrantResearchOption(0, "Tai_AirHealthUpgrade2")
    Player_RestrictBuildOption(0, "Tai_ResearchStation")
    Player_RestrictBuildOption(0, "Tai_ResearchShip")
    Player_RestrictBuildOption(0, "Tai_Scout")
    Player_RestrictBuildOption(0, "Tai_Interceptor")
    Player_RestrictBuildOption(0, "Tai_AttackBomber")
    Player_RestrictBuildOption(0, "Tai_LightCorvette")
    Player_RestrictBuildOption(0, "Tai_HeavyCorvette")
    Player_RestrictBuildOption(0, "Tai_SalcapCorvette")
    Player_RestrictBuildOption(0, "Tai_StandardFrigate")
    Player_RestrictBuildOption(0, "Tai_IonCannonFrigate")
    Player_RestrictBuildOption(0, "Tai_SupportFrigate")
    Player_RestrictBuildOption(0, "Tai_DefenseFrigate")
    Player_RestrictBuildOption(0, "Tai_ResourceCollector")
    Player_RestrictBuildOption(0, "Tai_HeavyDefender")
    Player_RestrictBuildOption(0, "Tai_DefenseFighter")
    Rule_Remove("Rule_DisablePlayer")
    Player_GrantResearchOption(3, "Tai_CapitalHealthUpgrade1")
    Player_GrantResearchOption(3, "Tai_FrigateHealthUpgrade1")
    Player_GrantResearchOption(3, "Tai_AirHealthUpgrade1")
    Player_GrantResearchOption(4, "Tai_CapitalHealthUpgrade3")
    Player_GrantResearchOption(4, "Tai_CapitalWeaponUpgrade3")
    Player_GrantResearchOption(4, "Tai_FrigateHealthUpgrade3")
    Player_GrantResearchOption(4, "Tai_FrigateWeaponUpgrade3")
    Player_GrantResearchOption(4, "Tai_AirWeaponUpgrade3")
    Player_GrantResearchOption(4, "Tai_AirHealthUpgrade3")
end