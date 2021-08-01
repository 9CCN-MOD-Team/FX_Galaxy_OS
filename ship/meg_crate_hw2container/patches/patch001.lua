Patch_Priority = 3.0	--优先级。因为实际上还可以再加诸如Patch002.lua这样的文件，所以如果有多个Patch文件的话优先级就会很有用
Patch_Exclusive = 0		--不知道是干嘛用的
Patch_Ops = 					--在这个table里加点
{ 
	hp_0 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "SalvagePoint0",
		pos = { -1.954785, 15, -41.17178 },
		rot = { 0.0, 0.0, 0.0 },
		axis = { 0.0, 0.0, 0.0 },
	},
	hp_1 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "RepairPoint0",
		pos = { 1.954785, 10, 41.17178 },
		rot = { 0.0, 0.0, 0.0 },
		axis = { 0.0, 0.0, 0.0 },
	},
	hp_2 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "Latch1",
		pos = { 1.954785, 10, 41.17178 },
		rot = { 0.0, 0.0, 0.0 },
		axis = { 0.0, 0.0, 0.0 },
	},
	hp_3 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "SalvagePoint0Heading",
		pos = { 0.0, 0.0, 10 },
		rot = { 0.0, 0.0, 0.0 },
		axis = { 0.0, 0.0, 0.0 },
	},
	hp_4 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "SalvagePoint0Left",
		pos = { 10, 0.0, 0.0 },
		rot = { 0.0, 0.0, 0.0 },
		axis = { 0.0, 0.0, 0.0 },
	},
	hp_5 = 							--hardpoint的命名是“hp_”+数字
	{
		root = "Root",		--这些项目应该都很好理解
		name = "SalvagePoint0Up",
		pos = { 0.0, -10, 0.0 },
		rot = { 0.0, 0.0, 0.0 },
		axis = { 0.0, 0.0, 0.0 },
	},
}
