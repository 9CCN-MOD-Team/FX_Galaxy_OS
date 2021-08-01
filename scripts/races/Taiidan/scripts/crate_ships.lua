dofilepath("data:scripts/debug.lua")
dout("Loading Crate_ships.lua of Taiidan")
crate_Ships =
				{						
						{
								class = "cruiser",
								prob = 0.00,
								types =
								{
										{prob = 1.00, item = "TAI_heavycruiser", name = "$9587"},
								}
						},
						{
								class = "carrier",
								prob = 0.05,
								types =
								{
										{prob = 0.90, item = "TAI_carrier", name = "$9581"},
										{prob = 1.00, item = "tai_shipyard", name = "$9641"},
								}
						},
						{
								class = "destroyer",
								prob = 0.15,
								types =
								{
										{prob = 0.60, item = "TAI_Destroyer", name = "$9583"},
										{prob = 1.00, item = "TAI_missiledestroyer", name = "$9585"},
								}
						},
						{
								class = "frigate",
								prob = 0.35,
								types =
								{
										{prob = 0.40, item = "TAI_standardfrigate",  name = "$9573"},
										{prob = 0.75, item = "TAI_supportfrigate", name = "$9575"},
										{prob = 1.00, item = "TAI_ioncannonfrigate", name = "$9579"},
										{prob = 1.00, item = "TAI_defensefrigate", name = "$9577"},

								}
						},
						{
								class = "corvette",
								prob = 0.55,
								types =
								{
										{prob = 0.33, item = "TAI_lightcorvette", name = "$9561"},
										{prob = 0.66, item = "TAI_heavycorvette", name = "$9563"},
										{prob = 1.00, item = "TAI_salcapcorvette", name = "$9569"},
								}
						},
						{
								class = "fighter",
								prob = 0.75,
								types =
								{
										{prob = 0.33, item = "TAI_Scout", name = "$9551"},
										{prob = 0.66, item = "TAI_Interceptor", name = "$9553"},
										{prob = 1.00, item = "TAI_AttackBomber", name = "$9555"},
								}
						},
						{
								class = "platform",
								prob = 0.80,
								types =
								{
										{prob = 0.50, item = "TAI_heavydefender", name = "$9557"},
										{prob = 1.00, item = "TAI_defensefighter", name = "$9559"},
								}
						},
						{
								class = "resource",
								prob = 0.92,
								types =
								{
										{prob = 0.70, item = "TAI_ResourceCollector", name = "$9597"},
										{prob = 1.00, item = "TAI_ResourceController", name = "$9599"},
								}
						},
						{
								class = "noncombat",
								prob = 1.00,
								types =
								{
										{prob = 0.30, item = "TAI_researchship", name = "$9589"},
										{prob = 0.60, item = "TAI_researchstation", name = "$9609"},
										{prob = 1.00, item = "TAI_sensorarray", name = "$9605"},
								},
						},
				}