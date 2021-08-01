-- These need to be the same as in finalbuild.lua (build menu)
SHIPQUEUECOLOR = {246, 212, 0, 255}
SUBQUEUECOLOR = {224, 150, 0 , 255}
RESEARCHQUEUECOLOR = {64, 129, 249, 255}

-- These need to be the same as in research.lua (research menu)

MENUWIDTH = 110

SHIPTEXTCOLOR = { 170, 227, 255, 255}

ITEMTEXTCOLOR = {255,255,255,255}

MAXHEIGHT = 325

PROGRESSBGCOLOR = { 70, 74, 85, 190}

upy=2/600
downy=14/600

function createPauseButton(buttonName,updown)
	local pos_y
	if (updown == "up") then
		pos_y = upy
	else
		pos_y = downy
	end
	local newButton = {
				type = "Button",
				name = buttonName,
				Layout = {
					pos_XY = {	x = 84/800, y = pos_y, xr = "scr",	yr = "scr"	},	
					size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },			
				},
				flashSpeed = 300,
				DefaultGraphic = {
					Layout = {
						size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },			
					},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					Layout = {
						size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },			
					},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					Layout = {
						size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },			
					},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini.mres",
					textureUV = { 0, 0, 8, 8},
					color = { 48, 108, 136, 255},
				},
				soundOnClicked = "SFX_ButtonClick",
			}
	return newButton
end		
function createCancelButton(buttonName,updown)
	local pos_y
	if (updown == "up") then
		pos_y = upy
	else
		pos_y = downy
	end
	
	local newButton = {
		type = "Button",
		name = buttonName,
		Layout = {
			pos_XY = {	x = 94/800, y = pos_y, xr = "scr",	yr = "scr"	},	
			size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },			
		},
		DefaultGraphic = {
			Layout = {
				size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },			
			},
			texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
			textureUV = { 0, 0, 8, 8},
			color = { 0, 175, 255, 255},
		},
		OverGraphic = {
			Layout = {
				size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },		
			},
			texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
			textureUV = { 0, 0, 8, 8},
			color = { 255, 255, 255, 255},
		},
		DisabledGraphic = {
			Layout = {
				size_WH = {	w = 0.01, h = 0.01*16/9, wr = "scr", hr = "scr" },			
			},
			texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini.mres",
			textureUV = { 0, 0, 8, 8},
			color = { 48, 108, 136, 255},
		},
		soundOnClicked = "SFX_ButtonClick",
	}
	return newButton
end

function createTitleLable(namestr)
	local newTitle=
	{
		type = "TextLabel",
		Layout = {
			pos_XY = {	x = 2/800, y = 0/600, xr = "scr",	yr = "scr"	},	
			size_WH = {	w = (MENUWIDTH-4)/800, h = 12/600, wr = "scr", hr = "scr" },			
		},
		name = "shipName",
		Text = {
			text = namestr, 
			font = "ChatFont",
			hAlign = "Left",
			color = SHIPTEXTCOLOR,
			minShrink = 0.25,
		},
		giveParentMouseInput = 1,
		dropShadow = 1,
		eventOpaque = 0,
		clickThrough = 1,
	}
	return newTitle
end	

function createProgressBar(ProgressName,ProgressColor,updown)
	local pos_y
	if (updown == "up") then
		pos_y = upy
	else
		pos_y = downy
	end
	local newProgressBar =	{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = ProgressColor,
				Layout = {
					pos_XY = {	x = 2/800, y = pos_y, xr = "scr",	yr = "scr"	},	
					size_WH = {	w = 80/800, h = 0.01*16/9, wr = "scr", hr = "scr" },			
				},
				name = ProgressName,
				giveParentMouseInput = 1,
			}
	return newProgressBar
end		
function createBorRLable(LableName,updown)
	local pos_y
	if (updown == "up") then
		pos_y = upy
	else
		pos_y = downy
	end
	local newBorRLable =	{
				type = "TextLabel",
				Layout = {
						pos_XY = {	x = 2/800, y = pos_y, xr = "scr",	yr = "scr"	},	
						size_WH = {	w = 80/800, h = 0.01*16/9, wr = "scr", hr = "scr" },			
				},
				autosize = 0,
				name = LableName,
				Text = {
					font = "ChatFont",
					hAlign = "Left",
					color = ITEMTEXTCOLOR,
					minShrink = 0.25,
				},
				giveParentMouseInput = 1,
				dropShadow = 1,
				eventOpaque = 0,
				clickThrough = 1,
			}
	return newBorRLable
end


BuildQueueMenu = {
	size = {32, 71, MENUWIDTH, 600},
	stylesheet = "HW2StyleSheet",
	--clickThrough = 1,

	RootElementSettings = {
		
		autosize = 1,
		eventOpaque = 0,
	},

	soundOnShow = "SFX_GlobalQueueONOFF",
	soundOnHide = "SFX_GlobalQueueONOFF",
	
	onShow = "UI_SetButtonPressed('NewTaskbar', 'btnQueue', 1); UI_HideScreen('UnitCapInfoPopup'); UI_HideScreen('EventsScreen')",
	onHide = "UI_SetButtonPressed('NewTaskbar', 'btnQueue', 0)", 
	
	eventOpaque = 0,
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	-- custom values
	fstringBuild = "$2641",
	
	Regions = {
		{0,0,800, 600}, -- -1 means region will size to screen height
	},
	;
	
	-- root frame to insert build queue items
	{
		type = "Frame",
		name = "buildQueueFrame",
		position = { 0, 0},
		size = { MENUWIDTH, 13},
		autosize = 1,
		autoarrange = 1,
		arrangearray = 9,
		arrangetype = "horiz",
		maxSize = {MENUWIDTH*2, MAXHEIGHT*2},
		eventOpaque = 0,

	},

	-- build queue item to clone
	{
		type = "Button",
		name = "buildQueueItem",
		Layout = {
			pos_XY = {	x = 0/800, y = 0/600, xr = "scr",	yr = "scr"	},	
			size_WH = {	w = MENUWIDTH/800, h = 40/600, wr = "scr", hr = "scr" },			
		},
		visible = 0,
		eventOpaque = 0,
		clickThrough = 1,
		;
		
		-- ship name
		createTitleLable(),
			
		-- open build mgr button
		{
			type = "Button",
			name = "btnOpenBuildMgr",
			Layout = {
					pos_XY = {	x = 0/800, y = 12/600, xr = "scr",	yr = "scr"	},	
					size_WH = {	w = 104/800, h = 27/600, wr = "scr", hr = "scr" },			
			},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5450",--OPEN BUILD MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			--backgroundColor = {200,0,0,200},
			;
			
			-- ship progress
			createProgressBar("buildProgress",SHIPQUEUECOLOR,"up"),
			-- pause and cancel buttons
			createPauseButton("pauseButton","up"),
			createCancelButton("cancelButton","up"),
			
			-- subsystem progress
			createProgressBar("subsystemBuildProgress",SUBQUEUECOLOR,"down"),
	
			-- subsystem pause and cancel buttons
			createPauseButton("subsystemPauseButton","down"),
			createCancelButton("subsystemCancelButton","down"),
			createBorRLable("buildText","up"),
			createBorRLable("subsystemBuildText","down"),
		},
	},
	
	-- battle cruiser item to clone (can only build subsystems)
	{
		type = "Button",
		name = "subsystemQueueItem",
		Layout = {
			pos_XY = {	x = 0/800, y = 0/600, xr = "scr",	yr = "scr"	},	
			size_WH = {	w = MENUWIDTH/800, h = 28/600, wr = "scr", hr = "scr" },			
		},
		visible = 0,
		eventOpaque = 0,
		clickThrough = 1,
		;
		
		-- title
		createTitleLable(),
			
		-- open research mgr button
		{
			type = "Button",
			name = "btnOpenBuildMgr",
			Layout = {
					pos_XY = {	x = 0/800, y = 12/600, xr = "scr",	yr = "scr"	},	
					size_WH = {	w = 104/800, h = 14/600, wr = "scr", hr = "scr" },			
			},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5451",--OPEN RESEARCH MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			;
	
			-- progress
			createProgressBar("subsystemBuildProgress",SUBQUEUECOLOR,"up"),

			-- pause and cancel buttons
			createPauseButton("subsystemPauseButton","up"),
			createCancelButton("subsystemCancelButton","up"),
			createBorRLable("subsystemBuildText","up"),
		},
	},
	
	-- research queue item to clone
	{
		type = "Button",
		name = "researchQueueItem",
		Layout = {
			pos_XY = {	x = 0/800, y = 0/600, xr = "scr",	yr = "scr"	},	
			size_WH = {	w = MENUWIDTH/800, h = 28/600, wr = "scr", hr = "scr" },			
		},
		visible = 0,
		eventOpaque = 0,
		clickThrough = 1,
		;
		
		-- title
		createTitleLable("$3126"),
		-- open research mgr button
		{
			type = "Button",
			name = "btnOpenResearchMgr",
			Layout = {
					pos_XY = {	x = 0/800, y = 12/600, xr = "scr",	yr = "scr"	},	
					size_WH = {	w = 104/800, h = 14/600, wr = "scr", hr = "scr" },			
			},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5451",--OPEN RESEARCH MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			;
			
			
	
			-- progress
			createProgressBar("researchProgress",RESEARCHQUEUECOLOR,"up"),	
			-- pause and cancel buttons
			createPauseButton("pauseButton","up"),
			createCancelButton("cancelButton","up"),
			createBorRLable("researchText","up"),
		},
	},
}
