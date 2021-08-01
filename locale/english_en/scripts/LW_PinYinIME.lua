--��Щ�ǽ����õ��ĺ�����ʹ�á�PinYin_functions�����table��Ϊһ���������ռ䡱
PinYin_functions =
{
  loadData = function()
    -- do nothing
  end,

	--��������ڰ��¶�Ӧ�ļ��̰�������水ť��ʱ��ִ��
	--����char��string������ʾ�����µļ�
	--�޷���ֵ
	inputBtnClick = function(char)
		--�ȼ���д����״̬����ת�������ַ��Ĵ�Сд
		local PinYin_btnchar=""	--���ڱ���ת����������ַ��ľֲ�����
		if PinYin_Vars.CapsLk_Check == 0 then
			PinYin_btnchar = strlower(char)
		else
			PinYin_btnchar = strupper(char)
		end
		
		PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return..PinYin_btnchar
		
		-- ������һ����ʾ����
		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
	end,
	--��������ڰ����˸����ʱ��ִ��
	--�޲���
	--�޷���ֵ
	BackspaceBtnClick = function()
		--����ַ�����Ϊ�գ���
		if (PinYin_Vars.Text_to_return~="") then
			PinYin_Vars.Text_to_return = PinYin_functions.DeleteLastChar(PinYin_Vars.Text_to_return)
		end
		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
	end,
	
	--��������ڰ��´�д������SHIFT����ʱ��ִ��
	--�޲���
	--�޷���ֵ
	CapsLkBtnClick = function()
		PinYin_Vars.CapsLk_Check = 1 - PinYin_Vars.CapsLk_Check
		UI_SetButtonPressed("PinYinIME", "CapsLkCheck", PinYin_Vars.CapsLk_Check)
	end,
	
	--��������ڰ��»س�����ʱ��ִ��
	--�޲���
	--�޷���ֵ
	EnterBtnClick = function()
	  PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return.."\n"
		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
	end,
	
	--��������ڰ����˸����ʱ��ִ��
	--����str��string����Ϊ��ɾ���ַ����ַ���
	--����ֵresult��string����Ϊstrɾ�������һ���ֺ�õ��ĵ��ַ���
	DeleteLastChar = function(str)
		return strsub(str,1,-2)
	end,
	
	--����һ������ѭ�����еĹ���
  --�����ڽ����е��ַ���ĩβ��ʾ��˸�Ĺ��
	DisplayText = function()
	  PinYin_Vars.Rule_DisplayText_Flag =  1 - PinYin_Vars.Rule_DisplayText_Flag
  	if(PinYin_Vars.Rule_DisplayText_Flag == 0) then
  		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
  	else
  		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return.."_")
  	end
  end,
  
	--���������ȷ�����룬�˳����뷨��ʱ��ִ��
	--�޲���
	--�޷���ֵ
	PinYin_Exit = function()
		--�����ֳ�
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
		
		--���ûص��������ؽ��
		PinYin_Return(PinYin_Vars.Text_to_return)
		
		PinYin_Vars = nil
	end
}