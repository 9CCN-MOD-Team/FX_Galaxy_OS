dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("locale:SkillText.lua")
DTM4_UIFolder = "DATA:leveldata\\campaign\\tutorial\\RPG\\Icon\\ui\\"

function SkillButtonPosition(SkillName)
	if mod(SkillName-1,3)==0 then
		SkillName=floor((SkillName-1)/3)
		local x=0.5+0.25*cos(72*SkillName-90)
		local y=0.48+0.25*sin(72*SkillName-90)
		return x,y
	else
		SkillName=SkillName-ceil(SkillName/3)-1
		local x=0.5+0.4*cos(36*SkillName-108)
		local y=0.48+0.4*sin(36*SkillName-108)
		return x,y
	end
end

function getSkill(SkillName)
  local p_x,p_y = SkillButtonPosition(SkillName)
  local t = {
  		type = "Frame",
		Layout = {
			pos_XY = { x = p_x, y = p_y, xr = "par", yr = "par" },
			size_WH = { w = 0.12, h = 0.16, wr = "par", hr = "par" },
  			pivot_XY = { 0.5,  0.5 },
		    	--pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
		    	--pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
		},
		;
	    {
			type = "TextLabel",
			name = "SkillDesc"..SkillName,
			--wrapping = 1, 
			onMouseEnter = "MainUI_ScarEvent( \"DTM4_SkillMouseEnter("..SkillName..")\" )",
			onMouseExit = "UI_SetTextLabelText('RPGSkill','SkillDesc','')",
			Layout=
	  		{
	  			pos_XY = { x = 0, y = 0, xr = "par", yr = "par" },		
    			size_WH = { w = 1, h = 0.25, wr = "par", hr = "par" },
	  		}, 
			Text = 
			{
				textStyle = "FEHeading4",
				vAlign = "Middle", 
				hAlign = "Center", 
				minShrink=0.5,
			},
			--autosize=1,
		}, 
		{
			type = "ButtonHD",
			buttonStyle = "RM_TaskbarHD_CommandButtonStyle",
		    name = "Skill"..SkillName,		
			onMouseClicked = "MainUI_ScarEvent( \"DTM4_SkillMouseClick("..SkillName..")\" )",
			onMouseEnter = "MainUI_ScarEvent( \"DTM4_SkillMouseEnter("..SkillName..")\" )",
			onMouseExit = "UI_SetTextLabelText('RPGSkill','SkillDesc','')",
		    visible = 1,
			Layout=
	  		{
	  			pos_XY = { x = 0, y = 0.25, xr = "par", yr = "par" },		
    			size_WH = { w = 1, h = 0.75, wr = "par", hr = "par" },
	  		}, 
			IconBase = {
				texture = DTM4_UIFolder.."skill"..SkillName..".tga",
				uvRect = { 0, 1, 1, 0 },
				pixels = 4,
				--patch_X = { 4,-120, 4,0 },
				--patch_Y = { 4,-120,4, 0 },
				--patch_Scale = 1,
				--Surface = {
				--	surface = "ui_multistate";
				--	{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
				--	{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				--	{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				--	{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				--},
			},
		},
	}
	return t
end 

RPGSkill = 
{ 
	Layout = 
	{						
		pos_XY = {x=0, y=0, xr="scr", yr="scr",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	eventOpaque = 0,
	stylesheet = "HW2StyleSheet", 
	--RootElementSettings = { backgroundColor = { 0, 0, 0, 0, }, }, 
	pixelUVCoords = 1, 
	--previousScreen = "NewMainMenu",
	;
	{
		type = "Frame",
		name = "frmRootbottombigfrm",
		Layout = 
		{
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},		
			size_WH = { w = 800, h = 800, wr = "px", hr = "px" },
		},
		backgroundColor = {20,20,20,20},
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
		;	
		getSkill(1),
		getSkill(2),
		getSkill(3),
		getSkill(4),
		getSkill(5),
		getSkill(6),
		getSkill(7),
		getSkill(8),
		getSkill(9),
		getSkill(10),
		getSkill(11),
		getSkill(12),
		getSkill(13),
		getSkill(14),
		getSkill(15),
	    {
			type = "TextLabel",
			name = "SkillDesc",
			wrapping = 1, 
			Layout=
	  		{
				pivot_XY = { 0.5, 0.5 },					
	  			pos_XY = { x = 0.5, y = 0.5, xr = "par", yr = "par" },		
    			size_WH = { w = 0.3, h = 0.3, wr = "par", hr = "par" },
	  		}, 
			Text = 
			{
				textStyle = "FEHeading4",
			},
			--autosize=1,
		}, 
	},
}
