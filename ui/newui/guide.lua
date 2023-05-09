dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

dofilepath("data:scripts/LW_functions.lua")

dofilepath("locale:guide/guidelist.lua")
local chapter_count = table.getn(FX_Guides)
local MAX_LINE_PER_CHAPTER = 500
local LINE_WIDTH = 70
Guide =
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
  	if not FX_Guides then
  		dofilepath("locale:guide/guidelist.lua")
	  end
	  
	  FX_GuideMaxIndex = ]]..chapter_count..[[
	  FX_Guide_MAX_LINE_PER_CHAPTER = ]]..MAX_LINE_PER_CHAPTER..[[
	  FX_Guide_LINE_WIDTH = ]]..LINE_WIDTH..[[
	  
	  function FX_GuideUpdate()
      for i = 1, FX_GuideMaxIndex do
        UI_SetButtonPressed("Guide", "GuideIndex"..i, 0)
      end 
      
      local textlines = LW_SplitStrToLines(FX_Guides[FX_GuideCurrentIndex].text, FX_Guide_LINE_WIDTH)
      for line = 1, getn(textlines) do
      	UI_SetElementVisible("Guide", "Guidetext_line"..line, 1)
      	UI_SetTextLabelText("Guide", "Guidetext_line"..line, textlines[line])
      end
      for line = getn(textlines) + 1, FX_Guide_MAX_LINE_PER_CHAPTER do
      	UI_SetElementVisible("Guide", "Guidetext_line"..line, 0)
      	UI_SetTextLabelText("Guide", "Guidetext_line"..line, "")
      end
			UI_SetTextLabelText("Guide", "GuideTitle", "<b>"..FX_Guides[FX_GuideCurrentIndex].title.."</b>")

      UI_SetButtonPressed("Guide", "GuideIndex"..FX_GuideCurrentIndex, 1)   
    end
    
    function FX_GuideToPage(iPage)
      FX_GuideCurrentIndex = iPage
      UI_ReloadCurrentScreen() -- use reload instead of FX_GuideUpdate() to force the game to re-calculate scorllbar length
    end
    function FX_GuideNext()
      FX_GuideCurrentIndex = mod(FX_GuideCurrentIndex, FX_GuideMaxIndex) + 1
      UI_ReloadCurrentScreen() -- use reload instead of FX_GuideUpdate() to force the game to re-calculate scorllbar length
    end
    function FX_GuidePrev()
      FX_GuideCurrentIndex = mod(FX_GuideCurrentIndex + FX_GuideMaxIndex - 2, FX_GuideMaxIndex) + 1
      UI_ReloadCurrentScreen() -- use reload instead of FX_GuideUpdate() to force the game to re-calculate scorllbar length
    end
	]],
  onShow = [[
    for i = 1, FX_GuideMaxIndex do
      UI_SetTextLabelText("Guide", "txtIndexNum"..i, FX_Guides[i].title)
    end
    FX_GuideCurrentIndex = FX_GuideCurrentIndex or 1
    FX_GuideUpdate()
	 ]],
  ;
  ------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		name="frmSCREENHEADER",
		TitleText = "", -- ��������
		SubTitleText = "", -- ��������
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
			TitleText = "$90142", -- ������·��
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
            --��������GuideShowIndex()�������
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
			    		name = "GuideTitleBox",
			    		visible = 1,
			    		ignored = 1,
			    		autosize = 1,
			    		resizeToListBox = 1,
							arrangetype = "vert",
							arrangeSep = {	x=0, y=0, xr="scr", yr="scr",}
							;
							{
								type = "TextLabel",
								wrapping = 0,				--�Զ�����
								autosize = 1,
								Text = {
									textStyle = "FEHeading4",
									hAlign = "Left",
									vAlign = "Middle",
									text = " ", -- an empty line
								},
							},
							{
								name = "GuideTitle",
								type = "TextLabel",
								wrapping = 0,				--�Զ�����
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
								wrapping = 0,				--�Զ�����
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
			    		name = "GuideContent",
			    		visible = 1,
			    		ignored = 1,
			    		autosize = 1,
			    		resizeToListBox = 1,
							arrangetype = "vert",
							arrangeSep = {	x=0, y=0, xr="scr", yr="scr",}
							;
							--��������GuideShowContents()�������
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
			NewMenuButton("btnPrevious","$90094","$90096",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined", [[FX_GuidePrev()]]),		
			NewMenuButton("btnNext","$90095","$90097",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined", [[FX_GuideNext()]]),			
      NewMenuButton("btnback","$2610","$3468",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped", [[UI_ToggleScreen('Guide', 0);UI_SetButtonPressed('NewTaskbar', 'btnGuide', 0)]]),		
		},
  }
}

function GuideShowContents()
  local GuideContent = findTableElement(Guide, {
    {"name", "frmRootbottombigfrm"},
    {"name", "WindowFrame"},
    {"name", "Mainframe"},
    {"name", "Contentsframe"},
    {"name", "ContentList"},
    {"name", "GuideContent"}
  })
  for line = 1, %MAX_LINE_PER_CHAPTER do
		GuideContent[line] = {
			name = "Guidetext_line"..line,
			type = "TextLabel",
			wrapping = 0,				--�Զ�����
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

function GuideShowIndex()
  local Indexframe = findTableElement(Guide, {
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
  		name = "GuideIndex"..i,
  		visible = 1,
  		ignored = 1,
  		autosize = 1,
  		resizeToListBox = 1,
  		overColor = {255,255,255,128},
  		pressedColor = {255,255,255,96},
  		backgroundColor = {255,255,255,0},
  		onMouseClicked = [[
  			local iPage = ]]..i..[[;																				
  			FX_GuideToPage(iPage)
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

GuideShowIndex()
GuideShowContents()