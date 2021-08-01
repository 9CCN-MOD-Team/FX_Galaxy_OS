function Override_Init()
	sg_dobuild = 1
	sg_dosubsystems = 1
	sg_doresearch = 1
	sg_doupgrades = 1
	sg_domilitary = 1
	sg_fightersize=1
	sg_corvettesize=1
	sg_frigatesize=1
	sg_kDemandResetValue = 4
	sg_kCollector = VGR_RESOURCECOLLECTOR
	sg_classPersonalityDemand[ eFighter ] = 0.25
	sg_classPersonalityDemand[ eCorvette ] = 0.25
	sg_classPersonalityDemand[ eFrigate ] = 0.75
	sg_classPersonalityDemand[ ePlatform ] = -0.5
	SetResourceDockFamily("Utility")
	sg_numCollectorPerChannel=4
	sg_RUsPerChannel=500
	sg_ForceBuilderRU=1500
	sg_militaryDemand = 1
	sg_subSystemDemand = 0
	sg_shipDemand = 4
	sg_militaryToBuildPerCollector = 1
	sg_debug=0
end

ai_data={}
ai_data[VGR_SCOUT]=
	{
		Name="VGR_SCOUT",
		Type="Ship",
		Require={},
		Upgrades={},
		UpgradeDemand=0,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="scout",
	}
ai_data[VGR_INTERCEPTOR]=
	{
		Name="VGR_INTERCEPTOR",
		Type="Ship",
		Require={FIGHTERPRODUCTION},
		Upgrades={VGR_AIRWEAPONUPGRADE1,VGR_AIRWEAPONUPGRADE2,VGR_AIRWEAPONUPGRADE3,VGR_FIGHTERHEALTHUPGRADE1,VGR_FIGHTERHEALTHUPGRADE2,VGR_FIGHTERHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFighter,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Fighter",
	}
ai_data[VGR_BOMBER]=
	{
		Name="VGR_BOMBER",
		Type="Ship",
		Require={NUCLEARBOMB},
		Upgrades={VGR_AIRWEAPONUPGRADE1,VGR_AIRWEAPONUPGRADE2,VGR_AIRWEAPONUPGRADE3,VGR_FIGHTERHEALTHUPGRADE1,VGR_FIGHTERHEALTHUPGRADE2,VGR_FIGHTERHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFighter,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Fighter",
	}
ai_data[VGR_LANCEFIGHTER]=
	{
		Name="VGR_LANCEFIGHTER",
		Type="Ship",
		Require={FIGHTERLANCE},
		Upgrades={VGR_AIRWEAPONUPGRADE1,VGR_AIRWEAPONUPGRADE2,VGR_AIRWEAPONUPGRADE3,VGR_FIGHTERHEALTHUPGRADE1,VGR_FIGHTERHEALTHUPGRADE2,VGR_FIGHTERHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFighter,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Fighter",
	}
ai_data[VGR_MISSILECORVETTE]=
	{
		Name="VGR_MISSILECORVETTE",
		Type="Ship",
		Require={CORVETTEPRODUCTION},
		Upgrades={VGR_AIRWEAPONUPGRADE1,VGR_AIRWEAPONUPGRADE2,VGR_AIRWEAPONUPGRADE3,VGR_CORVETTEHEALTHUPGRADE1,VGR_CORVETTEHEALTHUPGRADE2,VGR_CORVETTEHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eCorvette,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Corvette",
	}
ai_data[VGR_LASERCORVETTE]=
	{
		Name="VGR_LASERCORVETTE",
		Type="Ship",
		Require={CORVETTELASER},
		Upgrades={VGR_AIRWEAPONUPGRADE1,VGR_AIRWEAPONUPGRADE2,VGR_AIRWEAPONUPGRADE3,VGR_CORVETTEHEALTHUPGRADE1,VGR_CORVETTEHEALTHUPGRADE2,VGR_CORVETTEHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eCorvette,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Corvette",
	}
ai_data[VGR_ASSAULTFRIGATE]=
	{
		Name="VGR_ASSAULTFRIGATE",
		Type="Ship",
		Require={FRIGATEPRODUCTION,CAPSHIPPRODUCTION,ADVANCEDPRODUCTION},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_FRIGATEHEALTHUPGRADE1,VGR_FRIGATEHEALTHUPGRADE2,VGR_FRIGATEHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFrigate,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Frigate",
	}
ai_data[VGR_HEAVYMISSILEFRIGATE]=
	{
		Name="VGR_HEAVYMISSILEFRIGATE",
		Type="Ship",
		Require={FRIGATEPRODUCTION,CAPSHIPPRODUCTION,ADVANCEDPRODUCTION},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_FRIGATEHEALTHUPGRADE1,VGR_FRIGATEHEALTHUPGRADE2,VGR_FRIGATEHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFrigate,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="Frigate",
	}
ai_data[VGR_INFILTRATORFRIGATE]=
	{
		Name="VGR_INFILTRATORFRIGATE",
		Type="Ship",
		Require={FRIGATEINFILTRATOR,CAPSHIPPRODUCTION,ADVANCEDPRODUCTION},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_FRIGATEHEALTHUPGRADE1,VGR_FRIGATEHEALTHUPGRADE2,VGR_FRIGATEHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		SizeControl={eFrigate,0.4},
		BasicDemand=2,
		UnitCap="CaptureFrigate",
	}
ai_data[VGR_EWFIGHTER]=
	{
		Name="VGR_EWFIGHTER",
		Type="Ship",
		Require={FRIGATEEW,CAPSHIPPRODUCTION,ADVANCEDPRODUCTION},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_FRIGATEHEALTHUPGRADE1,VGR_FRIGATEHEALTHUPGRADE2,VGR_FRIGATEHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=2,
		LODDemand={-2,-1,0,1},
		UnitCap="DefenseFieldFrigate",
	}
ai_data[VGR_ARTILLERYFRIGATE]=
	{
		Name="VGR_ARTILLERYFRIGATE",
		Type="Ship",
		Require={FRIGATEARTILLERY,CAPSHIPPRODUCTION,ADVANCEDPRODUCTION},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_FRIGATEHEALTHUPGRADE1,VGR_FRIGATEHEALTHUPGRADE2,VGR_FRIGATEHEALTHUPGRADE3},
		UpgradeDemand=1,
		SizeControl={eFrigate,0.7},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=1,
		LODDemand={-2,-1,0,1},
		UnitCap="Frigate",
	}
ai_data[VGR_CARRIER]=
	{
		Name="VGR_CARRIER",
		Type="Ship",
		Require={},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_CAPITALHEALTHUPGRADE1,VGR_CAPITALHEALTHUPGRADE2,VGR_CAPITALHEALTHUPGRADE3},
		UpgradeDemand=1,
		UpgradeSubsystem=
		{
			{2,NUCLEARBOMB,FIGHTERLANCE,CORVETTELASER,FRIGATEARTILLERY,FRIGATEINFILTRATOR,FRIGATEEW},
			--{1,HYPERSPACE},
			{1,MISSILELAUNCHER,ADVANCEDPRODUCTION,RESEARCH},
		},
		BuildShipChannel=1,
		BuildSubsystemChannel=1,
		BasicDemand=10,
		AddDemand=
		{
			{VGR_CARRIER,-5},
		},
		UnitCap="Carrier",
	}
ai_data[VGR_MOTHERSHIP]=
	{
		Name="VGR_MOTHERSHIP",
		Type="Ship",
		Require={},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_CAPITALHEALTHUPGRADE1,VGR_CAPITALHEALTHUPGRADE2,VGR_CAPITALHEALTHUPGRADE3},
		UpgradeDemand=1,
		UpgradeSubsystem=
		{
			--{1,FRIGATEPRODUCTION},
			--{1,HYPERSPACE},
			{1,FRIGATEARTILLERY,FRIGATEINFILTRATOR,FRIGATEEW},
			{1,NUCLEARBOMB,FIGHTERLANCE,CORVETTELASER},
		},
		BuildShipChannel=1,
		BuildSubsystemChannel=1,
		BasicDemand=0,
		UnitCap="Mothership",
	}
ai_data[VGR_SHIPYARD]=
	{
		Name="VGR_SHIPYARD",
		Type="Ship",
		Require={HYPERSPACE},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_CAPITALHEALTHUPGRADE1,VGR_CAPITALHEALTHUPGRADE2,VGR_CAPITALHEALTHUPGRADE3},
		UpgradeDemand=1,
		UpgradeSubsystem=
		{
			{6,NUCLEARBOMB,FIGHTERLANCE,CORVETTELASER,FRIGATEARTILLERY,FRIGATEINFILTRATOR,FRIGATEEW},
		},
		BuildShipChannel=1,
		BuildSubsystemChannel=1,
		BasicDemand=10,
		UnitCap="Shipyard",
	}
ai_data[VGR_DESTROYER]=
	{
		Name="VGR_DESTROYER",
		Type="Ship",
		Require={CAPSHIPPRODUCTION,ADVANCEDCAPSHIPPRODUCTION,-VGR_SHIPYARD},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_CAPITALHEALTHUPGRADE1,VGR_CAPITALHEALTHUPGRADE2,VGR_CAPITALHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=2,
		UnitCap="Destroyer",
	}
ai_data[VGR_BATTLECRUISER]=
	{
		Name="VGR_BATTLECRUISER",
		Type="Ship",
		Require={ADVANCEDCAPSHIPPRODUCTION,ADVANCEDCAPSHIPPRODUCTION,ADVANCEDCAPSHIPPRODUCTION,VGR_SHIPYARD,VGR_SHIPYARD,VGR_SHIPYARD},
		Upgrades={VGR_SHIPWEAPONUPGRADE1,VGR_SHIPWEAPONUPGRADE2,VGR_SHIPWEAPONUPGRADE3,VGR_CAPITALHEALTHUPGRADE1,VGR_CAPITALHEALTHUPGRADE2,VGR_CAPITALHEALTHUPGRADE3},
		UpgradeDemand=1,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=5,
		AddDemand=
		{
			{VGR_SHIPYARD,50},
		},
		UnitCap="Battlecruiser",
	}
ai_data[VGR_RESOURCECOLLECTOR]=
	{
		Name="VGR_RESOURCECOLLECTOR",
		Type="Ship",
		Require={},
		Upgrades={},
		UpgradeDemand=0,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="ResourceCollector",
	}
ai_data[VGR_RESOURCECONTROLLER]=
	{
		Name="VGR_RESOURCECONTROLLER",
		Type="Ship",
		Require={RESEARCH},
		Upgrades={},
		UpgradeDemand=0,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=0,
		UnitCap="ResourceController",
	}
ai_data[VGR_WEAPONPLATFORM_MISSILE]=
	{
		Name="VGR_WEAPONPLATFORM_MISSILE",
		Type="Ship",
		Require={RESEARCH},
		Upgrades={},
		UpgradeDemand=0,
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		SizeControl={eCollector,0.2},
		BasicDemand=-20,
		AddDemand=
		{
			{VGR_RESOURCECOLLECTOR,1},
		},
		UnitCap="Platform",
	}
ai_data[VGR_HYPERSPACE_PLATFORM]=
	{
		Name="VGR_HYPERSPACE_PLATFORM",
		Type="Ship",
		Require={HYPERSPACE},
		Upgrades={},
		UpgradeDemand=0,
		SizeControl={eBuilder,2},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=10,
		LODDemand={-20,-10,0,10},
		UnitCap="Platform",
	}
--ai_data[VGR_HYPERSPACE_PLATFORM_HQ]=
--	{
--		Type="Ship",
--		Require={},
--		Upgrades={},
--		UpgradeDemand=0,
--		BuildShipChannel=1,
--		BuildSubsystemChannel=0,
--		BasicDemand=-1000,
--		UnitCap="Platform",
--	}
ai_data[VGR_PROBE_PROX]=
	{
		Name="VGR_PROBE_PROX",
		Type="Ship",
		Require={RESEARCH},
		Upgrades={},
		UpgradeDemand=0,
		SizeControl={eScout,0.5},
		BuildShipChannel=0,
		BuildSubsystemChannel=0,
		BasicDemand=-1,
		UnitCap="Platform",
	}
ai_data[FIGHTERPRODUCTION]=
	{
		Name="FIGHTERPRODUCTION",
		Type="Subsystem",
		Require={},
		IsForFleet=1,
		BasicDemand=0.1,
	}
ai_data[FIGHTERLANCE]=
	{
		Name="FIGHTERLANCE",
		Type="Subsystem",
		Require={FIGHTERPRODUCTION},
		IsForFleet=0,
		BasicDemand=0,
		UpgradeOnly=1,
	}
ai_data[NUCLEARBOMB]=
	{
		Name="NUCLEARBOMB",
		Type="Subsystem",
		Require={FIGHTERPRODUCTION},
		IsForFleet=0,
		BasicDemand=0,
		UpgradeOnly=1,
	}
ai_data[CORVETTEPRODUCTION]=
	{
		Name="CORVETTEPRODUCTION",
		Type="Subsystem",
		Require={FIGHTERPRODUCTION},
		IsForFleet=1,
		BasicDemand=0,
	}
ai_data[CORVETTELASER]=
	{
		Name="CORVETTELASER",
		Type="Subsystem",
		Require={CORVETTEPRODUCTION},
		IsForFleet=0,
		BasicDemand=0,
		UpgradeOnly=1,
	}
ai_data[FRIGATEPRODUCTION]=
	{
		Name="FRIGATEPRODUCTION",
		Type="Subsystem",
		Require={CORVETTEPRODUCTION},
		IsForFleet=0,
		BasicDemand=500,
	}
ai_data[FRIGATEINFILTRATOR]=
	{
		Name="FRIGATEINFILTRATOR",
		Type="Subsystem",
		Require={FRIGATEPRODUCTION,RESEARCH,ADVANCEDPRODUCTION},
		IsForFleet=0,
		BasicDemand=0,
		UpgradeOnly=1,
	}
ai_data[FRIGATEEW]=
	{
		Name="FRIGATEEW",
		Type="Subsystem",
		Require={FRIGATEPRODUCTION,RESEARCH,ADVANCEDPRODUCTION},
		IsForFleet=0,
		BasicDemand=0,
		UpgradeOnly=1,
	}
ai_data[FRIGATEARTILLERY]=
	{
		Name="FRIGATEARTILLERY",
		Type="Subsystem",
		Require={FRIGATEPRODUCTION,RESEARCH,ADVANCEDPRODUCTION},
		IsForFleet=0,
		BasicDemand=0,
		UpgradeOnly=1,
	}
ai_data[CAPSHIPPRODUCTION]=
	{
		Name="CAPSHIPPRODUCTION",
		Type="Subsystem",
		Require={FRIGATEPRODUCTION,RESEARCH},
		IsForFleet=1,
		BasicDemand=100,
	}
ai_data[ADVANCEDPRODUCTION]=
	{
		Name="ADVANCEDPRODUCTION",
		Type="Subsystem",
		Require={FRIGATEPRODUCTION,RESEARCH},
		IsForFleet=0,
		BasicDemand=100,
	}
ai_data[MISSILELAUNCHER]=
	{
		Name="ADVANCEDPRODUCTION",
		Type="Subsystem",
		Require={CAPSHIPPRODUCTION},
		IsForFleet=0,
		BasicDemand=200,
	}
ai_data[ADVANCEDCAPSHIPPRODUCTION]=
	{
		Name="ADVANCEDCAPSHIPPRODUCTION",
		Type="Subsystem",
		Require={CAPSHIPPRODUCTION,VGR_SHIPYARD},
		IsForFleet=1,
		BasicDemand=0,
	}
ai_data[RESEARCH]=
	{
		Name="RESEARCH",
		Type="Subsystem",
		Require={CORVETTERODUCTION},
		IsForFleet=1,
		BasicDemand=100,
	}
ai_data[HYPERSPACE]=
	{
		Name="HYPERSPACE",
		Type="Subsystem",
		Require={RESEARCH},
		IsForFleet=1,
		BasicDemand=0,
	}


function Proc_DetermineDemandWithNoCounterInfo()
end

function Proc_DetermineSpecialDemand()
end

function CpuBuildSS_DefaultSubSystemDemandRules()
	local bcount = BuildShipCount()
	if (bcount == 0) then
		return 0
	end
	for i=0, (bcount-1) do
		local buildShipId = BuildShipAt( i )
		local buildShip = BuildShipType( buildShipId )
		if (BuildShipHasSubSystem( buildShipId, ADVANCEDPRODUCTION )==1) then
			if (BuildShipHasSubSystem( buildShipId, FIGHTERLANCE )==1) then
				RetireSubSystem( buildShipId, FIGHTERLANCE )
			end
			if (BuildShipHasSubSystem( buildShipId, CORVETTELASER )==1) then
				RetireSubSystem( buildShipId, CORVETTELASER )
			end
			if (BuildShipHasSubSystem( buildShipId, NUCLEARBOMB )==1) then
				RetireSubSystem( buildShipId, NUCLEARBOMB )
			end
		end
	end
end

function DoResearchTechDemand()
end


function Override_MilitaryInit()
	if (sg_Delay==0) then
		cp_attackPercent=0
	end
end