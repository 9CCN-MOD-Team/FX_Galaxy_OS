
dout("LOADING VAYGR UPGRADE INFO")

rt_mothership = {

}

rt_capital = {
	VGR_CAPITALHEALTHUPGRADE1,
	VGR_CAPITALHEALTHUPGRADE2,
	VGR_CAPITALHEALTHUPGRADE3,
}


rt_fighter = {
	VGR_AIRWEAPONUPGRADE1,
	VGR_AIRWEAPONUPGRADE2,
	VGR_AIRWEAPONUPGRADE3,
	VGR_FIGHTERHEALTHUPGRADE1,
	VGR_FIGHTERHEALTHUPGRADE2,
	VGR_FIGHTERHEALTHUPGRADE3,
}

rt_corvette = {
	VGR_CORVETTEHEALTHUPGRADE1,
	VGR_CORVETTEHEALTHUPGRADE2,
	VGR_CORVETTEHEALTHUPGRADE3,
}

rt_frigate = {
	VGR_SHIPWEAPONUPGRADE1,
	VGR_SHIPWEAPONUPGRADE2,
	VGR_SHIPWEAPONUPGRADE3,
	VGR_FRIGATEWEAPONUPGRADE1,
	VGR_FRIGATEWEAPONUPGRADE2,
	VGR_FRIGATEWEAPONUPGRADE3,
}

rt_platform = {

}

rt_collector = {

}

--rt_refinery = {
--	RESOURCECONTROLLERHEALTHUPGRADE1,
--	RESOURCECONTROLLERHEALTHUPGRADE2,
--}

--rt_hyperspace = {
--	cost = {
--		HYPERSPACECOSTUPGRADE1,
--		HYPERSPACECOSTUPGRADE2,
--	},
--	transittime = {
--		HYPERSPACETRANSITTIMEUPGRADE1,
--		HYPERSPACETRANSITTIMEUPGRADE2,
--	},
--	recoverytime = {
--		HYPERSPACERECOVERYTIMEUPGRADE1,
--		HYPERSPACERECOVERYTIMEUPGRADE2,
--	},
--}

function DoUpgradeDemand_Vaygr()
	
	-- based on the actual count of each ship determine which upgrades to do
	
	if (s_militaryStrength > 10 or g_LOD == 0) then
	
		-- mothership upgrades
		-- if underattack (or some random factor - need more intel here)
		inc_upgrade_demand( rt_mothership, 0.5 )
		
		-- also demand for build speed upgrade on the MS
		--ResearchDemandAdd( MOTHERSHIPBUILDSPEEDUPGRADE1, 0.5 )
		
		-- do corvette upgrades
		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )
		if (numCorvette > 2) then
			inc_upgrade_demand( rt_corvette, numCorvette )
		end
		
		-- do frigate upgrades
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if (numFrigate > 2) then
			inc_upgrade_demand( rt_frigate, numFrigate*1 )
		end
		
		-- do platforms
		local numPlatforms = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatforms > 0) then
			inc_upgrade_demand( rt_platform, numPlatforms*1 )
		end
		
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )
		if (numCapital > 1) then
			inc_upgrade_demand( rt_capital, numCapital*0.5 )
		end
		
		-- carrier
		--local numCarrier = NumSquadrons( kCarrier )
		--if (numCarrier > 0) then
		--	ResearchDemandAdd( CARRIERBUILDSPEEDUPGRADE1, numCarrier*1.25 )
		--end
		
		-- shipyard
		--local numShipYards = NumSquadrons( kShipYard )
		--if (numShipYards > 0) then
		--	ResearchDemandAdd( SHIPYARDBUILDSPEEDUPGRADE1, numShipYards*1.75 )
		--end
	end
	
end


function DoResearchTechDemand_Vaygr()

		--
	-- NO RULES YET FOR
	--
	--REPAIRABILITY
	--SCOUTEMPABILITY
	
	--if (Util_CheckResearch(HYPERSPACEGATETECH)) then
	--	local demand = ShipDemandGet(kShipYard)
	--	if (demand > 0) then
	--		ResearchDemandSet( HYPERSPACEGATETECH, demand+0.5 )
	--	end
	--end
	
	
	
	-- battle cruiser ion weapons - required for battle cruiser to build - piggy backs its demand
	
	-- check to see if have any or if any shipyards are being built
	--local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)
	--local numHyperspaceSS = NumSubSystems(HYPERSPACE)+NumSubSystemsQ(HYPERSPACE)
	-- do battlecruiser research (only if we are in the process of getting hyperspace module)
	--if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERIONWEAPONS)) then
	--	local battleCruiserDemand = ShipDemandGet( kBattleCruiser )
	--	if (battleCruiserDemand > 0) then
	--		ResearchDemandSet( BATTLECRUISERIONWEAPONS, battleCruiserDemand )
	--	end
	--end
	
	-- do destroyer research (but only if we are getting cap ship module
	--if (Util_CheckResearch(DESTROYERGUNS)) then
	--	local demand = ShipDemandGet(VGR_DESTROYER)
	--	if (demand > 0) then
	--		ResearchDemandSet( DESTROYERGUNS, demand )
	--	end
	--end
	
	--if (Util_CheckResearch(LANCEBEAMS)) then
	--	local lancedemand = ShipDemandGet(VGR_LANCEFIGHTER)
	--	if (lancedemand > 0) then
	--		ResearchDemandSet( LANCEBEAMS, lancedemand + 0.5 ) -- offset because its cheap
	--	end
	--end
	
	
	--if (Util_CheckResearch(PLASMABOMBS) ) then
	--	local bomberdemand = ShipDemandGet( VGR_BOMBER )
	--	if (bomberdemand > 0) then
	--		ResearchDemandSet( PLASMABOMBS, bomberdemand+1.0 ) -- offset because its cheap
	--	end
	--end
	
	
	
	--if (Util_CheckResearch(CORVETTELASER)) then
	--	local laserdemand = ShipDemandGet(VGR_LASERCORVETTE)
	--	if (laserdemand > 0) then
	--		ResearchDemandSet( CORVETTELASER, laserdemand )
	--	end
	--end
	
	
	
	--if (Util_CheckResearch(FRIGATEASSAULT)) then
	--	local demand = ShipDemandGet(VGR_ASSAULTFRIGATE)
	--	if (demand > 0) then
	--		ResearchDemandSet( FRIGATEASSAULT, demand )
	--	end
	--end
	
	
	
	--if (Util_CheckResearch(CORVETTETECH) ) then
	--	local corvdemand = ShipDemandMaxByClass( eCorvette )
	--	if (corvdemand > 0) then
	--		ResearchDemandSet( CORVETTETECH, corvdemand+0.5 )
	--	end
	--end
	
	--if (Util_CheckResearch(FRIGATETECH) ) then
	--	local frigdemand = ShipDemandMaxByClass( eFrigate )
	--	if (frigdemand > 0) then
	--		ResearchDemandSet( FRIGATETECH, frigdemand+0.5 )
	--	end
	--end
	
	--if (s_militaryPop > 15 and GetRU() > 750) then
	
	--	if (Util_CheckResearch(CORVETTEGRAVITICATTRACTION) ) then
	--		local mineLayerDemand = ShipDemandGet(VGR_MINELAYERCORVETTE)
	--		if (mineLayerDemand > 0) then
	--			ResearchDemandSet( CORVETTEGRAVITICATTRACTION, mineLayerDemand )
	--		end
	--	end
		
	--	if (Util_CheckResearch(CORVETTECOMMAND)) then
	--		local commanddemand = ShipDemandGet(VGR_COMMANDCORVETTE)
	--		if (commanddemand > 0) then
	--			ResearchDemandSet( CORVETTECOMMAND, commanddemand )
	--		end
	--	end
		
	--	if (Util_CheckResearch(FRIGATEINFILTRATIONTECH)) then
	--		local demand = ShipDemandGet(VGR_INFILTRATORFRIGATE)
	--		if (demand > 0) then
	--			ResearchDemandSet( FRIGATEINFILTRATIONTECH, demand )
	--		end
	--	end
	
	--end
		
end


DoUpgradeDemand = DoUpgradeDemand_Vaygr
DoResearchTechDemand = DoResearchTechDemand_Vaygr


