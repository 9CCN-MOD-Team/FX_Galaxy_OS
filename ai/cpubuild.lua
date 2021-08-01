-----------------------------------
--通用家园重制版AI脚本
--作者：萨尤克教主
--cpubuild.lua
--version 1.1.2
--2020.08.19
-----------------------------------

dofilepath("data:ai/cpuresource.lua")
dofilepath("data:ai/cpubuildsubsystem.lua")

function CpuBuild_PersonalityDemand()
	sg_classPersonalityDemand = {}
	sg_classPersonalityDemand[ eCollector ] = - GetRU()/100
	if (g_LOD >= 2) then
		if (sg_classPersonalityDemand[ ePlatform ]==nil) then
			sg_classPersonalityDemand[ ePlatform ] = - 5
		else
			sg_classPersonalityDemand[ ePlatform ] = sg_classPersonalityDemand[ ePlatform ] - 5
		end
	end
end

function CpuBuild_Init()
	CpuBuildSS_Init()
	CpuResource_Init()
	ForceBuilderRUTable={2.5,2,1.5,1}
	sg_resourceDemand = 1
	sg_militaryDemand = 1
	s_initialstrength=0
	t_firstgrow=0
	sg_randScoutStartBuildTime = 30+Rand(120)	
	sg_randFavorShipType = Rand(100)
	sg_AllShipDemand={}
	cpuplayers_norushtime=Rules_GetSettingNumber("norushtime", 0)*61.2
	
	CpuBuild_PersonalityDemand()
	
	sg_subSystemDemand = 0
	sg_shipDemand = 4
	sg_subSystemOverflowDemand = sg_shipDemand
	sg_militaryToBuildPerCollector = 1
	sg_ExtramilitaryToBuildPerCollector = 0
	if (g_LOD == 0) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Easy
		cp_shipDemandRange = 2
		cp_subSystemDemandRange = 2
	elseif (g_LOD == 1) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Med
		cp_shipDemandRange = 1
		cp_subSystemDemandRange = 1
	elseif (g_LOD == 2) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Hard
		cp_shipDemandRange = 0.5
		cp_subSystemDemandRange = 0.5
	elseif (g_LOD == 3) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Expert
		cp_shipDemandRange = 0.25
		cp_subSystemDemandRange = 0.25
	end

	if (Override_BuildDemandInit) then
		Override_BuildDemandInit()
	end
end

function DetermineClassDemand()
	for i=0, eMaxCount do
		if (sg_classPersonalityDemand[ i ] and sg_classPersonalityDemand[ i ]~=0) then
			ShipDemandAddByClass( i, sg_classPersonalityDemand[ i ] );
		end
	end
	ShipDemandSetByClass( eUselessShips, -10 )
end

function DetermineAntiChassisDemand(enemyIndex)
	local kFighterCounterScale = 3.0
	local kCorvetteCounterScale = 1.5
	local kFrigateCounterScale = 1.0
	local AFiDemand=0
	local ACoDemand=0
	local AFrDemand=0
	local FiValue = PlayersMilitary_Fighter(enemyIndex, player_max)
	local self_AFiValue = PlayersMilitary_AntiFighter(s_playerIndex, player_max)
	local enemy_FiTotal = (FiValue-self_AFiValue)*kFighterCounterScale
	if (enemy_FiTotal < 0) then
		enemy_FiTotal = 0
	end
	local CoValue = PlayersMilitary_Corvette(enemyIndex, player_max)
	local self_ACoValue = PlayersMilitary_AntiCorvette(s_playerIndex, player_max)
	local enemy_CoTotal = (CoValue - self_ACoValue)*kCorvetteCounterScale
	if (enemy_CoTotal < 0) then
		enemy_CoTotal = 0
	end
	local MSfrig_correction = 100-s_militaryStrengthVersusTarget
	local FrValue = PlayersMilitary_Frigate(enemyIndex, player_max) - MSfrig_correction
	local self_AFrValue = PlayersMilitary_AntiFrigate(s_playerIndex, player_max)
	local enemy_FrTotal = (FrValue - self_AFrValue)*kFrigateCounterScale
	if (enemy_FrTotal < 0) then
		enemy_FrTotal = 0
	end
	
	local fiScale = sg_fightersize
	local coScale = sg_corvettesize
	local frScale = sg_frigatesize
								
	local enemy_ChassisTotal = enemy_FiTotal + enemy_CoTotal + enemy_FrTotal
	if (enemy_ChassisTotal > 0) then
		if (enemy_FiTotal > 0) then
			local FiTotalPercent = enemy_FiTotal*100/enemy_ChassisTotal*fiScale
			if(FiTotalPercent > 35) then
				AFiDemand = AFiDemand + 4*FiTotalPercent
			end
		end
		if (enemy_CoTotal > 0) then
			local CoTotalPercent = enemy_CoTotal*100/enemy_ChassisTotal*coScale
			if (CoTotalPercent > 35) then
				ACoDemand = ACoDemand + 4*CoTotalPercent
			end
		end
		if (enemy_FrTotal > 0) then
			local FrTotalPercent = enemy_FrTotal*100/enemy_ChassisTotal*frScale
			if (FrTotalPercent > 35) then
				AFrDemand = AFrDemand + 4*FrTotalPercent
			end
		end
	end
	if (AFiDemand > 0) then
		ShipDemandAddByClass( eAntiFighter, AFiDemand )
	end
	if (ACoDemand > 0) then
		ShipDemandAddByClass( eAntiCorvette, ACoDemand )
	end
	if (AFrDemand > 0) then
		ShipDemandAddByClass( eAntiFrigate, AFrDemand )
	end
end

function DetermineChassisDemand(enemyIndex)
	local FiDemand=0
	local CoDemand=0
	local FrDemand=0
	local AFiValue = PlayersMilitary_AntiFighter(enemyIndex, player_max)
	local ACoValue = PlayersMilitary_AntiCorvette(enemyIndex, player_max)
	local AFrValue = PlayersMilitary_AntiFrigate(enemyIndex, player_max)
	local ATotal = AFiValue + ACoValue + AFrValue
	if (ATotal <= 0) then
		return
	end

	local fiThresh = sg_FighterThresh
	if (AFiValue > 5) then
		local AFiPercent = AFiValue*100/ATotal
		if (AFiPercent>35) then
			FiDemand = FiDemand - 4*AFiPercent/100
		end
	end

	local coThresh = sg_CorvetteThresh
	if (ACoValue > 5) then
		local ACoPercent = ACoValue*100/ATotal
		if (ACoPercent>35) then
			CoDemand = CoDemand - 4*ACoPercent/100
		end
	end
	
	local frThresh = sg_FrigateThresh
	if (AFrValue > 5) then
		local AFrPercent = AFrValue*100/ATotal
		if (AFrPercent>35) then
			FrDemand = FrDemand - 4*AFrPercent/100
		end
	end
	
	ShipDemandAddByClass( eFighter, FiDemand )
	ShipDemandAddByClass( eCorvette, CoDemand )
	ShipDemandAddByClass( eFrigate, FrDemand )
end

function DetermineDemandWithNoCounterInfo()
	if (Proc_DetermineDemandWithNoCounterInfo ~= nil) then
		Proc_DetermineDemandWithNoCounterInfo()
	elseif (s_militaryPop < 5) then		
		ShipDemandAddByClass( eAntiFrigate, 1.5 )	
	end
end

function DetermineCounterDemand()
	if (s_enemyIndex ~= -1) then
		local enemyMilitaryCount = PlayersMilitaryPopulation( s_enemyIndex, player_max )
		if (enemyMilitaryCount >= 3) then
			DetermineChassisDemand(s_enemyIndex)
			DetermineAntiChassisDemand(s_enemyIndex)
			return			
		end
	end
	DetermineDemandWithNoCounterInfo();
end

function DetermineSpecialDemand()
	for iClassGroup,iGroup in sg_LinkedClass do
		AddAdditionalDemand(iGroup[1],iGroup[2],iGroup[3])
	end
	if (Proc_DetermineSpecialDemand ~= nil) then
		Proc_DetermineSpecialDemand()
	end
end

function AddAdditionalDemand(eClass1,eClass2,eRelative)
	local numClass1 = PlayersUnitTypeCount( player_enemy, player_total, eClass1 )
	local numClass2 = PlayersUnitTypeCount( player_enemy, player_total, eClass2 )
	if (numClass1 > 0) then		
		local ssClass2Demand = numClass1/2		
		if (s_enemyIndex ~= -1) then
			local targetClass1 = PlayersUnitTypeCount( s_enemyIndex, player_max, eClass1 )
			if (targetClass1 > 0) then
				ssClass2Demand = ssClass2Demand + targetClass1				
			end
		end		
		ShipDemandAddByClass( eClass2, eRelative*ssClass2Demand )		
	end
	if (numClass2 > 0) then		
		local ssClass1Demand = numClass2/2		
		if (s_enemyIndex ~= -1) then
			local targetClass2 = PlayersUnitTypeCount( s_enemyIndex, player_max, eClass2 )
			if (targetClass2 > 0) then
				ssClass1Demand = ssClass1Demand + targetClass2				
			end
		end		
		ShipDemandAddByClass( eClass1, -1*eRelative*ssClass1Demand )		
	end
end

function CalculateMilitaryValueGoal( militaryTable, percentOfEnemy )
	local curTime = gameTime()
	local minMilitaryValue = 0
	if (s_enemyTotalValue*percentOfEnemy > minMilitaryValue) then
		minMilitaryValue = s_enemyTotalValue*percentOfEnemy
	end
	for k,v in militaryTable do
		if (curTime < v[3]) then			
			if (minMilitaryValue < v[1]) then
				minMilitaryValue = v[1]
			end			
			if (minMilitaryValue > v[2]) then
				minMilitaryValue = v[2]
			end
			break
		end	
	end	
	return minMilitaryValue
end

function CpuBuild_DefaultShipDemandRules_Easy()	
	local valueTable =
	{		
		{80, 		135, 		8*30},
		{120,		180,		15*30},
		{160,		230,		20*30},
		{220,		300,		30*30},
		{270,		370,		45*30},
		{350,		500,		60*30},
		{500,		1000,		10000*30},
	}	
	local minMilitaryValue = CalculateMilitaryValueGoal( valueTable, 0.7 )	
	if (s_selfTotalValue < minMilitaryValue) then
		DetermineClassDemand();
		DetermineCounterDemand();
		DetermineSpecialDemand();
	end
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
end

function CpuBuild_DefaultShipDemandRules_Med()	
	local valueTable =
	{		
		{120, 		200, 		8*30},
		{160,		250,		15*30},
		{220,		320,		20*30},
		{280,		400,		30*30},
		{320,		500,		45*30},
		{500,		700,		60*30},
		{700,		1200,		10000*30},
	}	
	local minMilitaryValue = CalculateMilitaryValueGoal( valueTable, 0.8 )
	if (s_selfTotalValue < minMilitaryValue) then
		DetermineClassDemand();
		DetermineCounterDemand();
		DetermineSpecialDemand();
	end
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
end

function CpuBuild_DefaultShipDemandRules_Hard()	
	local valueTable =
	{		
		{120, 		200, 		8*30},
		{160,		250,		15*30},
		{220,		320,		20*30},
		{280,		400,		30*30},
		{320,		500,		45*30},
		{500,		700,		60*30},
		{700,		1200,		10000*30},
	}	
	local minMilitaryValue = CalculateMilitaryValueGoal( valueTable, 0.9 )
	if (s_selfTotalValue < minMilitaryValue) then
		DetermineClassDemand();
		DetermineCounterDemand();
		DetermineSpecialDemand();
	end
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
end

function CpuBuild_DefaultShipDemandRules_Expert()	
	DetermineClassDemand();
	DetermineCounterDemand();
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
	DetermineSpecialDemand();		
end

function CpuBuild_RemoveBuildItems()	
	RemoveStalledBuildItems()	
end

function CpuBuild_Process()
	SpecialUnitSizeControl()
	if (sg_resourceDemand > 0 or sg_militaryDemand < 0) then
		if s_rushthreat<0.5 then
			if (DoResourceBuild()==1) then
				return 1
			end
		end
	end	
	if (sg_militaryDemand > 0) then
		if (DoMilitaryBuild()==1) then
			if(sg_resourceDemand <= 0) then
			end
			return 1
		end
	end
	return 0
end

function DoMilitaryBuild()
	local ssDemand = sg_subSystemDemand + sg_subSystemOverflowDemand + 1
	local shipId = FindHighDemandShip()
	while shipId==sg_kCollector do
		ShipDemandAdd(sg_kCollector, -100)
		shipId = FindHighDemandShip()
	end
	local highestPriority = HighestPriorityShip()
	if (UnderAttackThreat() > -5 and shipId > 0 and highestPriority >= 0.5) then
		ssDemand = 0
	end	
	if (s_shipBuildQueuesFull==0)and(sg_shipDemand > ssDemand) then
		if (shipId > 0) then
if(	sg_debug==1) then _ALERT("Player:"..s_playerIndex.."|RU:"..GetRU().."|Build:"..ai_data["s"..tostring(shipId)].Name.."|BuildDemand:"..ShipDemandGet(shipId)) end
			Build( shipId )
			sg_subSystemOverflowDemand = sg_subSystemOverflowDemand + sg_dosubsystems
			return 1
		end	
	elseif (sg_dosubsystems~=0) then
		if (s_subsystemBuildQueuesFull==0) then
			if (CpuBuildSS_DoBuildSubSystem() == 1) then
				return 1
			end
		end
	end
	if (s_shipBuildQueuesFull==0) then
		if (shipId > 0) then
if(	sg_debug==1) then _ALERT("Player:"..s_playerIndex.."|RU:"..GetRU().."|Build:"..ai_data["s"..tostring(shipId)].Name.."|BuildDemand:"..ShipDemandGet(shipId)) end
			Build( shipId )
			sg_subSystemOverflowDemand = sg_subSystemOverflowDemand + sg_dosubsystems
			return 1
		end
	end
	return 0
end

function DetermineScoutDemand()	
	ShipDemandSetByClass( eScout, -100 )
	if gameTime() > cpuplayers_norushtime then
		if (UnderAttackThreat() < -10 and gameTime() > sg_randScoutStartBuildTime) then			
			local numEnemies = PlayersAlive( player_enemy )
			local shipCount = numQueueOfClass( eScout ) + numActiveOfClass( s_playerIndex, eScout )
			local numScoutsDemanded = 1
			if (numEnemies >= 2) then
				numScoutsDemanded = 2
			end
			if (numEnemies > 2 and s_militaryPop > 7) then
				numScoutsDemanded = 2+((s_militaryPop-7)/10)
			end
			if (shipCount < numScoutsDemanded) then
				ShipDemandAddByClass( eScout, 135 )
				local scoutRand = Rand(100)
				if (scoutRand > 30) then
					ShipDemandAddByClass( eScout, 15 )
				end
				sg_randScoutStartBuildTime = gameTime() + 50
				return
			end
		end
	end
end

function DetermineBuilderClassDemand()
	local numBuilders = numQueueOfClass( eBuilder )
	local numActiveBuilders = numActiveOfClass( s_playerIndex, eBuilder )
	local numCollectors = numQueueOfClass( eCollector )
	local numRUs = GetRU()
	local BuildShipChannel,BuildSubsystemChannel = BuildChannelCount()
	sg_desiredNumCollectors = sg_numCollectorPerChannel*(BuildShipChannel+NumShipsBuildingSubSystems()+IsResearchBusy()-floor(numRUs/sg_RUsPerChannel))
	if (numBuilders>numActiveBuilders) then
		ShipDemandSetByClass( eBuilder, -10 );
		return
	end
	if (g_LOD == 0 and numBuilders > 3) then
		ShipDemandSetByClass( eBuilder, -10 );
		return
	elseif (g_LOD == 1 and numBuilders > 4) then
		ShipDemandSetByClass( eBuilder, -10 );
		return
	elseif (g_LOD == 2 and numBuilders > 6) then
		ShipDemandSetByClass( eBuilder, -10 );
		return	
	end
	if (s_militaryPop < 20*numBuilders or (UnderAttack() == 1 and UnderAttackThreat() > -75) ) then
		ShipDemandSetByClass( eBuilder, -10 );
	end
	local RUForBuilder=sg_ForceBuilderRU*ForceBuilderRUTable[g_LOD+1]
	if (numCollectors < sg_desiredNumCollectors  and numRUs < RUForBuilder ) then
		ShipDemandSetByClass( eBuilder, -10 );
		return
	end
	local numRUToBuildTable = {
		0.2*RUForBuilder,			--0 builders
		0.3*RUForBuilder,			--1
		0.4*RUForBuilder,		 	--2 (normal start)
		0.5*RUForBuilder,			--3
		0.6*RUForBuilder,		--4
		0.7*RUForBuilder,		--5 or more
	}
	if (numBuilders > 5) then
		numBuilders = 5
	end
	
	local RUsNeededToBuildBuilder = numRUToBuildTable[numBuilders+1]
	
	local dif = numRUs - RUsNeededToBuildBuilder	
	if (dif > 0) then		
		local ruPerShip = RUForBuilder	
		if (s_militaryStrength > 30) then
			ruPerShip = 0.5*RUForBuilder
		end
		local bonusDemand = 1000*(dif/ruPerShip)
		ShipDemandAddByTable( HaveBuildShipChannel(), bonusDemand );
	end
	if (dif<-2000) then
		local penaltyDemand = dif/2000
		ShipDemandAddByTable( HaveBuildShipChannel(), penaltyDemand );		
	end
	local neededMilitaryValue = 30 + (numBuilders-1)*30	
	local militaryDifDemand = (s_selfTotalValue - neededMilitaryValue)/30
	if (militaryDifDemand < 0) then
		ShipDemandAddByTable( HaveBuildShipChannel(), militaryDifDemand );		
	end
	return 0
end

function HaveBuildShipChannel()
	local iResult = {}
	for item,item_info in ai_data do
		if(item_info.Type=="Ship")then
			if (item_info.BuildShipChannel>0) then
				tinsert(iResult,item_info.ID)
			end
		end
	end
	return iResult
end

function ShipDemandAddByTable(iTable, iDemand)
	for index,shiptype in iTable do
		ShipDemandAdd(shiptype, iDemand)
	end
end