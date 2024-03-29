-----------------------------------
--通用家园重制版AI脚本
--作者：萨尤克教主
--2017.12.26
-----------------------------------

--单位和子系统可按功能分为若干类型，不同类型的单位或子系统AI在使用和应对的策略上会有不同
--以下是所有重制版已有的单位/子系统类型：
--eMotherShip母舰类型，AI会将该类型下的单位视作母舰
--eCollector采集船类型，AI会建造该类型下的单位用于采集资源和残骸等
--eScout侦察机类型，AI会建造该类型下的单位用于侦察，AI会尽量让该类型的单位规避任何可能的战斗
--eRefinery精炼船类型，AI会建造该类型下的单位用于提供额外的资源卸载点
--eBuilder生产型船只类型，AI会用该类型下的单位建造船只，当该类型的单位即将被击杀时，AI会试图通过超跳来逃跑
--eDropOff拥有资源卸载点船只类型，AI会将该类型下的船只部署到矿区
--eSalvageDropOff能够卸载残骸的船只类型，显然精炼船不能划归此列
--eFighter战机类型，AI会根据敌人反战机能力调整该类型单位的建造优先级
--eCorvette护航艇类型，AI会根据敌人反护航艇能力调整该类型单位的建造优先级
--eFrigate护卫舰类型，AI会根据敌人反舰能力调整该类型单位的建造优先级
--eCapture捕捉单位，AI会建造该类型下的单位用于捕捉敌舰
--eShield防御场单位，AI会建造该类型下的单位用于伴随舰队并尝试开启防御场保护舰队
--ePlatform平台单位，AI会建造该类型下的单位并部署在家门口用于防御（高难度AI很少建造）
--eAntiFighter反战机单位，AI会根据敌人战机数量调整该类型单位的建造优先级
--eAntiCorvette反护航艇单位，AI会根据敌人护航艇数量调整该类型单位的建造优先级
--eAntiFrigate反护卫舰单位，AI会根据敌人护卫舰数量调整该类型单位的建造优先级
--eCapital主力舰单位，尚不清楚AI对该类型单位的具体使用和应对策略
--eNonThreat无威胁单位，AI不会将该类型下的单位视作首要威胁
--eHyperspaceGate超空间门单位，尚不清楚AI对该类型单位的具体使用和应对策略（AI并不懂得使用超空间门）
--eSubSystemAttackers反子系统单位，AI会用该类型单位摧毁敌人的关键子系统
--eNonCriticalSubSys非关键子系统，AI不会摧毁该类型下的子系统
--eGoodRepairAttackers采集船杀手单位，AI会更倾向于用该类型下的单位攻击敌人的采集船
--eUselessShips无用单位，AI不会建造该类型下的单位
--eBattleCruiser战巡单位，AI后期会以该类型下的单位作为主要进攻力量，会让该类型的单位及其附近的其他进攻力量直接超跳到敌人家门口
--eDestroyer驱逐单位，尚不清楚AI对该类型单位的具体使用和应对策略

eUselessShips = eMaxCount--22
eBattleCruiser = eMaxCount + 1
eDestroyer = eMaxCount + 2
eCustom1 = eMaxCount + 3
eCustom2 = eMaxCount + 4
eCustom3 = eMaxCount + 5
eCustom4 = eMaxCount + 6
eCustom5 = eMaxCount + 7
eCustom6 = eMaxCount + 8
sg_maxClasses = eCustom6  + 1--31

eSubsystemOwners=eCustom1
eCloak=eCustom2
eAntiCloak=eCustom3
--重制版有6个额外的单位/子系统分类供modder自定义，对自定义类型的单位/子系统，AI不会有特殊的使用策略
--想要添加自定义单位/子系统类型，可以在本段注释下方定义类型ID，然后按照下文格式进行定义
--如想要添加一个名为eTechBuilding的单位类型取代eCustom1，则在下面填写：
--eTechBuilding=eCustom1
--可供替换的单位类型ID共6个，即eCustom1-eCustom6

--将单位添加到某类型中，只需在相应table中建立元素，变量名为单位全称或子系统.subs文件中的TypeString（全大写），一个单位可归入多个类型当中
squadclass = {}

squadclass[eSubsystemOwners] = {
	HGN_MOTHERSHIP,
	HGN_CARRIER,  -- will need subsystem
	HGN_SHIPYARD,
	HGN_DESTROYER,
	HGN_BATTLECRUISER,
	HGN_LIGHTCRUISER,
	
	VGR_MOTHERSHIP,
	VGR_CARRIER,  -- will need subsystem
	VGR_SHIPYARD,
	VGR_DESTROYER,
	VGR_DEFENSECRUISER,
	VGR_BATTLECRUISER,

	KUS_DESTROYER,
	KUS_MISSILEDESTROYER,
	KUS_HEAVYCRUISER,

  	TAI_RESEARCHSTATION,
	TAI_DESTROYER,
	TAI_MISSILEDESTROYER,
	TAI_HEAVYCRUISER,
	TAI_BATTLESHIP,
	
	KAD_CARRIER,
	KAD_MOTHERSHIP,
	KAD_MOTHERSHIPLIGHT,
	KAD_MOTHERSHIPDARK,

	TUR_RESOURCECONTROLLER,
	TUR_SHIPYARD,
	TUR_CARRIER,
	TUR_HEAVYCRUISER,
}

squadclass[eCloak] = {
	KUS_CLOAKEDFIGHTER,

	KAD_CARRIER,
	KAD_VARIATIONSWARMER,

	KPR_DEFENSEFIELDFRIGATE,

	TUR_SCOUT,
	TUR_CLOAKGENERATOR,
	TUR_IONARRAYFRIGATE,
}

squadclass[eAntiCloak] = {
	HGN_GUNTURRET,

	VGR_PROBE_PROX,

	TAI_DEFENSEFIGHTER,
	TAI_HEAVYDEFENDER,

	KUS_CLOAKEDFIGHTER,

	KAD_GUNTURRET,
	KAD_VARIATIONSWARMER,

	KPR_PROXIMITYSENSOR,

	TUR_MINELAYERCORVETTE,
}

squadclass[eMotherShip] = {
	HGN_MOTHERSHIP,
	
	VGR_MOTHERSHIP,
	VGR_MOTHERSHIP_MAKAAN,

	TAI_MOTHERSHIP,	

	KUS_MOTHERSHIP,	

	KAD_MOTHERSHIP,
	KAD_MOTHERSHIPDARK,
	KAD_MOTHERSHIPLIGHT,

	KPR_BALCORAGATE,

	TUR_SHIPYARD,

	BEN_BENTUS,
}

-- can harvest
squadclass[eCollector] = {
	HGN_RESOURCECOLLECTOR,
	
	VGR_RESOURCECOLLECTOR,

	TAI_RESOURCECOLLECTOR,

	KUS_RESOURCECOLLECTOR,
	--KUS_SALVAGECORVETTE,
	--KUS_REPAIRCORVETTE,

	KAD_SALVAGER,

	KPR_RESOURCECOLLECTOR,

	TUR_RESOURCECOLLECTOR,
}

-- is a good scout/explorer
squadclass[eScout] = {
	HGN_SCOUT,
	HGN_PROBE,
	HGN_PROXIMITYSENSOR,
	HGN_ECMPROBE,
	
	VGR_SCOUT,
	VGR_PROBE,
	VGR_PROBE_PROX,
	VGR_PROBE_ECM,
	VGR_HYPERSPACE_PLATFORM,

	TAI_SCOUT,
	
	KUS_SCOUT,
	KUS_PROBE,
	--KUS_SENSORSARRAY,

	KAD_PROBE,
	
	KPR_SCOUT1,
	KPR_PROXIMITYSENSOR,
	
	TUR_SCOUT,
}

-- is a refinery
squadclass[eRefinery] = {
	HGN_RESOURCECONTROLLER,
	
	VGR_RESOURCECONTROLLER,

	TAI_RESOURCECONTROLLER,

	--KUS_RESOURCECONTROLLER,
	KUS_RESOURCEREFINERY,
	KUS_REPAIRCARRIER,

	KAD_RESOURCEFUELPOD,

	KPR_RESOURCECONTROLLER,
	
	TUR_GARBAGE,
}

-- can build ships
squadclass[eBuilder] = {
	HGN_MOTHERSHIP,
	HGN_CARRIER,  -- will need subsystem
	HGN_SHIPYARD,
		
	VGR_MOTHERSHIP,
	VGR_MOTHERSHIP_MAKAAN,
	VGR_SHIPYARD,
	--VGR_HYPERSPACE_PLATFORM_HQ,
	VGR_CARRIER,

	TAI_MOTHERSHIP,
	TAI_CARRIER,
  	TAI_RESEARCHSTATION,
	TAI_SHIPYARD,

	KUS_MOTHERSHIP,
	KUS_CARRIER,

	KAD_MOTHERSHIP,
	KAD_CARRIER,
	KAD_RESOURCEFUELPOD,

	KPR_BALCORAGATE,
	KPR_CARRIER,
	KPR_DELIVER,

	TUR_CARRIER,
	TUR_SHIPYARD,
	TUR_RESOURCECONTROLLER,

	BEN_BENTUS,
	BEN_FLOATINGCITY,
}

-- can be used as a resource dropoff
squadclass[eDropOff] = {
	HGN_MOTHERSHIP,
	HGN_CARRIER,  -- will need subsystem
	HGN_SHIPYARD,
	HGN_RESOURCECONTROLLER,
	
	VGR_MOTHERSHIP,
	VGR_MOTHERSHIP_MAKAAN,
	VGR_CARRIER,  -- will need subsystem
	VGR_SHIPYARD,
	VGR_RESOURCECONTROLLER,

	TAI_MOTHERSHIP,
	TAI_CARRIER,
  	TAI_RESEARCHSTATION,
	TAI_RESOURCECONTROLLER,
	TAI_SHIPYARD,

	KUS_MOTHERSHIP,
	KUS_CARRIER,
	KUS_REPAIRCARRIER,
	--KUS_RESOURCECONTROLLER,
	KUS_RESOURCEREFINERY,

	KAD_MOTHERSHIP,
	KAD_CARRIER,
	KAD_RESOURCEFUELPOD,

	KPR_BALCORAGATE,
	KPR_CARRIER,
	KPR_DELIVER,
	KPR_RESOURCECONTROLLER,

	TUR_CARRIER,
	TUR_SHIPYARD,
	TUR_RESOURCECONTROLLER,
	TUR_GARBAGE,
}

-- can be used as a salvage dropoff
squadclass[eSalvageDropOff] = {
	HGN_MOTHERSHIP,
	HGN_CARRIER,
	HGN_SHIPYARD,
	VGR_MOTHERSHIP,
	VGR_MOTHERSHIP_MAKAAN,
	VGR_CARRIER,
	VGR_SHIPYARD,

	TAI_MOTHERSHIP,
	TAI_CARRIER,
  	TAI_RESEARCHSTATION,
	TAI_SHIPYARD,

	KUS_MOTHERSHIP,
	KUS_CARRIER,

	KAD_MOTHERSHIP,
	KAD_CARRIER,

	KPR_CARRIER,
	KPR_DELIVER,

	TUR_CARRIER,
	TUR_SHIPYARD,
	TUR_RESOURCECONTROLLER,
	TUR_GARBAGE,
}

-- is a fighter
squadclass[eFighter] = {
	HGN_INTERCEPTOR,
	HGN_ATTACKBOMBER,
	HGN_ATTACKBOMBERELITE,
	
	VGR_INTERCEPTOR,
	VGR_BOMBER,
	VGR_LANCEFIGHTER,

	TAI_INTERCEPTOR,
	TAI_ATTACKBOMBER,
	TAI_DEFENSEFIGHTER,

	KUS_INTERCEPTOR,
	KUS_ATTACKBOMBER,
	KUS_CLOAKEDFIGHTER,

	KAD_SWARMER,
	KAD_ASSAULTSWARMER,
	KAD_LANCESWARMER,
	
	KPR_SCOUT,
	KPR_BOMBER,

	TUR_FIGHTER,
	TUR_ATTACKBOMBER,

	BEN_FIGHTER,
}

-- is a corvette
squadclass[eCorvette] = {
	HGN_ASSAULTCORVETTE,
	HGN_PULSARCORVETTE,
	HGN_MINELAYERCORVETTE,
	HGN_MULTIGUNCORVETTE,
	
	VGR_MISSILECORVETTE,
	VGR_LASERCORVETTE,
	VGR_MINELAYERCORVETTE,
	VGR_COMMANDCORVETTE,

	TAI_LIGHTCORVETTE,
	TAI_HEAVYCORVETTE,
	TAI_SALCAPCORVETTE,
	--TAI_REPAIRCORVETTE,
	
	--KUS_LIGHTCORVETTE,
	KUS_HEAVYCORVETTE,
	KUS_SALVAGECORVETTE,
	KUS_COMMANDCORVETTE,
	KUS_MULTIGUNCORVETTE,
	
	KAD_ADVANCEDASSAULTSWARMER,
	KAD_ADVANCEDSWARMER,
	KAD_VARIATIONSWARMER,

	KPR_MOVERS,
	KPR_MOVER1,
	KPR_HEAVYMOVER,
	KPR_CAPTUREMOVER,

	TUR_STANDARDCORVETTE,
	TUR_MISSILECORVETTE,
	TUR_MINELAYERCORVETTE,
	TUR_TORPEDOCORVETTE,
}

-- is a frigate
squadclass[eFrigate] = {
	HGN_ASSAULTFRIGATE,
	HGN_DEFENSEFIELDFRIGATE,
	HGN_IONCANNONFRIGATE,
	HGN_MARINEFRIGATE,
	HGN_MARINEFRIGATE_SOBAN,
	HGN_TORPEDOFRIGATE,
	HGN_TORPEDOFRIGATEELITE,
	
	VGR_ASSAULTFRIGATE,
	VGR_HEAVYMISSILEFRIGATE,
	VGR_INFILTRATORFRIGATE,
	VGR_EWFIGHTER,
	VGR_ARTILLERYFRIGATE,
	
	TAI_STANDARDFRIGATE,
	TAI_SUPPORTFRIGATE,
	TAI_DEFENSEFRIGATE,
	TAI_IONCANNONFRIGATE,

	KUS_ASSAULTFRIGATE,
	KUS_SUPPORTFRIGATE,
	--KUS_DRONEFRIGATE,
	KUS_IONCANNONFRIGATE,
	KUS_MISSILEFRIGATE,
	
	KAD_FUELPOD,
	KAD_MULTIBEAMFRIGATE,
	KAD_MILITARYFUELPOD,

	KPR_ASSAULTFRIGATE,
	KPR_IONCANNONFRIGATE,
	KPR_DESTROYERFRIGATE,
	KPR_DEFENSEFIELDFRIGATE,

	TUR_VULCANFRIGATE,
	TUR_IONARRAYFRIGATE,
	TUR_SIEGEDRILLFRIGATE,
	TUR_ENERGYFRIGATE,

	BEN_IONCANNONFRIGATE,
}

-- can capture other ships
squadclass[eCapture] = {
	HGN_MARINEFRIGATE,
	HGN_MARINEFRIGATE_SOBAN,
	VGR_INFILTRATORFRIGATE,

	TAI_SALCAPCORVETTE,

	KUS_SALVAGECORVETTE,

	KAD_MILITARYFUELPOD,

	KPR_CAPTUREMOVER,

	TUR_SIEGEDRILLFRIGATE,
}

-- has shields
squadclass[eShield] = {
	HGN_DEFENSEFIELDFRIGATE,

	VGR_EWFIGHTER,

	TAI_DEFENSEFRIGATE,

	KPR_DEFENSEFIELDFRIGATE,

	TUR_ENERGYFRIGATE,

	KAD_MOTHERSHIPDARK,
	KAD_FUELPOD,
	
	KUS_COMMANDCORVETTE,
}

-- is a platform
squadclass[ePlatform] = {
	HGN_IONTURRET,
	HGN_GUNTURRET,
	
	VGR_WEAPONPLATFORM_GUN,
	VGR_WEAPONPLATFORM_MISSILE,
	--VGR_HYPERSPACE_PLATFORM,

	--TAI_RESEARCHSHIP,
	TAI_HEAVYDEFENDER,
	TAI_SENSORSARRAY,
	--KUS_RESEARCHSHIP,
	--KUS_RESEARCHSHIPADV,
	KUS_GRAVWELLGENERATOR,
	
	KAD_GUNTURRET,

	--KPR_ENERGY_PHOTONBOMB,
	--KPR_ENERGY_PHOTONCANNON,
	--KPR_ENERGY_IONCANNON,
	--KPR_ENERGY_PHASEDCANNON,
	--KPR_ENERGY_PULSAR,
	--KPR_ENERGY_SUPERPULSAR,

	TUR_CLOAKGENERATOR,
	TUR_MINELAYERCORVETTE,
}

-- good at attacking fighters
squadclass[eAntiFighter] = {
	HGN_INTERCEPTOR,
	HGN_ASSAULTCORVETTE,
	HGN_ASSAULTFRIGATE,
	HGN_MULTIGUNCORVETTE,
	
	VGR_INTERCEPTOR,
	VGR_ASSAULTFRIGATE,
	VGR_WEAPONPLATFORM_GUN,

	TAI_INTERCEPTOR,
	TAI_HEAVYDEFENDER,
	TAI_LIGHTCORVETTE,
	TAI_MISSILEDESTROYER,

	KUS_INTERCEPTOR,
	--KUS_DEFENDER,
	--KUS_LIGHTCORVETTE,
	KUS_MULTIGUNCORVETTE,
	KUS_MISSILEFRIGATE,
	--KUS_DRONEFRIGATE,
	KUS_CLOAKEDFIGHTER,
	--KUS_MISSILEDESTROYER,

	KAD_SWARMER,
	KAD_ADVANCEDSWARMER,
	--KAD_VARIATIONSWARMER,
	--KAD_GUNTURRET,
	KAD_GUARDIANSPIRIT,

	KPR_MOVERS,
	KPR_ASSAULTFRIGATE,

	TUR_FIGHTER,
	TUR_STANDARDCORVETTE,
	TUR_VULCANFRIGATE,

	BEN_FIGHTER,
}

-- good at killing corvettes
squadclass[eAntiCorvette] = {
	HGN_PULSARCORVETTE,
	HGN_TORPEDOFRIGATE,
	HGN_TORPEDOFRIGATEELITE,
	HGN_DESTROYER,
	
	VGR_LANCEFIGHTER,
	VGR_LAZERCORVETTE,
	VGR_DESTROYER,

	TAI_HEAVYCORVETTE,
	TAI_STANDARDFRIGATE,
	TAI_MISSILEDESTROYER,

	--KUS_HEAVYCORVETTE,
	KUS_MULTIGUNCORVETTE,
	KUS_ASSAULTFRIGATE,
	KUS_MISSILEDESTROYER,
	KUS_CLOAKEDFIGHTER,

	KAD_LANCESWARMER,
	KAD_FUELPOD,
	KAD_GUARDIANSPIRIT,

	KPR_MOVER1,
	KPR_IONCANNONFRIGATE,

	TUR_MISSILECORVETTE,

	BEN_IONCANNONFRIGATE,
}

-- good at killing frigates
squadclass[eAntiFrigate] = {
	HGN_IONTURRET,
	HGN_ATTACKBOMBER,
	HGN_ATTACKBOMBERELITE,
	HGN_IONCANNONFRIGATE,
	--HGN_MARINEFRIGATE,
	--HGN_MARINEFRIGATE_SOBAN,
	--HGN_DEFENSEFIELDFRIGATE,
	HGN_DESTROYER,
	HGN_BATTLECRUISER,
	HGN_LIGHTCRUISER,
	
	VGR_BOMBER,
	VGR_HEAVYMISSILEFRIGATE,
	--VGR_INFILTRATORFRIGATE,
	VGR_DESTROYER,
	--VGR_BATTLECRUISER,
	VGR_WEAPONPLATFORM_MISSILE,
	VGR_ARTILLERYFRIGATE,

	TAI_ATTACKBOMBER,
	TAI_SALCAPCORVETTE,
	--TAI_DEFENSEFRIGATE,
	TAI_IONCANNONFRIGATE,
	TAI_DESTROYER,
	TAI_HEAVYCRUISER,
	TAI_BATTLESHIP,

	KUS_ATTACKBOMBER,
	--KUS_SALVAGECORVETTE,
	KUS_HEAVYCORVETTE,
	KUS_IONCANNONFRIGATE,
	KUS_DESTROYER,
	KUS_HEAVYCRUISER,

	KAD_ASSAULTSWARMER,
	KAD_ADVANCEDASSAULTSWARMER,
	KAD_MULTIBEAMFRIGATE,
	--KAD_MILITARYFUELPOD,
	--KAD_MOTHERSHIPLIGHT,

	KPR_BOMBER,
	KPR_HEAVYMOVER,
	--KPR_CAPTUREMOVER,
	KPR_DESTROYERFRIGATE,
	--KPR_DEFENSEFIELDFRIGATE,
	KPR_DESTROYER1,
	--KPR_ARSENALSHIP,
	KPR_DREADNAUGHT,
	--KPR_SAJUUKS,

	TUR_ATTACKBOMBER,
	--TUR_MINELAYERCORVETTE,
	TUR_TORPEDOCORVETTE,
	TUR_IONARRAYFRIGATE,
	--TUR_SIEGEDRILLFRIGATE,
	TUR_CARRIER,
	--TUR_HEAVYCRUISER,

	BEN_IONCANNONFRIGATE,
	BEN_DESTROYER,
	BEN_BATTLESHIP,
}

-- is a capital ship
squadclass[eCapital] = {
	HGN_CARRIER,
	HGN_MOTHERSHIP,
	HGN_SHIPYARD,
	HGN_DESTROYER,
	HGN_BATTLECRUISER,
	HGN_DREADNAUGHT,
	HGN_LIGHTCRUISER,
	
	VGR_CARRIER,
	VGR_MOTHERSHIP,
	VGR_MOTHERSHIP_MAKAAN,
	VGR_SHIPYARD,
	VGR_DESTROYER,
	VGR_DEFENSECRUISER,
	VGR_BATTLECRUISER,

	TAI_CARRIER,
	TAI_MOTHERSHIP,
  	TAI_RESEARCHSTATION,
	TAI_SHIPYARD,
	TAI_DESTROYER,
	TAI_MISSILEDESTROYER,
	TAI_HEAVYCRUISER,
	TAI_BATTLESHIP,

	KUS_CARRIER,
	KUS_MOTHERSHIP,
	KUS_DESTROYER,
	KUS_MISSILEDESTROYER,
	KUS_HEAVYCRUISER,

	KAD_CARRIER,
	KAD_MOTHERSHIP,
	KAD_GUARDIANSPIRIT,
	KAD_MOTHERSHIPDARK,
	KAD_MOTHERSHIPLIGHT,

	KPR_CARRIER,
	KPR_BALCORAGATE,
	KPR_DESTROYER1,
	KPR_ARSENALSHIP,
	KPR_DREADNAUGHT,
	KPR_SAJUUKS,

	TUR_SHIPYARD,
	TUR_RESOURCECONTROLLER,
	TUR_CARRIER,
	TUR_HEAVYCRUISER,
	
	BEN_BENTUS,
	BEN_FLOATINGCITY,
	BEN_DESTROYER,
	BEN_BATTLESHIP,
}

-- eCollector + eScout (maybe refineries - but those things are pretty tough?)
-- this is currently only used to count the number of 'military units' the player/enemy has
squadclass[eNonThreat] = {
	HGN_RESOURCECOLLECTOR,
	VGR_RESOURCECOLLECTOR,
	HGN_RESOURCECONTROLLER,
	VGR_RESOURCECONTROLLER,
	
	HGN_CARRIER,
	HGN_MOTHERSHIP,
	HGN_SHIPYARD,
	--VGR_CARRIER,
	VGR_MOTHERSHIP,
	VGR_MOTHERSHIP_MAKAAN,
	VGR_SHIPYARD,
	
	HGN_SCOUT,
	HGN_PROBE,
	HGN_PROXIMITYSENSOR,
	HGN_ECMPROBE,
		
	VGR_SCOUT,
	VGR_PROBE,
	VGR_PROBE_PROX,
	VGR_PROBE_ECM,
	
	--VGR_HYPERSPACE_PLATFORM,

	TAI_RESOURCECOLLECTOR,
	TAI_RESOURCECONTROLLER,
	TAI_CARRIER,
	TAI_MOTHERSHIP,
	TAI_RESEARCHSHIP,
	TAI_RESEARCHSHIP_1,
	TAI_RESEARCHSHIP_2,
	TAI_RESEARCHSHIP_3,
	TAI_RESEARCHSHIP_4,
  	TAI_RESEARCHSTATION,
	TAI_SHIPYARD,
	TAI_SCOUT,
	TAI_SENSORSARRAY,
	TAI_SUPPORTFRIGATE,
	--TAI_REPAIRCORVETTE,

	KUS_RESOURCECOLLECTOR,
	--KUS_RESOURCECONTROLLER,
	KUS_RESOUCEREFINERY,
	KUS_CARRIER,
	KUS_REPAIRCORVETTE,
	KUS_REPAIRCARRIER,
	KUS_MOTHERSHIP,
	KUS_RESEARCHSHIP,
	KUS_RESEARCHSHIP_1,
	KUS_RESEARCHSHIP_2,
	KUS_RESEARCHSHIP_3,
	KUS_RESEARCHSHIP_4,
	KUS_RESEARCHSHIP_5,
  	KUS_RESEARCHSHIPADV,
	KUS_RESEARCHSHIPADV_1,
	KUS_RESEARCHSHIPADV_2,
	KUS_RESEARCHSHIPADV_3,
	KUS_RESEARCHSHIPADV_4,
	KUS_RESEARCHSHIPADV_5,
	KUS_SCOUT,
	--KUS_SENSORSARRAY,
	KUS_SUPPORTFRIGATE,
	KUS_GRAVWELLGENERATOR,
	KUS_COMMANDCORVETTE,
	
	KAD_SALVAGER,
	KAD_RESOURCEFUELPOD,
	KAD_MOTHERSHIP,
	KAD_CARRIER,
	KAD_PROBE,
	KAD_ARANEID,

	KPR_RESOURCECOLLECTOR,
	KPR_RESOURCECONTROLLER,
	KPR_CARRIER,
	KPR_DELIVER,
	KPR_BALCORAGATE,
	KPR_SCOUT,
	KPR_ENERGY_PHOTONBOMB,
	KPR_ENERGY_PHOTONCANNON,
	KPR_ENERGY_IONCANNON,
	KPR_ENERGY_PHASEDCANNON,
	KPR_ENERGY_PULSAR,
	KPR_ENERGY_SUPERPULSAR,
	KPR_PROXIMITYSENSOR,

	TUR_RESOURCECOLLECTOR,
	TUR_GARBAGE,
	TUR_SHIPYARD,
	TUR_RESOURCECONTROLLER,
	TUR_CLOAKGENERATOR,
	TUR_SCOUT,
}

-- is a hyperspace gate
squadclass[eHyperspaceGate] = 
{
	--VGR_HYPERSPACE_PLATFORM
}

-- good at killing subsystems
squadclass[eSubSystemAttackers] = 
{
	HGN_ATTACKBOMBER,
	HGN_ATTACKBOMBERELITE,
	VGR_BOMBER,

	TAI_ATTACKBOMBER,

	KUS_ATTACKBOMBER,

	KAD_ASSAULTSWARMER,

	KPR_BOMBER,

	TUR_ATTACKBOMBER,
}

-- non critical subsystems
squadclass[eNonCriticalSubSys] = 
{
	CLOAKGENERATOR,
	FIRECONTROLTOWER,
	HYPERSPACEINHIBITOR,
	ADVANCEDARRAY,
	CLOAKSENSOR
}

-- good at killing repairing collectors
squadclass[eGoodRepairAttackers] = 
{
	HGN_ATTACKBOMBER,
	HGN_TORPEDOFRIGATE,
	HGN_PULSARCORVETTE,
	
	VGR_BOMBER,
	VGR_LASERCORVETTE,
	VGR_HEAVYMISSILEFRIGATE,

	TAI_ATTAKBOMBER,
	TAI_HEAVYCORVETTE,
	TAI_STANDARDFRIGATE,

	KUS_ATTACKBOMBER,
	KUS_HEAVYCORVETTE,
	KUS_ASSAULTFRIGATE,

	KAD_ASSAULTSWARMER,
	KAD_ADVANCEDASSAULTSWARMER,
	KAD_GUARDIANSPIRIT,

	KPR_BOMBER,
	KPR_HEAVYMOVER,
	KPR_ASSAULTFRIGATE,

	TUR_BOMBER,
	TUR_MINELAYERCORVETTE,

	BEN_IONCANNONFRIGATE,
}

-- ships that the AI should not build because they are not used properly
squadclass[ eUselessShips ] = 
{
	HGN_MINELAYERCORVETTE,
	--VGR_EWFIGHTER,
	VGR_MINELAYERCORVETTE,
}

-- is a battlecruiser
squadclass[eBattleCruiser] = 
{
	HGN_BATTLECRUISER,
	HGN_LIGHTCRUISER,

	VGR_BATTLECRUISER,
	VGR_DEFENSECRUISER,

	TAI_HEAVYCRUISER,
	TAI_BATTLESHIP,

	KUS_HEAVYCRUISER,

	KAD_MOTHERSHIPLIGHT,

	KPR_DREADNAUGHT,
	KPR_SAJUUKS,

	TUR_HEAVYCRUISER,

	BEN_BATTLESHIP,
}

squadclass[eDestroyer]=
{
	HGN_DESTROYER,
	VGR_DESTROYER,
	KUS_DESTROYER,
	TAI_DESTROYER,
	KUS_MISSILEDESTROYER,
	TAI_MISSILEDESTROYER,
	KPR_DESTROYER1,
	BEN_DESTROYER,
	KAD_GUARDIANSPIRIT,
	--TUR_CARRIER,
	--VGR_CARRIER,  -- will need subsystem
}

function FastAddToClass( tbl, classid )
	for a,b in tbl do
		AddToClass( b, classid )
	end
end

function ClassInitialize()
	for i=0, sg_maxClasses do
		if (squadclass[i]) then
			FastAddToClass( squadclass[i], i )
		end
	end		
	AddClassName( eMotherShip, "Motherships")
	AddClassName( eCollector, "Collectors")
	AddClassName( eDropOff, "DropOffs")
	AddClassName( eFighter, "Fighters")
	AddClassName( eFrigate, "Frigates")
	AddClassName( eCorvette, "Corvettes")
	AddClassName( eCapital, "Capital")
	AddClassName( eAntiFighter, "AntiFighter")
	AddClassName( eAntiCorvette, "AntiCorvette")
	AddClassName( eAntiFrigate, "AntiFrigate")
	AddClassName( ePlatform, "Platform")
	AddClassName( eRefinery, "Refinery")
	AddClassName( eHyperspaceGate, "HypGates")
	AddClassName( eShield, "Shields")
	AddClassName( eCapture, "Capture")
	AddClassName( eSubSystemAttackers, "SubSysKillas")
	AddClassName( eBattleCruiser, "BattleCruiser")
end

