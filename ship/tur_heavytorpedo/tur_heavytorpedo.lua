function Create_Torpedo(CustomGroup, playerIndex, shipID)
end

function Update_Torpedo(CustomGroup, playerIndex, shipID)
	if(SobGroup_IsDoingAbility(CustomGroup,AB_Attack)==0)then
		SobGroup_MakeDead(CustomGroup)
	end
end

function Destroy_Torpedo(CustomGroup, playerIndex, shipID)
	shockwave(playerIndex,CustomGroup)	
end
