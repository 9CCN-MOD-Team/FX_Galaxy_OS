dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trademenudata.lua")
dofilepath("locale:tradetext.lua")

GoodLoadMenu = 
{
	Layout = 
	{						
		pos_XY = {	x= 0, y= 0, xr="scr", yr="scr",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	stylesheet = "HW2StyleSheet",
	eventOpaque = 0,
	pixelUVCoords = 1,
	Regions = 
	{
		{375/800,45/600,50/800,10/600,},
	},
	;
	{
		type = "TextButton",
		Layout = 
		{						
			pos_XY = {	x= 375/800, y= 65/600, xr="scr", yr="scr",},					
			size_WH = {w = 50/800, h = 15/600, wr = "scr", hr = "scr",},
		},
		buttonStyle = "FEButtonStyle2",
		Text = 
		{
			textStyle = "FEButtonTextStyle",
			text = DTM004[56],
		},
		onMouseClicked = [[UI_SetElementVisible("GoodLoadMenu","close",1)]],
	},
	{ 
		type = "TextLabel", 
		Layout = 
		{						
			pos_XY = {	x= 400/800, y= 30/600, xr="scr", yr="scr",},					
			pivot_XY = { 0.5, 0, },
			size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
		},
		wrapping = 1, 
		autosize = 1,
		name = "GoodLoadText2",
		Text = 
		{ 
			textStyle = "FEHelpTipTextStyle", 
			hAlign = "Middle",
			vAlign = "Bottom",
		}, 
	},
	{ 
		type = "TextLabel", 
		Layout = 
		{						
			pos_XY = {	x= 400/800, y= 45/600, xr="scr", yr="scr",},					
			pivot_XY = { 0.5, 0, },
			size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
		},
		wrapping = 1, 
		autosize = 1,
		name = "GoodLoadText",
		Text = 
		{ 
			textStyle = "FEHelpTipTextStyle", 
			hAlign = "Middle",
			vAlign = "Bottom",
		}, 
	},
	CreateBlindFrame("close"),
}
