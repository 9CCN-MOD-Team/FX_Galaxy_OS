dofilepath("player:PLAYERCFG.lua")

UI_Color = PlayerSetup.teamcolour
UI_Color[4]=255

ListItemBorderColor = {0,0,0,0,}
ListItemOverBorderColor = {198,198,198,255,}
ListItemPressedBorderColor = {255,255,255,255,}
ListItemTextColor = {255,255,255,255,}
ListItemTimeColor = {255,255,255,255,}
MusicListFrameColor = UI_Color
ButtonColor = UI_Color
ButtonDisabledColor = {152,152,152,160,}

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


function CreateMusicButton(Index)
	local MusicButtonFrame = 
			{ 
    		type = "Button", 
				Layout = 
				{
					pos_XY = {x = 3/1120, y = (3+11*(Index-1-4*floor((Index-1)/4)))/630, xr="scr", yr="scr",},					
					size_WH = {w = 184/1120, h = 11/630, wr = "scr", hr = "scr",},
				},
				name = "MusicButton"..Index,
				visible = 0,
				onMouseClicked = "UI_SetElementVisible('MusicListMenu','PlayMusic"..Index.."',1)",
				borderWidth = 1,
				borderColor = ListItemBorderColor,
				overBorderColor = ListItemOverBorderColor,
				pressedBorderColor = ListItemPressedBorderColor,
				;
				{
					type = "TextLabel",
					Layout = 
					{
						pos_XY = {x = 0/1120, y = 0/630, xr="scr", yr="scr",},					
						size_WH = {w = 10/1120, h = 11/630, wr = "scr", hr = "scr",},
					},
					name = "MusicIndex"..Index,
					giveParentMouseInput = 1,
					Text = 
					{
						pixels = (36),
						font = "ATISmallFont",
        		vAlign = "Middle", 
        		hAlign = "Center", 
						color = {255,255,255,255,},
					},
				},
				{
					type = "TextLabel",
					Layout = 
					{
						pos_XY = {x = 11/1120, y = 0/630, xr="scr", yr="scr",},					
						size_WH = {w = 5/1120, h = 11/630, wr = "scr", hr = "scr",},
					},
					giveParentMouseInput = 1,
					Text = 
					{
						pixels = (36),
						text = "-",
						font = "ATISmallFont",
        		vAlign = "Middle", 
        		hAlign = "Center", 
						color = ListItemTextColor,
					},
				},
				{
					type = "TextLabel",
					Layout = 
					{
						pos_XY = {x = 17/1120, y = 0/630, xr="scr", yr="scr",},					
						size_WH = {w = 142/1120, h = 14/630, wr = "scr", hr = "scr",},
					},
					giveParentMouseInput = 1,
					name = "MusicName"..Index,
					Text = 
					{
						pixels = (36),
						font = "ATISmallFont",
        		vAlign = "Middle", 
        		hAlign = "Left", 
						color = ListItemTextColor,
					},
				},
				{
					type = "TextLabel",
					Layout = 
					{
						pos_XY = {x = 159/1120, y = 0/630, xr="scr", yr="scr",},					
						size_WH = {w = 10/1120, h = 14/630, wr = "scr", hr = "scr",},
					},
					giveParentMouseInput = 1,
					name = "mMinute"..Index,
					Text = 
					{
						pixels = (36),
						font = "ATISmallFont",
        		vAlign = "Middle", 
        		hAlign = "Center", 
						color = ListItemTimeColor,
					},
				},
				{
					type = "TextLabel",
					Layout = 
					{
						pos_XY = {x = 169/1120, y = 0/630, xr="scr", yr="scr",},					
						size_WH = {w = 5/1120, h = 14/630, wr = "scr", hr = "scr",},
					},
					giveParentMouseInput = 1,
					Text = 
					{
						pixels = (36),
						text = ":",
						font = "ATISmallFont",
        		vAlign = "Middle", 
        		hAlign = "Center", 
						color = ListItemTimeColor,
					},
				},
				{
					type = "TextLabel",
					Layout = 
					{
						pos_XY = {x = 174/1120, y = 0/630, xr="scr", yr="scr",},					
						size_WH = {w = 10/1120, h = 14/630, wr = "scr", hr = "scr",},
					},
					giveParentMouseInput = 1,
					name = "mSecond"..Index,
					Text = 
					{
						pixels = (36),
						font = "ATISmallFont",
        		vAlign = "Middle", 
        		hAlign = "Center", 
						color = ListItemTimeColor,
					},
				},
			}
	return MusicButtonFrame
end

MusicListMenu = 
{
	Layout = 
	{
		pos_XY = {x = 358/1120, y = 105/630, xr="scr", yr="scr",},					
		size_WH = {w = 404/1120, h = 52/630, wr = "scr", hr = "scr",},
	},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,
	callUpdateWhenInactive = 1,
	onShow = [[
			UI_SetButtonPressed("MusicMenu","MusicListButton",1)
		 ]],
	onUpdate = [[
			if (UI_IsNamedElementVisible("MusicMenu","ShowMusicListFrame")==0)or(UI_IsScreenActive("MusicMenu")==0) then
			    UI_SetScreenVisible("MusicListMenu",0)
			else
			    UI_SetScreenVisible("MusicListMenu",1)
			end
		   ]],
	onHide = [[
			UI_SetButtonPressed("MusicMenu","MusicListButton",0)
		 ]],
	;
	{
		type = "Frame",
		Layout = 
		{
			pos_XY = {x = 2/1120, y = 0/630, xr="scr", yr="scr",},					
			size_WH = {w = 404/1120, h = 52/630, wr = "scr", hr = "scr",},
		},
		backgroundColor = {0,0,0,55,},
		;
		{
			type = "Frame",
			Layout = 
			{
				pos_XY = {x = 0/1120, y = 0/630, xr="scr", yr="scr",},					
				size_WH = {w = 190/1120, h = 50/630, wr = "scr", hr = "scr",},
			},
    	BackgroundGraphic = 
    	{ 
        texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        textureUV = { 0, 64, 231, 165, }, 
				color = MusicListFrameColor,
			}, 
			;
			CreateMusicButton(1),
			CreateMusicButton(2),
			CreateMusicButton(3),
			CreateMusicButton(4),
		},
		{ 
    	type = "Button", 
			Layout = 
			{
				pos_XY = {x = 190/1120, y = 0/630, xr="scr", yr="scr",},					
				size_WH = {w = 20/1120, h = 24/630, wr = "scr", hr = "scr",},
			},
			name = "MusicNextPageButton",
			onMouseClicked = "UI_SetElementVisible('MusicListMenu','MusicNextPage',1)",
			enabled = 0,
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {7,44,37,62,},
				color = ButtonColor,
			},
			DisabledGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {7,44,37,62,},
				color = ButtonDisabledColor,
				blackAndWhite = 1,
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {257,44,287,62,},
			},
		}, 
		{ 
    	type = "Button", 
			Layout = 
			{
				pos_XY = {x = 190/1120, y = 25/630, xr="scr", yr="scr",},					
				size_WH = {w = 20/1120, h = 24/630, wr = "scr", hr = "scr",},
			},
			name = "MusicPreviousPageButton",
			onMouseClicked = "UI_SetElementVisible('MusicListMenu','MusicPreviousPage',1)",
			enabled = 0,
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {37,44,7,62,},
				color = ButtonColor,
			},
			DisabledGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {37,44,7,62,},
				color = ButtonDisabledColor,
				blackAndWhite = 1,
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {287,44,257,62,},
			},
		}, 
		{
			type = "Frame",
			Layout = 
			{
				pos_XY = {x = 210/1120, y = 0/630, xr="scr", yr="scr",},					
				size_WH = {w = 190/1120, h = 50/630, wr = "scr", hr = "scr",},
			},
    	BackgroundGraphic = 
    	{ 
        texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        textureUV = { 0, 64, 231, 165, }, 
				color = MusicListFrameColor,
			}, 
			;
			CreateMusicButton(5),
			CreateMusicButton(6),
			CreateMusicButton(7),
			CreateMusicButton(8),
		},
	},
	CreateBlindFrame("MusicNextPage"),
	CreateBlindFrame("MusicPreviousPage"),
	CreateBlindFrame("PlayMusic1"),
	CreateBlindFrame("PlayMusic2"),
	CreateBlindFrame("PlayMusic3"),
	CreateBlindFrame("PlayMusic4"),
	CreateBlindFrame("PlayMusic5"),
	CreateBlindFrame("PlayMusic6"),
	CreateBlindFrame("PlayMusic7"),
	CreateBlindFrame("PlayMusic8"),
}