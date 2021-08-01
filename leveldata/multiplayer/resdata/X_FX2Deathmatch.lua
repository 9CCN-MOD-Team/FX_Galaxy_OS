PlayerSurviveJudge = 0
ShipForSurvive = 
{
	Hiigaran =
	{
		"Hgn_MotherShip",
		"Hgn_Carrier",
	},
	Vaygr =
	{
		"Vgr_MotherShip",
		"Vgr_Carrier",
	},
}

Technologies = 
{
	{
		Name = "BenBuildUpgrade",
		RaceName = "Bentusi",
		Type = "Normal",
		Length = 0,
		ColdTime = 0,
		Function = {},
		Opener = 
		{
			{
				--{"Research","Player","Bentusi", 1,"BenJumpUpgrade",},
				--{"Research","Player","Bentusi", 1,"BenSpeedUpgrade",},
				--{"Researching","Player","Bentusi", 1,"BenJumpUpgrade",},
				--{"Researching","Player","Bentusi", 1,"BenSpeedUpgrade",},
			},
		},
		Lock = 0,
	},
	{
		Name = "BenSpeedUpgrade",
		RaceName = "Bentusi",
		Type = "Normal",
		Length = 0,
		ColdTime = 0,
		Function = {},
		Opener = 
		{
			{
				--{"Research","Player","Bentusi", 1,"BenJumpUpgrade",},
				--{"Research","Player","Bentusi", 1,"BenBuildUpgrade",},
				--{"Researching","Player","Bentusi", 1,"BenJumpUpgrade",},
				--{"Researching","Player","Bentusi", 1,"BenBuildUpgrade",},
			},
		},
		Lock = 0,
	},
	{
		Name = "BenJumpUpgrade",
		RaceName = "Bentusi",
		Type = "Normal",
		Length = 0,
		ColdTime = 0,
		Function = {},
		Opener = 
		{
			{
				--{"Research","Player","Bentusi", 1,"BenBuildUpgrade",},
				--{"Research","Player","Bentusi", 1,"BenSpeedUpgrade",},
				--{"Researching","Player","Bentusi", 1,"BenBuildUpgrade",},
				--{"Researching","Player","Bentusi", 1,"BenSpeedUpgrade",},
			},
		},
		Lock = 0,
	},
}
