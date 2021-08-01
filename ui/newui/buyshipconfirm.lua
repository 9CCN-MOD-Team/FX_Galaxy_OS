dofilepath("locale:tradetext.lua")
dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trademenudata.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

DIALOGWIDTH = 254

BuyShipConfirmMenu = {
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
		TitleText =	"$5598", -- "WARNING",
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
----------------------- Title Text Row -----------------------			
			{
					type = "TextLabel",
					name = "ConfirmMessage",					
					autosize = 1,
					wrapping = 1,
					Text = {
						textStyle = "RM_MessageLabel_TextStyle",

						vAlign = "Top",
						hAlign = "Center",
					},

					Layout = {
						margin_RB = { r = 1, b =PANEL_PAD_VERT, rr = "px", br = "scr" },					
						size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
					},

					giveParentMouseInput = 1,
					;
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
									MainUI_ScarEvent("g_shipconfirm = 1")
									UI_HideScreen('BuyShipConfirmMenu')
								 ]]),
					NewMenuButton("m_btnCancel",	DTM004[16],	"",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	
								 [[
									MainUI_ScarEvent("g_shipconfirm = -1")
									UI_HideScreen('BuyShipConfirmMenu')
								 ]]),

							
				},
			},
		},
	},
}

	