function DoSubSystemDemand_Hiigaran()

	-- based on the highest demand determine what subsystems to ask for
	-- if fighter demand is high then request that
	-- if corvette and frigate demand is high then research modules
	-- if carrier/builders then capital ship

	-- determine FIGHTERPRODUCTION demand
	CpuBuildSS_DoSubSystemProductionDemand( FIGHTERPRODUCTION, eFighter, kUnitCapId_Fighter )
	CpuBuildSS_DoSubSystemProductionDemand( RESEARCH, eFrigate, kUnitCapId_Frigate )
	
	-- Demand for RESEARCH
	local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
	
	local highestCorvetteDemand = ShipDemandMaxByClass( eCorvette )
	local highestFrigateDemand = ShipDemandMaxByClass( eFrigate )
	if highestCorvetteDemand > highestFrigateDemand then 
                if highestCorvetteDemand > 0.5 then
                        SubSystemDemandAdd (CORVETTEPRODUCTION,1)
                end
        elseif highestFrigateDemand > 0.5 then
                SubSystemDemandAdd (FRIGATEPRODUCTION,1)
        end
	-- determine demand for research - accumalating demand for high-level ships
	local researchdemand = highestCorvetteDemand
	local capdemand = ShipDemandMaxByClass( eCapital )
	if (highestFrigateDemand > researchdemand) then
		researchdemand = highestFrigateDemand
	elseif (capdemand > researchdemand) then
		researchdemand = capdemand
	end
	
	-- always need some research (+0.5 to demand) - if its destroyed we should check to see if we have subs for building ships

		
		-- the more Frigate subs the more we need advanced research
		-- other factors: underattack, strength, militarypop, economy
		local advresearchcount = NumSubSystems(ADVANCEDRESEARCH) + NumSubSystemsQ(ADVANCEDRESEARCH)

		-- if we already have a frigate subsystem then put demand up by a half point to increase odds of building
		if (s_numFrSystems > 0) then
                        if advresearchcount == 0 and ShipDemandMaxByClass(eFrigate) >= 1 then
			        SubSystemDemandAdd(ADVANCEDRESEARCH, 0.5 )
                        end
		end
        if ShipDemandGet(kBattleCruiser) > 0.5 then
                SubSystemDemandAdd(ADVANCEDCAPSHIPPRODUCTION,0.5)
        end
	
	-- demand for carrierprod, platform, hyperspace, ...
	CpuBuildSS_OtherMiscSubSystemDemand();
	
	-- before doing the 'extra' subsystems make sure we have a research SS and production SS and a few military dudes
	if (researchcount > 0 and s_totalProdSS > 0 and s_militaryPop > 8 and GetNumCollecting() > 8 and GetRU() > 800) then
		CpuBuildSS_SpecialSubSystemDemand()
	end

end

CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Hiigaran