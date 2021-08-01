dofilepath("data:scripts/FX_resfinder.lua")

MovieScreen =
{
	displayName = "FX2.0 Trailer",
	helpTip = "FX2.0 Trailer",
	
	Layout = {size_WH = {	w = 1, h = 1, wr = "scr", hr = "scr" },},
	stylesheet = "HW2StyleSheet",
	backgroundColor = {0,0,0,0},
	preUI = 1,
	;
	{
		type = "Movie",
		filenameV = LW_findres("FXLogo.webm"),
--		filenameA = "data:Sound/Music/ANIMATIC/logo",

		Layout = {
			pos_XY = { x = 0.5, y = 0.5, xr = "par", yr = "par" },	
			pivot_XY = { 0.5, 0.5 },
			lockAspect=800/600,			
			size_WH = {	w = 100000, h = 1, wr = "px", hr = "par" },
			max_WH = {	w = 1, h = 1, wr = "par", hr = "par" },			
		},		

		name = "MyMovie",
		volumemultiplier = 0.88, -- Example of setting a volume multiplier on a video.
	},
}

