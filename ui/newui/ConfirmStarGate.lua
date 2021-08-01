dofilepath("locale:tradetext.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trade_map.lua")
		
FX_GATEUI_BTN_FOOTER_SMALL_LAYOUT = {
	pivot_XY = { 0.0, 0.5 },					
	pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},	
	pad_LT  = { l = 18/960, t = 3/540, lr = "scr", tr = "scr" },
	pad_RB  = { r = 18/960, b = 3/540, rr = "scr", br = "scr" },	
}
		
function createMapLogo(sMapID)
	local t = 
	{ 
		type = "Frame", 
		name = "pic_logo_"..sMapID,
		Layout=
		{
			pos_XY = { x = 0, y = 0, xr = "par", yr = "par" },		
			size_WH = {w = 1,h = 1,wr = "par",hr = "par"},
		},
		BackgroundGraphic = 
		{ 
			texture = g_MissionData[sMapID].Logo, 
			uvRect = { 0, 1, 1, 0, },
		},
		visible = 0, 
	}	
	return t
end

ConfirmStarGate = {
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
		TitleText =	DTM004[25],
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},				
		},		
		autosize  = 1,
		arrangetype = "vert",
		arrangedir = 1,	
		arrangeSep = { x = 0, y = PANEL_SPACING_VERT, xr = "scr", yr = "scr" },
		;	
----------------------- Text Rows -----------------------			
		{
			type = "Frame",
			autosize  = 1,
			arrangetype = "vert",
			arrangedir = 1,	
      arrangeSep = {	x=0, y=20/1080, xr="par", yr="scr",},	    
			Layout = {
				margin_LT = { l = 16/800, t = 4/540, lr = "scr", tr = "scr" },
				margin_RB = { r = 16/800, b = 1, rr = "scr", br = "px" },				
				--size_WH = {	w = 0.6, h = 1, wr = "scr", hr = "px" },									
			},	
			;
			{	
			  type = "Frame",
			  arrangetype = "horiz",
			  arrangedir = 1,	
			  autosize = 1,
			  ;
  			{
  				type = "Frame",
  				name = "frame_maplogo",
  				autosize = 0,
  				Layout = {	
  					size_WH = {w = 256/1920,h = 100000,wr = "scr",hr = "px"},
  					lockAspect = 1,						
  				},	
  			},		
  			{
  				type = "TextLabel",
  				name = "txt_gatename",					
  				autosize = 0,
  				wrapping = 1,
  				Text = {
  					textStyle = "RM_MessageLabel_TextStyle",
  					pixels = 76,
  					vAlign = "Middle",
  					hAlign = "Center",
  				},
  				Layout = {				
  					size_WH = { w = 512/1920, h = 256/1080, wr = "scr",hr = "scr"},
  				},
  				giveParentMouseInput = 1,
  			},
		  },
			{
				type = "Frame",
				name = "frame_text",
				autosize = 1,
				arrangetype = "horiz",
				arrangedir = 1,	
				Layout = {
					pos_XY = { x = 0, y = 0, xr = "par", yr = "px" },					
				},	
				;
				{
					type = "Frame",
					name = "frame_textleft",
					autosize = 1,
					arrangetype = "vert",
					arrangedir = 1,	
					;
					{
						type = "TextLabel",
						name = "txt_desc_priceprimary",					
						autosize = 1,
						wrapping = 0,
						Text = {
							textStyle = "RM_MessageLabel_TextStyle",
							text = DTM004[8],
							vAlign = "Middle",
							hAlign = "Center",
						},
						Layout = {
							pad_LT = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
							pad_RB = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },
						},
						giveParentMouseInput = 1,
					},
					{
						type = "TextLabel",
						name = "txt_desc_priceextra",					
						autosize = 1,
						wrapping = 0,
						Text = {
							textStyle = "RM_MessageLabel_TextStyle",
							text = DTM004[9],
							vAlign = "Middle",
							hAlign = "Center",
						},
						Layout = {
							pad_LT = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
							pad_RB = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },
						},
						giveParentMouseInput = 1,
					},
				},	
				{
					type = "Frame",
					name = "frame_textright",
					autosize = 1,
					arrangetype = "vert",	
					arrangedir = 1,	
					;
					{
						type = "TextLabel",
						name = "txt_priceprimary",					
						autosize = 1,
						wrapping = 0,
						Text = {
							textStyle = "RM_MessageLabel_TextStyle",
							vAlign = "Middle",
							hAlign = "Right",
						},
						Layout = {
							pad_LT = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
							pad_RB = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },
						},
						giveParentMouseInput = 1,
					},
					{
						type = "TextLabel",
						name = "txt_priceextra",					
						autosize = 1,
						wrapping = 0,
						Text = {
							textStyle = "RM_MessageLabel_TextStyle",
							vAlign = "Middle",
							hAlign = "Right",
						},
						Layout = {
							pad_LT = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
							pad_RB = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },
						},
						giveParentMouseInput = 1,
					},
				}						
			},		
			{
				type = "TextLabel",
				name = "txt_message",					
				autosize = 1,
				wrapping = 1,
				Text = {
					textStyle = "RM_MessageLabel_TextStyle",
					text = DTM004[10],
					vAlign = "Middle",
					hAlign = "Center",
				},
				Layout = {			
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
				},
				giveParentMouseInput = 1,
			},	
		},
			------------------------------------------------------------------------------------
			-- BOTTOM ROW
			------------------------------------------------------------------------------------			
  	{
  	  type = "Frame",	
  	  autosize = 1,	
  	  Layout = {
  	    size_WH = {w = 1,h = 0,wr = "par",hr = "px"},
  	  }
  		;
  		{
  			type = "Frame",			
  			autosize  = 1,
  			arrangetype = "horiz",
  			arrangedir = 1,	
  			Layout = {
  			  pivot_XY = { 1, 0 },					
			    pos_XY = { x = 1, y = 0, xr = "par", yr = "par" },
  			},
  			arrangeSep = { x = BUTTON_SPACING_HORIZ, y = 0, xr = "scr", yr = "scr" },	
  			;
  			NewMenuButton("m_btnAccept",	DTM004[15],	"",	0,	FX_GATEUI_BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1_Alert_Chipped",	 [[MainUI_ScarEvent("DTM4_GateConfirm()");UI_HideScreen("ConfirmStarGate");]]),
  			NewMenuButton("m_btnCancel",	DTM004[16],	"",	0,	FX_GATEUI_BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	[[MainUI_ScarEvent("DTM4_GateCancel()");UI_HideScreen("ConfirmStarGate");]]),							
  		},	
  	},	
	},
}

local frame_maplogo = ConfirmStarGate[1][1][1][1]
local iMap = 1
for index, value in g_MissionData do
	frame_maplogo[iMap] = createMapLogo(index)
	iMap = iMap + 1
end