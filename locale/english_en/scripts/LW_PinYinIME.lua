--这些是将会用到的函数，使用“PinYin_functions”这个table作为一个“命名空间”
PinYin_functions =
{
  loadData = function()
    -- do nothing
  end,

	--这个函数在按下对应的键盘按键或界面按钮的时候执行
	--参数char（string），表示被按下的键
	--无返回值
	inputBtnClick = function(char)
		--先检查大写锁定状态，并转换输入字符的大小写
		local PinYin_btnchar=""	--用于保存转换后的输入字符的局部变量
		if PinYin_Vars.CapsLk_Check == 0 then
			PinYin_btnchar = strlower(char)
		else
			PinYin_btnchar = strupper(char)
		end
		
		PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return..PinYin_btnchar
		
		-- 最后更新一下显示内容
		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
	end,
	--这个函数在按下退格键的时候执行
	--无参数
	--无返回值
	BackspaceBtnClick = function()
		--如果字符串不为空，则
		if (PinYin_Vars.Text_to_return~="") then
			PinYin_Vars.Text_to_return = PinYin_functions.DeleteLastChar(PinYin_Vars.Text_to_return)
		end
		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
	end,
	
	--这个函数在按下大写锁定或SHIFT键的时候执行
	--无参数
	--无返回值
	CapsLkBtnClick = function()
		PinYin_Vars.CapsLk_Check = 1 - PinYin_Vars.CapsLk_Check
		UI_SetButtonPressed("PinYinIME", "CapsLkCheck", PinYin_Vars.CapsLk_Check)
	end,
	
	--这个函数在按下回车键的时候执行
	--无参数
	--无返回值
	EnterBtnClick = function()
	  PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return.."\n"
		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
	end,
	
	--这个函数在按下退格键的时候执行
	--参数str（string），为待删除字符的字符串
	--返回值result（string），为str删除了最后一个字后得到的的字符串
	DeleteLastChar = function(str)
		return strsub(str,1,-2)
	end,
	
	--这是一个不断循环运行的规则
  --用于在界面中的字符串末尾显示闪烁的光标
	DisplayText = function()
	  PinYin_Vars.Rule_DisplayText_Flag =  1 - PinYin_Vars.Rule_DisplayText_Flag
  	if(PinYin_Vars.Rule_DisplayText_Flag == 0) then
  		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
  	else
  		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return.."_")
  	end
  end,
  
	--这个函数在确认输入，退出输入法的时候执行
	--无参数
	--无返回值
	PinYin_Exit = function()
		--清理现场
		LW_PinYinData = nil		
		
		UI_UnBindKeyEvent(SPACEKEY)
		for i=0,9 do
				UI_UnBindKeyEvent(ZEROKEY+i)
		end
		for i=0,25 do
			UI_UnBindKeyEvent(AKEY+i)
		end
		UI_UnBindKeyEvent(BACKSPACEKEY)
		UI_UnBindKeyEvent(CAPSLOCKKEY)
		UI_UnBindKeyEvent(SHIFTKEY)
		UI_UnBindKeyEvent(ENTERKEY)
		
		Rule_Remove("PinYin_Rule_DisplayText")
		Rule_Remove("PinYin_Rule_HideScreen")
		
		UI_HideScreen("PinYinIME")
		
		MainUI_PopEnabledCommandState()
		
		--调用回调函数返回结果
		PinYin_Return(PinYin_Vars.Text_to_return)
		
		PinYin_Vars = nil
	end
}