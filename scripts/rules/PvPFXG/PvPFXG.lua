dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")
dofilepath("data:leveldata/multiplayer/lib/lib.lua")
dofilepath("data:leveldata/multiplayer/lib/crates.lua")
dofilepath("data:leveldata/multiplayer/lib/relics.lua")
dofilepath("data:leveldata/multiplayer/lib/challenges.lua")
dofilepath("data:leveldata/multiplayer/lib/norushtime.lua")
--dofilepath("data:leveldata/multiplayer/lib/research.lua")
dofilepath("data:leveldata/multiplayer/lib/ruinjections.lua")
dofilepath("data:leveldata/multiplayer/lib/bounties.lua")
dofilepath("data:leveldata/multiplayer/lib/cpuplayers.lua")
dofilepath("data:leveldata/multiplayer/lib/ui.lua")
dofilepath("data:leveldata/multiplayer/lib/dev.lua")
dofilepath("data:leveldata/multiplayer/lib/main.lua")
--dofilepath("data:leveldata/multiplayer/lib/carriersonly.lua")
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

function OnInit()
		--成就系统管理代码,在OnInit函数内重新dofilepath一次，以保证在游戏开局时重置系统状态
		dofilepath("data:scripts/FX_AchievementControl.lua")
		------
		
    Volume_AddSphere("centre", {-11111, 11111, 11111,}, 10)
    MPRestrict()
    cpuplayers = GetGameSettingAsNumber("cpuplayers")
    bounties = GetGameSettingAsNumber("bounties")
    --research = GetGameSettingAsNumber("research")
    research = 1
    ruinjections = GetGameSettingAsNumber("ruinjections")
    challenges = GetGameSettingAsNumber("challenges")
		relics = GetGameSettingAsNumber("relics")
    crates = GetGameSettingAsNumber("crates")
		--carriersonly = GetGameSettingAsNumber("carriersonly")
		norushtime = GetGameSettingAsNumber("norushtime")
		fx_option_aicheat = GetGameSettingAsString("aicheat")
		--if carriersonly == 0 then
			  --SetStartFleetSuffix("") 	 		
	  --elseif carriersonly == 1 then
		    --SetStartFleetSuffix("carriersonly")
				--Rule_AddInterval("carriersonly_init",2)	
		--elseif carriersonly == 2 then
		    --SetStartFleetSuffix("carriersonly1")
				--Rule_AddInterval("carriersonly_init",2)			
	  --end
	  --高速建造 
	  if (GetGameSettingAsString("BuildingSpeed") == "on") then
        Rule_AddInterval("BuildSpeedUp",1)
    end
    --战术统计
	  if (GetGameSettingAsString("TacticalReport") == "on") then
	  		X_TacticalReportInit()
    end
    --------
		UI_SetElementEnabled("NewTaskbar", "btnObjectives", 0)
		UI_SetElementEnabled("NewTaskbar", "btnRecall", 0)
		UI_SetElementEnabled("NewTaskbar", "btnBuild", 0)
		UI_SetElementEnabled("NewTaskbar", "btnResearch", 0)
		UI_SetElementEnabled("NewTaskbar", "btnLaunch", 0)
		FX_AIContactInit()
		
		if norushtime > 0 then
			UI_TimerStop("ResourceMenu", "GameTimer")	
		end
		Rule_AddInterval("timer_updating",1.02)	--timed with doai	
--X system entrance
		XInit("reslist.lua", "X_FX2Deathmatch.lua")
--MusicPlayer Perset Function
		MusicPlayer_Oninit(music_data_original, 0, 3)
		Rule_Add("ShowMusicMenu")
--Achievements
		FX_Achievements_Init("FX2DM")
--------
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
				Rule_AddInterval("sobgroups_init",1)	
				--Rule_AddInterval("sobgroups_updating",1)
				Rule_AddInterval("UI_init",0.1)
				Rule_AddInterval("UI_updating",0.5)
				Rule_AddInterval("cpuplayers_updating",0.1)	
				Rule_AddInterval("balancing_updating",0.25) --dev. to remove				
				--if research == 0 then
						--Rule_AddInterval("research_init",timer_interval)
				--end				
				if bounties > 0 then
						Rule_AddInterval("bounties_updating",timer_interval*2)
				end
				if norushtime > 0 then
						Rule_AddInterval("norushtime_updating",timer_interval*2)
				end	
				Rule_AddInterval("mainrule_updating",timer_interval*3)
		elseif timer_timing == 2 then
				if relics > 0 then				
						relics_init()	
						Rule_AddInterval("relics_updating",timer_interval*4)
				end	
		elseif timer_timing == 3 then						
				if challenges > 0 then
						Rule_AddInterval("challenges_updating",timer_interval)
				end				
		elseif timer_timing == 4 then				
				if crates > 0 then
						crates_init()
						Rule_AddInterval("CheckCratesRule",timer_interval)
						Rule_AddInterval("SpawnCratesRule",timer_interval*60)
				end
		elseif timer_timing == 5 then						
				if ruinjections > 0 then
						Rule_AddInterval("ruinjections_updating",timer_interval*48)
				end		
		elseif timer_timing == 6 then
				UI_SetElementEnabled("NewTaskbar", "btnObjectives", 1)
				UI_SetElementEnabled("NewTaskbar", "btnRecall", 1)
				UI_SetElementEnabled("NewTaskbar", "btnBuild", 1)
				--if research == 1 then
				UI_SetElementEnabled("NewTaskbar", "btnResearch", 1)
				--end	
				UI_SetElementEnabled("NewTaskbar", "btnLaunch", 1)
				
				-----------------------
		
	  end
	  timer_timing = timer_timing + 1
	  if timer_timing > 6 then
				Rule_Remove("timer_updating")
	  end
end

Events = {}
Events.endGame  =
{
    {
        { "wID = Wait_Start(5)","Wait_End(wID)"},
    },
}
Events.startcinematic =
        {
            {HW2_Letterbox(1),},
            {
                { "Camera_AllowControl(0)", "", },
                { "Universe_EnableSkip(0)", "", },
                { "Universe_AllowPlayerOrders(0)", "", },
                { "SobGroup_DeSelectAll()", "", },                
                { "Sensors_Toggle(0)", "", },
            },
        }
Events.startcinematic_focusrestore =
        {
            {HW2_Letterbox(1),},
            {
                { "Camera_AllowControl(0)", "", },
                { "Universe_EnableSkip(0)", "", },
                { "Universe_AllowPlayerOrders(0)", "", },
                { "SobGroup_DeSelectAll()", "", },
                { "Camera_FocusSave()", "", },
                { "Sensors_Toggle(0)", "", },
            },
        }				
Events.stopcinematic =
        {
            {HW2_Letterbox(0),},
            {
                { "Universe_AllowPlayerOrders(1)", "", },
                { "Camera_AllowControl(1)", "", },
            },
        }
Events.stopcinematic_focusrestore =
        {
            {HW2_Letterbox(0),},
            {
                { "Universe_AllowPlayerOrders(1)", "", },
                { "Camera_FocusRestore()", "", },
                { "Camera_AllowControl(1)", "", },
            },
        }
