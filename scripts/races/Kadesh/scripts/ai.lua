function Override_Init()
	sg_dobuild = 1
	sg_dosubsystems = 1
	sg_doresearch = 1
	sg_doupgrades = 1
	sg_domilitary = 1
	sg_fightersize=2
	sg_corvettesize=2
	sg_frigatesize=1
	sg_kDemandResetValue = 4
	sg_kCollector = KAD_SALVAGER
	sg_classPersonalityDemand[ eFighter ] = 0.25
	sg_classPersonalityDemand[ eCorvette ] = 0.5
	sg_classPersonalityDemand[ eFrigate ] = 0.75
	sg_classPersonalityDemand[ ePlatform ] = -0.5
	SetResourceDockFamily("Utility")
	sg_numCollectorPerChannel=4
	sg_RUsPerChannel=500
	sg_ForceBuilderRU=2000
	sg_militaryDemand = 1
	sg_subSystemDemand = 0
	sg_shipDemand = 4
	sg_militaryToBuildPerCollector = 1
	sg_ScaleComp=4
	sg_debug=0
end

ai_data={}
ai_data[KAD_SWARMER]=
	{
		Name="KAD_SWARMER",
		Type="Ship",
		Require={FIGHTERPRODUCTION},
		Upgrades={KAD_FIGHTERWEAPONUPGRADE1,KAD_FIGHTERWEAPONUPGRADE2,KAD_FIGHTERWEAPONUPGRADE3,KAD_AIRHEALTHUPGRADE1,KAD_AIRHEALTHUPGRADE2,KAD_AIRHEALTHUPGRADE3},
		UpgradeDemand=1,
		--SizeControl={eFighter,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Fighter",
		AddDemand=
		{
			{KAD_ADVANCEDSWARMER,-1},
			{KAD_GUARDIANSPIRIT,-10},
		},
	}
ai_data[KAD_ASSAULTSWARMER]=
	{
		Name="KAD_ASSAULTSWARMER",
		Type="Ship",
		Require={FIGHTERPRODUCTION},
		Upgrades={KAD_FIGHTERWEAPONUPGRADE1,KAD_FIGHTERWEAPONUPGRADE2,KAD_FIGHTERWEAPONUPGRADE3,KAD_AIRHEALTHUPGRADE1,KAD_AIRHEALTHUPGRADE2,KAD_AIRHEALTHUPGRADE3},
		UpgradeDemand=1,
		--SizeControl={eFighter,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Fighter",
	}
ai_data[KAD_LANCESWARMER]=
	{
		Name="KAD_LANCESWARMER",
		Type="Ship",
		Require={FIGHTERPRODUCTION},
		Upgrades={KAD_FIGHTERWEAPONUPGRADE1,KAD_FIGHTERWEAPONUPGRADE2,KAD_FIGHTERWEAPONUPGRADE3,KAD_AIRHEALTHUPGRADE1,KAD_AIRHEALTHUPGRADE2,KAD_AIRHEALTHUPGRADE3},
		UpgradeDemand=1,
		--SizeControl={eFighter,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Fighter",
		AddDemand=
		{
			{KAD_GUARDIANSPIRIT,-10},
		},
	}
ai_data[KAD_VARIATIONSWARMER]=
	{
		Name="KAD_VARIATIONSWARMER",
		Type="Ship",
		Require={CORVETTEPRODUCTION,LIQUIDMETAL},
		Upgrades={KAD_CORVETTEWEAPONUPGRADE1,KAD_CORVETTEWEAPONUPGRADE2,KAD_CORVETTEWEAPONUPGRADE3,KAD_AIRHEALTHUPGRADE1,KAD_AIRHEALTHUPGRADE2,KAD_AIRHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		LODDemand={-200,-100,-50,0,},
		AddDemand=
		{
			{KAD_MOTHERSHIPDARK,200},
		},
		UnitCap="Swarmerelite",
	}
ai_data[KAD_ADVANCEDSWARMER]=
	{
		Name="KAD_ADVANCEDSWARMER",
		Type="Ship",
		Require={CORVETTEPRODUCTION},
		Upgrades={KAD_CORVETTEWEAPONUPGRADE1,KAD_CORVETTEWEAPONUPGRADE2,KAD_CORVETTEWEAPONUPGRADE3,KAD_AIRHEALTHUPGRADE1,KAD_AIRHEALTHUPGRADE2,KAD_AIRHEALTHUPGRADE3},
		UpgradeDemand=1,
		--SizeControl={eCorvette,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=1,
		UnitCap="AdvancedSwarmer",
		AddDemand=
		{
			{KAD_GUARDIANSPIRIT,-10},
		},
	}
ai_data[KAD_ADVANCEDASSAULTSWARMER]=
	{
		Name="KAD_ADVANCEDASSAULTSWARMER",
		Type="Ship",
		Require={CORVETTEPRODUCTION},
		Upgrades={KAD_CORVETTEWEAPONUPGRADE1,KAD_CORVETTEWEAPONUPGRADE2,KAD_CORVETTEWEAPONUPGRADE3,KAD_AIRHEALTHUPGRADE1,KAD_AIRHEALTHUPGRADE2,KAD_AIRHEALTHUPGRADE3},
		UpgradeDemand=1,
		--SizeControl={eCorvette,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=1,
		UnitCap="AdvancedSwarmer",
	}
ai_data[KAD_FUELPOD]=
	{
		Name="KAD_FUELPOD",
		Type="Ship",
		Require={CAPSHIP},
		Upgrades={KAD_SHIPWEAPONUPGRADE1,KAD_SHIPWEAPONUPGRADE2,KAD_SHIPWEAPONUPGRADE3,KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=-10,
		AddDemand=
		{
			{KAD_ASSAULTSWARMER,1},
			{KAD_LANCESWARMER,1},
			{KAD_SWARMER,1},
			{KAD_ADVANCEDSWARMER,1},
			{KAD_ADVANCEDASSAULTSWARMER,1},
		},
		UnitCap="Frigate",
	}
ai_data[KAD_MULTIBEAMFRIGATE]=
	{
		Name="KAD_MULTIBEAMFRIGATE",
		Type="Ship",
		Require={CAPSHIPPRODUCTION,CAPSHIPPRODUCTION,CAPSHIPPRODUCTION,CAPSHIPPRODUCTION,CAPSHIPPRODUCTION,},
		Upgrades={KAD_SHIPWEAPONUPGRADE1,KAD_SHIPWEAPONUPGRADE2,KAD_SHIPWEAPONUPGRADE3,KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eMotherShip,8},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		LODDemand={0,2,4,6,},
		AddDemand=
		{
			{KAD_MOTHERSHIP,10},
			{KAD_MOTHERSHIPLIGHT,10},
			{KAD_MOTHERSHIPDARK,100},
		},
		UnitCap="Frigate",
	}
ai_data[KAD_MILITARYFUELPOD]=
	{
		Name="KAD_MILITARYFUELPOD",
		Type="Ship",
		Require={CAPSHIPADVANCED},
		Upgrades={KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFrigate,0.4},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=50,
		LODDemand={-40,-20,0,20,},
		UnitCap="militaryCapture",
	}
ai_data[KAD_CARRIER]=
	{
		Name="KAD_CARRIER",
		Type="Ship",
		Require={CAPSHIP},
		Upgrades={KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eBuilder,0.2},
		BuildShipChannel=1,
		BuildSubsystemChannel=1,
		BasicDemand=0,
		UnitCap="kadCarrier",
	}
ai_data[KAD_MOTHERSHIP]=
	{
		Name="KAD_MOTHERSHIP",
		Type="Ship",
		Require={CAPSHIP},
		Upgrades={KAD_SHIPWEAPONUPGRADE1,KAD_SHIPWEAPONUPGRADE2,KAD_SHIPWEAPONUPGRADE3,KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=50,
		BuildShipChannel=1,
		BuildSubsystemChannel=1,
		BasicDemand=10,
		UnitCap="AttackMothership",
	}
ai_data[KAD_MOTHERSHIPLIGHT]=
	{
		Name="KAD_MOTHERSHIPLIGHT",
		Type="Ship",
		Require={KADLIGHT},
		Upgrades={KAD_SHIPWEAPONUPGRADE1,KAD_SHIPWEAPONUPGRADE2,KAD_SHIPWEAPONUPGRADE3,KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=1,
		BuildSubsystemChannel=1,
		BasicDemand=5000,
		UnitCap="AttackMothership",
	}
ai_data[KAD_MOTHERSHIPDARK]=
	{
		Name="KAD_MOTHERSHIPDARK",
		Type="Ship",
		Require={CAPSHIPADVANCED},
		Upgrades={KAD_SHIPWEAPONUPGRADE1,KAD_SHIPWEAPONUPGRADE2,KAD_SHIPWEAPONUPGRADE3,KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=1,
		BuildSubsystemChannel=1,
		BasicDemand=5000,
		UnitCap="AttackMothership",
	}
ai_data[KAD_ARANEID]=
	{
		Name="KAD_ARANEID",
		Type="Ship",
		Require={PLATFORMPRODUCTION},
		Upgrades={KAD_PLATFORMHEALTHUPGRADE1,KAD_PLATFORMHEALTHUPGRADE2,KAD_PLATFORMHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFrigate,0.25},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		AddDemand=
		{
			{KAD_MULTIBEAMFRIGATE,1},
			{KAD_GUARDIANSPIRIT,4},
		},
		LODDemand={-8,-4,-2,0},
		UnitCap="Platform",
	}
ai_data[KAD_GUNTURRET]=
	{
		Name="KAD_GUNTURRET",
		Type="Ship",
		Require={PLATFORMPRODUCTION},
		Upgrades={KAD_PLATFORMHEALTHUPGRADE1,KAD_PLATFORMHEALTHUPGRADE2,KAD_PLATFORMHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		SizeControl={eCollector,0.2},
		BasicDemand=-20,
		AddDemand=
		{
			{KAD_SALVAGER,1},
		},
		UnitCap="Platform",
	}
ai_data[KAD_GUARDIANSPIRIT]=
	{
		Name="KAD_GUARDIANSPIRIT",
		Type="Ship",
		Require={SUPERSWARMER},
		Upgrades={KAD_SHIPWEAPONUPGRADE1,KAD_SHIPWEAPONUPGRADE2,KAD_SHIPWEAPONUPGRADE3,KAD_SHIPHEALTHUPGRADE1,KAD_SHIPHEALTHUPGRADE2,KAD_SHIPHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=25,
		UnitCap="GuardianSpirit",
	}
ai_data[KAD_PROBE]=
	{
		Name="KAD_PROBE",
		Type="Ship",
		Require={},
		Upgrades={},
		UpgradeDemand=0,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=-1,
		UnitCap="Probe",
	}
ai_data[KAD_SALVAGER]=
	{
		Name="KAD_SALVAGER",
		Type="Ship",
		Require={},
		Upgrades={},
		UpgradeDemand=0,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="ResourceCollector",
	}
ai_data[KAD_RESOURCEFUELPOD]=
	{
		Name="KAD_RESOURCEFUELPOD",
		Type="Ship",
		Require={PLATFORMPRODUCTION,CAPSHIP},
		Upgrades={},
		UpgradeDemand=0,
		BuildShipChannel=1,
		BuildSubsystemChannel=0,
		BasicDemand=20,
		AddDemand=
		{
			{KAD_SALVAGER,1},
			{KAD_MOTHERSHIP,-5},
			{KAD_MOTHERSHIPLIGHT,-5},
			{KAD_MOTHERSHIPDARK,-5},
		},
		UnitCap="fuelpod",
	}
ai_data[FIGHTERPRODUCTION]=
	{
		Name="FIGHTERPRODUCTION",
		Type="Subsystem",
		Require={},
		IsForFleet=1,
		BasicDemand=1,
	}
--ai_data[LANCE]=
--	{
--		Type="Subsystem",
--		Require={FIGHTERPRODUCTION},
--		IsForFleet=1,
--		BasicDemand=0,
--	}
ai_data[CORVETTEPRODUCTION]=
	{
		Name="CORVETTEPRODUCTION",
		Type="Subsystem",
		Require={FIGHTERPRODUCTION},
		IsForFleet=1,
		BasicDemand=50,
	}
--ai_data[FRIGATEPRODUCTION]=
--	{
--		Type="Subsystem",
--		Require={FIGHTERPRODUCTION},
--		IsForFleet=1,
--		BasicDemand=0,
--	}
ai_data[CAPSHIP]=
	{
		Name="CAPSHIP",
		Type="Subsystem",
		Require={CORVETTEPPRODUCTION},
		IsForFleet=0,
		BasicDemand=0,
	}
ai_data[CAPSHIPPRODUCTION]=
	{
		Name="CAPSHIPPRODUCTION",
		Type="Subsystem",
		Require={CAPSHIP},
		IsForFleet=1,
		BasicDemand=10,
	}
ai_data[CAPSHIPADVANCED]=
	{
		Name="CAPSHIPADVANCED",
		Type="Subsystem",
		Require={CAPSHIP},
		IsForFleet=0,
		BasicDemand=0,
	}
ai_data[PLATFORMPRODUCTION]=
	{
		Name="PLATFORMPRODUCTION",
		Type="Subsystem",
		Require={FIGHTERPRODUCTION,},
		IsForFleet=1,
		BasicDemand=-5,
		AddDemand=
		{
			{KAD_SALVAGER,1},
			{KAD_MILITARYFUELPOD,2},
			{KAD_MULTIBEAMFRIGATE,2},
			{KAD_FUELPOD,2},
			{KAD_RESOURCEFUELPOD,2},
			{KAD_GUARDIANSPIRIT,4},
			{KAD_MOTHERSHIP,6},
			{KAD_MOTHERSHIPLIGHT,6},
			{KAD_MOTHERSHIPDARK,6},
		},
	}
--ai_data[CLUSTERGUN]=
--	{
--		Type="Subsystem",
--		Require={CORVETTEPRODUCTION},
--		IsForFleet=1,
--		BasicDemand=0,
--	}
--ai_data[MISSILE]=
--	{
--		Type="Subsystem",
--		Require={CORVETTEPRODUCTION},
--		IsForFleet=1,
--		BasicDemand=0,
--	}
ai_data[HYPERSPACE]=
	{
		Name="HYPERSPACE",
		Type="Subsystem",
		Require={CAPSHIP},
		IsForFleet=1,
		BasicDemand=0,
	}
ai_data[SUPERSWARMER]=
	{
		Name="SUPERSWARMER",
		Type="Subsystem",
		Require={CAPSHIP},
		IsForFleet=1,
		BasicDemand=0,
	}
ai_data[KADLIGHT]=
	{
		Name="KADLIGHT",
		Type="Subsystem",
		Require={CAPSHIPADVANCED},
		IsForFleet=1,
		BasicDemand=0,
	}
ai_data[LIQUIDMETAL]=
	{
		Name="LIQUIDMETAL",
		Type="Subsystem",
		Require={CAPSHIP},
		IsForFleet=1,
		BasicDemand=0,
	}


function Proc_DetermineDemandWithNoCounterInfo()
end

function Proc_DetermineSpecialDemand()
end

function CpuBuildSS_DefaultSubSystemDemandRules()
end

function DoResearchTechDemand()
end


function Override_MilitaryInit()
	if (sg_Delay==0) then
		cp_attackPercent=0
	end
end