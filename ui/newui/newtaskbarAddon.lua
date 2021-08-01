dofilepath("data:scripts/LW_functions.lua")

local tableToEdit=findTableElement(NewTaskbar,{
{"name","frame_LowerLeft"},	
{"name","SelectionMasterFrame"},
{"hideWhenEmpty",1},
{"name","unitname"},
})

tableToEdit.Text.minShrink = 0.25

------------- Ship Rename -------------

tableToEdit = findTableElement(NewTaskbar,{
{"name","frame_LowerLeft"},	
{"name","SelectionMasterFrame"},
})
local Title_Health_Box = tableToEdit[1]
Title_Health_Box.Layout.size_WH.h = 57

local unitname_txt = findTableElement(Title_Health_Box,{
{"name","unitname"},	
})
unitname_txt.Layout.size_WH.h = 20
unitname_txt.Layout.size_WH.hr = "px"
unitname_txt.Layout.pos_XY.y = Title_Health_Box.Layout.size_WH.h - Title_Health_Box.Layout.pad_RB.b - 8
unitname_txt.Layout.pos_XY.yr = "px"
unitname_txt.Layout.pivot_XY = { 0, 1 }

Title_Health_Box[3] = {
  type = "Frame",	
  name = "FX_Ship_Btn_Frame",
	eventOpaque = 0,
	ignored = 1,
	visible = 1,
	hideWhenEmpty = 1,
  Layout = {
    size_WH = {  w=1, h = 23,  wr="par", hr = "px" },
		pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
  },
  arrangetype = "horiz",
  autoarrange = 1,
	arrangedir = 1,
  ;
  {
    type = "ButtonHD",
    buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
    helpTip = "$90110",
    name = "FX_btn_ship_rename",
    cursorType = "Normal",
    Layout = {
      size_WH = { h = 1, hr = "par" },
      lockAspect = 2,
    },
    stateIconOfs = { 0.0, 128/1024 },
    stateIconCells = { 0, 1, 2, 3, 2, 2, 2, 3 },
    IconBase = {
      --size = {4, 4},
      texture = "DATA:UI\\NewUI\\Taskbar\\hudicons\\cmd_ico_ship_naming.dds",
      uvRect = { 4/64, 60/512, 60/64, 4/512 },
      patch_Scale = 1,
      Surface = THREESTATEBUTTONSURFACE,
    },
    soundOnClicked = "SFX_ButtonClick",
    onMouseClicked = [[
  		MainUI_ScarEvent("NameSelected()")
	  ]]
  },
}

if NewTaskbar.onLoad == nil then 
  NewTaskbar.onLoad = ""
end 
NewTaskbar.onLoad = NewTaskbar.onLoad..[[
  -- reinit all these vars to make sure the btn does not show in multiplayer
  FX_UI_SingleShipSelected = nil 
  FX_UI_MultiShipsSelected = nil 
  FX_UI_SubsystemSelected = nil
]]

local unitSingleSelection_frame = findTableElement(NewTaskbar,{
{"name","frame_LowerLeft"},	
{"name","SelectionMasterFrame"},
{"name","unitSingleSelection"},
})
if unitSingleSelection_frame.onUpdate == nil then 
  unitSingleSelection_frame.onUpdate = ""
end
unitSingleSelection_frame.onUpdate = unitSingleSelection_frame.onUpdate..[[
  if FX_UI_SingleShipSelected == nil then 
    FX_UI_SingleShipSelected = 1
    FX_UI_MultiShipsSelected = nil
    FX_UI_SubsystemSelected = nil
    UI_SetElementVisible("NewTaskbar", "FX_btn_ship_rename", 0)
    -- use MainUI_ScarEvent to make it invisible in multiplayer
    MainUI_ScarEvent("UI_SetElementVisible('NewTaskbar', 'FX_btn_ship_rename', 1)")
  end
]]

local UnitMultiSelection_frame = findTableElement(NewTaskbar,{
{"name","frame_LowerLeft"},	
{"name","SelectionMasterFrame"},
{"name","UnitMultiSelection"},
})
if UnitMultiSelection_frame.onUpdate == nil then 
  UnitMultiSelection_frame.onUpdate = ""
end 
UnitMultiSelection_frame.onUpdate = UnitMultiSelection_frame.onUpdate..[[
  if FX_UI_MultiShipsSelected == nil then 
    FX_UI_SingleShipSelected = nil
    FX_UI_MultiShipsSelected = 1
    FX_UI_SubsystemSelected = nil
    UI_SetElementVisible("NewTaskbar", "FX_btn_ship_rename", 0)
  end
]]

local unitSubsystem_frame = findTableElement(NewTaskbar,{
{"name","frame_LowerLeft"},	
{"name","SelectionMasterFrame"},
{"name","unitSubsystem"},
})
if unitSubsystem_frame.onUpdate == nil then 
  unitSubsystem_frame.onUpdate = ""
end 
unitSubsystem_frame.onUpdate = unitSubsystem_frame.onUpdate..[[
  if FX_UI_SubsystemSelected == nil then 
    FX_UI_SingleShipSelected = nil
    FX_UI_MultiShipsSelected = nil
    FX_UI_SubsystemSelected = 1
    UI_SetElementVisible("NewTaskbar", "FX_btn_ship_rename", 0)
  end
]]
------------- Achievement button -------------

tableToEdit = findTableElement(NewTaskbar,{
{"name","frame_UpperLeft"},	
{"name","frame_UpperLeft",2},
})

table.insert(tableToEdit,
	{
		type = "TextButton",
		toggleButton = 1,

		autosize  = 1,
		buttonStyle = "RM_FEButtonStyleFlat",			
		
		disabledTextColor			= {255, 255, 255, 32},	
		Text = {
			textStyle = "RM_MenuButton_TextStyle",
			text = "$90012",
			hAlign = "Center",
			vAlign = "Center",
			dropShadow = 1,
		},
		name = "btnAchievement",
		onMouseClicked = 					
		[[
			if (UI_IsScreenActive('Achievement')==0) then	
				UI_ReloadScreen('Achievement');
			end
			UI_ToggleScreen('Achievement', 0)
		]],

		helpTip = "$90017", 
		helpTipTextLabel = "commandsHelpTip", 
	}
)
			
			
tableToEdit = findTableElement(NewTaskbar,{
{"name","CommandButtonsFrame"},	
{"name","Command_Palette"},	
{"name","specialButtons"},
})

table.insert(tableToEdit,BTN_CMD_SWITCH)
table.insert(tableToEdit,BTN_CMD_DELIVER)
table.insert(tableToEdit,BTN_CMD_RELEASE)
table.insert(tableToEdit,BTN_CMD_TRACKBEAM)
--table.insert(tableToEdit,BTN_CMD_SUPPORT)
tableToEdit = findTableElement(NewTaskbar,{
{"name","frame_LeftPad"},	
})
tableToEdit.Layout.size_WH.h=300
tableToEdit = findTableElement(NewTaskbar,{
{"name","frame_LeftPad"},	
{"name","frame_LeftTabs"},
})

table.insert(tableToEdit,
		{
			type = "ButtonHD",
			toggleButton = 1,
			Layout = {				
				--pos_XY = { x = 312-46, y = 0, xr = "px", yr = "px" },
				size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
			},
			name = "btnOBIntel",
			visible = 0,
			ignored  = 1,

			buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",


			
			stateBaseOfs = { 0.0, 128/1024 },
			stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			BackgroundGraphic = {
					--size = {4, 4},
				texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\hud_fleet_info.dds",					
				uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
				patch_X = { 4,-120, 4,0 },
				patch_Y = { 4,-120,4, 0 },
				--patch_PadX = {3, -3},
				--patch_PadY = {2, -2},
				patch_Scale = 1,			
				Surface = THREESTATEBUTTONSURFACE,

			},
							
			onMouseClicked = [[UI_ToggleScreen( 'OBInfo', 0)]],
			helpTip = "$90113",
			helpTipTextLabel = "commandsHelpTip",
			--hotKeyID = 175,
		}
)
table.insert(tableToEdit,
		{
			type = "ButtonHD",
			toggleButton = 1,
			Layout = {				
				--pos_XY = { x = 312-46, y = 0, xr = "px", yr = "px" },
				size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
			},
			name = "btnMP",
			visible = 0,
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
)
table.insert(tableToEdit,
		{
			type = "ButtonHD",
			Layout = {				
				--pos_XY = { x = 312-46, y = 0, xr = "px", yr = "px" },
				size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
			},
			name = "btnAIContact",
			visible = 0,
			ignored  = 1,

			buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",


			
			stateBaseOfs = { 0.0, 128/1024 },
			stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			BackgroundGraphic = {
					--size = {4, 4},
				texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\menu_ico_diplomacy.dds",					
				uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
				patch_X = { 4,-120, 4,0 },
				patch_Y = { 4,-120,4, 0 },
				--patch_PadX = {3, -3},
				--patch_PadY = {2, -2},
				patch_Scale = 1,			
				Surface = THREESTATEBUTTONSURFACE,

			},
							
			onMouseClicked = [[MainUI_ScarEvent("FX_ContectUIPopup()")]],
				helpTip = "$2746",
				helpTipTextLabel = "commandsHelpTip",
				hotKeyID = 141,
		}
)
table.insert(tableToEdit,
		{
			type = "ButtonHD",
			Layout = {				
				--pos_XY = { x = 312-46, y = 0, xr = "px", yr = "px" },
				size_WH = { w = 32, h = 32, wr = "px", hr = "px" },
			},
			name = "btnCouncilor",
			visible = 0,
			ignored  = 1,

			buttonStyle = "RM_TaskbarHD_CommandButtonToggleStyle",


			
			stateBaseOfs = { 0.0, 128/1024 },
			stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			BackgroundGraphic = {
					--size = {4, 4},
				texture = "DATA:UI\\NewUI\\Taskbar\\HudIcons\\co_commander_btn.dds",					
				uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
				patch_X = { 4,-120, 4,0 },
				patch_Y = { 4,-120,4, 0 },
				--patch_PadX = {3, -3},
				--patch_PadY = {2, -2},
				patch_Scale = 1,			
				Surface = THREESTATEBUTTONSURFACE,

			},
							
			onMouseClicked = [[UI_SetElementVisible("NewTaskbar", "CallCouncilor", 1)]],
			helpTip = "$90112",
			helpTipTextLabel = "commandsHelpTip",
			hotKeyID = 176,
		}
)
table.insert(NewTaskbar,
{ 
    type = "Frame", 
    name = "ShowMusicMenu", 
    visible = 0, 
	Layout = 
	{
		pos_XY = {	x= 0, y= 0, xr="scr", yr="scr",},					
		size_WH = {w = 0, h = 0, wr = "scr", hr = "scr",},
	},
}
)

table.insert(NewTaskbar,
{ 
    type = "Frame", 
    name = "CallCouncilor", 
    visible = 0, 
	Layout = 
	{
		pos_XY = {	x= 0, y= 0, xr="scr", yr="scr",},					
		size_WH = {w = 0, h = 0, wr = "scr", hr = "scr",},
	},
}
)

table.insert(NewTaskbar,
{ 
    type = "Frame", 
    name = "OBInfo", 
    visible = 0, 
	Layout = 
	{
		pos_XY = {	x= 0, y= 0, xr="scr", yr="scr",},					
		size_WH = {w = 0, h = 0, wr = "scr", hr = "scr",},
	},
}
)
