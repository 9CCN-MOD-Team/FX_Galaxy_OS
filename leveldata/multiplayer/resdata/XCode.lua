--version 2.1.0.2017.03.26
dofilepath("data:leveldata/multiplayer/resdata/pingstring.txt")
dofilepath("data:leveldata/multiplayer/resdata/XFunctions.lua")
dofilepath("data:leveldata/multiplayer/resdata/XCustomFunctions.lua")
dofilepath("data:leveldata/multiplayer/resdata/XCustomCodeFunction.lua")
AllUnitsStates = {}
x_RunCounter=1
x_RunDivider=20--特质运算平摊量（分20份执行）
GlobalStateKey = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,}
CheckPressureKey = 500
RuningPressureKey = 220
PingShowPressureKey = 500
SHIPGLOBALSTATEOBLIGATENUMBER = 30
AB_Table = 
{
	AB_Move,
	AB_Attack,
	AB_Guard,
	AB_Repair,
	AB_Cloak,
	AB_Harvest,
	AB_Mine,
	AB_Capture,
	AB_Dock,
	AB_AcceptDocking,
	AB_Builder,
	AB_Stop,
	AB_Hyperspace,
	AB_Parade,
	AB_FormHyperspaceGate,
	AB_HyperspaceViaGate,
	AB_SensorPing,
	AB_SpecialAttack,
	AB_Retire,
	AB_DefenseField,
	AB_DefenseFieldShield,
	AB_HyperspaceInhibitor,
	AB_Salvage,
	AB_Scuttle,
	AB_UseSpecialWeaponsInNormalAttack,
	AB_Steering,
	AB_Targeting,
	AB_Sensors,
	AB_Lights,
	AB_SalCap,
	AB_Custom,
	AB_Kamikaze,
}
--监听GameEvent更新单位列表
function X_UpdateUnitFromGameEvent()
	local iPort=1
	while(GameEvent_IsListening(X_InitPort+2*iPort-1)~="")do
		local CustomGroup=GameEvent_IsListening(X_InitPort+2*iPort-1)
		local shipID=tonumber(GameEvent_IsListening(X_InitPort+2*iPort))
		--if shipID>0 then--录入新单位
		local playerIndex=SobGroup_OwnedBy(CustomGroup..shipID)
		if (AllUnitsStates[shipID]==nil) then
			InitlizeUnitStates(CustomGroup, playerIndex, shipID)
		end
		--end
		GameEvent_UnListen(X_InitPort+2*iPort)
		GameEvent_UnListen(X_InitPort+2*iPort-1)
		iPort=iPort+1
	end
end
--监听GameEvent更新GlobalKey
function X_UpdateGlobalKeys()
	local iPort=1
	while(GameEvent_IsListening(X_GlobalKeyPort+2*iPort-1)~="")do
		local iKeyNumber=tonumber(GameEvent_IsListening(X_GlobalKeyPort+2*iPort-1))
		local iKey=GameEvent_IsListening(X_GlobalKeyPort+2*iPort)
		xSetGlobalStateKey(iKeyNumber,iKey)
		GameEvent_UnListen(X_GlobalKeyPort+2*iPort)
		GameEvent_UnListen(X_GlobalKeyPort+2*iPort-1)
		iPort=iPort+1
	end
end
--监听GameEvent更新ShipKey
function X_UpdateShipKeys()
	local iPort=1
	while(GameEvent_IsListening(X_ShipKeyPort+2*iPort-1)~="")do
		local iKeyNumber=tonumber(GameEvent_IsListening(X_ShipKeyPort+2*iPort-1))
		local iShip=tonumber(GameEvent_IsListening(X_ShipKeyPort+2*iPort))
		if(iKeyNumber>0)then--设置ShipKey
			if(iShip>0)then--On
				xSetShipIdioStateKey(iShip,iKeyNumber,"On")
			else--Off
				iShip=abs(iShip)
				xSetShipIdioStateKey(iShip,iKeyNumber,"Off")
			end
		else--切换ShipKey的状态
			iKeyNumber=abs(iKeyNumber)
			if(xGetShipIdioStateKey(iShip,iKeyNumber)=="Off")then
				xSetShipIdioStateKey(iShip,iKeyNumber,"On")
			else
				xSetShipIdioStateKey(iShip,iKeyNumber,"Off")
			end
		end
		GameEvent_UnListen(X_ShipKeyPort+2*iPort)
		GameEvent_UnListen(X_ShipKeyPort+2*iPort-1)
		iPort=iPort+1
	end
end
--所有已录入单位的特质执行
function X_Run()
	X_UpdateGlobalKeys()
	X_UpdateShipKeys()
	if(x_RunCounter>=x_RunDivider)then
		x_RunCounter=0
	else
		for shipID,shipData in AllUnitsStates do
			if (shipData[1]~=nil)and(mod(shipID,x_RunDivider)==x_RunCounter) then
				local CustomGroup=shipData[25]..shipID
				local playerIndex=SobGroup_OwnedBy(shipData[25]..shipID)
				PingShowStates(CustomGroup, playerIndex, shipID)
				UnitCharacteristicCheck(CustomGroup, playerIndex, shipID)
				UnitCharacteristicRuning(CustomGroup, playerIndex, shipID)
			end
		end
		x_RunCounter=x_RunCounter+1
	end
end

function LevelPingLine(iLevel)
	local sLevel = ""
	if(SPingStringVersion == "CS")then
		local iAStar = 0
		local iBStar = 0
		iBStar = mod(iLevel, 2)
		iAStar = (iLevel - iBStar) / 2
		while(iAStar > 0)do
			sLevel = sLevel..SLevelString1
			iAStar = iAStar - 1
		end
		while(iBStar > 0)do
			sLevel = sLevel..SLevelString2
			iBStar = iBStar - 1
		end
	else
		sLevel = SLevelTitle..iLevel
	end
	return sLevel
end

function PingShowStates(iGroup, iPlayerID, iShip)
	--local iPlayerID = 0
	--while(iPlayerID < Universe_PlayerCount())do
				if(iPlayerID == Universe_CurrentPlayer())then
					local iIsCurrentShipSelected = SobGroup_Selected(iGroup)
					if(AllUnitsStates[iShip][24][2] > 0)then
						local iFuelPercent = AllUnitsStates[iShip][24][1]/AllUnitsStates[iShip][24][2]
						if(iFuelPercent < 0)then
							iFuelPercent = 0
						end
						local sFuelPercent = ceil(iFuelPercent * 100)
						if(OverBarFuelDisplayOnOff ~= 0)then
							if(Units[AllUnitsStates[iShip][1]].LifeBarType ~= 0)then
								if(iIsCurrentShipSelected ~= 0)then
									if(sFuelPercent ~= AllUnitsStates[iShip][23])then
										AllUnitsStates[iShip][23] = sFuelPercent
										if(AllUnitsStates[iShip][9] ~= 0)then
											local sFuelPercentShow = ""
											if(SPingStringVersion == "CS")then
												sFuelPercentShow = SFuelOverString.." "..sFuelPercent.."%"
											else
												sFuelPercentShow = SSFuelOverString.." "..sFuelPercent.."%"
											end
											Ping_AddDescription(AllUnitsStates[iShip][9], 2, sFuelPercentShow)
										end
									end
								else
									if(AllUnitsStates[iShip][23]~=-1)then
										AllUnitsStates[iShip][23] = -1
										if(AllUnitsStates[iShip][9] ~= 0)then
											Ping_AddDescription(AllUnitsStates[iShip][9], 2, "")
										end
									end
								end
							end
						end
					else
						if(AllUnitsStates[iShip][23] ~= -1)then
							AllUnitsStates[iShip][23] = -1
							if(AllUnitsStates[iShip][9] ~= 0)then
								Ping_AddDescription(AllUnitsStates[iShip][9], 2, "")
							end
						end
					end
						
					if(OverBarLevelDisplayOnOff ~= 0)then
						if(Units[AllUnitsStates[iShip][1]].LifeBarType ~= 0)then
							if(iIsCurrentShipSelected ~= 0)then
								if(AllUnitsStates[iShip][15][1] ~= 0 and AllUnitsStates[iShip][15][2] ~= AllUnitsStates[iShip][15][3])then
									AllUnitsStates[iShip][15][3] = AllUnitsStates[iShip][15][2]
									local sLevel = LevelPingLine(AllUnitsStates[iShip][15][2])
									--"★★★★★☆☆"
									Ping_AddDescription(AllUnitsStates[iShip][9], 3, sLevel)
								end
							else
								if(AllUnitsStates[iShip][15][1] ~= 0 and AllUnitsStates[iShip][15][3] ~= 0)then
									AllUnitsStates[iShip][15][3] = 0
									Ping_AddDescription(AllUnitsStates[iShip][9], 3, "")
								end
							end
						end
					end
					
					if(AllUnitsStates[iShip][11][2] > 0 and AllUnitsStates[iShip][14] > 0)then
						local iDividend = AllUnitsStates[iShip][11][1] / AllUnitsStates[iShip][14]
						local iDivisor = AllUnitsStates[iShip][11][2] / AllUnitsStates[iShip][14]
						local iArmorPercent = 0
						if(iDivisor > 0)then
							iArmorPercent = iDividend / iDivisor
						end
						if(iArmorPercent < 0)then
							iArmorPercent = 0
						end
						local sArmorPercent = ceil(iArmorPercent * 100)
						--local iPercentS,sCroci,sRed = ArmorPingLine(iArmorPercent, Units[AllUnitsStates[iShip][1]].LifeBarType)
											
						if(OverBarArmorDisplayOnOff ~= 0)then
							if(Units[AllUnitsStates[iShip][1]].LifeBarType ~= 0)then
								if(iIsCurrentShipSelected ~= 0)then
									if(sArmorPercent ~= AllUnitsStates[iShip][10][3])then
										AllUnitsStates[iShip][10][3] = sArmorPercent
										if(AllUnitsStates[iShip][9] ~= 0)then
											local sArmorPercentShow = ""
											if(SPingStringVersion == "CS")then
												sArmorPercentShow = SArmorOverString.." "..sArmorPercent.."%"
											else
												sArmorPercentShow = SSArmorOverString.." "..sArmorPercent.."%"
											end
											Ping_AddDescription(AllUnitsStates[iShip][9], 1, sArmorPercentShow)
										end
									end
								else
									if(AllUnitsStates[iShip][10][3]~=-1)then
										AllUnitsStates[iShip][10][3] = -1
										if(AllUnitsStates[iShip][9] ~= 0)then
											Ping_AddDescription(AllUnitsStates[iShip][9], 1, "")
										end
									end
								end
							end
						end
--装甲条状显示代码
					else
						if(AllUnitsStates[iShip][10][3] ~= -1)then
							AllUnitsStates[iShip][10][3] = -1
							if(AllUnitsStates[iShip][9] ~= 0)then
								Ping_AddDescription(AllUnitsStates[iShip][9], 1, "")
							end
						end
						
						--if(AllUnitsStates[iShip][10][2] ~= 0)then
						--	AllUnitsStates[iShip][10][2] = 0
						--	if(AllUnitsStates[iShip][10][1] ~= 0)then
						--		Ping_AddDescription(AllUnitsStates[iShip][10][1], 0, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][10][1], 1, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][10][1], 2, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][10][1], 3, "")
						--	end
						--end
					end
					
					if(AllUnitsStates[iShip][13][2] > 0 and AllUnitsStates[iShip][14] > 0)then
						local iDividend = AllUnitsStates[iShip][13][1] / AllUnitsStates[iShip][14]
						local iDivisor = AllUnitsStates[iShip][13][2] / AllUnitsStates[iShip][14]
						local iShieldPercent = 0
						if(iDivisor > 0)then
							iShieldPercent = iDividend / iDivisor
						end
						if(iShieldPercent < 0)then
							iShieldPercent = 0
						end
						local sShieldPercent = ceil(iShieldPercent * 100)
						--local iPercentS,sBlue,sRed = ShieldPingLine(iShieldPercent, Units[AllUnitsStates[iShip][1]].LifeBarType)
												
						if(OverBarShieldDisplayOnOff ~= 0)then
							if(Units[AllUnitsStates[iShip][1]].LifeBarType ~= 0)then
								if(iIsCurrentShipSelected ~= 0)then
									if(sShieldPercent ~= AllUnitsStates[iShip][12][4])then
										AllUnitsStates[iShip][12][4] = sShieldPercent
										if(AllUnitsStates[iShip][9] ~= 0)then
											local sShieldPercentShow = ""
											if(SPingStringVersion == "CS")then
												sShieldPercentShow = SShieldOverString.." "..sShieldPercent.."%"
											else
												sShieldPercentShow = SSShieldOverString.." "..sShieldPercent.."%"
											end
											Ping_AddDescription(AllUnitsStates[iShip][9], 0, sShieldPercentShow)
										end
									end
								else
									if(AllUnitsStates[iShip][12][4]~=-1)then
										AllUnitsStates[iShip][12][4] = -1
										if(AllUnitsStates[iShip][9] ~= 0)then
											Ping_AddDescription(AllUnitsStates[iShip][9], 0, "")
										end
									end
								end
							end
						end
--护盾条状显示代码
					else
						if(AllUnitsStates[iShip][12][4] ~= -1)then
							AllUnitsStates[iShip][12][4] = -1
							if(AllUnitsStates[iShip][9] ~= 0)then
								Ping_AddDescription(AllUnitsStates[iShip][9], 0, "")
							end
						end
						
						--if(AllUnitsStates[iShip][12][3] ~= 0)then
						--	AllUnitsStates[iShip][12][3] = 0
						--	if(AllUnitsStates[iShip][12][1] ~= 0)then
						--		Ping_AddDescription(AllUnitsStates[iShip][12][1], 0, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][12][1], 1, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][12][1], 2, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][12][1], 3, "")
						--	end
						--	if(AllUnitsStates[iShip][12][2] ~= 0)then
						--		Ping_AddDescription(AllUnitsStates[iShip][12][2], 0, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][12][2], 1, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][12][2], 2, "")
						--		Ping_AddDescription(AllUnitsStates[iShip][12][2], 3, "")
						--	end
						--end
					end
				end
end


function GetUnitsIndex(sShipType)
	local iShipType = 1
	while (Units[iShipType]~=nil) do
		if (Units[iShipType].Name ~= sShipType) then
			iShipType = iShipType + 1
		else
			break
		end
	end
	return iShipType
end

function CanDoCharacteristic(iPlayer, iUnit, iGroup, iCharacteristic, iObject)--检测科技、子系统条件是否满足，参数为：玩家编号，单位编号，单位组名，特质编号，研究/升级
	local iReturn = 2
	local iPremiseGroup = 1
	while((iReturn == 2 or iReturn == 0) and Units[iUnit].Ability.Characteristic[iCharacteristic][4][iPremiseGroup] ~= nil)do
		iReturn = 1
		local iPremise = 1
		local iNegation = 0
		while(iReturn == 1 and Units[iUnit].Ability.Characteristic[iCharacteristic][4][iPremiseGroup][iPremise] ~= nil)do
			if(Units[iUnit].Ability.Characteristic[iCharacteristic][4][iPremiseGroup][iPremise]  == "CONTRARY")then
				iNegation = 1
			else
				if(iNegation == 0)then
					if(iObject == 0)then
						if(Player_HasResearch(iPlayer, Units[iUnit].Ability.Characteristic[iCharacteristic][4][iPremiseGroup][iPremise]) == 0)then
							iReturn = 0
						end
					else
						if(SobGroup_HasUpgrade(iGroup, Units[iUnit].Ability.Characteristic[iCharacteristic][4][iPremiseGroup][iPremise]) == 0)then
							iReturn = 0
						end
					end
				else
					if(iObject == 0)then
						if(Player_HasResearch(iPlayer, Units[iUnit].Ability.Characteristic[iCharacteristic][4][iPremiseGroup][iPremise]) == 1)then
							iReturn = 0
						end
					else
						if(SobGroup_HasUpgrade(iGroup, Units[iUnit].Ability.Characteristic[iCharacteristic][4][iPremiseGroup][iPremise]) == 1)then
							iReturn = 0
						end
					end
				end
			end
			iPremise = iPremise + 1
		end
		iPremiseGroup = iPremiseGroup + 1
	end
	
	if(iReturn ~= 0)then
		iReturn = 2
		iPremiseGroup = 1
		while((iReturn == 2 or iReturn == 0) and Units[iUnit].Ability.Characteristic[iCharacteristic][5][iPremiseGroup] ~= nil)do
			iReturn = 1
			local iPremise = 1
			local iNegation = 0
			while(iReturn == 1 and Units[iUnit].Ability.Characteristic[iCharacteristic][5][iPremiseGroup][iPremise] ~= nil)do
				if(Units[iUnit].Ability.Characteristic[iCharacteristic][5][iPremiseGroup][iPremise] == "CONTRARY")then
					iNegation = 1
				else
					if(iNegation == 0)then
						if(SobGroup_GetHardPointHealth(iGroup, Units[iUnit].Ability.Characteristic[iCharacteristic][5][iPremiseGroup][iPremise]) == 0)then
							iReturn = 0
						end
					else
						if(SobGroup_GetHardPointHealth(iGroup, Units[iUnit].Ability.Characteristic[iCharacteristic][5][iPremiseGroup][iPremise]) ~= 0)then
							iReturn = 0
						end
					end
				end
				iPremise = iPremise + 1
			end
			iPremiseGroup = iPremiseGroup + 1
		end
	end
	
	if(iReturn ~= 0)then
		iReturn = 1
	end
	
	return iReturn
end

function SpawnMyNewShipInSobGroup(iPlayerIndex, sShipType, sSobGroupToAddToName, sVolumeName)
	SobGroup_SpawnNewShipInSobGroup(iPlayerIndex, sShipType, sShipType, sSobGroupToAddToName, sVolumeName)
	return GetUnitsIndex(sShipType)
end

function xGetDroneStateTable(iUnit)
	local iDroneTable = {}
	for iC_ID, iAbility in Units[iUnit].Ability.Characteristic do
		if (iAbility[1]=="DroneShip") then
			iDroneTable[iC_ID] = {}
			for i=1,iAbility[11] do
				iDroneTable[iC_ID][i] = 0
			end
		end
	end
	return iDroneTable
end

function xGetStateKeyTable(iUnit)
	local iKeyTable = {}
	for iC_ID, iAbility in Units[iUnit].Ability.Characteristic do
		for jC_ID, iCondition in iAbility[3] do
			for jCondition, kCondition in iCondition do
				if(kCondition[1]=="IsShipIdioStateKeyOn")then
					iKeyTable[abs(kCondition[2])] = 0
				end
			end
		end
	end
	return iKeyTable
end

function InitlizeUnitStates(iGroup, iPlayer, iId)--AllUnitsStates初始化，参数为：单位组名，单位所属玩家编号，单位ID
	AllUnitsStates[iId] = {}
	local iUnit=GetUnitsIndex(iGroup)
	if (Units[iUnit]==nil) then
		_ALERT("X System Error: "..iGroup.." has called X System functions but has no data in reslist.lua")
	else
		AllUnitsStates[iId][1] = iUnit											--单位编号
		AllUnitsStates[iId][2] = 0													--单位特质满足的条件组编号
		AllUnitsStates[iId][3] = Universe_GameTime()				--检索时间
		AllUnitsStates[iId][4] = 0													--死亡时间
		AllUnitsStates[iId][5] = 1													--生命
		AllUnitsStates[iId][6] = 0													--蒸发
		AllUnitsStates[iId][7] = 1													--建造速度
		AllUnitsStates[iId][8] = -1													--实际速度
		AllUnitsStates[iId][9] = 0													--over ping
		AllUnitsStates[iId][10] = {0,0,0}										--装甲Ping
		AllUnitsStates[iId][11] = {0,0,}										--装甲
		AllUnitsStates[iId][12] = {0,0,0,0}									--护盾Ping
		AllUnitsStates[iId][13] = {0,0,}										--护盾
		AllUnitsStates[iId][14] = 0													--结构常量
		AllUnitsStates[iId][15] = {0,0,-1,0}								--等级经验值
		AllUnitsStates[iId][16] = 1													--脱机
		AllUnitsStates[iId][17] = xGetDroneStateTable(iUnit)--无人机状态
		AllUnitsStates[iId][18] = 0													--技能计时
		AllUnitsStates[iId][19] = xGetStateKeyTable(iUnit)	--Keys
		AllUnitsStates[iId][20] = 0													--护盾增减状态记录
		AllUnitsStates[iId][21] = 0													--装甲增减状态记录
		AllUnitsStates[iId][22] = 0													--结构增减状态记录
		AllUnitsStates[iId][23] = 0													--燃料Ping
		AllUnitsStates[iId][24] = {0,0}											--燃料
		AllUnitsStates[iId][25] = iGroup										--单位类型
		AllUnitsStates[iId][26] = 0
		AllUnitsStates[iId][27] = 0
		AllUnitsStates[iId][28] = 0
		AllUnitsStates[iId][29] = 0
		AllUnitsStates[iId][30] = 0
		
		local iValue = SHIPGLOBALSTATEOBLIGATENUMBER + 1
		local iMax = 10 * ScheduledShipAbilityMaxNumber + SHIPGLOBALSTATEOBLIGATENUMBER
		while(iValue <= iMax)do
			tinsert(AllUnitsStates[iId], iValue, 0)
			iValue = iValue + 1
		end
		
		iValue = SHIPGLOBALSTATEOBLIGATENUMBER + 1
		while(iValue <= iMax)do
			if(mod(iValue, 10) == mod((SHIPGLOBALSTATEOBLIGATENUMBER - 8), 10))then
				AllUnitsStates[iId][iValue] = 4
			else
				AllUnitsStates[iId][iValue] = 0
			end
			iValue = iValue + 1
		end
		if(BarDisplayOnOff ~= 0)then
			if(iPlayer == Universe_CurrentPlayer())then
				if(Units[AllUnitsStates[iId][1]].LifeBarType == 2)then
					--AllUnitsStates[iId][10][1] = Ping_AddSobGroup("", "shipmark_0", iGroup..iId)
					--AllUnitsStates[iId][12][1] = Ping_AddSobGroup("", "shipmark_1", iGroup..iId)
					--AllUnitsStates[iId][12][2] = Ping_AddSobGroup("", "shipmark_2", iGroup..iId)
					AllUnitsStates[iId][9] = Ping_AddSobGroup("", "shipmark_1_over", iGroup..iId)
				elseif(Units[AllUnitsStates[iId][1]].LifeBarType == 1)then
					--AllUnitsStates[iId][10][1] = Ping_AddSobGroup("", "shipmark_0_small", iGroup..iId)
					--AllUnitsStates[iId][12][1] = Ping_AddSobGroup("", "shipmark_1_small", iGroup..iId)
					AllUnitsStates[iId][9] = Ping_AddSobGroup("", "shipmark_1_oversmall", iGroup..iId)
				end
			end
		end
	end
end

function IsAttacking(iPlayer, iGroup)
	local iOtherPlayer = 0
	local iPlayerCount = Universe_PlayerCount()
	local bIsAttacking = 0
	while(bIsAttacking == 0 and iOtherPlayer < iPlayerCount)do
		if(Player_IsAlive(iOtherPlayer) == 1)then
			if(iOtherPlayer ~= iPlayer and AreAllied(iOtherPlayer, iPlayer) == 0)then
				if(SobGroup_UnderAttack("Player_Ships"..iOtherPlayer) == 1)then
					SobGroup_Clear("UnitCharacteristicTempGroup")
					SobGroup_GetAttackers("Player_Ships"..iOtherPlayer, "UnitCharacteristicTempGroup")
					if(SobGroup_GroupInGroup("UnitCharacteristicTempGroup", iGroup) == 1)then
						bIsAttacking = 1
					end
				end
			end
		end
		iOtherPlayer = iOtherPlayer + 1
	end
	return bIsAttacking
end

function X_GetCommandGroup2(iGroupToFill, iPlayer, iGroup, iPlayerFlag, iRadius, iShipType)
		SobGroup_Clear("X_CommandTempGroup")
		SobGroup_Clear("X_CommandTempGroup2")
		SobGroup_Clear(iGroupToFill)
		for jPlayer=1,Universe_PlayerCount() do
			if(iPlayer==(jPlayer-1))then
				if(iPlayerFlag[1]==1)then
					SobGroup_SobGroupAdd("X_CommandTempGroup","Player_Ships"..(jPlayer-1))
				end
			elseif(AreAllied(iPlayer, (jPlayer-1))==1)then
				if(iPlayerFlag[2]==1)then
					SobGroup_SobGroupAdd("X_CommandTempGroup","Player_Ships"..(jPlayer-1))
				end
			else
				if(iPlayerFlag[3]==1)then
					SobGroup_SobGroupAdd("X_CommandTempGroup","Player_Ships"..(jPlayer-1))
				end
			end
		end
		if(iRadius>0)then
			SobGroup_FillProximitySobGroup("X_CommandTempGroup2", "X_CommandTempGroup", iGroup, iRadius)
		end
		if(iShipType[1]~=nil)then
			SobGroup_Clear("X_CommandTempGroup")
			SobGroup_SobGroupAdd("X_CommandTempGroup","X_CommandTempGroup2")
			for iIndex,iType in iShipType do
				SobGroup_RemoveType("X_CommandTempGroup2",iType)
			end
			SobGroup_FillSubstract(iGroupToFill, "X_CommandTempGroup", "X_CommandTempGroup2")
		else
			SobGroup_SobGroupAdd(iGroupToFill,"X_CommandTempGroup2")
		end
		SobGroup_Clear("X_CommandTempGroup")
		SobGroup_Clear("X_CommandTempGroup2")
end

function X_GetCommandGroup(iPlayer,iGroup, iSemaphore, iPlayerFlag, iRadius, iShipType, iReverse)
	local iCommandGroup = iGroup
	local iTargetGroup = ""
	local iFlag=0
	if(iSemaphore==0)then
		X_GetCommandGroup2("UnitCharacteristicTempGroup2", iPlayer, iGroup, iPlayerFlag, iRadius, iShipType)
	elseif(iSemaphore>0)then
		X_GetCommandGroup2("UnitCharacteristicTempGroup2", iPlayer, iGroup, iPlayerFlag, iRadius, iShipType)
		if(SobGroup_Empty("SG_CommandSemaphore")==0)then
			SobGroup_FillCompare("UnitCharacteristicTempGroup", "SG_CommandSemaphore", "UnitCharacteristicTempGroup2")
			local iUnit = 1
			while(Units[iUnit]~=nil)do
				if(SobGroup_AreAnyOfTheseTypes("SG_CommandSemaphore", Units[iUnit].Name)==1)then
					for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
						if(jAbility[1]=="CommandSemaphore")then
							if(jAbility[10]==iSemaphore)then
								SobGroup_Clear("UnitControlTempGroup")
								SobGroup_Clear("UnitControlTempGroup2")
								SobGroup_FillCompare("UnitControlTempGroup", "UnitCharacteristicTempGroup", "SG_Ability_"..iAbility)
								SobGroup_FillShipsByType("UnitControlTempGroup2", "UnitControlTempGroup", Units[iUnit].Name)
								SobGroup_SobGroupAdd( "UnitCharacteristicTempGroup2", "UnitControlTempGroup2")
								break
							end
						end
					end
				end
				iUnit = iUnit + 1
			end
		end
	else
		X_GetCommandGroup2("UnitCharacteristicTempGroup2", iPlayer, iGroup, iPlayerFlag, iRadius, iShipType)
		if(SobGroup_Empty("SG_CommandSemaphore")==0)then
			local iUnit = 1
			while(Units[iUnit]~=nil)do
				if(SobGroup_AreAnyOfTheseTypes("SG_CommandSemaphore", Units[iUnit].Name)==1)then
					for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
						if(jAbility[1]=="CommandSemaphore")then
							if(jAbility[10]==(-iSemaphore))then
								SobGroup_Clear("UnitControlTempGroup")
								SobGroup_Clear("UnitControlTempGroup2")
								SobGroup_FillCompare("UnitControlTempGroup", "UnitCharacteristicTempGroup2", "SG_Ability_"..iAbility)
								SobGroup_FillShipsByType("UnitControlTempGroup2", "UnitControlTempGroup", Units[iUnit].Name)
								SobGroup_SobGroupAdd( "UnitCharacteristicTempGroup", "UnitControlTempGroup2")
								break
							end
						end
					end
				end
				iUnit = iUnit + 1
			end
			SobGroup_Clear("UnitControlTempGroup")
			SobGroup_SobGroupAdd( "UnitControlTempGroup", "UnitCharacteristicTempGroup2")
			SobGroup_Clear("UnitCharacteristicTempGroup2")
			SobGroup_FillSubstract("UnitCharacteristicTempGroup2", "UnitControlTempGroup", "UnitCharacteristicTempGroup")
		end
	end
	if(SobGroup_Empty("UnitCharacteristicTempGroup2")==0)then
		iTargetGroup = "UnitCharacteristicTempGroup2"
		iFlag = 1
		if(iReverse==1)then
			iCommandGroup,iTargetGroup=iTargetGroup,iCommandGroup
		end
	end
	return iFlag,iCommandGroup,iTargetGroup
end

function IsLockingTarget(iGroup, iSemaphore)--被动信号判断函式（船只组，信号ID）
	local iLocking = 0
	if(SobGroup_Empty("SG_PassiveSemaphore")==0)then--有舰船满足被动信号发出条件
		local iUnit = 1
		while(iLocking==0)and(Units[iUnit]~=nil)do
			if(Units[iUnit].Ability.Characteristic~=nil)then
				if(SobGroup_AreAnyOfTheseTypes("SG_PassiveSemaphore", Units[iUnit].Name)==1)then
					for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
						if(jAbility[1]=="PassiveSemaphore")then
							if(jAbility[10]==iSemaphore)then
								SobGroup_Clear("UnitCharacteristicTempGroup")
								SobGroup_Clear("UnitCharacteristicTempGroup2")
								SobGroup_FillShipsByType("UnitCharacteristicTempGroup2", "SG_PassiveSemaphore", Units[iUnit].Name)--提取指定种类的舰船
								SobGroup_FillCompare("UnitCharacteristicTempGroup", "SG_Ability_"..iAbility, "UnitCharacteristicTempGroup2")--发出的是指定ID的被动信号
								if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
									SobGroup_Clear("UnitCharacteristicTempGroup2")
									SobGroup_GetAttackers("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2")
									if(SobGroup_GroupInGroup("UnitCharacteristicTempGroup2", iGroup) == 1)then--如果船只在攻击被动信号发出组
										iLocking = 1
									end
								end
								break
							end
						end
					end
				end
			end
			iUnit = iUnit + 1
		end
	end
	return iLocking
end

function IsBeenLockedTarget(iGroup, iSemaphore)--照准信号判断函式（船只组，信号ID）
	local iLocked = 0
	if(SobGroup_UnderAttack(iGroup) == 1)and(SobGroup_Empty("SG_LockingSemaphore")==0)then
		--if(SobGroup_Empty("UnitCharacteristicTempGroup2") == 0)then
			local iUnit = 1
			while(iLocked==0)and(Units[iUnit]~=nil)do
				if(Units[iUnit].Ability.Characteristic~=nil)then
					if(SobGroup_AreAnyOfTheseTypes("SG_LockingSemaphore", Units[iUnit].Name)==1)then
						for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
							if(jAbility[1]=="LockingSemaphore")then
								if(jAbility[10]==iSemaphore)then
									SobGroup_Clear("UnitCharacteristicTempGroup")
									SobGroup_Clear("UnitCharacteristicTempGroup2")
									SobGroup_GetAttackers(iGroup, "UnitCharacteristicTempGroup")--获得攻击该船的组
									SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_LockingSemaphore")--获得攻击者中发出照准信号的组
									SobGroup_Clear("UnitCharacteristicTempGroup")
									SobGroup_FillShipsByType("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", Units[iUnit].Name)--从中提取指定种类的舰船
									SobGroup_Clear("UnitCharacteristicTempGroup2")
									SobGroup_FillCompare("UnitCharacteristicTempGroup2", "SG_Ability_"..iAbility, "UnitCharacteristicTempGroup")--发出的是指定ID的照准信号
									if(SobGroup_Empty("UnitCharacteristicTempGroup2")==0)then
										iLocked = 1
									end
									break
								end
							end
						end
					end
				end
				iUnit = iUnit + 1
			end
		--end
	end
	return iLocked
end

function IsBeenGuardedTarget(iPlayer, iGroup, iSemaphore)--保护信号判断函式（玩家编号，船只组，信号ID）
	local iGuard = 0
	if(SobGroup_Empty("SG_GuardingSemaphore")==0)then
		if(SobGroup_IsGuardingSobGroup("SG_GuardingSemaphore", iGroup)==1)then
			local iUnit = 1
			while(iGuard==0)and(Units[iUnit]~=nil)do
				if(Units[iUnit].Ability.Characteristic~=nil)then
					if(SobGroup_AreAnyOfTheseTypes("SG_GuardingSemaphore", Units[iUnit].Name)==1)then
						for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
							if(jAbility[1]=="GuardingSemaphore")then
								if(jAbility[10]==iSemaphore)then
									if(jAbility[11]==0)then
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_Clear("UnitCharacteristicTempGroup2")
										Player_FillShipsByType("UnitCharacteristicTempGroup", iPlayer, Units[iUnit].Name)--提取指定种类的舰船
										SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_GuardingSemaphore")--提取发出保护信号的船只
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "SG_Ability_"..iAbility)--发出的是指定ID的保护信号
										if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
											if(SobGroup_IsGuardingSobGroup("UnitCharacteristicTempGroup", iGroup)==1)then
												iGuard = 1
											end
										end
									else
										for jPlayer=1,Universe_PlayerCount() do
											if(iPlayer==(jPlayer-1))or((iPlayer~=(jPlayer-1))and((AreAllied(iPlayer, (jPlayer-1))==1)))then
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_Clear("UnitCharacteristicTempGroup2")
												Player_FillShipsByType("UnitCharacteristicTempGroup", iPlayer, Units[iUnit].Name)--提取指定种类的舰船
												SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_GuardingSemaphore")--提取发出保护信号的船只
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "SG_Ability_"..iAbility)--发出的是指定ID的保护信号
												if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
													if(SobGroup_IsGuardingSobGroup("UnitCharacteristicTempGroup", iGroup)==1)then
														iGuard = 1
													end
												end
											end
										end
									end
									break
								end
							end
						end
					end
				end
				iUnit = iUnit + 1
			end
		end
	end
	return iGuard
end

function IsGuardingTarget(iPlayer, iGroup, iSemaphore)--受保护信号判断函式（玩家编号，船只组，信号ID）
	local iGuard = 0
	if(SobGroup_Empty("SG_PunySemaphore")==0)then
		if(SobGroup_IsGuardingSobGroup(iGroup, "SG_PunySemaphore")==1)then
			local iUnit = 1
			while(iGuard==0)and(Units[iUnit]~=nil)do
				if(Units[iUnit].Ability.Characteristic~=nil)then
					if(SobGroup_AreAnyOfTheseTypes("SG_PunySemaphore", Units[iUnit].Name)==1)then
						for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
							if(jAbility[1]=="PunySemaphore")then
								if(jAbility[10]==iSemaphore)then
									if(jAbility[11]==0)then
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_Clear("UnitCharacteristicTempGroup2")
										Player_FillShipsByType("UnitCharacteristicTempGroup", iPlayer, Units[iUnit].Name)--提取指定种类的舰船
										SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_PunySemaphore")--提取发出受保护信号的船只
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "SG_Ability_"..iAbility)--发出的是指定ID的受保护信号
										if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
											if(SobGroup_IsGuardingSobGroup(iGroup, "UnitCharacteristicTempGroup")==1)then
												iGuard = 1
											end
										end
									else
										for jPlayer=1,Universe_PlayerCount() do
											if(iPlayer==(jPlayer-1))or((iPlayer~=(jPlayer-1))and((AreAllied(iPlayer, (jPlayer-1))==1)))then
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_Clear("UnitCharacteristicTempGroup2")
												Player_FillShipsByType("UnitCharacteristicTempGroup", iPlayer, Units[iUnit].Name)--提取指定种类的舰船
												SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_PunySemaphore")--提取发出受保护信号的船只
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "SG_Ability_"..iAbility)--发出的是指定ID的受保护信号
												if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
													if(SobGroup_IsGuardingSobGroup(iGroup, "UnitCharacteristicTempGroup")==1)then
														iGuard = 1
													end
												end
											end
										end
									end
									break
								end
							end
						end
					end
				end
				iUnit = iUnit + 1
			end
		end
	end
	return iGuard
end

function IsDockingShip(iPlayer, iUnit, iSemaphore)--母舰信号判断函式（船只组，单位ID，信号ID）
	local iDocking = 0
	if(SobGroup_IsDocked(iGroup) == 1)and(SobGroup_Empty("SG_MotherShip")==0)then
		local iUnit = 1
		while(iDocking==0)and(Units[iUnit]~=nil)do
			if(Units[iUnit].Ability.Characteristic~=nil)then
				if(SobGroup_AreAnyOfTheseTypes("SG_MotherShip", Units[iUnit].Name)==1)then
					for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
						if(jAbility[1]=="MotherShip")then
							if(jAbility[10]==iSemaphore)then
								SobGroup_Clear("UnitCharacteristicTempGroup")
								SobGroup_Clear("UnitCharacteristicTempGroup2")
								SobGroup_FillShipsByType("UnitCharacteristicTempGroup", "SG_MotherShip", Units[iUnit].Name)--提取指定种类的舰船
								SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_Ability_"..iAbility)--发出的是指定ID的母舰信号
								if(SobGroup_Empty("UnitCharacteristicTempGroup2")==0)then
									if(SobGroup_IsDockedSobGroup(iGroup, "UnitCharacteristicTempGroup2")==1)then
										iDocking = 1
									end
								end
								break
							end
						end
					end
				end
			end
			iUnit = iUnit + 1
		end
	end
	return iDocking
end

function IsDockedSemaphoreEnaugh(iGroup, iShip, iSemaphore)--停泊信号判断函式（船只组，船只ID，信号ID）
	local iEnaughSemaphore = 0
	--if(SobGroup_Empty("SG_DockingMotherShip")==0)then
		--if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
		local iUnit = 1
		local iEnaughSemaphoreNumber = 0
		local iDockingSemaphoreID,iDockingSemaphoreNumber = GetDockingSemaphoreNumber(iShip, iSemaphore)
		while(iEnaughSemaphore ==0)and(Units[iUnit]~=nil)do
			if(Units[iUnit].Ability.Characteristic~=nil)then
				if(SobGroup_AreAnyOfTheseTypes("SG_DockingMotherShip", Units[iUnit].Name)==1)then
					for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
						if(jAbility[1]=="DockingMotherShip")then
							if(jAbility[10]==iDockingSemaphoreID)then
								SobGroup_Clear("UnitCharacteristicTempGroup")
								SobGroup_Clear("UnitCharacteristicTempGroup2")
								SobGroup_GetSobGroupDockedWithGroup(iGroup, "UnitCharacteristicTempGroup")--获得停泊在该船的组
								SobGroup_FillShipsByType("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", Units[iUnit].Name)--提取指定种类的舰船
								SobGroup_Clear("UnitCharacteristicTempGroup")
								SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "SG_DockingMotherShip")--提取发出停泊信号
								SobGroup_Clear("UnitCharacteristicTempGroup2")
								SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_Ability_"..iAbility)--发出的是指定ID的停泊信号
								iEnaughSemaphoreNumber = iEnaughSemaphoreNumber + jAbility[11]*SobGroup_Count("UnitCharacteristicTempGroup2")
								if(iEnaughSemaphoreNumber>=iDockingSemaphoreNumber)then
									iEnaughSemaphore = 1
								end
								break
							end
						end
					end
				end
				iUnit = iUnit + 1
			end
		end
	--end
	return iEnaughSemaphore
end

function GetDockingSemaphoreNumber(iShip, iSemaphore)--停泊信号ID、强度获得函式（船只ID，信号ID）
	local iDockingSemaphoreID = 0
	local iDockingSemaphoreNumber = 0
	local iAbility = 1
	while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility] ~= nil)do
		if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "MotherShipFilter")then
			if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] == iSemaphore)then
				iDockingSemaphoreID = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11]
				iDockingSemaphoreNumber = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12]
				break
			end
		end
		iAbility = iAbility + 1
	end
	return iDockingSemaphoreID,iDockingSemaphoreNumber
end

function PointDistance(P1,P2)
	local iLong = (P1[1] - P2[1]) * (P1[1] - P2[1]) + (P1[2] - P2[2]) * (P1[2] - P2[2]) + (P1[3] - P2[3]) * (P1[3] - P2[3])
	iLong = sqrt(iLong)
	return iLong
end

function IsUnderAreaSemaphore(iPlayer, iGroup, iSemaphore)--范围信号判断函式（玩家编号，船只组，信号ID）
	local iNear = 0
	if(SobGroup_Empty("SG_AreaSemaphore")==0)then
		local iUnit = 1
		while(iNear==0)and(Units[iUnit]~=nil)do
			if(Units[iUnit].Ability.Characteristic~=nil)then
				if(SobGroup_AreAnyOfTheseTypes("SG_AreaSemaphore", Units[iUnit].Name)==1)then
					for iAbility,jAbility in Units[iUnit].Ability.Characteristic do
						if(jAbility[1]=="AreaSemaphore")then
							if(jAbility[10]==iSemaphore)then
								for jPlayer = 1,Universe_PlayerCount() do
									if((iPlayer==(jPlayer-1))and(jAbility[12][1]==1))or((AreAllied(iPlayer, (jPlayer-1))==1)and(jAbility[12][2]==1))or((AreAllied(iPlayer, (jPlayer-1))==0)and(jAbility[12][3]==1))then
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_Clear("UnitCharacteristicTempGroup2")
										Player_FillProximitySobGroup("UnitCharacteristicTempGroup", iPlayer, iGroup, jAbility[11])
										SobGroup_FillShipsByType("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", Units[iUnit].Name)
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "SG_AreaSemaphore")
										SobGroup_Clear("UnitCharacteristicTempGroup2")
										SobGroup_FillCompare("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup", "SG_Ability_"..iAbility)
										if(SobGroup_Empty("UnitCharacteristicTempGroup")==0)then
											iNear = 1
										end
									end
								end
								break
							end
						end
					end
				end
			end
			iUnit = iUnit + 1
		end
	end
	return iNear
end

function UnitCharacteristicCheck(iGroup, iPlayer, iShip)--检测单位特质触发条件，参数为：单位组及名称，玩家ID，单位ID
	--local iShip = SkillCheckMemory
	--local iPressure = 0
	--while(iPressure < CheckPressureKey)do
		--if(AllUnitsStates[iShip] == nil)then
		--	iPressure = CheckPressureKey
		--else--change
			if(AllUnitsStates[iShip][4]==0)then
				if(SobGroup_Empty(iGroup) == 1)then
					AllUnitsStates[iShip][4] = Universe_GameTime()
				end
				if(AllUnitsStates[iShip][16] ~= 0)then
					local iAbility = 1
					while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility] ~= nil)do
						--iPressure = iPressure + 1
						local iDone = 0
						local iAbilityLocalNumber = SHIPGLOBALSTATEOBLIGATENUMBER -  9 + 10 * iAbility
						if(AllUnitsStates[iShip][iAbilityLocalNumber] ~= 0)then
							iDone = 1
						else
							if(CanDoCharacteristic(iPlayer, AllUnitsStates[iShip][1], iGroup, iAbility, 0) ~= 0)then
								if(AllUnitsStates[iShip][iAbilityLocalNumber] ~= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][9][1])then
									AllUnitsStates[iShip][iAbilityLocalNumber] = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][9][1]
									--_ALERT(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1].." "..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][9][1])
								end
								iDone = 1
							end
						end
						if(iDone == 1)and(AllUnitsStates[iShip][4]==0)then
--							local iSkillPressureID = 1
--							while(SkillPressure[iSkillPressureID] ~= nil)do
--								if(SkillPressure[iSkillPressureID][1] == Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1])then
--									iPressure = iPressure + SkillPressure[iSkillPressureID][2]
--								end
--								iSkillPressureID = iSkillPressureID + 1
--							end
							
							----------------入口
							local BeginState = 2
							local ConditionGroup = 1
							if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 0 or AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 3)then
								while((BeginState == 0 or BeginState == 2) and Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][3][ConditionGroup] ~= nil)do
									BeginState = 1
									for ConditionID,ConditionTable in Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][3][ConditionGroup] do
										if(X_ConditionJudge[ConditionTable[1]]~=nil)then				
											if(X_ConditionJudge[ConditionTable[1]](iPlayer, iShip, iGroup, ConditionTable)==0)then
												BeginState = 0
												break
											end
										else
											_ALERT("X System Error: Invalid Condition Name")
										end
									end
									if (BeginState ~= 0) then
										AllUnitsStates[iShip][2] = ConditionGroup
										break
									else
										AllUnitsStates[iShip][2] = 0
									end
									ConditionGroup = ConditionGroup + 1
								end
							end
							SetShipConditionSG(iShip, iGroup, iAbility, BeginState, iAbilityLocalNumber)
							if(BeginState ~= 0)then
								if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 0)then
									AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 1
								end
							else
								if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 3)then
									AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 4
								end
							end
						else --没有或取消能力
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][9][2] == 0)then
								if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 3)then
									AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 4
									if(SobGroup_GroupInGroup("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], iGroup)==1) then
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_FillSubstract("UnitCharacteristicTempGroup", "SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], iGroup)
										SobGroup_Clear("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1])
										SobGroup_SobGroupAdd("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], "UnitCharacteristicTempGroup")
									end
									if(SobGroup_GroupInGroup("SG_Ability_"..iAbility, iGroup)==1) then
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_FillSubstract("UnitCharacteristicTempGroup", "SG_Ability_"..iAbility, iGroup)
										SobGroup_Clear("SG_Ability_"..iAbility)
										SobGroup_SobGroupAdd("SG_Ability_"..iAbility, "UnitCharacteristicTempGroup")
									end
								end
							end
						end
						iAbility = iAbility + 1
					end
				end
			else
				AllUnitsStates[iShip]=nil
			end
			--iShip = iShip + 1
			--SkillCheckMemory = iShip
	--	end
	--end
end

function SetShipConditionSG(iShip, iGroup, iAbility, BeginState, iAbilityLocalNumber)
	if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 3)then
		if (BeginState ~= 0) then
			if(SobGroup_GroupInGroup("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], iGroup)==0) then
				SobGroup_SobGroupAdd("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], iGroup)
			end
			if(SobGroup_GroupInGroup("SG_Ability_"..iAbility, iGroup)==0) then
				SobGroup_SobGroupAdd("SG_Ability_"..iAbility, iGroup)
			end
		else
			if(SobGroup_GroupInGroup("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], iGroup)==1) then
				SobGroup_Clear("UnitCharacteristicTempGroup")
				SobGroup_FillSubstract("UnitCharacteristicTempGroup", "SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], iGroup)
				SobGroup_Clear("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1])
				SobGroup_SobGroupAdd("SG_"..Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1], "UnitCharacteristicTempGroup")
			end
			if(SobGroup_GroupInGroup("SG_Ability_"..iAbility, iGroup)==1) then
				SobGroup_Clear("UnitCharacteristicTempGroup")
				SobGroup_FillSubstract("UnitCharacteristicTempGroup", "SG_Ability_"..iAbility, iGroup)
				SobGroup_Clear("SG_Ability_"..iAbility)
				SobGroup_SobGroupAdd("SG_Ability_"..iAbility, "UnitCharacteristicTempGroup")
			end
		end
	end
end

function UnitCharacteristicRuning(iGroup, iPlayer, iShip)--检测单位特质触发条件，参数为：单位组及名称，玩家ID，单位ID
if(AllUnitsStates[iShip]~=nil)then
	local iPlayerRUGet = {0,0,0,0,0,0,0,0,}
	if(AllUnitsStates[iShip][16] ~= 0)then
		local iHealth = SobGroup_HealthPercentage(iGroup)
		local iActualSpeed = sqrt(SobGroup_GetActualSpeed(iGroup))
		local iHealthHold = iHealth
		local iDamageValue = AllUnitsStates[iShip][5] - iHealth
		local iScuttle = 0
		if(iDamageValue < 0)then
			iDamageValue = 0
			AllUnitsStates[iShip][5] = iHealth
		end
		local iDamage = 1
		local iDamageMu = 1
					
		local iSubDamage = 1
		local iSubDamageMu = 1
					
		local iFuelValue = 0
		local iFuelCap = 0

		local iShieldValue = 0
		local iShieldCap = 0

		local iArmorValue = 0
		local iArmorCap = 0
		local iArmorAbsorb = 0
					
		local iExperience = 0
		local iExperienceCap = 0
					
		local iStructure = 0
					
		local iRepair = 0
		local iRepairMu = 0
					
		local iSpeed = 1
		local iSpeedMu = 1
					
		local iBuildingSpeed = 1
		local iBuildingSpeedMu = 1
		local iBuildingSpeedKey = 0
					
		local iRUAddValue = 0
					
		local bSubsystemDefend = 0
		local igSubsystemDefend = 
		{
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
			{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},{"",0,1,0,0},
		}
		local iAbility = 1
		while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility] ~= nil)do
			local iAbilityLocalNumber = SHIPGLOBALSTATEOBLIGATENUMBER -  9 + 10 * iAbility
			local iSkillPressureID = 1
			---------------------一阶段前的额外检测
			if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ShipIdioStateKeyTempOn")then
				if(AllUnitsStates[iShip][iAbilityLocalNumber + 3]==0)then
					if(AllUnitsStates[iShip][iAbilityLocalNumber + 1]==1 or AllUnitsStates[iShip][iAbilityLocalNumber + 1]==2 or AllUnitsStates[iShip][iAbilityLocalNumber + 1]==3)then
							AllUnitsStates[iShip][iAbilityLocalNumber + 3] = Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11]
							xSetShipIdioStateKey(iShip,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10],"On")
					end
				elseif(AllUnitsStates[iShip][iAbilityLocalNumber + 3]>0)then
					if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] <= Universe_GameTime())then
						xSetShipIdioStateKey(iShip,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10],"Off")
						AllUnitsStates[iShip][iAbilityLocalNumber + 3] = - Universe_GameTime() - Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12]
					end
				elseif(-AllUnitsStates[iShip][iAbilityLocalNumber + 3] <= Universe_GameTime())then
					AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 0
				end
			end

			if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 1)then---------------------一阶段动作
				AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 2
				local iAnim = 1 --播放所有动画
				while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][1][iAnim] ~= nil)do
					SobGroup_SetMadState(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][1][iAnim])
					iAnim = iAnim + 1
				end
				local iEvent = 1 --播放所有蘙效
				while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][2][iEvent] ~= nil)do
					FX_StartEvent(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][2][iEvent])
					iEvent = iEvent + 1
				end
				if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][5]~=nil)then
					Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][5](iGroup, iPlayer, iShip, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][6])
				end
				AllUnitsStates[iShip][iAbilityLocalNumber + 2] = Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][3]
							
				--技能执行
				if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfChangePower")then
					local iPower = 1
					while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iPower] ~= nil)do
						SobGroup_ChangePower(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iPower], 0)
						iPower = iPower + 1
					end
				elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "CustomCode")then
					Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10](iGroup, iPlayer, iShip)
				elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "DroneShip")then
					local iDroneMotherShipName = "Drone_"..iShip.."_"..iAbility.."_"
					local iDrone = 1
					while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
						SobGroup_Create(iDroneMotherShipName..iDrone)
						SobGroup_SetSwitchOwnerFlag(iDroneMotherShipName..iDrone, 0)
						iDrone = iDrone + 1
					end
					AllUnitsStates[iShip][iAbilityLocalNumber + 4] = iDrone
				elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "RestrictShipBuildingOption")then
					local iBuildOption = 1
					while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iBuildOption] ~= nil)do
						SobGroup_RestrictBuildOption(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iBuildOption])
						iBuildOption = iBuildOption + 1
					end
				end
			end

			if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 2)then---------------------一阶段完成
				if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][4] == 1)then
					iSpeedMu = 0
				end
				--技能执行
				if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioFuel")then
					iFuelCap = iFuelCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
				elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioShield")then
					iShieldCap = iShieldCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
				elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioArmor")then
					iArmorCap = iArmorCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
				end
							
				if(Universe_GameTime() >= AllUnitsStates[iShip][iAbilityLocalNumber + 2])then
					AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 3
					AllUnitsStates[iShip][iAbilityLocalNumber + 9] = Universe_GameTime()
					
					local iAnim = 1 --播放所有动画
					while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][1][iAnim] ~= nil)do
						SobGroup_SetMadState(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][1][iAnim])
						iAnim = iAnim + 1
					end
					local iEvent = 1 --播放所有蘙效
					while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][2][iEvent] ~= nil)do
						FX_StartEvent(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][2][iEvent])
						iEvent = iEvent + 1
					end
								
					--技能执行
					if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfChangePower")then
						local iPower = 1
						while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iPower] ~= nil)do
							SobGroup_ChangePower(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iPower], 1)
							iPower = iPower + 1
						end
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfInvulnerability")then
						SobGroup_SetInvulnerability(iGroup, 1)
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfHardpointInvulnerability")then
						SobGroup_SetInvulnerabilityOfHardPoint(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], 1)
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfShipAbility")then
						if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11] ~= 0)then
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] == 0)then
								SobGroup_MakeSelectable(iGroup,1)
							else
								SobGroup_AbilityActivate(iGroup, AB_Table[Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]], 1)
							end
						else
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] == 0)then
								SobGroup_MakeSelectable(iGroup,0)
							else
								SobGroup_AbilityActivate(iGroup, AB_Table[Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]], 0)
							end
						end
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfCommand")then
						if (iPlayer~=-1) then
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==1)then--移动命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_MoveToSobGroup(iCommandGroup, iTargetGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==2)then--攻击命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_Attack(iPlayer, iCommandGroup, iTargetGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==3)then--护航命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_GuardSobGroup(iCommandGroup, iTargetGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==4)then--维修命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_RepairSobGroup(iCommandGroup, iTargetGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==5)then--隐形命令
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]==1)then
									local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
									if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)then
										if (SobGroup_IsCloaked(iCommandGroup)==0)then
											SobGroup_CloakToggle(iCommandGroup)
										end
									end
								elseif(SobGroup_IsCloaked(iGroup)==0)then
									SobGroup_CloakToggle(iGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==6)then--采集命令
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]==1)then
									local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
									if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)then
										SobGroup_Resource(iPlayer, iCommandGroup)
									end
								else
									SobGroup_Resource(iPlayer, iGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==8)then--捕捉命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_CaptureSobGroup(iCommandGroup, iTargetGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==9)then--停泊命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_DockSobGroup(iCommandGroup, iTargetGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==12)then--停止命令
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]==1)then
									local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
									if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(iPlayer>=0)then
										SobGroup_Stop(iPlayer, iCommandGroup)
									end
								elseif(iPlayer>=0)then
									SobGroup_Stop(iPlayer, iGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==14)then--列队命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_ParadeSobGroup(iCommandGroup, iTargetGroup, 0)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==23)then--回收命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_SalvageSobGroup(iCommandGroup, iTargetGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==24)then--自毁命令
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]==1)then
									local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
									if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)then
										SobGroup_TakeDamage(iCommandGroup, 1)
									end
								else
									SobGroup_TakeDamage(iGroup, 1)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==31)then--自定义命令
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]==1)then
									local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
									if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)then
										SobGroup_CustomCommand(iCommandGroup)
									end
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]==32)then--神风命令
								local iFlag,iCommandGroup,iTargetGroup = X_GetCommandGroup(iPlayer,iGroup,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14],Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15])
								if(iFlag==1)and(SobGroup_Empty(iCommandGroup)==0)and(SobGroup_Empty(iTargetGroup)==0)then
									SobGroup_Kamikaze(iCommandGroup, iTargetGroup)
								end
							end
						end
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "CycExplode")then
						local iHostilityPlayer = 0
						while(iHostilityPlayer < Universe_PlayerCount())do
							if(Player_IsAlive(iHostilityPlayer) == 1)then
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12][1] == 1 and iHostilityPlayer == iPlayer)then
									SobGroup_DoDamageProximitySobGroup(iGroup, iHostilityPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12][2] == 1 and iHostilityPlayer ~= iPlayer and AreAllied(iPlayer, iHostilityPlayer) == 1)then
									SobGroup_DoDamageProximitySobGroup(iGroup, iHostilityPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12][3] == 1 and AreAllied(iPlayer, iHostilityPlayer) == 0)then
									SobGroup_DoDamageProximitySobGroup(iGroup, iHostilityPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])
								end
							end
							iHostilityPlayer = iHostilityPlayer + 1
						end
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioFuel")then
						iFuelValue = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioShield")then
						if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] == 0)then
							iShieldValue = iShieldValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11]
						else
							AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 0
							iShieldValue = iShieldValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]
						end
						--iShieldCap = iShieldCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioArmor")then
						iArmorValue = iArmorValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11]
						--iArmorCap = iArmorCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfHardPointUnderDefend")then
						AllUnitsStates[iShip][iAbilityLocalNumber + 3] = SobGroup_GetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10])
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitBuildAward")then
						AllUnitsStates[iShip][iAbilityLocalNumber + 3] = Stats_TotalShipsBuiltInRUs(iPlayer)
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitLossesCompensate")then
						AllUnitsStates[iShip][iAbilityLocalNumber + 3] = Stats_TotalLossesInRUs(iPlayer)
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitKillsBounty")then
						AllUnitsStates[iShip][iAbilityLocalNumber + 3] = Stats_TotalKillsInRUs(iPlayer)
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "SubsystemBuild")then
						local iSubsystem = 1
						while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem] ~= nil)do
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iSubsystem] ~= nil)then
								if(SobGroup_GetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem]) > 0)then
									SobGroup_SetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem], 0)
								end
							end
							iSubsystem = iSubsystem + 1
						end
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ShipIdioStateKeyOn")then
						xSetShipIdioStateKey(iShip,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10],"On")
					elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ShipIdioStateKeyOff")then
						xSetShipIdioStateKey(iShip,Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10],"Off")
					end
				end
			end
						
						if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 3)then---------------------二阶段持续过程
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][4] == 1)then
								iSpeedMu = 0
							end
							
							local iRealTimeNow = Universe_GameTime()
							local iAbilityTempSpacingTime = iRealTimeNow - AllUnitsStates[iShip][iAbilityLocalNumber + 9]
							AllUnitsStates[iShip][iAbilityLocalNumber + 9] = iRealTimeNow
							if(iAbilityTempSpacingTime < 0)then
								iAbilityTempSpacingTime = 0
							end
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][5]~=nil)then
								Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][5](iGroup, iPlayer, iShip, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][6])
							end
							--技能执行
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfSpeedChange")then
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Add")then
									iSpeed = iSpeed + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Multiplication")then
									iSpeedMu = iSpeedMu * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								end
							--elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfSpeedChange2")then
							--	if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][AllUnitsStates[iShip][2]]~=nil)then
							--		if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Add")then
							--			iSpeed = iSpeed + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][AllUnitsStates[iShip][2]]
							--		elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Multiplication")then
							--			iSpeedMu = iSpeedMu * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][AllUnitsStates[iShip][2]]
							--		end
							--	end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfBuildingSpeedChange")then
								iBuildingSpeedKey = 1
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Add")then
									iBuildingSpeed = iBuildingSpeed + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Multiplication")then
									iBuildingSpeedMu = iBuildingSpeedMu * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfDamageChange")then
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Add")then
									iDamage = iDamage - Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Multiplication")then
									iDamageMu = iDamageMu * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Other")then
									iDamageValue = iDamageValue - (Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] * iAbilityTempSpacingTime)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfHardPointDamageChange")then
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Add")then
									iSubDamage = iSubDamage - Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Multiplication")then
									iSubDamageMu = iSubDamageMu * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfRepair")then
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Add")then
									iRepair = iRepair + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] * iAbilityTempSpacingTime
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][2] == "Multiplication")then
									iRepairMu = iRepairMu + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] * iAbilityTempSpacingTime
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfUntargeted")then
								SobGroup_MakeUntargeted(iGroup)
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfCommand")then
								AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 4
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "CycExplode")then
								AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 4
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "CustomCode")then
								Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11](iGroup, iPlayer, iShip)
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "DroneShip")then
								local iDroneMotherShipName = "Drone_"..iShip.."_"..iAbility.."_"
								if(iHealthHold <= 0)then
									AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 4
								else
									local iDrone = 1
									while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
										if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
											if(iPlayer ~= SobGroup_OwnedBy(iDroneMotherShipName..iDrone))then
												SobGroup_SwitchOwner(iDroneMotherShipName..iDrone, iPlayer)
											end
										end
										iDrone = iDrone + 1
									end
									
									if(SobGroup_IsDoingAbility(iGroup, AB_Hyperspace) == 0 and SobGroup_IsDocked(iGroup) == 0)then
										if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] <= 0)then
											iDrone = 1
											while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
												if(SobGroup_Count(iDroneMotherShipName..iDrone) == 0)then
													if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] == 0)then
														AllUnitsStates[iShip][iAbilityLocalNumber + 3] = Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12][1]
													elseif(AllUnitsStates[iShip][iAbilityLocalNumber + 3] < 0)then
														AllUnitsStates[iShip][iAbilityLocalNumber + 3] = AllUnitsStates[iShip][iAbilityLocalNumber + 3] * -1
													end
												end
												iDrone = iDrone + 1
											end
										end
										if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] < 0)then
											AllUnitsStates[iShip][iAbilityLocalNumber + 3] = (Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12][2]) * -1
										end
										
										if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] > 0 and Universe_GameTime() >= AllUnitsStates[iShip][iAbilityLocalNumber + 3])then
											iDrone = 1
											while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11] and AllUnitsStates[iShip][iAbilityLocalNumber + 3] > 0)do
												if(SobGroup_Count(iDroneMotherShipName..iDrone) == 0)then
													AllUnitsStates[iShip][iAbilityLocalNumber + 3] = (Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12][2]) * -1
													if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14] == 0)then
														SpawnMyNewShipInSobGroup(iPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], iDroneMotherShipName..iDrone, "UnitReplacementTempVolume")
														SobGroup_Despawn(iDroneMotherShipName..iDrone)
													else
														if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15] == 0)or(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15] == 3)then
															SpawnMyNewShipInSobGroup(iPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], iDroneMotherShipName..iDrone, "UnitReplacementTempVolume")
															SobGroup_DockSobGroupInstant(iDroneMotherShipName..iDrone, iGroup)
															SobGroup_Launch(iDroneMotherShipName..iDrone, iGroup)
															LockAllAbility(iDroneMotherShipName..iDrone, 1)
														elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15] == 1)then
															SpawnMyNewShipInSobGroup(iPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], iDroneMotherShipName..iDrone, "UnitReplacementTempVolume")
															SobGroup_DockSobGroupInstant(iDroneMotherShipName..iDrone, iGroup)
															LockAllAbility(iDroneMotherShipName..iDrone, 1)
														else
															SobGroup_SobGroupAdd(iDroneMotherShipName..iDrone, SobGroup_CreateShip(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]))
															GetUnitsIndex(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10])
														end
													end
												end
												iDrone = iDrone + 1
											end
										end
										
										if(SobGroup_AreAllInHyperspace(iGroup) == 0)then
											iDrone = 1
											while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
												if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
													if(SobGroup_AreAllInHyperspace(iDroneMotherShipName..iDrone) == 1)then
														SobGroup_ExitHyperSpaceSobGroup(iDroneMotherShipName..iDrone, iGroup, 500)
														LockAllAbility(iDroneMotherShipName..iDrone, 1)
													end
												end
												iDrone = iDrone + 1
											end
										end
									else
										local iDrone = 1
										while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
											if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
												if(SobGroup_IsDockedSobGroup(iDroneMotherShipName..iDrone, iGroup) == 0)then
													SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Stop , 1)
													SobGroup_Stop(SobGroup_OwnedBy(iDroneMotherShipName..iDrone), iDroneMotherShipName..iDrone)
													SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Stop , 0)
													SobGroup_EnterHyperSpaceOffMap(iDroneMotherShipName..iDrone)
												end
											end
											iDrone = iDrone + 1
										end
									end
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "AssistantStructure")then
								iStructure = iStructure + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioFuel")then
								iFuelCap = iFuelCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								if(SobGroup_IsDocked(iGroup)==1)then
									iFuelValue = iFuelValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
									AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 0
								elseif(SobGroup_SalvagedByPlayer(iGroup, iPlayer)==1)then
									if(AllUnitsStates[iShip][iAbilityLocalNumber + 3]==0)then
										AllUnitsStates[iShip][iAbilityLocalNumber + 3] = Universe_GameTime()+10
									elseif(Universe_GameTime()>=AllUnitsStates[iShip][iAbilityLocalNumber + 3])then
										AllUnitsStates[iShip][iAbilityLocalNumber + 3] = Universe_GameTime()+1000
										SobGroup_Clear("UnitCharacteristicTempGroup")
										Player_FillProximitySobGroup("UnitCharacteristicTempGroup", iPlayer, iGroup, 500)
										SobGroup_DockSobGroupInstant(iGroup, "UnitCharacteristicTempGroup")
									end
								elseif (AllUnitsStates[iShip][24][1]<=0) then
									iSpeedMu = 0
									--SobGroup_AbilityActivate(iGroup, AB_Steering, 0)
								else
									--SobGroup_AbilityActivate(iGroup, AB_Steering, 1)
									SobGroup_Clear("UnitCharacteristicTempGroup")
									SobGroup_GetSobGroupSalvagingGroup(iGroup, "UnitCharacteristicTempGroup")
									if(iActualSpeed>1)and(SobGroup_Empty("UnitCharacteristicTempGroup")==1)then
										iFuelValue = iFuelValue - Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11]*iAbilityTempSpacingTime - Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12]*iAbilityTempSpacingTime*iActualSpeed
									end
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioShield")then
								iShieldCap = iShieldCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								if(AllUnitsStates[iShip][13][1] < 0)then
									if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13] ~= 0)then
										AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 4
										AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 1
									end
								else
									iShieldValue = iShieldValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12] * iAbilityTempSpacingTime
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioArmor")then
								iArmorValue = iArmorValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12] * iAbilityTempSpacingTime
								iArmorCap = iArmorCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								iArmorAbsorb = iArmorAbsorb + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13]
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "SheepShip")then
								local iSheepOwn = iPlayer
								local iWolf = 0
								local iSwitchOwner = -1
								while(iSwitchOwner == -1 and iWolf < Universe_PlayerCount())do
									if(Player_IsAlive(iWolf) == 1)then
										SobGroup_Clear("UnitCharacteristicTempGroup")
										SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..iWolf, iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10])
										if(SobGroup_Count("UnitCharacteristicTempGroup") >= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])then
											if(iSheepOwn == -1)then
												SobGroup_SwitchOwner(iGroup, iWolf)
												iSwitchOwner = iWolf
											else
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..iSheepOwn, iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10])
												if(SobGroup_Count("UnitCharacteristicTempGroup") == 0)then
													SobGroup_SwitchOwner(iGroup, iWolf)
													iSwitchOwner = iWolf
												end
											end
										end
									end
									iWolf = iWolf + 1
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ShipExperience")then
								iExperience = iExperience + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11] * iAbilityTempSpacingTime
								iExperienceCap = iExperienceCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfHardPointUnderDefend")then
								local iSubsystemNonce = SobGroup_GetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10])
								if(iSubsystemNonce > 0 and iSubsystemNonce < AllUnitsStates[iShip][iAbilityLocalNumber + 3])then
									bSubsystemDefend = 1
									local iSubsystemOrder = 1
									while(igSubsystemDefend[iSubsystemOrder][1] ~= "")do
										iSubsystemOrder = iSubsystemOrder + 1
									end
									igSubsystemDefend[iSubsystemOrder][1] = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
									igSubsystemDefend[iSubsystemOrder][2] = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11]
									igSubsystemDefend[iSubsystemOrder][3] = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12]
									igSubsystemDefend[iSubsystemOrder][4] = AllUnitsStates[iShip][iAbilityLocalNumber + 3]
									igSubsystemDefend[iSubsystemOrder][5] = iSubsystemNonce
									AllUnitsStates[iShip][iAbilityLocalNumber + 3] = iSubsystemNonce
								else
									AllUnitsStates[iShip][iAbilityLocalNumber + 3] = iSubsystemNonce
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitBuildAward")then
								local iTempTotalShipsBuiltInRUs = Stats_TotalShipsBuiltInRUs(iPlayer)
								iRUAddValue = iRUAddValue + (iTempTotalShipsBuiltInRUs - AllUnitsStates[iShip][iAbilityLocalNumber + 3]) * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								AllUnitsStates[iShip][iAbilityLocalNumber + 3] = iTempTotalShipsBuiltInRUs
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitLossesCompensate")then
								local iTempTotalLossesInRUs = Stats_TotalLossesInRUs(iPlayer)
								iRUAddValue = iRUAddValue + (iTempTotalLossesInRUs - AllUnitsStates[iShip][iAbilityLocalNumber + 3]) * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								AllUnitsStates[iShip][iAbilityLocalNumber + 3] = iTempTotalLossesInRUs
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitKillsBounty")then
								local iTotalKillsInRUs = Stats_TotalKillsInRUs(iPlayer)
								iRUAddValue = iRUAddValue + (iTotalKillsInRUs - AllUnitsStates[iShip][iAbilityLocalNumber + 3]) * Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
								AllUnitsStates[iShip][iAbilityLocalNumber + 3] = iTotalKillsInRUs
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitFabricated")then
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][3] == 0)then
									iRUAddValue = iRUAddValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] * iAbilityTempSpacingTime
								end
							--elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "GuardingSemaphore")then
							--	AllUnitsStates[iShip][iAbilityLocalNumber + 3] = UnitNowGuarding(iPlayer, iShip, iAbility, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10])
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ShipAutoAmelioration")then
								if(SobGroup_AreAllInRealSpace(iGroup) == 1)then
									SobGroup_Stop(iPlayer, iGroup)
									SobGroup_EnterHyperSpaceOffMap(iGroup)
									AllUnitsStates[iShip][iAbilityLocalNumber + 4] = 0
									AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 0
								elseif(SobGroup_AreAllInHyperspace(iGroup) == 1)then
									if(AllUnitsStates[iShip][iAbilityLocalNumber + 4] == 0)then--未开始销毁单位
										if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] == 0)then--未开始替换单位
											SobGroup_Clear("UnitReplacementTempGroup")
											SobGroup_CreateIfNotExist("UnitReplacementTempGroup"..iShip)
											SpawnMyNewShipInSobGroup(iPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], "UnitReplacementTempGroup"..iShip, "UnitReplacementTempVolume")
											SobGroup_Despawn("UnitReplacementTempGroup"..iShip)
											local iPoint = SobGroup_GetPosition(iGroup)
											Volume_AddSphere("V_ShipReplacementVolume"..iShip, {iPoint[1],iPoint[2],iPoint[3]}, 100)
											AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 1
										elseif(AllUnitsStates[iShip][iAbilityLocalNumber + 3] == 1)then--替换单位从超空间出现
											if(SobGroup_AreAllInHyperspace("UnitReplacementTempGroup"..iShip) == 1)then
												SobGroup_ExitHyperSpace("UnitReplacementTempGroup"..iShip, "V_ShipReplacementVolume"..iShip)
												Volume_Delete("V_ShipReplacementVolume"..iShip)
												AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 2
											end
										elseif(AllUnitsStates[iShip][iAbilityLocalNumber + 3] == 2)then--替换单位对齐原单位
											if(SobGroup_AreAllInHyperspace("UnitReplacementTempGroup"..iShip) == 0)then
												SobGroup_ParadeSobGroup("UnitReplacementTempGroup"..iShip, iGroup, 2)
												AllUnitsStates[iShip][iAbilityLocalNumber + 4] = 1
												SobGroup_SetHealth("UnitReplacementTempGroup"..iShip, iHealth)
												SobGroup_Clear("UnitReplacementTempGroup"..iShip)
											end
										end
									else--倒计时销毁原单位
										SobGroup_MakeDead(iGroup)
									end
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ShipDockAmelioration")then
								SobGroup_Clear("UnitReplacementTempGroup")
								SobGroup_Clear("UnitReplacementTempGroup2")
								SobGroup_GetSobGroupDockedWithGroup(iGroup, "UnitReplacementTempGroup")
								if(SobGroup_Empty("UnitReplacementTempGroup")==0)then
									for jGroup,jShip in Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] do
										if(SobGroup_AreAnyOfTheseTypes("UnitReplacementTempGroup", jShip[1])==1)then
											SobGroup_Clear("UnitReplacementTempGroup2")
											SobGroup_FillShipsByType("UnitReplacementTempGroup2", "UnitReplacementTempGroup", jShip[1])
											if(SobGroup_HealthPercentage("UnitReplacementTempGroup2")==1)then
												local iReplaceNumber = ceil(SobGroup_Count("UnitReplacementTempGroup2")/Units[GetUnitsIndex(jShip[1])].Size)
												SobGroup_MakeDead("UnitReplacementTempGroup2")
												SobGroup_Clear("UnitReplacementTempGroup")
												SobGroup_Clear("UnitReplacementTempGroup2")
												for i=1,iReplaceNumber do
													SobGroup_Clear("UnitReplacementTempGroup")
													SpawnMyNewShipInSobGroup(iPlayer, jShip[2], "UnitReplacementTempGroup", "UnitReplacementTempVolume")
													SobGroup_SobGroupAdd("UnitReplacementTempGroup2", "UnitReplacementTempGroup")
												end
												SobGroup_DockSobGroupInstant("UnitReplacementTempGroup2", iGroup)
												SobGroup_Launch("UnitReplacementTempGroup2", iGroup)
											end
										end
									end
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ShipInstantAmelioration")then
								if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] == 0)then
										SobGroup_Clear("UnitReplacementTempGroup")
										local iPoint = SobGroup_GetPosition(iGroup)
										SobGroup_SetHidden(iGroup,1)
										SobGroup_Despawn(iGroup)
										AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 1
										SpawnMyNewShipInSobGroup(iPlayer, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], "UnitReplacementTempGroup", "UnitReplacementTempVolume")--"V_ShipReplacementInstantVolume"..iShip)
										SobGroup_ParadeSobGroup("UnitReplacementTempGroup", iGroup, 2)
										SobGroup_SetHealth("UnitReplacementTempGroup", iHealth)
								elseif(SobGroup_AreAllInHyperspace(iGroup)==1)then
										SobGroup_MakeDead(iGroup)
								else
										SobGroup_Despawn(iGroup)
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "SubsystemBuild")then
								if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] >= 2)then
									local iSubsystem = 1
									while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iSubsystem] ~= nil and Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem] ~= nil)do
										if(SobGroup_GetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem]) == 0)and(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iSubsystem]~="")then
											SobGroup_CreateSubSystem(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iSubsystem])
										end
										iSubsystem = iSubsystem + 1
									end
								else
									AllUnitsStates[iShip][iAbilityLocalNumber + 3] = AllUnitsStates[iShip][iAbilityLocalNumber + 3] + 1
								end
							end
							
							local iRuningLoot = 0
							if(AllUnitsStates[iShip][iAbilityLocalNumber + 2] >= 0 and Universe_GameTime() >= AllUnitsStates[iShip][iAbilityLocalNumber + 2])then
								iRuningLoot = 1
							end
							if(AllUnitsStates[iShip][iAbilityLocalNumber + 2] < 0 and Universe_GameTime() >= (AllUnitsStates[iShip][iAbilityLocalNumber + 2] * -1))then
								iRuningLoot = 1
							end
							
							if(iRuningLoot == 1)then
								if(AllUnitsStates[iShip][iAbilityLocalNumber + 2] >= 0)then
									local iAnim = 1 --播放所有动画
									while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][1][iAnim] ~= nil)do
										SobGroup_SetMadState(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][1][iAnim])
										iAnim = iAnim + 1
									end
									local iEvent = 1 --播放所有蘙效
									while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][2][iEvent] ~= nil)do
										FX_StopEvent(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][2][iEvent])
										FX_StartEvent(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][2][iEvent])
										iEvent = iEvent + 1
									end
								else
									AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 4
									AllUnitsStates[iShip][iAbilityLocalNumber + 2] = AllUnitsStates[iShip][iAbilityLocalNumber + 2] * -1
								end
								
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][3] >= 0)then
									AllUnitsStates[iShip][iAbilityLocalNumber + 2] = Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][3]
								else
									AllUnitsStates[iShip][iAbilityLocalNumber + 2] = (Universe_GameTime() - Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][3]) * -1
								end
								--技能执行
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "DroneShip")then
									if(SobGroup_IsDoingAbility(iGroup, AB_Hyperspace) == 0 and SobGroup_IsDocked(iGroup) == 0 and Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]~=2) then--没有使用超空间或停泊能力
										local iGoAttacking = 0
										local iShipTactics = SobGroup_GetROE(iGroup)
										local iDroneMotherShipName = "Drone_"..iShip.."_"..iAbility.."_"
										local iRange=Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13][3-iShipTactics]
										iGoAttacking = Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][3-iShipTactics]
										if(iShipTactics == 0 and Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][3] ~= 0)then--无人机是否出击
											if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][3]==1)then
												iGoAttacking = 1
											elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][3]==2)then
												iGoAttacking = -1
											end
										elseif(iShipTactics == 1 and Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][2] ~= 0)then
											if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][2]==1)then
												iGoAttacking = 1
											elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][2]==2)then
												iGoAttacking = -1
											end
										elseif(iShipTactics == 2 and Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][1] ~= 0)then
											if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][1]==1)then
												iGoAttacking = 1
											elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][16][1]==2)then
												iGoAttacking = -1
											end
										end
										if(iGoAttacking == -1)then--攻击母舰目标
											if(iRange > 0)then--警戒半径>0
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_Clear("UnitCharacteristicTempGroup2")
												local iTargetPlayer = 0
												while(iTargetPlayer < Universe_PlayerCount())do
													--tempchange
													--if(Player_IsAlive(iTargetPlayer) == 1)then
														if(AreAllied(iPlayer, iTargetPlayer) == 0)then
															SobGroup_Clear("UnitCharacteristicTempGroup")
															SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..iTargetPlayer, iGroup, abs(iRange))
															SobGroup_SobGroupAdd("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup")
														end
													--end
													iTargetPlayer = iTargetPlayer + 1
												end
												if(SobGroup_Count("UnitCharacteristicTempGroup2") > 0)then--警戒半径内有敌军
													if(SobGroup_CanDoAbility(iGroup, AB_Attack)==1)then
														if(SobGroup_GetCurrentOrder(iGroup)==COMMAND_Attack)then
															SobGroup_Clear("UnitCharacteristicTempGroup3")
															SobGroup_GetCommandTargets("UnitCharacteristicTempGroup3", iGroup, COMMAND_Attack)
															SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup3")
														end
													end
													iGoAttacking = 2
												end
											elseif(iRange == 0)then--警戒半径为0，采集无人机
												iGoAttacking = 3
											elseif(iRange < 0)then--警戒半径小于0，维修无人机
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_Clear("UnitCharacteristicTempGroup2")
												SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup2", "Player_Ships"..iPlayer, iGroup, abs(iRange))
												if (SobGroup_HealthPercentage("UnitCharacteristicTempGroup2")==1) then
													SobGroup_Clear("UnitCharacteristicTempGroup2")
													local iTargetPlayer = 0
													while(iTargetPlayer < Universe_PlayerCount())do
														if(AreAllied(iPlayer, iTargetPlayer) == 1)then
															SobGroup_Clear("UnitCharacteristicTempGroup")
															SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..iTargetPlayer, iGroup, abs(iRange))
															SobGroup_SobGroupAdd("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup")
														end
														iTargetPlayer = iTargetPlayer + 1
													end
												end
												if (SobGroup_Count("UnitCharacteristicTempGroup2") > 0)and(SobGroup_HealthPercentage("UnitCharacteristicTempGroup2")<1) then--警戒半径内有友军
													if(SobGroup_GetCurrentOrder(iGroup)==COMMAND_Guard)then
														SobGroup_Clear("UnitCharacteristicTempGroup3")
														SobGroup_GetCommandTargets("UnitCharacteristicTempGroup3", iGroup, COMMAND_Guard)
														SobGroup_FillCompare("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup3")
														SobGroup_SobGroupAdd("UnitCharacteristicTempGroup", iGroup)
													end
													iGoAttacking = 4
												end
											end
										end
										if(iGoAttacking == 1)then--自由攻击
											if(iRange > 0)then--警戒半径>0
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_Clear("UnitCharacteristicTempGroup2")
												local iTargetPlayer = 0
												while(iTargetPlayer < Universe_PlayerCount())do
													--tempchange
													--if(Player_IsAlive(iTargetPlayer) == 1)then
														if(AreAllied(iPlayer, iTargetPlayer) == 0)then
															SobGroup_Clear("UnitCharacteristicTempGroup")
															SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..iTargetPlayer, iGroup, abs(iRange))
															SobGroup_SobGroupAdd("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup")
														end
													--end
													iTargetPlayer = iTargetPlayer + 1
												end
												if(SobGroup_Count("UnitCharacteristicTempGroup2") > 0)then--警戒半径内有敌军
													SobGroup_Clear("UnitCharacteristicTempGroup")
													local iShip=0
													SobGroup_FillShipsByIndexRange("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", 0, 1)
													while(SobGroup_Empty("UnitCharacteristicTempGroup")==0)do
														if (SobGroup_IsCloaked("UnitCharacteristicTempGroup")==0) then
															break
														end
														SobGroup_Clear("UnitCharacteristicTempGroup")
														iShip=iShip+1
														SobGroup_FillShipsByIndexRange("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2", iShip, 1)
													end
													if(SobGroup_Count("UnitCharacteristicTempGroup") > 0)then--有可攻击目标
														iGoAttacking = 2
													end
												end
											elseif(iRange == 0)then--警戒半径为0，采集无人机
												iGoAttacking = 3
											elseif(iRange < 0)then--警戒半径小于0，维修无人机
												SobGroup_Clear("UnitCharacteristicTempGroup")
												SobGroup_Clear("UnitCharacteristicTempGroup2")
												SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup2", "Player_Ships"..iPlayer, iGroup, abs(iRange))
												if (SobGroup_HealthPercentage("UnitCharacteristicTempGroup2")==1) then
													local iTargetPlayer = 0
													while(iTargetPlayer < Universe_PlayerCount())do
														if(AreAllied(iPlayer, iTargetPlayer) == 1)then
															SobGroup_Clear("UnitCharacteristicTempGroup")
															SobGroup_FillProximitySobGroup("UnitCharacteristicTempGroup", "Player_Ships"..iTargetPlayer, iGroup, abs(iRange))
															SobGroup_SobGroupAdd("UnitCharacteristicTempGroup2", "UnitCharacteristicTempGroup")
														end
														iTargetPlayer = iTargetPlayer + 1
													end
												end
												if (SobGroup_Count("UnitCharacteristicTempGroup2") > 0)and(SobGroup_HealthPercentage("UnitCharacteristicTempGroup2")<1) then--警戒半径内有友军
													SobGroup_Clear("UnitCharacteristicTempGroup")
													SobGroup_SobGroupAdd("UnitCharacteristicTempGroup", "UnitCharacteristicTempGroup2")
													if(SobGroup_Count("UnitCharacteristicTempGroup") > 0)then--警戒半径内有友军
														iGoAttacking = 4
													end
												end
											end
										end
										
										if(iGoAttacking == 2)then--警戒半径内有敌军
											local iDrone = 1
											while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
												if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
													if(SobGroup_IsDockedSobGroup(iDroneMotherShipName..iDrone, iGroup) == 0)then
														--SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Stop , 1)
														--SobGroup_Stop(SobGroup_OwnedBy(iDroneMotherShipName..iDrone), iDroneMotherShipName..iDrone)
														--SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Stop , 0)
														SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Attack , 1)
														SobGroup_Attack(SobGroup_OwnedBy(iDroneMotherShipName..iDrone), iDroneMotherShipName..iDrone, "UnitCharacteristicTempGroup")
														SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Attack , 0)
													else
														SobGroup_Launch(iDroneMotherShipName..iDrone, iGroup)
													end
												end
												iDrone = iDrone + 1
											end
										elseif(iGoAttacking == 3)then--警戒半径为0，采集无人机
											local iDrone = 1
											while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
												if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
													--local iDroneShipItIs = WhichShipIsIt(iDroneMotherShipName..iDrone)
													if(SobGroup_IsDockedSobGroup(iDroneMotherShipName..iDrone, iGroup) == 0)then--没有停泊
														--if(AllUnitsStates[iDroneShipItIs][17] == 0)then
														if(SobGroup_IsDoingAbility(iDroneMotherShipName..iDrone, AB_Harvest) == 0 and SobGroup_IsDoingAbility(iDroneMotherShipName..iDrone, AB_Dock) == 0)then--没有使用停泊或采集能力
															AllUnitsStates[iShip][17][iAbility][iDrone] = 1
															SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Harvest , 1)
															SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Dock , 1)
															SobGroup_Resource(SobGroup_OwnedBy(iDroneMotherShipName..iDrone), iDroneMotherShipName..iDrone)
														end
													else--停泊中
														if(AllUnitsStates[iShip][17][iAbility][iDrone] == 0)then
															SobGroup_Launch(iDroneMotherShipName..iDrone, iGroup)
														end
													end
												end
												iDrone = iDrone + 1
											end
										elseif(iGoAttacking == 4)then--警戒半径<0，维修无人机
											local iDrone = 1
											while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
												if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
													if(SobGroup_IsDockedSobGroup(iDroneMotherShipName..iDrone, iGroup) == 0)then
														SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Repair , 1)
														SobGroup_RepairSobGroup(iDroneMotherShipName..iDrone, "UnitCharacteristicTempGroup")
														SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Repair , 0)
													else
														SobGroup_Launch(iDroneMotherShipName..iDrone, iGroup)
													end
												end
												iDrone = iDrone + 1
											end
										else--不出击或警戒半径内无敌军
											local iDrone = 1
											while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
												if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
													--local iDroneShipItIs = WhichShipIsIt(iDroneMotherShipName..iDrone)
													if(AllUnitsStates[iShip][17][iAbility][iDrone] ~= 0)then
														AllUnitsStates[iShip][17][iAbility][iDrone] = 0
														SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Harvest , 0)
														SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Dock , 0)
													end
													if(SobGroup_IsDocked(iDroneMotherShipName..iDrone) == 0)then
														if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15] == 0)then
															if(SobGroup_HealthPercentage(iDroneMotherShipName..iDrone)<1)then
																SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Dock , 1)
																SobGroup_DockSobGroup(iDroneMotherShipName..iDrone, iGroup)
																SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Dock , 0)
															else
																SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Move , 1)
																SobGroup_ParadeSobGroup(iDroneMotherShipName..iDrone, iGroup, 0)
																SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Move , 0)
															end
														elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15] == 1)then
															SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Dock , 1)
															SobGroup_DockSobGroupAndStayDocked(iDroneMotherShipName..iDrone, iGroup)
															SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Dock , 0)
														else
															if SobGroup_IsGuardingSobGroup(iDroneMotherShipName..iDrone, iGroup)==0 then
																SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Guard , 1)
																SobGroup_FormStrikeGroup(iDroneMotherShipName..iDrone, "Sphere")
																SobGroup_GuardSobGroup(iDroneMotherShipName..iDrone, iGroup)
																SobGroup_AbilityActivate(iDroneMotherShipName..iDrone, AB_Guard , 0)
															end
														end
													elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15] == 0)or(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15] == 3)then
														SobGroup_Launch(iDroneMotherShipName..iDrone, iGroup)
													end
												end
												iDrone = iDrone + 1
											end
										end
									end
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "ResourceUnitFabricated")then
									if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][3] > 0)then
										iRUAddValue = iRUAddValue + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
									end
								--elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "GuardingSemaphore")then
								--	if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][13] == 0 and AllUnitsStates[iShip][iAbilityLocalNumber + 3] ~= 0)then
								--		local iGuardingTargetUnit = AllUnitsStates[iShip][iAbilityLocalNumber + 3]
								--		SobGroup_GuardSobGroup(iGroup, Units[AllUnitsStates[iGuardingTargetUnit][1]].Name.."_"..AllUnitsStates[iGuardingTargetUnit][2])
								--	end
								end
							end
						end

						if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 4)then---------------------三阶段动作
							AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 5
							local iAnim = 1
							
							while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][1][iAnim] ~= nil)do
								SobGroup_SetMadState(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][1][iAnim])
								iAnim = iAnim + 1
							end
							local iEvent = 1
							while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][2][iEvent] ~= nil)do
								FX_StopEvent(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][6][2][iEvent])
								iEvent = iEvent + 1
							end
							iEvent = 1
							while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][2][iEvent] ~= nil)do
								FX_StopEvent(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][7][2][iEvent])
								iEvent = iEvent + 1
							end
							iEvent = 1
							while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][2][iEvent] ~= nil)do
								FX_StartEvent(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][2][iEvent])
								iEvent = iEvent + 1
							end
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][5]~=nil)then
								Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][5](iGroup, iPlayer, iShip, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][6])
							end

							AllUnitsStates[iShip][iAbilityLocalNumber + 2] = Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][3]
							
							--技能执行
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfChangePower")then
								local iPower = 1
								while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iPower] ~= nil)do
									SobGroup_ChangePower(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iPower], 0)
									iPower = iPower + 1
								end
							--elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfChangePower2")then
							--	for iIndex,iWeapon in Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] do
							--		local iPower = 1
							--		while(iWeapon[iPower] ~= nil)do
							--			SobGroup_ChangePower(iGroup, iWeapon[iPower], 0)
							--			iPower = iPower + 1
							--		end
							--	end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfInvulnerability")then
								SobGroup_SetInvulnerability(iGroup, 0)
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfHardpointInvulnerability")then
								SobGroup_SetInvulnerabilityOfHardPoint(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10], 0)
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfHypespace")then
								SobGroup_AbilityActivate(iGroup, AB_Hyperspace, 0)
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfShipAbility")then
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11] ~= 0)then
									if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] == 0)then
										SobGroup_MakeSelectable(iGroup,0)
									else
										SobGroup_AbilityActivate(iGroup, AB_Table[Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]], 0)
									end
								else
									if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10] == 0)then
										SobGroup_MakeSelectable(iGroup,1)
									else
										SobGroup_AbilityActivate(iGroup, AB_Table[Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]], 1)
									end
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "CustomCode")then
								Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][12](iGroup, iPlayer, iShip)
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "DroneShip")then
								if Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][15]~=2 then
									local iDroneMotherShipName = "Drone_"..iShip.."_"..iAbility.."_"
									if(AllUnitsStates[iShip][iAbilityLocalNumber + 4] > 0)then
										local iDrone = 1
										while(iDrone <= Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11])do
											if(SobGroup_Count(iDroneMotherShipName..iDrone) > 0)then
												if(SobGroup_IsDocked(iDroneMotherShipName..iDrone) == 1)then
													if(SobGroup_IsDockedSobGroup(iDroneMotherShipName..iDrone, iGroup) == 1)then
														SobGroup_Launch(iDroneMotherShipName..iDrone, iGroup)
													end
												end
												SobGroup_TakeDamage(iDroneMotherShipName..iDrone, 1)
											end
											iDrone = iDrone + 1
										end
									end
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioShield")then
								if(AllUnitsStates[iShip][iAbilityLocalNumber + 3] > 0)then
									AllUnitsStates[iShip][iAbilityLocalNumber + 2] = Universe_GameTime() + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][14]
								end
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "SubsystemBuild")then
								local iSubsystem = 1
								while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem] ~= nil)do
									if(SobGroup_GetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem]) > 0)then
										SobGroup_SetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iSubsystem], 0)
									end
									iSubsystem = iSubsystem + 1
								end
								AllUnitsStates[iShip][iAbilityLocalNumber + 3] = 0
							end
						end
						
						if(AllUnitsStates[iShip][iAbilityLocalNumber + 1] == 5)then---------------------三阶段完成
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][8][4] == 1)then
								iSpeedMu = 0
							end
							
							
							if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioFuel")then
								iFuelCap = iFuelCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioShield")then
								iShieldCap = iShieldCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
							elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioArmor")then
								iArmorCap = iArmorCap + Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10]
							end
							
							if(Universe_GameTime() >= AllUnitsStates[iShip][iAbilityLocalNumber + 2])then
								AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 0
								
								--技能执行
								if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfChangePower")then
									local iPower = 1
									while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iPower] ~= nil)do
										SobGroup_ChangePower(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][11][iPower], 1)
										iPower = iPower + 1
									end
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "OneselfIdioShield")then
									if(AllUnitsStates[iShip][iAbilityLocalNumber] ~= 0 and AllUnitsStates[iShip][iAbilityLocalNumber + 3] > 0)then
										AllUnitsStates[iShip][iAbilityLocalNumber + 1] = 1
									end
								elseif(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][1] == "RestrictShipBuildingOption")then
									local iBuildOption = 1
									while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iBuildOption] ~= nil)do
										SobGroup_UnRestrictBuildOption(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbility][10][iBuildOption])
										iBuildOption = iBuildOption + 1
									end
								end
							end
						end

						iAbility = iAbility + 1
					end
					
					--------------------------------------------------------------------------------最终计算
					if(AllUnitsStates[iShip][14] ~= iStructure)then
						AllUnitsStates[iShip][14] = iStructure
					end
					if(iScuttle == 0)then
						if(Units[AllUnitsStates[iShip][1]].Size == 1)then
							--------------------------燃料
							AllUnitsStates[iShip][24][1] = AllUnitsStates[iShip][24][1] + iFuelValue
							AllUnitsStates[iShip][24][2] = iFuelCap
							if(AllUnitsStates[iShip][24][1] < 0)then
								AllUnitsStates[iShip][24][1] = 0
							end
							if(AllUnitsStates[iShip][24][1] > AllUnitsStates[iShip][24][2])then
								AllUnitsStates[iShip][24][1] = AllUnitsStates[iShip][24][2]
							end
							--------------------------护盾
							AllUnitsStates[iShip][20] = 0-------------增减状态
							if(iShieldValue > 0)then
								AllUnitsStates[iShip][20] = AllUnitsStates[iShip][20] + 1
							end
							
							if(AllUnitsStates[iShip][13][1] < 0)then
								AllUnitsStates[iShip][13][1] = 0
							end
							AllUnitsStates[iShip][13][1] = AllUnitsStates[iShip][13][1] + iShieldValue
							AllUnitsStates[iShip][13][2] = iShieldCap
							if(AllUnitsStates[iShip][13][1] > AllUnitsStates[iShip][13][2])then
								AllUnitsStates[iShip][13][1] = AllUnitsStates[iShip][13][2]
							end
							--------------------------装甲
							AllUnitsStates[iShip][21] = 0-------------增减状态
							if(iArmorValue > 0)then
								AllUnitsStates[iShip][21] = AllUnitsStates[iShip][21] + 1
							end
							
							if(AllUnitsStates[iShip][11][1] < 0)then
								AllUnitsStates[iShip][11][1] = 0
							end
							AllUnitsStates[iShip][11][1] = AllUnitsStates[iShip][11][1] + iArmorValue
							AllUnitsStates[iShip][11][2] = iArmorCap
							if(AllUnitsStates[iShip][11][1] > AllUnitsStates[iShip][11][2])then
								AllUnitsStates[iShip][11][1] = AllUnitsStates[iShip][11][2]
							end
							if(iArmorAbsorb > 1)then
								iArmorAbsorb = 1
							elseif(iArmorAbsorb < 0)then
								iArmorAbsorb = 0
							end
							
							if(bSubsystemDefend ~= 0)then-----------------------------子系统防护运算
								local iSubsystemOrder = 1
								while(igSubsystemDefend[iSubsystemOrder][1] ~= "")do
									local iSubsystemDamageValue = igSubsystemDefend[iSubsystemOrder][4] - igSubsystemDefend[iSubsystemOrder][5]
									--------------------------------------------------------------护盾运算
									if(iSubsystemDamageValue > 0 and iStructure > 0 and AllUnitsStates[iShip][13][1] > 0)then
										iSubsystemDamageValue = iSubsystemDamageValue * igSubsystemDefend[iSubsystemOrder][2]
										iSubsystemDamageValue = iSubsystemDamageValue - AllUnitsStates[iShip][13][1]
										if(iSubsystemDamageValue >= 0)then
											AllUnitsStates[iShip][13][1] = -1
											iSubsystemDamageValue = iSubsystemDamageValue / igSubsystemDefend[iSubsystemOrder][2]
										else
											AllUnitsStates[iShip][13][1] = iSubsystemDamageValue * -1
											iSubsystemDamageValue = 0
										end
										AllUnitsStates[iShip][20] = AllUnitsStates[iShip][20] + 2
									end
									--iSubDamageMu
									iSubsystemDamageValue = iSubsystemDamageValue * iSubDamage * iSubDamageMu
									
									if(igSubsystemDefend[iSubsystemOrder][3] == 0)then
										--------------------------------------------------------------装甲运算
										if(iSubsystemDamageValue > 0 and iStructure > 0 and AllUnitsStates[iShip][11][1] > 0)then
											local iTempSubsystemDamageValue = iSubsystemDamageValue * igSubsystemDefend[iSubsystemOrder][2]
											AllUnitsStates[iShip][11][1] = AllUnitsStates[iShip][11][1] - iTempSubsystemDamageValue * iArmorAbsorb
											if(AllUnitsStates[iShip][11][1] >= 0)then
												iSubsystemDamageValue = iSubsystemDamageValue - iSubsystemDamageValue * iArmorAbsorb
											else
												iTempSubsystemDamageValue = iTempSubsystemDamageValue - iTempSubsystemDamageValue * iArmorAbsorb - AllUnitsStates[iShip][11][3]
												iSubsystemDamageValue = iTempSubsystemDamageValue / igSubsystemDefend[iSubsystemOrder][2]
												AllUnitsStates[iShip][11][1] = 0
											end
											AllUnitsStates[iShip][21] = AllUnitsStates[iShip][21] + 2
										end
									end
									
									igSubsystemDefend[iSubsystemOrder][4] = igSubsystemDefend[iSubsystemOrder][4] - iSubsystemDamageValue
									
									iSubsystemOrder = iSubsystemOrder + 1
								end
								
								local iAbilityForSubsystem = 1
								while(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbilityForSubsystem] ~= nil)do
									if(Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbilityForSubsystem][1] == "OneselfHardPointUnderDefend")then
										local iSubsystemOrderValue = 1
										while(igSubsystemDefend[iSubsystemOrderValue][1] ~= "")do
											if(igSubsystemDefend[iSubsystemOrderValue][1] == Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbilityForSubsystem][10])then
												if(igSubsystemDefend[iSubsystemOrderValue][5] ~= igSubsystemDefend[iSubsystemOrderValue][4])then
													igSubsystemDefend[iSubsystemOrderValue][5] = igSubsystemDefend[iSubsystemOrderValue][4]
													AllUnitsStates[iShip][iAbilityLocalNumberForSubsystem + 3] = igSubsystemDefend[iSubsystemOrderValue][4]
													SobGroup_SetHardPointHealth(iGroup, Units[AllUnitsStates[iShip][1]].Ability.Characteristic[iAbilityForSubsystem][10], AllUnitsStates[iShip][iAbilityLocalNumberForSubsystem + 3])
												end
											end
											iSubsystemOrderValue = iSubsystemOrderValue + 1
										end
									end
									iAbilityForSubsystem = iAbilityForSubsystem + 1
								end
							end
							if(iDamageValue < 0)then--------------------------------------------------船体伤害换算
								iDamageValue = 0
							end
							if(iDamageValue > 0)then
								if(iStructure > 0 and AllUnitsStates[iShip][13][1] > 0)then--------------------------护盾运算
									local iTempDamageValue = iDamageValue * iStructure
									iTempDamageValue = iTempDamageValue - AllUnitsStates[iShip][13][1]
									if(iTempDamageValue >= 0)then
										AllUnitsStates[iShip][13][1] = -1
										iDamageValue = iTempDamageValue / iStructure
									else
										AllUnitsStates[iShip][13][1] = iTempDamageValue * -1
										iDamageValue = 0
									end
									AllUnitsStates[iShip][20] = AllUnitsStates[iShip][20] + 2
								end
																
								iDamageValue = iDamageValue * iDamage * iDamageMu
								
								if(iStructure > 0 and AllUnitsStates[iShip][11][1] > 0 and iDamageValue > 0)then--------------------------装甲运算
									local iTempDamageValue = iDamageValue * iStructure
									AllUnitsStates[iShip][11][1] = AllUnitsStates[iShip][11][1] - iTempDamageValue * iArmorAbsorb
									if(AllUnitsStates[iShip][11][1] >= 0)then
										iDamageValue = iDamageValue - iDamageValue * iArmorAbsorb
									else
										iTempDamageValue = iTempDamageValue - iTempDamageValue * iArmorAbsorb - AllUnitsStates[iShip][11][3]
										iDamageValue = iTempDamageValue / iStructure
										AllUnitsStates[iShip][11][1] = 0
									end
									AllUnitsStates[iShip][21] = AllUnitsStates[iShip][21] + 2
								end

							end
							
							if(iDamageValue < 0)then
								iDamageValue = 0
							end
							
							AllUnitsStates[iShip][22] = 0
							if(iRepair > 0)then
								AllUnitsStates[iShip][22] = AllUnitsStates[iShip][22] + 1
							end
							if(iDamageValue > 0)then
								AllUnitsStates[iShip][22] = AllUnitsStates[iShip][22] + 2
							end
							
							iHealth = AllUnitsStates[iShip][5] - iDamageValue + iRepair + AllUnitsStates[iShip][5] * iRepairMu
							if(iHealth < 0)then
								iHealth = 0
							elseif(iHealth > 1)then
								iHealth = 1
							end
							
							if(iHealthHold <= 0)then
								iHealth = 0
							else
								if(iHealth ~= iHealthHold)then
									SobGroup_SetHealth(iGroup, iHealth)
								end
							end
							AllUnitsStates[iShip][5] = iHealth
						end
					else
						iHealth = 0
						SobGroup_SetHealth(iGroup, iHealth)
						AllUnitsStates[iShip][5] = iHealth
					end
					
					iSpeed = iSpeed * iSpeedMu
					if(iSpeed < 0)then
						iSpeed = 0
					end
					if(SobGroup_IsDocked(iGroup) == 1)then
						iSpeed = 1
					end
					if(iSpeed ~= SobGroup_GetSpeed(iGroup))then
						SobGroup_SetMaxSpeedMultiplier(iGroup, iSpeed)
					end
					if(iBuildingSpeedKey ~= 0)then
						iBuildingSpeed = (1 + iBuildingSpeed) * iBuildingSpeedMu
						if(iBuildingSpeed ~= AllUnitsStates[iShip][7])then
							AllUnitsStates[iShip][7] = iBuildingSpeed
							SobGroup_SetBuildSpeedMultiplier(iGroup, iBuildingSpeed)
						end
					end
					if(iExperience ~= 0)then
						AllUnitsStates[iShip][15][1] = AllUnitsStates[iShip][15][1] + iExperience
						if(AllUnitsStates[iShip][15][1] > iExperienceCap)then
							AllUnitsStates[iShip][15][1] = iExperienceCap
						end
						local iCurrentLevel = DetectLevel(AllUnitsStates[iShip][15][1])
						if(iCurrentLevel ~= AllUnitsStates[iShip][15][2])then
							if(iCurrentLevel > AllUnitsStates[iShip][15][2])then
								AllUnitsStates[iShip][15][2] = iCurrentLevel
								xOverloadLevelUp(iShip)
							else
								AllUnitsStates[iShip][15][2] = iCurrentLevel
								xOverloadLevelDown(iShip)
							end
						end
						AllUnitsStates[iShip][15][4] = iExperienceCap
					end
					if(iRUAddValue ~= 0)then
						iPlayerRUGet[iPlayer + 1] = iPlayerRUGet[iPlayer + 1] + iRUAddValue
					end
					--end
					--end
					--iShip = iShip + 1
					--SkillRuningMemory = iShip
				end
	--end
	local iPlayerIdex = 0
	local iPlayerCount = Universe_PlayerCount()
	while(iPlayerIdex < iPlayerCount)do
		if(Player_IsAlive(iPlayerIdex) == 1 and iPlayerRUGet[iPlayerIdex + 1] ~= 0)then
			Player_SetRU(iPlayerIdex, (Player_GetRU(iPlayerIdex) + iPlayerRUGet[iPlayerIdex + 1]))
		end
		iPlayerIdex = iPlayerIdex + 1
	end
end
end

function DetectLevel(iExperience)
	local iLevel = 0
	while(LevelExperienceList[iLevel + 1] ~= nil and iExperience >= LevelExperienceList[iLevel + 1])do
		iLevel = iLevel + 1
	end
	--_ALERT("Level "..iLevel.." "..iExperience)
	return iLevel
end

function LockAllAbility(sSobgroup, iSelectable)
	SobGroup_AbilityActivate(sSobgroup, AB_Stop , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Attack , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Move , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Guard , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Dock , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Cloak , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Hyperspace , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_SensorPing , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_SpecialAttack , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Retire , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Scuttle , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Harvest , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Mine , 0)
	SobGroup_AbilityActivate(sSobgroup, AB_Repair , 0)
	SobGroup_MakeSelectable(sSobgroup, iSelectable)
end
