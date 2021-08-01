--这些是将会用到的函数，使用“PinYin_functions”这个table作为一个“命名空间”
PinYin_functions =
{
  loadData = function()
    --载入以下文件，该文件包括了拼音码表“LW_PinYinData”	
	  dofilepath("locale:scripts/LW_PinYinData.lua")
  end,

	--这个函数用来获取在第pageNum页应该显示的待选字字符串
	--参数pageNum（number），表示页码
	--参数text2proc（string），应当为PinYin_Vars.Text_to_proc的值
	--返回值result（string），表示待选字字符串
	getSelectText = function(pageNum, text2proc)
	
		--第一行显示text2proc，标号1
		local result = "1: "..text2proc.."\n"
		
		--当在码表中有该拼音对应的汉字的时候，才显示后面的内容
		--注意用strlower转换为小写字母
		if LW_PinYinData[strlower(text2proc)] then
			--显示7个对应的待选汉字
			for i = 1, min(7, LW_PinYinData[strlower(text2proc)].n - 7 * pageNum) do
				result = result..(i + 1)..": "..LW_PinYinData[strlower(text2proc)][i + 7 * pageNum].."; "
			end
			--换行后显示翻页提示
			result = result.."\n"
			if pageNum > 0 then
				result = result.."9: 上一页 "
			end
			if LW_PinYinData[strlower(text2proc)].n - 7 * pageNum > 7 then
				result = result.."0: 下一页"
			end
		end
		--返回待选字字符串
		return result
	end,
	--这个函数用来获取在第pageNum页显示的待选字字符串中的标号为num的字符串
	--参数num（number），表示被选中的字串的标号
	--参数pageNum（number），表示页码
	--返回值（string），表示被选中字串；返回nil时表示标号num对应的字串不存在
	getSelectedChar = function(num, pageNum)
		--如果标号为1则直接返回PinYin_Vars.Text_to_proc的值
		if num == 1 then
			return PinYin_Vars.Text_to_proc
		--否则检查查找的字串是否存在
		elseif LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)] and 
				LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)].n - 7 * pageNum >= num - 1 then
			--若存在则返回对应的字
			return LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)][num - 1 + 7 * pageNum]
		else
			--若不存在则返回nil
			return nil
		end
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
		--如果现在并非处于选字状态，或者输入的不是数字，则
		if PinYin_Vars.SelectMode == 0 or PinYin_btnchar < "0" or PinYin_btnchar > "9" then
			--选字框翻到最开始的一页
			PinYin_Vars.pageNum=0
			--将输入字符接在待选字后面
			PinYin_Vars.Text_to_proc = PinYin_Vars.Text_to_proc..PinYin_btnchar
			--获取待选字
			PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
			--进入选字状态
			PinYin_Vars.SelectMode = 1
			
		--否则我们要处理选字的问题
		else
			--如果按下的是“9”
			if PinYin_btnchar == "9" then
				--如果不是第一页 
				if PinYin_Vars.pageNum > 0 then	--注意这里的两层嵌套if是不能换成一个if并用and连接条件的，因为涉及到后面的else的判断会不一样
					--则翻到前一页
					PinYin_Vars.pageNum = PinYin_Vars.pageNum - 1
					PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
				end
			--如果按下的是“0”
			elseif (PinYin_btnchar=="0") then
				--如果不是最后一页
				if LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)].n - 7 * PinYin_Vars.pageNum > 7 then
					--则翻到下一页
					PinYin_Vars.pageNum = PinYin_Vars.pageNum + 1
					PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
				end		
			else
				--否则获取玩家选择的那个字
				local tempChar=PinYin_functions.getSelectedChar(tonumber(PinYin_btnchar), PinYin_Vars.pageNum)
				--如果选字成功，则
				if tempChar then
					--清空待选字符串和选字框
					PinYin_Vars.Text_to_proc = ""
					PinYin_Vars.Text_to_show = ""
					--将选中的字添加到最终结果字符串
					PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return..tempChar
					--并且更新最终结果字符串的显示
					UI_SetTextLabelText("PinYinIME", "TextInput", PinYin_Vars.Text_to_return)
					--同时退出选字模式
					PinYin_Vars.SelectMode = 0
				--如果选字不成功，则
				else
					--翻到第一页
					PinYin_Vars.pageNum=0
					--将输入的数字简单的附加在待选字符串后面
					PinYin_Vars.Text_to_proc = PinYin_Vars.Text_to_proc..PinYin_btnchar
					--重新获取选字框内容
					PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
				end
			end
		end
		--无论如何，最后更新一下选字框的显示内容
		UI_SetTextLabelText("PinYinIME", "charSelectLable", PinYin_Vars.Text_to_show)
	end,
	--这个函数在按下退格键的时候执行
	--无参数
	--无返回值
	BackspaceBtnClick = function()
		--如果待选字符串不为空，则
		if PinYin_Vars.Text_to_proc ~= "" then
			--从待选字符串中删掉一个字
			PinYin_Vars.Text_to_proc = PinYin_functions.DeleteLastChar(PinYin_Vars.Text_to_proc)
			--如果待选字符串没有被删空，则
			if(PinYin_Vars.Text_to_proc ~= "") then
				--回到第一页的待选汉字
				PinYin_Vars.pageNum = 0
				PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum,PinYin_Vars.Text_to_proc)
				PinYin_Vars.SelectMode = 1
			else
				--否则退出选字状态
				PinYin_Vars.SelectMode = 0
				PinYin_Vars.Text_to_show = ""
			end
		--否则，如果最终结果字符串不为空，则
		elseif (PinYin_Vars.Text_to_return~="") then
			PinYin_Vars.Text_to_return = PinYin_functions.DeleteLastChar(PinYin_Vars.Text_to_return)
		--否则如果待选字符串和最终结果字符串都是空的那么就什么都不做了
		end
		UI_SetTextLabelText("PinYinIME","charSelectLable",PinYin_Vars.Text_to_show)
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
		--在非选字状态时输入换行，否则选择第一个待选字（即英文原文）
		if PinYin_Vars.SelectMode == 0 then
			PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return.."\n"
			UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
		else
			PinYin_functions.inputBtnClick("1")
		end
	end,
	
	--这个函数在按下退格键的时候执行
	--参数str（string），为待删除字符的字符串
	--返回值result（string），为str删除了最后一个字后得到的的字符串
	DeleteLastChar = function(str)
		--检查是否是汉字，如果是的话删除两个字符，否则只删除一个字符
		if (strbyte(strsub(str,-1,-1))) > 127 then
			return strsub(str,1,-3)
		else
			return strsub(str,1,-2)
		end
	end,
	
	--这是一个不断循环运行的规则
  --用于在界面中的字符串末尾显示闪烁的光标
	DisplayText = function()
	  PinYin_Vars.Rule_DisplayText_Flag =  1 - PinYin_Vars.Rule_DisplayText_Flag
  	if(PinYin_Vars.Rule_DisplayText_Flag == 0) then
  		UI_SetTextLabelText("PinYinIME","charSelectLable",PinYin_Vars.Text_to_show)
  		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
  	else
  		--注意这里这个很tricky的strfind
  		--为了把光标插到这堆字的第一行的末尾，我们得搜索一下
  		local begPos, endPos = 0, 0
  		if PinYin_Vars.Text_to_proc == "1" then
  			--但是如果待搜索的字是1的话因为Text_to_show的最开头就可能有个1所以得把那个跳过去
  			begPos, endPos=strfind(PinYin_Vars.Text_to_show, PinYin_Vars.Text_to_proc, 1, 1)
  			begPos, endPos=strfind(PinYin_Vars.Text_to_show, PinYin_Vars.Text_to_proc,endPos + 1, 1)
  		else
  			begPos, endPos=strfind(PinYin_Vars.Text_to_show,PinYin_Vars.Text_to_proc , 1, 1)
  		end
  		UI_SetTextLabelText("PinYinIME","charSelectLable",strsub(PinYin_Vars.Text_to_show,1,endPos).."_"..strsub(PinYin_Vars.Text_to_show,endPos+1,-1))
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