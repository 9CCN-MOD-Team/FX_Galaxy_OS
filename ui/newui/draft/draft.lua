dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

dofilepath("data:scripts/LW_functions.lua")
dofilepath("data:ui/newui/draft/draftlist.lua")

local draft_count = table.getn(FX_Drafts)

Draft =
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
              FX_DraftCurrentIndex = 1
              FX_DraftMaxIndex = ]]..draft_count..[[
              FX_DraftAutoPlay = nil
              FX_DraftAutoPlayCounter = 0
              FX_DraftAutoPlayCounterMax = 500
              
              function FX_DraftUpdate()
                for i = 1,FX_DraftMaxIndex do
                  UI_SetButtonPressed("Draft", "DraftIndex"..i, 0)
                  UI_SetElementVisible("Draft", "ImgFrm_"..i, 0)
                end 
                UI_SetButtonPressed("Draft", "DraftIndex"..FX_DraftCurrentIndex, 1)
                UI_SetElementVisible("Draft", "ImgFrm_"..FX_DraftCurrentIndex, 1)
                if FX_DraftAutoPlay then
                  UI_SetTextLabelText("Draft", "txtPageNum", format(">> %3d/%3d", FX_DraftCurrentIndex, FX_DraftMaxIndex))
                else
                  UI_SetTextLabelText("Draft","txtPageNum", format("%3d/%3d", FX_DraftCurrentIndex, FX_DraftMaxIndex))
                end
              end
              function FX_DraftToPage(iPage)
                FX_DraftCurrentIndex = iPage
                FX_DraftUpdate()
              end
              function FX_DraftNext()
                FX_DraftCurrentIndex = mod(FX_DraftCurrentIndex, FX_DraftMaxIndex) + 1
                FX_DraftUpdate()
              end
              function FX_DraftPrev()
                FX_DraftCurrentIndex = mod(FX_DraftCurrentIndex + FX_DraftMaxIndex - 2, FX_DraftMaxIndex) + 1
                FX_DraftUpdate()
              end
              function FX_DraftToggleAutoPlay()
                FX_DraftAutoPlay = (not FX_DraftAutoPlay)
                if FX_DraftAutoPlay then 
                  UI_FlashButton("Draft", "btnAuto", -1)
                else 
                  UI_StopFlashButton("Draft", "btnAuto")
                end
                FX_DraftUpdate()
              end
              
              UI_StopFlashButton("Draft", "btnAuto")
              FX_DraftUpdate()
           ]],
  onUpdate = [[
                if FX_DraftAutoPlay then 
                  FX_DraftAutoPlayCounter = FX_DraftAutoPlayCounter + 1
                  if FX_DraftAutoPlayCounter >= FX_DraftAutoPlayCounterMax then 
                    FX_DraftAutoPlayCounter = 0
                    FX_DraftNext()
                  end
                end
             ]],
  ;
  ------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		name="frmSCREENHEADER",
		TitleText = "$90090", -- 原画
		SubTitleText = "$2392", -- 原画赏析
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
			name = "WindowFrame",
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText = "$2392", -- 原画赏析
			autosize=1,
			arrangetype = "vert",
			;	
			-- Contents frame
			{
				type = "Frame",
				name = "Mainframe",
				Layout = 
				{
					pivot_XY = { 0.5, 0.5 },					
					pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},	
					size_WH = {	w = 1600/1920, h = 810/1080, wr = "scr", hr = "scr" },				
				}
				;
				{
  				type = "Frame",
  				name = "Indexframe",
  				Layout = 
  				{
  					pivot_XY = { 0, 0 },					
  					pos_XY = {	x=0, y=0, xr="par", yr="par",},	
  					size_WH = {	w = 0.1, h = 1, wr = "par", hr = "par" },				
  				}
  				;
          {
            type = "ListBox",
            listBoxStyle = "FEListBoxStyle_Bordered",
            name = "IndexList",
            Layout =
            {
              pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
              size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
            },
            scrollBarPageSize = 200,
            ;
            --在这里由DraftShowIndex()添加内容
          },
			  },
				{
  				type = "Frame",
  				name = "Contentsframe",
  				Layout = 
  				{
  					pivot_XY = { 1, 0 },					
  					pos_XY = {	x=1, y=0, xr="par", yr="par",},	
  					size_WH = {	w = 0.9, h = 1, wr = "par", hr = "par" },				
  				}
  				--在这里由DraftShowContents()添加内容
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
			NewMenuButton("btnPrevious","$2731","$2394",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined", [[FX_DraftPrev()]]),		
			NewMenuButton("btnNext","$2730","$2396",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined", [[FX_DraftNext()]]),		
      NewMenuButton("btnAuto","$2397","$90091",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined", [[FX_DraftToggleAutoPlay()]]),		
      NewMenuButton("btnback","$2610","$3468",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped", [[UI_PreviousScreen(eTransition)]]),		
		},
  }
}

function DraftShowContents()
  local Contentsframe = findTableElement(Draft, {
    {"name", "frmRootbottombigfrm"},
    {"name", "WindowFrame"},
    {"name", "Mainframe"},
    {"name", "Contentsframe"}
  })

  local draft_count = %draft_count
  
  for i = 1, draft_count do
    Contentsframe[i] = 
    {
      type = "Frame",
      Layout = 
  		{				
  		  pivot_XY = { 0.5, 0.5 },					
  		  pos_XY = {	x = 0.5, y = 0.5, xr="par", yr="par",},		
  			size_WH = {	w = FX_Drafts[i].size, h = FX_Drafts[i].size, wr = "par", hr = "par" },
  			lockAspect = FX_Drafts[i].aspect				
  		},
      name = "ImgFrm_"..i,
      BackgroundGraphic = {
        type = "Graphic",
        textureUV = FX_Drafts[i].uv,
        texture = FX_Drafts[i].file
      },
      visible = 1,
    }
  end
  Contentsframe[draft_count + 1] =
  {
    type = "TextLabel",
    Layout = 
  	{				
  	  pivot_XY = { 1, 1 },					
  		pos_XY = {	x = 0.95, y = 0.975, xr="par", yr="par",},				
  	},
  	autosize = 1,
    name = "txtPageNum",
    textColor = {255,100,0,255},
    Text = {
      textStyle = "FEHelpTipTextStyle",
      hAlign = "Right",
    },
  }
end

function DraftShowIndex()
  local Indexframe = findTableElement(Draft, {
    {"name", "frmRootbottombigfrm"},
    {"name", "WindowFrame"},
    {"name", "Mainframe"},
    {"name", "Indexframe"},
    {"name", "IndexList"}
  })
  
  local draft_count = %draft_count
  
  for i = 1, draft_count do
    Indexframe[i] = 
    { 
  		type = "ListBoxItem",
  		soundOnClicked = "SFX_ButtonClick",
  		soundOnEnter = "SFX_ButtonEnter",
  		name = "DraftIndex"..i,
  		visible = 1,
  		ignored = 1,
  		autosize = 1,
  		resizeToListBox = 1,
  		overColor = {255,255,255,128},
  		pressedColor = {255,255,255,96},
  		backgroundColor = {255,255,255,0},
  		onMouseClicked = [[
  			local iPage = ]]..i..[[;																				
  			FX_DraftToPage(iPage)
  		]],
  		Layout=
  		{
  			size_WH = {h = 1/16,hr = "scr"},
  		},
  		;	
  		{
        type = "Frame",
        Layout = 
    		{				
    		  pivot_XY = { 0.5, 0.5 },					
    		  pos_XY = {	x = 0.5, y = 0.5, xr="par", yr="par",},		
    			size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },
    			lockAspect = FX_Drafts[i].aspect				
    		},
        name = "ImgIndex_"..i,
        BackgroundGraphic = {
          type = "Graphic",
          textureUV = FX_Drafts[i].uv,
          texture = FX_Drafts[i].file
        },
        visible = 1,
      },
      {
        type = "TextLabel",
        Layout = 
      	{				
      	  pivot_XY = { 1, 1 },					
      		pos_XY = {	x = 0.99, y = 0.98, xr="par", yr="par",},				
      	},
      	autosize = 1,
        name = "txtIndexNum"..i,
        textColor = {255,100,0,255},
        Text = {
          textStyle = "FEHelpTipTextStyle",
          hAlign = "Right",
          text = i,
        },
      }
		} 
  end
end

DraftShowIndex()
DraftShowContents()