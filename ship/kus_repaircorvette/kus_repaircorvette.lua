function Create_Kus_RepairCorvette(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("Kus_RepairCorvetteTempGroup"..shipID)
	SobGroup_CreateIfNotExist("Kus_RepairCorvetteRepairingGroup"..shipID)
end

function Update_Kus_RepairCorvette(CustomGroup, playerIndex, shipID)
	if(SobGroup_GroupInGroup("Kus_RepairCorvetteRepairingGroup"..shipID,CustomGroup) == 0)then
		for ipi=1,Universe_PlayerCount() do
			SobGroup_Clear("Kus_RepairCorvetteTempGroup"..shipID)
			SobGroup_GetSobGroupRepairingGroup("Player_Ships"..(ipi-1), "Kus_RepairCorvetteTempGroup"..shipID)
			if(SobGroup_GroupInGroup("Kus_RepairCorvetteTempGroup"..shipID,CustomGroup) == 1)then
				FX_StartEvent(CustomGroup, "Repairing")
				SobGroup_SobGroupAdd("Kus_RepairCorvetteRepairingGroup"..shipID,CustomGroup)
				break
			end
		end
	else
		local iLatched = 0
		for ipi=1,Universe_PlayerCount() do
			SobGroup_Clear("Kus_RepairCorvetteTempGroup"..shipID)
			SobGroup_GetSobGroupRepairingGroup("Player_Ships"..(ipi-1), "Kus_RepairCorvetteTempGroup"..shipID)
			if(SobGroup_GroupInGroup("Kus_RepairCorvetteTempGroup"..shipID,CustomGroup) == 1)then
				iLatched=1
				break
			end
		end
		if(iLatched==0)then
			FX_StopEvent(CustomGroup, "Repairing")
			SobGroup_Clear("Kus_RepairCorvetteRepairingGroup"..shipID)
		end
	end
end

function Destroy_Kus_RepairCorvette(CustomGroup, playerIndex, shipID)		
end