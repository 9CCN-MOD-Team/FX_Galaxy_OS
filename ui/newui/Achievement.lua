-------------------------------------------------------------
----------Achievement.lua----------2019年08月23日------------
--由 9CCNMOD组 破天者-孤狼 编写
--这个文件包含FX MOD中的成就系统主UI界面代码
-------------------------------------------------------------
--成就列表在data:ui/newui/Achievement/AchievementList.lua中定义
--成就相关的控制函数在data:scripts/FX_AchievementControl.lua中定义
-------------------------------------------------------------
-------------------------------------------------------------


dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

dofilepath("data:scripts/FX_AchievementControl.lua")
dofilepath("data:scripts/LW_functions.lua")

AchievementListSize=0
for index,item in AchievementList do
	AchievementListSize=AchievementListSize+1
end


function ShowOneAchievementInTheList(iIndex,sPic,sText)
	_Achievements=
	{ 
		type = "ListBoxItem",
		soundOnClicked = "SFX_ButtonClick",
		soundOnEnter = "SFX_ButtonEnter",
		name = "AchievementsInList"..iIndex,
		visible = 1,
		ignored = 1,
		autosize = 1,
		resizeToListBox = 1,
		helpTipTextLabel = "m_lblHelpText",
		arrangetype = "horiz",
		overColor = {255,255,255,32},
		pressedColor = {255,255,255,16},
		backgroundColor = {255,255,255,0},
		onMouseClicked = [[
			local index=]]..iIndex..[[;																					--这种传递值的方式还真是别扭啊。。。。
			local AchievementListSize=]]..AchievementListSize..[[;
			for i=1,AchievementListSize do
				if(i==index) then
					UI_SetElementVisible("Achievement","AchievementsInDetail"..i,1)
				else
					UI_SetElementVisible("Achievement","AchievementsInDetail"..i,0)
				end
			end
			]],
		Layout=
			{
				--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
				size_WH = {h = 1/16,hr = "scr"},
			},
		;													
		{ 
			type = "Frame", 
			Layout=
			{
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
				size_WH = {w = 1/4,h = 100000,wr = "par",hr = "px"},
				lockAspect = 1,	
			},		
			autosize = 0,
			BackgroundGraphic = 
			{ 
				texture = sPic, 
				uvRect = { 0, 0, 1, 1, },
			},
			visible = 1, 
		},
		{
			type = "TextLabel",
	
			Layout = 
			{	
				size_WH = {w = 3/4, h = 1, wr = "par", hr = "par",},
				pos_XY = { x = 1/4, y = 0.0, xr = "par", yr = "par" },
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
				text = sText,
			},
		},
	}
	return _Achievements
end
function ShowOneAchievementInDetail(iIndex,sPic,sName,sDescription,sCompleteDate,sProgress)
	_Achievements=
	{
		type = "Frame",
		name = "AchievementsInDetail"..iIndex,
		Layout = 
		{			
			pos_XY = { x = 0, y = 0, xr = "par", yr = "par" },	
			size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },				
		},
		visible=0,
		;
		{ 
			type = "Frame", 
			Layout=
			{
				pos_XY = { x = 35/1920, y = 25/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 256/1920,h = 100000,wr = "scr",hr = "px"},
				lockAspect = 1,	
			},		
			autosize = 0,
			BackgroundGraphic = 
			{ 
				texture = sPic, 
				uvRect = { 0, 0, 1, 1, },
			},
			visible = 1, 
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				pos_XY = { x = (35+256+30)/1920, y = 25/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 256/1920,h = 256/1080,wr = "scr",hr = "scr"},
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				
				hAlign = "Middle",
				vAlign = "Middle",
				text = sName,
			},
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				pos_XY = { x = (35+5)/1920, y = (256)/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = (256+256+25)/1920,wr = "scr"},
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				
				hAlign = "Left",
				vAlign = "Middle",
				text = "$90027",
			},
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				pos_XY = { x = (35+5+256)/1920, y = (256)/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = (256+256+25)/1920,wr = "scr"},
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				
				hAlign = "Left",
				vAlign = "Middle",
				text = sCompleteDate,
			},
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				pos_XY = { x = (35+5)/1920, y = (256 + 30)/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = (256+256+25)/1920,wr = "scr"},
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				
				hAlign = "Left",
				vAlign = "Middle",
				text = "$90046",
			},
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				pos_XY = { x = (35+5+256)/1920, y = (256 + 30)/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = (256+256+25)/1920,wr = "scr"},
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				
				hAlign = "Left",
				vAlign = "Middle",
				text = sProgress,
			},
		},
		{
			type = "TextLabel",
			Layout = 
			{	
				pos_XY = { x = (35+5)/1920, y = (256+30+120)/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = (256+256+25)/1920,wr = "scr"},
			},
			wrapping = 1,				--自动换行
			autosize=0,
			Text = 
			{
				textStyle = "FEHeading4",
				
				hAlign = "Left",
				vAlign = "Top",
				text = sDescription,
				minShrink = 0.25,
			},
		},
	}
	return _Achievements
end
function ShowAllAchievements()

	Read_FX_Achievements_Lua()
	
	--获取所有成就index，并根据displayPriority排序
	local indexes = {}
	local index_num = 1
	for index, item in AchievementList do
		indexes[index_num] = {ind = index, pri = item.displayPriority or 1} --默认displayPriority为1
		index_num = index_num + 1
	end
	index_num = index_num - 1
	--冒泡排序，将indexes按displayPriority升序排序
	for j = 1, index_num - 1 do
		for k = 1, index_num - j do
			if indexes[k].pri > indexes[k + 1].pri then
				indexes[k], indexes[k + 1] = indexes[k + 1], indexes[k]
			end
		end
	end
	
	local AchievementsContainer = findTableElement(Achievement,{
	{"name", "frmRootbottombigfrm"},
	{"type", "RmWindow"},
	{"name", "Contentsframe"},
	{"name", "AllAchievements"},
	{"name", "frameAchievementsContainer"}
	})
	
	for i = 1, index_num do
		local item = AchievementList[indexes[i].ind]
		if (Get_FX_Achievements_isComplete(indexes[i].ind) == 1) then
			AchievementsContainer[i] = ShowOneAchievementInTheList(i, item.picWhenUnLocked, item.localeName)
		else
			AchievementsContainer[i] = ShowOneAchievementInTheList(i, item.picWhenLocked, item.localeName)
		end
	end
	
	local AchievementsDetailContainer = findTableElement(Achievement,{
	{"name", "frmRootbottombigfrm"},
	{"type", "RmWindow"},
	{"name", "Contentsframe"},
	{"name", "AllAchievements"},
	{"name", "frameAchievementsDetailContainer"}
	})
	
	for i = 1, index_num do
		local item = AchievementList[indexes[i].ind]
		local progressText = Get_FX_Achievements_Value(indexes[i].ind).."/"..item.maxValue
		if (Get_FX_Achievements_isComplete(indexes[i].ind) == 1) then
			AchievementsDetailContainer[i] = ShowOneAchievementInDetail(i, item.picWhenUnLocked, item.localeName, item.descriptionWhenUnLocked, FX_Achievements[indexes[i].ind].completeDate, progressText)
		else
			AchievementsDetailContainer[i] = ShowOneAchievementInDetail(i, item.picWhenLocked, item.localeName, item.descriptionWhenLocked, FX_Achievements[indexes[i].ind].completeDate, progressText)
		end
	end
	
end

Achievement = 
{ 
	Layout = 
	{						
		pos_XY = {x=0, y=0, xr="scr", yr="scr",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	eventOpaque = 0,
	stylesheet = "HW2StyleSheet", 
	RootElementSettings = { backgroundColor = { 0, 0, 0, 0, }, }, 
	pixelUVCoords = 1, 
	previousScreen = "NewMainMenu",
	onShow = [[
		isMainMenu = not MainUI_ScarEvent
		if (isMainMenu) then
			UI_SetElementVisible("Achievement","frmSCREENHEADER",1)
			UI_SetElementVisible("Achievement","btnBack",1)
			UI_SetElementVisible("Achievement","m_btnAccept",0)
		else
			UI_SetElementVisible("Achievement","frmSCREENHEADER",0)
			UI_SetElementVisible("Achievement","btnBack",0)
			UI_SetElementVisible("Achievement","m_btnAccept",1)
		end
	]]
	;
	------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		name="frmSCREENHEADER",
		TitleText = "$90012", -- 成就
		SubTitleText = "$90017", -- 成就展示
		Layout = 
		{	
			size_WH = {	w = 1.0, h = 180.0/540, wr = "par", hr = "scr" },							
		},				
	},
	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbottombigfrm",
		
		Layout = 
		{
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},		
		},

		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;	
		------------------------------------------------------------------------------------
		-- WINDOW FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText = "$90018", -- 所有成就
			autosize=1,
			arrangetype = "vert",
			;	
			-- Contents frame
				{
					type = "Frame",
					name = "Contentsframe",
					Layout = 
					{
						pivot_XY = { 0.5, 0.5 },					
						pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},	
						size_WH = {	w = 1/2, h = 2/3, wr = "scr", hr = "scr" },				
					},

				;
					{
						type = "TabPage",
						name = "AllAchievements",		
						visible = 1,
						Layout = 
						{
							pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
							size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
							pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
							pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
						},
						;
						{
							type = "ListBox",
							listBoxStyle = "FEListBoxStyle_Bordered",
							name = "frameAchievementsContainer",
							Layout = 
							{
								pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
								size_WH = { w = 1/3, h = 1.0, wr = "par", hr = "par" },
							},

							scrollBarPageSize = 200,
							;
							--在这里由ShowOneAchievementInTheList()添加内容
						},
						{
							type = "Frame",
							name = "frameAchievementsDetailContainer",
							Layout = 
							{				
								pos_XY = {	x= 1/3, y=0, xr="par", yr="par",},	
								size_WH = {	w = 2/3, h = 1, wr = "par", hr = "par" },				
							},
							;
							--在这里由ShowOneAchievementInDetail()添加内容
						},
					},
				},
		},
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			name = "frmRootbottombigfrm2",					
			WindowTemplate = PANEL_NAVIGATIONFRAME,
			;			
			-- 返回按钮		
			NewMenuButton("btnBack","$3336","$3336",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped", "UI_PreviousScreen(eTransition)"),	
			-- 关闭按钮		
			NewMenuButton("m_btnAccept","$2642","$2642",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	"UI_ToggleScreen('Achievement', 0);UI_SetButtonPressed('NewTaskbar', 'btnAchievement', 0)"),		
		},		
	},
}


ShowAllAchievements()