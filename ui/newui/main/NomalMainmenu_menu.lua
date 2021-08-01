NomalMainmenu=
{
	UpdateFunction=[[
		NewMainMenu_update.NomalMainmenu=function()
			--主菜单翻转位置标记
			mainMenuLeft = nil
			--船的位置，若尚未初始化则给予初值
			iShip_1 = iShip_1 or 0
			iShip_2 = iShip_2 or 1000
			iShip_3 = iShip_3 or 4000
			iShip_4 = iShip_4 or 500
			iShip_5 = iShip_5 or 1500
			iShip_6 = iShip_6 or 2200
			iShip_7 = iShip_7 or 1400
			iShip_8 = iShip_8 or 3100
			iShip_9 = iShip_9 or 3700
			iShip_10 = iShip_10 or 1800
			iShip_11 = iShip_11 or 2700
			iShip_12 = iShip_12 or 2200
			iShip_13 = iShip_13 or 100
			iShip_14 = iShip_14 or 1000
			iShip_15 = iShip_15 or 900
			iShip_16 = iShip_16 or 2900
			--控制船坞口四个角及左侧的灯光闪烁的计时变量,如果尚未初始化则初始化为0，否则其值增加1
		  iLightBlink = iLightBlink and (iLightBlink + 1) or 0
		  --通过以下判断实现循环闪烁
		  if(iLightBlink==7) then
		  	UI_SetElementVisible("NewMainMenu","BackGroundFrame4",0)
			elseif(iLightBlink==15) then
				UI_SetElementVisible("NewMainMenu","BackGroundFrame3",0)
			elseif(iLightBlink==22) then
				UI_SetElementVisible("NewMainMenu","BackGroundFrame4",1)
			elseif(iLightBlink==30) then
				UI_SetElementVisible("NewMainMenu","BackGroundFrame3",1)
			elseif(iLightBlink==37) then
				UI_SetElementVisible("NewMainMenu","BackGroundFrame4",0)
			elseif(iLightBlink==45) then
				UI_SetElementVisible("NewMainMenu","BackGroundFrame3",0)
			elseif(iLightBlink==52) then
				UI_SetElementVisible("NewMainMenu","BackGroundFrame4",1)
			elseif(iLightBlink==60) then
				UI_SetElementVisible("NewMainMenu","BackGroundFrame3",1)
				iLightBlink=0
			end
			--更新船的位置
			if(iShip_1<=4000)then
				UI_SetElementPosition("NewMainMenu","ship01",iShip_1/4,250)
				iShip_1 = iShip_1 + iRepaint / 1000
			else
				iShip_1 = 0
			end
			if(iShip_2>=0)then
				UI_SetElementPosition("NewMainMenu","ship02",iShip_2/4,310)
				iShip_2 = iShip_2 - iRepaint / 1000
			else
				iShip_2 = 4000
			end
			if(iShip_3>=0)then
				UI_SetElementPosition("NewMainMenu","ship03",iShip_3/4,290)
				iShip_3 = iShip_3 - iRepaint / 1000
			else
				iShip_3 = 4000
			end
			if(iShip_4<=4000)then
				UI_SetElementPosition("NewMainMenu","ship04",iShip_4/4,265)
				iShip_4 = iShip_4 + iRepaint / 1000
			else
				iShip_4 = 0
			end
			if(iShip_5<=4000)then
				UI_SetElementPosition("NewMainMenu","ship05",iShip_5/4,225)
				iShip_5 = iShip_5 + iRepaint / 1000
			else
				iShip_5 = 0
			end
			if(iShip_6>=0)then
				UI_SetElementPosition("NewMainMenu","ship06",iShip_6/4,325)
				iShip_6 = iShip_6 - iRepaint / 1000
			else
				iShip_6 = 4000
			end
			if(iShip_7>=0)then
				UI_SetElementPosition("NewMainMenu","ship07",iShip_7/4,210)
				iShip_7 = iShip_7 - iRepaint / 1000
			else
				iShip_7 = 4000
			end
			if(iShip_8>=0)then
				UI_SetElementPosition("NewMainMenu","ship08",iShip_8/4,300)
				iShip_8 = iShip_8 - iRepaint / 1000
			else
				iShip_8 = 4000
			end
			if(iShip_9>=0)then
				UI_SetElementPosition("NewMainMenu","ship09",iShip_9/4,340)
				iShip_9 = iShip_9 - iRepaint / 1000
			else
				iShip_9 = 4000
			end
			if(iShip_10>=0)then
				UI_SetElementPosition("NewMainMenu","ship10",iShip_10/4,238)
				iShip_10 = iShip_10 - iRepaint / 1000
			else
				iShip_10 = 4000
			end
			if(iShip_11<=4000)then
				UI_SetElementPosition("NewMainMenu","ship11",iShip_11/4,255)
				iShip_11 = iShip_11 + iRepaint / 1000
			else
				iShip_11 = 0
			end
			if(iShip_12>=0)then
				UI_SetElementPosition("NewMainMenu","ship12",iShip_12/3,200)
				iShip_12 = iShip_12 - iRepaint / 1000
			else
				iShip_12 = 3000
			end
			if(iShip_13>=0)then
				UI_SetElementPosition("NewMainMenu","ship13",iShip_13/3,223)
				iShip_13 = iShip_13 - iRepaint / 1000
			else
				iShip_13 = 3000
			end
			if(iShip_14>=0)then
				UI_SetElementPosition("NewMainMenu","ship14",iShip_14/3,280)
				iShip_14 = iShip_14 - iRepaint / 1000
			else
				iShip_14 = 3000
			end
			if(iShip_15<=4000)then
				UI_SetElementPosition("NewMainMenu","ship15",iShip_15/4,360)
				iShip_15 = iShip_15 + iRepaint / 1000
			else
				iShip_15 = 0
			end
			if(iShip_16<=4000)then
				UI_SetElementPosition("NewMainMenu","ship16",iShip_16/4,350)
				iShip_16 = iShip_16 + iRepaint / 1000
			else
				iShip_16 = 0
			end
		end
	]],
	UItable=
	{
		{ 
			type = "Frame", 
			name = "BackGroundFrame",
			Layout=
			{
				pos_XY = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" },		
				size_WH = {w = 1.0,h = 1.0,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/bg.dds", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
			{ 
			type = "Frame", 
			name = "BackGroundFrame3",
			Layout=
			{
				pos_XY = { x = 0, y = 0, xr = "scr", yr = "scr" },		
				size_WH = {w = 684/1920,h = 1.0,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/bg3.dds", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
	-----------------------------------------
		{ 
			type = "Frame", 
			name = "ship01",
			position = { 0, 0, }, 
			size = { 50, 16, }, 
			BackgroundGraphic = 
			{ 
				size = { 50, 16, }, 
				texture = "DATA:UI/NewUI/Background/ship1_0.dds", 
				textureUV = { 0, 0, 150, 36, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship06",
			position = { 0, 0, }, 
			size = { 28, 32/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 28, 32/3, }, 
				texture = "DATA:UI/NewUI/Background/ship2_1.dds", 
				textureUV = { 0, 0, 175, 50, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship11",
			position = { 0, 0, }, 
			size = { 50, 16, }, 
			BackgroundGraphic = 
			{ 
				size = { 50, 16, }, 
				texture = "DATA:UI/NewUI/Background/ship1_0.dds", 
				textureUV = { 0, 0, 150, 36, },
			},
			visible = 1, 
		}, 
	-----------------------------------------
	--------------------------------------------
		{ 
			type = "Frame", 
			name = "ship04",
			position = { 0, 0, }, 
			size = { 28, 32/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 28, 32/3, }, 
				texture = "DATA:UI/NewUI/Background/ship2_0.dds", 
				textureUV = { 0, 0, 175, 50, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship05",
			position = { 0, 0, }, 
			size = { 28, 32/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 28, 32/3, }, 
				texture = "DATA:UI/NewUI/Background/ship2_0.dds", 
				textureUV = { 0, 0, 175, 50, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship14",
			position = { 0, 0, }, 
			size = { 10, 8/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 10, 8/3, }, 
				texture = "DATA:UI/NewUI/Background/ship5_1.dds", 
				textureUV = { 0, 0, 250, 50, },
			},
			visible = 1, 
		}, 
	--------------------------------------------
		{ --光层2
			type = "Frame", 
			name = "light_gate_02",
			Layout=
			{
				pos_XY = { x = -133/1920, y = -49/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 594/201*512/1920,h = 594/201*512/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/lights.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
	------------------------------------------------
		{ 
			type = "Frame", 
			name = "ship09",
			position = { 0, 0, }, 
			size = { 40, 32/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 40, 32/3, }, 
				texture = "DATA:UI/NewUI/Background/ship4_1.dds", 
				textureUV = { 0, 0, 250, 50, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship16",
			position = { 0, 0, }, 
			size = { 20, 8, }, 
			BackgroundGraphic = 
			{ 
				size = { 20, 8, }, 
				texture = "DATA:UI/NewUI/Background/ship6_0.dds", 
				textureUV = { 0, 0, 225, 68, },
			},
			visible = 1, 
		}, 
	-------------------------------------------------
		{ --光层3
			type = "Frame", 
			name = "light_gate_03",
			Layout=
			{
				pos_XY = { x = -133/1920, y = -49/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 594/201*512/1920,h = 594/201*512/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/lights.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
	--------------------------------------------
		{ 
			type = "Frame", 
			name = "ship03",
			position = { 0, 0, }, 
			size = { 50, 16, }, 
			BackgroundGraphic = 
			{ 
				size = { 50, 16, }, 
				texture = "DATA:UI/NewUI/Background/ship1_1.dds", 
				textureUV = { 0, 0, 150, 36, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship08",
			position = { 0, 0, }, 
			size = { 27, 12, }, 
			BackgroundGraphic = 
			{ 
				size = { 27, 12, }, 
				texture = "DATA:UI/NewUI/Background/ship3_1.dds", 
				textureUV = { 0, 0, 225, 75, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship10",
			position = { 0, 0, }, 
			size = { 40, 32/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 40, 32/3, }, 
				texture = "DATA:UI/NewUI/Background/ship4_1.dds", 
				textureUV = { 0, 0, 250, 50, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship15",
			position = { 0, 0, }, 
			size = { 20, 8, }, 
			BackgroundGraphic = 
			{ 
				size = { 20, 8, }, 
				texture = "DATA:UI/NewUI/Background/ship6_0.dds", 
				textureUV = { 0, 0, 225, 68, },
			},
			visible = 1, 
		}, 
	---------------------------------------------
		{ --光层4
			type = "Frame", 
			name = "light_gate_04",
			Layout=
			{
				pos_XY = { x = -133/1920, y = -49/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 594/201*512/1920,h = 594/201*512/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/lights.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
	--------------------------------------------
		{ 
			type = "Frame", 
			name = "ship02",
			position = { 0, 0, }, 
			size = { 50, 16, }, 
			BackgroundGraphic = 
			{ 
				size = { 50, 16, }, 
				texture = "DATA:UI/NewUI/Background/ship1_1.dds", 
				textureUV = { 0, 0, 150, 36, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship07",
			position = { 0, 0, }, 
			size = { 27, 12, }, 
			BackgroundGraphic = 
			{ 
				size = { 27, 12, }, 
				texture = "DATA:UI/NewUI/Background/ship3_1.dds", 
				textureUV = { 0, 0, 225, 75, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "ship12",
			position = { 0, 0, }, 
			size = { 10, 8/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 10, 8/3, }, 
				texture = "DATA:UI/NewUI/Background/ship5_1.dds", 
				textureUV = { 0, 0, 250, 50, },
			},
			visible = 1, 
	}, 
		{ 
			type = "Frame", 
			name = "ship13",
			position = { 0, 0, }, 
			size = { 10, 8/3, }, 
			BackgroundGraphic = 
			{ 
				size = { 10, 8/3, }, 
				texture = "DATA:UI/NewUI/Background/ship5_1.dds", 
				textureUV = { 0, 0, 250, 50, },
			},
			visible = 1, 
		}, 
	-------------------------------------------
		{ --光层5
			type = "Frame", 
			name = "light_gate_05",
			Layout=
			{
				pos_XY = { x = -133/1920, y = -49/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 594/201*512/1920,h = 594/201*512/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/lights.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
		{ --光层5
			type = "Frame", 
			name = "light_gate_05_2",
			Layout=
			{
				pos_XY = { x = -133/1920, y = -49/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 594/201*512/1920,h = 594/201*512/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/lights.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
			{ --光层5
			type = "Frame", 
			name = "light_gate_05_3",
			Layout=
			{
				pos_XY = { x = -133/1920, y = -49/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 594/201*512/1920,h = 594/201*512/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/lights.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
			{ --光层5
			type = "Frame", 
			name = "light_gate_05_4",
			Layout=
			{
				pos_XY = { x = -133/1920, y = -49/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 594/201*512/1920,h = 594/201*512/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/lights.tga", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
	-----------------------------------------
		{ 
			type = "Frame", 
			name = "BackGroundFrame2",
			Layout=
			{
				pos_XY = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" },		
				size_WH = {w = 260/1920,h = 1.0,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/bg2.dds", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "BackGroundFrame4",
			Layout=
			{
				pos_XY = { x = 1/1920, y = 280/1080, xr = "scr", yr = "scr" },		
				size_WH = {w = 128/1920,h = 140/1080,wr = "scr",hr = "scr"},
			},
			BackgroundGraphic = 
			{ 
				texture = "DATA:UI/NewUI/Background/bg4.dds", 
				uvRect = { 0, 1, 1, 0, },
			},
			visible = 1, 
		}, 
	---------------------------------------
	}
}