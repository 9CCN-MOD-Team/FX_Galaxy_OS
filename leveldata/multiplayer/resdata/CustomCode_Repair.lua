function Create_Repair(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("AIRepairGroup")
end

function Update_Repair(CustomGroup, playerIndex, shipID)
	local g_LOD=Player_GetLevelOfDifficulty(playerIndex)
	if (Universe_RulesName()=="FXSINGLEPLAYER")and(playerIndex~=Universe_CurrentPlayer()) then
		local l_LOD=GameEvent_IsListening(6000+playerIndex)
		if l_LOD~="" then
			g_LOD=tonumber(l_LOD)
		end
	end
	if(g_LOD > 1)then
		if (SobGroup_Empty("AITempRemoveGroup")==1) and (SobGroup_GroupInGroup("AIRepairGroup",CustomGroup)==0)then
			SobGroup_SobGroupAdd("AIRepairGroup",CustomGroup)
			SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
			--SobGroup_AbilityActivate(CustomGroup, AB_Targeting, 0)
			--SobGroup_AbilityActivate(CustomGroup, AB_Attack, 0)
		end
		if(SobGroup_IsDoingAbility(CustomGroup,AB_Repair)==0)then
			SobGroup_RepairSobGroup(CustomGroup, "Player_Ships"..playerIndex)
		end
	end
end