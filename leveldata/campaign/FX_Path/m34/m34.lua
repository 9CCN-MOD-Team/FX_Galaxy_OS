FXP_PlayerAI=
{
	EmptySoul=
	{
		{"$100359",4},
		;
		Num=1,
		Actor=20,
	},
	Explorer=
	{
		{"$100340",4},
		;
		Num=1,
		Actor=16,
	},
	Droid=
	{
		{"$100341",2},
		{"$100342",2},
		;
		Num=1,
		Actor=4,
	},
	PayDay=
	{
		{"$100343",9},
		{"$100344",10},
		;
		Num=1,
		Actor=7,
	},
	Starlancer=
	{
		{"$100345",6},
		{"$100346",5},
		;
		Num=1,
		Actor=4,
	},
	CPU1=
	{
		{"$100348",6},
		;
		Num=1,
		Actor=16,
	},
	Corvette=
	{
		{"$100349",8},
		{"$100350",2},
		;
		Num=1,
		Actor=21,
	},
	Marine=
	{
		{"$100351",7},
		{"$100352",4},
		;
		Num=1,
		Actor=1,
	},
	DeatH=
	{
		{"$100353",4},
		;
		Num=1,
		Actor=20,
	},
	KarBo=
	{
		{"$100354",4},
		;
		Num=1,
		Actor=16,
	},
	Adun=
	{
		{"$100355",3},
		{"$100356",2},
		;
		Num=1,
		Actor=1,
	},
	LinLin=
	{
		{"$100357",4},
		;
		Num=1,
		Actor=20,
	},
	Midnight=
	{
		{"$100358",4},
		;
		Num=1,
		Actor=20,
	},
}
--成就系统管理代码
dofilepath("data:scripts/FX_AchievementControl.lua")
--加载X系统文件
dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")

dofilepath("data:leveldata/multiplayer/lib/ui.lua")
dofilepath("data:leveldata/campaign/FX_Path/scripts/main.lua")

dofilepath("data:scripts/SCAR/SCAR_Util.lua")

dofilepath("Locale:PathDesc.lua")
dofilepath("data:scripts/FX_SwitchMainMenu.lua")
dofilepath("data:scripts/debug.lua")
FXP_MissionName=Path_Text.N34

--Load MusicPlayer Lib Files
dofilepath("data:scripts/music_player.lua")
dofilepath("data:scripts/music_data.lua")
dofilepath("data:scripts/fx_music.lua")
--加载公共规则
dofilepath("data:scripts/rules/common.rule")
--加载LW库
dofilepath("data:scripts/LW_functions.lua")

Councilor_Switch = 0


function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==33)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

function singlePlayerHyperspaceButtonPressed()
	Universe_Fade(1, 9)
	UI_SetElementVisible('NewTaskbar','btnHW1SPHyperspace',0)
    SobGroup_EnterHyperSpaceOffMap("Player_Ships0")
    Rule_AddInterval("FXP_End",10)
end

function FXP_End()
    --Profile_SetSingleMissionComplete("FX_Path", 35, 0)
    --Profile_SetSingleMissionComplete("FX_Path", 36, 0)
	FE_ExitToMainMenu()
    UI_DialogAccept()
end

function OnInit()
	--成就系统管理代码,在OnInit函数内重新dofilepath一次，以保证在游戏开局时重置系统状态
	dofilepath("data:scripts/FX_AchievementControl.lua")
--Achievements
	SobGroup_LoadPersistantData("Hgn_Mothership")
	FX_Achievements_Init("FX_Path")
	Universe_Fade(1, 0)
	CPU_Enable(2, 0)
	CPU_Enable(3, 0)
	Rule_AddInterval("timer_updating2",1)
	Rule_AddInterval("FXP_SetCamera",0.1)
	UI_SetElementEnabled("NewTaskbar", "btnObjectives", 0)
	UI_SetElementEnabled("NewTaskbar", "btnRecall", 0)
	UI_SetElementEnabled("NewTaskbar", "btnBuild", 0)
	UI_SetElementEnabled("NewTaskbar", "btnResearch", 0)
	UI_SetElementEnabled("NewTaskbar", "btnLaunch", 0)
	comment_check = 0
	timer_timing = 0
	for i=0,3 do
		for j=0,3 do
			if i~=j then
				SetAlliance(i, j)
			end
		end
	end
	Rule_AddInterval("StartCong",10)
	Player_SetPlayerName(1, "$101100")
	Player_SetPlayerName(2, "$101101")
	Player_SetPlayerName(3, "$101102")
--X system entrance
	XInit("reslist.lua", "X_FX2Deathmatch.lua")
--MusicPlayer Perset Function
	MusicPlayer_Oninit(music_data_original, 0, 3)
	Rule_Add("ShowMusicMenu")
	for iPlayer=1,Universe_PlayerCount()-1 do
		GameEvent_Listen(6000+iPlayer,tostring(Player_GetLevelOfDifficulty(iPlayer)))
	end

	FX_Common_Rule_OnInit()
end

function StartCong()
	Event_Start("congratuation")
	Rule_Remove("StartCong")
end

function timer_updating2()
    if timer_timing == 1 then				
				Rule_AddInterval("UI_init",0.1)
				Rule_AddInterval("UI_updating",0.5)
				Universe_Fade(0, 3)
				Subtitle_Message(FXP_MissionName,3)
	elseif timer_timing == 6 then
				UI_SetElementEnabled("NewTaskbar", "btnObjectives", 1)
				UI_SetElementEnabled("NewTaskbar", "btnRecall", 1)
				UI_SetElementEnabled("NewTaskbar", "btnBuild", 1)
				UI_SetElementEnabled("NewTaskbar", "btnResearch", 1)
				UI_SetElementEnabled("NewTaskbar", "btnLaunch", 1)
	end
	timer_timing = timer_timing + 1  
end

function timer_updating3()
	if (comment_check<timer_timing) then                                                      
		for Fame,Comment in FXP_PlayerAI do
			if (SobGroup_Selected(Fame)==1)and(Comment[Comment.Num]~=nil) then
				comment_check=timer_timing+Comment[Comment.Num][2]
				Subtitle_Add2(Comment.Actor,Comment[Comment.Num][1],Comment[Comment.Num][2])
				FXP_PlayerAI[Fame].Num=FXP_PlayerAI[Fame].Num+1
				if(Comment[FXP_PlayerAI[Fame].Num]==nil)then
					--if (SobGroup_CanDoAbility(Fame, AB_Hyperspace)==1) then
						SobGroup_EnterHyperSpaceOffMap(Fame)
					--else
					--	SobGroup_Despawn(Fame)
					--end
				end
			end
		end
	end
end
Events = {}
Events.congratuation = 
    { 
        { 
            { "Sensors_EnableCameraZoom( 0 )", "", }, HW2_Wait( 1 ), 
            { "Universe_EnableSkip(1)", "", }, 
        }, 
		{ HW2_Wait( 1 ), },
        { 
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            { "Sound_EnterIntelEvent()", "", }, HW2_Wait(2), 
        }, 
        { HW2_SubTitleEvent(22, "$100326", 5.5), 
	    	{ "Camera_Interpolate('here', 'CameraStart', 3)", "", }, 
	    	 { "Camera_AllowControl(0)", "", }, 
		}, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100327", 6), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100328", 6.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100329", 8.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100330", 9), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100331", 8), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100332", 10), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100333", 8.5), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100334", 8.5), 
	    	{ "SobGroup_EnterHyperSpaceOffMap('HW_Lover')", "", }, 
	    }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100335", 6), 
        	{ "Profile_SetMissionsComplete('fx_path', 37)", "", }, 
        }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100336", 2), }, 
        { HW2_Wait(1), }, 
        { HW2_SubTitleEvent(22, "$100337", 2), }, 
        { HW2_Wait(1), 
	    	{ "SobGroup_EnterHyperSpaceOffMap('WildHeart')", "", }, 
	    }, 
        { 
            { "Camera_AllowControl(1)", "", }, 
	    	{ "UI_SetElementVisible('NewTaskbar','btnHW1SPHyperspace',1)", "", }, 
	    	{ "Rule_AddInterval('timer_updating3',1)","",},
            { "Sound_ExitIntelEvent()", "", }, 
            { "Sound_SetMuteActor('')", "", }, HW2_Wait(2), 
            { "Sensors_EnableCameraZoom( 1 )", "", }, 
            { "Universe_EnableSkip(0)", "", }, 
        }, 
    }
