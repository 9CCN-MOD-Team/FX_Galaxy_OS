-------------------------------------------------------------
------patch001.lua-------2017年4月29日---------
--由 9CCNMOD组 破天者-孤狼 编写
--为原版库申维修艇修改了LatchOrientation点，以修复采集时屁股朝前，
--以及打捞残骸时过于靠前的问题
-------------------------------------------------------------
-------------------------------------------------------------
Patch_Priority = 3.0	
Patch_Exclusive = 0		
Patch_Ops = 					
{ 
	hp_0 = 							
	{
		root = "Root",		
		name = "Hardpoint_Gun0_Effect",
		pos = { 0, -3.5, 23 },
		rot = { 0, 0, rad(180) },
		axis = { 0, 0, 0 },
	},
	hp_1 = 							
	{
		root = "Root",		
		name = "LatchOrientation",
		pos = { 0, 50, 150 },
		rot = { rad(90), 0, rad(180) },
		axis = { 0, 0, 0 },
	},
		hp_2 = 							
		{
			root = "LatchOrientation",		
			name = "LatchOrientationUp",
			pos = { 0, 0, 10 },
			rot = { 0, 0, 0 },
			axis = { 0, 0, 0 },
		},
		hp_3 = 							
		{
			root = "LatchOrientation",		
			name = "LatchOrientationLeft",
			pos = { -10, 0, 0 },
			rot = { 0, 0, 0 },
			axis = { 0, 0, 0 },
		},
		hp_4 = 							
		{
			root = "LatchOrientation",		
			name = "LatchOrientationHeading",
			pos = { 0, 10, 0 },
			rot = { 0, 0, 0 },
			axis = { 0, 0, 0 },
		},
}
