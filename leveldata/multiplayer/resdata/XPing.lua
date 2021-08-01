templates.shipmark_0 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		--metaSelPrioritySM = LowPriority,
		metaSelPrioritySM = NoPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0,
					0,
					0,
					0,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_PingSize",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0,
					0,
					0,
					0.4,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(0),
				plusX = WIDTH(51),
				plusY = HEIGHT(31),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0,
					0,
					0,
					0.4,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(- 16),
				plusX = WIDTH(51),
				plusY = HEIGHT(30),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description1",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0,
					0,
					0,
					0.4,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(- 32),
				plusX = WIDTH(51),
				plusY = HEIGHT(29),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description2",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0,
					0,
					0,
					0.4,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(- 48),
				plusX = WIDTH(51),
				plusY = HEIGHT(28),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description3",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}
	-------------------------------
templates.shipmark_0_small = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		--metaSelPrioritySM = LowPriority,
		metaSelPrioritySM = NoPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0,
					0,
					0,
					0,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_PingSize",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.7,
					0.7,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(0),
				plusX = WIDTH(18),
				plusY = HEIGHT(6),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.7,
					0.7,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(- 16),
				plusX = WIDTH(18),
				plusY = HEIGHT(5),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description1",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(- 32),
				plusX = WIDTH(18),
				plusY = HEIGHT(6),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description2",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(32),
				--plusY = HEIGHT(- 48),
				plusX = WIDTH(18),
				plusY = HEIGHT(5),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description3",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}
	-------------------------------
templates.shipmark_1 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		--metaSelPrioritySM = LowPriority,
		metaSelPrioritySM = NoPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0,
					0,
					0,
					0,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_PingSize",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.4,
					0.5,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(-72),
				plusX = WIDTH(175),
				plusY = HEIGHT(31),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(-72),
				plusX = WIDTH(175),
				plusY = HEIGHT(31),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description1",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.4,
					0.5,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(-72),
				plusX = WIDTH(175),
				plusY = HEIGHT(30),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description2",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(-72),
				plusX = WIDTH(175),
				plusY = HEIGHT(30),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description3",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}
	-------------------------------
templates.shipmark_1_small = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		--metaSelPrioritySM = LowPriority,
		metaSelPrioritySM = NoPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0,
					0,
					0,
					0,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_PingSize",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.4,
					0.5,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(14),
				plusY = HEIGHT(6),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(-72),
				plusX = WIDTH(14),
				plusY = HEIGHT(6),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description1",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.4,
					0.5,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(-72),
				plusX = WIDTH(14),
				plusY = HEIGHT(5),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description2",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(-72),
				plusX = WIDTH(14),
				plusY = HEIGHT(5),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description3",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}
	-------------------------------
templates.shipmark_2 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		--metaSelPrioritySM = LowPriority,
		metaSelPrioritySM = NoPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0,
					0,
					0,
					0,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_PingSize",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.4,
					0.5,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(175),
				plusY = HEIGHT(29),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(175),
				plusY = HEIGHT(29),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description1",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.4,
					0.5,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(175),
				plusY = HEIGHT(28),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description2",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.7,
					0,
					0,
					0.6,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 0,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(175),
				plusY = HEIGHT(28),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description3",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}
	-------------------------------
templates.shipmark_1_over = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		--metaSelPrioritySM = LowPriority,
		metaSelPrioritySM = NoPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					1,
					1,
					1,
					0,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_PingSize",
					"PVF_MouseOver",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(1),
				--plusY = HEIGHT(-94),
				plusX = WIDTH(90),
				plusY = HEIGHT(14),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
				--placementFlags = 
				--{
				--	"attachToMouse",
				--},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.7,
					0.7,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(1),
				--plusY = HEIGHT(-106),
				plusX = WIDTH(130),
				plusY = HEIGHT(14),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description1",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
				--placementFlags = 
				--{
				--	"attachToMouse",
				--},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.2,
					1,
					0.2,
					1,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(175),
				--plusY = HEIGHT(29),
				plusX = WIDTH(50),
				plusY = HEIGHT(14),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description2",
					--"AVF_Visible",
					--"AVF_Selecting",
					--"AVF_TO_SelectionIcons",
					--"AVF_Selected",
					--"AVF_HealthBarStyle0",
					--"AVF_SquadLeader",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.9,
					0.7,
					0.1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
					--"justifyRight",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(170),
				plusY = HEIGHT(14),
				--plusX = WIDTH(172),
				--plusY = HEIGHT(37),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description3",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}
	-------------------------------
templates.shipmark_1_oversmall = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		--metaSelPrioritySM = LowPriority,
		metaSelPrioritySM = NoPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					1,
					1,
					1,
					0,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_PingSize",
					"PVF_MouseOver",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(1),
				--plusY = HEIGHT(-94),
				plusX = WIDTH(-25),
				plusY = HEIGHT(10),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					--"AVF_Selected",
					--"AVF_SquadLeader",
					"PVF_Description0",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
				--placementFlags = 
				--{
				--	"attachToMouse",
				--},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.7,
					0.7,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(1),
				--plusY = HEIGHT(-106),
				plusX = WIDTH(25),
				plusY = HEIGHT(10),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					--"AVF_Selected",
					--"AVF_SquadLeader",
					"PVF_Description1",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
				--placementFlags = 
				--{
				--	"attachToMouse",
				--},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.2,
					1,
					0.2,
					1,
				},
				renderFlags = 
				{
					"justifyRight",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				--plusX = WIDTH(175),
				--plusY = HEIGHT(29),
				plusX = WIDTH(-25),
				plusY = HEIGHT(-2),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					--"AVF_Selected",
					--"AVF_SquadLeader",
					"PVF_Description2",
					--"AVF_Visible",
					--"AVF_Selecting",
					--"AVF_TO_SelectionIcons",
					--"AVF_Selected",
					--"AVF_HealthBarStyle0",
					--"AVF_SquadLeader",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.9,
					0.7,
					0.1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
					--"justifyRight",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ButtonFont",
					LOD1,
					"ButtonFont",
					LOD2,
					"ButtonFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(25),
				plusY = HEIGHT(-2),
				--plusX = WIDTH(172),
				--plusY = HEIGHT(37),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					--"AVF_Selected",
					--"AVF_SquadLeader",
					"PVF_Description3",
					--"PVF_SensorsManager",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}
templates.landmark = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					1,
					1,
					1,
					1,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_SensorsManager",
					"PVF_PingSize",
				},
			},
		},
		foot = 
		{
			--the movement foot
			scaleParam = PPI_FootScale,
			--colourParam = PPI_FootColour,
			mesh = 
			{
				colour = 
				{
					0,
					1,
					1,
					1,
				},
				--{1,1,1,1},
				lineWeight = 1,
				LODs = 
				{
					1,
					"UI\\Meshes\\Foot.hod",
				},
			},
			placement3D = 
			{
				scale = 
				{
					100,
					1,
					100,
				},
				visibility = 
				{
					"PVF_MovementMode",
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					1,
					1,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(0),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					1,
					1,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 16),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description1",
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					1,
					1,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 32),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description2",
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					1,
					1,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 48),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description3",
					"PVF_SensorsManager",
				},
			},
		},
	}
	-----------------------------------1
templates.landmark1 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_SensorsManager",
					"PVF_PingSize",
				},
			},
		},
		foot = 
		{
			--the movement foot
			scaleParam = PPI_FootScale,
			--colourParam = PPI_FootColour,
			mesh = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				--{1,1,1,1},
				lineWeight = 1,
				LODs = 
				{
					1,
					"UI\\Meshes\\Foot.hod",
				},
			},
			placement3D = 
			{
				scale = 
				{
					100,
					1,
					100,
				},
				visibility = 
				{
					"PVF_MovementMode",
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(0),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 16),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description1",
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 32),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description2",
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					1,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 48),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description3",
					"PVF_SensorsManager",
				},
			},
		},
	}
	-----------------------------------2
templates.landmark2 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0.5,
					0.7,
					0.4,
					1,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_SensorsManager",
					"PVF_PingSize",
				},
			},
		},
		foot = 
		{
			--the movement foot
			scaleParam = PPI_FootScale,
			--colourParam = PPI_FootColour,
			mesh = 
			{
				colour = 
				{
					0.5,
					0.7,
					0.4,
					1,
				},
				--{1,1,1,1},
				lineWeight = 1,
				LODs = 
				{
					1,
					"UI\\Meshes\\Foot.hod",
				},
			},
			placement3D = 
			{
				scale = 
				{
					100,
					1,
					100,
				},
				visibility = 
				{
					"PVF_MovementMode",
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					0.4,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(0),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					0.4,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 16),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description1",
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					0.4,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 32),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description2",
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.5,
					0.7,
					0.4,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 48),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description3",
					"PVF_SensorsManager",
				},
			},
		},
	}
	-----------------------------------3
templates.landmark3 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					1,
					0.8,
					0.3,
					1,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_SensorsManager",
					"PVF_PingSize",
				},
			},
		},
		foot = 
		{
			--the movement foot
			scaleParam = PPI_FootScale,
			--colourParam = PPI_FootColour,
			mesh = 
			{
				colour = 
				{
					1,
					0.8,
					0.3,
					1,
				},
				--{1,1,1,1},
				lineWeight = 1,
				LODs = 
				{
					1,
					"UI\\Meshes\\Foot.hod",
				},
			},
			placement3D = 
			{
				scale = 
				{
					100,
					1,
					100,
				},
				visibility = 
				{
					"PVF_MovementMode",
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					1,
					0.8,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(0),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					1,
					0.8,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 16),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description1",
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					1,
					0.8,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 32),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description2",
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					1,
					0.8,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 48),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description3",
					"PVF_SensorsManager",
				},
			},
		},
	}
	-----------------------------------4
templates.landmark4 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					1,
					0.2,
					0.2,
					1,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_SensorsManager",
					"PVF_PingSize",
				},
			},
		},
		foot = 
		{
			--the movement foot
			scaleParam = PPI_FootScale,
			--colourParam = PPI_FootColour,
			mesh = 
			{
				colour = 
				{
					1,
					0.2,
					0.2,
					1,
				},
				--{1,1,1,1},
				lineWeight = 1,
				LODs = 
				{
					1,
					"UI\\Meshes\\Foot.hod",
				},
			},
			placement3D = 
			{
				scale = 
				{
					100,
					1,
					100,
				},
				visibility = 
				{
					"PVF_MovementMode",
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					1,
					0.2,
					0.2,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(0),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					1,
					0.2,
					0.2,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 16),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description1",
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					1,
					0.2,
					0.2,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 32),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description2",
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					1,
					0.2,
					0.2,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 48),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description3",
					"PVF_SensorsManager",
				},
			},
		},
	}
	-----------------------------------5
templates.landmark5 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0.8,
					0.3,
					0.7,
					1,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_SensorsManager",
					"PVF_PingSize",
				},
			},
		},
		foot = 
		{
			--the movement foot
			scaleParam = PPI_FootScale,
			--colourParam = PPI_FootColour,
			mesh = 
			{
				colour = 
				{
					0.8,
					0.3,
					0.7,
					1,
				},
				--{1,1,1,1},
				lineWeight = 1,
				LODs = 
				{
					1,
					"UI\\Meshes\\Foot.hod",
				},
			},
			placement3D = 
			{
				scale = 
				{
					100,
					1,
					100,
				},
				visibility = 
				{
					"PVF_MovementMode",
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.8,
					0.3,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(0),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.8,
					0.3,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 16),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description1",
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.8,
					0.3,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 32),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description2",
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.8,
					0.3,
					0.7,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 48),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description3",
					"PVF_SensorsManager",
				},
			},
		},
	}
	-----------------------------------6
templates.landmark6 = 
	{
		minGrowSize = 0,
		maxGrowSize = 0.1,
		minWorldSize = 0,
		growTime = 1,
		pauseTime = 0,
		lifespan = INFINITE,
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing",
		circle = 
		{
			scaleParam = PPI_PingSize,
			mesh = 
			{
				colour = 
				{
					0.7,
					0.4,
					0.3,
					1,
				},
				lineWeight = 0.5,
				renderFlags = 
				{
					"scaleX",
					"scaleY",
				},
				LODs = 
				{
					1,
					"UI\\Pings\\Meshes\\Circle00.hod",
				},
			},
			placement2D = 
			{
				factorX = 0,
				factorY = 0,
				plusX = 0,
				plusY = 0,
				factorWidth = 0.1,
				factorHeight = 0.1,
				minWidth = WIDTH(8),
				minHeight = HEIGHT(8),
				maxWidth = WIDTH(55),
				maxHeight = HEIGHT(55),
				minATIArea = 0,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Pinging",
					"PVF_SensorsManager",
					"PVF_PingSize",
				},
			},
		},
		foot = 
		{
			--the movement foot
			scaleParam = PPI_FootScale,
			--colourParam = PPI_FootColour,
			mesh = 
			{
				colour = 
				{
					0.7,
					0.4,
					0.3,
					1,
				},
				--{1,1,1,1},
				lineWeight = 1,
				LODs = 
				{
					1,
					"UI\\Meshes\\Foot.hod",
				},
			},
			placement3D = 
			{
				scale = 
				{
					100,
					1,
					100,
				},
				visibility = 
				{
					"PVF_MovementMode",
					"PVF_SensorsManager",
				},
			},
		},
		description0 = 
		{
			stringParam = PPI_Description0,
			text = 
			{
				colour = 
				{
					0.7,
					0.4,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(0),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					--"PVF_MouseOver",
					"PVF_Description0",
					"PVF_SensorsManager",
				},
			},
		},
		description1 = 
		{
			stringParam = PPI_Description1,
			text = 
			{
				colour = 
				{
					0.7,
					0.4,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 16),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description1",
					"PVF_SensorsManager",
				},
			},
		},
		description2 = 
		{
			stringParam = PPI_Description2,
			text = 
			{
				colour = 
				{
					0.7,
					0.4,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 32),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description2",
					"PVF_SensorsManager",
				},
			},
		},
		description3 = 
		{
			stringParam = PPI_Description3,
			text = 
			{
				colour = 
				{
					0.7,
					0.4,
					0.3,
					1,
				},
				renderFlags = 
				{
					"justifyLeft",
				},
				dropshadow = 1,
				LODs = 
				{
					LOD0,
					"ATISmallFont",
					LOD1,
					"ATISmallFont",
					LOD2,
					"ATISmallFont",
				},
			},
			placement2D = 
			{
				factorX = 1,
				factorY = 1,
				plusX = WIDTH(32),
				plusY = HEIGHT(- 48),
				factorWidth = 1,
				factorHeight = 1,
				minWidth = WIDTH(32),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(32),
				maxHeight = HEIGHT(12),
				visibility = 
				{
					"PVF_PingSize",
					"PVF_MouseOver",
					"PVF_Description3",
					"PVF_SensorsManager",
				},
			},
		},
	}
