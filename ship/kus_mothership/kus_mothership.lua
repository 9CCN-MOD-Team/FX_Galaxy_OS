function Create_LinkHQ(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("FX_HPG")
end

function Update_LinkHQ(CustomGroup, playerIndex, shipID)
	local g_LOD=Player_GetLevelOfDifficulty(playerIndex)
	if(g_LOD > 0)then
		local topHP,emptyHP=FX_HPGUpdate(playerIndex)
		if (SobGroup_GroupInGroup("FX_HPG", CustomGroup)==0) then
			SobGroup_SobGroupAdd("FX_HPG", CustomGroup)
			if (emptyHP["num1"]==0)and(emptyHP["num2"]==0) then
				SobGroup_CreateIfNotExist("iHP1_"..playerIndex.."_"..topHP)
				--SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
				SobGroup_AbilityActivate(CustomGroup,AB_Move,0)
				SobGroup_SobGroupAdd("iHP1_"..playerIndex.."_"..topHP, CustomGroup)
			elseif(emptyHP["num1"]>=emptyHP["num2"])then
				--SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
				SobGroup_AbilityActivate(CustomGroup,AB_Move,0)
				SobGroup_SobGroupAdd("iHP1_"..playerIndex.."_"..emptyHP.group1[1], CustomGroup)
			else
				SobGroup_SobGroupAdd("iHP2_"..playerIndex.."_"..emptyHP.group2[1], CustomGroup)
			end
		end
	end
end

function Destroy_LinkHQ(CustomGroup, playerIndex, shipID)
end
--检索跳跃门Group，返回组1或组2的空号
function FX_HPGUpdate(playerIndex)
	local iHP=1
	local emptyHP={group1={},group2={},num1=0,num2=0}
	while (iHP<=(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hyperspace_platform")+emptyHP["num1"]+emptyHP["num2"])/2) do
		SobGroup_CreateIfNotExist("iHP2_"..playerIndex.."_"..iHP)
		if (SobGroup_Empty("iHP2_"..playerIndex.."_"..iHP)==1)and(SobGroup_Empty("iHP1_"..playerIndex.."_"..iHP)==1) then
			tinsert(emptyHP["group1"],iHP)
			tinsert(emptyHP["group2"],iHP)
			emptyHP["num1"]=emptyHP["num1"]+1
			emptyHP["num2"]=emptyHP["num2"]+1
		elseif (SobGroup_Empty("iHP1_"..playerIndex.."_"..iHP)==1) then
			tinsert(emptyHP["group1"],iHP)
			emptyHP["num1"]=emptyHP["num1"]+1
		elseif (SobGroup_Empty("iHP2_"..playerIndex.."_"..iHP)==1) then
			tinsert(emptyHP["group2"],iHP)
			emptyHP["num2"]=emptyHP["num2"]+1
		elseif (SobGroup_IsGateDeployed("iHP1_"..playerIndex.."_"..iHP, "iHP2_"..playerIndex.."_"..iHP)==0) then
			if (SobGroup_CanDoAbility("iHP2_"..playerIndex.."_"..iHP, AB_Move)==0)and(SobGroup_GetActualSpeed("iHP2_"..playerIndex.."_"..iHP)<1) then
				SobGroup_SetAsDeployed("iHP1_"..playerIndex.."_"..iHP)
				SobGroup_SetAsDeployed("iHP2_"..playerIndex.."_"..iHP)
				SobGroup_FormHyperspaceGate("iHP1_"..playerIndex.."_"..iHP, "iHP2_"..playerIndex.."_"..iHP)
			end
		else
			SobGroup_CreateIfNotExist("tHP1_"..playerIndex.."_"..iHP)
			SobGroup_CreateIfNotExist("tHP2_"..playerIndex.."_"..iHP)
			local iDis1=0.4*(SobGroup_GetDistanceToSobGroup("iHP1_"..playerIndex.."_"..iHP,"iHP2_"..playerIndex.."_"..iHP)-4000)
			local iDis2=0.6*(SobGroup_GetDistanceToSobGroup("iHP1_"..playerIndex.."_"..iHP,"iHP2_"..playerIndex.."_"..iHP)-4000)
			local iPlayer=0
			if (iDis1>0)and(iDis2>0) then
				while (iPlayer<Universe_PlayerCount()) do
					if (iPlayer~=playerIndex) then
						SobGroup_FillProximitySobGroup("tHP2_"..playerIndex.."_"..iHP,"Player_Ships"..iPlayer, "iHP2_"..playerIndex.."_"..iHP, iDis2)
						if (SobGroup_Empty("tHP2_"..playerIndex.."_"..iHP)==0) then
							if (AreAllied(iPlayer, playerIndex)==0) then
								SobGroup_FillProximitySobGroup("tHP1_"..playerIndex.."_"..iHP, "Player_Ships"..playerIndex, "iHP1_"..playerIndex.."_"..iHP, iDis1)
								if (SobGroup_Empty("tHP1_"..playerIndex.."_"..iHP)==0) then
									local iHPRemoveType={"vgr_mothership","vgr_shipyard","vgr_carrier","vgr_resourcecollector","vgr_resourcecontroller","vgr_probe_prox","vgr_hyperspace_platform","vgr_weaponplatform_missile"}
									for index,shiptype in iHPRemoveType do
										SobGroup_RemoveType("tHP1_"..playerIndex.."_"..iHP, shiptype)
									end
									if (SobGroup_Empty("tHP1_"..playerIndex.."_"..iHP)==0) then
										if (SobGroup_HealthPercentage("tHP1_"..playerIndex.."_"..iHP)>0.9) then
											SobGroup_UseHyperspaceGate("tHP1_"..playerIndex.."_"..iHP, "iHP1_"..playerIndex.."_"..iHP)
											iPlayer=Universe_PlayerCount()
											break
										end
									end
								end
							end
						end
					end
					iPlayer=iPlayer+1
				end
			end
		end
		iHP=iHP+1
	end
	iHP=iHP-1
	if (emptyHP.num1>0)and(emptyHP.num2>0) then
		if (mod(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hyperspace_platform")+emptyHP["num1"]+emptyHP["num2"],2)==1) then
			SobGroup_CreateIfNotExist("iHP1_"..playerIndex.."_"..(iHP+1))
			if (SobGroup_Count("iHP1_"..playerIndex.."_"..(iHP+1))==1) then
				SobGroup_SobGroupAdd("iHP1_"..playerIndex.."_"..emptyHP.group1[emptyHP.num1],"iHP1_"..playerIndex.."_"..(iHP+1))
				SobGroup_SobGroupClear("iHP1_"..playerIndex.."_"..(iHP+1))
				emptyHP.group1[emptyHP.num1]=nil
				emptyHP.num1=emptyHP.num1-1
			end
		elseif emptyHP.group1[emptyHP.num1]~=iHP and emptyHP.group2[emptyHP.num2]~=iHP then
			SobGroup_SobGroupAdd("iHP1_"..playerIndex.."_"..emptyHP.group1[emptyHP.num1],"iHP1_"..playerIndex.."_"..iHP)
			SobGroup_SobGroupClear("iHP1_"..playerIndex.."_"..iHP)
			SobGroup_SobGroupAdd("iHP2_"..playerIndex.."_"..emptyHP.group2[emptyHP.num2],"iHP2_"..playerIndex.."_"..iHP)
			SobGroup_SobGroupClear("iHP2_"..playerIndex.."_"..iHP)
			emptyHP.group1[emptyHP.num1]=nil
			emptyHP.num1=emptyHP.num1-1
			emptyHP.group2[emptyHP.num2]=nil
			emptyHP.num2=emptyHP.num2-1
		elseif emptyHP.group1[emptyHP.num1]==iHP then
			SobGroup_SobGroupAdd("iHP2_"..playerIndex.."_"..emptyHP.group2[emptyHP.num2],"iHP2_"..playerIndex.."_"..iHP)
			SobGroup_SobGroupClear("iHP2_"..playerIndex.."_"..iHP)
			emptyHP.group2[emptyHP.num2]=nil
			emptyHP.num2=emptyHP.num2-1
		elseif emptyHP.group2[emptyHP.num2]==iHP then
			SobGroup_SobGroupAdd("iHP1_"..playerIndex.."_"..emptyHP.group1[emptyHP.num1],"iHP1_"..playerIndex.."_"..iHP)
			SobGroup_SobGroupClear("iHP1_"..playerIndex.."_"..iHP)
			emptyHP.group1[emptyHP.num1]=nil
			emptyHP.num1=emptyHP.num1-1
		end
	elseif (emptyHP.num1==0)and(emptyHP.num2>0) then
		SobGroup_CreateIfNotExist("iHP1_"..playerIndex.."_"..(iHP+1))
		if (SobGroup_Count("iHP1_"..playerIndex.."_"..(iHP+1))==1) then
			if (SobGroup_CanDoAbility("iHP1_"..playerIndex.."_"..(iHP+1), AB_Move)==1) then
				SobGroup_SobGroupAdd("iHP2_"..playerIndex.."_"..emptyHP.group2[emptyHP.num2],"iHP1_"..playerIndex.."_"..(iHP+1))
				SobGroup_SobGroupClear("iHP2_"..playerIndex.."_"..iHP)
				--SobGroup_SobGroupAdd("AITempAddGroup","iHP2_"..playerIndex.."_"..emptyHP.group2[emptyHP.num2])
				SobGroup_AbilityActivate(CustomGroup,AB_Move,1)
				emptyHP.group2[emptyHP.num2]=nil
				emptyHP.num2=emptyHP.num2-1
			end
		end
	end
	return iHP+1,emptyHP
end

function SobGroup_GetDistanceToSobGroup(iSob1,iSob2)
	local iPos1=SobGroup_GetPosition(iSob1)
	local iPos2=SobGroup_GetPosition(iSob2)
	local iDis=sqrt((iPos1[1]-iPos2[1])^2+(iPos1[2]-iPos2[2])^2+(iPos1[3]-iPos2[3])^2)
	return iDis
end