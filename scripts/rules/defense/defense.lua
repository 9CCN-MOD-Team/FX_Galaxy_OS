dofilepath("locale:localetext.lua")
dofilepath("data:scripts/scar/restrict.lua")
dofilepath("data:leveldata/multiplayer/deathmatcheprandom/base/base.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:leveldata/multiplayer/lib/lib.lua")
dofilepath("data:leveldata/multiplayer/lib/bentusidefense.lua")
--主菜单切换代码
dofilepath("data:scripts/FX_SwitchMainMenu.lua")
--X system files
dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")
--Load MusicPlayer Lib Files
dofilepath("data:scripts/music_player.lua")
dofilepath("data:scripts/music_data.lua")
dofilepath("data:scripts/fx_music.lua")
--成就系统管理代码
dofilepath("data:scripts/FX_AchievementControl.lua")
----
dofilepath("data:scripts/debug.lua")
--加载公共规则
dofilepath("data:scripts/rules/common.rule")

function SobGroup_GetDistanceToSobGroup(iName1,iName2)
	local pos1 = SobGroup_GetPosition(iName1)
	local pos2 = SobGroup_GetPosition(iName2)
	local l_distance = 0
	for i = 1,3 do
		l_distance = l_distance + (pos1[i] - pos2[i])^2
	end
	l_distance = sqrt(l_distance)
	return l_distance
end

function OnInit()
		--成就系统管理代码,在OnInit函数内重新dofilepath一次，以保证在游戏开局时重置系统状态
		dofilepath("data:scripts/FX_AchievementControl.lua")
		------
		
	SetStartFleetSuffix("def")
  MPRestrict()
  PlayerSurviveJudge = 0
  --X system entrance
	XInit("reslist.lua", "")
	--MusicPlayer Perset Function
	MusicPlayer_Oninit(music_data_original, 0, 3)
	Rule_Add("ShowMusicMenu")
	Defense_Init()
--Achievements
	FX_Achievements_Init("FXGDF")
	
	FX_Common_Rule_OnInit()
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
end
function Defense_Init()
		randomseed(clock())
		if (Universe_CurrentPlayer()==1) then
			g_player = 1
			SobGroup_SetSwitchOwnerFlag("Key", 0)
			SobGroup_SetSwitchOwnerFlag("Ben", 0)
			SobGroup_SetSwitchOwnerFlag("HSI", 0)
			SobGroup_SetSwitchOwnerFlag("HSI1", 0)
			SobGroup_SetSwitchOwnerFlag("HSI2", 0)
			SobGroup_SetSwitchOwnerFlag("HSI3", 0)
			SobGroup_SetSwitchOwnerFlag("HSI4", 0)
			SobGroup_SwitchOwner("HSI", 0)
			SobGroup_SwitchOwner("Key", 1)
			SobGroup_SwitchOwner("Ben", 1)
		end
		CPU_Enable(1-g_player, 0)
		g_bounty = GetGameSettingAsNumber("BountyRate")
		g_difficulty = GetGameSettingAsNumber("Def_Dif")
		local i_race = 1
		while (g_playerrace=="")or(g_enemyrace=="") do
			if (g_racetable[i_race]==PlayerRace_GetNumber(g_player,"raceID", 1.0)) then
				g_playerrace = g_racename[i_race]
			end
			if (g_racetable[i_race]==PlayerRace_GetNumber(1-g_player,"raceID", 1.0)) then
				g_enemyrace = g_racename[i_race]
			end
			i_race = i_race+1
		end
		for i,j in g_raceinfo[g_playerrace].restrictRI do
			Player_RestrictResearchOption(g_player, j)
		end
		for i,j in g_raceinfo[g_playerrace].grantBI do
			Player_UnrestrictBuildOption(g_player, j)
		end
		for i,j in g_raceinfo[g_playerrace].grantRI do
			Player_GrantResearchOption(g_player, j)
		end
		for i,j in g_raceinfo[g_playerrace].restrictBI do
			Player_RestrictBuildOption(g_player, j)
		end
		SobGroup_SpawnNewShipInSobGroup(g_player, g_raceinfo[g_playerrace].startship, "Player_Start", "Player_Start", "Player_Start")
		for i,j in g_raceinfo[g_playerrace].SubNeedCreate do
			SobGroup_CreateSubSystem("Player_Start", j)
		end
		Rule_AddInterval("Def_WaveCount",g_WaveTime)
		Rule_AddInterval("Def_PlayerLose",1)
		_ALERT("g_enemyrace is:"..g_enemyrace)
		Def_Event.BenOpen[3].text = LocaleText[1]..g_raceinfo[g_enemyrace].name..LocaleText[2]
		Def_EventStart("BenOpen")
		--UI_BindKeyEvent(TKEY,"test")
end

function Def_EventRule_BenOpen()
end

function Def_EventStart(iName)
	g_eventname = iName
	g_eventindex = 1
	UI_BindKeyEvent(ESCKEY, "Def_EndEvent")
	Rule_AddInterval("Def_PlayEvent",1)
end

function Def_EndEvent()
	while (Def_Event[g_eventname][g_eventindex]~=nil) do
		g_eventindex = g_eventindex + 1
	end
	UI_UnBindKeyEvent(ESCKEY)
	Rule_Add("Def_EventRule_"..g_eventname)
	Rule_Remove("Def_PlayEvent")
end

function Def_PlayEvent()
	if (Def_Event[g_eventname][g_eventindex]~=nil) then
		Subtitle_Add(Def_Event[g_eventname][g_eventindex].actor, Def_Event[g_eventname][g_eventindex].text, Def_Event[g_eventname][g_eventindex].time)
		Rule_Remove("Def_PlayEvent")
		Rule_AddInterval("Def_PlayEvent",Def_Event[g_eventname][g_eventindex].time+1)
		g_eventindex = g_eventindex + 1
	else
		Rule_Add("Def_EventRule_"..g_eventname)
		Rule_Remove("Def_PlayEvent")
	end
end

function Def_PlayerLose()
	if (SobGroup_Empty("Player_Start")==1)or(SobGroup_Empty("Ben")==1) then
		Player_Kill(g_player)
		Event_Start("endGame")
		Rule_Add("waitForEnd")
		Rule_Remove("Def_PlayerLose")
	else
		SobGroup_AbilityActivate("Player_Ships"..g_player, AB_Hyperspace, 1)
		local l_TotalKill = Stats_TotalKillsInRUs(g_player)
		if (l_TotalKill>g_playerkill) then
			Player_SetRU(g_player,floor(Player_GetRU(g_player)+g_bounty*(l_TotalKill-g_playerkill)))
			g_playerkill = l_TotalKill
		end
		Def_BenGrateCapital()
		if (SobGroup_GetDistanceToSobGroup("Player_Start","Ben")<=2000) then
			SobGroup_SetBuildSpeedMultiplier("Player_Start", 4)
		else
			SobGroup_SetBuildSpeedMultiplier("Player_Start", 1)
		end
	end
end

--function test()
	
--end

function Def_BenGrateCapital()
	if (g_wavecount[1]+g_wavecount[2]+g_wavecount[3]+g_wavecount[4]==36)and(g_pass8==0) then
		SobGroup_SobGroupAdd("Player_Start", SobGroup_CreateShip("Ben",g_raceinfo[g_playerrace].startship))
		for i,j in g_raceinfo[g_playerrace].SubNeedCreate do
			SobGroup_CreateSubSystem("Player_Start", j)
		end
		Subtitle_Add(Actor_HW1_BentusiTraders, "$11531", 10)
		g_pass8 = 1
	elseif (Player_GetRU(g_player)>10000) then
		local l_flag = 0
		for i,j in Ben_Cost do
			if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(g_player,i)<j[2]) then
				l_flag = 1
				break
			end
		end
		if(l_flag==1) then
			for j=1,4 do
				g_pressure[g_shiptype[j]] = 0
				for k,l in g_raceinfo[g_enemyrace].ships[g_shiptype[j]] do
					g_pressure[g_shiptype[j]] = g_pressure[g_shiptype[j]] + g_raceinfo[g_enemyrace].balance[j]*Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(1-g_player, l)
				end
			end
			Def_GetRandomBenCType()
		end
	end
end

function Def_WaveForm(i)
--生成随机兵种类型喜好
		for j=1,4 do
			g_favor[i][g_shiptype[j]]=random(20,80)
		end
--平衡玩家实力
		local l_E = 0
		local l_P = 0
		for t=1,4 do
			l_E = l_E + g_raceinfo[g_playerrace].balance[t]*g_raceinfo[g_enemyrace]["attackwave"][g_shiptype[t]][min(g_wavecount[i],g_maxwave)]
			l_P = l_P + g_pressure[g_shiptype[t]]
		end
		local l_rate = 0.5*((g_wavecount[1]+g_wavecount[2]+g_wavecount[3]+g_wavecount[4])/4)^(1/3)+0.5
		l_rate = l_rate*(l_P-g_raceinfo[g_playerrace]["attackwave"]["addition"][min(g_wavecount[i],g_maxwave)])+min(10000,Player_GetRU(g_player))/500
		local iRate = l_rate/l_E
		if (iRate>1) then
			iRate = 1+(iRate-1)^2
		else
			iRate = sqrt(iRate)
		end
		iRate = g_difficulty * iRate
		_ALERT(i.."|"..g_wavecount[i].."|"..iRate)
--生成主攻兵力
		for t=1,4 do
			for j=1,Def_GetENum(g_raceinfo[g_enemyrace]["attackwave"][g_shiptype[t]][min(g_wavecount[i],g_maxwave)], iRate) do			
				if (Def_Random2(t)==i) then
					SobGroup_SobGroupAdd("EW"..i, SobGroup_CreateShip("HSI"..i, Def_GetRandomShipType(t)))
				end
			end
		end
end

function Def_GetENum(iNum, iRate)
	local l_R = iNum*iRate
	if (10*(l_R-floor(l_R))>=5) then
		return ceil(l_R)
	else
		return floor(l_R)
	end
end

function Def_WaveCount()
	for i=1,4 do
		if (SobGroup_Empty("EW"..i)==1) then
			if (g_wavecount[i]<=g_maxwave) then
				g_wavecount[i] = g_wavecount[i] + 1
			end
			while (min(g_wavecount[1],g_wavecount[2],g_wavecount[3],g_wavecount[4])>g_wave) do
				g_wave = g_wave + 1
			end
			if (g_wave==g_maxwave+1) then
				Player_Kill(1-g_player)
				Event_Start("playerwin")
				FX_Achievements_Values["PlayerWin"]=1
			end
			if (g_wavecount[i]<=g_maxwave) then
--分析玩家兵种构成
				for j=1,4 do
					g_pressure[g_shiptype[j]] = 0
					for k,l in g_raceinfo[g_playerrace].ships[g_shiptype[j]] do
						g_pressure[g_shiptype[j]] = g_pressure[g_shiptype[j]] + g_raceinfo[g_playerrace].balance[j]*Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(g_player, l)
					end
				end
				Def_WaveForm(i)
			end
		elseif(SobGroup_AreAllInRealSpace("EW"..i)==1)then
	--各方向兵力组成阵型并发起攻击
			if(SobGroup_InStrikeGroup("EW"..i)==0)then
				local l_max = max(g_pressure[g_shiptype[1]]+g_pressure[g_shiptype[2]],g_pressure[g_shiptype[3]],g_pressure[g_shiptype[4]])
				if (l_max==g_pressure[g_shiptype[3]]) then
					SobGroup_FormStrikeGroup("EW"..i, "frigate line")
				elseif (l_max==g_pressure[g_shiptype[4]]) then
					SobGroup_FormStrikeGroup("EW"..i, "capital phalanx")
				else
					SobGroup_FormStrikeGroup("EW"..i, "fighter screen")
				end
				SobGroup_SetROE("EW"..i, AggressiveTactics)
			end
			if (SobGroup_FillProximitySobGroup("FTemp", "Player_Ships"..g_player, "EW"..i, 5000)==1) then
				SobGroup_Attack(1-g_player, "EW"..i, "FTemp")
			else
				SobGroup_Attack(1-g_player, "EW"..i, "Ben")
			end
		end
	end
	Rule_Remove("Def_WaveCount")
	Rule_AddInterval("Def_WaveCount",10)
end

function Def_PlayerWin()
	--if (SobGroup_Empty("EW1")==1)and(SobGroup_Empty("EW2")==1)and(SobGroup_Empty("EW3")==1)and(SobGroup_Empty("EW4")==1) then
			Event_Start("endGame")
			Rule_Add("waitForEnd")
			Rule_Remove("Def_PlayerWin")
	--end
end

function Def_GetRandomShipType(i)
		local y = Def_Random3()
		local l_type = Def_Random(g_raceinfo[g_enemyrace].ships["a"..g_shiptype[y]])
		while (Def_ShipTypeCheck(l_type, g_raceinfo[g_enemyrace].ships[g_shiptype[i]])==0) do
			l_type = Def_Random(g_raceinfo[g_enemyrace].ships["a"..g_shiptype[y]])
		end
		return l_type
end

function Def_GetRandomBenCType()
		local y = Def_Random3()
		local l_type = Def_Random(g_raceinfo[g_playerrace].ships["a"..g_shiptype[y]])
		while (Def_ShipTypeCheck(l_type, g_raceinfo[g_playerrace].ships[g_shiptype[4]])==0) do
			l_type = Def_Random(g_raceinfo[g_playerrace].ships["a"..g_shiptype[y]])
		end
		if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(g_player, l_type)<Ben_Cost[l_type][2]) then
			SobGroup_CreateShip("Ben",l_type)
			Player_SetRU(g_player, Player_GetRU(g_player)-Ben_Cost[l_type][1])
			Subtitle_Add(Actor_HW1_BentusiTraders, "$11532", 10)
		end
end

function Def_Random(iTable)
	local l = 0
	while (iTable[l+1]~=nil) do
		l = l+1
	end
	return iTable[random(1,l)]
end

function Def_Random2(i)
				local l = random(1,10000)
				local t = 0
				local x = {}
				for k=1,4 do
					t = t+g_favor[k][g_shiptype[i]]
					x[k] = t
				end
				local y = 1
				for k=1,3 do
					if (l>10000*(x[k]/t)) then
						y = y + 1
					end
				end
				return y
end

function Def_Random3()
		local l = random(1,10000)
		local t = 0
		local x = {}
		for k=1,4 do
			t = t+g_pressure[g_shiptype[k]]
			x[k] = t
		end
		local y = 1
		for k=1,3 do
			if (l>10000*(x[k]/t)) then
				y = y + 1
			end
		end
		return y
end

function Def_ShipTypeCheck(iType, iTable)
	local l_flag = 0
	for i,j in iTable do
		if (j==iType) then
			l_flag = 1
		end
	end
	return l_flag
end

function waitForEnd()	
	if (Event_IsDone("endGame")) then	
		setGameOver()
		Rule_Remove("waitForEnd")
	end
end
