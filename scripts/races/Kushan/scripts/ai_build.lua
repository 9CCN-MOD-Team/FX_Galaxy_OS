kCollector = KUS_RESOURCECOLLECTOR
kRefinery = KUS_RESOURCECONTROLLER
kScout = KUS_SCOUT
kInterceptor = KUS_INTERCEPTOR
kBomber = KUS_ATTACKBOMBER
kCarrier = KUS_CARRIER
kDestroyer = KUS_DESTROYER
kBattleCruiser = KUS_HEAVYCRUISER  
kRepair = KUS_SUPPORTFRIGATE

function DetermineDemandWithNoCounterInfo_Kushan()
	if (sg_randFavorShipType < 40) then	
		ShipDemandAddByClass(eFighter, 1)
	elseif (sg_randFavorShipType < 65) then	
		ShipDemandAddByClass(eCorvette, 1)
	elseif (sg_randFavorShipType < 75) then	
		ShipDemandAddByClass(eFrigate, 1)
	else
		ShipDemandAdd(kDestroyer, 1)
	end
end		
	
function DetermineSpecialDemand_Kushan()
	if (NumSquadrons(KUS_RESEARCHSHIP) < 1) then
		ShipDemandAdd(KUS_RESEARCHSHIP,3)             
	end
	
	if NumSquadrons(KUS_RESEARCHSHIP) > 0 and ((NumSquadrons(KUS_RESEARCHSHIP_1) < 1)or(NumSquadrons(KUS_RESEARCHSHIP_3) < 1))then
		ShipDemandAdd(KUS_RESEARCHSHIP_1,2)
		ShipDemandAdd(KUS_RESEARCHSHIP_3,1.5)
	end
	
	local corvettedemand = ShipDemandMaxByClass( eAntiFighter )-ShipDemandMaxByClass( eAntiFrigate )
	if corvettedemand < -1 then
			ShipDemandAdd(KUS_HEAVYCORVETTE,1)
	elseif corvettedemand > 1 then
			ShipDemandAdd(KUS_MULTIGUNCORVETTE,1)
	end	
	
	local lightcorvettedemand  = ShipDemandMaxByClass( eAntiFighter )+ShipDemandMaxByClass( eAntiCorvette )
	if lightcorvettedemand > 0.5 then
		if NumSquadrons(KUS_RESEARCHSHIP_5) < 1 then
			ShipDemandAdd(KUS_RESEARCHSHIP_5,1.5)
		end
	end
	
	local heavycorvettedemand  = ShipDemandMaxByClass( eAntiFrigate )
	if heavycorvettedemand > 0.5 then
		if NumSquadrons(KUS_RESEARCHSHIP_4) < 1 then
			ShipDemandAdd(KUS_RESEARCHSHIP_4,1.5)
		end
	end
	
	if (ShipDemandGet(kInterceptor) > 0) and ((NumSquadrons(kInterceptor) < 3) and (s_militaryPop < 10)) then
		ShipDemandAdd(KUS_RESEARCHSHIP,1)
		ShipDemandAdd(kInterceptor, 0.5)
	end
	
	local numRUs = GetRU()
	local fdemand = ShipDemandMaxByClass( eFrigate )
	if (NumSquadrons(KUS_RESEARCHSHIP_3) > 0) and ( fdemand > 0.5) and (numRUs > 1000) then
		ShipDemandAdd(KUS_RESEARCHSHIPADV,5)
	end

	if NumSquadrons(KUS_RESEARCHSHIPADV) > 0 then
		ShipDemandAdd(KUS_RESEARCHSHIP_2,5)
		ShipDemandAdd(KUS_RESEARCHSHIPADV_1,5)
		if ShipDemandMaxByClass( eAntiFrigate ) > 0.5 then
			ShipDemandAdd(KUS_RESEARCHSHIPADV_2,5)
		end
		ShipDemandAdd(KUS_RESEARCHSHIPADV_5,2)
	end
	
	if (NumSquadrons(KUS_RESEARCHSHIPADV_5) > 0) and (NumSquadrons(KUS_GRAVWELLGENERATOR) < GetActiveBlobCount()) then--and (ShipDemandGet(KUS_MISSILEDESTROYER) > 0.5) then
		ShipDemandAdd(KUS_GRAVWELLGENERATOR,5)
	end

	if (NumSquadrons(KUS_RESEARCHSHIPADV_1) > 0) then--and (ShipDemandGet(kBattleCruiser) > 0) then
		if (ShipDemandGet(kBattleCruiser) > 0) then
			ShipDemandAdd(KUS_RESEARCHSHIPADV_3,5)
		end
		if (ShipDemandGet(KUS_MISSILEDESTROYER) > 0) then
			ShipDemandAdd(KUS_RESEARCHSHIPADV_4,5)
		end
	end
	

	-- once we have a bit more military then add a frigate base value
	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.5
		local reseachstationcount = NumSquadrons(KUS_RESEARCHSHIPADV)
		if (reseachstationcount > 0) then
			additionalFrigDemand = (additionalFrigDemand + 0.25)
			ShipDemandAddByClass(eCapital, additionalFrigDemand + 0.25)
		end
		ShipDemandAddByClass( eFrigate, additionalFrigDemand )
		ShipDemandAddByClass( eCorvette, -1 )		
		-- removes the initial bonus for fighters
		ShipDemandAddByClass( eFighter, -0.5 )		
	end
	
	-- tweak the demand for special frigates based on our military strength,
	-- we already count these frigates as anti frigate so the fleet vs
	-- fleet stuff is already done
    
	-- first see if we have too many special frigates compared to the normal ones
	local numSpecial = numQueueOfClass(eCapture) + numQueueOfClass(eShield)
	local numRepair = NumSquadrons(kRepair)
	local numCorvettes = numQueueOfClass(eCorvette)
	local numFrigates = numQueueOfClass(eFrigate)
	if(numCorvettes == 0) or(numSpecial / numCorvettes > 0.3) then
			ShipDemandAddByClass( eCapture, -10 )
			ShipDemandAddByClass( eShield, -10 )  
  else
		-- not too many, so based on the size of our fleet tweak the demand
		if (s_militaryPop < 5) then
			ShipDemandAddByClass( eCapture, -4 )
			ShipDemandAddByClass( eShield, -4.5 )
		elseif (s_militaryPop < 10) then
			ShipDemandAddByClass( eCapture, -2 )
			ShipDemandAddByClass( eShield, -2.5 )
		elseif (s_militaryPop < 15) then
			ShipDemandAddByClass( eCapture, -1 )
			ShipDemandAddByClass( eShield, -1.5 )
		elseif (s_militaryPop > 30) then
			ShipDemandAddByClass( eCapture, 1 )
			ShipDemandAddByClass( eShield, 8 )
		end
	end
	if(numFrigates == 0) or( numRepair / numFrigates > 0.1) or (numRepair>3) then
			ShipDemandAdd(kRepair, -10)  
  else
		-- not too many, so based on the size of our fleet tweak the demand
		if (s_militaryPop < 5) then
			ShipDemandAdd(kRepair, -4.5)                      
		elseif (s_militaryPop < 10) then
			ShipDemandAdd(kRepair, -2.5)                      
		elseif (s_militaryPop < 15) then
			ShipDemandAdd(kRepair, -1.5)                      
		elseif (s_militaryPop > 30) then
			ShipDemandAdd(kRepair, 8)                      
		end
	end
    
	-- torpedo frigate is a bit useless until we get the upgrade
	-- but the upgrade doesn't come unless we have lots of torpedo frigs
	
	local numRUs = GetRU()
	-- always add some demand for these two ships - if we are economically sound
	if ( (GetNumCollecting() > 9 or numRUs > 1500) and s_militaryPop > 8 and UnderAttackThreat() < -75) then
		ShipDemandAdd(kBattleCruiser, 0.75)
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

Proc_DetermineDemandWithNoCounterInfo = DetermineDemandWithNoCounterInfo_Kushan
Proc_DetermineSpecialDemand = DetermineSpecialDemand_Kushan