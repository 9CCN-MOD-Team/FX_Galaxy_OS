dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

dofilepath("data:scripts/FX_TacticalReport_Defines.lua")
dofilepath("player:FX_TacticalReport_Summary.lua")

FX_TacticalReport_Names = {
  FX_TacticalReport_RU = {"$90300", "$90301"},
  FX_TacticalReport_GatheredRU = {"$90302", "$90303"},
  FX_TacticalReport_KillInRUs = {"$90304", "$90305"},
  FX_TacticalReport_ShipInRUs = {"$90306", "$90307"},
  FX_TacticalReport_FighterCount = {"$90308", "$90309"},
  FX_TacticalReport_CorvetteCount = {"$90310", "$90311"},
  FX_TacticalReport_FrigateCount = {"$90312", "$90313"},
  FX_TacticalReport_CapshipCount = {"$90314", "$90315"},
}

function getTab(reportName)
  local t = {
    type = "TabPage",
    name = "m_tab"..reportName,		
    text = FX_TacticalReport_Names[reportName][1],
    helpTip = FX_TacticalReport_Names[reportName][2], 

    visible = 1,
    Layout = {
    	pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
    	size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
    	pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
    	pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
    },

    ;
    { 
			type = "Frame", 
			name = "tga"..reportName,
			Layout=
			{
				pos_XY = { x = 0.05, y = 0.1, xr = "par", yr = "par" },		
				size_WH = {w = 0.75,h = 0.8,wr = "par",hr = "par"},
			}, 
			BackgroundGraphic = 
			{ 
				texture = "player:"..reportName..".tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		},
		{
				type = "TextLabel",
				name = "num"..reportName.."ymax",
				Layout=
  			{
  				pos_XY = { x = 0.05, y = 0.1, xr = "par", yr = "par" },		
  				pivot_XY = { 1,  0 },
  			}, 
				Text = {
					textStyle = "FEHeading4",
					text = floor(FX_TacticalReport_maxmin[reportName].max + 0.5),
				},
				autosize=1,
		}, 
    {
				type = "TextLabel",
				name = "num"..reportName.."ymin",
				Layout=
  			{
  				pos_XY = { x = 0.05, y = 0.9, xr = "par", yr = "par" },		
  				pivot_XY = { 1,  1 },
  			}, 
				Text = {
					textStyle = "FEHeading4",
					text = floor(FX_TacticalReport_maxmin[reportName].min + 0.5),
				},
				autosize=1,
		},
		{
				type = "TextLabel",
				name = "num"..reportName.."xmin",
				Layout=
  			{
  				pos_XY = { x = 0.05, y = 0.9, xr = "par", yr = "par" },		
  				pivot_XY = { 0,  0 },
  			}, 
				Text = {
					textStyle = "FEHeading4",
					text = "0",
				},
				autosize=1,
		},
  }
  for i = 1,10 do
    t[4 + i] = {
				type = "TextLabel",
				name = "num"..reportName.."x"..i,
				Layout=
  			{
  				pos_XY = { x = 0.05 + 0.75/10 * i, y = 0.9, xr = "par", yr = "par" },		
  				pivot_XY = { 0.5,  0 },
  			}, 
				Text = {
					textStyle = "FEHeading4",
					text = GameTime[i],
				},
				autosize=1,
		}
  end
  for i = 1,9 do
    t[14 + i] = {
				type = "TextLabel",
				name = "num"..reportName.."y"..i,
				Layout=
  			{
  				pos_XY = { x = 0.05, y = 0.1 + 0.8/10 * i, xr = "par", yr = "par" },		
  				pivot_XY = { 1,  0.5 },
  			}, 
				Text = {
					textStyle = "FEHeading4",
					text = floor(FX_TacticalReport_maxmin[reportName].min + (FX_TacticalReport_maxmin[reportName].max - FX_TacticalReport_maxmin[reportName].min)/10 * (10-i) + 0.5),
				},
				autosize=1,
		}
  end
  t[24] = {
		  type = "Frame",
		  autoarrange = 1,
		  visible = 1, 
			autosize=1,
			arrangetype = "vert",
			arrangeSep = {	x = 0, y = PANEL_SPACING_VERT, xr="scr", yr="scr",},
		  Layout=
			{
				pos_XY = { x = 0.81, y = 0.2, xr = "par", yr = "par" },	
				--size_WH = { w = 0.14, wr = "par" },
			}, 
		}
	for i = 1,PlayerNum do
	  t[24][i] = {
	    type = "Frame",
			visible = 1, 
			autosize=1,
			autoarrange = 1,
			arrangetype = "horiz",
			arrangeSep = {	x = PANEL_SPACING_VERT, y = 0, xr="scr", yr="scr",},
			;
			{
			  type = "Frame",
			  backgroundColor = FX_TacticalReport_LineColors_def[i],
			  autosize = 0,
			  Layout = {
    	    size_WH = { w = 30/1920, h = 30/1080, wr = "scr", hr = "scr" },
    	  },
			},
			{
			  type = "TextLabel",
			  Layout = {
    	    size_WH = { h = 30/1080, hr = "scr" },
    	  },
			  Text = {
					textStyle = "FEHeading4",
					text = PlayerName[i],
					vAlign = "Middle",
				},
			}
	  }
	end
	return t
end 

TacticalReport = 
{ 
	Layout = 
	{						
		pos_XY = {x=0, y=0, xr="scr", yr="scr",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	eventOpaque = 0,
	stylesheet = "HW2StyleSheet", 
	--RootElementSettings = { backgroundColor = { 0, 0, 0, 0, }, }, 
	pixelUVCoords = 1, 
	--previousScreen = "NewMainMenu",
	;
	------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		name="frmSCREENHEADER",
		TitleText = "$4550", -- 游戏统计数据 
		SubTitleText = "$90207", 
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
			TitleText = "$90207", 
			autosize=1,
			arrangetype = "vert",
			;
					
			-- Contents frame
			{
				type = "Frame",
				
				position = {4, 32},
				size = {750, 400},

				--backgroundColor = COLOR_GREEN_SOLID,
				;
			  -- TAB FRAMES
				{
					type = "TabControl",
					name = "m_TabControl",
					position = {0,0},
					backgroundColor = {0,0,0,0},
					TabButtonStyle = 	"OptionTabButtonStyle",
					UseTemplate = TEMPLATE_TABCONTROL,	-- TabControls must use a template

					Layout = {			
						size_WH = {	w = 1.0, h = 1, wr = "par", hr = "par" },	
					},
					--size = {612, 280},
					;
					getTab("FX_TacticalReport_RU"),
					getTab("FX_TacticalReport_GatheredRU"),
					getTab("FX_TacticalReport_KillInRUs"),
					getTab("FX_TacticalReport_ShipInRUs"),
					getTab("FX_TacticalReport_FighterCount"),
					getTab("FX_TacticalReport_CorvetteCount"),
					getTab("FX_TacticalReport_FrigateCount"),
					getTab("FX_TacticalReport_CapshipCount"),
			  }
			}
		},
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			name = "frmRootbottombigfrm2",					
			WindowTemplate = PANEL_NAVIGATIONFRAME,
			;			
      NewMenuButton("btnMainMenu",		"$2617",	"$4565",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	"UI_ShowScreen(\"NewMainMenu\", eTransition)"),	
      -- Actually the continue button.  Not Back...
      --NewMenuButton("btnBack",			"$5188",	"$4562",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	"UI_PreviousScreen(eTransition)"),	
		},		
	},
}
