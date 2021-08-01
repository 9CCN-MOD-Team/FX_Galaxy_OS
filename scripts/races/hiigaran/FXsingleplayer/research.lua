Icon_Speed = "data:ui/newui/research/icons/speed.tga"
Icon_Health = "data:ui/newui/research/icons/health.tga"
Icon_Tech = "data:ui/newui/research/icons/tech.tga"
Icon_Ability = "data:ui/newui/research/icons/ability.tga"
Icon_Build = "data:ui/newui/research/icons/build.tga"
Icon_Attack = "data:ui/newui/research/icons/attack.tga"
Icon_Cloak = "data:ui/newui/research/icons/cloak.tga"
Icon_Emp = "data:ui/newui/research/icons/Emp.tga"
Icon_Hyperspace = "data:ui/newui/research/icons/hyperspace.tga"
Icon_ping = "data:ui/newui/research/icons/ping.tga"
Icon_Repair = "data:ui/newui/research/icons/repair.tga"
Icon_RU = "data:ui/newui/research/icons/ru.tga"
Icon_shield = "data:ui/newui/research/icons/shield.tga"
Modifier = 0
Ability = 1
AllShips = 0
Family = 1
Ship = 2
research = {
  {
    Name = "ImprovedTorpedo",
    RequiredResearch = "",
    RequiredSubSystems = "AdvancedResearch & FrigateProduction",
    Cost = 0,
    Time = 0,
    DisplayedName = "$7515",
    DisplayPriority = 1,
    Description = "$7516",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "Hgn_TorpedoFrigate",
    UpgradeName = "UseSpecialWeaponsInNormalAttack",
    Icon = Icon_Attack,
    ShortDisplayedName = "$7207",
  },
  {
    Name = "InstaFrigateTech",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 1,
    Description = "",
    TargetName = "Hgn_Mothership",
  },
  {
    Name = "HyperspaceCostUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research | AdvancedResearch & Hyperspace",
    Cost = 250,
    Time = 25,
    DisplayedName = "$7627",
    DisplayPriority = 1000,
    Description = "$7628",
    UpgradeType = Modifier,
    TargetType = AllShips,
    UpgradeName = "HyperspaceCost",
    UpgradeValue = 0.8,
    TargetName = "Hgn_Mothership",
    Icon = Icon_Hyperspace,
    ShortDisplayedName = "$7280",
  },
  {
    Name = "HyperspaceCostUpgrade2",
    RequiredResearch = "HyperspaceCostUpgrade1",
    RequiredSubSystems = "AdvancedResearch & Hyperspace",
    Cost = 500,
    Time = 30,
    DisplayedName = "$7629",
    DisplayPriority = 1000,
    Description = "$7630",
    UpgradeType = Modifier,
    TargetType = AllShips,
    UpgradeName = "HyperspaceCost",
    UpgradeValue = 0.6,
    TargetName = "Hgn_Mothership",
    Icon = Icon_Hyperspace,
    ShortDisplayedName = "$7281",
  },
  {
    Name = "RepairAbility",
    RequiredResearch = "",
    RequiredSubSystems = "Research | AdvancedResearch",
    Cost = 300,
    Time = 20,
    DisplayedName = "$7511",
    DisplayPriority = 26,
    Description = "$7512",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "Hgn_ResourceCollector",
    UpgradeName = "Repair",
    Icon = Icon_Repair,
    ShortDisplayedName = "$7205",
  },
  {
    Name = "ScoutPingAbility",
    RequiredResearch = "",
    RequiredSubSystems = "Research | AdvancedResearch",
    Cost = 250,
    Time = 20,
    DisplayedName = "$7513",
    DisplayPriority = 1,
    Description = "$7514",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "Hgn_Scout",
    UpgradeName = "SensorPing",
    Icon = Icon_ping,
    ShortDisplayedName = "$7206",
  },
  {
    Name = "hgn_AirWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8040",
    DisplayPriority = 100,
    Description = "$8041",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8040",
  },
  {
    Name = "hgn_AirWeaponUpgrade2",
    RequiredResearch = "hgn_AirWeaponUpgrade1",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8042",
    DisplayPriority = 100,
    Description = "$8043",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8042",
  },
  {
    Name = "hgn_AirWeaponUpgrade3",
    RequiredResearch = "hgn_AirWeaponUpgrade2",
    RequiredSubSystems = "AdvancedResearch & CorvetteProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8044",
    DisplayPriority = 100,
    Description = "$8045",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.4,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8044",
  },
  {
    Name = "hgn_AirHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8046",
    DisplayPriority = 101,
    Description = "$8047",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8046",
  },
  {
    Name = "hgn_AirHealthUpgrade2",
    RequiredResearch = "hgn_AirHealthUpgrade1",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8048",
    DisplayPriority = 101,
    Description = "$8049",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8048",
  },
  {
    Name = "hgn_AirHealthUpgrade3",
    RequiredResearch = "hgn_AirHealthUpgrade2",
    RequiredSubSystems = "AdvancedResearch & CorvetteProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8050",
    DisplayPriority = 101,
    Description = "$8051",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8050",
  },
  {
    Name = "hgn_ShipWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FrigateProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8052",
    DisplayPriority = 300,
    Description = "$8053",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8052",
  },
  {
    Name = "hgn_ShipWeaponUpgrade2",
    RequiredResearch = "hgn_ShipWeaponUpgrade1",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8054",
    DisplayPriority = 300,
    Description = "$8055",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8054",
  },
  {
    Name = "hgn_ShipWeaponUpgrade3",
    RequiredResearch = "hgn_ShipWeaponUpgrade2",
    RequiredSubSystems = "AdvancedResearch & AdvancedCapShipProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8056",
    DisplayPriority = 300,
    Description = "$8057",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8056",
  },
  {
    Name = "hgn_ShipHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FrigateProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8058",
    DisplayPriority = 301,
    Description = "$8059",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8058",
  },
  {
    Name = "hgn_ShipHealthUpgrade2",
    RequiredResearch = "hgn_ShipHealthUpgrade1",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8060",
    DisplayPriority = 301,
    Description = "$8061",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8060",
  },
  {
    Name = "hgn_ShipHealthUpgrade3",
    RequiredResearch = "hgn_ShipHealthUpgrade2",
    RequiredSubSystems = "AdvancedResearch & AdvancedCapShipProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8062",
    DisplayPriority = 301,
    Description = "$8063",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8062",
  },
  {
    Name = "hgn_PlatformWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8064",
    DisplayPriority = 300,
    Description = "$8065",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8064",
  },
  {
    Name = "hgn_PlatformWeaponUpgrade2",
    RequiredResearch = "hgn_PlatformWeaponUpgrade1",
    RequiredSubSystems = "AdvancedResearch",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8066",
    DisplayPriority = 300,
    Description = "$8067",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8066",
  },
  {
    Name = "hgn_PlatformWeaponUpgrade3",
    RequiredResearch = "hgn_PlatformWeaponUpgrade2",
    RequiredSubSystems = "AdvancedResearch",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8068",
    DisplayPriority = 300,
    Description = "$8069",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.5,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8068",
  },
  {
    Name = "hgn_PlatformHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8070",
    DisplayPriority = 201,
    Description = "$8071",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8070",
  },
  {
    Name = "hgn_PlatformHealthUpgrade2",
    RequiredResearch = "hgn_PlatformHealthUpgrade1",
    RequiredSubSystems = "AdvancedResearch",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8072",
    DisplayPriority = 201,
    Description = "$8073",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.4,
    Icon = Icon_Health,
    ShortDisplayedName = "$8072",
  },
  {
    Name = "hgn_PlatformHealthUpgrade3",
    RequiredResearch = "hgn_PlatformHealthUpgrade2",
    RequiredSubSystems = "AdvancedResearch",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8074",
    DisplayPriority = 201,
    Description = "$8075",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$8074",
  },
  {
    Name = "hgn_AirWeaponUpgrade11",
    RequiredResearch = "hgn_AirWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8040",
    DisplayPriority = 100,
    Description = "$8041",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8040",
  },
  {
    Name = "hgn_AirWeaponUpgrade21",
    RequiredResearch = "hgn_AirWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8042",
    DisplayPriority = 100,
    Description = "$8043",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8042",
  },
  {
    Name = "hgn_AirWeaponUpgrade31",
    RequiredResearch = "hgn_AirWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8044",
    DisplayPriority = 100,
    Description = "$8045",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.4,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8044",
  },
  {
    Name = "hgn_AirHealthUpgrade11",
    RequiredResearch = "hgn_AirHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8046",
    DisplayPriority = 101,
    Description = "$8047",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8046",
  },
  {
    Name = "hgn_AirHealthUpgrade21",
    RequiredResearch = "hgn_AirHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8048",
    DisplayPriority = 101,
    Description = "$8049",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8048",
  },
  {
    Name = "hgn_AirHealthUpgrade31",
    RequiredResearch = "hgn_AirHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8050",
    DisplayPriority = 101,
    Description = "$8051",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8050",
  },
  {
    Name = "hgn_ShipWeaponUpgrade11",
    RequiredResearch = "hgn_ShipWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8052",
    DisplayPriority = 300,
    Description = "$8053",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.15,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8052",
  },
  {
    Name = "hgn_ShipWeaponUpgrade21",
    RequiredResearch = "hgn_ShipWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8054",
    DisplayPriority = 300,
    Description = "$8055",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.25,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8054",
  },
  {
    Name = "hgn_ShipWeaponUpgrade31",
    RequiredResearch = "hgn_ShipWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8056",
    DisplayPriority = 300,
    Description = "$8057",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.35,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8056",
  },
  {
    Name = "hgn_ShipHealthUpgrade11",
    RequiredResearch = "hgn_ShipHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8058",
    DisplayPriority = 301,
    Description = "$8059",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8058",
  },
  {
    Name = "hgn_ShipHealthUpgrade21",
    RequiredResearch = "hgn_ShipHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8060",
    DisplayPriority = 301,
    Description = "$8061",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.4,
    Icon = Icon_Health,
    ShortDisplayedName = "$8060",
  },
  {
    Name = "hgn_ShipHealthUpgrade31",
    RequiredResearch = "hgn_ShipHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8062",
    DisplayPriority = 301,
    Description = "$8063",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$8062",
  },
  {
    Name = "Hgn_lbc_AFTech",
    RequiredResearch = "",
    RequiredSubSystems = "Never",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 1,
    Description = "",
    TargetName = "Hgn_LightCruiser",
  },
  {
    Name = "hgnTech",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 1,
    Description = "",
    TargetName = "Hgn_Mothership",
  },
  {
    Name = "InstaAdvancedFrigateTech",
    RequiredResearch = "",
    RequiredSubSystems = "AdvancedResearch",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 1,
    Description = "",
    TargetName = "Hgn_Mothership",
  },
  {
    Name = "FXP_Attack",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 1,
    Time = 100,
  },
  {
    Name = "FXP_BeenAttack",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 1,
    Time = 100,
  },
--AI behaviour	
	{ 
		Name = "cpuplayers_defensive", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
	},	
	{ 
		Name = "cpuplayers_aggressive", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
	},	
	{ 
		Name = "cpuplayers_dynamic", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
	},
--AI no-rush	
	{ 
		Name = "cpuplayers_norushtime5", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
	},		
	{ 
		Name = "cpuplayers_norushtime10", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
	},		
	{ 
		Name = "cpuplayers_norushtime15", 
		RequiredResearch = "", 
		RequiredSubSystems = "", 
		Cost = 1, 
		Time = 1, 
		DisplayedName = "", 
		DisplayPriority = 0,        
		Description = "",             
		TargetName = "",
	},	
--AI build speed	
	{ 
		Name =			"AllShipBuildSpeed",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Family,
		TargetName =		"Capital",
		UpgradeName =		"BUILDSPEED",
		UpgradeValue =		1.025,
	},	
	{ 
		Name =			"AllShipBuildSpeedHard",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Family,
		TargetName =		"Capital",
		UpgradeName =		"BUILDSPEED",
		UpgradeValue =		1.05,
	},	
	{ 
		Name =			"AllShipBuildSpeedExpert",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Family,
		TargetName =		"Capital",
		UpgradeName =		"BUILDSPEED",
		UpgradeValue =		1.075,
	},
--AI resource rate	
	{ 
		Name =			"ResourceCollectionRateHard",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName = "hgn_resourcecollector",
		UpgradeName =		"ResourceCollectionRate",
		UpgradeValue =		1.04,
	},	
	{ 
		Name =			"ResourceCollectionRateExpert",
		RequiredResearch =	"",                       
		RequiredSubSystems =	"",                               
		Cost = 			1,
		Time = 			1,
		DisplayedName =		"",
		DisplayPriority =	0,                                                    
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName = "hgn_resourcecollector",
		UpgradeName =		"ResourceCollectionRate",
		UpgradeValue =		1.08,
	},			
}

dofilepath("data:scripts/races/AIscripts/AIReserch.lua")