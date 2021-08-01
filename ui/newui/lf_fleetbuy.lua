dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("locale:leveldata/campaign/fx_spfleet/ui_header.lua") 

DIALOGWIDTH = 600
--254






FXLF_FleetMenu = {

	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	
		Regions = 
	{
		{600/800,400/600,50/800,10/600,},
	},

	pixelUVCoords = 1, 
	
	RootElementSettings = {
		backgroundColor = COLOR_FULLSCREEN_DARKEN,
	},

	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);",
	onHide = "MainUI_PopEnabledCommandState()",	;
		


----------------------- Master Frame --------------------
	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText =	"$100509",
		 SubtitleText = "$100510", 	
	
			
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},				
	--		size_WH = {w = 0.6, h = 0.4, wr = "scr", hr = "scr",},

		},	
		
		autosize  = 1,

		--arrangetype = "vert",
		--arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},
		;
			
			
----------------------- Title Text Row -----------------------			
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
			-- Message Label
			{
					type = "TextLabel",					
					autosize = 1,
					wrapping = 1,

					name = "m_NCCNFleet",
					Text = {
						textStyle = "RM_MessageLabel_TextStyle",
						vAlign = "Top",
						hAlign = "Center",
					},

					Layout = {
						margin_RB = { r = 1, b =PANEL_PAD_VERT, rr = "px", br = "scr" },			

						size_WH = {w = 0.5, h = 0.5,wr = "scr", hr = "scr",},
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
				autoarrange = 1,
				autoarrangeSpace = 0,
				arrangetype = "vert",	
		    arrangeSep = {	x=5/800, y= 3/600, xr="scr", yr="scr"},
				clipchildren=0,
				Layout = {				
					--size_WH = {w = 0.8, h = 0.8, wr = "scr", hr = "scr",},
				},
				;
				
				{
					type = "Frame",			

					autosize  = 1,
					autoarrange = 1,
					autoarrangeSpace = 0,
					arrangetype = "horiz",	
		      arrangeSep = {	x=5/800, y= 6/600, xr="scr", yr="scr"},
		      ;
		

	      -- 	hAlign = "Middle",
	      -- 	vAlign = "Middle", 
          NewMenuButton("m_btnFighter","$100511","$100512",	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1",[[ ]]),
          NewMenuButton("m_btn1",	buttonName[1],	buttonDescribe[1],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn1",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn2",	buttonName[2],	buttonDescribe[2],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn2",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn3",	buttonName[3],	buttonDescribe[3],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn3",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          																							
		   	},
		   	
		   	{
					type = "Frame",			

					autosize  = 1,
					autoarrange = 1,
					autoarrangeSpace = 0,
					arrangetype = "horiz",	
		      arrangeSep = {	x=5/800, y= 6/600, xr="scr", yr="scr"},
		      ;
		

	      -- 	hAlign = "Middle",
	      -- 	vAlign = "Middle", 
          NewMenuButton("m_btnFri","$100513","$100514",	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1",[[  ]]),
          NewMenuButton("m_btn4",	buttonName[4],	buttonDescribe[4],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn4",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn5",	buttonName[5],	buttonDescribe[5],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn5",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn6",	buttonName[6],	buttonDescribe[6],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn6",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),

          																							
		   	},
		   	
		   	{
					type = "Frame",			

					autosize  = 1,
					autoarrange = 1,
					autoarrangeSpace = 0,
					arrangetype = "horiz",	
		      arrangeSep = {	x=5/800, y= 6/600, xr="scr", yr="scr"},
		      ;
		

	      -- 	hAlign = "Middle",
	      -- 	vAlign = "Middle", 
          NewMenuButton("m_btnCap","$100515","$100516",	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1",[[  ]]),
          NewMenuButton("m_btn7",	buttonName[7],	buttonDescribe[7],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn7",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn8",	buttonName[8],	buttonDescribe[8],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn8",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn9",	buttonName[9],	buttonDescribe[9],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn9",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn10",	buttonName[10],	buttonDescribe[10],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn10",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),

          																							
		   	},
		   	
			   	{
					type = "Frame",			

					autosize  = 1,
					autoarrange = 1,
					autoarrangeSpace = 0,
					arrangetype = "horiz",	
		      arrangeSep = {	x=5/800, y= 6/600, xr="scr", yr="scr"},
		      ;
		

	      -- 	hAlign = "Middle",
	      -- 	vAlign = "Middle", 
          NewMenuButton("m_btnCap","$100517","$100518",	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1",[[  ]]),
	
	        NewMenuButton("m_btn11",	buttonName[11],	buttonDescribe[11],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn11",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn12",	buttonName[12],	buttonDescribe[12],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn12",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn13",	buttonName[13],	buttonDescribe[13],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn13",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn14",	buttonName[14],	buttonDescribe[14],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn14",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),

          																							
		   	},
		   	
		  	   	
	
	

		   			   	
		   	{
					type = "Frame",			

					autosize  = 1,
					autoarrange = 1,
					autoarrangeSpace = 0,
					arrangetype = "horiz",	
		      arrangeSep = {	x=5/800, y= 6/600, xr="scr", yr="scr"},
		      ;
		

	      -- 	hAlign = "Middle",
	      -- 	vAlign = "Middle", 
          NewMenuButton("m_btnUtil","$100519","$100520",	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1",[[  ]]),
          NewMenuButton("m_btn15",	buttonName[15],	buttonDescribe[15],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn15",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn16",	buttonName[16],	buttonDescribe[16],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn16",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),
          NewMenuButton("m_btn17",	buttonName[17],	buttonDescribe[17],	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1_Alert_Chipped",[[UI_SetElementVisible("FXLF_FleetMenu","m_btn17",0)	--UI_HideScreen("FXLF_FleetMenu")   ]]),

          																							
		   	},
		   	
		   	
		   	
		   	
		   	
			},
			
			
				{
					type = "Frame",			

					autosize  = 1,
					autoarrange = 1,
					autoarrangeSpace = 0,
		
					arrangetype = "horiz",
					--arrangedir = 1,	

					Layout = {
						pivot_XY = { 0, 0},					
						pos_XY = {	x=0.9, y=0.0, xr="par", yr="px",},					

					},
					arrangeSep = {	x=0, y= 2/540, xr="scr", yr="scr",},;

					NewMenuButton("m_btnAccept",	"$100521",	"$100522",	0,BTN_FOOTER_SMALL_LAYOUT,"FEButtonStyle1",[[
														UI_HideScreen("FXLF_FleetMenu")   ]]),
													
														
		   	},
				
					
							

		},
	},
	CreateFrame("Yes"),
	CreateFrame("No"),
}

	