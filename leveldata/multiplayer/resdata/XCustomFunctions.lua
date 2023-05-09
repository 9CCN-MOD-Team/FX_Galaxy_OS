--该文件为单位列表定义中设定调用的函数，这些函数运行在mainrule而非customcode域中
Kad_FuelPodEffectRange=2000

function Kad_SupportPod_AI(CustomGroup, playerIndex, shipID)
	if (playerIndex>=0) then
		SobGroup_CreateIfNotExist("Kad_FuelPodGuardGroup"..playerIndex)
		SobGroup_CreateIfNotExist("Kad_FuelPodGroup"..shipID)
		if(SobGroup_CanDoAbility(CustomGroup, AB_Custom)==1)and(SobGroup_IsDoingAbility(CustomGroup, AB_Custom)==0)and(SobGroup_Count("Kad_FuelPodGroup"..shipID)<32) then
			--自动将2被作用范围内的细胞收纳过来
			SobGroup_Clear("UnitCharacteristicTempGroup")
			SobGroup_Clear("UnitCharacteristicTempGroup2")
			SobGroup_CreateIfNotExist("FillPlayerShipsByTypeTempGroup")
			SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..playerIndex, CustomGroup, 2*Kad_FuelPodEffectRange)
			local supportType={"kad_swarmer","kad_assaultswarmer","kad_lanceswarmer","kad_lanceswarmer1","kad_advancedswarmer","kad_advancedassaultswarmer"}
			for index,itype in supportType do
				SobGroup_Clear("FillPlayerShipsByTypeTempGroup")
				SobGroup_FillShipsByType("FillPlayerShipsByTypeTempGroup", "UnitCharacteristicTempGroup", itype)
				SobGroup_SobGroupAdd("UnitCharacteristicTempGroup2","FillPlayerShipsByTypeTempGroup")
			end
			SobGroup_Clear("UnitCharacteristicTempGroup")
			SobGroup_FillSubstract("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "Kad_FuelPodGuardGroup"..playerIndex)
			if (SobGroup_Empty("UnitCharacteristicTempGroup")==0)and(SobGroup_CanDoAbility("UnitCharacteristicTempGroup", AB_UseSpecialWeaponsInNormalAttack)==0) then
				CPU_RemoveSobGroup(playerIndex, "UnitCharacteristicTempGroup")
				SobGroup_SobGroupAdd("Kad_FuelPodGuardGroup"..playerIndex,"UnitCharacteristicTempGroup")
				SobGroup_GuardSobGroup("UnitCharacteristicTempGroup", CustomGroup)
				SobGroup_SobGroupAdd("Kad_FuelPodGroup"..shipID,"UnitCharacteristicTempGroup")
				SobGroup_SobGroupAdd("Kad_FuelPodGroup"..shipID,CustomGroup)
				--SobGroup_FormStrikeGroup("Kad_FuelPodGroup"..shipID, "sphere")
				SobGroup_RemoveType("Kad_FuelPodGroup"..shipID, "kad_fuelpod")
			end
			--被别的支援座舱激发的细胞也可自由行动
			if (SobGroup_Empty("Kad_FuelPodGroup"..shipID)==0)and(SobGroup_CanDoAbility("Kad_FuelPodGroup"..shipID, AB_UseSpecialWeaponsInNormalAttack)==1) then
					CPU_AddSobGroup(playerIndex, "Kad_FuelPodGroup"..shipID)
					SobGroup_RemoveSobGroup("Kad_FuelPodGuardGroup"..playerIndex,"Kad_FuelPodGroup"..shipID)
					SobGroup_SobGroupAdd("Kad_FuelPodGroup"..shipID,CustomGroup)
					--SobGroup_LeaveStrikeGroup("Kad_FuelPodGroup"..shipID,1)
					SobGroup_Clear("Kad_FuelPodGroup"..shipID)
			end
			--细胞受到攻击则激活能力
			SobGroup_Clear("UnitCharacteristicTempGroup")
			SobGroup_Clear("UnitCharacteristicTempGroup2")
			SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..playerIndex, CustomGroup, 0.5*Kad_FuelPodEffectRange)
			SobGroup_FillShipsByType("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "kad_fuelpod")
			if (SobGroup_IsDoingAbility("UnitCharacteristicTempGroup2", AB_Custom)==0) then
				if (SobGroup_UnderAttack("Player_Ships"..playerIndex)==1) then
					if (SobGroup_Count("Kad_FuelPodGroup"..shipID)>20) then
						SobGroup_CustomCommand(CustomGroup)
					end
					CPU_AddSobGroup(playerIndex, "Kad_FuelPodGroup"..shipID)
					SobGroup_RemoveSobGroup("Kad_FuelPodGuardGroup"..playerIndex,"Kad_FuelPodGroup"..shipID)
					SobGroup_SobGroupAdd("Kad_FuelPodGroup"..shipID,CustomGroup)
					--SobGroup_LeaveStrikeGroup("Kad_FuelPodGroup"..shipID, 1)
					SobGroup_Clear("Kad_FuelPodGroup"..shipID)
				end
			end
		--elseif(SobGroup_CanDoAbility(CustomGroup, AB_Custom)==0)and(SobGroup_Count("Kad_FuelPodGroup"..shipID)>0)then
		--	SobGroup_RemoveSobGroup("Kad_FuelPodGuardGroup"..playerIndex,"Kad_FuelPodGroup"..shipID)
		end
	end
end

function SobGroup_RemoveSobGroup(sg1,sg2)
	SobGroup_CreateIfNotExist("SobGroupTempRemoveGroup")
	SobGroup_FillSubstract("SobGroupTempRemoveGroup", sg1, sg2)
	SobGroup_Clear(sg1)
	SobGroup_Copy(sg1,"SobGroupTempRemoveGroup")
end

function Kpr_CaptureStop(CustomGroup, playerIndex, shipID)
	SobGroup_Clear("Kpr_CaptureGroup"..shipID)
	SobGroup_GetSobGroupCapturingGroup(CustomGroup, "Kpr_CaptureGroup"..shipID)
	if (SobGroup_Empty("Kpr_CaptureGroup"..shipID)==0) then
		SobGroup_Stop(SobGroup_OwnedBy("Kpr_CaptureGroup"..shipID),"Kpr_CaptureGroup"..shipID)
	end
end