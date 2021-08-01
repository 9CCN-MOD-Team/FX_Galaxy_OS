X_ConditionJudge = {}

--单位子系统生命值判断:{"HardpointHealth",<Hardpoint>,<HealthPercentage>,}
X_ConditionJudge["HardpointHealth"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	if(iCondition[3]>0)then
		if(100*SobGroup_GetHardPointHealth(iGroup, iCondition[2]) >= iCondition[3])then
			iReturn = 1
		end
	else
		if(100*SobGroup_GetHardPointHealth(iGroup, iCondition[2]) <= -iCondition[3])then
			iReturn = 1
		end
	end
	return iReturn
end

------------------------String--------------------------------
X_ConditionJudge["HasResearch"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 1-iCondition[2]
	if(Player_HasResearch(iPlayer, iCondition[3]) == 0)then
		iReturn = iCondition[2]
	end
	return iReturn
end

X_ConditionJudge["HasUpgrade"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 1-iCondition[2]
	if(Player_HasUpgrade(iPlayer, iCondition[3]) == 0)then
		iReturn = iCondition[2]
	end
	return iReturn
end

X_ConditionJudge["HasSubsystem"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 1-iCondition[2]
	if(SobGroup_HasSubsystem(iGroup, iCondition[3]) == 0)then
		iReturn = iCondition[2]
	end
	return iReturn
end
-----------------------反转参数+双参数-----------------
--Race Number判断:{"RaceNumber",<反转参数>,<NumberIndexName>,<ExpectNumber>}
X_ConditionJudge["RaceNumber"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 1-iCondition[2]
	if(iCondition[3]~=nil)then
		if(PlayerRace_GetNumber(iPlayer,iCondition[3]) ~= iCondition[4])then
			iReturn = iCondition[2]
		end
	end
	return iReturn
end

--Race String判断:{"RaceString",<反转参数>,<StringIndexName>,<ExpectString>}
X_ConditionJudge["RaceString"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 1-iCondition[2]
	if(iCondition[3]~=nil)then
		if(PlayerRace_GetString(iPlayer,iCondition[3]) ~= iCondition[4])then
			iReturn = iCondition[2]
		end
	end
	return iReturn
end

--游戏模式设定Number判断:{"GameSettingNumber",<反转参数>,<SettingName>,<SettingNumber>}
X_ConditionJudge["GameSettingNumber"]=function(iPlayer, iShip, iGroup, iSetting)
	local iReturn = 1
	if(iCondition[2] == 0)then
		if(GetGameSettingAsNumber(iCondition[3])==iCondition[4])then
			iReturn = 0
		end
	else
		if(GetGameSettingAsNumber(iCondition[3])~=iCondition[4])then
			iReturn = 0
		end
	end
	return iReturn
end

--游戏模式设定String判断:{"GameSettingString",<反转参数>,<SettingName>,<SettingString>}
X_ConditionJudge["GameSettingString"]=function(iPlayer, iShip, iGroup, iSetting)
	local iReturn = 1
	if(iCondition[2] == 0)then
		if(GetGameSettingAsString(iCondition[3])==iCondition[4])then
			iReturn = 0
		end
	else
		if(GetGameSettingAsString(iCondition[3])~=iCondition[4])then
			iReturn = 0
		end
	end
	return iReturn
end

-------------------------反转参数+String---------------------------
--单位SobGroup条件判断:{"IsInSobGroup",<反转参数>,<SobGroupName>,}
X_ConditionJudge["IsInSobGroup"]=function(iPlayer, iShip, iGroup, iCondition)
	SobGroup_CreateIfNotExist(iCondition[3])
	local iReturn = 1
	if(iCondition[2] > 0)then
		if(SobGroup_GroupInGroup(iCondition[3])==0)then
			iReturn = 0
		end
	else
		if(SobGroup_GroupInGroup(iCondition[3])==1)then
			iReturn = 0
		end
	end
	return iReturn
end

--Rule Name判断:{"RuleName",<反转参数>,<iRuleName>,}
X_ConditionJudge["RuleName"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = iCondition[2]
	if (Universe_RulesName()==iCondition[3])then
		iReturn = 1-iCondition[2]
	end
	return iReturn
end

--Race Name判断:{"RaceName",<反转参数>,<iRaceName>,}
X_ConditionJudge["RaceName"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = iCondition[2]
	if (Race_GetName(Player_GetRace(iPlayer))==iCondition[3])then
		iReturn = 1-iCondition[2]
	end
	return iReturn
end

--单位所攻击的AttackFamily判断:{"IsAttackingFamily",<反转参数>,<iFamily>,}
X_ConditionJudge["IsAttackingFamily"]=function(iPlayer, iShip, iGroup, iFamily)
	local iReturn = iFamily[2]
	if(SobGroup_GetCurrentOrder(iGroup)==COMMAND_Attack)then
		SobGroup_Clear("UnitCharacteristicTempGroup")
		SobGroup_GetCommandTargets("UnitCharacteristicTempGroup", iGroup, COMMAND_Attack)
		if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
			if(SobGroup_AreAnyFromTheseAttackFamilies("UnitCharacteristicTempGroup", iFamily[3])==1)then
				iReturn = 1-iFamily[2]
			end
		end
	end
	return iReturn
end

--单位所攻击的船只类型判断:{"IsAttackingShipType",<反转参数>,<iShipType>,}
X_ConditionJudge["IsAttackingShipType"]=function(iPlayer, iShip, iGroup, iShipType)
	local iReturn = iShipType[2]
	if(SobGroup_GetCurrentOrder(iGroup)==COMMAND_Attack)then
		SobGroup_Clear("UnitCharacteristicTempGroup")
		SobGroup_GetCommandTargets("UnitCharacteristicTempGroup", iGroup, COMMAND_Attack)
		if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
			if(SobGroup_AreAnyOfTheseTypes("UnitCharacteristicTempGroup", iShipType[3])==1)then
				iReturn = 1-iShipType[2]
			end
		end
	end
	return iReturn
end

--单位建造判断:{"IsBuilding",<反转参数>,<iShipType>,}
X_ConditionJudge["IsBuilding"]=function(iPlayer, iShip, iGroup, iShipType)
	local iReturn = iShipType[2]
	if(SobGroup_IsBuilding(iGroup, iShipType[3])==1)then
		iReturn = 1-iShipType[2]
	end
	return iReturn
end

--Race Tag判断:{"RaceTag",<反转参数>,<Expect Tag>,}
X_ConditionJudge["RaceTag"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 1-iCondition[2]
	if(iCondition[3]~=nil)then
		if(PlayerRace_DoseHaveTag(iPlayer,iCondition[3]) == iCondition[2])then
			iReturn = 0
		end
	end
	return iReturn
end

------------------------多值参数---------------------------------
--单位战术判断:{"Tactic",<iTactic>,}-3：非被动，-2：非防御，-1：非主动，1：主动，2：防御，3：被动
X_ConditionJudge["Tactic"]=function(iPlayer, iShip, iGroup, iTactic)
	local iReturn = 1
	if(iTactic[2]>0)then
		if(SobGroup_GetROE(iGroup) ~= (iTactic[2]-1))then
			iReturn = 0
		end
	else
		if(SobGroup_GetROE(iGroup) == (-iTactic[2]-1))then
			iReturn = 0
		end
	end
	return iReturn
end
--单位护盾减少判断:{"ShieldChanged",<iFlag>,}
X_ConditionJudge["ShieldChanged"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(iFlag[2]==-3 and AllUnitsStates[iShip][20] <= 1)then--减少
		iReturn = 0
	elseif(iFlag[2]==-2 and AllUnitsStates[iShip][20] >= 2)then--未增加
		iReturn = 0
	elseif(iFlag[2]==-1 and AllUnitsStates[iShip][20] == 0)then--变化
		iReturn = 0
	elseif(iFlag[2]==1 and AllUnitsStates[iShip][20] ~= 0)then--未变化
		iReturn = 0
	elseif(iFlag[2]==2 and mod(AllUnitsStates[iShip][20],2) == 1)then--未减少
		iReturn = 0
	elseif(iFlag[2]==3 and mod(AllUnitsStates[iShip][20],2) ~= 1)then--增加
		iReturn = 0
	end
	return iReturn
end

--单位装甲减少判断:{"ArmorChanged",<iFlag>,}
X_ConditionJudge["ArmorChanged"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(iFlag[2]==-3 and AllUnitsStates[iShip][21] <= 1)then--减少
		iReturn = 0
	elseif(iFlag[2]==-2 and AllUnitsStates[iShip][21] >= 2)then--未增加
		iReturn = 0
	elseif(iFlag[2]==-1 and AllUnitsStates[iShip][21] == 0)then--变化
		iReturn = 0
	elseif(iFlag[2]==1 and AllUnitsStates[iShip][21] ~= 0)then--未变化
		iReturn = 0
	elseif(iFlag[2]==2 and mod(AllUnitsStates[iShip][21],2) == 1)then--未减少
		iReturn = 0
	elseif(iFlag[2]==3 and mod(AllUnitsStates[iShip][21],2) ~= 1)then--增加
		iReturn = 0
	end
	return iReturn
end

--单位生命减少判断:{"HealthChanged",<iFlag>,}
X_ConditionJudge["HealthChanged"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(iFlag[2]==-3 and AllUnitsStates[iShip][22] <= 1)then--减少
		iReturn = 0
	elseif(iFlag[2]==-2 and AllUnitsStates[iShip][22] >= 2)then--未增加
		iReturn = 0
	elseif(iFlag[2]==-1 and AllUnitsStates[iShip][22] == 0)then--变化
		iReturn = 0
	elseif(iFlag[2]==1 and AllUnitsStates[iShip][22] ~= 0)then--未变化
		iReturn = 0
	elseif(iFlag[2]==2 and mod(AllUnitsStates[iShip][22],2) == 1)then--未减少
		iReturn = 0
	elseif(iFlag[2]==3 and mod(AllUnitsStates[iShip][22],2) ~= 1)then--增加
		iReturn = 0
	end
	return iReturn
end

--单位所属玩家属性判断:{"IsControlledBy",<iLOD>,}
X_ConditionJudge["IsControlledBy"]=function(iPlayer, iShip, iGroup, iLOD)
	local iReturn = 0
	if (iLOD[2]>=0) then
		if ((Player_GetLevelOfDifficulty(iPlayer)+1)==iLOD[2])then
			iReturn = 1
		end
	else
		if ((Player_GetLevelOfDifficulty(iPlayer)+1)~=(-iLOD[2]))then
			iReturn = 1
		end
	end
	return iReturn
end

--单位特质激活判断:{"IsCharacteristicActive",<CharacteristicID>,}
X_ConditionJudge["IsCharacteristicActive"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	local iActive = AllUnitsStates[iShip][SHIPGLOBALSTATEOBLIGATENUMBER -  9 + 10 * abs(iCondition[2]) + 1]
	if(iActive~=nil)then
		if(iCondition[2]>0)and(iActive == 1 or iActive == 2 or iActive == 3)then
			iReturn = 1
		elseif(iCondition[2]<0)and(iActive ~= 1 and iActive ~= 2 and iActive ~= 3)then
			iReturn = 1
		end
	end
	return iReturn
end

--全局状态Key激活判断:{"IsGlobalStateKeyOn",<KeyID>,}
X_ConditionJudge["IsGlobalStateKeyOn"]=function(iPlayer, iShip, iGroup, iCondition)
	local iTable={On=1,Off=0,Nil=0}
	local iReturn = iTable[xGetGlobalStateKey(abs(iCondition[2]))]
	if(iCondition[2]<0)then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位状态Key激活判断:{"IsShipIdioStateKeyOn",<KeyID>,}
X_ConditionJudge["IsShipIdioStateKeyOn"]=function(iPlayer, iShip, iGroup, iCondition)
	local iTable={On=1,Off=0,Nil=0}
	local iReturn = iTable[xGetShipIdioStateKey(iShip,abs(iCondition[2]))]
	if(iCondition[2]<0)then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位生命值判断:{"HealthPercentage",<HealthPercentage>,}
X_ConditionJudge["HealthPercentage"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	if(iCondition[2]>0)then
		if(100*SobGroup_HealthPercentage(iGroup) >= iCondition[2])then
			iReturn = 1
		end
	else
		if(100*SobGroup_HealthPercentage(iGroup) <= -iCondition[2])then
			iReturn = 1
		end
	end
	return iReturn
end

--单位燃料值判断:{"FuelPercentage",<FuelPercentage>,}
X_ConditionJudge["FuelPercentage"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	local iFuelPercent = 100 * AllUnitsStates[iShip][24][1] / AllUnitsStates[iShip][24][2]
	if(iCondition[2]>0)then
		if(iFuelPercent >= iCondition[2])then
			iReturn = 1
		end
	else
		if(iFuelPercent <= -iCondition[2])then
			iReturn = 1
		end
	end
	return iReturn
end

--单位护盾值判断:{"ShieldPercentage",<ShieldPercentage>,}
X_ConditionJudge["ShieldPercentage"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	local iCheckPercent1 = 0
	local iCheckPercent2 = 0
	if(AllUnitsStates[iShip][11][2] > 0 and AllUnitsStates[iShip][14] > 0)then
		iCheckPercent1 = AllUnitsStates[iShip][11][1] / AllUnitsStates[iShip][14]
		iCheckPercent2 = AllUnitsStates[iShip][11][2] / AllUnitsStates[iShip][14]
	end
	if(iCondition[2]>0)then
		if(100*iCheckPercent1/iCheckPercent2 >= iCondition[2])then
			iReturn = 1
		end
	else
		if(100*iCheckPercent1/iCheckPercent2 <= -iCondition[2])then
			iReturn = 1
		end
	end
	return iReturn
end

--单位装甲值判断:{"ArmorPercentage",<ArmorPercentage>,}
X_ConditionJudge["ArmorPercentage"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	local iCheckPercent1 = 0
	local iCheckPercent2 = 0
	if(AllUnitsStates[iShip][13][2] > 0 and AllUnitsStates[iShip][14] > 0)then
		iCheckPercent1 = AllUnitsStates[iShip][13][1] / AllUnitsStates[iShip][14]
		iCheckPercent2 = AllUnitsStates[iShip][13][2] / AllUnitsStates[iShip][14]
	end
	if(iCondition[2]>0)then
		if(100*iCheckPercent1/iCheckPercent2 >= iCondition[2])then
			iReturn = 1
		end
	else
		if(100*iCheckPercent1/iCheckPercent2 <= -iCondition[2])then
			iReturn = 1
		end
	end
	return iReturn
end

--单位编组数量判断:{"SquadronSize",<SquadronSize>,}
X_ConditionJudge["SquadronSize"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	if(iCondition[2]>0)then
		if(SobGroup_Count(iGroup) >= iCondition[2])then
			iReturn = 1
		end
	else
		if(SobGroup_Count(iGroup) <= -iCondition[2])then
			iReturn = 1
		end
	end
	return iReturn
end

--单位等级判断:{"ShipLevel",<ShipLevel>,}
X_ConditionJudge["ShipLevel"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	if(iCondition[2]>0)then
		if(AllUnitsStates[iShip][15][2] >= iCondition[2])then
			iReturn = 1
		end
	else
		if(AllUnitsStates[iShip][15][2] <= -iCondition[2])then
			iReturn = 1
		end
	end
	return iReturn
end

--单位照准信号判断:{"LockingSignal",<SignalID>,}
X_ConditionJudge["LockingSignal"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = IsBeenLockedTarget(iGroup, abs(iCondition[2]))
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位被动信号判断:{"BeingLockedSignal",<SignalID>,}
X_ConditionJudge["BeingLockedSignal"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = IsLockingTarget(iGroup, abs(iCondition[2]))
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位保护信号判断:{"GuardingSignal",<SignalID>,}
X_ConditionJudge["GuardingSignal"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = IsBeenGuardedTarget(iPlayer, iGroup, abs(iCondition[2]))
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位受保护信号判断:{"BeenGuardedSignal",<SignalID>,}
X_ConditionJudge["BeenGuardedSignal"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = IsGuardingTarget(iPlayer, iGroup, abs(iCondition[2]))
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位范围信号判断:{"RangeSignal",<SignalID>,}
X_ConditionJudge["RangeSignal"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = IsUnderAreaSemaphore(iPlayer, iGroup, abs(iCondition[2]))
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位停泊信号判断:{"DockingSignal",<SignalID>,}
X_ConditionJudge["DockingSignal"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = IsDockingShip(iPlayer, iShip, abs(iCondition[2]))
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位母舰信号判断:{"MothershipSignal",<SignalID>,}
X_ConditionJudge["MothershipSignal"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = IsDockedSemaphoreEnaugh(iGroup, iShip, abs(iCondition[2]))
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位实际速度判断:{"ActualSpeed",<ExpectSpeed>,}
X_ConditionJudge["ActualSpeed"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 1
	local iShipActualSpeed = SobGroup_GetActualSpeed(iGroup)
	iShipActualSpeed = sqrt(iShipActualSpeed)
	if(iCondition[2] > 0)then
		if(iShipActualSpeed < iCondition[2])then
			iReturn = 0
		end
	else
		if(iShipActualSpeed > -iCondition[2])then
			iReturn = 0
		end
	end
	return iReturn
end

--单位辐射云判断:{"IsInsideNebula",<NebulaID>,}
X_ConditionJudge["IsInsideNebula"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	if(iCondition[2] > 0)then
		if(SobGroup_AreAnySquadronsInsideNebula(iGroup, NebulaCloudList[iCondition[2]])==0)then
			iReturn = 1
		end
	else
		if(SobGroup_AreAnySquadronsInsideNebula(iGroup, NebulaCloudList[-iCondition[2]])~=0)then
			iReturn = 1
		end
	end
	return iReturn
end

--单位尘云判断:{"IsInsideDustCloud",<DustCloudID>,}
X_ConditionJudge["IsInsideDustCloud"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = 0
	if(iCondition[2] > 0)then
		if(SobGroup_AreAnySquadronsInsideDustCloud(iGroup, NebulaCloudList[iCondition[2]])==0)then
			iReturn = 1
		end
	else
		if(SobGroup_AreAnySquadronsInsideDustCloud(iGroup, NebulaCloudList[-iCondition[2]])~=0)then
			iReturn = 1
		end
	end
	return iReturn
end

--单位使用能力判断:{"IsDoingAbility",<AbilityID>,}
X_ConditionJudge["IsDoingAbility"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = SobGroup_IsDoingAbility(iGroup, AB_Table[iCondition[2]])
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

--单位能力激活判断:{"CanDoAbility",<AbilityID>,}
X_ConditionJudge["IsDoingAbility"]=function(iPlayer, iShip, iGroup, iCondition)
	local iReturn = SobGroup_CanDoAbility(iGroup, AB_Table[iCondition[2]])
	if (iCondition[2]<0) then
		iReturn = 1-iReturn
	end
	return iReturn
end

----------------------------布尔参数-----------------------------
--单位开火判断:{"IsFiring",<BooleanValue>,}
X_ConditionJudge["IsFiring"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(IsAttacking(iPlayer, iGroup) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位被攻击判断:{"IsUnderAttack",<BooleanValue>,}
X_ConditionJudge["IsUnderAttack"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_UnderAttack(iGroup) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位防御场判断:{"DefenseFieldOpen",<BooleanValue>,}
X_ConditionJudge["DefenseFieldOpen"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_DefenseField) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位隐形场判断:{"CloakGeneratorOpen",<BooleanValue>,}
X_ConditionJudge["CloakGeneratorOpen"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Cloak) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位移动判断:{"IsMoving",<BooleanValue>,}
X_ConditionJudge["IsMoving"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Move) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end
--单位攻击判断:{"IsAttacking",<BooleanValue>,}
X_ConditionJudge["IsAttacking"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Attack) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位保护判断:{"IsGuarding",<BooleanValue>,}
X_ConditionJudge["IsGuarding"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Guard) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位维修判断:{"IsRepairing",<BooleanValue>,}
X_ConditionJudge["IsRepairing"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Repair) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end
--单位正在维修判断:{"IsRepairingAndLatched",<BooleanValue>,}
X_ConditionJudge["IsRepairingAndLatched"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 0
	for ipi=1,Universe_PlayerCount() do
		SobGroup_Clear("UnitCharacteristicTempGroup")
		SobGroup_GetSobGroupRepairingGroup("Player_Ships"..(ipi-1), "UnitCharacteristicTempGroup")
		if(SobGroup_GroupInGroup("UnitCharacteristicTempGroup",iGroup) == iFlag[2])then
			iReturn = 1
			break
		end
	end
	return iReturn
end
--单位正在被维修判断:{"IsBeingRepairedAndLatched",<BooleanValue>,}
X_ConditionJudge["IsBeingRepairedAndLatched"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	SobGroup_Clear("UnitCharacteristicTempGroup")
	SobGroup_GetSobGroupRepairingGroup(iGroup, "UnitCharacteristicTempGroup")
	if(SobGroup_Empty("UnitCharacteristicTempGroup") == iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位采矿判断:{"IsHarvesting",<BooleanValue>,}
X_ConditionJudge["IsHarvesting"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Harvest) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位布雷判断:{"IsLayingMines",<BooleanValue>,}
X_ConditionJudge["IsLayingMines"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Mine) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位捕捉判断:{"IsCapturing",<BooleanValue>,}
X_ConditionJudge["IsCapturing"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Capture) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end
--单位正在捕捉判断:{"IsCapturingAndLatched",<BooleanValue>,}
X_ConditionJudge["IsCapturingAndLatched"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 0
	for ipi=1,Universe_PlayerCount() do
		SobGroup_Clear("UnitCharacteristicTempGroup")
		SobGroup_GetSobGroupCapturingGroup("Player_Ships"..(ipi-1), "UnitCharacteristicTempGroup")
		if(SobGroup_GroupInGroup("UnitCharacteristicTempGroup",iGroup) == iFlag[2])then
			iReturn = 1
			break
		end
	end
	return iReturn
end

--单位被捕捉判断:{"IsBeingCaptured",<BooleanValue>,}
X_ConditionJudge["IsBeingCaptured"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	SobGroup_Clear("UnitCharacteristicTempGroup")
	SobGroup_GetSobGroupBeingCapturedGroup(iGroup, "UnitCharacteristicTempGroup")
	if(SobGroup_Empty("UnitCharacteristicTempGroup") == iFlag[2])then
		iReturn = 0
	end
	return iReturn
end
--单位正在被捕捉判断:{"IsBeingCapturedAndLatched",<BooleanValue>,}
X_ConditionJudge["IsBeingCapturedAndLatched"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	SobGroup_Clear("UnitCharacteristicTempGroup")
	SobGroup_GetSobGroupCapturingGroup(iGroup, "UnitCharacteristicTempGroup")
	if(SobGroup_Empty("UnitCharacteristicTempGroup") == iFlag[2])then
		iReturn = 0
	end
	return iReturn
end
--单位停泊判断:{"IsDocking",<BooleanValue>,}
X_ConditionJudge["IsDocking"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Dock) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位接受停泊判断:{"IsAcceptDocking",<BooleanValue>,}
X_ConditionJudge["IsAcceptDocking"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_AcceptDocking) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位跳跃判断:{"IsJumping",<BooleanValue>,}
X_ConditionJudge["IsJumping"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Hyperspace) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位退役判断:{"IsRetiring",<BooleanValue>,}
X_ConditionJudge["IsRetiring"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDoingAbility(iGroup, AB_Retire) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位隐形判断:{"IsCloaked",<BooleanValue>,}
X_ConditionJudge["IsCloaked"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsCloaked(iGroup) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位常规空间判断:{"IsInRealSpace",<BooleanValue>,}
X_ConditionJudge["IsInRealSpace"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_AreAllInRealSpace(iGroup) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位超空间判断:{"IsInHyperspace",<BooleanValue>,}
X_ConditionJudge["IsInHyperspace"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_AreAllInHyperspace(iGroup) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end

--单位停泊状态判断:{"IsDocked",<BooleanValue>,}
X_ConditionJudge["IsDocked"]=function(iPlayer, iShip, iGroup, iFlag)
	local iReturn = 1
	if(SobGroup_IsDocked(iGroup) ~= iFlag[2])then
		iReturn = 0
	end
	return iReturn
end