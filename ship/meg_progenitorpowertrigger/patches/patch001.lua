Patch_Priority = 3.0	--优先级。因为实际上还可以再加诸如Patch002.lua这样的文件，所以如果有多个Patch文件的话优先级就会很有用
Patch_Exclusive = 0		--不知道是干嘛用的
Patch_Ops = 					--在这个table里加点
{ 
	hp_1 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "ResearchShip_Position",
		pos = { 0, 0, 0 },
		rot = { 0.0, 0.0, 0.0 },
		axis = { 0.0, 0.0, 0.0 },
	},
	hp_2 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "marker1",
		pos = { 0, 0, 110 },
		rot = { rad(-90.0), 0.0, rad(180.0) },
		axis = { 0.0, 0.0, 0.0 },
	},
	hp_3 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "marker2",
		pos = { 57, 0, 105 },
		rot = { rad(-90.0), 0.0, rad(180.0) },
		axis = { 0.0, 0.0, 0.0 },
	},
}
