-------------------------------------------------------------
------LW_PinYinIMEControl.lua-------2016年8月19日---------
--由 9CCNMOD组 破天者-孤狼 编写
--这在FXGMOD的RPG模式中为船只重命名时用到的中文输入法的控制函数
--需要输入文字时，请调用PinYin_Init(text,func)函数，输入法窗口将自动弹出
--当玩家确认输入内容后，程序将调用参数func对应的函数，并将玩家输入的
--字符串作为func的第一个参数传入
-------------------------------------------------------------
-------------------------------------------------------------

--载入个人函数库……事实上我自己也不记得在最终的代码里有没有用到这个库里的函数了，不过懒得查了就这样吧
dofilepath("data:scripts/LW_functions.lua")

-- load scripts according to current language
dofilepath("locale:scripts/LW_PinYinIME.lua")

--需要输入文字时，请调用PinYin_Init(text,func)函数
--参数text（string），表示界面上将显示的提示字串
--参数func（function），输入完毕后的回掉函数，在玩家确认输入后会被调用，并将被输入的字符串作为其参数
function PinYin_Init(text,func)
	--禁用游戏内的各种命令，防止按键输入时出现误操作
	MainUI_PushEnabledCommandState()
	MainUI_DisableAllCommands(1)
	--然而以上依然不够，按O键时“目标”窗口依然会蹦出来，所以用这个规则在目标窗口一弹出来就让它隐藏
	Rule_Add("PinYin_Rule_HideScreen")
	
	--将func赋给“PinYin_Return”备用
	--注意似乎当被赋值的变量已经是函数时，直接用等号赋值可能失败（似乎水雷重载了等号）
	--所以这里用的是rawset（灵感来自于data:ai/default/default.lua）
	rawset(globals(),"PinYin_Return",func)
	
	PinYin_functions.loadData()
	
	--这些是将会用到的变量，使用“PinYin_Vars”这个table作为一个“命名空间”
	--因为每次调用PinYin_Init()这些变量都需要初始化一次，所以干脆把整个table的初始化都扔进了函数里
	PinYin_Vars = 
	{
		Text_to_proc = "",	--正在等待选字的字符串
		Text_to_return = "",	--已经选好字随时可以作为最终结果返回的字符串
		Text_to_show = "",	--选字框内显示的字符串
		SelectMode = 0,	--选字状态，1表示正在选字，0则相反
		Rule_DisplayText_Flag = 0, --控制闪烁的光标的标记，为1时将显示光标，为0时则不显示
		CapsLk_Check = 0,	--大写锁定状态，1为锁定，0为未锁定
		pageNum = 0, --当前选字框内显示的待选字页码
	}
	
	--非常奇怪的，直接的多次打开、退出又打开这个拼音UI的话，这个UI里的某些元素会一次比一次面积大（
	--所以只好reload一下
	UI_ReloadScreen("PinYinIME")
	
	--以下是各种UI界面初始化和按键绑定
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
	
	--这个是用来控制输入框内光标闪烁的规则
	Rule_AddInterval("PinYin_Rule_DisplayText",0.5)
	
	--弹出输入法界面
	UI_ShowScreen("PinYinIME", eTransition)
end
	
--这是一个不断循环运行的规则
--用于在界面中的字符串末尾显示闪烁的光标
function PinYin_Rule_DisplayText()
	PinYin_functions.DisplayText()
end

--这是一个不断循环运行的规则
--在O键被按下的时候目标窗口会蹦出来，只能这样让他马上消失了
function PinYin_Rule_HideScreen()
	UI_HideScreen("ObjectivesList");
end

--以下为按键绑定函数
function PinYin_KeyBinds_SPACEKEY()
	PinYin_functions.inputBtnClick(" ")
end

--偷懒用了循环，所以得用setglobal
for i=0,9 do
	setglobal("PinYin_KeyBinds_"..i,
		function()
			--注意这个%i（好像从来没在MOD代码里见人用过，多读一下标准文档还是有好处的2333）
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