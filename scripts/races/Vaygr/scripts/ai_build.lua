kCollector = VGR_RESOURCECOLLECTOR
kRefinery = VGR_RESOURCECONTROLLER
kScout = VGR_SCOUT
kInterceptor = VGR_INTERCEPTOR
kBomber = VGR_BOMBER
kCarrier = VGR_CARRIER
kShipYard = VGR_SHIPYARD
kDestroyer = VGR_DESTROYER
kBattleCruiser = VGR_BATTLECRUISER

function DetermineDemandWithNoCounterInfo_Vaygr()
	if (sg_randFavorShipType < 45) then	
		ShipDemandAddByClass(eFighter, 1)
	elseif (sg_randFavorShipType < 75) then	
		ShipDemandAddByClass(eCorvette, 1)
	-- frigates are not the best hiigaran choice but for now I'll leave the 3-way balance 
	else
		ShipDemandAddByClass(eFrigate, 1)
	end
end		
	
function DetermineSpecialDemand_Vaygr()
	if (ShipDemandGet( kInterceptor ) > 0 and NumSubSystems(FIGHTERPRODUCTION) > 0 and NumSquadrons(kInterceptor) < 3 and s_militaryPop < 10) then
		ShipDemandAdd( kInterceptor, 0.5 )
	end
	-- once we have a bit more military then add a frigate base value
	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.5
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
		-- more want for battle cruiser if we aren't currently under huge attack
		if (NumSubSystems(ADVANCEDCAPSHIPPRODUCTION) > 0) then	
			ShipDemandAdd(kBattleCruiser, 0.5)
		end
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
	
	-- add more demand to shipyards if we have none
	local numShipyards = NumSquadrons( kShipYard ) + NumSquadronsQ( kShipYard )
	if (numShipyards == 0 and UnderAttackThreat() < -75) then
		local bcDemand = ShipDemandGet( kBattleCruiser )
		if (bcDemand >= 0.5) then
			ShipDemandAdd( kShipYard, bcDemand-0.5 )
		end
	end
	
	-- if AI is winning the militaryvalue battle reduce platform demand
	if (s_militaryStrength > 25*sg_moreEnemies) then
		ShipDemandAddByClass( ePlatform, -2 )
	end
end

Proc_DetermineDemandWithNoCounterInfo = DetermineDemandWithNoCounterInfo_Vaygr
Proc_DetermineSpecialDemand = DetermineSpecialDemand_Vaygr