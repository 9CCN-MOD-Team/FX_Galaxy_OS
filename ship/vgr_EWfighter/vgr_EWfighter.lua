function update_ewfighter(CustomGroup, playerID, shipID)
	for i=0,Universe_PlayerCount()-1 do
		if (Player_IsAlive(i)==1)and(playerID~=i) then
			if (AreAllied(playerID, i)==0) then
				SobGroup_Clear("UnitCharacteristicTempGroup")
				if Player_FillProximitySobGroup("UnitCharacteristicTempGroup", i, CustomGroup, 6000) then
					SobGroup_Clear("UnitCharacteristicTempGroup2")
					if SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "CurrentCommand", "COMMAND_Repair")>0 then
						SobGroup_Stop(i, "UnitCharacteristicTempGroup2")
						SobGroup_Clear("UnitCharacteristicTempGroup2")
					end
					if SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "CurrentCommand", "COMMAND_LayMines")>0 then
						SobGroup_Stop(i, "UnitCharacteristicTempGroup2")
						SobGroup_Clear("UnitCharacteristicTempGroup2")
					end
					if SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "CurrentCommand", "COMMAND_Capture")>0 then
						SobGroup_Stop(i, "UnitCharacteristicTempGroup2")
						SobGroup_Clear("UnitCharacteristicTempGroup2")
					end
				end
			end
		end
	end
end