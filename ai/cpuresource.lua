-----------------------------------
--通用家园重制版AI脚本
--作者：萨尤克教主
--cpuresource.lua
--version 1.1.2
--2020.08.19
-----------------------------------


function CpuResource_Init()
	cpResourcersPerPath = 3.5
	cpNumCollectorsPerLatchPoint = 2.0
	cpMaxThreatAddedDistance = 6000
	cpMinThreatAddedDistance = 12000

	sg_minNumCollectors = 6 
	sg_maxNumCollectors = 22
	
	if (Override_ResourceInit) then
		Override_ResourceInit()
	end
end

function CalcDesiredNumCollectors()
	local baseCollectors = 12*(sg_numCollectorPerChannel/4)
	local collectorsToMilitary = 0.3
	if(g_LOD == 0) then		
		baseCollectors = 3*(sg_numCollectorPerChannel/4)
		collectorsToMilitary = 0.9
	elseif(g_LOD == 1) then		
		baseCollectors = 6*(sg_numCollectorPerChannel/4)
		collectorsToMilitary = 0.7
	elseif(g_LOD == 2) then		
		baseCollectors = 9*(sg_numCollectorPerChannel/4)
		collectorsToMilitary = 0.5
	end
	local maxCollectorsForMilitary = baseCollectors
    if (s_militaryPop > 0) then
		maxCollectorsForMilitary = maxCollectorsForMilitary + (s_militaryPop * collectorsToMilitary)
	end
	local numRU = GetRU()
	--local BuildShipChannel,BuildSubsystemChannel = BuildChannelCount()
	--sg_desiredNumCollectors = sg_numCollectorPerChannel*(BuildShipChannel+NumShipsBuildingSubSystems()+IsResearchBusy()-floor(numRU/sg_RUsPerChannel))
	if (sg_desiredNumCollectors < baseCollectors) then
		sg_desiredNumCollectors = baseCollectors
	end
	if(sg_desiredNumCollectors >= maxCollectorsForMilitary) then
		sg_desiredNumCollectors = maxCollectorsForMilitary
	end
	if (numRU > sg_ForceBuilderRU) then
		sg_desiredNumCollectors = 0
	end
	
	local threatLevel = UnderAttackThreat();
	if (threatLevel > 0) then			
		if(numRU > (NumShipsBuildingShips()+NumShipsBuildingSubSystems()+IsResearchBusy())*sg_RUsPerChannel) then
			sg_desiredNumCollectors = 0
		else
			sg_desiredNumCollectors = sg_desiredNumCollectors - (threatLevel/50+1)
		end
	end
end

function DoResourceBuild()
	CalcDesiredNumCollectors()
	local numCollectors = numQueueOfClass( eCollector )
	if (numCollectors < sg_desiredNumCollectors ) then
		if (ai_data["s"..tostring(sg_kCollector)]~=nil)and(CanBuild(sg_kCollector)==1) then
if(	sg_debug==1) then _ALERT("Player:"..s_playerIndex.."|RU:"..GetRU().."|Build:"..ai_data["s"..tostring(sg_kCollector)].Name.."|BuildDemand:"..ShipDemandGet(sg_kCollector)) end
			Build( sg_kCollector )
			return 1
		end
	end
	if(GetNumberOfIdleRefineries() <= 0) then       
		if (UnderAttackThreat() > -75) then
			return 0
		end
		local numberOfActiveBlobs = GetActiveBlobCount()
		local neededRefineries = 0
		local neededSalvageDropOffs = 0
		if (numberOfActiveBlobs>0) then
			for activeIndex = 0 , (numberOfActiveBlobs-1) do
				local blobIndex = GetActiveBlobAt(activeIndex)
				local collectors = CollectorsAtBlob(blobIndex)
				local refineryCapacity = CollectorCapacityOfRefineriesAtBlob(blobIndex)
				if(collectors > refineryCapacity) then                
					if(IsSalvage(blobIndex) ~= 0) then
						neededSalvageDropOffs = neededSalvageDropOffs + 1
					else
						neededRefineries = neededRefineries + 1
					end
				end
			end
		end
		local numRefineriesQueued = numQueueOfClass( eDropOff )-numActiveOfClass( s_playerIndex, eDropOff )
		if(sg_resourceControllerRequests ~= 0 and neededRefineries > 0 and numRefineriesQueued==0) then
            --aitrace("Requested BUILD refinery"..neededRefineries)
			ShipDemandAddByClass( eRefinery, sg_resourceControllerRequests*neededRefineries )
		end
		local numSalDropsQueued = numQueueOfClass( eSalvageDropOff )-numActiveOfClass( s_playerIndex, eSalvageDropOff )
		if(sg_resourceControllerRequests ~= 0 and neededSalvageDropOffs > 0 and numSalDropsQueued==0 and UnderAttackThreat() < -75) then
            --aitrace("Requested BUILD salvage drop-off"..neededRefineries)
			ShipDemandAddByClass( eSalvageDropOff, sg_resourceControllerRequests*neededSalvageDropOffs )
		end
	end
	return 0
end	
