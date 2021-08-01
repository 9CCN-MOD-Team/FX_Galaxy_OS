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

NewTaskbar[2][2][6]=
		{
			type = "ButtonHD",
			toggleButton = 1,
			Layout = {				
				--pos_XY = { x = 312-46, y = 0, xr = "px", yr = "px" },
				size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
			},
			name = "btnMP",
			--visible = 0,
			ignored  = 1,

			buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",


			
			stateBaseOfs = { 0.0, 128/1024 },
			stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			BackgroundGraphic = {
					--size = {4, 4},
				texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\hud_musicplayer.dds",					
				uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
				patch_X = { 4,-120, 4,0 },
				patch_Y = { 4,-120,4, 0 },
				--patch_PadX = {3, -3},
				--patch_PadY = {2, -2},
				patch_Scale = 1,			
				Surface = THREESTATEBUTTONSURFACE,

			},
							
			onMouseClicked = [[UI_SetElementVisible("NewTaskbar", "ShowMusicMenu", 1)]],
			helpTip = "$90000",
			helpTipTextLabel = "commandsHelpTip",
			hotKeyID = 175,
		}
for i=1,100 do
	if(NewTaskbar[i]==nil)then
		NewTaskbar[i]=CreateBlindFrame("ShowMusicMenu")
		break
	end
end