--主菜单切换代码
dofilepath("data:scripts/FX_SwitchMainMenu.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")

dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")

dofilepath("data:leveldata/campaign/Tutorial/RPG/script/tradedata.lua")
dofilepath("player:RPG_"..DTM4_PlayerRace..".lua")

dofilepath("data:scripts/music_player.lua")
dofilepath("data:scripts/music_data.lua")
dofilepath("data:scripts/fx_music.lua")
--镜头函数
dofilepath("data:scripts/camerafunctions.lua")

Events = {}

doscanpath("data:leveldata/campaign/tutorial/RPG/script/campaign","*.lua")
				
if (MissionData==nil) then
	MissionData=DTM4_PlayerRace.."_Start"
	dofilepath("Data:leveldata/campaign/tutorial/RPG/Script/StartSave_"..DTM4_PlayerRace..".lua")
	g_seed=random(10000000,100000000-1)
	SaveID=0
end

function OnInit()
		SobGroup_CreateIfNotExist("camera")
		SobGroup_CreateIfNotExist("CameraTrackTempGroup")
		DTM4_Init()
		XInit("reslist.lua", "")
--MusicPlayer Perset Function
		MusicPlayer_Oninit(music_data_original, 0, 3)
		Rule_Add("ShowMusicMenu")
end
function OnStartOrLoad()
		--主菜单切换
		FX_SwitchMainMenuTo(RPGMainmenu)
		--------
		--X System Reload
		XInitOnLoad()
end
