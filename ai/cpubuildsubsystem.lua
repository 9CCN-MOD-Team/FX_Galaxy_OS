-----------------------------------
--通用家园重制版AI脚本
--作者：萨尤克教主
--cpubuildsubsystem.lua
--version 1.1.2
--2020.08.19
-----------------------------------

function CpuBuildSS_Init()
end

function GetSubBuiltOnSlot(shipID,iSlotData)
	local buildShip = BuildShipType( shipID )
	local iSubBuilt=0
	local iSubIndex=1
	while (iSlotData[iSubIndex]~=nil) do
		if (BuildShipHasSubSystem( shipID, iSlotData[iSubIndex] )==1) then
			iSubBuilt=iSubBuilt+1
		end
		iSubIndex=iSubIndex+1
	end
	return iSubBuilt
end

function HighestSSPriority()
	local iMaxDemand=0
	for item,item_info in ai_data do
		if(item_info.Type==nil)then
		elseif (item_info.Type=="Subsystem") then
			if (CanBuildSubSystem(item_info.ID)==1)and(item_info.BasicDemand~=nil) then
				local iDemand=SubSystemDemandGet(item_info.ID)-item_info.BasicDemand
				if (iDemand>iMaxDemand) then
					iDemand=iMaxDemand
				end
			end
		end
	end
	return iMaxDemand
end

function CpuBuildSS_ProcessEachBuildShip()
	local builtSubsystem = 0
	local bcount = BuildShipCount()
	if (bcount == 0) then
		return 0
	end
	for i=0, (bcount-1) do
		local buildShipId = BuildShipAt( i )
		local buildShip = BuildShipType( buildShipId )
		local retiredSubsystem = 0
		local iDevelopDemand=GetDevelopDemand()
		local iMaxSSDemand=HighestSSPriority()
		if (ai_data["s"..tostring(buildShip)]~=nil) then
			if(ai_data["s"..tostring(buildShip)].UpgradeDemand==nil)then
				_ALERT("AI Script Warning: No Upgrade Demand for ship.")
			elseif (iDevelopDemand*ai_data["s"..tostring(buildShip)].UpgradeDemand>iMaxSSDemand) then
				if (ai_data["s"..tostring(buildShip)].UpgradeSubsystem~=nil) then
					for iSlot, slotdata in ai_data["s"..tostring(buildShip)].UpgradeSubsystem do
						local TotalSub=getn(slotdata)-1
						local TotalSlot=slotdata[1]
						if (TotalSlot==nil) then
							_ALERT("AI Script Warning: Invalid UpgradeSubsystem data.")
							return 0
						end
						local EmptySlot=TotalSlot-GetSubBuiltOnSlot(buildShipId,slotdata)
						if (EmptySlot>0)and(builtSubsystem==0) then
							local iPriority=2
							local iMaxDemand=-10000
							local iMaxDemandSub=0
							while(slotdata[iPriority]~=nil)do
								local iSubsystem=slotdata[iPriority]
								if (BuildShipHasSubSystem( buildShipId, iSubsystem )==0 and BuildShipCanBuild( buildShipId, iSubsystem) == 1) then
									local iDemand=SubSystemDemandGet(iSubsystem)
									if(iDemand>iMaxDemand)then
										iMaxDemand=iDemand
										iMaxDemandSub=iPriority
									end
								end
								iPriority=iPriority+1
							end
							if(iMaxDemandSub~=0)and(iMaxDemand>0)then
if(	sg_debug==1) then _ALERT("Player:"..s_playerIndex.."|RU:"..GetRU().."|"..ai_data["s"..tostring(buildShip)].Name.." Upgrade:"..ai_data["s"..tostring(slotdata[iMaxDemandSub])].Name.."|Demand:"..SubSystemDemandGet(slotdata[iMaxDemandSub])) end
								BuildSubSystemOnShip( buildShipId, slotdata[iMaxDemandSub] )
								builtSubsystem = 1
							end
						elseif (EmptySlot<=0)and(TotalSub>TotalSlot)and(retiredSubsystem==0) then
							local iPriority=2
							local iMaxDemand=-10000
							local iMinDemand=10000
							local iMaxDemandSub=0
							local iMinDemandSub=0
							while(slotdata[iPriority]~=nil)do
								local iSubsystem=slotdata[iPriority]
								if (BuildShipHasSubSystem( buildShipId, iSubsystem )==0) then
									local iDemand=SubSystemDemandGet(iSubsystem)
									if(iDemand>iMaxDemand)then
										iMaxDemand=iDemand
										iMaxDemandSub=iPriority
									end
								elseif (NumSubSystems(iSubsystem)>1) then
									local iDemand=SubSystemDemandGet(iSubsystem)
									if(iDemand<iMinDemand)then
										iMinDemand=iDemand
										iMinDemandSub=iPriority
									end
								end
								iPriority=iPriority+1
							end
							if(iMaxDemand>iMinDemand+20)and(iMinDemandSub~=0)then
								if(ai_data["s"..tostring(slotdata[iMinDemandSub])]~=nil)then
									if(ai_data["s"..tostring(slotdata[iMinDemandSub])].RetireRequire~=nil)then
										local kRetire=1
										for jRequire,jSubsystem in ai_data["s"..tostring(slotdata[iMinDemandSub])].RetireRequire do
											if (BuildShipHasSubSystem( buildShipId, jSubsystem )==0) then
												kRetire=0
												break
											end
										end
										if (kRetire==1) then
if(	sg_debug==1) then _ALERT("Player:"..s_playerIndex.."|RU:"..GetRU().."|"..ai_data["s"..tostring(buildShip)].Name.." Retire:"..ai_data["s"..tostring(slotdata[iMinDemandSub])].Name.."|Demand:"..SubSystemDemandGet(slotdata[iMinDemandSub])) end
											RetireSubSystem( buildShipId, slotdata[iMinDemandSub] )
											retiredSubsystem = 1
										end
									else
if(	sg_debug==1) then _ALERT("Player:"..s_playerIndex.."|RU:"..GetRU().."|"..ai_data["s"..tostring(buildShip)].Name.." Retire:"..ai_data["s"..tostring(slotdata[iMinDemandSub])].Name.."|Demand:"..SubSystemDemandGet(slotdata[iMinDemandSub])) end
										RetireSubSystem( buildShipId, slotdata[iMinDemandSub] )
										retiredSubsystem = 1
									end
								end
							end
						end
					end
				end
			end
		else
			_ALERT("AI Script Warning: No configuration data found for build ship.")
		end
	end
	return builtSubsystem
end

function ClearUnbuildableSSDemand()
	for item,item_info in ai_data do
		if(item_info.Type==nil)then
		elseif (item_info.Type=="Subsystem") then
			if (CanBuildSubSystem(item_info.ID)~=1) then
				SubSystemDemandSet(item_info.ID, -10)
			end
		end
	end
end

function CpuBuildSS_DoBuildSubSystem()
	if (Override_SubSystemDemand) then
		Override_SubSystemDemand()
	else
		if (CpuBuildSS_DefaultSubSystemDemandRules ~= nil) then
			CpuBuildSS_DefaultSubSystemDemandRules()
		end
	end
	local subSystemId = 0
	
	if (sg_dosubsystems == 1) then
		subSystemId = FindHighDemandSubSystem()
	end
	
	if (subSystemId > 0) then
		sg_subSystemOverflowDemand = 0
	
		if (CpuBuildSS_ProcessEachBuildShip() == 1) then
			return 1
		end
		ClearUnbuildableSSDemand()
		subSystemId = FindHighDemandSubSystem()
		if (subSystemId > 0) then
			if (ai_data["s"..tostring(subSystemId)]==nil) then
				_ALERT("AI Script Warning: No Upgrade Demand for subsystem.")
			elseif(ai_data["s"..tostring(subSystemId)].UpgradeOnly~=1)then
if(	sg_debug==1) then _ALERT("Player:"..s_playerIndex.."|RU:"..GetRU().."|Build:"..ai_data["s"..tostring(subSystemId)].Name.."|Demand:"..SubSystemDemandGet(subSystemId)) end
				BuildSubSystem( subSystemId )
			end
		end
		return 1
	end
	return 0
end
