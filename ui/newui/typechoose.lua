dofilepath("locale:tradetext.lua")
dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trademenudata.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 254

ChooseTypeMenu = {
	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},

	pixelUVCoords = 1, 
	
	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},
	
	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);",
	onHide = "MainUI_PopEnabledCommandState()",
	;
		


----------------------- Master Frame --------------------
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	DTM004[115], -- "WARNING",
		-- SubtitleText = "$5169", 	
	
			
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},				
		},	
		
		autosize  = 1,

		--arrangetype = "vert",
		--arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;
			
		{
			type = "Frame",
			autosize  = 1,
			arrangetype = "vert",
			arrangedir = 1,	

			Layout = {
				margin_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				margin_RB = { r = PANEL_PAD_HORIZ, b =1, rr = "scr", br = "px" },				
				size_WH = {	w = DIALOGBOX_WIDTH, h = 1.0, wr = "scr", hr = "px" },		
				--max_WH = { w = DIALOGBOX_WIDTH, wr = "scr" },								
			},	

			
			;			
			
			{
				type = "Frame",			
				Layout = 
				{
					--pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.0, y=0.0, xr="scr", yr="scr",},			
					size_WH = { w=140/800, h=20/600 , xr="scr", yr="scr",},		
				},
				autosize  = 1,
				arrangetype = "horiz",
				arrangedir = 1,	
				;
				{
					type = "Button",
		    	Layout = 
					{
						--pivot_XY = { 0.0, 0.0 },					
						pos_XY = {	x=0/800, y=0/600, xr="scr", yr="scr",},			
						size_WH = { w=20/800, h = 20/600, wr = "scr", hr = "scr",},
					},
		    	name = "LastTypeButton",
					soundOnEnter = "SFX_ButtonEnter",
					soundOnClicked = "SFX_ButtonClick",
		    	DefaultGraphic = 
		    	{
						texture = "locale:ui\\rpg\\arrow2_dflt.tga",
						uvRect = { 0,1,1,0 },
					},
						OverGraphic = 
					{
						texture = "locale:ui\\rpg\\arrow2_pass.tga",
						uvRect = { 0,1,1,0 },
					},
					PressedGraphic = 
					{
						texture = "locale:ui\\rpg\\arrow2_down.tga",
						uvRect = { 0,1,1,0 },
					},
					onMouseClicked = [[MainUI_ScarEvent("DTM4_ChangeBuyShipType(-1)")]],
				},
				{
						type = "TextLabel",
						name = "TypeLabel",					
						Layout = 
						{
							--pivot_XY = { 1.0, 0.0 },					
							pos_XY = {	x=20/800, y=0/600, xr="scr", yr="scr",},			
							size_WH = { w=60/800, h = 20/600, wr = "scr", hr = "scr",},
						},
						Text = 
						{
							textStyle = "RM_ShipInfoLabel_TextStyle",
							vAlign = "Middle",
							hAlign = "Center",
						},
				},
				{
					type = "Button",
		    	Layout = 
					{
						--pivot_XY = { 1.0, 0.0 },					
						pos_XY = {	x=120/800, y=0/600, xr="scr", yr="scr",},			
						size_WH = { w=20/800, h = 20/600, wr = "scr", hr = "scr",},
					},
		    	name = "NextTypeButton",
					soundOnEnter = "SFX_ButtonEnter",
					soundOnClicked = "SFX_ButtonClick",
		    	DefaultGraphic = 
		    	{
						texture = "locale:ui\\rpg\\arrow2_dflt.tga",
						uvRect = { 1,1,0,0 },
					},
						OverGraphic = 
					{
						texture = "locale:ui\\rpg\\arrow2_pass.tga",
						uvRect = { 1,1,0,0 },
					},
					PressedGraphic = 
					{
						texture = "locale:ui\\rpg\\arrow2_down.tga",
						uvRect = { 1,1,0,0 },
					},
					onMouseClicked = [[MainUI_ScarEvent("DTM4_ChangeBuyShipType(1)")]],
				},
			},
----------------------- Title Text Row -----------------------			
			-- Message Label
				{ 
						type = "ListBox", 
						Layout = 
						{
							pos_XY = {x=10/800, y=308/600, xr="scr", yr="scr",},
							size_WH = { w=135/800, h = 80/600, wr = "scr", hr = "scr",},
						},
						scrollBarSpace = 0, 
						hugBottom = 0, 
						visible = 1,
						;
						{ 
								type = "ListBoxItem",
								Layout = 
								{
									pos_XY = {x=0/800, y=0/600, xr="scr", yr="scr",},
									max_WH = { w=200/800, h = 600/600, wr = "scr", hr = "scr",},
								},
		            autosize = 1, 
		            --hAlign = "Center",
								visible = 1,
								;
									{
										type = "TextLabel",
										autosize = 1, 
										wrapping = 1, 
										Layout = 
										{
											pos_XY = {x=5/1080, y=0/1920, xr="scr", yr="scr",},
											max_WH = { w=135/800, h = 600/600, wr = "scr", hr = "scr",},
										},
										name = "STDesc",
										Text = 
										{
											textStyle = "RM_ShipInfoLabel_TextStyle",
						        	vAlign = "Middle", 
						        	hAlign = "Left", 
											color = {255,255,255,255,},
										},
									},
						},
					{ 
						type = "ListBoxItem",--添加一个空ListBoxItem可以有效解决1920x1080分辨率下滚动条消失的问题
						; 
					}, 
				},
					
			------------------------------------------------------------------------------------
			-- BOTTOM ROW
			------------------------------------------------------------------------------------
			
			{
				type = "Frame",			

				autosize  = 1,

				clipchildren=0,
				Layout = {				
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
				},

				;
				{
					type = "Frame",			

					autosize  = 1,

					arrangetype = "horiz",
					arrangedir = 1,	

					Layout = {
						pivot_XY = { 1.0, 0.0 },					
						pos_XY = {	x=1.0, y=0.0, xr="par", yr="px",},					

					},
					arrangeSep = {	x=BUTTON_SPACING_HORIZ, y=0, xr="scr", yr="scr",},	
					;
					NewMenuButton("m_btnAccept",	DTM004[15],	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1_Alert_Chipped",	 
								 [[
								 	MainUI_ScarEvent("DTM4_BuyShipType()")
								 ]]),
					NewMenuButton("m_btnCancel",	DTM004[16],	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	
								 [[
									MainUI_ScarEvent("g_shipconfirm = -1")
									UI_HideScreen("ChooseTypeMenu")
								 ]]),

							
				},
			},
		},
	},
}

	
