	
templates.fx_spfleet = 
	{
		minGrowSize = 50,
		maxGrowSize = 300,
		minWorldSize = 0,
		growTime = 2,
		pauseTime = 0,
		lifespan = INFINITE,
		footColour = {0,1,1,1},
		mouseOverFootColour = {0,1,1,1},
		metaSelPriority = LowPriority,
		metaSelPrioritySM = LowPriority,
		--pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/unknowncontactping",
		--emitterSfxPatch = "data:sound/sfx/ui/sensorsmanager/unknowncontactping",
		label = 
		{
			stringParam = PPI_Label,
			text = 
			{
				colour = {1,1,1,1},
				renderFlags = 
				{
					"justifyHorizCentre",
					"justifyVertCentre",
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
				factorX = 0,
				factorY = -0.2,
				plusX = WIDTH(0),
				plusY = HEIGHT(0),
				factorWidth = 0,
				factorHeight = 0,
				minWidth = WIDTH(120),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(120),
				maxHeight = HEIGHT(12),
				minATIArea = 0.002,
				maxATIArea = HUGE,
				visibility = 
				{
					"PVF_Label",
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
				colour = {1,1,1,1},
				renderFlags = 
				{
					"justifyHorizCentre",
					"justifyVertCentre",
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
				factorX = 0,
				factorY = -0.2,
				plusX = WIDTH(-42),
				plusY = HEIGHT(-23),
				factorWidth = 0,
				factorHeight = 0,
				minWidth = WIDTH(120),
				minHeight = HEIGHT(12),
				maxWidth = WIDTH(120),
				maxHeight = HEIGHT(12),
				minATIArea = 0.002,
				maxATIArea = HUGE,
				visibility = 
				{
					--"PVF_Label",
					"PVF_PingSize",
				},
				invisibility = 
				{
					"PVF_SensorsManager",
				},
			},
		},
	}