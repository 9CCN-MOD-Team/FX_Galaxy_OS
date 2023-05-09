dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

dofilepath("data:scripts/LW_functions.lua")

dofilepath("locale:story/storylist.lua")
local chapter_count = table.getn(FX_Stories)
local MAX_LINE_PER_CHAPTER = 500
local LINE_WIDTH = 70
Story =
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
	onLoad = [[
		if not LW_SplitStrToLines then
			dofilepath("data:scripts/LW_SplitStrToLines.lua")
		end
		if not FxgUILocale then
  		dofilepath("locale:fxgui.lua")
  	end
  	if not FX_Stories then
  		dofilepath("locale:story/storylist.lua")
	  end
	  
	  FX_StoryMaxIndex = ]]..chapter_count..[[
	  FX_Story_MAX_LINE_PER_CHAPTER = ]]..MAX_LINE_PER_CHAPTER..[[
	  FX_Story_LINE_WIDTH = ]]..LINE_WIDTH..[[
	  
	  function FX_StoryUpdate()
      for i = 1, FX_StoryMaxIndex do
        UI_SetButtonPressed("Story", "StoryIndex"..i, 0)
      end 
      
      local textlines = LW_SplitStrToLines(FX_Stories[FX_StoryCurrentIndex].text, FX_Story_LINE_WIDTH)
      for line = 1, getn(textlines) do
      	UI_SetElementVisible("Story", "storytext_line"..line, 1)
      	UI_SetTextLabelText("Story", "storytext_line"..line, textlines[line])
      end
      for line = getn(textlines) + 1, FX_Story_MAX_LINE_PER_CHAPTER do
      	UI_SetElementVisible("Story", "storytext_line"..line, 0)
      	UI_SetTextLabelText("Story", "storytext_line"..line, "")
      end
			UI_SetTextLabelText("Story", "StoryTitle", "<b>"..FX_Stories[FX_StoryCurrentIndex].title.."</b>")

      UI_SetButtonPressed("Story", "StoryIndex"..FX_StoryCurrentIndex, 1)   
    end
    
    function FX_StoryToPage(iPage)
      FX_StoryCurrentIndex = iPage
      UI_ReloadCurrentScreen() -- use reload instead of FX_StoryUpdate() to force the game to re-calculate scorllbar length
    end
    function FX_StoryNext()
      FX_StoryCurrentIndex = mod(FX_StoryCurrentIndex, FX_StoryMaxIndex) + 1
      UI_ReloadCurrentScreen() -- use reload instead of FX_StoryUpdate() to force the game to re-calculate scorllbar length
    end
    function FX_StoryPrev()
      FX_StoryCurrentIndex = mod(FX_StoryCurrentIndex + FX_StoryMaxIndex - 2, FX_StoryMaxIndex) + 1
      UI_ReloadCurrentScreen() -- use reload instead of FX_StoryUpdate() to force the game to re-calculate scorllbar length
    end
	]],
  onShow = [[
    for i = 1, FX_StoryMaxIndex do
      UI_SetTextLabelText("Story", "txtIndexNum"..i, format(FxgUILocale.StoryChapter, i))
    end
    FX_StoryCurrentIndex = FX_StoryCurrentIndex or 1
    FX_StoryUpdate()
	 ]],
  ;
  ------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		name="frmSCREENHEADER",
		TitleText = "$2291", -- 文献阅览
		SubTitleText = "$90092", -- 背景故事
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
			TitleText = "$90093", -- 银河歧路星
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
            --在这里由StoryShowIndex()添加内容
          },
			  },
				{
  				type = "Frame",
  				name = "Contentsframe",
  				Layout = 
  				{
  					pivot_XY = { 1, 0 },					
  					pos_XY = {	x=0.99, y=0, xr="par", yr="par",},	
  					size_WH = {	w = 0.89, h = 1, wr = "par", hr = "par" },				
  				}
  				;
  				{
			      type = "ListBox",
			      listBoxStyle = "FEListBoxStyle_Bordered",
			      name = "ContentList",
			      Layout =
			      {
			      	pivot_XY = { 1, 0 },			
			        pos_XY = { x = 1, y = 0.0, xr = "par", yr = "par" },
			        size_WH = { w = 0.95, h = 1, wr = "par", hr = "par" },
			      },
			      scrollBarPageSize = 200
			      ;
			      { 
			    		type = "ListBoxItem",
			    		name = "StoryTitleBox",
			    		visible = 1,
			    		ignored = 1,
			    		autosize = 1,
			    		resizeToListBox = 1,
							arrangetype = "vert",
							arrangeSep = {	x=0, y=0, xr="scr", yr="scr",}
							;
							{
								type = "TextLabel",
								wrapping = 0,				--自动换行
								autosize = 1,
								Text = {
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Middle",
									text = " ", -- an empty line
								},
							},
							{
								name = "StoryTitle",
								type = "TextLabel",
								wrapping = 0,				--自动换行
								autosize = 1,
								Text = {
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Middle",
									text = "Loading...",
									pixels = (120),
								},
							},
							{
								type = "TextLabel",
								wrapping = 0,				--自动换行
								autosize = 1,
								Text = {
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Middle",
									text = " ", -- an empty line
								},
							}
			      },
			      { 
			    		type = "ListBoxItem",
			    		name = "StoryContent",
			    		visible = 1,
			    		ignored = 1,
			    		autosize = 1,
			    		resizeToListBox = 1,
							arrangetype = "vert",
							arrangeSep = {	x=0, y=0, xr="scr", yr="scr",}
							;
							--在这里由StoryShowContents()添加内容
			      }
			    }
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
			NewMenuButton("btnPrevious","$90094","$90096",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined", [[FX_StoryPrev()]]),		
			NewMenuButton("btnNext","$90095","$90097",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined", [[FX_StoryNext()]]),			
      NewMenuButton("btnback","$2610","$3468",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped", [[UI_PreviousScreen(eTransition)]]),		
		},
  }
}

function StoryShowContents()
  local StoryContent = findTableElement(Story, {
    {"name", "frmRootbottombigfrm"},
    {"name", "WindowFrame"},
    {"name", "Mainframe"},
    {"name", "Contentsframe"},
    {"name", "ContentList"},
    {"name", "StoryContent"}
  })
  for line = 1, %MAX_LINE_PER_CHAPTER do
		StoryContent[line] = {
			name = "storytext_line"..line,
			type = "TextLabel",
			wrapping = 0,				--自动换行
			autosize = 1,
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
				text = " ",
				pixels = (60),
			},
		}
	end
end

function StoryShowIndex()
  local Indexframe = findTableElement(Story, {
    {"name", "frmRootbottombigfrm"},
    {"name", "WindowFrame"},
    {"name", "Mainframe"},
    {"name", "Indexframe"},
    {"name", "IndexList"}
  })
  
  local chapter_count = %chapter_count
  
  for i = 1, chapter_count do
    Indexframe[i] = 
    { 
  		type = "ListBoxItem",
  		soundOnClicked = "SFX_ButtonClick",
  		soundOnEnter = "SFX_ButtonEnter",
  		name = "StoryIndex"..i,
  		visible = 1,
  		ignored = 1,
  		autosize = 1,
  		resizeToListBox = 1,
  		overColor = {255,255,255,128},
  		pressedColor = {255,255,255,96},
  		backgroundColor = {255,255,255,0},
  		onMouseClicked = [[
  			local iPage = ]]..i..[[;																				
  			FX_StoryToPage(iPage)
  		]],
  		Layout=
  		{
  			--size_WH = {h = 1/8,hr = "scr"},
  			pad_LT = { l = 8, t = 4, lr = "px", tr = "px" },
		    pad_RB = { r = 8, b = 4, rr = "px", br = "px" },
  		},
  		;	
      {
        type = "TextLabel",
        --Layout = 
      	--{				
      	--  pivot_XY = { 1, 1 },					
      	--	pos_XY = {	x = 0.99, y = 0.98, xr="par", yr="par",},				
      	--},
      	autosize = 1,
        name = "txtIndexNum"..i,
        --textColor = {255,215,0,255},
        Text = {
          textStyle = "FEHelpTipTextStyle",
          --hAlign = "Left",
          --text = "Chapter "..i,
        },
      }
		} 
  end
end

StoryShowIndex()
StoryShowContents()