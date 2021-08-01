-----------------------------------
--通用家园重制版AI脚本
--作者：萨尤克教主
--cpulogic.lua
--version 1.1.2
--2020.08.19
-----------------------------------


function AddRequiredItemDemand(tRequire,iDemand)
	local iResearchDemand=GetResearchDo()
	local iDevelopDemand=GetDevelopDemand()
	for index,iRequire in tRequire do
		local iNOT=1
		if(iRequire<0)then
			iRequire=-iRequire
			iNOT=-1
		end
		if (ai_data["s"..tostring(iRequire)]==nil) then
			_ALERT("AI Script Warning: No configuration data for subsystem/research Requires.")
		elseif (ai_data["s"..tostring(iRequire)].Type=="Ship") then
			if (CanBuild(iRequire)==1) then
				--ShipDemandAdd(iRequire, iNOT*iDevelopDemand*iDemand)
				sg_AllShipDemand["s"..tostring(iRequire)]=sg_AllShipDemand["s"..tostring(iRequire)]+iNOT*iDevelopDemand*iDemand
			end
		elseif (ai_data["s"..tostring(iRequire)].Type=="Research")and(iResearchDemand==1) then
			if (CanResearch(iRequire)==1) then
				ResearchDemandAdd(iRequire, iNOT*iDevelopDemand*iDemand)
			end
		elseif (ai_data["s"..tostring(iRequire)].Type=="Subsystem") then
			if (CanBuildSubSystem(iRequire)==1) then
				if (ai_data["s"..tostring(iRequire)].IsForFleet==1 and NumSubSystems(iRequire)==0 and NumSubSystemsQ(iRequire)==0) then
					SubSystemDemandAdd(iRequire, iNOT*iDemand)
				elseif (ai_data["s"..tostring(iRequire)].IsForFleet==0) then
					SubSystemDemandAdd(iRequire, iNOT*iDevelopDemand*iDemand)
				elseif (ai_data["s"..tostring(iRequire)].IsForFleet==1 and (NumSubSystems(iRequire)==1 or NumSubSystemsQ(iRequire)==1)) then
					SubSystemDemandSet(iRequire, 0)
				end
			end
		end
	end
end

function AddRequiredItemDemandForShip(iItem,iDemand)
	local iInfo=ai_data["s"..tostring(iItem)]
	local tRequire=iInfo.Require
	local iResearchDemand=GetResearchDo()
	local iDevelopDemand=GetDevelopDemand()
	for index,iRequire in tRequire do
		local iNOT=1
		if(iRequire<0)then
			iRequire=-iRequire
			iNOT=-1
		end
		if (ai_data["s"..tostring(iRequire)]==nil) then
			_ALERT("AI Script Warning: No configuration data for "..iInfo.Name.."\'s Requires.")
		elseif (ai_data["s"..tostring(iRequire)].Type=="Ship") then
			if (CanBuild(iRequire)==1) then
				sg_AllShipDemand["s"..tostring(iRequire)]=sg_AllShipDemand["s"..tostring(iRequire)]+iNOT*iDevelopDemand*iDemand
			end
			if (CanBuild(iItem)==1) then
				ShipDemandAdd(iItem, iNOT*(1-iDevelopDemand)*NumSquadrons(iRequire))
			end
		elseif (ai_data["s"..tostring(iRequire)].Type=="Research")and(iResearchDemand==1) then
			if (CanResearch(iRequire)==1) then
				ResearchDemandAdd(iRequire, iNOT*iDevelopDemand*iDemand)
			end
			if (CanBuild(iItem)==1) then
				local UCID = GetUnitCapFamilyId(iInfo.UnitCap)
				ShipDemandAdd(iItem, iNOT*(1-iDevelopDemand)*IsResearchDone(iRequire)*(GetUnitCapMaxForFamily(UCID)-GetUnitCapForFamily(UCID)))
			end
		elseif (ai_data["s"..tostring(iRequire)].Type=="Subsystem") then
			if (CanBuildSubSystem(iRequire)==1) then
				if (ai_data["s"..tostring(iRequire)].IsForFleet==1 and NumSubSystems(iRequire)==0 and NumSubSystemsQ(iRequire)==0) then
					SubSystemDemandAdd(iRequire, iNOT*iDemand)
				elseif (ai_data["s"..tostring(iRequire)].IsForFleet==0) then
					SubSystemDemandAdd(iRequire, iNOT*iDevelopDemand*iDemand)
				elseif (ai_data["s"..tostring(iRequire)].IsForFleet==1 and (NumSubSystems(iRequire)==1 or NumSubSystemsQ(iRequire)==1)) then
					SubSystemDemandSet(iRequire, 0)
				end
			end
			if (CanBuild(iItem)==1) then
				ShipDemandAdd(iItem, (1-iDevelopDemand)*NumSubSystems(iRequire))
			end
		end
	end
end

function AddRequiredItemDemandForSubsystem(iItem,iDemand)
	local iInfo=ai_data["s"..tostring(iItem)]
	local tRequire=iInfo.Require
	local iResearchDemand=GetResearchDo()
	local iDevelopDemand=GetDevelopDemand()
	for index,iRequire in tRequire do
		local iNOT=1
		if(iRequire<0)then
			iRequire=-iRequire
			iNOT=-1
		end
		if (ai_data["s"..tostring(iRequire)]==nil) then
			_ALERT("AI Script Warning: No configuration data for subsystem Requires.")
		elseif (ai_data["s"..tostring(iRequire)].Type=="Ship") then
			if (CanBuild(iRequire)==1) then
				sg_AllShipDemand["s"..tostring(iRequire)]=sg_AllShipDemand["s"..tostring(iRequire)]+iNOT*iDevelopDemand*iDemand
			end
			--if (CanBuildSubSystem(iItem)==1) then
				SubSystemDemandAdd(iItem, iNOT*(1-iDevelopDemand)*NumSquadrons(iRequire))
			--end
		elseif (ai_data["s"..tostring(iRequire)].Type=="Research")and(iResearchDemand==1) then
			if (CanResearch(iRequire)==1) then
				ResearchDemandAdd(iRequire, iNOT*iDevelopDemand*iDemand)
			end
			--if (CanBuildSubSystem(iItem)==1) then
				SubSystemDemandAdd(iItem, iNOT*(1-iDevelopDemand+IsResearchDone(iRequire)))
			--end
		elseif (ai_data["s"..tostring(iRequire)].Type=="Subsystem") then
			if (CanBuildSubSystem(iRequire)==1) then
				if (ai_data["s"..tostring(iRequire)].IsForFleet==1 and NumSubSystems(iRequire)==0 and NumSubSystemsQ(iRequire)==0) then
					SubSystemDemandAdd(iRequire, iNOT*iDemand)
				elseif (ai_data["s"..tostring(iRequire)].IsForFleet==0) then
					SubSystemDemandAdd(iRequire, iNOT*iDevelopDemand*iDemand)
				elseif (ai_data["s"..tostring(iRequire)].IsForFleet==1 and (NumSubSystems(iRequire)==1 or NumSubSystemsQ(iRequire)==1)) then
					SubSystemDemandSet(iRequire, 0)
				end
			end
			--if (CanBuildSubSystem(iItem)==1) then
				SubSystemDemandAdd(iItem, (1-iDevelopDemand)*NumSubSystems(iRequire))
			--end
		end
	end
end

function GetDevelopDemand()
	local enemyMilitaryCount = PlayersMilitaryPopulation( s_enemyIndex, player_max )
	local iDemand=GetRU()/sg_RUsPerChannel
	if (enemyMilitaryCount >= 3)and(s_selfTotalValue>100) then
		if(s_selfTotalValue>1.5*s_enemyTotalValue)then
			iDemand=-1
		elseif(s_selfTotalValue<0.67*s_enemyTotalValue)then
			iDemand=-1
		end
	end
	return min(1,iDemand)
end

function BuildChannelCount()
	local	iChannel1=0
	local	iChannel2=0
	for item,item_info in ai_data do
		if(item_info.Type=="Ship")then
			if(item_info.BuildShipChannel~=nil)then
				iChannel1=iChannel1+NumSquadrons(item_info.ID)*item_info.BuildShipChannel
			end
			if(item_info.BuildSubsystemChannel~=nil)then
				iChannel2=iChannel2+NumSquadrons(item_info.ID)*item_info.BuildSubsystemChannel
			end
		end
	end
	return iChannel1,iChannel2
end

function GetResearchDo()
	local iDo=0
	local threatlevel = UnderAttackThreat()
	if (threatlevel > 100)and(GetRU()<10*UnderAttackThreat()) then
		return iDo
	end		
	local timeSinceLastResearch = gameTime() - sg_lastResearchTime
	if timeSinceLastResearch > sg_researchDelayTime then
		iDo=1
		sg_lastResearchTime = gameTime();
	end
	return iDo
end

function BuildDemandGet()
	CpuBuild_RemoveBuildItems()
	if (Override_ShipDemand) then
		Override_ShipDemand()
	else
		CpuBuild_DefaultShipDemandRules()
	end
end

function SpecialUnitSizeControl()
	for item,item_info in ai_data do
		if(item_info.Type=="Ship")then
			local item_num=NumSquadrons(item_info.ID)
			if (item_info.SizeControl~=nil) then
				if (item_info.SizeControl[1]==nil)or(item_info.SizeControl[2]==nil)or(item_info.SizeControl[1]>31)or(item_info.SizeControl[1]<0) then
					_ALERT("AI Script Warning: Invalid SizeControl data.")
				else
					local target_num=numQueueOfClass(item_info.SizeControl[1])
					if (item_num>=item_info.SizeControl[2]*target_num)and(item_num~=0) then
						ShipDemandSet(item_info.ID, -10000)
					end
				end
			end
		end
	end			
end

function AllDemandPreset()
	for item,item_info in ai_data do
		if(item_info.Type==nil)then
			_ALERT("AI Script Warning: No Type info for configuration item.")
		elseif (item_info.Type=="Ship") then
			sg_AllShipDemand[item]=0
			if(item_info.BasicDemand~=nil)then
				ShipDemandSet(item_info.ID, item_info.BasicDemand)
			else
				_ALERT("AI Script Warning: No Basic Demand for "..item_info.Name)
			end
			if(item_info.LODDemand~=nil)then
				if(item_info.LODDemand[g_LOD]~=nil)then
					ShipDemandAdd(item_info.ID, item_info.LODDemand[g_LOD])
				elseif(g_LOD~=0)then
					_ALERT("AI Script Warning: No LOD["..g_LOD.."] Demand for "..item_info.Name)
				end
			end
			if(item_info.AddDemand~=nil)then
				for GruopIndex,DemandGroup in item_info.AddDemand do
					ShipDemandAdd(item_info.ID, DemandGroup[2]*NumSquadrons(DemandGroup[1]))
				end
			end
			if(item_info.UnitCap~=nil)then
				local UCID=GetUnitCapFamilyId(item_info.UnitCap)
				if GetUnitCapForFamily(UCID)==GetUnitCapMaxForFamily(UCID) then
					ShipDemandSet(item_info.ID, -100)
				end
			else
				_ALERT("AI Script Warning: No UnitCap for "..item_info.Name)
			end
		elseif (item_info.Type=="Research")then
			if(item_info.BasicDemand~=nil)then
				ResearchDemandSet(item_info.ID, item_info.BasicDemand)
			else
				_ALERT("AI Script Warning: No Basic Demand for "..item_info.Name)
			end
		elseif (item_info.Type=="Subsystem") then
			if(item_info.BasicDemand~=nil)then
				SubSystemDemandSet(item_info.ID, item_info.BasicDemand)
			else
				_ALERT("AI Script Warning: No Basic Demand for "..item_info.Name)
			end
			if(item_info.AddDemand~=nil)then
				for GruopIndex,DemandGroup in item_info.AddDemand do
					SubSystemDemandAdd(item_info.ID, DemandGroup[2]*NumSquadrons(DemandGroup[1]))
				end
			end
			if(item_info.LODDemand~=nil)then
				if(item_info.LODDemand[g_LOD]~=nil)then
					SubSystemDemandAdd(item_info.ID, item_info.LODDemand[g_LOD])
				elseif(g_LOD~=0)then
					_ALERT("AI Script Warning: No LOD["..g_LOD.."] Demand for "..item_info.Name)
				end
			end
		elseif (item_info.Type~=nil) then
			_ALERT("AI Script Warning: Unknown Type: "..item_info.Name)
		end
	end
end

function AllDemandGet()
	AllDemandPreset()
	BuildDemandGet()
	for item,item_info in ai_data do
		if(item_info.Type==nil)then
		elseif(item_info.Type=="Ship")then
			local itemDemand=ShipDemandGet(item_info.ID)
			if(itemDemand~=0)then
				AddRequiredItemDemandForShip(item_info.ID,itemDemand)
			end
		elseif(item_info.Type=="Research")then
			local itemDemand=ResearchDemandGet(item_info.ID)
			if(CanResearch(item_info.ID)~=1)and(itemDemand~=0)then
				AddRequiredItemDemand(item_info.Require,itemDemand)
			end
		elseif(item_info.Type=="Subsystem")then
			local itemDemand=SubSystemDemandGet(item_info.ID)
			if(itemDemand~=0)then
				AddRequiredItemDemandForSubsystem(item_info.ID,itemDemand)
			end
		end
	end			
	for item,item_info in ai_data do
		if(item_info.Type==nil)then
		elseif(item_info.Type=="Ship")then
			ShipDemandAdd(item_info.ID, sg_AllShipDemand[item])
		end
	end
end

function CalcOpenBuildChannels()
	local numShipsBuildingShips = NumShipsBuildingShips()
	local numShipsBuildingSubSystems = NumShipsBuildingSubSystems()
	local numShipsBuilding = numShipsBuildingShips + numShipsBuildingSubSystems
	local researchItem = IsResearchBusy()
		
	local numItemsBuilding = numShipsBuilding + researchItem
	local BuildShipChannel,BuildSubsystemChannel = BuildChannelCount()
	local numCollecting = GetNumCollecting()
	local numRUs = GetRU()
	sg_allowedBuildChannels = numCollecting/sg_numCollectorPerChannel + floor(numRUs/sg_RUsPerChannel)
	s_numOpenBuildChannels = sg_allowedBuildChannels - numItemsBuilding
	s_shipBuildQueuesFull = 0
	s_subsystemBuildQueuesFull = 0
	if (BuildShipChannel <= numShipsBuildingShips) then
		s_shipBuildQueuesFull = 1
	end
	if (BuildSubsystemChannel <= numShipsBuildingSubSystems) then
		s_subsystemBuildQueuesFull = 1
	end
	if (s_numOpenBuildChannels <= -1.5) then		
		RemoveLeastNeededItem()		
	end
end

function CacheCurrentState()
	s_militaryPop = PlayersMilitaryPopulation( s_playerIndex, player_total );
	s_selfTotalValue = PlayersMilitary_Total( s_playerIndex, player_total );
	s_enemyTotalValue = PlayersMilitary_Total( player_enemy, player_max );
	s_militaryStrength = PlayersMilitary_Threat( player_enemy, player_min );
	s_enemyIndex = GetChosenEnemy()
	s_militaryStrengthVersusTarget = 0
	if (s_enemyIndex ~= -1) then
		s_militaryStrengthVersusTarget = PlayersMilitary_Threat( s_enemyIndex, player_max )
	end	
	if gameTime()<300 then
		if (s_initialstrength==0) then
			s_initialstrength = s_enemyTotalValue/PlayersAlive( player_enemy )
		elseif s_enemyTotalValue/PlayersAlive( player_enemy )>s_initialstrength and t_firstgrow==0 then
			t_firstgrow = floor(gameTime())
		end
		s_rushthreat=(s_enemyTotalValue/PlayersAlive( player_enemy ) - s_initialstrength)/(gameTime()-t_firstgrow)
	end
end

function ClearUnbuildableDemand()
	for item,item_info in ai_data do
		if(item_info.Type==nil)then
		elseif (item_info.Type=="Ship") then
			if (CanBuild(item_info.ID)~=1) then
				ShipDemandSet(item_info.ID, 0)
			end
		elseif (item_info.Type=="Research")then
			if (CanResearch(item_info.ID)~=1) then
				ResearchDemandSet(item_info.ID, 0)
			end
		end
	end
end

function SpendMoney()
	if (s_numOpenBuildChannels > 0) then
		local buildHasBeenDone = 0
		AllDemandGet();
		if (sg_dobuild==1 and (s_shipBuildQueuesFull==0 or s_subsystemBuildQueuesFull==0) and sg_reseachDemand<0) then
			ClearUnbuildableDemand()
			if (CpuBuild_Process() == 1) then
				s_numOpenBuildChannels = s_numOpenBuildChannels-1		
				sg_reseachDemand = sg_reseachDemand + 1				
				buildHasBeenDone = 1
			end
		end
		if (s_numOpenBuildChannels > 0) then
			if (sg_doresearch==1) then
				ClearUnbuildableDemand()
				local didResearch = CpuResearch_Process();
				if (didResearch == 1) then
					sg_reseachDemand = -sg_kDemandResetValue
				else
					if (sg_reseachDemand>=0 and sg_dobuild==1 and (s_shipBuildQueuesFull==0 or s_subsystemBuildQueuesFull==0) and buildHasBeenDone == 0) then
						ClearUnbuildableDemand()
						CpuBuild_Process()
					end
				end
			else
				sg_reseachDemand = -sg_kDemandResetValue
			end
		end
	end	
end

function doai()	
	CacheCurrentState();
	CalcOpenBuildChannels();	
	local timeSinceLastSubSysDemand = gameTime() - sg_lastSpendMoneyTime	
	if (timeSinceLastSubSysDemand >= sg_spendMoneyDelay) then		
		SpendMoney()
		sg_lastSpendMoneyTime = gameTime()
	end

	local cpuplayers_norushtime = 60					
	
	if CPUPLAYERS_NORUSHTIME5 ~= nil then
		if IsResearchDone( CPUPLAYERS_NORUSHTIME5 ) == 1 then
			cpuplayers_norushtime = 5*61.2			
		elseif IsResearchDone( CPUPLAYERS_NORUSHTIME10 ) == 1 then
			cpuplayers_norushtime = 10*61.2			
		elseif IsResearchDone( CPUPLAYERS_NORUSHTIME15 ) == 1 then
			cpuplayers_norushtime = 15*61.2			
		end			
	end
	
	if (sg_domilitary==1) and (gameTime() > cpuplayers_norushtime) then		
		CpuMilitary_Process();
	end
end



