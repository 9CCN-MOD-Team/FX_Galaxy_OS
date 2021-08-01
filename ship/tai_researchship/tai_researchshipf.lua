function Update_Tai_ResearchShipF(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("TRV"..shipID)
	if (SobGroup_Empty("TRV"..shipID)==1)and(SobGroup_AreAllInRealSpace(CustomGroup) == 1) then
	  Volume_AddSphere("TRV", SobGroup_GetPosition(CustomGroup), 0)
		SobGroup_SpawnNewShipInSobGroup(playerIndex, CustomGroup, CustomGroup..playerIndex, "TRV"..shipID, "TRV")
		SobGroup_ParadeSobGroup("TRV"..shipID, CustomGroup, 1)
		--SobGroup_MoveToSobGroup(CustomGroup, "Player_Ships"..playerIndex)
		SobGroup_Despawn(CustomGroup)
	elseif (SobGroup_AreAllInHyperspace(CustomGroup) == 1) then
		SobGroup_SetHealth(CustomGroup, 0)
	end
end