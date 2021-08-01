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

function CreateTelltaleProBar()
			local TTP=
			{
				type = "Frame",
				name = "TelltaleProgressBar",
				Layout = 
				{	
					pos_XY = { x = 0.5, y = 0, xr = "par", yr = "scr" },			
					pivot_XY = { 0.5, 0.0 },
					size_WH = { w = 600/800, h = 4/800, wr = "scr", hr = "scr" },	
				},
				;
				{
					type = "Frame",
					name = "TelltaleProgressBarColor",
					Layout = 
					{	
						pos_XY = { x = 0, y = 4/800, xr = "scr", yr = "scr" },			
						pivot_XY = { 0.0, 1.0 },
						size_WH = { w = 600/800, h = 256/600, wr = "scr", hr = "scr" },	
					},
					BackgroundGraphic = 
					{			
						texture = "data:ui\\NewUI\\telltaleui\\telltalecolor.tga",
						uvRect = { 0, 0, 1, 1 },
					},
				},
			}
	return TTP
end

function CreateTelltaleTabel(index)
			local TTL=
			{
				type = "TextLabel",
				name = "telltalelabel_"..index,
				Layout = 
				{	
					pos_XY = { x = 0.5, y = 0, xr = "par", yr = "scr" },			
					pivot_XY = { 0.5, 0.0 },
					min_WH = { w = 420, h = 42, wr = "px", hr = "px" },	
				},
				wrapping = 1,
				autosize=1,								
				backgroundColor = SELECTIONBACKGROUNDCOLOR,
				Text = 
				{
					textStyle = "SubtitleSPTextStyle",
					hAlign = "Center",
					vAlign = "Center",
					font = "ButtonFont",
					pixels  = 54,
				},						
				dropShadow = 1,
				onMouseClicked = "UI_SetElementVisible('NewTaskbar','telltale"..index.."',1)",
			}
	return TTL
end

function CreateTelltaleFrame()
			local TTF=
			{
				type = "Frame",
				Layout = 
				{	
					pos_XY = { x = 0.0, y = 0, xr = "scr", yr = "scr" },			
					size_WH = { w = 1, h = 18, wr = "par", hr = "px" },	
				},
			}
	return TTF
end

for i=1,100 do
	if(NewTaskbar[i]==nil)then
		NewTaskbar[i]=
		{
			type = "Frame",		
			name = "telltaleframe",
			visible = 0,
			giveParentMouseInput = 1,	-- we don't want to capture input
			Layout = 
			{
				pos_XY = { x = 0.5, y = 0.93, xr = "par", yr = "par" },
				--size_WH = { w = 1, h = 0, wr = "par", hr = "par" },
				pivot_XY = { 0.5, 1.0 },
				pad_LT  = { l = 0, t = 0, lr = "px", tr = "px" },
				pad_RB  = { r = 0, b = 100, rr = "px", br = "px" },
			
			},		
			autosize = 1,
			arrangetype = "vert",
			arrangedir = 1,		
			;	
			CreateTelltaleTabel(4),	
			CreateTelltaleFrame(),
			CreateTelltaleTabel(3),
			CreateTelltaleFrame(),
			CreateTelltaleTabel(2),
			CreateTelltaleFrame(),
			CreateTelltaleTabel(1),
			CreateTelltaleFrame(),
			CreateTelltaleProBar(),
			{
				type = "Frame",
				name = "TelltaleProgressBar",
				Layout = 
				{	
					pos_XY = { x = 0.0, y = 0, xr = "scr", yr = "scr" },			
					size_WH = { w = 600/800, h = 0, wr = "scr", hr = "scr" },	
				},
			},
			CreateBlindFrame("telltale1"),
			CreateBlindFrame("telltale2"),
			CreateBlindFrame("telltale3"),
			CreateBlindFrame("telltale4"),
		}
		break
	end
end