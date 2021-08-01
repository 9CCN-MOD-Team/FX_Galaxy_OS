Ben_probeList = Ben_probeList or {}
Ben_probeState =
{
	idle = 0,
	jumping = 1,
	jumped = 2,
}

function Create_Ben_Probe(CustomGroup, playerIndex, shipID)
	Ben_probeList[shipID] = Ben_probeState.idle
end

function Update_Ben_Probe(CustomGroup, playerIndex, shipID)
	if SobGroup_GetROE(CustomGroup) ~= OffensiveROE then
		SobGroup_SetROE(CustomGroup, OffensiveROE)
	end

	if SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 1 then
		Ben_probeList[shipID] = Ben_probeState.jumping
	else
		if Ben_probeList[shipID] == Ben_probeState.jumping then
			SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)
			Ben_probeList[shipID] =  Ben_probeState.jumped
		end
	end
end

function Destroy_Ben_Probe(CustomGroup, playerIndex, shipID)
	Ben_probeList[shipID] = nil
end