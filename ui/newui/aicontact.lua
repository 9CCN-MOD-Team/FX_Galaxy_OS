dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("data:ui/subtitleaddon.lua")

function CreateAICharacterBGFrame()
	-- for now, size of this AIBG frame is set to 0
	-- we need to adjust it once we decide how to present those background stories
	local frame=
	{
		type = "Frame",
		borderColor = "FEColorOutline",
		name = "AIBG",
		visible = 0,
		Layout =
		{
			--min_WH = { w = 0.6, wr = "par" },
			size_WH = { w = 0, h = 0, wr = "par", hr = "par" },
		}, 
	}
--	local index=1
--	for ai, imgdata in AI_IMGs do
--		for i, img in imgdata do
--			frame[index]=
--			{
--				type = "Frame",
--				Layout = 
--				{
--					pivot_XY = { 0.5, 0.5 },
--					pos_XY = {	x = 0.5, y = 0.5, xr="par", yr="par",},
--					size_WH = {	w = img.size, wr = "par"},
--					lockAspect = -img.aspect,
--				},
--				name = ai.."_IMG_"..i,
--				BackgroundGraphic = {
--					type = "Graphic",
--					textureUV = img.uv,
--					texture = img.file
--				},
--				visible = 0,
--			}
--			index = index + 1
--		end
--	end
	return frame
end

function addTheme3(Index, Race, Image)
	local Theme=
		{
			type = "Frame",
			name = "AI"..Index.."SpeechIcon"..Race,
			Layout=
			{
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
				size_WH = { w = 1, wr = "par" },
				lockAspect = 2,
			},
			autosize = 0,
			BackgroundGraphic = {
				texture = "DATA:UI\\speechicons\\"..Image,
				uvRect = { 0, 1, 1, 0 },
			},
			giveParentMouseInput = 1,
			visible = 0,
		}
	return Theme
end

function addPlayer(Index)
	local Player =
	{
		type = "ListBoxItem",
		soundOnClicked = "SFX_ButtonClick",
		soundOnEnter = "SFX_ButtonEnter",
		name="AIPlayer"..Index,
		Layout = {
			size_WH = {w = 1,wr = "par",},
			margin_RB = { r = 16, rr = "px"},		
		},
		onMouseClicked = [[MainUI_ScarEvent("FX_ContactWithPlayer(]]..Index..[[)")]],
		ignored = 1,
		autosize = 1,
		resizeToListBox = 1,
		overColor = {255,255,255,32},
		pressedColor = {255,255,255,16},
		backgroundColor = {255,255,255,0},
		;
		{
			type = "Frame",
			Layout=
			{
				size_WH = { w = 1, wr = "par",},	
			},
			arrangetype = "horiz",
			autoarrange = 1,
			autosize = 1,
			;
			{
				type = "Frame",
				name = "AIAvatarFrame",
				Layout=
				{
					size_WH = { w = 0.5, wr = "par",},
					margin_LT = { l = 8, t = 4, lr = "px", tr = "px" },
					margin_RB = { r = 8, b = 4, rr = "px", br = "px" },
				},
				autoarrange = 0,
				autosize = 1,
			},
			{
				type = "Frame",
				name = "AINameRelationFrame",
				Layout=
				{
					size_WH = { w = 0.5, wr = "par"},
					margin_LT = { l = 8, t = 4, lr = "px", tr = "px" },
					margin_RB = { r = 8, b = 4, rr = "px", br = "px" },
				},
				autosize = 1,
				arrangetype = "vert",
				autoarrange = 1,
				;
				{
					type = "TextLabel",
					name = "AIName"..Index,
					--wrapping = 1,
					giveParentMouseInput = 1,
					autosize = 1,
					Layout=
					{
						size_WH = { w = 1, h = 0.5, wr = "par", hr = "par" },
					},
					Text =
					{
						textStyle = "FEHeading4",
						vAlign = "Center",
						hAlign = "Middle",
						minShrink = 0.25,
					},
				},
				{
					type = "TextLabel",
					name = "AIRelation"..Index,
					--wrapping = 1,
					giveParentMouseInput = 1,
					autosize = 1,
					Layout=
					{
						size_WH = { w = 1, h = 0.5, wr = "par", hr = "par" },
					},
					Text =
					{
						textStyle = "FEHeading4",
						vAlign = "Center",
						hAlign = "Middle",
						minShrink = 0.25,
					},
				},
			}
		}
	}	
	local index = 1
	while SpeechActor[index] ~= nil do
		Player[1][1][index] = addTheme3(Index, index, SpeechActor[index])
		index = index+1
	end
	return Player
end

LAYOUT_AI_MENU_BUTTONS =
{
	min_WH = {w = 1,h = 32 / 1080,wr = "par",hr = "scr"},
}

DragMe = {
	type = "DragHandle",
	dragType = "pos",
	
	stateBaseOfs = { 0.0, 16/64 },
	stateBaseCells = { 1, 1, 1, 0, 3 },
	stateIconOfs = { 0.0, 16/64 },
	stateIconCells = { 0, 0, 0, 1, 1 },
		
	Layout = {
		size_WH = { w = 1, h = 32 / 1080,	wr = "par",	hr = "scr",	},
	},
		
	BackgroundGraphic = {
		size = {0, 0},
		texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
		uvRect = { 33/64, 1/64, 63/64, 15/64 },
		patch_X = { 6, -18, 6, 0 },
		patch_Y = { 5, -4, 5, 0 },
		patch_Scale = 1,
		patch_AutoScale = 1,
			
		fill = "DATA:UI\\NewUI\\Styles\\Fill_JaggedWhite.tga",
			
		Surface = {
			surface = "ui_multistate";
			{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
		},
	},
		
	IconBase = {
		size = {0, 0},
		texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
		uvRect = { 1/64, 1/64, 31/64, 15/64 },
		patch_X = { 6, -18, 6, 0 },
		patch_Y = { 5, -4, 5, 0 },
		patch_Scale = 1,
		patch_AutoScale = 1,
	},
		
	text = "$90144", -- 拖动此处以移动该窗口
		
	Text = 
	{
		textStyle = "FEButtonTextStyle",
		dropShadow = 1,
		vAlign = "Middle",
		hAlign = "Center",
	},
}

AIContact =
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
	onShow = [[
		-- Directly setting Layout->pos_XY will cause the DragHandle not working
		-- So we have to use UI_SetElementPosition
		UI_SetElementPosition("AIContact", "MainFrame", 200, 40)
	]]
	;
	{
		type = "Frame",
		name = "MainFrame",
		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		autoarrange = 1,
		;
		DragMe,
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText = "$2713", -- 外交
			arrangetype = "vert",
			autoarrange = 1,
			autosize=1,
			;
			-- Contents frame
			{
				type = "Frame",
				Layout =
				{
					size_WH = { w = 1000/1920, h = 700/1080, wr = "scr", hr = "scr" },
				},
				arrangetype = "horiz",
				autoarrange = 1,
				autosize = 0,
				;
				{
					type = "ListBox",
					listBoxStyle = "FEListBoxStyle_Bordered",
					Layout =
					{
						--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
						size_WH = { w = 0.4, h = 1.0, wr = "par", hr = "par" },
					},
					scrollBarPageSize = 200,
					backgroundColor = {20,20,20,20},
					BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
					;
					addPlayer(1),
					addPlayer(2),
					addPlayer(3),
					addPlayer(4),
					addPlayer(5),
					addPlayer(6),
					addPlayer(7),
				},
				{
					type = "Frame",
					name = "DialogFrame",
					Layout =
					{
						size_WH = { w = 0.6, h = 1.0, wr = "par", hr = "par" },
						margin_LT = { l = 32, t = 16, lr = "px", tr = "px" },
						margin_RB = { r = 32, b = 16, rr = "px", br = "px" },		
					},
					arrangetype = "vert",
					autoarrange = 1,
					autosize = 1,
					;
					CreateAICharacterBGFrame(),
					{
						type = "TextLabel",
						name = "AIDialogue",
						wrapping = 1,
						eventOpaque = 0,
						Layout=
						{
							size_WH = { w = 1.0, wr = "par" },
						},
						Text =
						{
							textStyle = "FEHeading4",
							vAlign = "Top",
							hAlign = "Left",
						},
					},
					{
						type = "Frame",
						name = "ChoiceBtnsFrame",
						borderColor = "FEColorOutline",
						Layout=
						{
							pivot_XY = { 0, 1 },
							pos_XY = { x = 0.0, y = 1.0, xr = "par", yr = "par" },
							size_WH = { w = 1.0, wr = "par" },
						},
						autosize=1,
						autoarrange = 1,
						arrangetype = "vert",
						arrangeSep = {	x=0, y= 4/540, xr="scr", yr="scr"}
						;
						NewMenuButton("PlayerChoice_1",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(1)")]],0),
						NewMenuButton("PlayerChoice_2",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(2)")]],0),
						NewMenuButton("PlayerChoice_3",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(3)")]],0),
						NewMenuButton("PlayerChoice_4",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(4)")]],0),
						NewMenuButton("PlayerChoice_5",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(5)")]],0),
						NewMenuButton("PlayerChoice_6",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(6)")]],0),
						NewMenuButton("PlayerChoice_7",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(7)")]],0),
						NewMenuButton("PlayerChoice_8",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(8)")]],0),
						NewMenuButton("PlayerChoice_9",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(9)")]],0),
						NewMenuButton("PlayerChoice_10","", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1",	[[MainUI_ScarEvent("FX_AIContactButtonClicked(0)")]],0),
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
			NewMenuButton("CloseAIContact","$90145", nil,	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped", [[MainUI_ScarEvent("FX_AICloseContact()")]]),		
		},
	},
}

