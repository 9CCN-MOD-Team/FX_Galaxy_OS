UnitToLatch = "Kus_ResourceController,Kus_SupportFrigate,Tai_ResourceController,Tai_SupportFrigate"

function Create_GroupDock(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("GroupDockTargetGroup"..shipID)
	SobGroup_CreateIfNotExist("GroupDockTempGroup"..shipID)
end

function Update_GroupDock(CustomGroup, playerIndex, shipID)
--清除无用target组
	if(SobGroup_HealthPercentage(CustomGroup)==1)and(SobGroup_Empty("GroupDockTempGroup"..shipID)==1)and(SobGroup_Empty("GroupDockTargetGroup"..shipID)==0)then
		SobGroup_Clear("GroupDockTargetGroup"..shipID)
	end
--判断单位是否准备外停泊
	if(SobGroup_Empty("GroupDockTargetGroup"..shipID)==1)and(SobGroup_IsDoingAbility(CustomGroup,AB_Guard)==1)then
		SobGroup_GetCommandTargets("GroupDockTargetGroup"..shipID,CustomGroup,COMMAND_Guard)
	elseif(SobGroup_HealthPercentage(CustomGroup)<1)and(SobGroup_Count("GroupDockTargetGroup"..shipID)==1)and(SobGroup_IsDoingAbility(CustomGroup,AB_Guard)==1)and(SobGroup_AreAnyOfTheseTypes("GroupDockTargetGroup"..shipID,UnitToLatch)==1)and(SobGroup_Empty("GroupDockTempGroup"..shipID)==1)then
--将原编组单位送入超空间并以单个单位替换之
		if(SobGroup_GetDistanceToSobGroup(CustomGroup,"GroupDockTargetGroup"..shipID)<500)and(SobGroup_AreAllInRealSpace(CustomGroup)==1)then
			SobGroup_Stop(playerIndex,CustomGroup)
			SobGroup_Despawn(CustomGroup)
			SobGroup_SetHealth(CustomGroup,1)
			local iHealth=SobGroup_HealthPercentage(CustomGroup)
			Volume_AddSphere("GroupDockSpawn"..shipID,SobGroup_GetPosition(CustomGroup),10)
			for i=1,SobGroup_Count(CustomGroup) do
				SobGroup_SpawnNewShipInSobGroup(playerIndex,CustomGroup.."_1",CustomGroup..i..shipID,"GroupDockTempGroup"..shipID,"GroupDockSpawn"..shipID)
			end
			SobGroup_SetInvulnerability("GroupDockTempGroup"..shipID, 1)
			Volume_Delete("GroupDockSpawn"..shipID)
			SobGroup_SetHealth("GroupDockTempGroup"..shipID,iHealth)
			SobGroup_DockSobGroupAndStayDocked("GroupDockTempGroup"..shipID, "GroupDockTargetGroup"..shipID)
		end
--停泊完毕后发射，替换为原单位
	elseif(SobGroup_Empty("GroupDockTempGroup"..shipID)==0)then
		if(SobGroup_IsDockedSobGroup("GroupDockTempGroup"..shipID,"GroupDockTargetGroup"..shipID)==1)then
			if(SobGroup_HealthPercentage("GroupDockTempGroup"..shipID)==1)then
				SobGroup_Launch("GroupDockTempGroup"..shipID,"GroupDockTargetGroup"..shipID)
			end
		elseif(SobGroup_AreAllInHyperspace(CustomGroup)==1)and(SobGroup_HealthPercentage("GroupDockTempGroup"..shipID)==1)then
			Volume_AddSphere("GroupDockSpawn"..shipID,SobGroup_GetPosition("GroupDockTempGroup"..shipID),10)
			SobGroup_Spawn(CustomGroup,"GroupDockSpawn"..shipID)
			Volume_Delete("GroupDockSpawn"..shipID)
			SobGroup_SetInvulnerability("GroupDockTempGroup"..shipID, 0)
			SobGroup_GuardSobGroup("GroupDockTempGroup"..shipID, "GroupDockTargetGroup"..shipID)
			SobGroup_MakeDead("GroupDockTempGroup"..shipID)
			SobGroup_Clear("GroupDockTargetGroup"..shipID)
		end
	end
end

function SobGroup_GetDistanceToSobGroup(sb1,sb2)
	local p1=SobGroup_GetPosition(sb1)
	local p2=SobGroup_GetPosition(sb2)
	local dis=0
	for i=1,3 do
		dis=dis+(p1[i]-p2[i])^2
	end
	return sqrt(dis)
end