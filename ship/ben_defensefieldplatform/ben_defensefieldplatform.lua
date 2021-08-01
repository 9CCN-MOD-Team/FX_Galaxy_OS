
function Create_ben_defensefieldplatform(CustomGroup, playerIndex, shipID)	
end

function Update_ben_defensefieldplatform(CustomGroup, playerIndex, shipID)	
	if(Player_GetLevelOfDifficulty(playerIndex)>0)and(SobGroup_CanDoAbility(CustomGroup, AB_Move)==0)then
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 1)
	elseif(Player_GetLevelOfDifficulty(playerIndex)==0)and(SobGroup_CanDoAbility(CustomGroup, AB_Move)==1)then
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 0)
	end	
	if(SobGroup_AreAllInHyperspace(CustomGroup)==1)then
		SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)
	end
end

function Destroy_ben_defensefieldplatform(CustomGroup, playerIndex, shipID)	
end