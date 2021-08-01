LocationMenu = 
{ 
	    size = 
	        { 0, 0, 800, 600, }, 
	    stylesheet = "HW2StyleSheet", 
	    RootElementSettings = 
	    { 
	        backgroundColor = 
	            { 0, 0, 0, 0, }, }, 
	    pixelUVCoords = 1, 
	    onShow = [[
			iLight = 0
		     ]],
	    onUpdate = [[
			  if (iLight<5) then
			      iLight = iLight + 1
			  elseif (iLight==5) then
				  UI_SetElementVisible("LocationMenu", "FloatFrame", 0)
				  iLight = iLight + 1
			  elseif (iLight<10) then
				  iLight = iLight + 1
			  elseif (iLight==10) then
				  UI_SetElementVisible("LocationMenu", "FloatFrame", 1)
				  iLight = 0
			  end
		       ]],
	; 
	--关卡信息
	{ 
	    type = "Frame", 
	    name = "1location3", 
	    backgroundColor = { 0, 0, 0, 0, }, 
	    visible = 0, 
	    position = 
	        { 50, 100, }, 
	    size = 
	        { 0, 13, }, 
	; 
		{ 
		    type = "TextLabel", 
		    size = 
		        { 800, 13, }, 
		    Text = 
		    { 
		        textStyle = "FEHeading4", 
		        hAlign = "Left", 
		        vAlign = "Center", 
		        text = "$90019", }, 
		}, 
	},
	{ 
	    type = "Frame", 
	    name = "1location2", 
	    backgroundColor = { 0, 0, 0, 0, }, 
	    visible = 0, 
	    position = 
	        { 50, 115, }, 
	    size = 
	        { 0, 13, }, 
	; 
		{ 
		    type = "TextLabel", 
		    size = 
		        { 800, 13, }, 
		    Text = 
		    { 
		        textStyle = "FEHeading4", 
		        hAlign = "Left", 
		        vAlign = "Center", 
		        text = "$90020", }, 
		}, 
	},
	{ 
	    type = "Frame", 
	    name = "1location1", 
	    backgroundColor = { 0, 0, 0, 0, }, 
	    visible = 0, 
	    position = 
	        { 50, 130, }, 
	    size = 
	        { 0, 13, }, 
	; 
		{ 
		    type = "TextLabel", 
		    size = 
		        { 800, 13, }, 
		    Text = 
		    { 
		        textStyle = "FEHeading4", 
		        hAlign = "Left", 
		        vAlign = "Center", 
		        text = "$90021", }, 
		}, 
	},
	--浮点块
	{ 
	    type = "Frame", 
	    name = "FloatFrame", 
	    backgroundColor = { 255, 255, 255, 255, }, 
	    visible = 1, 
	    position = 
	        { 50, 110, }, 
	    size = 
	        { 5, 3, }, 
	},
}
