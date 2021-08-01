HidingDistance={0,0.3,0.6,0.9}

function Create_Hide(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("AIHideGroup")
end

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

function Update_Hide(CustomGroup, playerIndex, shipID)
	local g_LOD=Player_GetLOD(playerIndex)
	if(g_LOD > 1)then
		if (SobGroup_GetActualSpeed(CustomGroup)<1) and (SobGroup_GroupInGroup("AIHideGroup",CustomGroup)==0) then
			if (SobGroup_Empty("AITempRemoveGroup")==1)then
				SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
			end
			if (SobGroup_Empty("AITempDefendGroup"..playerIndex)==1)then
				SobGroup_SobGroupAdd("AITempDefendGroup"..playerIndex,CustomGroup)
			end
			SobGroup_SobGroupAdd("AIHideGroup",CustomGroup)
			Volume_Delete("HidingPosition"..shipID)
			local WorldBound=Universe_GetWorldBounds()
			local HidingPosition={0,0,0,}
			local cPosition=SobGroup_GetPosition(CustomGroup)
			for iPlayer=0,Universe_PlayerCount()-1 do
				if(iPlayer~=playerIndex)and(Player_IsAlive(iPlayer)==1)then
					if(AreAllied(iPlayer,playerIndex)==0)then
						local ePosition=SobGroup_GetPosition("Player_Ships"..iPlayer)
						for i=1,3 do
							HidingPosition[i]=cPosition[i]-ePosition[i]
						end
					end
				end
			end
			if(HidingPosition[2]>0)then
				HidingPosition[2]=HidingDistance[g_LOD]*WorldBound[2]
			elseif(HidingPosition[2]<0)then
				HidingPosition[2]=-HidingDistance[g_LOD]*WorldBound[2]
			end
			local aHidingDis=HidingPosition[1]^2+HidingPosition[3]^2
			local bHidingDis=2*(cPosition[1]*HidingPosition[1]+cPosition[3]*HidingPosition[3])
			local cHidingDis=cPosition[1]^2+cPosition[3]^2-WorldBound[1]^2
			local HidingDis=0.5*(sqrt(bHidingDis^2-4*aHidingDis*cHidingDis)-bHidingDis)/aHidingDis
			HidingPosition[1]=HidingDistance[g_LOD]*HidingDis*HidingPosition[1]+cPosition[1]
			HidingPosition[3]=HidingDistance[g_LOD]*HidingDis*HidingPosition[3]+cPosition[3]
			Volume_AddSphere("HidingPosition"..shipID, HidingPosition, 10)
			SobGroup_Move(playerIndex,CustomGroup,"HidingPosition"..shipID)
		end
	end
end

function StopHiding(CustomGroup, playerIndex, shipID)
	if(Player_GetLevelOfDifficulty(playerIndex) > 0)then
		if (SobGroup_Empty("AITempAddGroup")==1) and (SobGroup_GroupInGroup("AIHideGroup",CustomGroup)==1)then
			SobGroup_RemoveSobGroup("AIHideGroup",CustomGroup)
			SobGroup_SobGroupAdd("AITempAddGroup",CustomGroup)
		end
	end
end

function SobGroup_RemoveSobGroup(sg1,sg2)
	SobGroup_CreateIfNotExist("SobGroupTempRemoveGroup")
	SobGroup_FillSubstract("SobGroupTempRemoveGroup", sg1, sg2)
	SobGroup_Clear(sg1)
	SobGroup_Copy(sg1,"SobGroupTempRemoveGroup")
end