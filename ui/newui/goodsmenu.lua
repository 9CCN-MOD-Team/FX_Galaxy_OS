dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trademenudata.lua")
dofilepath("locale:tradetext.lua")
dofilepath("locale:tradedatalocale.lua")
dofilepath("locale:SellPosition.lua")
dofilepath("locale:factory.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_good.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_ship.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_station.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_factory.lua")

function CreateInputNumFrame()
	local MouseEvent = "MainUI_ScarEvent('DTM4_InputKeyBind()')"
	local BNF = 
			{
	    	type = "Frame",
				Layout = 
				{
					pos_XY = {x = 290/800, y = 53/450, xr="scr", yr="scr",},					
					size_WH = {w = 60/800, h = 22/450, wr = "scr", hr = "scr",},
				},
	    	name = "InputNumFrame",
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	BackgroundGraphic = 
	    	{
					texture = "locale:ui\\rpg\\NumFrame.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent,
				;
				{
					type = "TextLabel",
					Layout = 
					{
						pos_XY = {x = 2/800, y = 1/450, xr="scr", yr="scr",},					
						size_WH = {w = 53/800, h = 20/450, wr = "scr", hr = "scr",},
					},
					name = "InputNum",
					giveParentMouseInput = 1,
					wrapping = 1,
					Text = 
					{
						textStyle = "RM_IGShipDescriptionLabel_TextStyle",
					  vAlign = "Middle", 
					  hAlign = "Right", 
						color = {255,255,255,255,},
						minShrink = 0.25,
					},
				},
			}
	return BNF
end

function CreateDELButton()
	local MouseEvent = 
	[[
		MainUI_ScarEvent("g_InputNum = floor(g_InputNum/10);UI_SetTextLabelText('GoodsMenu','InputNum',tostring(g_InputNum))")
	]]
	local SOBF = 
	{
	    	type = "Button",
	    	Layout = 
				{
					pos_XY = {x=296/800, y=76/450, xr="scr", yr="scr",},
					size_WH = { w=20/800, h = 22/450, wr = "scr", hr = "scr",},
				},
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\DEL_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\DEL_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\DEL_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent,
	}
	return SOBF
end

function CreateACButton()
	local MouseEvent = 
	[[
		MainUI_ScarEvent("g_InputNum = 0;UI_SetTextLabelText('GoodsMenu','InputNum',tostring(g_InputNum))")
	]]
	local SOBF = 
	{
	    	type = "Button",
	    	Layout = 
				{
					pos_XY = {x=324/800, y=76/450, xr="scr", yr="scr",},
					size_WH = { w=20/800, h = 22/450, wr = "scr", hr = "scr",},
				},
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\AC_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\AC_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\AC_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent,
	}
	return SOBF
end

function CreateCancelQueueButton()
	local MouseEvent = "MainUI_ScarEvent('DTM4_GoodsCancelQueue()')"
	local SABF = 
	{
	    	type = "Button",
	    	Layout = 
				{
					pos_XY = {x=290/800, y=1/450, xr="scr", yr="scr",},
					size_WH = { w=60/800, h = 22/450, wr = "scr", hr = "scr",},
				},
	    	name = "CancelQueueButton",
	    	enabled = 0,
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\btnCQueue_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\btnCQueue_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\btnCQueue_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent,
	}
	return SABF
end

function CreateCancelManageButton()
	local MouseEvent = "MainUI_ScarEvent('DTM4_GoodsCancelManage()')"
	local SABF = 
	{
	    	type = "Button",
	    	Layout = 
				{
					pos_XY = {x=290/800, y=23/450, xr="scr", yr="scr",},
					size_WH = { w=60/800, h = 22/450, wr = "scr", hr = "scr",},
				},
	    	name = "CancelManageButton",
	    	enabled = 0,
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\btnCManage_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\btnCManage_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\btnCManage_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent,
	}
	return SABF
end

function CreateThrowButton()
	local MouseEvent1 = "MainUI_ScarEvent('DTM4_GoodsThrow()')"
	local MouseEvent2 = "MainUI_ScarEvent('DTM4_GoodsThrowAll()')"
	local SABF = 
	{
	    	type = "Button",
	    	Layout = 
				{
					pos_XY = {x=290/800, y=145/450, xr="scr", yr="scr",},
					size_WH = { w=60/800, h = 22/450, wr = "scr", hr = "scr",},
				},
	    	name = "ThrowButton",
	    	enabled = 0,
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\btnThrow_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\btnThrow_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\btnThrow_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent1,
				onMouseDoubleClicked = MouseEvent2,
	}
	return SABF
end

function CreateManageButton()
	local MouseEvent = "MainUI_ScarEvent('DTM4_GoodsManage()')"
	local STBF = 
	{
	    	type = "Button",
	    	Layout = 
				{
					pos_XY = {x=290/800, y=122/450, xr="scr", yr="scr",},
					size_WH = { w=60/800, h = 22/450, wr = "scr", hr = "scr",},
				},
	    	name = "ManageButton",
	    	enabled = 0,
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\btnManage_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\btnManage_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\btnManage_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent,
	}
	return STBF
end

function CreateQueueButton()
	local MouseEvent = "MainUI_ScarEvent('DTM4_GoodsQueue()')"
	local SOBF = 
	{
	    	type = "Button",
	    	Layout = 
				{
					pos_XY = {x=290/800, y=99/450, xr="scr", yr="scr",},
					size_WH = { w=60/800, h = 22/450, wr = "scr", hr = "scr",},
				},
	    	name = "QueueButton",
	    	enabled = 0,
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\btnQueue_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\btnQueue_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\btnQueue_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = MouseEvent,
	}
	return SOBF
end

function CreateGoodsBigImage3(Index)
	local CMGF = 
		{ 
    	type = "Frame", 
    	Layout = 
			{
				pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
				size_WH = { w=75/800, h = 75/450, wr = "scr", hr = "scr",},
			},
			name = "FG"..Index.."Graph",
			visible = 0,
    	BackgroundGraphic = 
    	{ 
        texture = Goods[Index].graph, 
        uvRect = { 0,1,1,0 }, 
			}, 
		}
	return CMGF
end

function CreateFleetGoodsDesc()
	local FGDF = 
	{ 
					type = "ListBox", 
					Layout = 
					{
						pos_XY = {x=196/800, y=185/450, xr="scr", yr="scr",},
						size_WH = { w=155/800, h = 151/450, wr = "scr", hr = "scr",},
					},
					name = "FGDescBox", 
					scrollBarSpace = 0, 
					hugBottom = 0, 
					visible = 1,
					;
					{ 
							type = "ListBoxItem",
							Layout = 
							{
								pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
								max_WH = { w=256/800, h = 600/450, wr = "scr", hr = "scr",},
							},
	            autosize = 1, 
					    --vAlign = "Top", 
	            --hAlign = "Center",
							visible = 1,
							;
							{
									type = "TextLabel",
									autosize = 1, 
									wrapping = 1, 
									Layout = 
									{
										pos_XY = {x=5/1080, y=0/1920, xr="scr", yr="scr",},
										max_WH = { w=128/800, h = 600/450, wr = "scr", hr = "scr",},
										--pivot_XY = { -1, 0, },
									},
									name = "FGDesc",
									Text = 
									{
										textStyle = "RM_ShipInfoLabel_TextStyle",
					        	vAlign = "Top", 
					        	hAlign = "Left", 
										color = {255,255,255,255,},
									},
							},
					},
					{ 
						type = "ListBoxItem",--添加一个空ListBoxItem可以有效解决1920x1080分辨率下滚动条消失的问题
						; 
					}, 
		}
	return FGDF
end

function CreateGoodsGraphicFrame(Index)
	local CMGF = 
		{ 
    			type = "Frame", 
    			Layout = 
					{
						pos_XY = {x=5/800, y=5/450, xr="scr", yr="scr",},
						size_WH = { w=38/800, h = 38/450, wr = "scr", hr = "scr",},
					},
    			BackgroundGraphic = 
    			{ 
        			texture = Goods[Index].graph, 
        			uvRect = { 0,1,1,0 }, 
					}, 
		}
	return CMGF
end

function CreateFleetGoodsItem(Index)
	local MouseEvent = "MainUI_ScarEvent('DTM4_GoodsChoose("..Index..")')"
    local CHTT = 
	{
		type = "RadioButton",
	  Layout = 
		{
			size_WH = { w=150/800, h = 48/450, wr = "scr", hr = "scr",},
			pivot_XY = { 0.0, 0.0 },
		},
		name = "FGItem"..Index,
		soundOnEnter = "SFX_ButtonEnter",
		soundOnClicked = "SFX_ButtonClick",
	  DefaultGraphic = 
	  {
	  	--Layout = 
			--{
			--	pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
			--	size_WH = { w=150/800, h = 45/450, wr = "scr", hr = "scr",},
			--},
			texture = "locale:ui\\rpg\\goodmenuitem_dflt.tga",
			uvRect = { 0,1,1,0 },
		},
		OverGraphic = 
		{
	  	--Layout = 
			--{
			--	pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
			--	size_WH = { w=150/800, h = 45/450, wr = "scr", hr = "scr",},
			--},
			texture = "locale:ui\\rpg\\goodmenuitem_pass.tga",
			uvRect = { 0,1,1,0 },
		},
		PressedGraphic = 
		{
	  	--Layout = 
			--{
			--	pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
			--	size_WH = { w=150/800, h = 45/450, wr = "scr", hr = "scr",},
			--},
			texture = "locale:ui\\rpg\\goodmenuitem_down.tga",
			uvRect = { 0,1,1,0 },
		},
		onMouseClicked = MouseEvent,
		;
			CreateGoodsGraphicFrame(Index),  --使用帮助1：去掉"--"解锁货物缩略图的显示
			{ 
				type = "TextLabel", 
				Layout = 
				{
					pos_XY = {x=69/800, y=33/450, xr="scr", yr="scr",},
					size_WH = { w=24/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "FGItem"..Index.."Num",
				Text = 
				{ 
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = { 255, 255, 255, 255, }, 
					hAlign = "Left", 
					vAlign = "Middle", 
					minShrink = 0.25,
				}, 
			},
			{ 
				type = "TextLabel", 
				Layout = 
				{
					pos_XY = {x=50/800, y=6/450, xr="scr", yr="scr",},
					size_WH = { w=96/800, h = 12/450, wr = "scr", hr = "scr",},
				},
				name = "FGItem"..Index.."Name",
				Text = 
				{ 
					textStyle = "RM_ShipInfoLabel_TextStyle",
					text = Goods[Index].name,
					color = { 255, 255, 255, 255, }, 
					hAlign = "Center", 
					vAlign = "Middle", 
					minShrink = 0.25,
				}, 
			},
		}
    return CHTT
end

GoodsMenu = 
{ 
	Layout = 
	{
		pos_XY = {x=220/800, y=25/450, xr="scr", yr="scr",},
		size_WH = { w=360/800, h = 360/450, wr = "scr", hr = "scr",},
	},
	stylesheet = "HW2StyleSheet", 
	pixelUVCoords = 1,
	--callUpdateWhenInactive = 1,
	onLoad = 
	[[
	]], 
	onShow = 
	[[
	]],
	onUpdate = 
	[[
	]],
	;
	{
		type = "Frame",
		Layout = 
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=360/800, h = 360/450, wr = "scr", hr = "scr",},
},
		name = "MainFrame",
	  BackgroundGraphic = 
	  { 
	      type = "Graphic", 
	      texture = "locale:ui\\rpg\\\\goodmenu.tga", 
	      uvRect = { 0,1,1,0 }, 
	  },
		;
		{
			type = "Frame",
			Layout = 
			{
				pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
				size_WH = { w=360/800, h = 360/450, wr = "scr", hr = "scr",},
			},
			name = "goodsMenu",
			;
			CreateFleetGoodsList2(),
			{
				type = "Frame",
				Layout = 
				{
					pos_XY = {x=68/800, y=352/450, xr="scr", yr="scr",},
				},
				name = "GoodsWeightProgress",
		    backgroundColor = {255,120,0,255,}, 
			},
			{
				type = "TextLabel",
				Layout = 
				{
					pos_XY = {x=197/800, y=347/450, xr="scr", yr="scr",},
					size_WH = { w=54/800, h = 14/450, wr = "scr", hr = "scr",},
				},
				name = "GoodsWeight",
				Text = 
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = {255,255,255,255,},
					hAlign = "Right", 
					vAlign = "Middle", 
					minShrink = 0.25,
				},
			},
			{
				type = "TextLabel",
				Layout = 
				{
					pos_XY = {x=251/800, y=347/450, xr="scr", yr="scr",},
					size_WH = { w=8/800, h = 14/450, wr = "scr", hr = "scr",},
				},
				Text = 
				{
					text = "/",
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = {255,255,255,255,},
					hAlign = "Center", 
					vAlign = "Middle", 
					minShrink = 0.25,
				},
			},
			{
				type = "TextLabel",
				Layout = 
				{
					pos_XY = {x=259/800, y=347/450, xr="scr", yr="scr",},
					size_WH = { w=54/800, h = 14/450, wr = "scr", hr = "scr",},
				},
				name = "WeightLimit",
				Text = 
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = {255,255,255,255,},
					hAlign = "Left", 
					vAlign = "Middle", 
					minShrink = 0.25,
				},
			},
			{
				type = "Button",
				Layout = 
				{
					pos_XY = {x=312/800, y=348/450, xr="scr", yr="scr",},
					size_WH = { w=44/800, h = 12/450, wr = "scr", hr = "scr",},
				},
				name = "cancelbutton",
	    	DefaultGraphic = 
	    	{
					texture = "locale:ui\\rpg\\exit2_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic = 
				{
					texture = "locale:ui\\rpg\\exit2_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic = 
				{
					texture = "locale:ui\\rpg\\exit2_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = 
				[[
							UI_HideScreen('GoodsMenu')
				  		UI_SetButtonPressed( 'NewTaskbar', 'btnGoods', 0)
				]],
			},
								{
									type = "TextLabel",
									Layout = 
									{
										pos_XY = {x=192/800, y=141/450, xr="scr", yr="scr",},
										size_WH = { w=83/800, h = 10/450, wr = "scr", hr = "scr",},
									},
									name = "FGName",
									Text = 
									{
										textStyle = "RM_ShipInfoLabel_TextStyle",
					        	vAlign = "Middle", 
					        	hAlign = "Center", 
										color = {255,255,255,255,},
										minShrink = 0.25,
									},
								},
								{
									type = "TextLabel",
									Layout = 
									{
										pos_XY = {x=192/800, y=156/450, xr="scr", yr="scr",},
										size_WH = { w=83/800, h = 10/450, wr = "scr", hr = "scr",},
									},
									name = "FGRate",
									Text = 
									{
										textStyle = "RM_ShipInfoLabel_TextStyle",
					        	vAlign = "Middle", 
					        	hAlign = "Center", 
										color = {255,255,255,255,},
										minShrink = 0.25,
									},
								},
								{
									type = "TextLabel",
									Layout = 
									{
										pos_XY = {x=192/800, y=1/450, xr="scr", yr="scr",},
										size_WH = { w=83/800, h = 22/450, wr = "scr", hr = "scr",},
									},
									name = "FGQueue",
									Text = 
									{
										textStyle = "RM_ShipInfoLabel_TextStyle",
					        	vAlign = "Middle", 
					        	hAlign = "Left", 
										color = {255,255,255,255,},
										minShrink = 0.25,
									},
								},
								{
									type = "TextLabel",
									Layout = 
									{
										pos_XY = {x=192/800, y=23/450, xr="scr", yr="scr",},
										size_WH = { w=83/800, h = 22/450, wr = "scr", hr = "scr",},
									},
									name = "FGManage",
									Text = 
									{
										textStyle = "RM_ShipInfoLabel_TextStyle",
					        	vAlign = "Middle", 
					        	hAlign = "Left", 
										color = {255,255,255,255,},
										minShrink = 0.25,
									},
								},
			CreateThrowButton(),
			CreateQueueButton(),
			CreateManageButton(),
			CreateCancelQueueButton(),
			CreateCancelManageButton(),
			CreateFleetGoodsDesc(),
			CreateFleetGoodsBigImage2(),
			CreateInputNumFrame(),
			CreateDELButton(),
			CreateACButton(),
			{
					type = "Frame", 
					Layout = 
					{
						pos_XY = {x=195/800, y=53/450, xr="scr", yr="scr",},
						size_WH = { w=75/800, h = 0/450, wr = "scr", hr = "scr",},
					},
					name = "FGRateProgress",
					backgroundColor = {0,0,0,150,},
			}
		},
	},
		CreateBlindFrame("FGINT"),
}
