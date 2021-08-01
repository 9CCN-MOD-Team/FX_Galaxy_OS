dofilepath("data:scripts/debug.lua")
dout("Loading Crate_ships.lua of Kadesh")
crate_Ships =
				{						
						{
								class = "cruiser",
								prob = 0.00,
								types =
								{
										{prob = 1.00, item = "kad_mothershipLight", name = "$9022"},
								}
						},
						{
								class = "carrier",
								prob = 0.05,
								types =
								{
										{prob = 0.90, item = "kad_Fuelpod", name = "$9014"},
										{prob = 1.00, item = "Kad_Carrier", name = "$9026"},
								}
						},
						{
								class = "destroyer",
								prob = 0.15,
								types =
								{
										{prob = 1.00, item = "kad_guardianspirit", name = "$9012"},
								}
						},
						{
								class = "frigate",
								prob = 0.35,
								types =
								{
										{prob = 0.50, item = "Kad_Multibeamfrigate",  name = "$9016"},
										{prob = 1.00, item = "kad_militaryfuelpod", name = "$9018"},
								}
						},
						{
								class = "corvette",
								prob = 0.55,
								types =
								{
										{prob = 0.40, item = "kad_Variationswarmer", name = "$9010"},
										{prob = 0.70, item = "Kad_AdvancedSwarmer", name = "$9006"},
										{prob = 1.00, item = "Kad_AdvancedAssaultSwarmer", name = "$9008"},
								}
						},
						{
								class = "fighter",
								prob = 0.75,
								types =
								{
										{prob = 0.40, item = "Kad_Swarmer", name = "$9000"},
										{prob = 0.70, item = "Kad_AssaultSwarmer", name = "$9002"},
										{prob = 1.00, item = "Kad_LanceSwarmer", name = "$9004"},
								}
						},
						{
								class = "platform",
								prob = 0.80,
								types =
								{
										{prob = 1.00, item = "Kad_gunturret", name = "$9030"},
								}
						},
						{
								class = "resource",
								prob = 0.92,
								types =
								{
										{prob = 0.70, item = "Kad_Salvager", name = "$9038"},
										{prob = 1.00, item = "kad_Resourcefuelpod", name = "$9040"},
								}
						},
						{
								class = "noncombat",
								prob = 1.00,
								types =
								{
										{prob = 0.60, item = "kad_probe", name = "$9042"},
										{prob = 1.00, item = "Kad_Araneid", name = "$9034"},
								},
						},
				}