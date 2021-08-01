function addAbility(iType, iAbility, ...) 
	iType.ability[iAbility]=arg
end
function addAnimTurretSound() end 
function addCustomCode() end
function addMagneticField(iType, iAbility, ...) 
	iType.ability[iAbility]=arg
end
function AddNebulaAbility() end
function AddNebulaMultiplier() end
function addShaderProp() end
function addShield() end
function AddShipAbility() end
function AddShipMultiplier() end
function AddSubSystemAbility() end
function AddSubSystemMultiplier() end
function AddWeaponResult() end

function doesShipHaveTag(sTag) 
  return 0
end
     
function doRulesHaveTag(...)
  return call(GetRulesHasTag, arg)
end
    
function getRulesFormat(...)
  return call(GetRulesFormat, arg)
end
function getRulesName(...)
  return call(GetRulesName, arg)
end
function getRulesNum(...)
  return call(UI_RulesGetNumber, arg)
end
function getRulesStr(...)
  return call(UI_RulesGetString, arg)
end
function getShipNum(sNum)
  return 0
end
function getShipStr(sStr)
  return ""
end
    

function import() end
function LoadHODFile() end 
function loadLatchPointList() end 
function LoadModel() end
function LoadSharedModel() end 
function loadShipPatchList() end
function mc() end
function mc_init() end 
function p_import() end 
function p_setpath () end
function printShipsFile() end
function resourceAttackMode() end
function setAccuracy() end
function setAccuracyFalloff() end
function setAngles() end
function setBallistics() end
function setCollisionDamageFromModifier() end
function setCollisionDamageToModifier() end
function setConcurrentBuildLimit() end
function setDamageFalloff() end
function setDamageMultFactor() end
function setEngineBurn() end
function setEngineGlow() end
function setEngineTrail() end
function setFireMultFactor() end
function setFrustratedTimers() end
function setGrouping() end
function setLeading() end
function setLifetimeMult() end
function setMagneticFieldPenetration() end
function setMiscValues() end
function setMissileKiller() end
function setMissProperties() end
function setPenetration() end
function setRangeBoost() end
function setRangeByStance() end
function setShaderChannels() end
function setSpecialDieTime() end
function setSpeedvsAccuracyAgainst() end
function setSpeedvsAccuracyApplied() end
function setSupplyValue(iType,iFamily,iValue)
	iType.UnitCap[iFamily]=iValue
end
function setTacticsMults() end
function setTargetAxis() end
function setTargetBox() end
function SpawnAsteroidOnDeath() end
function SpawnDustCloudOnDeath() end
function SpawnSalvageOnDeath() end
function StartAsteroidConfig() end
function StartCloudConfig() end
function StartDustCloudConfig() end
function StartMissileConfig() end
function StartNebulaConfig() end
function StartPebbleConfig() end
function StartSalvageConfig() end
function StartShipHardPointConfig(iData, iHardPointName, iPosition, iHardpointType, iSubType, iHPType, iInnate, ...)
	if iData.Hardpoint==nil then
		iData.Hardpoint={}
	end
	local l_HardPoint=
	{
		HardpointType=iHardpointType,
		SubType=iSubType,
		HPType=iHPType,
		Innate=iInnate,
		Subs=arg,
	}
	tinsert(iData.Hardpoint,l_HardPoint)
	iData.Hardpoint.n=nil
end
function StartShipWeaponConfig(iData,iWeapon,iPoint,iFX)
	if iData.Weapon==nil then
		iData.Weapon={}
	end
	if iData.Weapon[iPoint]==nil then
		iData.Weapon[iPoint]={}
	end
	tinsert(iData.Weapon[iPoint],iWeapon)
end

function StartSubSystemConfig()
	local Data={}
	return Data
end

function StartSubSystemWeaponConfig(iData,iWeapon,iPoint,iFX)
	if iData.Weapon==nil then
		iData.Weapon={}
	end
	if iData.Weapon[iPoint]==nil then
		iData.Weapon[iPoint]={}
	end
	tinsert(iData.Weapon[iPoint],iWeapon)
end

function StartWeaponConfig() end

function supplyLimit(iFamily,iCap)
	if Data_UnitCap==nil then
		Data_UnitCap={}
	end
	Data_UnitCap[strupper(iFamily)]=iCap
end
function supplyIndent() end
function supplyShow() end
function supplyDesc() end
function StartShipConfig()
	local Data=
	{
		fighterValue=0,
		corvetteValue=0,
		frigateValue=0,
		antiFighterValue=0,
		antiCorvetteValue=0,
		antiFrigateValue=0,
		totalValue=0,
		ability={},
		UnitCap={},
	}
	return Data
end

function GetItemData(iType,iName,iIndex)
	local iReturn
	if iType==0 then
		dofilepath("data:ship/"..iName.."/"..iName..".ship")
		iReturn=NewShipType
		NewShipType={}
		if iIndex==nil then
			return iReturn
		elseif iReturn~= nil then
			return iReturn[iIndex]
		end
	elseif iType==1 then
		dofilepath("data:subsystem/"..iName.."/"..iName..".subs")
		iReturn=NewSubSystemType
		NewSubSystemType={}
		if iIndex==nil then
			return iReturn
		elseif iReturn~= nil then
			return iReturn[iIndex]
		end
	else
		return 0
	end
	return
end

function GetUnitCapData(iPlayer)
	dofilepath("data:/scripts/rules/"..GetRulesName().."/unitcaps/default.lua")
	dofilepath("data:/scripts/rules/"..GetRulesName().."/unitcaps/"..GetGameSettingAsString("unitcaps")..".lua")
	dofilepath("data:/scripts/races/"..Race_GetName(Player_GetRace(iPlayer)).."/"..GetRulesName().."/unitcaps/"..GetGameSettingAsString("unitcaps")..".lua")
	return Data_UnitCap
end