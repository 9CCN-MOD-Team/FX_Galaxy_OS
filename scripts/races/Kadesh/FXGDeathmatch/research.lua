dofilepath("Data:leveldata/multiplayer/lib/FXGDeathmatch_Data.lua")

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
BLUE = 0
YELLOW = 1
RED = nil
AllShips = 0
Family = 1
Ship = 2
research = {
  {
    Name = "FXGDM",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
  },
  {
    Name = "Branch1",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 123,
    Time = 100,
    DisplayedName = "星云守卫",
    DisplayPriority = 1,
    Description = "星云守卫是分布在卡德仕星云外围的战士群体，任务是对侵犯星云的敌人予以坚决的攻击。\n可召唤支援座舱进入战场\n游动细胞高级武器系统\n支援座舱可将附近细胞武器系统升至高级\n建造二级母舰系统后立即获得一艘星之云母\n二级云母永久隐形系统",
    UpgradeType = BLUE,
		TargetType =		Ship,
		TargetName =		"kad_swarmer",
    Icon = Icon_Health,
    ShortDisplayedName = "星云守卫",
  },
  {
    Name = "Branch2",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 123,
    Time = 100,
    DisplayedName = "星云猎手",
    DisplayPriority = 2,
    Description = "星云猎手是由至高祭司指定的战斗群体，肩负的使命是从误闯星云的外族手中获取星云内缺乏的资源，其活动区域广泛分布在星云周边，最远可达星云外数百光年。\n可召唤武装渗透座舱进入战场\n突击细胞高级武器系统\n武装渗透座舱隐形系统\n建造二级母舰系统的星之云母立即升级为光之云母\n卡托巴范围永久隐形系统",
    UpgradeType = RES,
		TargetType =		Ship,
		TargetName =		"kad_swarmer",
    Icon = Icon_Attack,
    ShortDisplayedName = "星云猎手",
  },
  {
    Name = "Branch3",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 123,
    Time = 100,
    DisplayedName = "星云护教",
    DisplayPriority = 3,
    Description = "星云护教是卡德仕人最核心的作战力量，只在星云的中心区域活动，守护着星云的最高机密。\n可召唤多光束波护卫舰进入战场\n巨噬细胞高级武器系统\n多光束波护卫舰排斥光束\n建造一级母舰系统后立即获得一艘守护神\n守护神永久隐形系统",
    UpgradeType = YELLOW,
		TargetType =		Ship,
		TargetName =		"kad_swarmer",
    Icon = Icon_Cloak,
    ShortDisplayedName = "星云护教",
  },
  {
    Name = "SwarmerAdvWpn",
    RequiredResearch = "Branch1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    UpgradeType = Ability,
    UpgradeName = "UseSpecialWeaponsInNormalAttack",
		TargetType =		Ship,
		TargetName =		"kad_swarmer",
  },
  {
    Name = "AssaultSwarmerAvdWpn",
    RequiredResearch = "Branch2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    UpgradeType = Ability,
    UpgradeName = "UseSpecialWeaponsInNormalAttack",
		TargetType =		Ship,
		TargetName =		"kad_assaultswarmer",
  },
  {
    Name = "LanceSwarmerAdvWpn",
    RequiredResearch = "Branch3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    UpgradeType = Ability,
    UpgradeName = "UseSpecialWeaponsInNormalAttack",
		TargetType =		Ship,
		TargetName =		"kad_lanceswarmer",
  },
  {
    Name = "BeamFrigateAdvWpn",
    RequiredResearch = "Branch3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    UpgradeType = Ability,
    UpgradeName = "UseSpecialWeaponsInNormalAttack",
		TargetType =		Ship,
		TargetName =		"kad_multibeamfrigate",
  },
  {
    Name = "Sumon_FuelPod",
    RequiredResearch = "Branch1",
    RequiredSubSystems = "FrigateProduction",
    Cost = FXG_Sumon_Data.Kadesh[1].Cost,
    Time = 100,
    DisplayedName = "召唤支援座舱进入战场",
    DisplayPriority = 0,
    Description = "支援座舱",
    UpgradeType = YELLOW,
		TargetType =		Ship,
		TargetName =		"kad_fuelpod",
    Icon = Icon_Hyperspace,
    ShortDisplayedName = "支援座舱",
  },
  {
    Name = "Sumon_MilitaryFuelPod",
    RequiredResearch = "Branch2 & KadCapital1",
    RequiredSubSystems = "FrigateProduction",
    Cost = FXG_Sumon_Data.Kadesh[2].Cost,
    Time = 100,
    DisplayedName = "召唤武装渗透座舱进入战场",
    DisplayPriority = 0,
    Description = "武装渗透座舱",
    UpgradeType = YELLOW,
		TargetType =		Ship,
		TargetName =		"kad_militaryfuelpod",
    Icon = Icon_Hyperspace,
    ShortDisplayedName = "武装渗透座舱",
  },
  {
    Name = "Sumon_MultiBeamFrigate",
    RequiredResearch = "Branch3",
    RequiredSubSystems = "CapShipProduction",
    Cost = FXG_Sumon_Data.Kadesh[3].Cost,
    Time = 100,
    DisplayedName = "召唤多光束波护卫舰进入战场",
    DisplayPriority = 0,
    Description = "多光束波护卫舰",
    UpgradeType = YELLOW,
		TargetType =		Ship,
		TargetName =		"kad_multibeamfrigate",
    Icon = Icon_Hyperspace,
    ShortDisplayedName = "多光束波护卫舰",
  },
  {
    Name = "InstantBuild_Mothership",
    RequiredResearch = "Branch1",
    RequiredSubSystems = "CapShipAdvanced",
    Cost = 1,
    Time = 100,
  },
  --{
  --  Name = "InstantBuild_IonCannon",
  --  RequiredResearch = "Branch2",
  --  RequiredSubSystems = "CapShipAdvanced",
  --  Cost = 1,
  --  Time = 100,
  --},
  {
    Name = "InstantBuild_Nagaul",
    RequiredResearch = "Branch3",
    RequiredSubSystems = "CapShip",
    Cost = 1,
    Time = 100,
  },
  {
    Name = "MilitaryPodCloakTech",
    RequiredResearch = "Branch2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "kad_militaryfuelpod",
    UpgradeName = "Cloak",
  },
  {
    Name = "NagaulCloakTech",
    RequiredResearch = "Branch3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "kad_guardianspirit",
    UpgradeName = "Cloak",
  },
  {
    Name = "KadCapital1",
    RequiredResearch = "",
    RequiredSubSystems = "CapShip",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8320",
    DisplayPriority = 1,
    Description = "$8321",
    TargetType = Family,
    TargetName = "Capital",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8376",
  },
  {
    Name = "carrierHyperspace",
    RequiredResearch = "KadCapital1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8320",
    DisplayPriority = 1,
    Description = "$8321",
    UpgradeType = Ability,
    TargetType = Ships,
    UpgradeName = "HyperSpace",
    TargetName = "kad_carrier",
    Icon = Icon_Hyperspace,
    ShortDisplayedName = "$8376",
  },
  {
    Name = "KadCapital2",
    RequiredResearch = "",
    RequiredSubSystems = "CapShipAdvanced",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8320",
    DisplayPriority = 1,
    Description = "$8321",
    TargetType = Family,
    TargetName = "Capital",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8376",
  },
  {
    Name = "carrierCloakTech",
    RequiredResearch = "KadCapital2 & Branch2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$9367",
    DisplayPriority = 2,
    Description = "$9368",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "kad_carrier",
    UpgradeName = "Cloak",
    Icon = Icon_Cloak,
    ShortDisplayedName = "$9405",
  },
  {
    Name = "AdvancedAssaultSwarmerMissile",
    RequiredResearch = "",
    RequiredSubSystems = "Missile",
    Cost = 0,
    Time = 0,
    DisplayedName = "$9056",
    DisplayPriority = 3,
    Description = "$9057",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "Kad_AdvancedAssaultSwarmer",
    UpgradeName = "UseSpecialWeaponsInNormalAttack",
    Icon = Icon_crystal,
    ShortDisplayedName = "$9093",
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