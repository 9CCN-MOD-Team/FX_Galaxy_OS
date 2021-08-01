--TellTale���Ի�ѡ��ʽ--
--���ȿ˽���--
--2016.06.11--

g_TellTaleTime = 0
g_TellTaleTotalTime = 0
g_TellTaleRule = {}
--g_TellTaleSilentRule = function()end

function TellTaleInit(text,rule,silentrule,time)--�Ի�ѡ�����ú�ʽ��text,ruleΪtable�����Ԫ����4����Ӧ��ҵĶԻ�ѡ��������ϣ�text[1]��������һ�text[2]�������棩����ӦҪִ�е�function,silentrule��ʱ�䵽��ִ�еĺ�ʽ��time�ǵ���ʱ�䣬��λ�룬��С�ڵ���0����ʱ������
	for i=1,4 do
		if(text[i]~=nil)then
			UI_SetElementVisible("NewTaskbar","telltalelabel_"..i,1)
			UI_SetTextLabelText("NewTaskbar","telltalelabel_"..i,text[i])
		else
			UI_SetElementVisible("NewTaskbar","telltalelabel_"..i,0)
			UI_SetTextLabelText("NewTaskbar","telltalelabel_"..i,"")
		end
	end
	UI_SetElementVisible("NewTaskbar","telltaleframe",1)
	if(time>0)then
		g_TellTaleTime = time
		g_TellTaleTotalTime = time
		UI_SetElementVisible("NewTaskbar","TelltaleProgressBar",1)
	else
		g_TellTaleTime = 0
		g_TellTaleTotalTime = 0
		UI_SetElementVisible("NewTaskbar","TelltaleProgressBar",0)
	end
	g_TellTaleRule = rule
	g_TellTaleRule[0] = silentrule
	Rule_AddInterval("TellTaleCheck",0.1)
end

function TellTaleCheck()
	if(g_TellTaleTime>0)then
		g_TellTaleTime=	g_TellTaleTime -0.1
		UI_SetElementSize("NewTaskbar","TelltaleProgressBar",600*(g_TellTaleTime/g_TellTaleTotalTime),4)
		UI_SetElementPosition("NewTaskbar","TelltaleProgressBarColor",0,4+252*((g_TellTaleTotalTime-g_TellTaleTime)/g_TellTaleTotalTime))
		if(g_TellTaleTime<=0)then
			Rule_Remove("TellTaleCheck")
			UI_SetElementVisible("NewTaskbar","telltaleframe",0)
			g_TellTaleRule[0]()
		else
			for i=1,4 do
				if(UI_IsNamedElementVisible("NewTaskbar","telltale"..i)==1)then
					UI_SetElementVisible("NewTaskbar","telltale"..i,0)
					UI_SetElementVisible("NewTaskbar","TelltaleProgressBar",0)
					for j=1,4 do
						if(i~=j)then
							UI_SetElementVisible("NewTaskbar","telltalelabel_"..j,0)
						end
					end
					g_TellTaleTime = 1
					g_TellTaleRule[0] = g_TellTaleRule[i]
					break
				end
			end
		end
	elseif(g_TellTaleTime<0)then
		g_TellTaleTime=	g_TellTaleTime +0.1
		if(g_TellTaleTime>=0)then
			Rule_Remove("TellTaleCheck")
			UI_SetElementVisible("NewTaskbar","telltaleframe",0)
			g_TellTaleRule[0]()
		end
	else
		for i=1,4 do
			if(UI_IsNamedElementVisible("NewTaskbar","telltale"..i)==1)then
				UI_SetElementVisible("NewTaskbar","telltale"..i,0)
				for j=1,4 do
					if(i~=j)then
						UI_SetElementVisible("NewTaskbar","telltalelabel_"..j,0)
					end
				end
				g_TellTaleTime = -1
				g_TellTaleRule[0] = g_TellTaleRule[i]
			end
		end
	end
end

