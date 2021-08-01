
function Create_ben_bentus(CustomGroup, playerIndex, shipID)	
end

function Update_ben_bentus(CustomGroup, playerIndex, shipID)	
	if((Player_CanResearch(playerIndex, "HasSleeplessCityLv1"))==1)then
		SobGroup_SetBuildSpeedMultiplier(CustomGroup, 2)
	elseif((Player_CanResearch(playerIndex, "HasSleeplessCityLv2"))==1)then
		SobGroup_SetBuildSpeedMultiplier(CustomGroup, 4)
	elseif((Player_CanResearch(playerIndex, "HasSleeplessCityLv3"))==1)then
		SobGroup_SetBuildSpeedMultiplier(CustomGroup, 6)
	else
		SobGroup_SetBuildSpeedMultiplier(CustomGroup, 1)
	end	
end

function Destroy_ben_bentus(CustomGroup, playerIndex, shipID)	
	shockwave(playerIndex,CustomGroup)	
end