--��Щ�ǽ����õ��ĺ�����ʹ�á�PinYin_functions�����table��Ϊһ���������ռ䡱
PinYin_functions =
{
  loadData = function()
    --���������ļ������ļ�������ƴ�����LW_PinYinData��	
	  dofilepath("locale:scripts/LW_PinYinData.lua")
  end,

	--�������������ȡ�ڵ�pageNumҳӦ����ʾ�Ĵ�ѡ���ַ���
	--����pageNum��number������ʾҳ��
	--����text2proc��string����Ӧ��ΪPinYin_Vars.Text_to_proc��ֵ
	--����ֵresult��string������ʾ��ѡ���ַ���
	getSelectText = function(pageNum, text2proc)
	
		--��һ����ʾtext2proc�����1
		local result = "1: "..text2proc.."\n"
		
		--����������и�ƴ����Ӧ�ĺ��ֵ�ʱ�򣬲���ʾ���������
		--ע����strlowerת��ΪСд��ĸ
		if LW_PinYinData[strlower(text2proc)] then
			--��ʾ7����Ӧ�Ĵ�ѡ����
			for i = 1, min(7, LW_PinYinData[strlower(text2proc)].n - 7 * pageNum) do
				result = result..(i + 1)..": "..LW_PinYinData[strlower(text2proc)][i + 7 * pageNum].."; "
			end
			--���к���ʾ��ҳ��ʾ
			result = result.."\n"
			if pageNum > 0 then
				result = result.."9: ��һҳ "
			end
			if LW_PinYinData[strlower(text2proc)].n - 7 * pageNum > 7 then
				result = result.."0: ��һҳ"
			end
		end
		--���ش�ѡ���ַ���
		return result
	end,
	--�������������ȡ�ڵ�pageNumҳ��ʾ�Ĵ�ѡ���ַ����еı��Ϊnum���ַ���
	--����num��number������ʾ��ѡ�е��ִ��ı��
	--����pageNum��number������ʾҳ��
	--����ֵ��string������ʾ��ѡ���ִ�������nilʱ��ʾ���num��Ӧ���ִ�������
	getSelectedChar = function(num, pageNum)
		--������Ϊ1��ֱ�ӷ���PinYin_Vars.Text_to_proc��ֵ
		if num == 1 then
			return PinYin_Vars.Text_to_proc
		--��������ҵ��ִ��Ƿ����
		elseif LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)] and 
				LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)].n - 7 * pageNum >= num - 1 then
			--�������򷵻ض�Ӧ����
			return LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)][num - 1 + 7 * pageNum]
		else
			--���������򷵻�nil
			return nil
		end
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
		--������ڲ��Ǵ���ѡ��״̬����������Ĳ������֣���
		if PinYin_Vars.SelectMode == 0 or PinYin_btnchar < "0" or PinYin_btnchar > "9" then
			--ѡ�ֿ򷭵��ʼ��һҳ
			PinYin_Vars.pageNum=0
			--�������ַ����ڴ�ѡ�ֺ���
			PinYin_Vars.Text_to_proc = PinYin_Vars.Text_to_proc..PinYin_btnchar
			--��ȡ��ѡ��
			PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
			--����ѡ��״̬
			PinYin_Vars.SelectMode = 1
			
		--��������Ҫ����ѡ�ֵ�����
		else
			--������µ��ǡ�9��
			if PinYin_btnchar == "9" then
				--������ǵ�һҳ 
				if PinYin_Vars.pageNum > 0 then	--ע�����������Ƕ��if�ǲ��ܻ���һ��if����and���������ģ���Ϊ�漰�������else���жϻ᲻һ��
					--�򷭵�ǰһҳ
					PinYin_Vars.pageNum = PinYin_Vars.pageNum - 1
					PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
				end
			--������µ��ǡ�0��
			elseif (PinYin_btnchar=="0") then
				--����������һҳ
				if LW_PinYinData[strlower(PinYin_Vars.Text_to_proc)].n - 7 * PinYin_Vars.pageNum > 7 then
					--�򷭵���һҳ
					PinYin_Vars.pageNum = PinYin_Vars.pageNum + 1
					PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
				end		
			else
				--�����ȡ���ѡ����Ǹ���
				local tempChar=PinYin_functions.getSelectedChar(tonumber(PinYin_btnchar), PinYin_Vars.pageNum)
				--���ѡ�ֳɹ�����
				if tempChar then
					--��մ�ѡ�ַ�����ѡ�ֿ�
					PinYin_Vars.Text_to_proc = ""
					PinYin_Vars.Text_to_show = ""
					--��ѡ�е�����ӵ����ս���ַ���
					PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return..tempChar
					--���Ҹ������ս���ַ�������ʾ
					UI_SetTextLabelText("PinYinIME", "TextInput", PinYin_Vars.Text_to_return)
					--ͬʱ�˳�ѡ��ģʽ
					PinYin_Vars.SelectMode = 0
				--���ѡ�ֲ��ɹ�����
				else
					--������һҳ
					PinYin_Vars.pageNum=0
					--����������ּ򵥵ĸ����ڴ�ѡ�ַ�������
					PinYin_Vars.Text_to_proc = PinYin_Vars.Text_to_proc..PinYin_btnchar
					--���»�ȡѡ�ֿ�����
					PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum, PinYin_Vars.Text_to_proc)
				end
			end
		end
		--������Σ�������һ��ѡ�ֿ����ʾ����
		UI_SetTextLabelText("PinYinIME", "charSelectLable", PinYin_Vars.Text_to_show)
	end,
	--��������ڰ����˸����ʱ��ִ��
	--�޲���
	--�޷���ֵ
	BackspaceBtnClick = function()
		--�����ѡ�ַ�����Ϊ�գ���
		if PinYin_Vars.Text_to_proc ~= "" then
			--�Ӵ�ѡ�ַ�����ɾ��һ����
			PinYin_Vars.Text_to_proc = PinYin_functions.DeleteLastChar(PinYin_Vars.Text_to_proc)
			--�����ѡ�ַ���û�б�ɾ�գ���
			if(PinYin_Vars.Text_to_proc ~= "") then
				--�ص���һҳ�Ĵ�ѡ����
				PinYin_Vars.pageNum = 0
				PinYin_Vars.Text_to_show = PinYin_functions.getSelectText(PinYin_Vars.pageNum,PinYin_Vars.Text_to_proc)
				PinYin_Vars.SelectMode = 1
			else
				--�����˳�ѡ��״̬
				PinYin_Vars.SelectMode = 0
				PinYin_Vars.Text_to_show = ""
			end
		--����������ս���ַ�����Ϊ�գ���
		elseif (PinYin_Vars.Text_to_return~="") then
			PinYin_Vars.Text_to_return = PinYin_functions.DeleteLastChar(PinYin_Vars.Text_to_return)
		--���������ѡ�ַ��������ս���ַ������ǿյ���ô��ʲô��������
		end
		UI_SetTextLabelText("PinYinIME","charSelectLable",PinYin_Vars.Text_to_show)
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
		--�ڷ�ѡ��״̬ʱ���뻻�У�����ѡ���һ����ѡ�֣���Ӣ��ԭ�ģ�
		if PinYin_Vars.SelectMode == 0 then
			PinYin_Vars.Text_to_return = PinYin_Vars.Text_to_return.."\n"
			UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
		else
			PinYin_functions.inputBtnClick("1")
		end
	end,
	
	--��������ڰ����˸����ʱ��ִ��
	--����str��string����Ϊ��ɾ���ַ����ַ���
	--����ֵresult��string����Ϊstrɾ�������һ���ֺ�õ��ĵ��ַ���
	DeleteLastChar = function(str)
		--����Ƿ��Ǻ��֣�����ǵĻ�ɾ�������ַ�������ֻɾ��һ���ַ�
		if (strbyte(strsub(str,-1,-1))) > 127 then
			return strsub(str,1,-3)
		else
			return strsub(str,1,-2)
		end
	end,
	
	--����һ������ѭ�����еĹ���
  --�����ڽ����е��ַ���ĩβ��ʾ��˸�Ĺ��
	DisplayText = function()
	  PinYin_Vars.Rule_DisplayText_Flag =  1 - PinYin_Vars.Rule_DisplayText_Flag
  	if(PinYin_Vars.Rule_DisplayText_Flag == 0) then
  		UI_SetTextLabelText("PinYinIME","charSelectLable",PinYin_Vars.Text_to_show)
  		UI_SetTextLabelText("PinYinIME","TextInput",PinYin_Vars.Text_to_return)
  	else
  		--ע�����������tricky��strfind
  		--Ϊ�˰ѹ��嵽����ֵĵ�һ�е�ĩβ�����ǵ�����һ��
  		local begPos, endPos = 0, 0
  		if PinYin_Vars.Text_to_proc == "1" then
  			--�������������������1�Ļ���ΪText_to_show���ͷ�Ϳ����и�1���Եð��Ǹ�����ȥ
  			begPos, endPos=strfind(PinYin_Vars.Text_to_show, PinYin_Vars.Text_to_proc, 1, 1)
  			begPos, endPos=strfind(PinYin_Vars.Text_to_show, PinYin_Vars.Text_to_proc,endPos + 1, 1)
  		else
  			begPos, endPos=strfind(PinYin_Vars.Text_to_show,PinYin_Vars.Text_to_proc , 1, 1)
  		end
  		UI_SetTextLabelText("PinYinIME","charSelectLable",strsub(PinYin_Vars.Text_to_show,1,endPos).."_"..strsub(PinYin_Vars.Text_to_show,endPos+1,-1))
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