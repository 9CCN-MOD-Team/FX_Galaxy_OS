kCollector = KAD_SALVAGER
kRefinery = KAD_RESOURCEFUELPOD
kScout = KAD_ARANEID
kInterceptor = KAD_SWARMER
kBomber = KAD_ASSAULTSWARMER
kCarrier = KAD_CARRIER
kDestroyer = KAD_GUARDIANSPIRIT
kBattleCruiser = KAD_MOTHERSHIPLIGHT
kRepair = KAD_ARANEID

function DetermineDemandWithNoCounterInfo_Kadesh()
	if (sg_randFavorShipType < 50) then	
		ShipDemandAddByClass(eFighter, 1)
	elseif (sg_randFavorShipType < 80) then	
		ShipDemandAddByClass(eCorvette, 1)
	elseif (sg_randFavorShipType < 95) then	
		ShipDemandAddByClass(eFrigate, 1)
	else
		ShipDemandAdd(kDestroyer, 1)
	end 
end		

function DetermineSpecialDemand_Kadesh()
	if (ShipDemandGet( kInterceptor ) > 0 and NumSubSystems(FIGHTERPRODUCTION) > 0 and NumSquadrons(kInterceptor) < 3 and s_militaryPop < 10) then
		ShipDemandAdd( kInterceptor, 0.5 )
	end
	if (NumSubSystems(FRIGATEPRODUCTION) > 0) then
		ShipDemandAdd(KAD_FUELPOD,1.5)
	end
	if (NumSubSystems(CAPSHIPPRODUCTION) > 0) then
		ShipDemandAdd(KAD_MULTIBEAMFRIGATE,0.5)
	end
 
	-- once we have a bit more military then add a frigate base value
	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.5
		local capscount = NumSubSystems(CAPSHIP) + NumSubSystemsQ(CAPSHIP)
		if (capscount > 0) then
			additionalFrigDemand = additionalFrigDemand + 0.25
		end            
		ShipDemandAddByClass( eFrigate, additionalFrigDemand )
		-- removes the initial bonus for fighters
		ShipDemandAddByClass( eFighter, -0.5 )		
	end
	
	-- tweak the demand for special frigates based on our military strength,
	-- we already count these frigates as anti frigate so the fleet vs
	-- fleet stuff is already done
    
	-- first see if we have too many special frigates compared to the normal ones
	local numSpecial = numQueueOfClass(eCapture)
	local numFrigates = numQueueOfClass(eFrigate)
	if(numFrigates == 0 or numSpecial / numFrigates > 0.4) then
		-- too many, floor the demand
		ShipDemandAddByClass( eCapture, -10 )
	else
		-- not too many, so based on the size of our fleet tweak the demand
		if (s_militaryPop < 5) then
			ShipDemandAddByClass( eCapture, -4 )
		elseif (s_militaryPop < 10) then
			ShipDemandAddByClass( eCapture, -2 )
		elseif (s_militaryPop < 15) then
			ShipDemandAddByClass( eCapture, -1 )
		elseif (s_militaryPop > 30) then
			ShipDemandAddByClass( eCapture, 1 )
		end
	end
	
	local numRepair = NumSquadrons(kRepair)
	if(numRepair / s_militaryPop > 0.2) then
		-- too many, floor the demand
		ShipDemandAdd(kRepair, -10)                      
	elseif (numRepair / s_militaryPop < 0.1) then
			ShipDemandAdd(kRepair, 10)                      
	end    
	-- torpedo frigate is a bit useless until we get the upgrade
	-- but the upgrade doesn't come unless we have lots of torpedo frigs
	
	local numRUs = GetRU()
	-- always add some demand for these two ships - if we are economically sound
	if ( (GetNumCollecting() > 9 or numRUs > 1500) and s_militaryPop > 8 and UnderAttackThreat() < -75) then
		ShipDemandAdd(kDestroyer, 0.25)
	end
		
	-- if enemy has battlecruisers we should increase the request for subsystem attackers
	local numEnemyBattleCruisers = PlayersUnitTypeCount( player_enemy, player_total, eBattleCruiser )
	if (numEnemyBattleCruisers > 0) then
		local ssKillaDemand = numEnemyBattleCruisers/2
		if (s_enemyIndex ~= -1) then
			local targetEnemyCruisers = PlayersUnitTypeCount( s_enemyIndex, player_max, eBattleCruiser )
			if (targetEnemyCruisers > 0) then
				ssKillaDemand = ssKillaDemand + targetEnemyCruisers	
			end
		end		
		ShipDemandAddByClass( eSubSystemAttackers, ssKillaDemand )		
	end
	
	-- if AI is winning the militaryvalue battle reduce platform demand
	if (s_militaryStrength > 25*sg_moreEnemies) then
		ShipDemandAddByClass( ePlatform, -2 )
	end
end

Proc_DetermineDemandWithNoCounterInfo = DetermineDemandWithNoCounterInfo_Kadesh
Proc_DetermineSpecialDemand = DetermineSpecialDemand_Kadesh