--加载LW库
dofilepath("data:scripts/LW_functions.lua")
--主菜单切换代码
dofilepath("data:scripts/FX_SwitchMainMenu.lua")
dofilepath("data:scripts/debug.lua")
--加载X系统文件
dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")
--Load MusicPlayer Lib Files
dofilepath("data:scripts/music_player.lua")
dofilepath("data:scripts/music_data.lua")
dofilepath("data:scripts/fx_music.lua")
--成就系统管理代码
dofilepath("data:scripts/FX_AchievementControl.lua")

--加载公共规则
dofilepath("data:scripts/rules/common.rule")

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")
dofilepath("data:leveldata/multiplayer/lib/ui.lua")
dofilepath("data:leveldata/campaign/FX_Path/scripts/main.lua")
dofilepath("data:leveldata/campaign/FX_Path/scripts/PathTips.lua")

dofilepath("data:scripts/SCAR/SCAR_Util.lua")

dofilepath("Locale:PathDesc.lua")

Events = {}
Events.PlayerWin =
{
	{ 
		{ "Camera_SetLetterboxStateNoUI( 1, 0 )", "" },
		{ "Universe_Fade( 1, 2 )", "" },
	},
	{ HW2_Wait(3), }, 		
	{ 
		HW2_LocationCardEvent("$3615", 5), 	
		{ "Universe_Fade( 1, 2 )", "" },
	},
	{ HW2_Wait(2), }, 
	{
		{"setMissionComplete(1)","",},
	},		
}
Events.PlayerLose =
{
	{ 
		{ "Camera_SetLetterboxStateNoUI( 1, 0 )", "" },
		{ "Universe_Fade( 1, 2 )", "" },
	},
	{ HW2_Wait(3), }, 		
	{ 
		HW2_LocationCardEvent("$3616", 5), 	
	},
	{ HW2_Wait(2), }, 
	{
		{"setMissionComplete(0)","",},
	},		
}
FXP_PlayerDead=0
FXP_GameOver=0
FXP_StartingFleetToBuild=
{
	Hiigaran=
	{
		hgn_resourcecollector=6,
	},
	Vaygr=
	{
		vgr_resourcecollector=6,
	},
	Taiidan=
	{
		tai_resourcecollector=6,
	},
	Turanic=
	{
		tur_resourcecollector=6,
	},
	Keeper=
	{
		kpr_resourcecollector=6,
	},
	Kadesh=
	{
		kad_salvager=6,
	},
	Kushan=
	{
		kus_resourcecollector=6,
	},
	Bentusi=
	{
	},
}

FXP_Messages={}

function OnInit()
	--成就系统管理代码,在OnInit函数内重新dofilepath一次，以保证在游戏开局时重置系统状态
	dofilepath("data:scripts/FX_AchievementControl.lua")
	--Volume_AddSphere("centre", {-11111, 11111, 11111,}, 10)
	MPRestrict()
	UI_SetElementEnabled("NewTaskbar", "btnObjectives", 0)
	UI_SetElementEnabled("NewTaskbar", "btnRecall", 0)
	UI_SetElementEnabled("NewTaskbar", "btnBuild", 0)
	UI_SetElementEnabled("NewTaskbar", "btnResearch", 0)
	UI_SetElementEnabled("NewTaskbar", "btnLaunch", 0)

	Rule_AddInterval("timer_updating",1)
	Rule_AddInterval("FXP_SetCamera",0.1)
--X system entrance
	XInit("reslist.lua", "X_FX2Deathmatch.lua")
--MusicPlayer Perset Function
	MusicPlayer_Oninit(music_data_original, 0, 3)
	Rule_Add("ShowMusicMenu")
	Universe_Fade(1, 0)
	--Rule_AddInterval("FXP_SendMessage",1)
	Rule_AddInterval("FXP_PlayerMeet",1)
	Rule_AddInterval("FXP_PlayerBeenAttack",1)
	Rule_AddInterval("FXP_PlayerAttacking",1)
--Achievements
	FX_Achievements_Init("FX_Path")
	FXP_AIInit()
	FX_Common_Rule_OnInit()
	FX_PathTipOninit()
	if (Override_Init~=nil) then
		Override_Init()
	end
end

function FXP_AIInit()
	for iPlayer=0,Universe_PlayerCount()-1 do
		CPU_DoString(iPlayer, "FXP_Init()")
		CPU_DoString(iPlayer, "FXP_AIInit()")
		GameEvent_Listen(6000+iPlayer,tostring(CPU_GetVar(iPlayer,"g_LOD")+1))
	end
end

function FXP_PlayerMeet()
	for playerIndex=0,Universe_PlayerCount()-1 do
		if(playerIndex~=Universe_CurrentPlayer())then
			if(SobGroup_PlayerIsInSensorRange("Player_Ships"..playerIndex, Universe_CurrentPlayer())==1)and(FXP_PlayerAI[playerIndex].Met==0)then
				local iPlayerData=FXP_AIData[FXP_PlayerAI[playerIndex].Actor]
				FXP_PlayerAI[playerIndex].Met=1
				if(AreAllied(playerIndex, Universe_CurrentPlayer())==1)then
					tinsert(FXP_Messages,{iPlayerData.Actor,"FirstMeet2",0,playerIndex})
				else
					tinsert(FXP_Messages,{iPlayerData.Actor,"FirstMeet1",0,playerIndex})
				end
			end
		end
	end
end

function FXP_PlayerBeenAttack()
	for playerIndex=0,Universe_PlayerCount()-1 do
		if(playerIndex~=Universe_CurrentPlayer())then
			if(CPU_GetVar(playerIndex,"FXP_IsUnderAttack")==1)then
				CPU_DoString(playerIndex, "FXP_IsUnderAttack=0")
				if(SobGroup_UnderAttack("Player_Ships"..playerIndex)==1)then
					local iPlayerData=FXP_AIData[FXP_PlayerAI[playerIndex].Actor]
					if(AreAllied(playerIndex, Universe_CurrentPlayer())==1)then
						tinsert(FXP_Messages,{iPlayerData.Actor,"BeenAttack2",0,playerIndex})
					else
						tinsert(FXP_Messages,{iPlayerData.Actor,"BeenAttack1",0,playerIndex})
					end
				end
			end
		end
	end
end

function FXP_PlayerAttacking()
	for playerIndex=0,Universe_PlayerCount()-1 do
		if(playerIndex~=Universe_CurrentPlayer())then
			if(CPU_GetVar(playerIndex,"FXP_IsAttacking")==1)then
				CPU_DoString(playerIndex, "FXP_IsAttacking=0")
				local iPlayerData=FXP_AIData[FXP_PlayerAI[playerIndex].Actor]
				if(AreAllied(playerIndex, Universe_CurrentPlayer())==1)then
					tinsert(FXP_Messages,{iPlayerData.Actor,"Attack2",0,playerIndex})
				elseif(SobGroup_PlayerIsInSensorRange("Player_Ships"..playerIndex, Universe_CurrentPlayer())==1) then
					tinsert(FXP_Messages,{iPlayerData.Actor,"Attack1",0,playerIndex})
				end
			end
		end
	end
end

function FXP_SendingMessage()
	Rule_Remove("FXP_SendingMessage")
	Rule_AddInterval("FXP_SendMessage",1)
end

function FXP_SendMessage()
	local iIndex=1
	while(FXP_Messages[iIndex]~=nil)do
		local iMessage=FXP_Messages[iIndex]
		if(iMessage[3]==0)and(FXP_PlayerAI[iMessage[4]].Met==1)and(FXP_PlayerAI[iMessage[4]].Dead==0)then
			local iText=FXP_AIData[FXP_PlayerAI[iMessage[4]].Actor].Message[iMessage[2]][random(getn(FXP_AIData[FXP_PlayerAI[iMessage[4]].Actor].Message[iMessage[2]]))]
			Subtitle_Add2(iMessage[1],FXP_AIData[FXP_PlayerAI[iMessage[4]].Actor].Name..":"..iText)
			Rule_Remove("FXP_SendMessage")
			local iTime=floor((strlen(iText))/4)/2
			Rule_AddInterval("FXP_SendingMessage",iTime)
			iMessage[3]=1
			break
		elseif(iMessage[3]==0)and((FXP_PlayerAI[iMessage[4]].Met==0)or(FXP_PlayerAI[iMessage[4]].Dead==1))then
			iMessage[3]=1
		elseif(iMessage[3]==-1)then
			FXP_PlayerAI[iMessage[4]].Dead=1
			local iText=FXP_AIData[FXP_PlayerAI[iMessage[4]].Actor].Message[iMessage[2]][random(getn(FXP_AIData[FXP_PlayerAI[iMessage[4]].Actor].Message[iMessage[2]]))]
			Subtitle_Add2(iMessage[1],FXP_AIData[FXP_PlayerAI[iMessage[4]].Actor].Name..":"..iText)
			Rule_Remove("FXP_SendMessage")
			local iTime=floor((strlen(iText))/4)/2
			Rule_AddInterval("FXP_SendingMessage",iTime)
			iMessage[3]=1
			break
		end
		iIndex=iIndex+1
	end
end

function FXP_MessageCheck()
	local iFlag=1
	local iIndex=1
	while(FXP_Messages[iIndex]~=nil)do
		local iMessage=FXP_Messages[iIndex]
		if(iMessage[3]==0)then
			iFlag=0
		end
		iIndex=iIndex+1
	end
	return iFlag
end

function FXP_PlayerDie(playerIndex)
	if(FXP_PlayerAI[playerIndex].Dead==0)then
		local iPlayerData=FXP_AIData[FXP_PlayerAI[playerIndex].Actor]
		if(AreAllied(playerIndex, Universe_CurrentPlayer())==1)then
			tinsert(FXP_Messages,{iPlayerData.Actor,"Die2",-1,playerIndex})
		else
			tinsert(FXP_Messages,{iPlayerData.Actor,"Die1",-1,playerIndex})
		end
	end
end

function FXP_PlayerWin()
	for playerIndex=0,Universe_PlayerCount()-1 do
		if(playerIndex~=Universe_CurrentPlayer())and(FXP_PlayerAI[playerIndex].Dead==0)then
			local iPlayerData=FXP_AIData[FXP_PlayerAI[playerIndex].Actor]
			if(AreAllied(playerIndex, Universe_CurrentPlayer())==1)then
				tinsert(FXP_Messages,{iPlayerData.Actor,"Win2",0,playerIndex})
			end
		end
	end
	Path_Achievement()
end

function FXP_PlayerLose()
	for playerIndex=0,Universe_PlayerCount()-1 do
		if(playerIndex~=Universe_CurrentPlayer())and(FXP_PlayerAI[playerIndex].Dead==0)then
			local iPlayerData=FXP_AIData[FXP_PlayerAI[playerIndex].Actor]
			if(AreAllied(playerIndex, Universe_CurrentPlayer())==0)then
				tinsert(FXP_Messages,{iPlayerData.Actor,"Win1",0,playerIndex})
			end
		end
	end
end

function FXP_SetCamera()
	Camera_FocusVolumeWithBuffer("StartPos"..Universe_CurrentPlayer(), 3000, 3000, 0)
	Rule_Remove("FXP_SetCamera")
end

function FXP_Init()
	local iFlag=1
	for iPlayer=0,Universe_PlayerCount()-1 do
		if(SobGroup_AreAllInRealSpace("Player_StartingFleet"..iPlayer)==1)then
			SobGroup_DockSobGroupInstant("Player_StartingFleetToDock"..iPlayer,"Player_StartingFleet"..iPlayer)
			SobGroup_Despawn("Player_StartingFleet"..iPlayer)
			iFlag=0
		elseif(SobGroup_AreAllInHyperspace("Player_StartingFleet"..iPlayer)==1)then
			SobGroup_ExitHyperSpace("Player_StartingFleet"..iPlayer,"StartPos"..iPlayer)
		else
			iFlag=0
		end
	end
	if(iFlag==1)then
		Rule_Remove("FXP_Init")
		Universe_Fade(0, 3)
		Subtitle_Message(FXP_MissionName,3)
		Rule_AddInterval("FXP_Launch",2)
		for playerIndex=0,Universe_PlayerCount()-1 do
			if(playerIndex~=Universe_CurrentPlayer())then
				--Player_GrantResearchOption(playerIndex,"FXP_Buff_"..FXP_PlayerAI[playerIndex].Actor)
				if (FXP_AIData[FXP_PlayerAI[playerIndex].Actor].Strategy~="normal") then
					Player_GrantResearchOption(playerIndex,"cpuplayers_"..FXP_AIData[FXP_PlayerAI[playerIndex].Actor].Strategy)
				end
				Player_SetBadgeTexture(playerIndex, FXP_AIData[FXP_PlayerAI[playerIndex].Actor].Badge)
				Player_SetPlayerName(playerIndex, FXP_AIData[FXP_PlayerAI[playerIndex].Actor].Name)
				Player_SetTeamColours(playerIndex, FXP_AIData[FXP_PlayerAI[playerIndex].Actor].BaseColour, FXP_AIData[FXP_PlayerAI[playerIndex].Actor].StripeColour)
				for otherplayerIndex=0,Universe_PlayerCount()-1 do
					if(otherplayerIndex~=playerIndex)and(otherplayerIndex~=Universe_CurrentPlayer())then
						if(FXP_PlayerAI[playerIndex].Team==FXP_PlayerAI[otherplayerIndex].Team)then
							SetAlliance(playerIndex, otherplayerIndex)
						end
					elseif(otherplayerIndex~=playerIndex)then
						if(FXP_PlayerAI[playerIndex].Team==0)then
							SetAlliance(playerIndex, Universe_CurrentPlayer())
							SetAlliance(Universe_CurrentPlayer(), playerIndex)
						end
					end
				end
			else
				dofilepath("player:PLAYERCFG.LUA")
				Player_SetTeamColours(playerIndex,{PlayerSetup.teamcolour[1]/255,PlayerSetup.teamcolour[2]/255,PlayerSetup.teamcolour[3]/255,},{PlayerSetup.stripecolour[1]/255,PlayerSetup.stripecolour[2]/255,PlayerSetup.stripecolour[3]/255,})
				Player_SetBadgeTexture(playerIndex, PlayerSetup.emblem)
			end
		end
		CPU_EnableAll(1)
		FX_AIContactInit()
	end
end

function FXP_Launch()
	local iFlag = 1
	for iPlayer=0,Universe_PlayerCount()-1 do
		if(SobGroup_AreAllInRealSpace("Player_StartingFleet"..iPlayer)==1)then
			for iShip,iNum in FXP_StartingFleetToBuild[Race_GetName(Player_GetRace(iPlayer))] do
				if (SobGroup_AreAnyOfTheseTypes("Player_Ships"..iPlayer, iShip)==0) then
					iFlag = 0
					for i=1,iNum do
						SobGroup_CreateShip("Player_Ships"..iPlayer, iShip)
					end
				end
			end
		else
			iFlag = 0
		end
	end
	if (iFlag==1) then
		Rule_Remove("FXP_Launch")
	end
end

function OnStartOrLoad()
		--主菜单切换
		FX_SwitchMainMenuTo(NomalMainmenu)
		--------
		FX_Common_Rule_OnStartOrLoad()
		--成就系统管理代码
		dofilepath("data:scripts/FX_AchievementControl_TableFunctions.lua")
		--X System Reload
		XInitOnLoad()
		-- 重载文本文件，因为其中含有部分 table function
		dofilepath("Locale:PathDesc.lua")
		-- 显示AI外交按钮
		FX_AIContact_OnStartOrLoad()
end


timer_timing = 1
timer_interval = 5.1

function timer_updating()
    if timer_timing == 1 then				
				for playerIndex = 0,Universe_PlayerCount()-1,1 do		
						if Player_IsAlive(playerIndex) == 1 then
								if Player_HasShipWithBuildQueue(playerIndex) == 1 then
										Player_RestrictBuildOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_build_restrict", ""))																				
								end
						end	
				end
				Rule_AddInterval("FXP_Init",0.1)
				Rule_AddInterval("UI_init",0.1)
				Rule_AddInterval("UI_updating",0.5)
				Rule_AddInterval("mainrule_updating",1)
		elseif timer_timing == 6 then
				UI_SetElementEnabled("NewTaskbar", "btnObjectives", 1)
				UI_SetElementEnabled("NewTaskbar", "btnRecall", 1)
				UI_SetElementEnabled("NewTaskbar", "btnBuild", 1)
				UI_SetElementEnabled("NewTaskbar", "btnResearch", 1)
				UI_SetElementEnabled("NewTaskbar", "btnLaunch", 1)
	  end
	  timer_timing = timer_timing + 1                                                        
end                       