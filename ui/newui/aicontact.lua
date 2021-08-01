dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("data:ui/subtitleaddon.lua")
dofilepath("locale:ai/ailist.lua")

function CreateAICharacterBGFrame()
	local frame=
	{
			type = "Frame",
			borderColor = "FEColorOutline",
			name="AIBG",
	        visible = 0,
			Layout=
		  	{
				min_WH = {w = 0.6,h = 0.8,wr = "par",hr = "par"},	
				pivot_XY = { 0, 0 },					
		  		pos_XY = { x = 0.4, y = 0, xr = "par", yr = "par" },		
				--size_WH = { w = 0.4, h = 0.4, wr = "par", hr = "par" },
		  	}, 
	}
	local index=1
	for ai,imgdata in AI_IMGs do
		for i,img in imgdata do
			frame[index]=
	        {
	          type = "Frame",
	          Layout = 
	      		{				
	      		  pivot_XY = { 0.5, 0.5 },					
	      		  pos_XY = {	x = 0.5, y = 0.5, xr="par", yr="par",},		
	      			size_WH = {	w = img.size, wr = "par"},
	      			lockAspect = -img.aspect,	
	      		},
	          name = ai.."_IMG_"..i,
	          BackgroundGraphic = {
	            type = "Graphic",
	            textureUV = img.uv,
	            texture = img.file
	          },
	          visible = 0,
	        }
			index=index+1
	    end
	end
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
				size_WH = {w = 0.5,h = 100,wr = "par",hr = "px"},
				--lockAspect = 1,	
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
local Player=
	{
		type = "ListBoxItem",
		soundOnClicked = "SFX_ButtonClick",
		soundOnEnter = "SFX_ButtonEnter",
		name="AIPlayer"..Index,
		Layout = {	
			--pivot_XY = { 0.5, 0 },					
			--pos_XY = {	x=0.2, y=0, xr="par", yr="par",},		
			size_WH = {w = 1,wr = "par",},
		},	
		onMouseClicked = [[MainUI_ScarEvent("FX_ContectWithPlayer(]]..Index..[[)")]],
		ignored = 1,
		autosize = 1,
		resizeToListBox = 1,
		arrangetype = "horiz",
		overColor = {255,255,255,32},
		pressedColor = {255,255,255,16},
		backgroundColor = {255,255,255,0},
	}
local iFrame=
		{
			type = "Frame",
			Layout=
			{	
				pos_XY = { x = 0.5, y = 0, xr = "par", yr = "par" },	
				size_WH = { w = 0.5, h = 1, wr = "par", hr = "par" },
			},
			arrangetype = "vert",
			;
			{
				type = "TextLabel",
				name = "AIName"..Index,
				wrapping = 1, 
				giveParentMouseInput = 1,
				Layout=
				{	
					pos_XY = { x = 0, y = 0, xr = "par", yr = "par" },	
					size_WH = { w = 1, h = 0.5, wr = "par", hr = "par" },
				},
				Text = 
				{
					textStyle = "FEHeading4",
					vAlign = "Center", 
					hAlign = "Middle", 
				},
			}, 
			{
				type = "TextLabel",
				name = "AIRelation"..Index,
				wrapping = 1, 
				giveParentMouseInput = 1,
				Layout=
				{	
					pos_XY = { x = 0, y = 0.5, xr = "par", yr = "par" },	
					size_WH = { w = 1, h = 0.5, wr = "par", hr = "par" },
				},
				Text = 
				{
					textStyle = "FEHeading4",
					vAlign = "Center", 
					hAlign = "Middle", 
				},
			}, 
		}
	local index=1
	while SpeechActor[index]~=nil do
		Player[index]=addTheme3(Index,index, SpeechActor[index])
		index=index+1
	end
	Player[index]=iFrame
return Player
end

LAYOUT_AI_MENU_BUTTONS = 
{
	min_WH = {w = 1,h = 0.04,wr = "par",hr = "par"},	
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
	--RootElementSettings = { backgroundColor = { 0, 0, 0, 0, }, }, 
	pixelUVCoords = 1, 
	--previousScreen = "NewMainMenu",
	;
	{
		type = "Frame",
		Layout = 
		{
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},		
			size_WH = { w = 1000/1920, h = 800/1080, wr = "scr", hr = "scr" },
		},
		eventOpaque = 0,
		;	
		{
			type = "ListBox",
			listBoxStyle = "FEListBoxStyle_Bordered",
			Layout = 
			{
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
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
		CreateAICharacterBGFrame(),
		{
			type = "TextLabel",
			name = "AIDialogue",
			wrapping = 1, 
			eventOpaque = 0,
			Layout=
		  	{
				pivot_XY = { 0, 0 },					
		  		pos_XY = { x = 0.45, y = 0.05, xr = "par", yr = "par" },		
				size_WH = { w = 0.5, h = 0.4, wr = "par", hr = "par" },
		  	}, 
			Text = 
			{
				textStyle = "FEHeading4",
				vAlign = "Left", 
				hAlign = "Top", 
			},
		}, 
		{
			type = "Frame",
			borderColor = "FEColorOutline",
			Layout=
		  	{
				pivot_XY = { 0, 1 },					
		  		pos_XY = { x = 0.4, y = 1, xr = "par", yr = "par" },		
				size_WH = { w = 0.6, wr = "par" },
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
			NewMenuButton("CloseAIContact",	"", nil,	0, LAYOUT_AI_MENU_BUTTONS, "FEButtonStyle1_Alert_Chipped",	[[MainUI_ScarEvent("FX_AICloseContact()")]]),
		},
	},
}

