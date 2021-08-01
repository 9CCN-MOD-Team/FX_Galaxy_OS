dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("data:scripts/LW_functions.lua")
------------------------------------------------------------------------------------
	----------Window Templates-----------
	PANEL_FX_WINDOWSTYLE = {
		type = "RmWindow",
		name = "RM_Panel_WindowStyle",		
		
		--visible = 0,
		
		Layout = {
			--pos_XY = {	x = 0, y = 0, xr = "par",	yr = "par"	},	
			--size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
			min_WH = { w = 64, 	h = 64,	wr = "abs_px",	hr = "abs_px" },					
		},

		backgroundColor = COLOR_BACKGROUND_SCREEN,
		BackgroundGraphic = BORDER_GRAPHIC_FRAME,	

		ContentAreaName = "Content",
		TitleTextName = "TitleText",

		arrangetype = "vert",
		;			
		----------Title Area-----------
		{
			type = "Frame",
			name = "TitleFrame",
			visible = 1,
			arrangetype = "horiz",
			arrangedir = 1,

			Layout = {				
				size_WH = {	w = 1, h = PANELTITLE_HEIGHT, wr = "par", hr = "scr" },	
				pad_LT = { l = PANELTEXT_MARGIN_WIDTH, t = 0, lr = "scr", tr = "px" },
				--pad_RB = { r = 12, b = 0, rr = "px", br = "px" },							
			},
			BackgroundGraphic = BORDER_GRAPHIC_BOTTOM,
			;
			{
				type = "TextLabel",
				name = "TitleText",

				Layout = {	
					pos_XY = { x=0, y = .5,  xr="px", yr = "par" },			
					pivot_XY = { 0,  .5 },	
				},
				autosize=1,							
				Text = {					
					UseTemplate = T_Text_TitleBar,
					text = "",
					font="FXmicrogrammadbolext10",
				},
			},
			{
				type = "Frame",
				name = "TitleFiligree",						
				BackgroundGraphic = TOP_GRAPHIC_FILIGREE_1,
				--backgroundColor = COLOR_BLUE_SOLID,				
				Layout = {
					size_WH = { w = 1, h = 1, wr = "px", hr = "par" },
				},

				arrangeweight = 1,
				;
			},
		},
		----------Content Area-----------
		{	
			type = "Frame",
			name = "Content",
			Layout = {	
				--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
				size_WH = {w = 1.0,	h = 1.0,wr = "par",	hr = "px"	},		
				pad_LT = { l =12, t = 12, lr = "px", tr = "px" },
				pad_RB = { r = 12, b = 12, rr = "px", br = "px" },		
			},	
			arrangeweight = 1,
			--backgroundColor = {128,0,0,255},
		;
		}

}
-------------------------------------------------------------------------------------
LAYOUT_FX_PINYINMENU_BUTTONS = 
{
	size_WH = {w = 10/1920,	h = 10/1080,wr = "scr",	hr = "scr"	},		
	pad_LT = { l =20/1920, t = 5/1080, lr = "scr", tr = "scr" },
	pad_RB = { r = 20/1920, b = 5/1080, rr = "scr", br = "scr" },		
}
-------------------------------------------------------------------------------------
function newInputButton(char)
	local commandline = ""
	if char == "\"" or char == "\\" then
		commandline = [[MainUI_ScarEvent("PinYin_functions.inputBtnClick(\"]]..[[\\\]]..char..[[\")")]]
	else
		commandline = [[MainUI_ScarEvent("PinYin_functions.inputBtnClick(\"]]..char..[[\")")]]
	end
	return NewMenuButton("btn"..char, char, nil, 0, LAYOUT_FX_PINYINMENU_BUTTONS, "FEButtonStyle1",	commandline)
end
-------------------------------------------------------------------------------------
PinYinIME = 
{
	--size = { 220, 114, 361, 276},
	stylesheet = "HW2StyleSheet",
	Layout = 
	{	
		pos_XY = { x=0.5, y = 0.5,  xr="scr", yr = "scr" },		
		size_WH = { w=1000/1920, h=950/1080, wr="scr", hr="scr"},	
		pivot_XY = { 0.5,  0.5 },	
	},
	autosize=1,
	RootElementSettings = { backgroundColor = { 0, 0, 0, 0, }, }, 
	soundOnShow = "SFX_ObjectiveMenuONOFF",
	soundOnHide = "SFX_ObjectiveMenuONOFF",
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	;
	{  
		type = "RmWindow",
		TitleText ="$90405",
		name = "MainIMEFrame",
		WindowTemplate = PANEL_FX_WINDOWSTYLE,
		Layout = 
		{	
			pos_XY = { x=0, y = 0,  xr="par", yr = "par" },		
			size_WH = { w=1, h=1, wr="par", hr="par"},	
		},
		autoarrange = 1,
		--arrangeSep = {	x=20/1920, y=500/1080, xr="scr", yr="scr",},
		;
		{
			type = "TextLabel",
			name = "DescriptionText",
			Layout = 
			{				
				pos_XY = { x = 0.5, y = 0, xr = "par", yr = "par" },		
				pivot_XY = { 0.5, 0 },						
				size_WH = { w = 0.9, h = TEXTINPUT_HEIGHT*1.2*3, wr = "par", hr = "scr" },
			},
			arrangeweight = 1,
			--borderColor = { 112, 157, 180, 255},
			borderWidth = 0,
			backgroundColor = {0,0,0,0},			
			wrapping = 1,				--自动换行
			Text = 
			{
				font = "ChatFont",
				color = { 255, 255, 255, 255},
				hAlign = "Left",
				vAlign = "Top",
			},
		},
		{
			type = "TextLabel",
			name = "TextInput",
			Layout = 
			{				
				pos_XY = { x = 0.5, y = nil, xr = "par", yr = nil },		
				pivot_XY = { 0.5, 0 },						
				size_WH = { w = 0.9, h = TEXTINPUT_HEIGHT*1.2*3, wr = "par", hr = "scr" },
			},
			arrangeweight = 1,
			borderColor = { 112, 157, 180, 255},
			borderWidth = 1,
			backgroundColor = {0,0,0,20},			
			wrapping = 1,				--自动换行
			Text = 
			{
				font = "ChatFont",
				color = { 255, 255, 255, 255},
				hAlign = "Left",
				vAlign = "Top",
			},
		},
		{
			type = "Frame",
			name = "charSelectFrame",
			borderColor = "FEColorOutline",
			borderWidth = 1,
			autosize = 1,
			--autoarrange = 1,
			--arrangeSep = {	x=20/1920, y=10/1080, xr="scr", yr="scr",},
			Layout = 
			{				
				pos_XY = { x = 0.5, xr = "par",  },		
				pivot_XY = { 0.5, 0 },						
				size_WH = { w = 0.9, h = 0.3, wr = "par", hr = "par" },
				--pad_LT = { l =20/1920, t = 20/1080, lr = "scr", tr = "scr" },
				--pad_RB = { r = 20/1920, b = 20/1080, rr = "scr", br = "scr" },	
			},
			;
			{
				type = "TextLabel",
				name = "charSelectLable",
				Layout = 
				{		
					pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},	
					pivot_XY = { 0.5, 0.5 },
					--pad_LT = { l =20/1920, t = 5/1080, lr = "scr", tr = "scr" },
					--pad_RB = { r = 20/1920, b = 5/1080, rr = "scr", br = "scr" },		
					size_WH = {	w = 0.9, h = 0.9, wr = "par", hr = "par"},
				},
							
				eventOpaque = 0,
				giveParentMouseInput = 1,
				wrapping = 1,				--自动换行
				autosize=0,
				Text = {
					textStyle = "FEHeading4",
					hAlign = "Left",
					vAlign = "Top",
				},
			}
		},
		{
			type = "Frame",
			name = "charButtonOutFrame",
			borderColor = "FEColorOutline",
			borderWidth = 1,
			autosize = 1,
			autoarrange = 1,
			arrangeSep = {	x=20/1920, y=10/1080, xr="scr", yr="scr",},
			Layout = 
			{				
				pos_XY = { x = 0.5, y = 0.95, xr = "par", yr = "par" },		
				pivot_XY = { 0.5, 1 },						
				--size_WH = { w = 0.9, h = 0.8, wr = "par", hr = "par" },
				pad_LT = { l =20/1920, t = 20/1080, lr = "scr", tr = "scr" },
				pad_RB = { r = -10/1920, b = 20/1080, rr = "scr", br = "scr" },	
			},
			;
			{
				type = "Frame",
				name = "charButtonFrame",
				--borderColor = "FEColorOutline",
				autosize = 1,
				--borderWidth = 1,
				autoarrange = 1,
				arrangearray = 12,
				arrangetype = "vert",
				arrangeSep = {	x=20/1920, y=10/1080, xr="scr", yr="scr",},
				Layout = 
				{				
					pos_XY = { x = 0, y = 0, xr = "par", yr = "par" },		
					pivot_XY = { 0, 0 },					
				},
				;
			},
			{
				type = "Frame",
				name = "charButtonLowerPartFrame",
				autosize = 1,
				autoarrange = 1,
				--arrangearray = 9,
				arrangetype = "horiz",
				arrangeSep = {	x=20/1920, y=0/1080, xr="scr", yr="scr",},
				Layout = 
				{		
					--size_WH = { w = 20/1920, h = 20/1080, wr = "scr", hr = "scr" },		
					pos_XY = { x = 0, y = 1, xr = "par", yr = "par" },		
					pivot_XY = { 0, 1 },					
				},
				;
				{
					type = "Button",
					ignored = 1,
					buttonStyle = "FEButtonStyle1",
					name = "CapsLk",
					onMouseClicked=[[MainUI_ScarEvent("PinYin_functions.CapsLkBtnClick()")]],
					autosize=1,
					;
					
					{
						type = "Frame",
						autosize=1,
						eventOpaque = 0,
						giveParentMouseInput = 1,
						Layout = {
							pivot_XY = {0.5, 0.5},
							pos_XY = { x=0.5, y=0.5, xr="par", yr="par" },
						},
						
						;
						{
							type = "TextLabel",
							
							--position = {20,0},
							Text = {
								--textStyle = "RM_GenericLabelLarge_TextStyle",
								text = "CapsLk",
								--color = COLOR_LABEL_TEXT_DEFAULT,
							},

							Layout = {		
								pos_XY = {	x=0.6, y=0.5, xr="par", yr="par",},	
								pivot_XY = { 0.5, 0.5 },
								pad_LT = { l =20/1920, t = 5/1080, lr = "scr", tr = "scr" },
								pad_RB = { r = 20/1920, b = 5/1080, rr = "scr", br = "scr" },		
								--size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},
							},
							
							eventOpaque = 0,
							giveParentMouseInput = 1,
							autosize=1,
						},
										
						{
							type = "Button",
							Layout = {		
									pos_XY = {	x=0.15, y=0.5, xr="par", yr="par",},	
									pivot_XY = { 0.0, 0.5 },	
									size_WH = {	w = 10, h = 0.75, wr = "px", hr = "par" },		
									lockAspect = -1,	
							},
							
							name = "CapsLkCheck",

							eventOpaque = 0,
							giveParentMouseInput = 1,
							enabled = 1,
							buttonStyle = "FECheckBoxButtonStyle",
						},
					},
				},
				NewMenuButton("btnSpace",	"$90401", nil,	0, LAYOUT_FX_PINYINMENU_BUTTONS, "FEButtonStyle1",	
				[[MainUI_ScarEvent("PinYin_functions.inputBtnClick(\" \")")]]),
				
				NewMenuButton("btnBackspace",	"$90402", nil, 0, LAYOUT_FX_PINYINMENU_BUTTONS, "FEButtonStyle1",	
				[[MainUI_ScarEvent("PinYin_functions.BackspaceBtnClick()")]]),
				
				NewMenuButton("btnEnter", "$90403", nil, 0, LAYOUT_FX_PINYINMENU_BUTTONS, "FEButtonStyle1",	
				[[MainUI_ScarEvent("PinYin_functions.EnterBtnClick()")]]),
				
				NewMenuButton("btnExit", "$90404", nil, 0, 
				{
					size_WH = { w = 10/1920, h = 10/1080, wr = "scr", hr = "scr" },		
					pad_LT = { l =20/1920, t = 5/1080, lr = "scr", tr = "scr" },
					pad_RB = { r = 20/1920, b = 5/1080, rr = "scr", br = "scr" },	
					pivot_XY = { 1, 0.5 },	
					pos_XY = { x=1, y=0.5, xr="par", yr="par",},	
				}
				, "FEButtonStyle1_Alert_Chipped",	
				[[MainUI_ScarEvent("PinYin_functions.PinYin_Exit()")]]),
			}
		}
	}
}

local charButtonFrame = findTableElement(PinYinIME,{
	{"name","MainIMEFrame"},
	{"name","charButtonOutFrame"},
	{"name","charButtonFrame"},
	})
	
local chars=
{
	"1","2","3","4","5","6","7","8","9","0","-","=",
	"!","@","#","%","^","&","*","(",")","+","/","\\",
	"Q","W","E","R","T","Y","U","I","O","P","[","]",
	"A","S","D","F","G","H","J","K","L","|","{","}",
	"Z","X","C","V","B","N","M",",",".",";","<",">",
	"_","'","\"",":","?","`","~",
}
for i=1,67 do
	charButtonFrame[i] = newInputButton(chars[i])
end

