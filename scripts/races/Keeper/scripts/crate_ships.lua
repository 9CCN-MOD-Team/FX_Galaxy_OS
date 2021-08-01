dofilepath("data:scripts/debug.lua")
dout("Loading Crate_ships.lua of Keeper")
crate_Ships =
				{						
						{
								class = "cruiser",
								prob = 0.00,
								types =
								{
										{prob = 1.00, item = "Kpr_ArsenalShip", name = "$8236"},
										{prob = 0.90, item = "kpr_Dreadnaught", name = "$8238"},
										{prob = 0.10, item = "Kpr_Sajuuks", name = "$8240"},
								}
						},
						{
								class = "carrier",
								prob = 0.05,
								types =
								{
										{prob = 0.90, item = "kpr_Deliver", name = "$8244"},
										{prob = 1.00, item = "kpr_carrier", name = "$2403"},
								}
						},
						{
								class = "destroyer",
								prob = 0.15,
								types =
								{
										{prob = 1.00, item = "kpr_destroyer1", name = "$8232"},
								}
						},
						{
								class = "frigate",
								prob = 0.35,
								types =
								{
										{prob = 0.25, item = "kpr_AssaultFrigate",  name = "$8220"},
										{prob = 0.50, item = "kpr_IonCannonFrigate", name = "$8222"},
										{prob = 0.75, item = "kpr_Destroyerfrigate", name = "$8224"},
										{prob = 1.00, item = "kpr_defensefieldfrigate", name = "$8246"},
								}
						},
						{
								class = "corvette",
								prob = 0.55,
								types =
								{
										{prob = 0.40, item = "kpr_movers", name = "$8210"},
										{prob = 0.80, item = "kpr_mover1", name = "$8212"},
										{prob = 0.90, item = "kpr_HeavyMover", name = "$8214"},
										{prob = 1.00, item = "kpr_CaptureMover", name = "$8216"},
								}
						},
						{
								class = "fighter",
								prob = 0.75,
								types =
								{
										{prob = 0.50, item = "kpr_Scout", name = "$8200"},
										{prob = 1.00, item = "kpr_bomber", name = "$8202"},
								}
						},
						{
								class = "platform",
								prob = 0.80,
								types =
								{
										{prob = 0.25, item = "kpr_energy_photoncannon", name = "$8312"},
										{prob = 0.40, item = "kpr_energy_ioncannon", name = "$8314"},
										{prob = 0.55, item = "kpr_energy_PhasedCannon", name = "$8316"},
										{prob = 0.75, item = "kpr_energy_Pulsar", name = "$8318"},
										{prob = 1.00, item = "kpr_energy_SuperPulsar", name = "$8320"},
								}
						},
						{
								class = "resource",
								prob = 0.92,
								types =
								{
										{prob = 0.70, item = "kpr_ResourceCollector", name = "$8300"},
										{prob = 1.00, item = "kpr_resourcecontroller", name = "$8302"},
								}
						},
						{
								class = "noncombat",
								prob = 1.00,
								types =
								{
										{prob = 0.60, item = "kpr_probe", name = "$8304"},
										{prob = 1.00, item = "kpr_proximitysensor", name = "$8306"},
								},
						},
				}