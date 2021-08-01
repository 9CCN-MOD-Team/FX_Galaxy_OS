function DoSubSystemDemand_Vaygr()

	-- based on the highest demand determine what subsystems to ask for
	-- if fighter demand is high then request that
	-- if corvette and frigate demand is high then research modules
	-- if carrier/builders then capital ship

	-- determine FIGHTERPRODUCTION demand
	--CpuBuildSS_DoSubSystemProductionDemand( FIGHTERPRODUCTION, eFighter, kUnitCapId_Fighter )
	
	-- Demand for RESEARCH
	--local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
	
	-- cache the demand for these two classes
	--local highestCorvetteDemand = ShipDemandMaxByClass( eCorvette )
	--local highestFrigateDemand = ShipDemandMaxByClass( eFrigate )
	--local capdemand = ShipDemandMaxByClass( eCapital )
	
	-- if we do not have the research subsystem - check to see if want it - I'd imagine it would always be YES
	--if (researchcount==0) then
		
		-- determine demand for research - accumalating demand for high-level ships
	--	local researchdemand = highestCorvetteDemand
		
	--	if (highestFrigateDemand > researchdemand) then
	--		researchdemand = highestFrigateDemand
	--	elseif (capdemand > researchdemand) then
	--		researchdemand = capdemand
	--	end
		
		-- demand is equivalent to all things its opens (corvette and frigate and capital)
	--	SubSystemDemandSet(RESEARCH, researchdemand+1 )
	--end
	
	-- check to see if we have corvette tech
	--if (IsResearchDone(CORVETTETECH) == 1) then
		
	--	CpuBuildSS_DoSubSystemProductionDemand( CORVETTEPRODUCTION, eCorvette, kUnitCapId_Corvette )
		
	--end
	
	--if (IsResearchDone(FRIGATETECH) == 1) then
	
	--	CpuBuildSS_DoSubSystemProductionDemand( FRIGATEPRODUCTION, eFrigate, kUnitCapId_Frigate )
	
	--end
	
	-- demand for carrierprod, platform, hyperspace, ...
	--CpuBuildSS_OtherMiscSubSystemDemand();
	
	-- before doing the 'extra' subsystems make sure we have a research SS and production SS and a few military dudes
	--if (researchcount > 0 and s_totalProdSS > 0 and s_militaryPop > 8 and GetNumCollecting() > 8 and GetRU() > 800) then
	--	CpuBuildSS_SpecialSubSystemDemand()
	--end

       if (NumSubSystems(FIGHTERPRODUCTION) == 0) then
               SubSystemDemandSet(FIGHTERPRODUCTION,0.5)
       end
       if (NumSubSystems(FIGHTERPRODUCTION) > 0) and (ShipDemandGet(VGR_BOMBER) > 0.5 or ShipDemandMaxByClass( eAntiFrigate ) > 1) then
               SubSystemDemandSet(NUCLEARBOMB,2/(1+NumSubSystems(NUCLEARBOMB)))
       end
       if (NumSubSystems(FIGHTERPRODUCTION) > 0) and (ShipDemandMaxByClass( eAntiCorvette ) > 1) then
               SubSystemDemandSet(FIGHTERLANCE,2/(1+NumSubSystems(FIGHTERLANCE)))
       end
       if (NumSubSystems(FIGHTERPRODUCTION) > 0) then
               SubSystemDemandSet(CORVETTEPRODUCTION,1.5)
       end
       if (NumSubSystems(CORVETTEPRODUCTION) > 0) and (ShipDemandMaxByClass( eAntiFrigate ) > 1) then
               SubSystemDemandSet(CORVETTELASER,2/(1+NumSubSystems(CORVETTELASER)))
       end
       if (NumSubSystems(CORVETTEPRODUCTION) > 0) and (NumSubSystems(RESEARCH)<2)then
               SubSystemDemandSet(RESEARCH, 1.5)
       end
       if (NumSubSystems(RESEARCH) > 0) then
               SubSystemDemandSet(FRIGATEPRODUCTION,1.5)
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and (NumSubSystems(FRIGATEEW)==0) then
               SubSystemDemandSet(FRIGATEEW,2)
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and ((ShipDemandGet(VGR_INFILTRATORFRIGATE) > 0.5)) then
               SubSystemDemandSet(FRIGATEINFILTRATOR,2/(1+NumSubSystems(FRIGATEINFILTRATOR)))
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and ((ShipDemandGet(VGR_ARTILLERYFRIGATE) > 0.5)) then
               SubSystemDemandSet(FRIGATEARTILLERY,2/(1+NumSubSystems(FRIGATEARTILLERY)))
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) then
               SubSystemDemandSet(CAPSHIPPRODUCTION,1.5)
       end
       if (NumSubSystems(CAPSHIPPRODUCTION) > 0) and (NumSquadrons(VGR_SHIPYARD) > 0) then
               SubSystemDemandSet(ADVANCEDCAPSHIPPRODUCTION,1)
       end
	local numShipyards = NumSquadrons(kShipYard)
	if ( numShipyards == 0 ) then
		local SY_demand = ShipDemandGet(kShipYard)
		-- demand for hyperspace is determine by the demand for shipyards - also check to make sure we are 
		-- only asking for 1 hyperspace module at a time
		if (SY_demand > 0 and NumSubSystemsQ(HYPERSPACE) == 0) then
			local hypDemand = SY_demand - 0.5 - NumSubSystems(HYPERSPACE)
			SubSystemDemandAdd(HYPERSPACE, hypDemand )
		end
	end
end


function CpuBuildSS_RetireVaygrProductionSubSystems()

	local numCarriers = CarrierCount()
	for i=0, (numCarriers-1) do
	
		local carrier = CarrierAt( i )
		
		local productionId = CarrierProductionSubSystem( carrier )
		
		if (productionId ~= 0) then
			local ssdemand = SubSystemDemandGet( productionId )
--~ 			local count = NumSubSystems(productionId) + NumSubSystemsQ( productionId )
--~ 			if (count > 1) then
--~ 				ssdemand = ssdemand - 0.5
--~ 			end
			
			-- if the demand for this subsystem is low and we already have one of these
			-- elsewhere then get rid of it
			if (ssdemand < 0) then
				sg_retireCountCheck = sg_retireCountCheck + 1
				if (sg_retireCountCheck >= 2) then
				
					dout("VaygrCarrierRetire: Dem:"..ssdemand.." Count:"..sg_retireCountCheck )
					-- retire this subsystem
					RetireSubSystem( carrier, productionId )
					-- should replace with something right here
					sg_retireCountCheck = 0
					return
				end
			else
				sg_retireCountCheck = 0
			end
			
		end
	
	end

end

CpuBuildSS_RetireProductionSubSystems = CpuBuildSS_RetireVaygrProductionSubSystems
CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Vaygr
