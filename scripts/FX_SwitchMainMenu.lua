-------------------------------------------------------------
---------FX_SwitchMainMenu.lua-------2015��12��5��-----------
--�� 9CCNMOD�� ������-���� ��д
--����ļ���������FX MOD��Ϊ�˸��������һ�ν��е���Ϸ���Ͳ�ͬ���������˵���ʽ�ĺ���
--������Ϸ����ʱ��dofilepath���ļ�����ͨ��FX_SwitchMainMenuTo(iMenuNum)�������������˵���ʽ
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