kCollector = KPR_RESOURCECOLLECTOR 
kRefinery  = KPR_RESOURCECONTROLLER
kScout = KPR_SCOUT
kInterceptor = KPR_MOVERS
kBomber = KPR_BOMBER
kCarrier = KPR_CARRIER
kShipYard = KPR_BALCORAGATE
kDestroyer = KPR_DESTROYER1
kBattleCruiser = KPR_DREADNAUGHT

function DetermineDemandWithNoCounterInfo_Keeper()
	if (sg_randFavorShipType < 30) then	
		ShipDemandAddByClass(eFighter, 1)
	elseif (sg_randFavorShipType < 60) then	
		ShipDemandAddByClass(eCorvette, 1)
	elseif (sg_randFavorShipType < 80) then	
		ShipDemandAddByClass(eFrigate, 1)
	else
		ShipDemandAdd(kDestroyer, 1)
	end
end
function DetermineSpecialDemand_Keeper()
	if (NumSquadrons(KPR_ENERGY_PHOTONBOMB) < 1)  then
		ShipDemandAdd(KPR_ENERGY_PHOTONBOMB,1)             
	end
	
	if (ShipDemandGet(kInterceptor) > 0) and ((NumSquadrons(kInterceptor) < 3) and (s_militaryPop < 10)) then
		ShipDemandAdd(kInterceptor, 0.5)
	end
	
	if (NumSquadrons(KPR_BALCORAGATE) < 1) then
		ShipDemandAdd(KPR_BALCORAGATE,2)
	end
	
	if (ShipDemandMaxByClass( eAntiFighter ) > ShipDemandMaxByClass( eAntiCorvette )) then
		if ShipDemandMaxByClass( eAntiFighter ) > ShipDemandMaxByClass( eAntiFrigate ) then
			ShipDemandAdd(KPR_ENERGY_PHOTONCANNON,1)
		else
		 ShipDemandAdd(KPR_ENERGY_IONCANNON,1)
		end
	elseif ShipDemandMaxByClass( eAntiCorvette ) > ShipDemandMaxByClass( eAntiFrigate ) then
		ShipDemandAdd(KPR_ENERGY_PULSAR,1)
	else
		ShipDemandAdd(KPR_ENERGY_IONCANNON,1)
	end
	
	if (NumSquadrons(KPR_ENERGY_IONCANNON) > 1) and (NumSquadrons(KPR_ENERGY_PHOTONCANNON) > 1) then
		ShipDemandAdd(KPR_ENERGY_PHASEDCANNON,1)
	end
	
	if (NumSquadrons(KPR_ENERGY_PULSAR) > 1) and NumSubSystems(CORE) > 0 then
		ShipDemandAdd(KPR_ENERGY_SUPERPULSAR,1)
	end
	
	-- once we have a bit more military then add a frigate base value
	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.5
		local capscount = NumSubSystems(HYPERSPACE) + NumSubSystemsQ(HYPERSPACE)
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
	local numSpecial = numQueueOfClass(eCapture) + numQueueOfClass(eShield)
	local numFrigates = numQueueOfClass(eFrigate)
	if(numFrigates == 0 or numSpecial / numFrigates > 0.4) then
		-- too many, floor the demand
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
			ShipDemandAddByClass( eShield, 1 )
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

Proc_DetermineDemandWithNoCounterInfo = DetermineDemandWithNoCounterInfo_Keeper
Proc_DetermineSpecialDemand = DetermineSpecialDemand_Keeper