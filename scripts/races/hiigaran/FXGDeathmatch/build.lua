Ship = 0
SubSystem = 1
build = {
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_lbc_AfterburnerEngine",
    RequiredResearch = "Hgn_lbc_AFTech",
    RequiredFleetSubSystems = "",
    DisplayPriority = 1,
    DisplayedName = "$2151",
    Description = "$8007",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_lbc_AfterburnerEngine",
    RequiredResearch = "",
    RequiredFleetSubSystems = "AdvancedCapShipProduction",
    DisplayPriority = 1,
    DisplayedName = "$2151",
    Description = "$8007",
  },
  {
    Type = SubSystem,
    ThingToBuild = "hgn_lbc_Turret",
    RequiredResearch = "",
    RequiredShipSubSystems = "! (HeavyTurret | PS)",
    DisplayPriority = 1,
    DisplayedName = "$8114",
    Description = "$8115",
  },
  {
    Type = SubSystem,
    ThingToBuild = "hgn_lbc_HeavyTurret",
    RequiredResearch = "",
    RequiredShipSubSystems = "! (Turret| PS)",
    DisplayPriority = 2,
    DisplayedName = "$8116",
    Description = "$8117",
  },
  {
    Type = SubSystem,
    ThingToBuild = "hgn_lbc_smallburstcannon",
    RequiredResearch = "",
    RequiredFleetSubSystems = "Research",
    DisplayPriority = 1,
    DisplayedName = "$2136",
    Description = "$7999",
  },
  {
    Type = SubSystem,
    ThingToBuild = "hgn_lbc_ioncannon_turret",
    RequiredResearch = "",
    RequiredFleetSubSystems = "AdvancedResearch",
    DisplayPriority = 1,
    DisplayedName = "$2026",
    Description = "$8000",
  },
--  {
--    Type = SubSystem,
--    ThingToBuild = "hgn_bc_burstcannon_turret",
--    RequiredResearch = "",
--    RequiredFleetSubSystems = "AdvancedResearch",
--    DisplayPriority = 1,
--    DisplayedName = "$2138",
--    Description = "$8002",
--  },
--{
--    Type = SubSystem,
--    ThingToBuild = "hgn_bc_Missiledefense_turret",
--    RequiredResearch = "",
--    RequiredFleetSubSystems = "AdvancedResearch",
--    DisplayPriority = 2,
--    DisplayedName = "$2140",
--    Description = "$8003",
--  },
--{
--    Type = SubSystem,
--    ThingToBuild = "hgn_bc_pulsararray",
--    RequiredResearch = "",
--    RequiredFleetSubSystems = "Research",
--    DisplayPriority = 3,
--    DisplayedName = "$2142",
--    Description = "$7999",
--  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Production_Fighter",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 0,
    DisplayedName = "$7000",
    Description = "$7001",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Production_Fighter",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 0,
    DisplayedName = "$7000",
    Description = "$7001",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Production_Corvette",
    RequiredResearch = "",
    RequiredFleetSubSystems = "! CorvetteProduction & FighterProduction",
    DisplayPriority = 0,
    DisplayedName = "$7002",
    Description = "$7003",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Production_Corvette",
    RequiredResearch = "",
    RequiredFleetSubSystems = "! CorvetteProduction & FighterProduction",
    DisplayPriority = 0,
    DisplayedName = "$7002",
    Description = "$7003",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Production_Frigate",
    RequiredResearch = "",
    RequiredFleetSubSystems = "FighterProduction",
    DisplayPriority = 0,
    DisplayedName = "$7004",
    Description = "$7005",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Production_Frigate",
    RequiredResearch = "",
    RequiredFleetSubSystems = "FighterProduction",
    DisplayPriority = 0,
    DisplayedName = "$7004",
    Description = "$7005",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Production_CapShip",
    RequiredResearch = "",
    RequiredFleetSubSystems = "FrigateProduction",
    DisplayPriority = 0,
    DisplayedName = "$7006",
    Description = "$7007",
  },
  {
    Type = SubSystem,
    ThingToBuild = "hgn_sy_production_capshipadvanced",
    RequiredResearch = "",
    RequiredFleetSubSystems = "AdvancedResearch",
    DisplayPriority = 0,
    DisplayedName = "$8112",
    Description = "$8131",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Module_PlatformControl",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 10,
    DisplayedName = "$7008",
    Description = "$7009",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Module_PlatformControl",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 20,
    DisplayedName = "$7008",
    Description = "$7009",
  },
	{
  	Type = SubSystem,
  	ThingToBuild = "Hgn_C_Module_Research",
  	RequiredResearch = "",
  	RequiredShipSubSystems = "",
  	DisplayPriority = 0,
  	DisplayedName = "$7010",
  	Description = "$7011",
	},
	{
  	Type = SubSystem,
  	ThingToBuild = "Hgn_C_Module_ResearchAdvanced",
  	RequiredResearch = "",
  	RequiredFleetSubSystems = "Research",
  	DisplayPriority = 10,
  	DisplayedName = "$7012",
  	Description = "$7013",
	},
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Module_Hyperspace",
    RequiredResearch = "",
    RequiredFleetSubSystems = "FrigateProduction",
    DisplayPriority = 30,
    DisplayedName = "$7014",
    Description = "$7015",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Module_Hyperspace",
    RequiredResearch = "",
    RequiredFleetSubSystems = "FrigateProduction",
    DisplayPriority = 30,
    DisplayedName = "$7014",
    Description = "$7015",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Module_HyperspaceInhibitor",
    RequiredResearch = "",
    RequiredFleetSubSystems = "CapShipProduction",
    DisplayPriority = 40,
    DisplayedName = "$7016",
    Description = "$7017",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Module_HyperspaceInhibitor",
    RequiredResearch = "",
    RequiredFleetSubSystems = "CapShipProduction",
    DisplayPriority = 40,
    DisplayedName = "$7016",
    Description = "$7017",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Module_CloakGenerator",
    RequiredResearch = "",
    RequiredFleetSubSystems = "Research",
    DisplayPriority = 50,
    DisplayedName = "$7018",
    Description = "$7019",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Module_CloakGenerator",
    RequiredResearch = "",
    RequiredFleetSubSystems = "Research",
    DisplayPriority = 50,
    DisplayedName = "$7018",
    Description = "$7019",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Module_FireControl",
    RequiredResearch = "",
    RequiredFleetSubSystems = "AdvancedResearch",
    DisplayPriority = 60,
    DisplayedName = "$7020",
    Description = "$7021",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Module_FireControl",
    RequiredResearch = "",
    RequiredFleetSubSystems = "AdvancedResearch",
    DisplayPriority = 60,
    DisplayedName = "$7020",
    Description = "$7021",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Module_Research",
    RequiredResearch = "",
    RequiredFleetSubSystems = "! Research",
    DisplayPriority = 70,
    DisplayedName = "$7010",
    Description = "$7011",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Module_ResearchAdvanced",
    RequiredResearch = "",
    RequiredFleetSubSystems = "FrigateProduction & (! AdvancedResearch)",
    DisplayPriority = 80,
    DisplayedName = "$7012",
    Description = "$7013",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Sensors_DetectHyperspace",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 150,
    DisplayedName = "$7036",
    Description = "$7037",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Sensors_DetectHyperspace",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 150,
    DisplayedName = "$7036",
    Description = "$7037",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Sensors_AdvancedArray",
    RequiredResearch = "",
    RequiredShipSubSystems = "AdvancedResearch",
    DisplayPriority = 151,
    DisplayedName = "$7022",
    Description = "$7023",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Sensors_AdvancedArray",
    RequiredResearch = "",
    RequiredShipSubSystems = "AdvancedResearch",
    DisplayPriority = 151,
    DisplayedName = "$7022",
    Description = "$7023",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_C_Sensors_DetectCloaked",
    RequiredResearch = "",
    RequiredFleetSubSystems = "CapShipProduction",
    DisplayPriority = 152,
    DisplayedName = "$7024",
    Description = "$7025",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Sensors_DetectCloaked",
    RequiredResearch = "",
    RequiredFleetSubSystems = "CapShipProduction",
    DisplayPriority = 152,
    DisplayedName = "$7024",
    Description = "$7025",
  },
  {
    Type = Ship,
    ThingToBuild = "Kpr_Mover",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 53,
    DisplayedName = "$7913",
    Description = "$7914",
  },
  {
    Type = SubSystem,
    ThingToBuild = "Hgn_MS_Production_CorvetteMover",
    RequiredResearch = "",
    RequiredShipSubSystems = "CorvetteProduction",
    DisplayPriority = 10,
    DisplayedName = "$7910",
    Description = "$7911",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_Scout",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 10,
    DisplayedName = "$7030",
    Description = "$7031",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_Interceptor",
    RequiredResearch = "",
    RequiredShipSubSystems = "FighterProduction",
    DisplayPriority = 20,
    DisplayedName = "$7032",
    Description = "$7033",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_AttackBomber",
    RequiredResearch = "",
    RequiredShipSubSystems = "FighterProduction",
    DisplayPriority = 25,
    DisplayedName = "$7034",
    Description = "$7035",
  },
  {
    Type = Ship,
    ThingToBuild = "hgn_attackdroidelite",
    RequiredResearch = "attackdroideliteWeapons",
    RequiredShipSubSystems = "FighterProduction",
    DisplayPriority = 30,
    DisplayedName = "$1708",
    Description = "$7954",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_AssaultCorvette",
    RequiredResearch = "",
    RequiredFleetSubSystems = "CorvetteProduction",
    DisplayPriority = 49,
    DisplayedName = "$7038",
    Description = "$7039",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_PulsarCorvette",
    RequiredResearch = "",
    RequiredFleetSubSystems = "CorvetteProduction",
    DisplayPriority = 51,
    DisplayedName = "$7040",
    Description = "$7041",
  },
  { 
    Type = Ship, 
    ThingToBuild = "hgn_multiguncorvette",
    RequiredResearch = "InstaAdvancedFrigateTech",
    RequiredFleetSubSystems = "CorvetteProduction",
    DisplayPriority = 52,
    DisplayedName = "$7930",
    Description = "$7931"
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_MinelayerCorvette",
    RequiredResearch = "GraviticAttractionMines",
    RequiredFleetSubSystems = "CorvetteProduction",
    DisplayPriority = 53,
    DisplayedName = "$7042",
    Description = "$7043",
  },
  {
    Type = Ship,
    ThingToBuild = "hgn_Moverelite",
    RequiredResearch = "DamageMoverTech",
    RequiredShipSubSystems = "MoverControl",
    DisplayPriority = 55,
    DisplayedName = "$7928",
    Description = "$7929",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_TorpedoFrigate",
    RequiredResearch = "",
    RequiredShipSubSystems = "FrigateProduction",
    DisplayPriority = 60,
    DisplayedName = "$7046",
    Description = "$7047",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_AssaultFrigate",
    RequiredResearch = "",
    RequiredShipSubSystems = "FrigateProduction",
    DisplayPriority = 65,
    DisplayedName = "$7048",
    Description = "$7049",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_IonCannonFrigate",
    RequiredResearch = "InstaAdvancedFrigateTech",
    RequiredShipSubSystems = "FrigateProduction",
    DisplayPriority = 70,
    DisplayedName = "$7050",
    Description = "$7051",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_AssaultMarineFrigate",
    RequiredResearch = "InstaAdvancedFrigateTech & Branch2",
    RequiredShipSubSystems = "FrigateProduction",
    DisplayPriority = 75,
    DisplayedName = "ǿϮ��½��",
    Description = "$7053",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_MarineFrigate2",
    RequiredResearch = "InstaAdvancedFrigateTech & (Branch1|Branch3)",
    RequiredShipSubSystems = "FrigateProduction",
    DisplayPriority = 75,
    DisplayedName = "$7052",
    Description = "$7053",
  },
{
    Type = Ship,
    ThingToBuild = "Hgn_DefenseFieldFrigate",
    RequiredResearch = "InstaAdvancedFrigateTech",
    RequiredShipSubSystems = "FrigateProduction",
    DisplayPriority = 80,
    DisplayedName = "$7044",
    Description = "$7045",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_Carrier",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 110,
    DisplayedName = "$7054",
    Description = "$7055",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_Shipyard",
    RequiredResearch = "",
    RequiredShipSubSystems = "Hyperspace",
    DisplayPriority = 112,
    DisplayedName = "$7058",
    Description = "$7059",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_Destroyer",
    RequiredResearch = "",
    RequiredShipSubSystems = "CapShipProduction | AdvancedCapShipProduction",
    DisplayPriority = 115,
    DisplayedName = "$7056",
    Description = "$7057",
  },
  {
    Type = Ship,
    ThingToBuild = "hgn_lightcruiser",
    RequiredResearch = "InstaAdvancedFrigateTech",
    RequiredShipSubSystems = "AdvancedResearch & (CapShipProduction | AdvancedCapShipProduction)",
    DisplayPriority = 118,
    DisplayedName = "$1907",
    Description = "$7916",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_Battlecruiser",
    RequiredResearch = "",
    RequiredShipSubSystems = "AdvancedCapShipProduction",
    DisplayPriority = 119,
    DisplayedName = "$7060",
    Description = "$7061",
  },
--  {
--    Type = Ship,
--    ThingToBuild = "Hgn_Battlecruiserelite",
--    RequiredResearch = "BattlecruiserIoneliteWeapons",
--    RequiredShipSubSystems = "AdvancedCapShipProduction",
--    DisplayPriority = 120,
--    DisplayedName = "$7924",
--    Description = "$7925",
--  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_GunTurret",
    RequiredResearch = "",
    RequiredFleetSubSystems = "Research",
    DisplayPriority = 130,
    DisplayedName = "$7062",
    Description = "$7063",
  },
 
  {
    Type = Ship,
    ThingToBuild = "Hgn_IonTurret",
    RequiredResearch = "",
    RequiredFleetSubSystems = "AdvancedResearch",
    DisplayPriority = 135,
    DisplayedName = "$7064",
    Description = "$7065",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_ResourceCollector",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 140,
    DisplayedName = "$7066",
    Description = "$7067",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_ResourceController",
    RequiredResearch = "",
    RequiredFleetSubSystems = "AdvancedResearch",
    DisplayPriority = 145,
    DisplayedName = "$7068",
    Description = "$7069",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_Probe",
    RequiredResearch = "",
    RequiredShipSubSystems = "",
    DisplayPriority = 150,
    DisplayedName = "$7070",
    Description = "$7071",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_ProximitySensor",
    RequiredResearch = "SensDisProbe",
    RequiredShipSubSystems = "",
    DisplayPriority = 151,
    DisplayedName = "$7072",
    Description = "$7073",
  },
  {
    Type = Ship,
    ThingToBuild = "Hgn_ECMProbe",
    RequiredResearch = "ECMProbe",
    RequiredShipSubSystems = "",
    DisplayPriority = 152,
    DisplayedName = "$7074",
    Description = "$7075",
  },
  
  {
    Type = Ship,
    ThingToBuild = "Hgn_Shipyard_SPG",
    RequiredResearch = "",
    RequiredShipSubSystems = "CapShipProduction",
    DisplayPriority = 117,
    DisplayedName = "$7058",
    Description = "$7059",
  },

}
