mainmenutanis=
{
	UpdateFunction=[[
	NewMainMenu_update.mainmenutanis=function()
		--主菜单翻转位置标记
		mainMenuLeft = 1
		--船的位置，若尚未初始化则给予初值
		tanisShipPos = tanisShipPos or -250
		--更新船的位置
		tanisShipPos = tanisShipPos + 1
		if (tanisShipPos>600) then
			tanisShipPos = -250
		end
		UI_SetElementPosition("NewMainMenu","TanisShip",620,tanisShipPos)
	end
	]],
	UItable=
	{
		{ 
			type = "Frame", 
			name = "BackGroundFrame",
			Layout=
			{
				pos_XY = { x = 0, y = 0, xr = "scr", yr = "scr" },		
				size_WH = {w = 1,h = 1,wr = "scr",hr = "scr"},
			}, 
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/tanis.dds", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "TanisShip",
			Layout=
			{
				pos_XY = { x = 620/800, y = 1/5, xr = "scr", yr = "scr" },		
				size_WH = {w = 204/1920,h = 252/1080,wr = "scr",hr = "scr"},
			}, 
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/tanisship.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
				{ 
			type = "Frame", 
			name = "FrontGroundFrame",
			Layout=
			{
				pos_XY = { x = 1-452/1920, y = 1-76/1080+1/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 452/1920,h = 76/1080,wr = "scr",hr = "scr"},
			}, 
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/tanis_front.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
		-----------------------------------------
	}
}