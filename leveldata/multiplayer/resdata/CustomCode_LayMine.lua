MineFieldSize={0,1000,1500,2000}

function Player_GetLOD(iPlayer)
	local l_LOD=Player_GetLevelOfDifficulty(iPlayer) 
	if (l_LOD==0) then
		return 0
	elseif (Universe_RulesName()=="FXSINGLEPLAYER") then
		return tonumber(GameEvent_IsListening(6000+iPlayer))
	else
		return l_LOD
	end
end

function Create_LayMine(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("AIMinelayerGroup")
	SobGroup_CreateIfNotExist("AIMinelayerTempGroup")
	SobGroup_CreateIfNotExist("AIMinelayerTempGroup2")
	Volume_AddSphere("MineField"..shipID, SobGroup_GetPosition("Player_Ships"..playerIndex), 0)
end

function Update_LayMine(CustomGroup, playerIndex, shipID)
if (Universe_RulesName()~="DEFENSE") then
	local g_LOD=Player_GetLOD(playerIndex)
	if(g_LOD > 1)then
		if (SobGroup_Empty("AITempRemoveGroup")==1) and (SobGroup_GroupInGroup("AIMinelayerGroup",CustomGroup)==0)then
			SobGroup_SobGroupAdd("AIMinelayerGroup",CustomGroup)
			SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
			SobGroup_AbilityActivate(CustomGroup, AB_Attack, 0)
			--SobGroup_AbilityActivate(CustomGroup, AB_Mine, 0)
		end
		local iCollectorTable={"hgn_resourcecollector","vgr_resourcecollector","kpr_resourcecollector","tai_resourcecollector","kad_salvager","tur_resourcecollector","hgn_resourcecollector","kus_resourcecollector",}
		--���ڲ���
			if (SobGroup_HealthPercentage(CustomGroup)==1)and(SobGroup_CanDoAbility(CustomGroup,AB_Mine)==1) then
				SobGroup_Clear("AIMinelayerTempGroup2")
				SobGroup_FillSobGroupInVolume("AIMinelayerTempGroup2", "Player_Ships"..playerIndex, "MineField"..shipID)
				--�����޿󴬣����¶�λĿ��
				if(SobGroup_AreAnyOfTheseTypes("AIMinelayerTempGroup2", iCollectorTable[PlayerRace_GetNumber(playerIndex,"raceID", 1.0)])==0)then
					SobGroup_Clear("AIMinelayerTempGroup")
					Player_FillShipsByType("AIMinelayerTempGroup", playerIndex, iCollectorTable[PlayerRace_GetNumber(playerIndex,"raceID", 1.0)])
					SobGroup_Clear("AIMinelayerTempGroup2")
					local CollectorIndex=0
					while(SobGroup_Empty("AIMinelayerTempGroup2") == 1)and(CollectorIndex<SobGroup_Count("AIMinelayerTempGroup"))do
						SobGroup_FillShipsByIndexRange("AIMinelayerTempGroup2", "AIMinelayerTempGroup", CollectorIndex, 1)
						if(SobGroup_IsInVolume("AIMinelayerTempGroup2", "MineField"..playerIndex)==1)then
							SobGroup_Clear("AIMinelayerTempGroup2")
						end
						CollectorIndex=CollectorIndex+1
					end
					--���������Ŀ��ƶ�
					if(SobGroup_Empty("AIMinelayerTempGroup2") == 0)then
						local iPosition = SobGroup_GetPosition("AIMinelayerTempGroup2")
						Volume_Delete("MineField"..shipID)
						Volume_AddSphere("MineField"..shipID, iPosition, MineFieldSize[g_LOD])
						Volume_Delete("MineField"..playerIndex)
						Volume_AddSphere("MineField"..playerIndex, iPosition, MineFieldSize[g_LOD])
						SobGroup_MoveToSobGroup(CustomGroup, "AIMinelayerTempGroup2")
						SobGroup_AbilityActivate(CustomGroup, AB_Mine, 0)
					end
				end
			--�ƶ���
			elseif (SobGroup_HealthPercentage(CustomGroup)==1)then
				if(SobGroup_IsInVolume(CustomGroup, "MineField"..shipID)==0)then
					SobGroup_Move(playerIndex, CustomGroup, "MineField"..shipID)
				elseif(SobGroup_GetActualSpeed(CustomGroup)<1)then
					local iPosition = SobGroup_GetPosition(CustomGroup)
					SobGroup_AbilityActivate(CustomGroup, AB_Mine, 1)
					if (SobGroup_CanDoAbility(CustomGroup, AB_Mine)==1) then
						SobGroup_DeployMines(CustomGroup, "MineField"..shipID, 1)
					end
				end
			--���ˣ�ͣ��
			else
				if(SobGroup_CanDoAbility(CustomGroup,AB_Mine)==1) then
					SobGroup_AbilityActivate(CustomGroup, AB_Mine, 0)
				end
				SobGroup_DockSobGroupWithAny(CustomGroup)
			end
	end
end
end

function Destroy_LayMine(CustomGroup, playerIndex, shipID)	
	Volume_Delete("MineField"..shipID)
end
