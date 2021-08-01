-----------------------------------------------
-------------------------------------公开函数
-----------------------------------------------

function xSetGlobalStateKey(iKeyNumber,iKey)--iKeyNumber iKey "On" "Off"
	if(GlobalStateKey[iKeyNumber] ~= nil)then
		if(iKey == "On")then
			GlobalStateKey[iKeyNumber] = 1
		elseif(iKey == "Off")then
			GlobalStateKey[iKeyNumber] = 0
		end
	end
end

function xGetGlobalStateKey(iKeyNumber)
	local sEnd = "On"
	if(GlobalStateKey[iKeyNumber] ~= nil)then
		if(GlobalStateKey[iKeyNumber] == 0)then
			sEnd = "Off"
		else
			sEnd = "On"
		end
	else
		sEnd = "Nil"
	end
	return sEnd
end

function xSetShipIdioStateKey(iShip,iKeyNumber,iKey)--iKeyNumber iKey "On" "Off"
	if(AllUnitsStates[iShip] ~= nil)then
		if(AllUnitsStates[iShip][4] == 0)then--change
			if(iKey == "On")then
				AllUnitsStates[iShip][19][iKeyNumber] = 1
			elseif(iKey == "Off")then
				AllUnitsStates[iShip][19][iKeyNumber] = 0
			end
		end
	end
end

function xGetShipIdioStateKey(iShip,iKeyNumber)
	local sEnd = "On"
	if(AllUnitsStates[iShip] ~= nil)then
		if(AllUnitsStates[iShip][4] == 0)and(AllUnitsStates[iShip][19][iKeyNumber] == 0)then
			sEnd = "Off"
		else
			sEnd = "On"
		end
	else
		sEnd = "Nil"
	end
	return sEnd
end

function xGetShipName(iShip)
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		return Units[AllUnitsStates[iShip][1]].Name
	else
		return ""
	end
end

function xGetShipShield(iShip)
	local iShieldPercent = 0
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		local iDividend = AllUnitsStates[iShip][13][1] / AllUnitsStates[iShip][14]
		local iDivisor = AllUnitsStates[iShip][13][2] / AllUnitsStates[iShip][14]
		if(iDivisor > 0)then
			iShieldPercent = iDividend / iDivisor
		end
	end
	return iShieldPercent
end

function xGetShipShieldValue(iShip)
	local iShieldValue = 0
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		if(AllUnitsStates[iShip][14] > 0)then
			iShieldValue = AllUnitsStates[iShip][13][1]
		end
	end
	return iShieldValue
end

function xGetShipArmor(iShip)
	local iArmorPercent = 0
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		local iDividend = AllUnitsStates[iShip][11][1] / AllUnitsStates[iShip][14]
		local iDivisor = AllUnitsStates[iShip][11][2] / AllUnitsStates[iShip][14]
		if(iDivisor > 0)then
			iArmorPercent = iDividend / iDivisor
		end
	end
	return iArmorPercent
end

function xGetShipArmorValue(iShip)
	local iArmorValue = 0
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		if(AllUnitsStates[iShip][14] > 0)then
			iArmorValue = AllUnitsStates[iShip][11][1]
		end
	end
	return iArmorValue
end

function xGetShipLevelValue(iShip)
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		return AllUnitsStates[iShip][15][2]
	else
		return -1
	end
end

function xGetShipExpValue(iShip)
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		return AllUnitsStates[iShip][15][1]
	else
		return -1
	end
end

function xAddShipExp(iShip,iExp)
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		AllUnitsStates[iShip][15][1] = AllUnitsStates[iShip][15][1] + iExp
	end
end

function xShipOffline(iShip)
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		AllUnitsStates[iShip][16] = 0
	end
end

function xShipOnline(iShip)
	if(AllUnitsStates[iShip] ~= nil and AllUnitsStates[iShip][4] == 0)then--change
		AllUnitsStates[iShip][16] = 1
	end
end

function xGroupOffline(iGroup)
	for shipID,shipData in AllUnitsStates do
		if (shipData[1]~=nil) then
			local CustomGroup=shipData[25]..shipID
			if (SobGroup_GroupInGroup(iGroup,CustomGroup)==1) then
				if(AllUnitsStates[shipID] ~= nil and AllUnitsStates[shipID][4] == 0)then--change
					AllUnitsStates[shipID][16] = 0
				end
			end
		end
	end
end

function xGroupOnline(iGroup)
	for shipID,shipData in AllUnitsStates do
		if (shipData[1]~=nil) then
			local CustomGroup=shipData[25]..shipID
			if (SobGroup_GroupInGroup(iGroup,CustomGroup)==1) then
				if(AllUnitsStates[shipID] ~= nil and AllUnitsStates[shipID][4] == 0)then--change
					AllUnitsStates[shipID][16] = 1
				end
			end
		end
	end
end

-----------------------------------------------
-------------------------------------重载函数
-----------------------------------------------

function xOverloadLevelUp(iShip)
end

function xOverloadLevelDown(iShip)
end