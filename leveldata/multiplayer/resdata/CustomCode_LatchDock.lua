function Create_LatchDock(CustomGroup, playerIndex, shipID)
	SobGroup_Create("LatchDockTempGroup"..shipID)
	SobGroup_CreateIfNotExist("LatchDockTempGroup")
end

function Update_LatchDock(CustomGroup, playerIndex, shipID)
	if (SobGroup_Empty("LatchDockTempGroup"..shipID)==1) then
		if (SobGroup_AreAllInRealSpace(CustomGroup)==0) then --Hyperspacing, get all ships docked with
			SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup"..shipID)
			SobGroup_AbilityActivate(CustomGroup, AB_Lights, 0)
			SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 1)
			SobGroup_MakeSelectable("LatchDockTempGroup"..shipID,0)
			SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Attack, 0)
		elseif(SobGroup_GetStance(CustomGroup)==0)then --At offensive Stance, launch all ships
			SobGroup_Clear("LatchDockTempGroup")
			SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup")
			SobGroup_Launch("LatchDockTempGroup", CustomGroup)
		elseif(SobGroup_GetStance(CustomGroup)==1)then --At evasive ROE, all ships stay docked
			SobGroup_Clear("LatchDockTempGroup")
			SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup")
			SobGroup_ForceStayDockedIfDocking("LatchDockTempGroup")
		else
			SobGroup_Clear("LatchDockTempGroup")
			SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup")
			local nShip=SobGroup_Count("LatchDockTempGroup")
			if nShip>0 then
				for iShip=1,nShip do
					SobGroup_FillShipsByIndexRange("LatchDockTempGroup"..shipID, "LatchDockTempGroup", iShip-1, 1)
					if (SobGroup_GetStance("LatchDockTempGroup"..shipID)==1) then
						SobGroup_ForceStayDockedIfDocking("LatchDockTempGroup"..shipID)
					elseif (SobGroup_HealthPercentage("LatchDockTempGroup"..shipID)==1) then
						SobGroup_Launch("LatchDockTempGroup"..shipID, CustomGroup)
					end
					SobGroup_Clear("LatchDockTempGroup"..shipID)
				end
			end
		end
	elseif (SobGroup_AreAllInHyperspace("LatchDockTempGroup"..shipID)==0)and(SobGroup_CanDoAbility(CustomGroup,AB_Lights)==0) then --Entering Hyperspace
		SobGroup_Despawn("LatchDockTempGroup"..shipID)
	elseif (SobGroup_AreAllInHyperspace("LatchDockTempGroup"..shipID)==1)and(SobGroup_AreAllInHyperspace(CustomGroup)==1)and(SobGroup_CanDoAbility(CustomGroup,AB_Lights)==0) then --All In Hyperspace
		SobGroup_AbilityActivate(CustomGroup, AB_Lights, 1)
	elseif (SobGroup_AreAllInHyperspace("LatchDockTempGroup"..shipID)==1)and(SobGroup_AreAllInHyperspace(CustomGroup)==0)and(SobGroup_CanDoAbility(CustomGroup,AB_Lights)==1) then --Exiting Hyperspace
		Volume_AddSphere("LatchDockTempVolume", SobGroup_GetPosition(CustomGroup), 100)
		SobGroup_Spawn("LatchDockTempGroup"..shipID, "LatchDockTempVolume")
		Volume_Delete("LatchDockTempVolume")
	elseif (SobGroup_AreAllInRealSpace(CustomGroup)==1) then --Exited Hyperspace
		if (SobGroup_IsDoingAbility("LatchDockTempGroup"..shipID, AB_Dock)==0) then
			SobGroup_DockSobGroupAndStayDocked("LatchDockTempGroup"..shipID, CustomGroup)
		end
		SobGroup_Clear("LatchDockTempGroup")
		SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup")
		if (SobGroup_Count("LatchDockTempGroup")>=SobGroup_Count("LatchDockTempGroup"..shipID)) then --All ships re-docking
			Destroy_LatchDock(CustomGroup, playerIndex, shipID)
		end
	end
end

function Destroy_LatchDock(CustomGroup, playerIndex, shipID)
	if (SobGroup_Empty("LatchDockTempGroup"..shipID)==0) then
		SobGroup_MakeSelectable("LatchDockTempGroup"..shipID,1)
		SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 0)
		SobGroup_AbilityActivate("LatchDockTempGroup"..shipID, AB_Attack, 1)
		SobGroup_Clear("LatchDockTempGroup"..shipID)
	end
end
