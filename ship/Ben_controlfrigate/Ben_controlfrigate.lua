Ben_ControlPlayer={}
Ben_ControlDistance=1500
Ben_MaxControlLevel=3
BenControlShipData={}

function FX_Ben_GetControlLevel(playerIndex,shipID)
	local iControlLevel=0
		for i=1,Ben_MaxControlLevel do
			if(SobGroup_GroupInGroup("Ben_ControllingGroup_"..playerIndex.."_"..i,"Ben_ControllingGroup"..shipID)==1)then
				iControlLevel=i
			else
				break
			end
		end
	return iControlLevel
end

function FX_Ben_GetControlLevel2(playerIndex,shipID)
	local iControlLevel=0
		for i=1,Ben_MaxControlLevel do
			if(SobGroup_GroupInGroup("Ben_ControllingGroup_"..playerIndex.."_"..i,"Ben_ToBeControlledGroup"..shipID)==1)then
				iControlLevel=i
			else
				break
			end
		end
	return iControlLevel
end

function FX_Ben_Control(playerIndex,shipID)
	local iControlLevel=0
	iControlLevel=FX_Ben_GetControlLevel(playerIndex,shipID)
	if(SobGroup_Count("Ben_ControllingGroup"..shipID)==1)then
		if((SobGroup_AreAnyFromTheseAttackFamilies("Ben_ControllingGroup"..shipID, "Frigate")==1)and(iControlLevel>0))or
			((SobGroup_AreAnyFromTheseAttackFamilies("Ben_ControllingGroup"..shipID, "SmallCapitalShip")==1)and(iControlLevel>1))or
			((SobGroup_AreAnyFromTheseAttackFamilies("Ben_ControllingGroup"..shipID, "BigCapitalShip,Mothership")==1)and(iControlLevel>2))then
			if(SobGroup_OwnedBy("Ben_ControllingGroup"..shipID)~=playerIndex)then
				SobGroup_SwitchOwner("Ben_ControllingGroup"..shipID,playerIndex)--获得舰船控制权
			end
		elseif(SobGroup_OwnedBy("Ben_ControllingGroup"..shipID)~=Ben_ControlPlayer[shipID])and(Ben_ControlPlayer[shipID]~=-1)then
				SobGroup_SwitchOwner("Ben_ControllingGroup"..shipID,Ben_ControlPlayer[shipID])--恢复舰船控制权
		end
	end
end

function FX_Ben_LoseControl(playerIndex,shipID)
	if(SobGroup_Empty("Ben_ControllingGroup"..shipID)==0)then
		local iControlLevel=0
		iControlLevel=FX_Ben_GetControlLevel(playerIndex,shipID)
		if(iControlLevel>0)then
			SobGroup_Clear("Ben_ControllTempGroup")
			SobGroup_SobGroupAdd("Ben_ControllTempGroup","Ben_ControllingGroup_"..playerIndex.."_"..iControlLevel)
			SobGroup_Clear("Ben_ControllingGroup_"..playerIndex.."_"..iControlLevel)
			SobGroup_FillSubstract("Ben_ControllingGroup_"..playerIndex.."_"..iControlLevel,"Ben_ControllTempGroup","Ben_ControllingGroup"..shipID)
			FX_Ben_Control(playerIndex,shipID)
			Ben_ControlPlayer[shipID]=-1
		end
	end
end

function Start_Control(CustomGroup, playerIndex, shipID)
		local iControlLevel=0
		SobGroup_AbilityActivate(CustomGroup, AB_Attack, 0)
		iControlLevel=FX_Ben_GetControlLevel2(playerIndex,shipID)
		--if(iControlLevel<Ben_MaxControlLevel)then
			SobGroup_Clear("Ben_ControllingGroup"..shipID)
			SobGroup_SobGroupAdd("Ben_ControllingGroup"..shipID,"Ben_ToBeControlledGroup"..shipID)
			SobGroup_SobGroupAdd("Ben_ControllingGroup_"..playerIndex.."_"..(iControlLevel+1),"Ben_ToBeControlledGroup"..shipID)
			Ben_ControlPlayer[shipID]=SobGroup_OwnedBy("Ben_ControllingGroup"..shipID)--记录舰船所属玩家编号
			FX_Ben_Control(playerIndex,shipID)
		--end
end

function Do_Control(CustomGroup, playerIndex, shipID)
	--if(SobGroup_Empty("Ben_ControllingGroup"..shipID)==0)then
	--	if(SobGroup_GetDistanceToSobGroup(CustomGroup, "Ben_ControllingGroup"..shipID)>Ben_ControlDistance)then
	--		SobGroup_AbilityActivate(CustomGroup, AB_Attack, 1)
	--		FX_Ben_LoseControl(playerIndex,shipID)
	--	end
	--end
end

function Finish_Control(CustomGroup, playerIndex, shipID)
	if(SobGroup_Empty("Ben_ControllingGroup"..shipID)==0)then
		SobGroup_AbilityActivate(CustomGroup, AB_Attack, 1)
		FX_Ben_LoseControl(playerIndex,shipID)
	end
end

function Create_Control(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("Ben_ControllTempGroup")
	SobGroup_SetSwitchOwnerFlag("Ben_ControllTempGroup", 0)
	SobGroup_CreateIfNotExist("Ben_ToBeControlledGroup"..shipID)
	SobGroup_SetSwitchOwnerFlag("Ben_ToBeControlledGroup"..shipID, 0)
	SobGroup_CreateIfNotExist("Ben_ControllingGroup"..shipID)
	SobGroup_SetSwitchOwnerFlag("Ben_ControllingGroup"..shipID, 0)
	for i=1,Ben_MaxControlLevel do
		SobGroup_CreateIfNotExist("Ben_ControllingGroup_"..playerIndex.."_"..i)
		SobGroup_SetSwitchOwnerFlag("Ben_ControllingGroup_"..playerIndex.."_"..i, 0)
	end
	Ben_ControlPlayer[shipID]=-1
end

function Update_Control(CustomGroup, playerIndex, shipID)
	if (SobGroup_GetCurrentOrder(CustomGroup) == COMMAND_Attack) then--正在执行攻击命令
		SobGroup_GetCommandTargets("Ben_ToBeControlledGroup"..shipID, CustomGroup, COMMAND_Attack)
		if(SobGroup_Count("Ben_ToBeControlledGroup"..shipID)==1)and(SobGroup_AreAnyFromTheseAttackFamilies("Ben_ToBeControlledGroup"..shipID, "Frigate,SmallCapitalShip,Capturer,BigCapitalShip,Mothership")==1)then
			if(SobGroup_GetDistanceToSobGroup(CustomGroup, "Ben_ToBeControlledGroup"..shipID)<=Ben_ControlDistance)then--攻击目标唯一，在范围内，解锁控制指令
				if(SobGroup_CanDoAbility(CustomGroup,AB_Custom)==0)then
					SobGroup_AbilityActivate(CustomGroup,AB_Custom,1)
				end
			elseif(SobGroup_CanDoAbility(CustomGroup,AB_Custom)==1)then
				SobGroup_AbilityActivate(CustomGroup,AB_Custom,0)
			end
		elseif(SobGroup_CanDoAbility(CustomGroup,AB_Custom)==1)then
			SobGroup_AbilityActivate(CustomGroup,AB_Custom,0)
		end
	elseif(SobGroup_CanDoAbility(CustomGroup,AB_Custom)==1)then
		SobGroup_AbilityActivate(CustomGroup,AB_Custom,0)
	end
	if(SobGroup_Empty("Ben_ControllingGroup"..shipID)==1)and(SobGroup_CanDoAbility(CustomGroup,AB_Attack)==0)then
		SobGroup_AbilityActivate(CustomGroup,AB_Attack,1)
	end
end

function Destroy_Control(CustomGroup, playerIndex, shipID)
	if(SobGroup_CanDoAbility(CustomGroup, AB_Capture)==0)then--若控制时被摧毁，则失去对目标的控制
		FX_Ben_LoseControl(playerIndex,shipID)
	end
end

function SobGroup_GetDistanceToSobGroup(iName1,iName2)
	local pos1 = SobGroup_GetPosition(iName1)
	local pos2 = SobGroup_GetPosition(iName2)
	local l_distance = 0
	for i = 1,3 do
		l_distance = l_distance + (pos1[i] - pos2[i])^2
	end
	l_distance = sqrt(l_distance)
	return l_distance
end
