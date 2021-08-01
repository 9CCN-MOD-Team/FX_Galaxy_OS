dofilepath("locale:tradetext.lua")
dofilepath("locale:tradedatalocale.lua")
dofilepath("locale:SellPosition.lua")
dofilepath("locale:factory.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/code_usefulfunctions.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_good.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_ship.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_station.lua")
dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_factory.lua")
dofilepath("Data:leveldata/campaign/tutorial/RPG/script/trademenudata.lua")
dofilepath("data:ui/newui/styles/rpgdefines.lua")

function CreateDesc(TextLabelName,ListBoxName)
	local DF =
			{
					type = "ListBox",
					Layout = {
						pos_XY = {x=4/800, y=308/450, xr="scr", yr="scr",},
						size_WH = { w=113/800, h = 80/450, wr = "scr", hr = "scr",},
					},
					name = ListBoxName,
					scrollBarSpace = 0,
					hugBottom = 0,
					visible = 1,
					;
					{
							type = "ListBoxItem",
							Layout =
							{
								pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
								max_WH = { w=172/800, h = 600/450, wr = "scr", hr = "scr",},
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
										max_WH = { w=91/800, h = 600/450, wr = "scr", hr = "scr",},
										--pivot_XY = { -1, 0, },
									},
									name = TextLabelName,
									Text =
									{
										--textStyle = "RM_ShipInfoLabel_TextStyle",
					        	vAlign = "Top",
					        	hAlign = "Left",
										color = {255,255,255,255,},
										type = "Text",
										font = "Blender",
										offset = {0, 0},
										--pixels = (22),
										--rel = 0,
									},
							},
					},
					{
						type = "ListBoxItem",--添加一个空ListBoxItem可以有效解决1920x1080分辨率下滚动条消失的问题
						;
					},
			}
	return DF
end
function CreateStationShipDesc()
	return CreateDesc("SSDesc",nil)
end

function CreateFleetShipDesc()
	return CreateDesc("FSDesc","FSDescBox")
end

function CreateStationGoodsDesc()
	return CreateDesc("SGDesc",nil)
end

function CreateFleetGoodsDesc()
	return CreateDesc("FGDesc","FGDescBox")
end

function CreateBuyShipButton()
	local BSBF =
	{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=77/800, y=191/450, xr="scr", yr="scr",},
size_WH = { w=40/800, h = 22/450, wr = "scr", hr = "scr",},
},
	    	name = "BuyShipButton",
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic =
	    	{
					texture = "locale:ui\\rpg\\buy_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic =
				{
					texture = "locale:ui\\rpg\\buy_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic =
				{
					texture = "locale:ui\\rpg\\buy_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuBuyShipFactory("..iShipSelected2..")")]],
	}
	return BSBF
end

function CreateSellShipButton()
	local BSBF =
	{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=4/800, y=2/450, xr="scr", yr="scr",},
size_WH = { w=40/800, h = 22/450, wr = "scr", hr = "scr",},
},
	    	name = "SellShipButton",
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic =
	    	{
					texture = "locale:ui\\rpg\\sell_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic =
				{
					texture = "locale:ui\\rpg\\sell_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic =
				{
					texture = "locale:ui\\rpg\\sell_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuSellFactory("..iShipSelected1..")")]],
	}
	return BSBF
end

function CreateBuyGoodsButton()
	local BOBF =
			{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=77/800, y=191/450, xr="scr", yr="scr",},
size_WH = { w=40/800, h = 22/450, wr = "scr", hr = "scr",},
},
	    	name = "BuyGoodsButton",
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic =
	    	{
					texture = "locale:ui\\rpg\\buy_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic =
				{
					texture = "locale:ui\\rpg\\buy_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic =
				{
					texture = "locale:ui\\rpg\\buy_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuBuyGoods("..iGoodsSelect2..")")]],
			}
	return BOBF
end

function CreateBuyNumFrame()
	local BNF =
			{
	    	type = "Frame",
	    	Layout =
{
pos_XY = {x=77/800, y=221/450, xr="scr", yr="scr",},
size_WH = { w=40/800, h = 22/450, wr = "scr", hr = "scr",},
},
	    	name = "BuyNumFrame",
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	BackgroundGraphic =
	    	{
					texture = "locale:ui\\rpg\\NumFrame.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuBuyNum()")]],
				;
				{
					type = "TextLabel",
					Layout =
{
pos_XY = {x=2/800, y=1/450, xr="scr", yr="scr",},
size_WH = { w=35/800, h = 20/450, wr = "scr", hr = "scr",},
},
					name = "BuyGoodsNum",
					giveParentMouseInput = 1,
					wrapping = 1,
					Text =
					{
						textStyle = "RM_IGShipDescriptionLabel_TextStyle",
					  vAlign = "Middle",
					  hAlign = "Right",
						color = {255,255,255,255,},
					},
				},
			}
	return BNF
end

function CreateSellGoodsButton()
	local SOBF =
	{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=4/800, y=72/450, xr="scr", yr="scr",},
size_WH = { w=40/800, h = 22/450, wr = "scr", hr = "scr",},
},
	    	name = "SellGoodsButton",
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic =
	    	{
					texture = "locale:ui\\rpg\\sell_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic =
				{
					texture = "locale:ui\\rpg\\sell_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic =
				{
					texture = "locale:ui\\rpg\\sell_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuSellGoods("..iGoodsSelect1..")")]],
	}
	return SOBF
end

function CreateSellNumFrame()
	local SNF =
			{
	    	type = "Frame",
	    	Layout =
{
pos_XY = {x=4/800, y=42/450, xr="scr", yr="scr",},
size_WH = { w=40/800, h = 22/450, wr = "scr", hr = "scr",},
},
	    	name = "SellNumFrame",
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	BackgroundGraphic =
	    	{
					texture = "locale:ui\\rpg\\NumFrame.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuSellNum()")]],
				;
				{
					type = "TextLabel",
					Layout =
{
pos_XY = {x=2/800, y=1/450, xr="scr", yr="scr",},
size_WH = { w=35/800, h = 20/450, wr = "scr", hr = "scr",},
},
					name = "SellGoodsNum",
					giveParentMouseInput = 1,
					wrapping = 1,
					Text =
					{
						textStyle = "RM_IGShipDescriptionLabel_TextStyle",
					  vAlign = "Middle",
					  hAlign = "Right",
						color = {255,255,255,255,},
					},
				},
			}
	return SNF
end

function CreateDELButton1()
	local SOBF =
	{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=77/800, y=251/450, xr="scr", yr="scr",},
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
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuNumDEL()")]],
	}
	return SOBF
end

function CreateACButton1()
	local SOBF =
	{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=97/800, y=251/450, xr="scr", yr="scr",},
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
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuNumAC()")]],
	}
	return SOBF
end

function CreateDELButton2()
	local SOBF =
	{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=4/800, y=12/450, xr="scr", yr="scr",},
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
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuNumDEL()")]],
	}
	return SOBF
end

function CreateACButton2()
	local SOBF =
	{
	    	type = "Button",
	    	Layout =
{
pos_XY = {x=24/800, y=12/450, xr="scr", yr="scr",},
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
				onMouseClicked = [[MainUI_ScarEvent("DTM4_TradeMenuNumAC()")]],
	}
	return SOBF
end

function CreateMenuSwitchButton1()
	local MouseEvent1 = "iSwitch = 2 "
	local MouseEvent2 = "UI_SetElementVisible('TradeMenu','SwitchToShip',0) "
	local MouseEvent3 = "UI_SetElementVisible('TradeMenu','ShipsMenu',1) "
	local MSBF =
		{
    	type = "Button",
    	Layout =
      {
        pos_XY = {x=383/800, y=211/450, xr="scr", yr="scr",},
        size_WH = { w=32/800, h = 28/450, wr = "scr", hr = "scr",},
      },
    	name = "SwitchToShip",
    	visible = 0,
			soundOnEnter = "SFX_ButtonEnter",
			soundOnClicked = "SFX_ButtonClick",

      DefaultGraphic =
      {
        texture = "locale:ui\\rpg\\switchship_dflt.tga",
        uvRect = { 0,1,1,0 },
      },
      OverGraphic =
      {
        texture = "locale:ui\\rpg\\switchship_pass.tga",
        uvRect = { 0,1,1,0 },
      },
      PressedGraphic =
      {
        texture = "locale:ui\\rpg\\switchship_down.tga",
        uvRect = { 0,1,1,0 },
      },
			onMouseClicked = MouseEvent1..MouseEvent2..MouseEvent3,
		}
	return MSBF
end

function CreateMenuSwitchButton2()
	local MouseEvent1 = "iSwitch = 1 "
	local MouseEvent2 = "UI_SetElementVisible('TradeMenu','SwitchToGood',0) "
	local MouseEvent3 = "UI_SetElementVisible('TradeMenu','GoodsMenu',1) "
	local MSBF =
		{
    	type = "Button",
    	Layout =
      {
        pos_XY = {x=383/800, y=211/450, xr="scr", yr="scr",},
        size_WH = { w=32/800, h = 28/450, wr = "scr", hr = "scr",},
      },
    	name = "SwitchToGood",
    	visible = 0,
			soundOnEnter = "SFX_ButtonEnter",
			soundOnClicked = "SFX_ButtonClick",

      DefaultGraphic =
      {
        texture = "locale:ui\\rpg\\switchgood_dflt.tga",
        uvRect = { 0,1,1,0 },
      },
      OverGraphic =
      {
        texture = "locale:ui\\rpg\\switchgood_pass.tga",
        uvRect = { 0,1,1,0 },
      },
      PressedGraphic =
      {
        texture = "locale:ui\\rpg\\switchgood_down.tga",
        uvRect = { 0,1,1,0 },
      },
			onMouseClicked = MouseEvent1..MouseEvent2..MouseEvent3,
		}
	return MSBF
end

function CreateGoodsGraphicFrame(Index)
	local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=0/800, y=3/450, xr="scr", yr="scr",},
size_WH = { w=25/800, h = 25/450, wr = "scr", hr = "scr",},
},
    	BackgroundGraphic =
    	{
        texture = Goods[Index].graph,
        uvRect = { 0,1,1,0 },
			},
		}
	return CMGF
end

function CreateGoodsBigImage2(Index)
	local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=50/800, h = 50/450, wr = "scr", hr = "scr",},
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

function CreateGoodsBigImage1(Index)
	local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=50/800, h = 50/450, wr = "scr", hr = "scr",},
},
			name = "SG"..Index.."Graph",
			visible = 0,
    	BackgroundGraphic =
    	{
        texture = Goods[Index].graph,
        uvRect = { 0,1,1,0 },
			},
		}
	return CMGF
end

function CreateFactoryGraphicFrame(Index)
	local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=13/800, y=14/450, xr="scr", yr="scr",},
size_WH = { w=25/800, h = 25/450, wr = "scr", hr = "scr",},
},
    	BackgroundGraphic =
    	{
        	texture = Factory[Index].graph,
        	uvRect = { 0,1,1,0 },
			},
		}
	return CMGF
end

function CreateShipsGraphicFrame(Index)
	local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=0/800, y=14/450, xr="scr", yr="scr",},
size_WH = { w=50/800, h = 25/450, wr = "scr", hr = "scr",},
},
    	BackgroundGraphic =
    	{
        	texture = shiplist[Index].graph,
        	uvRect = { 0,1,1,0 },
			},
		}
	return CMGF
end

function CreateShipFactoryBigImage1(Index)
	if (shiplist[Index]~=nil) then
		local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=100/800, h = 50/450, wr = "scr", hr = "scr",},
},
			name = "SS"..Index.."Graph",
			visible = 0,
    	BackgroundGraphic =
    	{
        	texture = shiplist[Index].graph,
        	uvRect = { 0,1,1,0 },
			},
		}
		return CMGF
	else
		local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=25/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=50/800, h = 50/450, wr = "scr", hr = "scr",},
},
			name = "SF"..Index.."Graph",
			visible = 0,
    	BackgroundGraphic =
    	{
        	texture = Factory[Index-DTM4_GetTableNum(shiplist)].graph,
        	uvRect = { 0,1,1,0 },
			},
		}
		return CMGF
	end
end

function CreateShipFactoryBigImage2(Index)
	if (shiplist[Index]~=nil) then
		local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=100/800, h = 50/450, wr = "scr", hr = "scr",},
},
			name = "FS"..Index.."Graph",
			visible = 0,
    	BackgroundGraphic =
    	{
        	texture = shiplist[Index].graph,
        	uvRect = { 0,1,1,0 },
			},
		}
		return CMGF
	else
		local CMGF =
		{
    	type = "Frame",
    	Layout =
{
pos_XY = {x=25/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=50/800, h = 50/450, wr = "scr", hr = "scr",},
},
			name = "FF"..Index.."Graph",
			visible = 0,
    	BackgroundGraphic =
    	{
        	texture = Factory[Index-DTM4_GetTableNum(shiplist)].graph,
        	uvRect = { 0,1,1,0 },
			},
		}
		return CMGF
	end
end

function CreateStationGoodsItem(Index)
    local CHTT =
	{
		type = "RadioButton",
	  	Layout =
{
size_WH = { w=100/800, h = 32/450, wr = "scr", hr = "scr",},
},
		name = "SGItem"..Index,
		soundOnEnter = "SFX_ButtonEnter",
		soundOnClicked = "SFX_ButtonClick",
	  DefaultGraphic =
	  {
	  	Layout =
{
pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
size_WH = { w=100/800, h = 30/450, wr = "scr", hr = "scr",},
},
			texture = "locale:ui\\rpg\\gooditem_dflt.tga",
			uvRect = { 0,1,1,0 },
		},
		OverGraphic =
		{
	  	Layout =
{
pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
size_WH = { w=100/800, h = 30/450, wr = "scr", hr = "scr",},
},
			texture = "locale:ui\\rpg\\gooditem_pass.tga",
			uvRect = { 0,1,1,0 },
		},
		PressedGraphic =
		{
	  	Layout =
{
pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
size_WH = { w=100/800, h = 30/450, wr = "scr", hr = "scr",},
},
			texture = "locale:ui\\rpg\\gooditem_down.tga",
			uvRect = { 0,1,1,0 },
		},
		onMouseClicked = [[iGoodsSelect2 = ]]..Index..[[;MainUI_ScarEvent("DTM4_TradeMenuNumClear()")]],
		;
		{
			type = "Frame",
			Layout =
{
pos_XY = {x=2/800, y=2/450, xr="scr", yr="scr",},
},
			;
			CreateGoodsGraphicFrame(Index),
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=43/800, y=19/450, xr="scr", yr="scr",},
					size_WH = { w=15/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "SGItem"..Index.."Num",
				Text =
				{
					text = "-",
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
					pos_XY = {x=29/800, y=3/450, xr="scr", yr="scr",},
					size_WH = { w=62/800, h = 13/450, wr = "scr", hr = "scr",},
				},
				name = "SGItem"..Index.."Name",
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
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=74/800, y=19/450, xr="scr", yr="scr",},
					size_WH = { w=21/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "SGItem"..Index.."Price",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
        	vAlign = "Middle",
        	hAlign = "Left",
					color = {255,255,255,255,},
					minShrink = 0.25,
				},
			},
		},
	}
    return CHTT
end

function CreateStationShipFactoryItem(Index)
	if (shiplist[Index]~=nil) then
    local MouseEvent1 = "iShipSelect2 = "..Index
    local CHTT =
		{
			type = "RadioButton",
	  	Layout =
      {
        size_WH = { w=100/800, h = 55/450, wr = "scr", hr = "scr",},
      },
			name = "SSItem"..Index,
			soundOnEnter = "SFX_ButtonEnter",
			soundOnClicked = "SFX_ButtonClick",
      DefaultGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_dflt.tga",
        uvRect = { 0,1,1,0 },
      },
      OverGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_pass.tga",
        uvRect = { 0,1,1,0 },
      },
      PressedGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_down.tga",
        uvRect = { 0,1,1,0 },
      },

			onMouseClicked = MouseEvent1,
			;
			{
				type = "Frame",
				Layout =
				{
					pos_XY = {x=2/800, y=0/450, xr="scr", yr="scr",},
				},
				;
				CreateShipsGraphicFrame(Index),  --使用帮助2：去掉"--"解锁舰船缩略图的显示(F3，后面还有)
				{
					type = "TextLabel",
					Layout =
					{
						pos_XY = {x=65/800, y=15/450, xr="scr", yr="scr",},
						size_WH = { w=30/800, h = 12/450, wr = "scr", hr = "scr",},
					},
					name = "SSItem"..Index.."Num",
					Text =
					{
						text = "-",
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
						pos_XY = {x=3/800, y=2/450, xr="scr", yr="scr",},
						size_WH = { w=90/800, h = 11/450, wr = "scr", hr = "scr",},
					},
					name = "SSItem"..Index.."Name",
					Text =
					{
						textStyle = "RM_ShipInfoLabel_TextStyle",
						text = shiplist[Index].realname,
						color = { 255, 255, 255, 255, },
						hAlign = "Center",
						vAlign = "Middle",
						minShrink = 0.25,
					},
				},
				{
					type = "TextLabel",
					Layout =
					{
						pos_XY = {x=15/800, y=43/450, xr="scr", yr="scr",},
						size_WH = { w=80/800, h = 12/450, wr = "scr", hr = "scr",},
					},
					name = "SSItem"..Index.."Price",
					Text =
					{
						textStyle = "RM_ShipInfoLabel_TextStyle",
	        	vAlign = "Middle",
	        	hAlign = "Left",
						color = {255,255,255,255,},
						minShrink = 0.25,
					},
				},
			},
		}
    return CHTT
	else
    local MouseEvent1 = "iShipSelect2 = "..Index
    local CHTT =
		{
			type = "RadioButton",
	  	Layout =
      {
        pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
        size_WH = { w=100/800, h = 55/450, wr = "scr", hr = "scr",},
      },
			name = "SFItem"..Index,
			soundOnEnter = "SFX_ButtonEnter",
			soundOnClicked = "SFX_ButtonClick",
      DefaultGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_dflt.tga",
        uvRect = { 0,1,1,0 },
      },
      OverGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_pass.tga",
        uvRect = { 0,1,1,0 },
      },
      PressedGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_down.tga",
        uvRect = { 0,1,1,0 },
      },
			onMouseClicked = MouseEvent1,
			;
			{
				type = "Frame",
				Layout =
{
pos_XY = {x=2/800, y=0/450, xr="scr", yr="scr",},
},
				;
				CreateFactoryGraphicFrame(Index-DTM4_GetTableNum(shiplist)),  --使用帮助2：去掉"--"解锁舰船缩略图的显示(F3，后面还有)
				{
					type = "TextLabel",
					Layout =
					{
						pos_XY = {x=65/800, y=15/450, xr="scr", yr="scr",},
						size_WH = { w=30/800, h = 12/450, wr = "scr", hr = "scr",},
					},
					name = "SFItem"..Index.."Num",
					Text =
					{
						text = "-",
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
						pos_XY = {x=3/800, y=2/450, xr="scr", yr="scr",},
						size_WH = { w=90/800, h = 11/450, wr = "scr", hr = "scr",},
					},
					name = "SFItem"..Index.."Name",
					Text =
					{
						textStyle = "RM_ShipInfoLabel_TextStyle",
						text = Factory[Index-DTM4_GetTableNum(shiplist)].Name,
						color = { 255, 255, 255, 255, },
						hAlign = "Center",
						vAlign = "Middle",
						minShrink = 0.25,
					},
				},
				{
					type = "TextLabel",
					Layout =
					{
						pos_XY = {x=15/800, y=43/450, xr="scr", yr="scr",},
						size_WH = { w=80/800, h = 12/450, wr = "scr", hr = "scr",},
					},
					name = "SFItem"..Index.."Price",
					Text =
					{
						textStyle = "RM_ShipInfoLabel_TextStyle",
	        	vAlign = "Middle",
	        	hAlign = "Left",
						color = {255,255,255,255,},
						minShrink = 0.25,
					},
				},
			},
		}
    return CHTT
  end
end

function CreateShipGoodsItem(Index)
    local CHTT =
	{
		type = "RadioButton",
	  	Layout =
      {
        size_WH = { w=100/800, h = 32/450, wr = "scr", hr = "scr",},
      },
		name = "FGItem"..Index,
		soundOnEnter = "SFX_ButtonEnter",
		soundOnClicked = "SFX_ButtonClick",
	  DefaultGraphic =
	  {
	  	Layout =
      {
        pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
        size_WH = { w=100/800, h = 30/450, wr = "scr", hr = "scr",},
      },
			texture = "locale:ui\\rpg\\gooditem_dflt.tga",
			uvRect = { 0,1,1,0 },
		},
		OverGraphic =
		{
	  	Layout =
      {
        pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
        size_WH = { w=100/800, h = 30/450, wr = "scr", hr = "scr",},
      },
			texture = "locale:ui\\rpg\\gooditem_pass.tga",
			uvRect = { 0,1,1,0 },
		},
		PressedGraphic =
		{
	  	Layout =
      {
        pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
        size_WH = { w=100/800, h = 30/450, wr = "scr", hr = "scr",},
      },
			texture = "locale:ui\\rpg\\gooditem_down.tga",
			uvRect = { 0,1,1,0 },
		},
		onMouseClicked = [[iGoodsSelect1 = ]]..Index..[[;MainUI_ScarEvent("DTM4_TradeMenuNumClear()")]],
		;
		{
			type = "Frame",
			Layout =
			{
				pos_XY = {x=2/800, y=2/450, xr="scr", yr="scr",},
			},
			;
			CreateGoodsGraphicFrame(Index),--使用帮助1：这里一样
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=43/800, y=19/450, xr="scr", yr="scr",},
					size_WH = { w=15/800, h = 9/450, wr = "scr", hr = "scr",},
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
					pos_XY = {x=29/800, y=3/450, xr="scr", yr="scr",},
					size_WH = { w=62/800, h = 13/450, wr = "scr", hr = "scr",},
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
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=74/800, y=19/450, xr="scr", yr="scr",},
					size_WH = { w=21/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "FGItem"..Index.."Price",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
        	vAlign = "Middle",
        	hAlign = "Left",
					color = {255,255,255,255,},
					minShrink = 0.25,
				},
			},
		},
	}
    return CHTT
end

function CreateFleetShipFactoryItem(Index)
    local MouseEvent1 = "iShipSelect1 = "..Index
    local CHTT =
	{
			type = "RadioButton",
	  	Layout =
			{
				size_WH = { w=100/800, h = 55/450, wr = "scr", hr = "scr",},
			},
			name = "FFItem"..Index,
			soundOnEnter = "SFX_ButtonEnter",
			soundOnClicked = "SFX_ButtonClick",
      DefaultGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_dflt.tga",
        uvRect = { 0,1,1,0 },
      },
      OverGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_pass.tga",
        uvRect = { 0,1,1,0 },
      },
      PressedGraphic =
      {
        Layout =
        {
          pos_XY = {x=0/800, y=1/450, xr="scr", yr="scr",},
          size_WH = { w=100/800, h = 53/450, wr = "scr", hr = "scr",},
        },
        texture = "locale:ui\\rpg\\shipitem_down.tga",
        uvRect = { 0,1,1,0 },
      },
			onMouseClicked = MouseEvent1,
			;
			{
				type = "Frame",
				Layout =
				{
					pos_XY = {x=2/800, y=0/450, xr="scr", yr="scr",},
				},
				;
				CreateFactoryGraphicFrame(Index),--使用帮助2：这里一样
				{
    			type = "TextLabel",
					Layout =
					{
						pos_XY = {x=65/800, y=15/450, xr="scr", yr="scr",},
						size_WH = { w=30/800, h = 12/450, wr = "scr", hr = "scr",},
					},
					name = "FFItem"..Index.."Num",
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
						pos_XY = {x=3/800, y=2/450, xr="scr", yr="scr",},
						size_WH = { w=90/800, h = 11/450, wr = "scr", hr = "scr",},
					},
					name = "FFItem"..Index.."Name",
					Text =
					{
						textStyle = "RM_ShipInfoLabel_TextStyle",
						text = Factory[Index].Name,
						color = { 255, 255, 255, 255, },
						hAlign = "Center",
						vAlign = "Middle",
						minShrink = 0.25,
					},
				},
				{
					type = "TextLabel",
					Layout =
					{
						pos_XY = {x=15/800, y=43/450, xr="scr", yr="scr",},
						size_WH = { w=80/800, h = 12/450, wr = "scr", hr = "scr",},
					},
					name = "FFItem"..Index.."Price",
					Text =
					{
						textStyle = "RM_ShipInfoLabel_TextStyle",
	        	vAlign = "Middle",
	        	hAlign = "Left",
						color = {255,255,255,255,},
						minShrink = 0.25,
					},
				},
			},
	}
    return CHTT
end
TradeMenu =
{
	  	Layout =
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=800/800, h = 450/450, wr = "scr", hr = "scr",},
},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,
	Regions =
	{
		{
			196,
			100,
			408,
			400,
		},
	},
	onLoad =
	[[
		iPosition1 = {-262,-262,-262,-262,-262,-262,-262,-262,-254,-204,-154,-104, -54,  -4,  46,  96, 136, 166, 186, 196}
		iPosition2 = { 801, 801, 801, 801, 801, 801, 801, 801, 793, 743, 693, 643, 593, 543, 493, 443, 403, 373, 353, 343}
		iPosition3 = {-1400/3,-1400/3,-1400/3,-1400/3,-1400/3,-1400/3,-1400/3,-1250/3,-1100/3, -950/3, -800/3, -650/3, -500/3,-350/3,-200/3, -50/3,  75/3, 175/3, 250/3, 100}
		iPosition4 = { 2000/3, 2000/3, 2000/3, 2000/3, 2000/3, 2000/3, 2000/3, 1850/3, 1700/3, 1550/3, 1400/3, 1250/3, 1100/3, 950/3, 800/3, 650/3, 525/3, 425/3, 350/3, 100}
	]],
	onShow =
	[[
		dofilepath("data:scripts/SCAR/SCAR_Util.lua")
		dofilepath("locale:tradedatalocale.lua")
		dofilepath("locale:SellPosition.lua")
		dofilepath("locale:factory.lua")
		dofilepath("data:scripts/SCAR/SCAR_Util.lua")
		dofilepath("data:leveldata/campaign/tutorial/RPG/script/code_usefulfunctions.lua")
		dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_good.lua")
		dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_ship.lua")
		dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_station.lua")
		dofilepath("data:leveldata/campaign/tutorial/RPG/script/trade_factory.lua")
		dofilepath("locale:tradetext.lua")
		iSwitch = 0
		iP1 = 1
		iP2 = 0
		iP3 = 20
		iP4 = 20
		iShipSelect1 = 0
		iShipSelect2 = 0
		iGoodsSelect1 = 0
		iGoodsSelect2 = 0
		iShipSelected1 = 0
		iShipSelected2 = 0
		iGoodsSelected1 = 0
		iGoodsSelected2 = 0
		UI_SetElementEnabled("TradeMenu","SellShipButton",0)
		UI_SetElementEnabled("TradeMenu","BuyShipButton",0)
		UI_SetElementEnabled("TradeMenu","SellGoodsButton",0)
		UI_SetElementEnabled("TradeMenu","BuyGoodsButton",0)
		iShipClear1 = 1
		iShipClear2 = 1
		iGoodClear1 = 1
		iGoodClear2 = 1
		UI_HideScreen("NewTaskbar")
		MainUI_ScarEvent("DTM4_TradeMenuNumClear()")
	]],
	onUpdate =
	[[
--显示
		if (UI_IsNamedElementVisible("TradeMenu","close1")==1) then
				UI_SetElementVisible("TradeMenu","close1",0)
				iSwitch = 3
				UI_SetElementVisible("TradeMenu","SwitchToGood",0)
		end
		if (UI_IsNamedElementVisible("TradeMenu","close2")==1) then
				UI_SetElementVisible("TradeMenu","close2",0)
				iSwitch = 4
				UI_SetElementVisible("TradeMenu","SwitchToShip",0)
		end
		if(iSwitch==0) then
			if (iP1<=20) then
				UI_SetElementPosition("TradeMenu","ShipMenuLeft",iPosition1[iP1],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuRight",iPosition2[iP1],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuLeftButtons",iPosition1[iP1]+139,100/3+740/3)
				UI_SetElementPosition("TradeMenu","FSDescBox",iPosition1[iP1]+144,100/3+40)
				iP1 = iP1 + 1
			elseif (iP1>20)and(iSwitch==0) then
				UI_SetElementVisible("TradeMenu","SwitchToGood",1)
				iSwitch = 2
			end
		elseif(iSwitch==1) then
			if (iP2<=0) then
				iP2 = 1
			end
--舰船to商品
			if (iP2<=20) then
				UI_SetElementPosition("TradeMenu","ShipMenuLeft",iPosition1[21-iP2],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuRight",iPosition2[21-iP2],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuLeftButtons",iPosition1[21-iP2]+139,100/3+740/3)
				UI_SetElementPosition("TradeMenu","FSDescBox",iPosition1[21-iP2]+144,100/3+40)
				UI_SetElementPosition("TradeMenu","GoodMenuLeft",196,iPosition3[iP2]-200/3)
				UI_SetElementPosition("TradeMenu","GoodMenuRight",343,iPosition4[iP2]-200/3)
				UI_SetElementPosition("TradeMenu","GoodMenuLeftButtons",335,iPosition3[iP2]+460/3-200/3)
				UI_SetElementPosition("TradeMenu","FGDescBox",340,iPosition3[iP2]+40-200/3)
				iP2 = iP2 + 1
			elseif (iP2>20)and(iSwitch==1) then
				UI_SetElementVisible("TradeMenu","SwitchToShip",1)
				UI_SetElementVisible("TradeMenu","ShipsMenu",0)
				iP2 = iP2 + 1
			end
		elseif (iSwitch==2) then
--商品to舰船
			if (iP2>=21) then
				iP2 = 20
			end
			if (iP2>0) then
				UI_SetElementPosition("TradeMenu","ShipMenuLeft",iPosition1[21-iP2],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuRight",iPosition2[21-iP2],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuLeftButtons",iPosition1[21-iP2]+139,100/3+740/3)
				UI_SetElementPosition("TradeMenu","FSDescBox",iPosition1[21-iP2]+144,100/3+40)
				UI_SetElementPosition("TradeMenu","GoodMenuLeft",196,iPosition3[iP2]-200/3)
				UI_SetElementPosition("TradeMenu","GoodMenuRight",343,iPosition4[iP2]-200/3)
				UI_SetElementPosition("TradeMenu","GoodMenuLeftButtons",335,iPosition3[iP2]+460/3-200/3)
				UI_SetElementPosition("TradeMenu","FGDescBox",340,iPosition3[iP2]+40-200/3)
				iP2 = iP2 - 1
			elseif (iP2==0)and(iSwitch==2) then
				UI_SetElementVisible("TradeMenu","SwitchToGood",1)
				UI_SetElementVisible("TradeMenu","GoodsMenu",0)
				iP2 = iP2 - 1
			end
--从舰船界面退出
		elseif (iSwitch==3) then
			if (iP4>0) then
				UI_SetElementPosition("TradeMenu","ShipMenuLeft",iPosition1[iP4],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuRight",iPosition2[iP4],100/3)
				UI_SetElementPosition("TradeMenu","ShipMenuLeftButtons",iPosition1[iP4]+139,100/3+740/3)
				UI_SetElementPosition("TradeMenu","FSDescBox",iPosition1[iP4]+144,100/3+40)
				iP4 = iP4 - 1
			elseif (iP4==0)and(iSwitch==3) then
				UI_HideScreen("TradeMenu")
				MainUI_ScarEvent("Universe_SlowDown(1, 0)")
				MainUI_ScarEvent("DTM4_TradeMenuClosed()")
				iP4 = iP4 - 1
			end
--从商品界面退出
		else
			if (iP3>0) then
				UI_SetElementPosition("TradeMenu","GoodMenuLeft",196,iPosition3[iP3]-200/3)
				UI_SetElementPosition("TradeMenu","GoodMenuRight",343,iPosition4[iP3]-200/3)
				UI_SetElementPosition("TradeMenu","GoodMenuLeftButtons",335,iPosition3[iP3]+460/3-200/3)
				UI_SetElementPosition("TradeMenu","FGDescBox",340,iPosition3[iP3]+40-200/3)
				iP3 = iP3 - 1
			elseif (iP3==0)and(iSwitch==4) then
				UI_SetElementVisible("TradeMenu","GoodsMenu",0)
				UI_SetElementVisible("TradeMenu","ShipsMenu",1)
				UI_HideScreen("TradeMenu")
				MainUI_ScarEvent("Universe_SlowDown(1, 0)")
				MainUI_ScarEvent("DTM4_TradeMenuClosed()")
				iP3 = iP3 - 1
			end
		end
		if (iShipSelect1~=iShipSelected1) then
			if (iShipSelected1~=0) then
				UI_SetElementVisible("TradeMenu","FF"..iShipSelected1.."Graph",0)
				UI_SetElementVisible("TradeMenu","FF"..iShipSelect1.."Graph",1)
				UI_SetTextLabelText("TradeMenu","FSName",Factory[iShipSelect1].Name)
				MainUI_ScarEvent("UI_SetTextLabelText('TradeMenu','FSDesc',DTM004[87]("..iShipSelect1.."))")
			end
			iShipSelected1 = iShipSelect1
			if (iShipSelected2~=0) then
				if (shiplist[iShipSelected2]~=nil) then
					UI_SetButtonPressed("TradeMenu","SSItem"..iShipSelected2,0)
					UI_SetElementVisible("TradeMenu","SS"..iShipSelected2.."Graph",0)
				else
					UI_SetButtonPressed("TradeMenu","SFItem"..iShipSelected2,0)
					UI_SetElementVisible("TradeMenu","SF"..iShipSelected2.."Graph",0)
				end
				UI_SetTextLabelText("TradeMenu","SSCap","")
				UI_SetTextLabelText("TradeMenu","SSTA","")
				UI_SetTextLabelText("TradeMenu","SSTS","")
				UI_SetTextLabelText("TradeMenu","SSPP","")
				UI_SetTextLabelText("TradeMenu","SSCost","")
				UI_SetTextLabelText("TradeMenu","SSDesc","")
				UI_SetTextLabelText("TradeMenu","SSName","")
				iShipSelected2 = 0
				iShipSelect2 = 0
			end
			UI_SetElementEnabled("TradeMenu","SellShipButton",1)
			UI_SetElementEnabled("TradeMenu","BuyShipButton",0)
		end
		if (iShipSelect2~=iShipSelected2) then
			if (iShipSelected2~=0) then
				if (shiplist[iShipSelected2]~=nil) then
					UI_SetElementVisible("TradeMenu","SS"..iShipSelected2.."Graph",0)
				else
					UI_SetElementVisible("TradeMenu","SF"..iShipSelected2.."Graph",0)
				end
			end
			if (shiplist[iShipSelect2]~=nil) then
				UI_SetElementVisible("TradeMenu","SS"..iShipSelect2.."Graph",1)
				UI_SetTextLabelText("TradeMenu","SSDesc",shiplist[iShipSelect2].Description)
				UI_SetTextLabelText("TradeMenu","SSName",shiplist[iShipSelect2].realname)
			else
				UI_SetElementVisible("TradeMenu","SF"..iShipSelect2.."Graph",1)
				UI_SetTextLabelText("TradeMenu","SSName",Factory[iShipSelect2-getn(shiplist)].Name)
				MainUI_ScarEvent("UI_SetTextLabelText('TradeMenu','SSDesc',DTM004[87]("..(iShipSelect2-getn(shiplist)).."))")
			end
			iShipSelected2 = iShipSelect2
			if (iShipSelected1~=0) then
				if (shiplist[iShipSelected1]~=nil) then
					UI_SetButtonPressed("TradeMenu","FSItem"..iShipSelected1,0)
					UI_SetElementVisible("TradeMenu","FS"..iShipSelected1.."Graph",0)
				else
					UI_SetButtonPressed("TradeMenu","FFItem"..iShipSelected1,0)
					UI_SetElementVisible("TradeMenu","FF"..iShipSelected1.."Graph",0)
				end
				UI_SetTextLabelText("TradeMenu","FSDesc","")
				UI_SetTextLabelText("TradeMenu","FSName","")
				iShipSelected1 = 0
				iShipSelect1 = 0
			end
			UI_SetElementEnabled("TradeMenu","SellShipButton",0)
			UI_SetElementEnabled("TradeMenu","BuyShipButton",1)

		end
		if (iGoodsSelect1~=iGoodsSelected1) then
			if (iGoodsSelected1~=0) then
				UI_SetElementVisible("TradeMenu","FG"..iGoodsSelected1.."Graph",0)
			end
			UI_SetElementVisible("TradeMenu","FG"..iGoodsSelect1.."Graph",1)
			UI_SetTextLabelText("TradeMenu","FGName",Goods[iGoodsSelect1].name)
			MainUI_ScarEvent("UI_SetTextLabelText('TradeMenu','FGDesc',DTM004[1]("..iGoodsSelect1.."))")
			MainUI_ScarEvent("g_MaxSellNum = g_goods["..iGoodsSelect1.."]")
			MainUI_ScarEvent("UI_SetTextLabelText('TradeMenu','SellGoodsNum','(0-'..g_goods["..iGoodsSelect1.."]..')')")
			iGoodsSelected1 = iGoodsSelect1

			if (iGoodsSelected2~=0) then
				UI_SetButtonPressed("TradeMenu","SGItem"..iGoodsSelected2,0)
				UI_SetElementVisible("TradeMenu","SG"..iGoodsSelected2.."Graph",0)
				UI_SetTextLabelText("TradeMenu","SGWeight","")
				UI_SetTextLabelText("TradeMenu","SGDesc","")
				UI_SetTextLabelText("TradeMenu","SGName","")
				iGoodsSelected2 = 0
				iGoodsSelect2 = 0
			end
			UI_SetElementEnabled("TradeMenu","SellGoodsButton",1)
			UI_SetElementEnabled("TradeMenu","BuyGoodsButton",0)
		end
		if (iGoodsSelect2~=iGoodsSelected2) then
			if (iGoodsSelected2~=0) then
				UI_SetElementVisible("TradeMenu","SG"..iGoodsSelected2.."Graph",0)
			end
			UI_SetElementVisible("TradeMenu","SG"..iGoodsSelect2.."Graph",1)
			UI_SetTextLabelText("TradeMenu","SGName",Goods[iGoodsSelect2].name)
			MainUI_ScarEvent("UI_SetTextLabelText('TradeMenu','SGDesc',DTM004[1]("..iGoodsSelect2.."))")
			MainUI_ScarEvent("g_MaxBuyNum = DTM4_MaxBuyNum("..iGoodsSelect2..")")
			MainUI_ScarEvent("UI_SetTextLabelText('TradeMenu','BuyGoodsNum','(0-'..DTM4_MaxBuyNum("..iGoodsSelect2..")..')')")
			iGoodsSelected2 = iGoodsSelect2

			if (iGoodsSelected1~=0) then
				UI_SetButtonPressed("TradeMenu","FGItem"..iGoodsSelected1,0)
				UI_SetElementVisible("TradeMenu","FG"..iGoodsSelected1.."Graph",0)
				UI_SetTextLabelText("TradeMenu","FGDesc","")
				UI_SetTextLabelText("TradeMenu","FGName","")
				iGoodsSelected1 = 0
				iGoodsSelect1 = 0
			end
			UI_SetElementEnabled("TradeMenu","SellGoodsButton",0)
			UI_SetElementEnabled("TradeMenu","BuyGoodsButton",1)
		end

		if (UI_IsNamedElementVisible("TradeMenu","FGINT")==1) then
			UI_SetElementVisible("TradeMenu","FGINT",0)
			UI_SetElementEnabled("TradeMenu","SellGoodsButton",0)
			if (iGoodsSelected1~=0) then
				UI_SetElementVisible("TradeMenu","FG"..iGoodsSelected1.."Graph",0)
				UI_SetButtonPressed("TradeMenu","FGItem"..iGoodsSelected1,0)
				UI_SetTextLabelText("TradeMenu","FGDesc","")
				UI_SetTextLabelText("TradeMenu","FGName","")
				iGoodsSelected1 = 0
				iGoodsSelect1 = 0
			end
		end
	]],
	onHide = [[
							while (UI_IsNamedElementVisible("TradeMenu","FS"..iShipClear1.."Graph")==0)and(shiplist[iShipClear1]~=nil) do
									iShipClear1 = iShipClear1 + 1
							end
							if (shiplist[iShipClear1]~=nil) then
								UI_SetElementVisible("TradeMenu","FS"..iShipClear1.."Graph",0)
								UI_SetButtonPressed("TradeMenu","FSItem"..iShipClear1,0)
							else
								while (UI_IsNamedElementVisible("TradeMenu","FF"..iShipClear1.."Graph")==0)and(Factory[iShipClear1]~=nil) do
									iShipClear1 = iShipClear1 + 1
								end
								if (Factory[iShipClear1]~=nil) then
									UI_SetElementVisible("TradeMenu","FF"..iShipClear1.."Graph",0)
									UI_SetButtonPressed("TradeMenu","FFItem"..iShipClear1,0)
								end
							end

							while (UI_IsNamedElementVisible("TradeMenu","FG"..iGoodClear1.."Graph")==0)and(Goods[iGoodClear1]~=nil) do
								iGoodClear1 = iGoodClear1 + 1
							end
							if (Goods[iGoodClear1]~=nil) then
								UI_SetElementVisible("TradeMenu","FG"..iGoodClear1.."Graph",0)
								UI_SetButtonPressed("TradeMenu","FGItem"..iGoodClear1,0)
							end

							while (UI_IsNamedElementVisible("TradeMenu","SS"..iShipClear2.."Graph")==0)and(shiplist[iShipClear2]~=nil) do
								iShipClear2 = iShipClear2 + 1
							end
							if (shiplist[iShipClear2]~=nil) then
								UI_SetElementVisible("TradeMenu","SS"..iShipClear2.."Graph",0)
								UI_SetButtonPressed("TradeMenu","SSItem"..iShipClear2,0)
							else
								while (UI_IsNamedElementVisible("TradeMenu","SF"..iShipClear2.."Graph")==0)and(Factory[iShipClear2-getn(shiplist)]~=nil) do
									iShipClear2 = iShipClear2 + 1
								end
								if (Factory[iShipClear2-getn(shiplist)]~=nil) then
									UI_SetElementVisible("TradeMenu","SF"..iShipClear2.."Graph",0)
									UI_SetButtonPressed("TradeMenu","SFItem"..iShipClear2,0)
								end
							end

							while (UI_IsNamedElementVisible("TradeMenu","SG"..iGoodClear2.."Graph")==0)and(Goods[iGoodClear2]~=nil) do
								iGoodClear2 = iGoodClear2 + 1
							end
							if (Goods[iGoodClear2]~=nil) then
								UI_SetElementVisible("TradeMenu","SG"..iGoodClear2.."Graph",0)
								UI_SetButtonPressed("TradeMenu","SGItem"..iGoodClear2,0)
							end
							UI_ShowScreen("NewTaskbar", ePopup)
					 ]],
	;
	{
		type = "Frame",
		Layout =
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=800/800, h = 450/450, wr = "scr", hr = "scr",},
},
		name = "ShipsMenu",
		;
		--舰队船只菜单
		{
			type = "Frame",
		Layout =
{
pos_XY = {x=-262/800, y=100/45, xr="scr", yr="scr",},
size_WH = { w=260/800, h = 400/450, wr = "scr", hr = "scr",},
},
			name = "ShipMenuLeft",
	    BackgroundGraphic =
	    {
	        type = "Graphic",
	        texture = "locale:ui\\rpg\\\\shipmenuleft.tga",
					uvRect = { 0,1,1,0 },
	    },
	    ;
	    CreateFleetShipList(),
	    CreateFleetShipBigImage(),
			{
				type = "TextLabel",
				Layout =
{
pos_XY = {x=150/800, y=17/450, xr="scr", yr="scr",},
size_WH = { w=85/800, h = 9/450, wr = "scr", hr = "scr",},
},
				name = "FSName",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = { 255, 255, 255, 255, },
					hAlign = "Center",
					vAlign = "Middle",
					minShrink = 0.25,
				},
			},
			{
				type = "Frame",
				Layout =
				{
					pos_XY = {x=49/800, y=380/450, xr="scr", yr="scr",},
				},
				name = "GoodsWeightProgress1",
		    backgroundColor = {255,120,0,255,},
			},
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=49/800, y=387/450, xr="scr", yr="scr",},
					size_WH = { w=37/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "GoodsWeight1",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					vAlign = "Middle",
					hAlign = "Right",
					color = {255,255,255,255,},
					minShrink = 0.25,
				},
			},
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=86/800, y=387/450, xr="scr", yr="scr",},
					size_WH = { w=6/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					text = "/",
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
					pos_XY = {x=92/800, y=387/450, xr="scr", yr="scr",},
					size_WH = { w=37/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "WeightLimit1",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					vAlign = "Middle",
					hAlign = "Left",
					color = {255,255,255,255,},
					minShrink = 0.25,
				},
			},
	  },
	  --贸易站船只菜单
		{
			type = "Frame",
			Layout =
			{
				pos_XY = {x=801/800, y=100/450, xr="scr", yr="scr",},
				size_WH = { w=260/800, h = 400/450, wr = "scr", hr = "scr",},
			},
			name = "ShipMenuRight",
	    BackgroundGraphic =
	    {
	        type = "Graphic",
	        texture = "locale:ui\\rpg\\\\shipmenuright.tga",
					uvRect = { 0,1,1,0 },
	    },
	    ;
	    CreateStationShipList(),
	    CreateStationShipBigImage(),
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=10/800, y=294/450, xr="scr", yr="scr",},
					size_WH = { w=85/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "SSName",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = { 255, 255, 255, 255, },
					hAlign = "Center",
					vAlign = "Middle",
					minShrink = 0.25,
				},
			},
			CreateStationShipDesc(),
			CreateBuyShipButton(),
			{
	    	type = "Button",
	    	Layout =
				{
					pos_XY = {x=197/800, y=2/450, xr="scr", yr="scr",},
					size_WH = { w=56/800, h = 19/450, wr = "scr", hr = "scr",},
				},
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic =
	    	{
					texture = "locale:ui\\rpg\\exit_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic =
				{
					texture = "locale:ui\\rpg\\exit_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic =
				{
					texture = "locale:ui\\rpg\\exit_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked =
				[[
					iSwitch = 3
					UI_SetElementVisible("TradeMenu","SwitchToGood",0)
				]],
			},
	  },
		CreateMenuSwitchButton2(),
		--舰队船只按键组
		{
			type = "Frame",
		Layout =
{
pos_XY = {x=-123/800, y=285/450, xr="scr", yr="scr",},
size_WH = { w=50/800, h = 30/450, wr = "scr", hr = "scr",},
},
			name = "ShipMenuLeftButtons",
	    ;
			CreateSellShipButton(),
	  },
	  --舰队船只说明
		CreateFleetShipDesc(),
	},
	{
		type = "Frame",
		Layout =
{
pos_XY = {x=0/800, y=0/450, xr="scr", yr="scr",},
size_WH = { w=800/800, h = 450/450, wr = "scr", hr = "scr",},
},
		name = "GoodsMenu",
		visible = 0,
		;
		--舰队货物菜单
		{
			type = "Frame",
			Layout =
{
pos_XY = {x=196/800, y=-420/450, xr="scr", yr="scr",},
size_WH = { w=260/800, h = 400/450, wr = "scr", hr = "scr",},
},
			name = "GoodMenuLeft",
	    BackgroundGraphic =
	    {
	        type = "Graphic",
	        texture = "locale:ui\\rpg\\\\goodmenuleft.tga",
					uvRect = { 0,1,1,0 },
	    },
	    ;
	    CreateFleetGoodsList(),
	    CreateFleetGoodsBigImage(),
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=150/800, y=17/450, xr="scr", yr="scr",},
					size_WH = { w=85/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "FGName",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = { 255, 255, 255, 255, },
					hAlign = "Center",
					vAlign = "Middle",
					minShrink = 0.25,
				},
			},
			{
				type = "Frame",
				Layout =
				{
					pos_XY = {x=49/800, y=380/450, xr="scr", yr="scr",},
				},
				name = "GoodsWeightProgress2",
		    backgroundColor = {255,120,0,255,},
			},
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=49/800, y=387/450, xr="scr", yr="scr",},
					size_WH = { w=37/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "GoodsWeight2",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					vAlign = "Middle",
					hAlign = "Right",
					color = {255,255,255,255,},
					minShrink = 0.25,
				},
			},
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=86/800, y=387/450, xr="scr", yr="scr",},
					size_WH = { w=6/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					text = "/",
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
					pos_XY = {x=92/800, y=387/450, xr="scr", yr="scr",},
					size_WH = { w=37/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "WeightLimit2",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					vAlign = "Middle",
					hAlign = "Left",
					color = {255,255,255,255,},
					minShrink = 0.25,
				},
			},
	  },
	  --贸易站货物菜单
		{
			type = "Frame",
			Layout =
			{
				pos_XY = {x=343/800, y=820/450, xr="scr", yr="scr",},
				size_WH = { w=260/800, h = 400/450, wr = "scr", hr = "scr",},
			},
			name = "GoodMenuRight",
	    BackgroundGraphic =
	    {
	        type = "Graphic",
	        texture = "locale:ui\\rpg\\\\goodmenuright.tga",
					uvRect = { 0,1,1,0 },
	    },
	    ;
		  CreateStationGoodsList(),
	    CreateStationGoodsBigImage(),
			{
				type = "TextLabel",
				Layout =
				{
					pos_XY = {x=10/800, y=294/450, xr="scr", yr="scr",},
					size_WH = { w=85/800, h = 9/450, wr = "scr", hr = "scr",},
				},
				name = "SGName",
				Text =
				{
					textStyle = "RM_ShipInfoLabel_TextStyle",
					color = { 255, 255, 255, 255, },
					hAlign = "Center",
					vAlign = "Middle",
					minShrink = 0.25,
				},
			},
			CreateStationGoodsDesc(),
			{
	    	type = "Button",
	    	Layout =
				{
					pos_XY = {x=197/800, y=2/450, xr="scr", yr="scr",},
					size_WH = { w=56/800, h = 19/450, wr = "scr", hr = "scr",},
				},
				soundOnEnter = "SFX_ButtonEnter",
				soundOnClicked = "SFX_ButtonClick",
	    	DefaultGraphic =
	    	{
					texture = "locale:ui\\rpg\\exit_dflt.tga",
					uvRect = { 0,1,1,0 },
				},
					OverGraphic =
				{
					texture = "locale:ui\\rpg\\exit_pass.tga",
					uvRect = { 0,1,1,0 },
				},
				PressedGraphic =
				{
					texture = "locale:ui\\rpg\\exit_down.tga",
					uvRect = { 0,1,1,0 },
				},
				onMouseClicked =
				[[
					iSwitch = 4
					UI_SetElementVisible("TradeMenu","SwitchToShip",0)
				]],
			},
			CreateBuyNumFrame(),
			CreateBuyGoodsButton(),
			CreateDELButton1(),
			CreateACButton1(),
	  },
		CreateMenuSwitchButton1(),
		--舰队货物按键组
		{
			type = "Frame",
			Layout =
			{
				pos_XY = {x=335/800, y=-305/450, xr="scr", yr="scr",},
				size_WH = { w=50/800, h = 90/450, wr = "scr", hr = "scr",},
			},
			name = "GoodMenuLeftButtons",
	    ;
			CreateSellNumFrame(),
			CreateSellGoodsButton(),
			CreateDELButton2(),
			CreateACButton2(),
	  },
	  --舰队货物说明
		CreateFleetGoodsDesc(),
	},
		CreateBlindFrame("BuyNum"),
		CreateBlindFrame("SellNum"),
		CreateBlindFrame("FSNone"),
		CreateBlindFrame("SSNone"),
		CreateBlindFrame("FGNone"),
		CreateBlindFrame("SGNone"),
		CreateBlindFrame("FSINT"),
		CreateBlindFrame("FGINT"),
		CreateBlindFrame("close1"),
		CreateBlindFrame("close2"),
}

