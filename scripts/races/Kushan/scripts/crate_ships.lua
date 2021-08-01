dofilepath("data:scripts/debug.lua")
dout("Loading Crate_ships.lua of Kushan")
crate_Ships =
				{						
						{
								class = "cruiser",
								prob = 0.00,
								types =
								{
										{prob = 1.00, item = "kus_heavycruiser", name = "$10587"},
								}
						},
						{
								class = "carrier",
								prob = 0.05,
								types =
								{
										{prob = 1.00, item = "kus_carrier", name = "$10581"},
								}
						},
						{
								class = "destroyer",
								prob = 0.15,
								types =
								{
										{prob = 0.60, item = "kus_Destroyer", name = "$10583"},
										{prob = 1.00, item = "kus_missiledestroyer", name = "$10585"},
								}
						},
						{
								class = "frigate",
								prob = 0.35,
								types =
								{
										{prob = 0.40, item = "kus_standardfrigate",  name = "$10573"},
										{prob = 0.75, item = "kus_supportfrigate", name = "$10575"},
										{prob = 1.00, item = "kus_ioncannonfrigate", name = "$10579"},
										{prob = 1.00, item = "kus_dronefrigate", name = "$10577"},

								}
						},
						{
								class = "corvette",
								prob = 0.55,
								types =
								{
										{prob = 0.33, item = "kus_lightcorvette", name = "$10561"},
										{prob = 0.66, item = "kus_heavycorvette", name = "$10563"},
										{prob = 1.00, item = "kus_salvagecorvette", name = "$10569"},
								}
						},
						{
								class = "fighter",
								prob = 0.75,
								types =
								{
										{prob = 0.33, item = "kus_Scout", name = "$10551"},
										{prob = 0.66, item = "kus_Interceptor", name = "$10553"},
										{prob = 1.00, item = "kus_AttackBomber", name = "$10555"},
										{prob = 1.00, item = "kus_cloakedfighter", name = "$10559"},
								}
						},
						{
								class = "platform",
								prob = 0.80,
								types =
								{
										{prob = 0.50, item = "kus_defender", name = "$9557"},
								}
						},
						{
								class = "resource",
								prob = 0.92,
								types =
								{
										{prob = 0.70, item = "kus_ResourceCollector", name = "$10597"},
										{prob = 1.00, item = "kus_ResourceController", name = "$10599"},
								}
						},
						{
								class = "noncombat",
								prob = 1.00,
								types =
								{
										{prob = 0.30, item = "kus_researchship", name = "$10589"},
										{prob = 0.60, item = "kus_researchshipadv", name = "$10609"},
										{prob = 1.00, item = "kus_sensorarray", name = "$10605"},
								},
						},
				}