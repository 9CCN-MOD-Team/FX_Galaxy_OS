-- Displays detailed information about unit caps when the user
--  mouses over the units menu
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

--UnitCapInfoPopupWidth = 225
UnitCapInfoPopupWidth = 235
MAXHEIGHT = 325

function 	CreateOBIntelFrame(index)
	local l_Table=
		{
				type = "Frame",
				name = "frmItemToClone"..index,
				autosize = 1,		
				arrangetype = "horiz",
				Layout = {
					size_WH = { w = 1, h = 1, wr = "1", hr = "px" },								
				},
				;
				
				{
					type = "Frame",
					name = "frmName"..index,
					autosize=1,
					arrangetype = "horiz",
					;
					{	
						type = "TextLabel",
						name = "Player"..index,
						autosize=1,
						--backgroundColor = { 0, 255, 0, 200 },
						Layout = {
							min_WH = { w = 240, wr = "px" },
							pad_LT  = { l = 8, t = 1, lr = "px", tr = "px" },				
						},
						Text = {
							textStyle = "IGHeading2",
							hAlign = "Left",
							--vAlign = "Middle",
							minShrink = 0.25,
							--offset = {-6,0},
						},
						giveParentMouseInput = 1,
						dropShadow = 1,
					},		
					{	
						type = "TextLabel",
						name = "Information"..index,
						autosize=1,
						--backgroundColor = { 0, 255, 0, 200 },
						Layout = {
							min_WH = { w = 85, wr = "px" },
							pad_LT  = { l = 8, t = 1, lr = "px", tr = "px" },				
						},
						Text = {
							textStyle = "IGHeading2",
							hAlign = "Right",
							--vAlign = "Middle",
							minShrink = 0.25,
							--offset = {-6,0},
						},
						giveParentMouseInput = 1,
						dropShadow = 1,
					},		
				},
			}
	return l_Table
end

OBInfo= {

	maxColor = {255,0,0,255}, -- color for max pop reached
	availColor = {0,255,0,255},	-- color for pop available
	
	--size = {32, 71, 100, 200},
	autosize = 1,
	RootElementSettings = {

		autosize = 1,
		--backgroundColor          = {255,128,0,255},

		Layout = {	
			pad_LT  = { l = 8, t = 0, lr = "px", tr = "px" },
		},	
		
		Anchor_Binds = {
			pivotX = "Taskbar_LeftButtonsTopRight",
			pivotY = "Taskbar_LeftButtonsTopRight",
		},
	},
	
	soundOnShow = "SFX_RecallMenuONOFF",
	soundOnHide = "SFX_RecallMenuONOFF",	
	
	onShow = "UI_SetButtonPressed('NewTaskbar', 'btnOBIntel', 1)",
	onHide = "UI_SetButtonPressed('NewTaskbar', 'btnOBIntel', 0)", 
	
	stylesheet = "HW2StyleSheet",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	arrangetype = "vert",
	;	

	{
		type = "Frame",
		name = "MainFrame",
		autosize = 1,
		autoarrange = 1,
		arrangetype = "vert",
		;
		{
			type = "Frame",
			name = "frmItems",
			autosize = 1,
			arrangetype = "vert",
			;
			NewMenuButton("btnMode1",	"$90300",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode1", 0);UI_SetElementVisible("OBInfo", "btnMode2", 1)]]),	
			NewMenuButton("btnMode2",	"$90302",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode2", 0);UI_SetElementVisible("OBInfo", "btnMode3", 1)]]),	
			NewMenuButton("btnMode3",	"$90304",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode3", 0);UI_SetElementVisible("OBInfo", "btnMode4", 1)]]),	
			NewMenuButton("btnMode4",	"$90306",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode4", 0);UI_SetElementVisible("OBInfo", "btnMode5", 1)]]),	
			NewMenuButton("btnMode5",	"$90308",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode5", 0);UI_SetElementVisible("OBInfo", "btnMode6", 1)]]),	
			NewMenuButton("btnMode6",	"$90310",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode6", 0);UI_SetElementVisible("OBInfo", "btnMode7", 1)]]),	
			NewMenuButton("btnMode7",	"$90312",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode7", 0);UI_SetElementVisible("OBInfo", "btnMode8", 1)]]),	
			NewMenuButton("btnMode8",	"$90314",	nil,	0,	LAYOUT_FX_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetElementVisible("OBInfo", "btnMode8", 0);UI_SetElementVisible("OBInfo", "btnMode1", 1)]]),	
			CreateOBIntelFrame(1),
			CreateOBIntelFrame(2),
			CreateOBIntelFrame(3),
			CreateOBIntelFrame(4),
			CreateOBIntelFrame(5),
			CreateOBIntelFrame(6),
			CreateOBIntelFrame(7),
		},
	},
}
	