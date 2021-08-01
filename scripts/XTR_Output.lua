XTR_Output=
	{
		FX_TacticalReport_RU =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					if (Player_GetLevelOfDifficulty(iPlayer)>0) then
						return Player_GetRU(iPlayer)
					else
						return Player_GetRU(iPlayer)
					end
				else
					return 0
				end
			end,
			
		FX_TacticalReport_GatheredRU =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					return Stats_GatheredRUs(iPlayer)
				else
					return 0
				end
			end,
						
			
		FX_TacticalReport_KillInRUs =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					return Stats_TotalKillsInRUs(iPlayer)
				else
					return 0
				end
			end,
			
		FX_TacticalReport_ShipInRUs =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					local iReturn = Stats_TotalShipsBuiltInRUs(iPlayer)-Stats_TotalLossesInRUs(iPlayer)-Stats_TotalExtraRUs(iPlayer)+Stats_EnemyShipsCapturedInRUs(iPlayer)-Stats_OwnShipsCapturedInRUs(iPlayer)+FX_AITransferTotal[iPlayer+1]
					return iReturn
				else
					return 0
				end
			end,
			
		FX_TacticalReport_FighterCount =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					return SobGroup_FilterInclude("XTR_TempGroup", "Player_Ships"..iPlayer, "displayFamily", "Fighter")
				else
					return 0
				end
			end,
			
		FX_TacticalReport_CorvetteCount =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					return SobGroup_FilterInclude("XTR_TempGroup", "Player_Ships"..iPlayer, "displayFamily", "Corvette")
				else
					return 0
				end
			end,
			
		FX_TacticalReport_FrigateCount =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					return SobGroup_FilterInclude("XTR_TempGroup", "Player_Ships"..iPlayer, "displayFamily", "Frigate")
				else
					return 0
				end
			end,
			
		FX_TacticalReport_CapshipCount =
			function(iPlayer)
				if(Race_GetName(Player_GetRace(iPlayer))~="Observer")then
					return SobGroup_FilterInclude("XTR_TempGroup", "Player_Ships"..iPlayer, "displayFamily", "Capital")
				else
					return 0
				end
			end,
	}