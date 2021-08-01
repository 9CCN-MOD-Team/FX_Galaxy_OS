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
    Name = "FighterTech",
    RequiredResearch = "",
    RequiredSubSystems = "FighterProduction",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8015",
    DisplayPriority = 0,
    Description = "$8016",
    TargetType = Family,
    TargetName = "Corvette",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8023",
  },
  {
    Name = "CorvetteTech",
    RequiredResearch = "",
    RequiredSubSystems = "CorvetteProduction",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8015",
    DisplayPriority = 10,
    Description = "$8016",
    TargetType = Family,
    TargetName = "Corvette",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8023",
  },
  {
    Name = "ResearchTech",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8015",
    DisplayPriority = 20,
    Description = "$8016",
    TargetType = Family,
    TargetName = "Corvette",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8023",
  },
  {
    Name = "FrigateTech",
    RequiredResearch = "",
    RequiredSubSystems = "FrigateProduction",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8019",
    DisplayPriority = 30,
    Description = "$8020",
    TargetType = Family,
    TargetName = "Frigate",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8019",
  },
  {
    Name = "CapShipTech",
    RequiredResearch = "",
    RequiredSubSystems = "CapShipProduction",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8015",
    DisplayPriority = 40,
    Description = "$8016",
    TargetType = Family,
    TargetName = "Corvette",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8023",
  },
  {
    Name = "ScoutEMPAbility",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 500,
    Time = 35,
    DisplayedName = "$7732",
    DisplayPriority = 281,
    Description = "$7734",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "Vgr_Scout",
    UpgradeName = "SpecialAttack",
    Icon = Icon_Emp,
    ShortDisplayedName = "$7314",
  },
  {
    Name = "PlasmaBombs",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 150,
    Time = 15,
    DisplayedName = "$7702",
    DisplayPriority = 221,
    Description = "$7703",
    TargetName = "Vgr_Bomber",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7300",
  },
  {
    Name = "LanceBeams",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 150,
    Time = 15,
    DisplayedName = "$7704",
    DisplayPriority = 220,
    Description = "$7705",
    TargetName = "Vgr_LanceFighter",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7301",
  },
  {
    Name = "CorvetteLaser",
    RequiredResearch = "",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 250,
    Time = 20,
    DisplayedName = "$7708",
    DisplayPriority = 231,
    Description = "$7709",
    TargetName = "Vgr_LaserCorvette",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7303",
  },
  {
    Name = "CorvetteCommand",
    RequiredResearch = "CorvetteTech",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 250,
    Time = 20,
    DisplayedName = "$7710",
    DisplayPriority = 232,
    Description = "$7711",
    TargetName = "Vgr_CommandCorvette",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7304",
  },
  {
    Name = "CorvetteGraviticAttraction",
    RequiredResearch = "",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 750,
    Time = 20,
    DisplayedName = "$7706",
    DisplayPriority = 230,
    Description = "$7707",
    TargetName = "Vgr_MinelayerCorvette",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7302",
  },
  { 
    Name = "EWfighterTech",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FrigateProduction",
    Cost = 350,
    Time = 25,
    DisplayedName = "$8033",
    DisplayPriority = 249,
    Description = "$8034",
    TargetName = "vgr_EWfighter",
    Icon = Icon_Tech,
    ShortDisplayedName = "$8035",
  },
  {
    Name = "FrigateAssault",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FrigateProduction",
    Cost = 350,
    Time = 25,
    DisplayedName = "$7714",
    DisplayPriority = 250,
    Description = "$7715",
    TargetName = "vgr_assaultfrigate",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7306",
  },
  {
    Name = "FrigateInfiltrationTech",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FrigateProduction",
    Cost = 350,
    Time = 25,
    DisplayedName = "$7716",
    DisplayPriority = 252,
    Description = "$7717",
    TargetName = "Vgr_InfiltratorFrigate",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7307",
  },
  {
    Name = "infiltratorfrigateCloak",
    RequiredResearch = "FrigateInfiltrationTech",
    RequiredSubSystems = "Research & FrigateProduction",
    Cost = 350,
    Time = 25,
    DisplayedName = "$8005",
    DisplayPriority = 253,
    Description = "$8006",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "vgr_infiltratorfrigate",
    UpgradeName = "Cloak",
    Icon = Icon_Cloak,
    ShortDisplayedName = "$8005",
  },
  {
    Name = "DestroyerGuns",
    RequiredResearch = "",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 500,
    Time = 30,
    DisplayedName = "$7720",
    DisplayPriority = 261,
    Description = "$7721",
    TargetName = "Vgr_Destroyer",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7309",
  },
  {
    Name = "BattlecruiserIonWeapons",
    RequiredResearch = "",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 750,
    Time = 35,
    DisplayedName = "$7718",
    DisplayPriority = 1,
    Description = "$7719",
    TargetName = "Vgr_BattleCruiser",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7308",
  },
  {
    Name = "HyperspaceGateTech",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 250,
    Time = 25,
    DisplayedName = "$7722",
    DisplayPriority = 262,
    Description = "$7723",
    TargetName = "Vgr_HyperSpace_Platform",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7310",
  },
  {
    Name = "PlatformHeavyMissiles",
    RequiredResearch = "",
    RequiredSubSystems = "Research & PlatformProduction",
    Cost = 300,
    Time = 30,
    DisplayedName = "$7712",
    DisplayPriority = 240,
    Description = "$7713",
    TargetName = "Vgr_WeaponPlatform_missile",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7305",
  },
  {
    Name = "RepairAbility",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 250,
    Time = 15,
    DisplayedName = "$7724",
    DisplayPriority = 280,
    Description = "$7725",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "Vgr_ResourceCollector",
    UpgradeName = "Repair",
    Icon = Icon_Repair,
    ShortDisplayedName = "$7311",
  },
  {
    Name = "ProbeProxSensor",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 250,
    Time = 20,
    DisplayedName = "$7183",
    DisplayPriority = 210,
    Description = "$7184",
    TargetName = "Vgr_Probe_Prox",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7185",
  },
  {
    Name = "ProbeSensorDisruption",
    RequiredResearch = "ProbeProxSensor",
    RequiredSubSystems = "Research",
    Cost = 400,
    Time = 30,
    DisplayedName = "$7700",
    DisplayPriority = 220,
    Description = "$7701",
    TargetName = "Vgr_Probe_ECM",
    Icon = Icon_Tech,
    ShortDisplayedName = "$7182",
  },
  {
    Name = "vgrBUILDSPEEDUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 500,
    Time = 30,
    DisplayedName = "$7831",
    DisplayPriority = 45,
    Description = "$7832",
    UpgradeType = Modifier,
    TargetType = AllShips,
    UpgradeName = "BUILDSPEED",
    UpgradeValue = 1.15,
    TargetName = "vgr_Mothership",
    Icon = Icon_Build,
    ShortDisplayedName = "$7229",
  },
  {
    Name = "vgrBUILDSPEEDUpgrade2",
    RequiredResearch = "vgrBUILDSPEEDUpgrade1",
    RequiredSubSystems = "Research",
    Cost = 1500,
    Time = 30,
    DisplayedName = "$7833",
    DisplayPriority = 45,
    Description = "$7834",
    UpgradeType = Modifier,
    TargetType = AllShips,
    UpgradeName = "BUILDSPEED",
    TargetName = "vgr_Mothership",
    UpgradeValue = 1.3,
    Icon = Icon_Build,
    ShortDisplayedName = "$7230",
  },
  {
    Name = "CorvetteHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "CorvetteProduction & Research",
    Cost = 900,
    Time = 60,
    DisplayedName = "$7759",
    DisplayPriority = 200,
    Description = "$7760",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$7341",
  },
  {
    Name = "CorvetteHealthUpgrade2",
    RequiredResearch = "CorvetteHealthUpgrade1",
    RequiredSubSystems = "CorvetteProduction & Research",
    Cost = 1800,
    Time = 80,
    DisplayedName = "$7761",
    DisplayPriority = 200,
    Description = "$7762",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$7342",
  },
  {
    Name = "CorvetteSpeedUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "CorvetteProduction & Research",
    Cost = 800,
    Time = 60,
    DisplayedName = "$7763",
    DisplayPriority = 201,
    Description = "$7764",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXSPEED",
    UpgradeValue = 1.2,
    Icon = Icon_Speed,
    ShortDisplayedName = "$7341",
  },
  {
    Name = "CorvetteSpeedUpgrade2",
    RequiredResearch = "CorvetteSpeedUpgrade1",
    RequiredSubSystems = "CorvetteProduction & Research",
    Cost = 1600,
    Time = 80,
    DisplayedName = "$7765",
    DisplayPriority = 201,
    Description = "$7766",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXSPEED",
    UpgradeValue = 1.4,
    Icon = Icon_Speed,
    ShortDisplayedName = "$7342",
  },
  {
    Name = "FrigateHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "FrigateProduction & Research",
    Cost = 1600,
    Time = 80,
    DisplayedName = "$7767",
    DisplayPriority = 306,
    Description = "$7768",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$7371",
  },
  {
    Name = "FrigateHealthUpgrade2",
    RequiredResearch = "FrigateHealthUpgrade1",
    RequiredSubSystems = "FrigateProduction & Research",
    Cost = 2600,
    Time = 100,
    DisplayedName = "$7769",
    DisplayPriority = 306,
    Description = "$7770",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$7372",
  },
  {
    Name = "FrigateSpeedUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "FrigateProduction & Research",
    Cost = 1000,
    Time = 70,
    DisplayedName = "$7771",
    DisplayPriority = 307,
    Description = "$7772",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXSPEED",
    UpgradeValue = 1.2,
    Icon = Icon_Speed,
    ShortDisplayedName = "$7371",
  },
  {
    Name = "SpeedUpgrade2",
    RequiredResearch = "FrigateSpeedUpgrade1",
    RequiredSubSystems = "FrigateProduction & Research",
    Cost = 1500,
    Time = 100,
    DisplayedName = "$7773",
    DisplayPriority = 307,
    Description = "$7774",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXSPEED",
    UpgradeValue = 1.35,
    Icon = Icon_Speed,
    ShortDisplayedName = "$7372",
  },
  {
    Name = "SuperCapHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "CapShipProduction & Research",
    Cost = 4000,
    Time = 60,
    DisplayedName = "$7743",
    DisplayPriority = 61,
    Description = "$7744",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$7354",
  },
  {
    Name = "SuperCapHealthUpgrade2",
    RequiredResearch = "SuperCapHealthUpgrade1",
    RequiredSubSystems = "CapShipProduction & Research",
    Cost = 6000,
    Time = 80,
    DisplayedName = "$7745",
    DisplayPriority = 61,
    Description = "$7746",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$7355",
  },
  {
    Name = "SuperCapSpeedUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "CapShipProduction & Research",
    Cost = 2000,
    Time = 60,
    DisplayedName = "$7747",
    DisplayPriority = 64,
    Description = "$7748",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXSPEED",
    UpgradeValue = 1.2,
    Icon = Icon_Speed,
    ShortDisplayedName = "$7354",
  },
  {
    Name = "SuperCapSpeedUpgrade2",
    RequiredResearch = "SuperCapSpeedUpgrade1",
    RequiredSubSystems = "CapShipProduction & Research",
    Cost = 3000,
    Time = 80,
    DisplayedName = "$7749",
    DisplayPriority = 64,
    Description = "$7750",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXSPEED",
    UpgradeValue = 1.35,
    Icon = Icon_Speed,
    ShortDisplayedName = "$7355",
  },
  {
    Name = "PlatformHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "PlatformProduction & Research",
    Cost = 1000,
    Time = 50,
    DisplayedName = "$7775",
    DisplayPriority = 600,
    Description = "$7776",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.5,
    Icon = Icon_Health,
    ShortDisplayedName = "$7361",
  },
  {
    Name = "PlatformHealthUpgrade2",
    RequiredResearch = "PlatformHealthUpgrade1",
    RequiredSubSystems = "PlatformProduction & Research",
    Cost = 1600,
    Time = 70,
    DisplayedName = "$7777",
    DisplayPriority = 600,
    Description = "$7778",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 2,
    Icon = Icon_Health,
    ShortDisplayedName = "$7362",
  },
  {
    Name = "UtilityHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research",
    Cost = 1200,
    Time = 50,
    DisplayedName = "$7779",
    DisplayPriority = 701,
    Description = "$7780",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Utility",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.5,
    Icon = Icon_Health,
    ShortDisplayedName = "$7351",
  },
  {
    Name = "UtilityHealthUpgrade2",
    RequiredResearch = "UtilityHealthUpgrade1",
    RequiredSubSystems = "Research",
    Cost = 2400,
    Time = 70,
    DisplayedName = "$7781",
    DisplayPriority = 701,
    Description = "$7782",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Utility",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 2,
    Icon = Icon_Health,
    ShortDisplayedName = "$7352",
  },
  {
    Name = "WeakVgrHeavyMissiles",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Reduces damage on Vgr Heavy Missiles (SP Game only!)",
    DisplayPriority = 1205,
    Description = "",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "Vgr_HeavyMissileFrigate",
    UpgradeName = "WeaponDamage",
    UpgradeValue = 0.25,
  },
  {
    Name = "HyperspaceRecoveryTimeUpgradeSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Hyperspace Recovery - SP GAME ONLY",
    DisplayPriority = 1206,
    Description = "",
    UpgradeType = Modifier,
    TargetType = AllShips,
    UpgradeName = "HyperspaceRecoveryTime",
    UpgradeValue = 0.01,
  },
  {
    Name = "VaygrCarrierHealthRegenDowngrade",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Vaygr Carrier Health Regen Rate Downgrade",
    DisplayPriority = 1207,
    Description = "",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "Vgr_Carrier",
    UpgradeName = "HealthRegenerationRate",
    UpgradeValue = 0.1,
  },
  {
    Name = "HyperspaceTransitionTimeUpgradeSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Hyperspace Transition - SP GAME ONLY",
    DisplayPriority = 1206,
    Description = "",
    UpgradeType = Modifier,
    TargetType = AllShips,
    UpgradeName = "HyperspaceTime",
    UpgradeValue = 0.1,
  },
  {
    Name = "SuperCapHealthUpgradeSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Vgr Super Cap Health Upgrade",
    DisplayPriority = 1208,
    Description = "Vaygr Carrier Health upgrade - SP GAME ONLY",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 3.5,
  },
  {
    Name = "ShipyardSpeedDowngradeSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Vaygr Shipyard Speed downgrade",
    DisplayPriority = 1208,
    Description = "Vaygr Shipyard Speed downgrade - SP GAME ONLY",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "Vgr_ShipYard",
    UpgradeName = "MAXSPEED",
    UpgradeValue = 0.0001,
  },
  {
    Name = "VaygrFrigateHealthUpgradeSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Vgr Frigate Health Upgrade",
    DisplayPriority = 1208,
    Description = "Vaygr Frigate Health upgrade - SP GAME ONLY",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 3,
  },
  {
    Name = "VaygrFrigateHealthRegenDowngradeSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Vaygr Frigate Health Regen Rate Downgrade",
    DisplayPriority = 1207,
    Description = "",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "HealthRegenerationRate",
    UpgradeValue = 0.1,
  },
  {
    Name = "CorvetteHealthUpgradeSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Vgr Corvette Health Upgrade",
    DisplayPriority = 1208,
    Description = "Vaygr Corvette Health upgrade - SP GAME ONLY",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 3.5,
  },
  {
    Name = "ExtraStrongVgrHeavyMissilesSPGAME",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Increases damage on Vgr Heavy Missiles (SP Game only!)",
    DisplayPriority = 1205,
    Description = "",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "Vgr_HeavyMissileFrigate",
    UpgradeName = "WeaponDamage",
    UpgradeValue = 1.35,
  },
  {
    Name = "VaygrCaptureHack",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Increases Capture Speed (SP Game only!)",
    DisplayPriority = 1205,
    Description = "",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "Vgr_InfiltratorFrigate",
    UpgradeName = "Capture",
    UpgradeValue = 1.35,
  },
  {
    Name = "VaygrReduceCaptureHack",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Increases Capture Speed (SP Game only!)",
    DisplayPriority = 1205,
    Description = "",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "Vgr_InfiltratorFrigate",
    UpgradeName = "Capture",
    UpgradeValue = 0.75,
  },
  {
    Name = "VaygrRadiationImmunityHack",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Makes Vaygr Immune to Radiation (SP Game only!)",
    DisplayPriority = 1205,
    Description = "",
    UpgradeType = Modifier,
    TargetType = AllShips,
    UpgradeName = "NebulaSensitivity",
    UpgradeValue = 0,
  },
  {
    Name = "VaygrCarrierHealthUpgrade",
    RequiredResearch = "RESEARCH HACK",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "Vaygr Carrier Health Upgrade",
    DisplayPriority = 1208,
    Description = "",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "Vgr_Carrier",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 3,
  },
-------------------------------------
-------------------------------------
-------------------------------------
  {
    Name = "vgr_AirWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8076",
    DisplayPriority = 100,
    Description = "$8077",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8076",
  },
  {
    Name = "vgr_AirWeaponUpgrade2",
    RequiredResearch = "vgr_AirWeaponUpgrade1",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8078",
    DisplayPriority = 100,
    Description = "$8079",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8078",
  },
  {
    Name = "vgr_AirWeaponUpgrade3",
    RequiredResearch = "vgr_AirWeaponUpgrade2",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8080",
    DisplayPriority = 100,
    Description = "$8081",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8080",
  },
  {
    Name = "vgr_FighterHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8082",
    DisplayPriority = 101,
    Description = "$8083",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8082",
  },
  {
    Name = "vgr_FighterHealthUpgrade2",
    RequiredResearch = "vgr_FighterHealthUpgrade1",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8084",
    DisplayPriority = 101,
    Description = "$8085",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8084",
  },
  {
    Name = "vgr_FighterHealthUpgrade3",
    RequiredResearch = "vgr_FighterHealthUpgrade2",
    RequiredSubSystems = "Research & FighterProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8086",
    DisplayPriority = 101,
    Description = "$8087",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8086",
  },
  {
    Name = "vgr_CorvetteHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8088",
    DisplayPriority = 101,
    Description = "$8089",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.15,
    Icon = Icon_Health,
    ShortDisplayedName = "$8088",
  },
  {
    Name = "vgr_CorvetteHealthUpgrade2",
    RequiredResearch = "vgr_CorvetteHealthUpgrade1",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8090",
    DisplayPriority = 101,
    Description = "$8091",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.25,
    Icon = Icon_Health,
    ShortDisplayedName = "$8090",
  },
  {
    Name = "vgr_CorvetteHealthUpgrade3",
    RequiredResearch = "vgr_CorvetteHealthUpgrade2",
    RequiredSubSystems = "Research & CorvetteProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8092",
    DisplayPriority = 101,
    Description = "$8093",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.35,
    Icon = Icon_Health,
    ShortDisplayedName = "$8092",
  },
  {
    Name = "vgr_ShipWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & FrigateProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8094",
    DisplayPriority = 300,
    Description = "$8095",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8094",
  },
  {
    Name = "vgr_ShipWeaponUpgrade2",
    RequiredResearch = "vgr_ShipWeaponUpgrade1",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8096",
    DisplayPriority = 300,
    Description = "$8097",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8096",
  },
  {
    Name = "vgr_ShipWeaponUpgrade3",
    RequiredResearch = "vgr_ShipWeaponUpgrade2",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8098",
    DisplayPriority = 300,
    Description = "$8099",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8098",
  },
  {
    Name = "vgr_frigateHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & frigateProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8100",
    DisplayPriority = 301,
    Description = "$8101",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8100",
  },
  {
    Name = "vgr_frigateHealthUpgrade2",
    RequiredResearch = "vgr_frigateHealthUpgrade1",
    RequiredSubSystems = "Research & frigateProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8102",
    DisplayPriority = 301,
    Description = "$8103",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.4,
    Icon = Icon_Health,
    ShortDisplayedName = "$8102",
  },
  {
    Name = "vgr_frigateHealthUpgrade3",
    RequiredResearch = "vgr_frigateHealthUpgrade2",
    RequiredSubSystems = "Research & frigateProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8104",
    DisplayPriority = 301,
    Description = "$8105",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$8104",
  },
  {
    Name = "vgr_CapitalHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8106",
    DisplayPriority = 301,
    Description = "$8107",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.15,
    Icon = Icon_Health,
    ShortDisplayedName = "$8106",
  },
  {
    Name = "vgr_CapitalHealthUpgrade2",
    RequiredResearch = "vgr_CapitalHealthUpgrade1",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8108",
    DisplayPriority = 301,
    Description = "$8109",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.25,
    Icon = Icon_Health,
    ShortDisplayedName = "$8108",
  },
  {
    Name = "vgr_CapitalHealthUpgrade3",
    RequiredResearch = "vgr_CapitalHealthUpgrade2",
    RequiredSubSystems = "Research & CapShipProduction",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8110",
    DisplayPriority = 301,
    Description = "$8111",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.35,
    Icon = Icon_Health,
    ShortDisplayedName = "$8110",
  },
  {
    Name = "vgr_AirWeaponUpgrade11",
    RequiredResearch = "vgr_AirWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8076",
    DisplayPriority = 100,
    Description = "$8077",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8076",
  },
  {
    Name = "vgr_AirWeaponUpgrade21",
    RequiredResearch = "vgr_AirWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8078",
    DisplayPriority = 100,
    Description = "$8079",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8078",
  },
  {
    Name = "vgr_AirWeaponUpgrade31",
    RequiredResearch = "vgr_AirWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8080",
    DisplayPriority = 100,
    Description = "$8081",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8080",
  },
  {
    Name = "vgr_ShipWeaponUpgrade11",
    RequiredResearch = "vgr_ShipWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8094",
    DisplayPriority = 300,
    Description = "$8095",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8094",
  },
  {
    Name = "vgr_ShipWeaponUpgrade21",
    RequiredResearch = "vgr_ShipWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8096",
    DisplayPriority = 300,
    Description = "$8097",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8096",
  },
  {
    Name = "vgr_ShipWeaponUpgrade31",
    RequiredResearch = "vgr_ShipWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8098",
    DisplayPriority = 300,
    Description = "$8099",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Capital",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8098",
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