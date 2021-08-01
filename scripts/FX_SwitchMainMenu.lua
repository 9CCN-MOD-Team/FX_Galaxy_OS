-------------------------------------------------------------
---------FX_SwitchMainMenu.lua-------2015年12月5日-----------
--由 9CCNMOD组 破天者-孤狼 编写
--这个文件包含用于FX MOD中为了根据玩家上一次进行的游戏类型不同而更改主菜单样式的函数
--任意游戏开局时可dofilepath此文件，并通过FX_SwitchMainMenuTo(iMenuNum)函数来更改主菜单样式
-------------------------------------------------------------
-------------------------------------------------------------
NomalMainmenu = 0
RPGMainmenu = 1
mainmenu_tanis = 2
dofilepath("data:scripts/debug.lua")
--dofilepath("data:scripts/LW_functions.lua")
function FX_SwitchMainMenuTo(iMenuNum)
	o_handle = writeto("FX_CurrentMainMenu.lua")
	if (o_handle~=nil) then
		write(o_handle, "FX_CurrentMainMenu = "..iMenuNum)
		writeto()
	else
		derr("Fail to write in FX_CurrentMainMenu.lua!")
	end
end	