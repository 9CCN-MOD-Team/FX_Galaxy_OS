dofilepath("data:scripts/debug.lua")
dout("Loading Crate_ships.lua of Turanic")
crate_Ships =
				{						
						{
								class = "cruiser",
								prob = 0.00,
								types =
								{
										{prob = 1.00, item = "tur_heavycruiser", name = "$1538"},
								},
						},
						{
								class = "carrier",
								prob = 0.05,
								types =
								{
										{prob = 0.90, item = "tur_ResourceController", name = "$9327"},
										{prob = 1.00, item = "tur_shipyard", name = "$9325"},										
								},
						},
						{
								class = "destroyer",
								prob = 0.10,
								types =
								{
										{prob = 1.00, item = "tur_carrier", name = "$9323"},
								},
						},
						{
								class = "frigate",
								prob = 0.35,
								types =
								{
										{prob = 0.25, item = "tur_vulcanfrigate", name = "$9317"},
										{prob = 0.50, item = "tur_ionarrayfrigate", name = "$9321"},
										{prob = 0.75, item = "tur_SiegeDrillfrigate", name = "$9319"},
										{prob = 1.00, item = "tur_Energyfrigate", name = "$9315"},										
								},
						},
						{
								class = "corvette",
								prob = 0.57,
								types =
								{
										{prob = 0.25, item = "tur_standardcorvette", name = "$9309"},										
										{prob = 0.50, item = "tur_missilecorvette", name = "$9311"},
										{prob = 0.75, item = "tur_minelayercorvette", name = "$9313"},
										{prob = 1.00, item = "tur_torpedoCorvette", name = "$9307"},
								},
						},
						{
								class = "fighter",
								prob = 0.80,
								types =
								{
										{prob = 0.30, item = "tur_scout", name = "$9301"},
										{prob = 0.50, item = "tur_fighter", name = "$9303"},										
										{prob = 1.00, item = "tur_attackbomber", name = "$9305"},
								},
						},
						{
								class = "resource",
								prob = 0.92,
								types =
								{
										{prob = 0.70, item = "tur_resourcecollector", name = "$9335"},
										{prob = 1.00, item = "tur_Garbage", name = "$9337"},
								},
						},
						{
								class = "noncombat",
								prob = 1.00,
								types =
								{
										{prob = 1.00, item = "tur_cloakgenerator", name = "$9333"},
								},
						},
				}