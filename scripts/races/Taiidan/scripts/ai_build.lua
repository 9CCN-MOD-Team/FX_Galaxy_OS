kCollector = TAI_RESOURCECOLLECTOR
kRefinery = TAI_RESOURCECONTROLLER
kScout = TAI_SCOUT
kInterceptor = TAI_INTERCEPTOR
kBomber = TAI_ATTACKBOMBER
kCarrier = TAI_CARRIER
kDestroyer = TAI_DESTROYER
kBattleCruiser = TAI_HEAVYCRUISER
kRepair = TAI_SUPPORTFRIGATE

function DetermineDemandWithNoCounterInfo_Taiidan()
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
			
function DetermineSpecialDemand_Taiidan()
	if (NumSquadrons(TAI_RESEARCHSHIP) < 1) then
		ShipDemandAdd(TAI_RESEARCHSHIP,3)             
	end
	
	if NumSquadrons(TAI_RESEARCHSHIP) > 0 then
		ShipDemandAdd(TAI_RESEARCHSHIP_5F,2)
	end	
	if NumSubSystems(FIGHTERMODULE) > 0 then
		ShipDemandAdd(TAI_RESEARCHSHIP_1F,2)
	end	
	local lightcorvettedemand  = ShipDemandMaxByClass( eAntiFighter )
	if lightcorvettedemand > 0.5 then
		ShipDemandAdd(TAI_RESEARCHSHIP_3F,1.5)
	end
	
	if ShipDemandGet(TAI_HEAVYCORVETTE) > 0.5 then
		ShipDemandAdd(TAI_RESEARCHSHIP_4F,1.5)
	end
	
	if (ShipDemandGet(kInterceptor) > 0) and ((NumSquadrons(kInterceptor) < 3) and (s_militaryPop < 10)) then
		ShipDemandAdd(TAI_RESEARCHSHIP,1)
		ShipDemandAdd(kInterceptor, 0.5)
	end
	local numRUs = GetRU()
	local fdemand = ShipDemandMaxByClass( eFrigate )
	if (NumSubSystems(CORVETTEPRODUCTION) > 0) and ( fdemand > 0.5) and (numRUs > 1500) then
		ShipDemandAdd(TAI_RESEARCHSTATION,2.5)
	end
        
	-- once we have a bit more military then add a frigate base value
	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.5	
		local reseachstationcount = NumSquadrons(TAI_RESEARCHSTATION)
		if (reseachstationcount > 0) then
			additionalFrigDemand = (additionalFrigDemand + 0.25)
			ShipDemandAddByClass(eCapital, additionalFrigDemand + 0.25)
		end            
		ShipDemandAddByClass( eFrigate, additionalFrigDemand )
		-- removes the initial bonus for fighters
		ShipDemandAddByClass( eFighter, -0.5 )		
	end
	
	-- tweak the demand for special frigates based on our military strength,
	-- we already count these frigates as anti frigate so the fleet vs
	-- fleet stuff is already done
    
	-- first see if we have too many special frigates compared to the normal ones
	local numSpecial = numQueueOfClass(eShield) + NumSquadrons(kRepair)
	local numCapture = numQueueOfClass(eCapture)
	local numCorvettes = numQueueOfClass(eCorvette)
	local numFrigates = numQueueOfClass(eFrigate)
	if(numFrigates == 0 or numSpecial / numFrigates > 0.4) then
		-- too many, floor the demand
		ShipDemandAddByClass( eShield, -10 )        
		ShipDemandAdd(kRepair, -10)                      
	else
		-- not too many, so based on the size of our fleet tweak the demand
		if (s_militaryPop < 5) then
			ShipDemandAddByClass( eShield, -4.5 )
			ShipDemandAdd(kRepair, -4.5)                      
		elseif (s_militaryPop < 10) then
			ShipDemandAddByClass( eShield, -2.5 )
			ShipDemandAdd(kRepair, -2.5)                      
		elseif (s_militaryPop < 15) then
			ShipDemandAddByClass( eShield, -1.5 )
			ShipDemandAdd(kRepair, -1.5)                      
		elseif (s_militaryPop > 30) then
			ShipDemandAddByClass( eShield, 8 )
			ShipDemandAdd(kRepair, 8)                      
		end
	end
	if(numCorvettes == 0 or numCapture / numCorvettes > 0.4) then
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

Proc_DetermineDemandWithNoCounterInfo = DetermineDemandWithNoCounterInfo_Taiidan
Proc_DetermineSpecialDemand = DetermineSpecialDemand_Taiidan