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
    Name = "BUILDTech",
    RequiredResearch = "",
    RequiredSubSystems = "BUILD",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 1,
    Description = "",
    TargetName = "kpr_balcoragate",
  },
  {
    Name = "HyperspaceTech",
    RequiredResearch = "",
    RequiredSubSystems = "Hyperspace",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 3,
    Description = "",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "kpr_deliver",
    UpgradeName = "Custom",
  },
  {
    Name = "HyperspaceTech2",
    RequiredResearch = "",
    RequiredSubSystems = "Hyperspace",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 3,
    Description = "",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "kpr_deliver",
    UpgradeName = "Hyperspace",
  },
  {
    Name = "HyperspaceTech3",
    RequiredResearch = "",
    RequiredSubSystems = "Hyperspace",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 3,
    Description = "",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "kpr_carrier",
    UpgradeName = "Hyperspace",
  },
  {
    Name = "CoreTech",
    RequiredResearch = "",
    RequiredSubSystems = "Core",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 3,
    Description = "",
    UpgradeType = Ability,
    TargetType = Ship,
    TargetName = "kpr_balcoragate",
    UpgradeName = "SensorPing",
  },
  {
    Name = "photonBombTech",
    RequiredResearch = "",
    RequiredSubSystems = "photonBomb",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 4,
    Description = "",
    TargetName = "kpr_energy_photonBomb",
  },
  {
    Name = "photoncannonTech",
    RequiredResearch = "",
    RequiredSubSystems = "photoncannon",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 5,
    Description = "",
    TargetName = "kpr_energy_photoncannon",
  },
  {
    Name = "PulsarTech",
    RequiredResearch = "",
    RequiredSubSystems = "Pulsar",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 6,
    Description = "",
    TargetName = "kpr_energy_Pulsar",
  },
  {
    Name = "ioncannonTech",
    RequiredResearch = "",
    RequiredSubSystems = "ioncannon",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 7,
    Description = "",
    TargetName = "kpr_energy_ioncannon",
  },
  {
    Name = "PhasedCannonTech",
    RequiredResearch = "",
    RequiredSubSystems = "PhasedCannon",
    Cost = 0,
    Time = 0,
    DisplayedName = "Instant Tech!!!!!!!!!!!!!!!!!!!!!!!!!!",
    DisplayPriority = 8,
    Description = "",
    TargetName = "kpr_energy_PhasedCannon",
  },
  {
    Name = "kpr_AirWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "photonBomb & BUILD",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8420",
    DisplayPriority = 100,
    Description = "$8421",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8390",
  },
  {
    Name = "kpr_AirWeaponUpgrade2",
    RequiredResearch = "kpr_AirWeaponUpgrade1",
    RequiredSubSystems = "photonBomb & Hyperspace",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8422",
    DisplayPriority = 100,
    Description = "$8423",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8391",
  },
  {
    Name = "kpr_AirWeaponUpgrade3",
    RequiredResearch = "kpr_AirWeaponUpgrade2",
    RequiredSubSystems = "photonBomb & Core",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8424",
    DisplayPriority = 100,
    Description = "$8425",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.4,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8392",
  },
  {
    Name = "kpr_FrigateWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "ioncannon & Hyperspace",
    Cost = 800,
    Time = 128,
    DisplayedName = "$8426",
    DisplayPriority = 200,
    Description = "$8427",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.12,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8393",
  },
  {
    Name = "kpr_FrigateWeaponUpgrade2",
    RequiredResearch = "kpr_FrigateWeaponUpgrade1",
    RequiredSubSystems = "ioncannon & Hyperspace",
    Cost = 1200,
    Time = 160,
    DisplayedName = "$8428",
    DisplayPriority = 200,
    Description = "$8429",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.24,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8394",
  },
  {
    Name = "kpr_FrigateWeaponUpgrade3",
    RequiredResearch = "kpr_FrigateWeaponUpgrade2",
    RequiredSubSystems = "ioncannon & Core",
    Cost = 1600,
    Time = 192,
    DisplayedName = "$8430",
    DisplayPriority = 200,
    Description = "$8431",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.36,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8395",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "PhasedCannon & Hyperspace",
    Cost = 600,
    Time = 96,
    DisplayedName = "$8432",
    DisplayPriority = 300,
    Description = "$8433",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_dreadnaught",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade2",
    RequiredResearch = "kpr_CapitalWeaponUpgrade1",
    RequiredSubSystems = "PhasedCannon & Core",
    Cost = 900,
    Time = 120,
    DisplayedName = "$8434",
    DisplayPriority = 300,
    Description = "$8435",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_dreadnaught",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8397",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade3",
    RequiredResearch = "kpr_CapitalWeaponUpgrade2",
    RequiredSubSystems = "PhasedCannon & Core",
    Cost = 1200,
    Time = 144,
    DisplayedName = "$8436",
    DisplayPriority = 300,
    Description = "$8437",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_dreadnaught",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8398",
  },
  {
    Name = "kpr_AIHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "BUILD",
    Cost = 1500,
    Time = 240,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade2",
    RequiredResearch = "kpr_AIHealthUpgrade1",
    RequiredSubSystems = "Hyperspace",
    Cost = 2250,
    Time = 300,
    DisplayedName = "$8440",
    DisplayPriority = 201,
    Description = "$8441",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.4,
    Icon = Icon_Health,
    ShortDisplayedName = "$8400",
  },
  {
    Name = "kpr_AIHealthUpgrade3",
    RequiredResearch = "kpr_AIHealthUpgrade2",
    RequiredSubSystems = "Core",
    Cost = 3000,
    Time = 360,
    DisplayedName = "$8442",
    DisplayPriority = 201,
    Description = "$8443",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Frigate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$8401",
  },
  {
    Name = "kpr_CapitalHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "Hyperspace",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8444",
    DisplayPriority = 301,
    Description = "$8445",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_dreadnaught",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalHealthUpgrade2",
    RequiredResearch = "kpr_CapitalHealthUpgrade1",
    RequiredSubSystems = "Core",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8446",
    DisplayPriority = 301,
    Description = "$8447",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_dreadnaught",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8397",
  },
  {
    Name = "kpr_CapitalHealthUpgrade3",
    RequiredResearch = "kpr_CapitalHealthUpgrade2",
    RequiredSubSystems = "Core",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8448",
    DisplayPriority = 301,
    Description = "$8449",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_dreadnaught",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8398",
  },
  {
    Name = "kpr_PlatformHealthUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "BUILD",
    Cost = 500,
    Time = 80,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade2",
    RequiredResearch = "kpr_PlatformHealthUpgrade1",
    RequiredSubSystems = "Hyperspace",
    Cost = 750,
    Time = 100,
    DisplayedName = "$8452",
    DisplayPriority = 201,
    Description = "$8453",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.4,
    Icon = Icon_Health,
    ShortDisplayedName = "$8403",
  },
  {
    Name = "kpr_PlatformHealthUpgrade3",
    RequiredResearch = "kpr_PlatformHealthUpgrade2",
    RequiredSubSystems = "Core",
    Cost = 1000,
    Time = 120,
    DisplayedName = "$8454",
    DisplayPriority = 201,
    Description = "$8455",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Platform",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.6,
    Icon = Icon_Health,
    ShortDisplayedName = "$8404",
  },
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  {
    Name = "kpr_AirWeaponUpgrade1_1",
    RequiredResearch = "kpr_AirWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8420",
    DisplayPriority = 100,
    Description = "$8421",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8390",
  },
  {
    Name = "kpr_AirWeaponUpgrade2_1",
    RequiredResearch = "kpr_AirWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8420",
    DisplayPriority = 100,
    Description = "$8421",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8390",
  },
  {
    Name = "kpr_AirWeaponUpgrade3_1",
    RequiredResearch = "kpr_AirWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8420",
    DisplayPriority = 100,
    Description = "$8421",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.4,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8390",
  },
  {
    Name = "kpr_FrigateWeaponUpgrade1_1",
    RequiredResearch = "kpr_FrigateWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8426",
    DisplayPriority = 200,
    Description = "$8427",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_destroyer1",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8393",
  },
  {
    Name = "kpr_FrigateWeaponUpgrade2_1",
    RequiredResearch = "kpr_FrigateWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8426",
    DisplayPriority = 200,
    Description = "$8427",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_destroyer1",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8393",
  },
  {
    Name = "kpr_FrigateWeaponUpgrade3_1",
    RequiredResearch = "kpr_FrigateWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8426",
    DisplayPriority = 200,
    Description = "$8427",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_destroyer1",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8393",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade1_1",
    RequiredResearch = "kpr_CapitalWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8432",
    DisplayPriority = 300,
    Description = "$8433",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_arsenalship",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade2_1",
    RequiredResearch = "kpr_CapitalWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8432",
    DisplayPriority = 300,
    Description = "$8433",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_arsenalship",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade3_1",
    RequiredResearch = "kpr_CapitalWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8432",
    DisplayPriority = 300,
    Description = "$8433",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_arsenalship",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade1_2",
    RequiredResearch = "kpr_CapitalWeaponUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8432",
    DisplayPriority = 300,
    Description = "$8433",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_sajuuks",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.1,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade2_2",
    RequiredResearch = "kpr_CapitalWeaponUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8432",
    DisplayPriority = 300,
    Description = "$8433",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_sajuuks",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.2,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalWeaponUpgrade3_2",
    RequiredResearch = "kpr_CapitalWeaponUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8432",
    DisplayPriority = 300,
    Description = "$8433",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_sajuuks",
    UpgradeName = "WEAPONDAMAGE",
    UpgradeValue = 1.3,
    Icon = Icon_Attack,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_AIHealthUpgrade1_1",
    RequiredResearch = "kpr_AIHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade2_1",
    RequiredResearch = "kpr_AIHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade3_1",
    RequiredResearch = "kpr_AIHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Fighter",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade1_2",
    RequiredResearch = "kpr_AIHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade2_2",
    RequiredResearch = "kpr_AIHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade3_2",
    RequiredResearch = "kpr_AIHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Family,
    TargetName = "Corvette",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade1_3",
    RequiredResearch = "kpr_AIHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_destroyer1",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade2_3",
    RequiredResearch = "kpr_AIHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_destroyer1",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_AIHealthUpgrade3_3",
    RequiredResearch = "kpr_AIHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8438",
    DisplayPriority = 201,
    Description = "$8439",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_destroyer1",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8399",
  },
  {
    Name = "kpr_CapitalHealthUpgrade1_1",
    RequiredResearch = "kpr_CapitalHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8444",
    DisplayPriority = 301,
    Description = "$8445",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_arsenalship",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalHealthUpgrade2_1",
    RequiredResearch = "kpr_CapitalHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8444",
    DisplayPriority = 301,
    Description = "$8445",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_arsenalship",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalHealthUpgrade3_1",
    RequiredResearch = "kpr_CapitalHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8444",
    DisplayPriority = 301,
    Description = "$8445",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_arsenalship",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalHealthUpgrade1_2",
    RequiredResearch = "kpr_CapitalHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8444",
    DisplayPriority = 301,
    Description = "$8445",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_sajuuks",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.1,
    Icon = Icon_Health,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalHealthUpgrade2_2",
    RequiredResearch = "kpr_CapitalHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8444",
    DisplayPriority = 301,
    Description = "$8445",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_sajuuks",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_CapitalHealthUpgrade3_2",
    RequiredResearch = "kpr_CapitalHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8444",
    DisplayPriority = 301,
    Description = "$8445",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_sajuuks",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.3,
    Icon = Icon_Health,
    ShortDisplayedName = "$8396",
  },
  {
    Name = "kpr_PlatformHealthUpgrade1_1",
    RequiredResearch = "kpr_PlatformHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_Deliver",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade2_1",
    RequiredResearch = "kpr_PlatformHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_Deliver",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.35,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade3_1",
    RequiredResearch = "kpr_PlatformHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_Deliver",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.5,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade1_2",
    RequiredResearch = "kpr_PlatformHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_carrier",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade2_2",
    RequiredResearch = "kpr_PlatformHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_carrier",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.35,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade3_2",
    RequiredResearch = "kpr_PlatformHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_carrier",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.5,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade1_3",
    RequiredResearch = "kpr_PlatformHealthUpgrade1",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_balcoragate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.2,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade2_3",
    RequiredResearch = "kpr_PlatformHealthUpgrade2",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_balcoragate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.35,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
  {
    Name = "kpr_PlatformHealthUpgrade3_3",
    RequiredResearch = "kpr_PlatformHealthUpgrade3",
    RequiredSubSystems = "",
    Cost = 0,
    Time = 0,
    DisplayedName = "$8450",
    DisplayPriority = 201,
    Description = "$8451",
    UpgradeType = Modifier,
    TargetType = Ship,
    TargetName = "kpr_balcoragate",
    UpgradeName = "MAXHEALTH",
    UpgradeValue = 1.5,
    Icon = Icon_Health,
    ShortDisplayedName = "$8402",
  },
}

dofilepath("data:scripts/races/AIscripts/AIReserch.lua")