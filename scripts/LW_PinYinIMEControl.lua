-------------------------------------------------------------
------LW_PinYinIMEControl.lua-------2016��8��19��---------
--�� 9CCNMOD�� ������-���� ��д
--����FXGMOD��RPGģʽ��Ϊ��ֻ������ʱ�õ����������뷨�Ŀ��ƺ���
--��Ҫ��������ʱ�������PinYin_Init(text,func)���������뷨���ڽ��Զ�����
--�����ȷ���������ݺ󣬳��򽫵��ò���func��Ӧ�ĺ�����������������
--�ַ�����Ϊfunc�ĵ�һ����������
-------------------------------------------------------------
-------------------------------------------------------------

--������˺����⡭����ʵ�����Լ�Ҳ���ǵ������յĴ�������û���õ��������ĺ����ˣ��������ò��˾�������
dofilepath("data:scripts/LW_functions.lua")

-- load scripts according to current language
dofilepath("locale:scripts/LW_PinYinIME.lua")

--��Ҫ��������ʱ�������PinYin_Init(text,func)����
--����text��string������ʾ�����Ͻ���ʾ����ʾ�ִ�
--����func��function����������Ϻ�Ļص������������ȷ�������ᱻ���ã�������������ַ�����Ϊ�����
function PinYin_Init(text,func)
	--������Ϸ�ڵĸ��������ֹ��������ʱ���������
	MainUI_PushEnabledCommandState()
	MainUI_DisableAllCommands(1)
	--Ȼ��������Ȼ��������O��ʱ��Ŀ�ꡱ������Ȼ��ĳ��������������������Ŀ�괰��һ����������������
	Rule_Add("PinYin_Rule_HideScreen")
	
	--��func������PinYin_Return������
	--ע���ƺ�������ֵ�ı����Ѿ��Ǻ���ʱ��ֱ���õȺŸ�ֵ����ʧ�ܣ��ƺ�ˮ�������˵Ⱥţ�
	--���������õ���rawset�����������data:ai/default/default.lua��
	rawset(globals(),"PinYin_Return",func)
	
	PinYin_functions.loadData()
	
	--��Щ�ǽ����õ��ı�����ʹ�á�PinYin_Vars�����table��Ϊһ���������ռ䡱
	--��Ϊÿ�ε���PinYin_Init()��Щ��������Ҫ��ʼ��һ�Σ����Ըɴ������table�ĳ�ʼ�����ӽ��˺�����
	PinYin_Vars = 
	{
		Text_to_proc = "",	--���ڵȴ�ѡ�ֵ��ַ���
		Text_to_return = "",	--�Ѿ�ѡ������ʱ������Ϊ���ս�����ص��ַ���
		Text_to_show = "",	--ѡ�ֿ�����ʾ���ַ���
		SelectMode = 0,	--ѡ��״̬��1��ʾ����ѡ�֣�0���෴
		Rule_DisplayText_Flag = 0, --������˸�Ĺ��ı�ǣ�Ϊ1ʱ����ʾ��꣬Ϊ0ʱ����ʾ
		CapsLk_Check = 0,	--��д����״̬��1Ϊ������0Ϊδ����
		pageNum = 0, --��ǰѡ�ֿ�����ʾ�Ĵ�ѡ��ҳ��
	}
	
	--�ǳ���ֵģ�ֱ�ӵĶ�δ򿪡��˳��ִ����ƴ��UI�Ļ������UI���ĳЩԪ�ػ�һ�α�һ�������
	--����ֻ��reloadһ��
	UI_ReloadScreen("PinYinIME")
	
	--�����Ǹ���UI�����ʼ���Ͱ�����
	UI_SetTextLabelText("PinYinIME", "DescriptionText", text)
	UI_SetButtonPressed("PinYinIME", "CapsLkCheck", PinYin_Vars.CapsLk_Check)
	
	UI_BindKeyEvent(SPACEKEY, "PinYin_KeyBinds_SPACEKEY")
	for i=0,9 do
		UI_BindKeyEvent(ZEROKEY+i, "PinYin_KeyBinds_"..i)
	end
	for i=0,25 do
		UI_BindKeyEvent(AKEY+i, "PinYin_KeyBinds_"..strchar(strbyte("A")+i))
	end
	UI_BindKeyEvent(BACKSPACEKEY, "PinYin_KeyBinds_BACKSPACEKEY")
	UI_BindKeyEvent(CAPSLOCKKEY, "PinYin_KeyBinds_CAPSLOCKKEY")
	--UI_BindKeyEvent(SHIFTKEY, "PinYin_KeyBinds_CAPSLOCKKEY")
	UI_BindKeyEvent(ENTERKEY, "PinYin_KeyBinds_ENTERKEY")
	
	--�������������������ڹ����˸�Ĺ���
	Rule_AddInterval("PinYin_Rule_DisplayText",0.5)
	
	--�������뷨����
	UI_ShowScreen("PinYinIME", eTransition)
end
	
--����һ������ѭ�����еĹ���
--�����ڽ����е��ַ���ĩβ��ʾ��˸�Ĺ��
function PinYin_Rule_DisplayText()
	PinYin_functions.DisplayText()
end

--����һ������ѭ�����еĹ���
--��O�������µ�ʱ��Ŀ�괰�ڻ�ĳ�����ֻ����������������ʧ��
function PinYin_Rule_HideScreen()
	UI_HideScreen("ObjectivesList");
end

--����Ϊ�����󶨺���
function PinYin_KeyBinds_SPACEKEY()
	PinYin_functions.inputBtnClick(" ")
end

--͵������ѭ�������Ե���setglobal
for i=0,9 do
	setglobal("PinYin_KeyBinds_"..i,
		function()
			--ע�����%i���������û��MOD����������ù������һ�±�׼�ĵ������кô���2333��
			PinYin_functions.inputBtnClick(tostring(%i))
		end)
end

for i=0,25 do
	setglobal("PinYin_KeyBinds_"..strchar(strbyte("A")+i),
	function()
		PinYin_functions.inputBtnClick(strchar(strbyte("A")+%i))
	end)
end

function PinYin_KeyBinds_BACKSPACEKEY()
	PinYin_functions.BackspaceBtnClick()
end

function PinYin_KeyBinds_CAPSLOCKKEY()
	PinYin_functions.CapsLkBtnClick()
end

function PinYin_KeyBinds_ENTERKEY()
	PinYin_functions.EnterBtnClick()
end