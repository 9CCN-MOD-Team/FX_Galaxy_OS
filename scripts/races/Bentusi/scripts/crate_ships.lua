dofilepath("data:scripts/debug.lua")
dout("Loading Crate_ships.lua of Bentusi")
crate_Ships =
				{						
						{
								class = "cruiser",
								prob = 0.00,
								types =
								{
										{prob = 1.00, item = "Ben_Battleship", name = "$11106"},
								},
						},
						{
								class = "carrier",
								prob = 0.25,
								types =
								{
										{prob = 1.00, item = "ben_floatingcity", name = "$11102"},										
								},
						},
						{
								class = "destroyer",
								prob = 0.50,
								types =
								{
										{prob = 1.00, item = "ben_destroyer", name = "$11112"},
								},
						},
						{
								class = "frigate",
								prob = 0.75,
								types =
								{
										{prob = 1.00, item = "Ben_ioncannonfrigate", name = "$11110"},
								},
						},
						{
								class = "fighter",
								prob = 1.00,
								types =
								{
										{prob = 1.00, item = "ben_fighter", name = "$11100"},
								},
						},
				}