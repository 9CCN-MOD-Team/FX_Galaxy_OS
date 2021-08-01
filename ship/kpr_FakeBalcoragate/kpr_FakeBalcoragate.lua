function Update_kpr_FakeBalcoragate(CustomGroup, playerIndex, shipID)
	if Universe_GameTime() < 0.5 then
		SobGroup_SetMadState(CustomGroup,"ResourceDo")
		if playerIndex == Universe_CurrentPlayer() then
			Camera_FocusSobGroupWithBuffer(CustomGroup, 50000, 1000, 0)
		end
	end
	
	if Universe_GameTime() >= 13 then
		SobGroup_Despawn(CustomGroup)		
		SobGroup_CreateIfNotExist("GateTmp")
		SobGroup_Clear("GateTmp")
		Volume_AddSphere("GateJump", SobGroup_GetPosition(CustomGroup), 0)
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_balcoragate", "newbalcoragate", "GateTmp", "GateJump")
		Volume_Delete("GateJump")
		SobGroup_ParadeSobGroup("GateTmp",CustomGroup,2)
		SobGroup_MakeDead(CustomGroup)
	end
end