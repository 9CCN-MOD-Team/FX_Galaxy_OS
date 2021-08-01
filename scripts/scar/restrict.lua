function SPRestrict()	
	local i = 0
	local numplayers = Universe_PlayerCount()	
	while (i < numplayers) do
		SPRestrictOptions( i );	
		i = i + 1;
	end	
end

function MPRestrict()	
	local i = 0
	local numplayers = Universe_PlayerCount()	
	while (i < numplayers) do
		RestrictOptions( i );	
		i = i + 1;
	end	
end

function SPRestrictOptions( playerid )
	Player_RestrictResearchOption(playerid, PlayerRace_GetString(playerid, "generic_sp_research_restrict", ""))
	Player_RestrictBuildOption(playerid, PlayerRace_GetString(playerid, "generic_sp_build_restrict", ""))
end

function RestrictOptions( playerid )
	Player_RestrictResearchOption(playerid, PlayerRace_GetString(playerid, "generic_mp_research_restrict", ""))
	Player_RestrictBuildOption(playerid, PlayerRace_GetString(playerid, "generic_mp_build_restrict", ""))

	if Player_GetLevelOfDifficulty(playerid) == 0 then
		Player_RestrictBuildOption(playerid, PlayerRace_GetString(playerid, "player_mp_build_restrict", ""))
	else
		Player_RestrictBuildOption(playerid, PlayerRace_GetString(playerid, "ai_mp_build_restrict", ""))
--		Player_RestrictResearchOption(playerid, "cpuplayers_defensive")
--		Player_RestrictResearchOption(playerid, "cpuplayers_defensive")
--		Player_RestrictResearchOption(playerid, "cpuplayers_aggressive")
--		Player_RestrictResearchOption(playerid, "cpuplayers_dynamic")
--		Player_RestrictResearchOption(playerid, "cpuplayers_norushtime5")
--		Player_RestrictResearchOption(playerid, "cpuplayers_norushtime10")
--		Player_RestrictResearchOption(playerid, "cpuplayers_norushtime15")			
--		Player_RestrictResearchOption(playerid, "AllShipBuildSpeed")
--		Player_RestrictResearchOption(playerid, "AllShipBuildSpeedHard")
--		Player_RestrictResearchOption(playerid, "AllShipBuildSpeedExpert")		
--		Player_RestrictResearchOption(playerid, "ResourceCollectionRateHard")
--		Player_RestrictResearchOption(playerid, "ResourceCollectionRateExpert")				
	end					
end

