dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("player:PLAYERCFG.lua")
MusicPlayerVersion = "HOMEWORLD REMASTERED MUSICPLAYER V1.02"

UI_Color = PlayerSetup.teamcolour
UI_Color[4]=255

TitleColor = {255,255,255,255,}
PreviousButtonColor = UI_Color
StopButtonColor = UI_Color
PlayButtonColor = UI_Color
NextButtonColor = UI_Color
MusicIndexColor = {255,255,255,255,}
SymbolColor={255,255,255,255,}
MusicNameColor = {255,255,255,255,}
ProgressFrameColor = UI_Color
ProgressColor = UI_Color
CursorColor = UI_Color
MusicListButtonColor = UI_Color
RepeatTrackButtonColor = UI_Color
RepeatSingleButtonColor = UI_Color
RandomPlayButtonColor = UI_Color
TimeDisplayColor = {255,255,255,255,}

function CreateBlindFrame(iName)
	local CMGF = 
				{
					type = "Frame",
					name = iName,
					Layout = 
					{
						pos_XY = {x = 0, y = 0, xr="scr", yr="scr",},					
						size_WH = {w = 0, h = 0, wr = "scr", hr = "scr",},
					},
					visible = 0,
				}
    return CMGF
end

MusicMenu = 
{
	Layout = 
	{
		pos_XY = { x = 358/1120, y = 45/630, xr = "scr", yr = "scr" },
		size_WH = { w = 404/1120, h = 60/630, wr = "scr", hr = "scr" },
	},	
	
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,
	;
	{
		type = "TextLabel",
		Layout = 
		{
			pos_XY = { x = 2/1120, y = 0/630, xr = "scr", yr = "scr" },
			size_WH = { w = 400/1120, h = 25/630, wr = "scr", hr = "scr" },
		},		
		Text = 
		{
			text = MusicPlayerVersion,
			font = "Heading3Font",
      vAlign = "Bottom", 
      hAlign = "Center", 
			color = TitleColor,
		},
	},
	{
		type = "Frame",
		Layout = 
		{
			pos_XY = { x = 2/1120, y = 25/630, xr = "scr", yr = "scr" },
			size_WH = { w = 400/1120, h = 45/630, wr = "scr", hr = "scr" },
		},
		backgroundColor = {0,0,0,55,},
		;
		{ 
	    type = "Button", 
			Layout = 
			{
				pos_XY = { x = 2/1120, y = 4/630, xr = "scr", yr = "scr" },
				size_WH = { w = 30/1120, h = 26/630, wr = "scr", hr = "scr" },
			},
			onMouseClicked = "UI_SetElementVisible('MusicMenu','PreviousMusic',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {138,3,183,42,},
				color = PreviousButtonColor,
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {388,3,433,42,},
			},
		}, 
		{ 
    	type = "Button", 
			Layout = 
			{
				pos_XY = { x = 34/1120, y = 4/630, xr = "scr", yr = "scr" },
				size_WH = { w = 30/1120, h = 26/630, wr = "scr", hr = "scr" },
			},
			name = "PlayButton",
			visible = 0,
			onMouseClicked = "UI_SetElementVisible('MusicMenu','StopButton',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {49,3,94,42,},
				color = StopButtonColor,
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {299,3,344,42,},
			},
		}, 
		{ 
    	type = "Button", 
 			Layout = 
			{
				pos_XY = { x = 34/1120, y = 4/630, xr = "scr", yr = "scr" },
				size_WH = { w = 30/1120, h = 26/630, wr = "scr", hr = "scr" },
			},
			name = "StopButton",
			onMouseClicked = "UI_SetElementVisible('MusicMenu','PlayButton',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {183,3,228,42,},
				color = PlayButtonColor,
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {433,3,478,42,},
			},
		}, 
		{ 
    	type = "Button", 
 			Layout = 
			{
				pos_XY = { x = 66/1120, y = 4/630, xr = "scr", yr = "scr" },
				size_WH = { w = 30/1120, h = 26/630, wr = "scr", hr = "scr" },
			},
			onMouseClicked = "UI_SetElementVisible('MusicMenu','NextMusic',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {94,3,139,42,},
				color = NextButtonColor,
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {344,3,389,42,},
			},
		}, 
		{ 
    	type = "Button", 
 			Layout = 
			{
				pos_XY = { x = 380/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 18/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			name = "MusicListButton",
			onMouseClicked = "UI_SetElementVisible( 'MusicMenu', 'ShowMusicListFrame', 1 - UI_IsNamedElementVisible('MusicMenu','ShowMusicListFrame'))",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {201,43,228,63,},
				color = MusicListButtonColor,
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {451,43,478,65,},
			},
		}, 
		{
			type = "Frame",
 			Layout = 
			{
				pos_XY = { x = 326/1120, y = 0/630, xr = "scr", yr = "scr" },
				size_WH = { w = 74/1120, h = 18/630, wr = "scr", hr = "scr" },
			},
			;
			{ 
    		type = "RadioButton", 
	 			Layout = 
				{
					pos_XY = { x = 2/1120, y = 2/630, xr = "scr", yr = "scr" },
					size_WH = { w = 22/1120, h = 14/630, wr = "scr", hr = "scr" },
				},
				name = "RepeatTrack",
				onMouseClicked = "UI_SetElementVisible('MusicMenu','MusicPlayType1',1)",
				DefaultGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {5,43,38,63,},
					color = RepeatTrackButtonColor,
				},
				PressedGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {255,43,288,65,},
				},
			}, 
			{ 
    		type = "RadioButton", 
	 			Layout = 
				{
					pos_XY = { x = 26/1120, y = 2/630, xr = "scr", yr = "scr" },
					size_WH = { w = 22/1120, h = 14/630, wr = "scr", hr = "scr" },
				},
				name = "RepeatSingle",
				onMouseClicked = "UI_SetElementVisible('MusicMenu','MusicPlayType2',1)",
				DefaultGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {39,43,72,63,},
					color = RepeatSingleButtonColor,
				},
				PressedGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {289,43,322,65,},
				},
			}, 
			{ 
    		type = "RadioButton", 
	 			Layout = 
				{
					pos_XY = { x = 50/1120, y = 2/630, xr = "scr", yr = "scr" },
					size_WH = { w = 22/1120, h = 14/630, wr = "scr", hr = "scr" },
				},
				name = "RandomPlay",
				onMouseClicked = "UI_SetElementVisible('MusicMenu','MusicPlayType3',1)",
				DefaultGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {72,43,105,63,},
					color = RandomPlayButtonColor,
				},
				PressedGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {322,43,355,65,},
				},
			}, 
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 100/1120, y = 2/630, xr = "scr", yr = "scr" },
				size_WH = { w = 10/1120, h = 16/630, wr = "scr", hr = "scr" },
			},
			name = "MusicIndex",
			Text = 
			{
				pixels = (36),
        vAlign = "Middle", 
        hAlign = "Center", 
				color = MusicIndexColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 111/1120, y = 2/630, xr = "scr", yr = "scr" },
				size_WH = { w = 5/1120, h = 16/630, wr = "scr", hr = "scr" },
			},
			Text = 
			{
				pixels = (36),
				text = "-",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = SymbolColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 117/1120, y = 2/630, xr = "scr", yr = "scr" },
				size_WH = { w = 205/1120, h = 16/630, wr = "scr", hr = "scr" },
			},
			name = "MusicName",
			Text = 
			{
				pixels = (36),
        vAlign = "Middle", 
        hAlign = "Left", 
				color = MusicNameColor,
			},
		},
		{
			type = "Frame",
 			Layout = 
			{
				pos_XY = { x = 100/1120, y = 20/630, xr = "scr", yr = "scr" },
				size_WH = { w = 222/1120, h = 10/630, wr = "scr", hr = "scr" },
			},
			;
			{
				type = "Frame",
	 			Layout = 
				{
					pos_XY = { x = 1/1120, y = 1/630, xr = "scr", yr = "scr" },
					size_WH = { w = 220/1120, h = 8/630, wr = "scr", hr = "scr" },
				},
    		BackgroundGraphic = 
    		{ 
        	texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        	textureUV = { 237, 73, 475, 81, },
					color = ProgressFrameColor,
				}, 
			},
			{
				type = "Frame",
	 			Layout = 
				{
					pos_XY = { x = 1/1120, y = 1/630, xr = "scr", yr = "scr" },
					size_WH = { w = 0/1120, h = 0/630, wr = "scr", hr = "scr" },
				},
				name = "MusicProgress",
    		BackgroundGraphic = 
    		{ 
        	texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        	textureUV = { 237, 84, 475, 92, }, 
					color = ProgressColor,
				}, 
			},
			{
				type = "Frame",
	 			Layout = 
				{
					pos_XY = { x = 0/1120, y = 0/630, xr = "scr", yr = "scr" },
					size_WH = { w = 4/1120, h = 10/630, wr = "scr", hr = "scr" },
				},
				name = "MusicProFrame",
    		BackgroundGraphic = 
    		{ 
        	texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        	textureUV = { 238, 96, 244, 111, }, 
					color = CursorColor,
				}, 
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 326/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 10/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			name = "pMinute",
			Text = 
			{
				pixels = (36),
				font = "ATISmallFont",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = TimeDisplayColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 336/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 4/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			Text = 
			{
				pixels = (36),
				text = ":",
				font = "ATISmallFont",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = TimeDisplayColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 340/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 10/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			name = "pSecond",
			Text = 
			{
				pixels = (36),
				font = "ATISmallFont",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = TimeDisplayColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 350/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 6/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			Text = 
			{
				pixels = (36),
				text = "/",
				font = "ATISmallFont",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = TimeDisplayColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 356/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 10/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			name = "tMinute",
			Text = 
			{
				pixels = (36),
				font = "ATISmallFont",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = TimeDisplayColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 366/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 4/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			Text = 
			{
				pixels = (36),
				text = ":",
				font = "ATISmallFont",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = TimeDisplayColor,
			},
		},
		{
			type = "TextLabel",
 			Layout = 
			{
				pos_XY = { x = 370/1120, y = 18/630, xr = "scr", yr = "scr" },
				size_WH = { w = 10/1120, h = 14/630, wr = "scr", hr = "scr" },
			},
			name = "tSecond",
			Text = 
			{
				pixels = (36),
				font = "ATISmallFont",
        vAlign = "Middle", 
        hAlign = "Center", 
				color = TimeDisplayColor,
			},
		},
	},
	CreateBlindFrame("ShowMusicListFrame"),
	CreateBlindFrame("MusicPlayType1"),
	CreateBlindFrame("MusicPlayType2"),
	CreateBlindFrame("MusicPlayType3"),
	CreateBlindFrame("NextMusic"),
	CreateBlindFrame("PreviousMusic"),
	CreateBlindFrame("LoadFlag"),
}
