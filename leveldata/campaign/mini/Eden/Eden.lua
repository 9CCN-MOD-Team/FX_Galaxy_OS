--加载公共规则
dofilepath("data:scripts/rules/common.rule")
--主菜单切换代码
dofilepath("data:scripts/FX_SwitchMainMenu.lua")
--加载LW库
dofilepath("data:scripts/LW_functions.lua")
--成就系统管理代码
dofilepath("data:scripts/FX_AchievementControl.lua")

dofilepath("Data:scripts\\SCAR\\SCAR_Util.lua")

dofilepath("data:leveldata/multiplayer/resdata/XInit.lua")
g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
CurrentRU = 0
InterceptorWaveSquadrons = 0
BomberWaveSquadrons = 0
IonarraySquadrons = 0
AttackFrame = 0
AttackTimes = 0
pointer_ownerfrigate_id = 0
EnemyProbe1_beFound = 0
EnemyProbe2_beFound = 0
EnemyProbe_allFound = 0
ownerbackup = 0
Enemybackup = 0
tempCorvette = 0
ConvoySpeed = 0
CollectorEnterKeepOut = 0
Player0_corvette = 0
Player0_interceptor = 0
Player0_attackbomber = 0
Player0_minelayer = 0
g_cheat = 0

objectives = {}
objectives.protectcollector = 
{ 
    title = "$57000", 
    id = 0, 
    desc = "$57001", }
objectives.protectcontainer = 
{ 
    title = "$57002", 
    id = 0, 
    desc = "$57003", }    
objectives.protectconvoy = 
{ 
    title = "$57004", 
    id = 0, 
    desc = "$57005", }
objectives.protectcarrier = 
{ 
    title = "$57006", 
    id = 0, 
    desc = "$57007", }
objectives.callbackup = 
{ 
    title = "$57008", 
    id = 0, 
    desc = "$57009", }
objectives.harvesting = 
{ 
    title = "$57015", 
    id = 0, 
    desc = "$57016", }
                
g_savename={"$57112","$57110","$57111"}

function Rule_PlaySaveGameLocationCard()
    Subtitle_Message("$3651", 3)
    Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function Eden_AutoSave(iIndex)
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddIntervalParam("Eden_AutoSaveCommon", iIndex, 1)
end

function Eden_AutoSaveCommon(iIndex)
	Rule_RemoveParam("Eden_AutoSaveCommon", iIndex)
	Campaign_QuickSaveNb(tonumber(iIndex), g_savename[tonumber(iIndex)])
end

function addObjective(obj, isSecondary)
    if  not isSecondary then
        objectives[obj].id = Objective_Add(objectives[obj].title, OT_Primary)
    else
        objectives[obj].id = Objective_Add(objectives[obj].title, OT_Secondary)
    end 

    if  objectives[obj].desc then
        Objective_AddDescription(objectives[obj].id, objectives[obj].desc)
    end 
end

function completeObjective(obj)
	Objective_SetState(objectives[obj].id, OS_Complete)
end

function failObjective(obj)
	Objective_SetState(objectives[obj].id, OS_Failed)
end	

function OnInit()
	UI_ClearEventScreen()
	Camera_UseCameraPoint( "Cam_FocusOnCarrier" )
	Rule_Add("Rule_Init")
	XInit("reslist.lua", "")
		FX_Achievements_Init("FXsingleplayer")
--------
		FX_Common_Rule_OnInit()
end
function OnStartOrLoad()
		--主菜单切换
		FX_SwitchMainMenuTo(mainmenu_tanis)
		--------
	FX_Common_Rule_OnStartOrLoad()
	--------
		--成就系统管理代码
		dofilepath("data:scripts/FX_AchievementControl_TableFunctions.lua")
		--X System Reload
		XInitOnLoad()
end

function DisableOwnerCarrier()
	SobGroup_CreateSubSystem("OwnerCarrier", "FIGHTERPRODUCTION")
	SobGroup_CreateSubSystem("OwnerCarrier", "RESEARCH")
	SobGroup_CreateSubSystem("OwnerCarrier", "ADVANCEDARRAY")
		Player_RestrictResearchOption(0, "ATTACKBOMBERIMPROVEDBOMBS")
		Player_RestrictResearchOption(0, "SCOUTEMPABILITY")	
			Player_RestrictResearchOption(0, "cpuplayers_defensive")
			Player_RestrictResearchOption(0, "cpuplayers_aggressive")
			Player_RestrictResearchOption(0, "cpuplayers_dynamic")
			Player_RestrictResearchOption(0, "cpuplayers_norushtime5")
			Player_RestrictResearchOption(0, "cpuplayers_norushtime10")
			Player_RestrictResearchOption(0, "cpuplayers_norushtime15")			
			Player_RestrictResearchOption(0, "AllShipBuildSpeed")
			Player_RestrictResearchOption(0, "AllShipBuildSpeedHard")
			Player_RestrictResearchOption(0, "AllShipBuildSpeedExpert")		
			Player_RestrictResearchOption(0, "ResourceCollectionRateHard")
			Player_RestrictResearchOption(0, "ResourceCollectionRateExpert")				
	Player_RestrictResearchOption(0, "hgn_AirWeaponUpgrade1")
	Player_RestrictResearchOption(0, "hgn_AirHealthUpgrade1")
	Player_RestrictResearchOption(0, "hgn_PlatformWeaponUpgrade1")
	Player_RestrictResearchOption(0, "hgn_PlatformHealthUpgrade1")
	Player_RestrictResearchOption(0, "SensDisProbe")
	Player_RestrictResearchOption(0, "ECMPROBE")
	Player_RestrictResearchOption(0, "DAMAGEMOVERTECH")
	Player_RestrictResearchOption(0, "RADIATIONDEFENSEFIELD")
	Player_RestrictResearchOption(0, "MOTHERSHIPHEALTHUPGRADE1")
	Player_RestrictResearchOption(0, "MOTHERSHIPMAXSPEEDUPGRADE1")
	--Player_RestrictResearchOption(0, "MOTHERSHIPBUILDSPEEDUPGRADE1")	
	Player_GrantResearchOption(0, "CARRIERHEALTHUPGRADE1")
	Player_GrantResearchOption(0, "CARRIERHEALTHUPGRADE2")
	--Player_GrantResearchOption(0, "CARRIERBUILDSPEEDUPGRADE1")
	Player_GrantResearchOption(2, "IONCANNONFRIGATEHEALTHUPGRADE1")
	Player_GrantResearchOption(2, "IONCANNONFRIGATEHEALTHUPGRADE2")
	Player_GrantResearchOption(2, "IONCANNONFRIGATEMAXSPEEDUPGRADE1")
	Player_GrantResearchOption(2, "IONCANNONFRIGATEMAXSPEEDUPGRADE2")
	Player_GrantResearchOption(2, "TORPEDOFRIGATEHEALTHUPGRADE1")
	Player_GrantResearchOption(2, "TORPEDOFRIGATEHEALTHUPGRADE2")
	Player_GrantResearchOption(2, "TORPEDOFRIGATEMAXSPEEDUPGRADE1")
	Player_GrantResearchOption(2, "TORPEDOFRIGATEMAXSPEEDUPGRADE2")
	Player_GrantResearchOption(2, "IMPROVEDTORPEDO")
	Player_RestrictBuildOption(0, "FRIGATEPRODUCTION")
	Player_RestrictBuildOption(0, "HYPERSPACE")
	Player_RestrictBuildOption(0, "FIRECONTROLTOWER")
	Player_RestrictBuildOption(0, "HYPERSPACEINHIBITOR")
	Player_RestrictBuildOption(0, "CLOAKSENSOR")
	Player_RestrictBuildOption(0, "HYPERSPACESENSOR")
	Player_RestrictBuildOption(0, "HGN_ASSAULTFRIGATE")
	Player_RestrictBuildOption(0, "HGN_DEFENSEFIELDFRIGATE")
	Player_RestrictBuildOption(0, "HGN_IONCANNONFRIGATE")
	Player_RestrictBuildOption(0, "HGN_MARINEFRIGATE")
	Player_RestrictBuildOption(0, "HGN_TORPEDOFRIGATE")
	Player_RestrictBuildOption(0, "HGN_SHIPYARD")
	Player_RestrictBuildOption(0, "HGN_SHIPYARD_SPG")
	Player_RestrictBuildOption(0, "HGN_ATTACKDROIDELITE")
	Player_RestrictBuildOption(0, "HGN_MOVERELITE")
	Player_RestrictBuildOption(0, "HGN_ECMPROBE")
	Player_RestrictBuildOption(0, "HGN_MULTIGUNCORVETTE")
	SobGroup_AbilityActivate("OwnerCarrier", AB_Guard, 0)
	SobGroup_AbilityActivate("OwnerCarrier", AB_Move, 0)
	SobGroup_AbilityActivate("OwnerCarrier", AB_Hyperspace, 0)
	SobGroup_AbilityActivate("OwnerCarrier", AB_Scuttle, 0)
	Rule_Remove("DisableOwnerCarrier")
end

function Rule_Init()
	CPU_Enable(1, 0)
	CPU_Enable(2, 0)
	CPU_Enable(3, 0)
	Player_SetGlobalROE(1, AggressiveTactics)
	Player_SetGlobalROE(2, AggressiveTactics)
	Player_SetGlobalROE(3, AggressiveTactics)
	Player_SetPlayerName(0, "$57010")
	Player_SetPlayerName(1, "$57011")
	Player_SetPlayerName(2, "$57012")
	Player_SetPlayerName(3, "$57013")
	Player_SetPlayerName(4, "$57014")
	dofilepath("player:PLAYERCFG.LUA")
	Player_SetTeamColours(Universe_CurrentPlayer(),{PlayerSetup.teamcolour[1]/255,PlayerSetup.teamcolour[2]/255,PlayerSetup.teamcolour[3]/255,},{PlayerSetup.stripecolour[1]/255,PlayerSetup.stripecolour[2]/255,PlayerSetup.stripecolour[3]/255,})
	Player_SetBadgeTexture(Universe_CurrentPlayer(), PlayerSetup.emblem)
	SobGroup_Create("allCollector")
	SobGroup_Create("beDieCollector")
	SobGroup_Create("tempStandard")
	SobGroup_Create("tempMissile")
	SobGroup_Create("TurHeavyCruiser")
	SobGroup_Create("EnemyProbe1")
	SobGroup_Create("EnemyProbe2")
	SobGroup_Create("tempResourcecollector")
	SobGroup_Create("tempcecollectorGuard")	
	Volume_AddCube("Vol_keepout", {-2450, -200, 9875,}, 1200)

	SetAlliance(0, 2)
 	SetAlliance(2, 0)
 	SetAlliance(1, 3)
 	SetAlliance(3, 1)
	SetAlliance(4, 2)
 	SetAlliance(2, 4)
	SetAlliance(0, 4)
 	SetAlliance(4, 0) 	
 	SobGroup_SetAsDeployed("OwnerTurret")
 	SobGroup_AbilityActivate("OwnerTurret", AB_Scuttle, 0)
	Rule_Add( "DisableOwnerCarrier" )
	SobGroup_Resource( 0, "Collector" )
	
	addObjective("harvesting")
	Event_Start("campaign_start")
	Rule_Add("Rule_Collector_Death")
	Rule_Add("Rule_OwnerCarrier_Death")	
	Rule_AddInterval( "Rule_CollectorJoinToGroup", 5)
	Rule_AddInterval( "Rule_CollectorSelected", 2)
	Rule_AddInterval( "Rule_CheatCheck", 3)
	--Rule_Add("Rule_HarvestingSec") --<
	Rule_Remove( "Rule_Init" )
end

function Rule_CheatCheck()
	Player0_corvette = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "HGN_ASSAULTCORVETTE")+Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "HGN_PULSARCORVETTE")+Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "HGN_MULTIGUNCORVETTE")
	Player0_interceptor = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "HGN_INTERCEPTOR")
	Player0_attackbomber = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "HGN_ATTACKBOMBER")
	Player0_minelayer = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "HGN_MINELAYERCORVETTE")
	if Player0_corvette>12 or (Player0_attackbomber+Player0_interceptor)>14 then
		g_cheat = 1
		--石头向航母移动
		--SobGroup_Move(1, "Resource_Turain_Carrier", "Vol_tur_resource_carrierto")
	else
		g_cheat = 0
		--石头停止移动
		--SobGroup_Stop("")
	end
end

function Rule_CollectorJoinToGroup()
	SobGroup_Clear("allCollector")
	Player_FillShipsByType("allCollector", 0, "HGN_RESOURCECOLLECTOR")
	SobGroup_SetSpeed("allCollector", 1)
end

function Rule_CollectorSelected()
	if SobGroup_FillSobGroupInVolume("beDieCollector", "allCollector", "Vol_keepout")==1 then
		if SobGroup_IsDoingAbility("beDieCollector", AB_Salvage ) == 1 or SobGroup_IsDoingAbility("beDieCollector", AB_Harvest ) == 1 then
			Rule_Add("Rule_KillCollector")
		end
	else
		SobGroup_Clear("beDieCollector")
	end
end

function Rule_KillCollector()
	SobGroup_TakeDamage("beDieCollector", 1)
	Rule_Remove("Rule_KillCollector")
end

function Rule_Harvesting()
	if Timer_GetRemaining(3) < 0.1 then
		Timer_End(3)
		SobGroup_Spawn("WaveOne1_Turain_Bombers", "Vol_waveattack")
		SobGroup_Spawn("WaveOne1_Turain_Fighters", "Vol_waveattack")
		SobGroup_Spawn("WaveOne2_Turain_Bombers", "Vol_waveattack1")
		SobGroup_Spawn("WaveOne2_Turain_Fighters", "Vol_waveattack1")
		SobGroup_Move(1, "WaveOne1_Turain_Bombers", "Vol_resource1")
		SobGroup_GuardSobGroup("WaveOne1_Turain_Fighters", "WaveOne1_Turain_Bombers")
		SobGroup_Move(1, "WaveOne2_Turain_Bombers", "Vol_resource2")
		SobGroup_GuardSobGroup("WaveOne2_Turain_Fighters", "WaveOne2_Turain_Bombers")
		Rule_Add("Rule_WaveOne_Turain_Comming")
		Rule_Add("Rule_WaveOne_Turain_Defeat")
		Rule_Remove( "Rule_Harvesting" )
	end 
end

function Rule_Turain_Harvesting()
	if SobGroup_Empty("tempResourcecollector") == 0 then
		if SobGroup_IsDoingAbility("tempResourcecollector", AB_Harvest)==0 then
			SobGroup_Resource( 1, "tempResourcecollector" )
		end
	else
		Rule_Remove( "Rule_Turain_Harvesting" )
	end
end

function Rule_Turain_ResourceCarrier_Out()
	if SobGroup_HealthPercentage("Resource_Turain_Carrier") < 0.35 then
		Event_Start("TurainResourceCarrierOut")	
		SobGroup_EnterHyperSpaceOffMap("Resource_Turain_Carrier")
		Rule_Remove( "Rule_Collector_Death" )
		Rule_Remove( "Rule_Turain_ResourceCarrier_Send" )
		Rule_Remove( "Rule_Turain_ResourceCarrier_Out" )
	end
end

function Rule_Turain_ResourceCarrier_Send()
	if SobGroup_Count("tempResourcecollector")<5 then
		Turain_cecollector = SobGroup_CreateShip("Resource_Turain_Carrier", "TUR_RESOURCECOLLECTOR")
		SobGroup_SetSpeed(Turain_cecollector,0.7)
		SobGroup_SobGroupAdd("tempResourcecollector", Turain_cecollector)
	end
	if SobGroup_Count("tempcecollectorGuard")<11 then
		Turain_cecollectorguard = SobGroup_CreateShip("Resource_Turain_Carrier", "TUR_FIGHTER")
		SobGroup_SobGroupAdd("tempcecollectorGuard", Turain_cecollectorguard)
	end
	if (Rule_Exists("Rule_Turain_Harvesting")==0) then
		Rule_Add("Rule_Turain_Harvesting")
	end
	SobGroup_GuardSobGroup("tempcecollectorGuard", "tempResourcecollector")
end

function Rule_Turain_Resourcecollector_AllDeath()
	if SobGroup_Empty("tempResourcecollector") == 1 then
		Event_Start("Turain_Resourcecollector_AllDeath")
		Player_GrantResearchOption(0, "ATTACKBOMBERIMPROVEDBOMBS")
		Player_GrantResearchOption(0, "SCOUTEMPABILITY")	
		Player_UnrestrictBuildOption(0, "HGN_MULTIGUNCORVETTE")
		SobGroup_Move(1, "Resource_Turain_Carrier", "Vol_tur_resource_carrierto")
		Rule_AddInterval("Rule_Turain_ResourceCarrier_Send",30)
		Rule_Add("Rule_Turain_ResourceCarrier_Out")
		Rule_Add("Rule_Turain_Resourcecollector_CommingA")
		Rule_Remove( "Rule_Turain_Resourcecollector_AllDeath" )
		Rule_Remove( "Rule_Turain_Resourcecollector_Succeed" )
	end
end

function Rule_Turain_Resourcecollector_Succeed()
	if Player_GetRU(1)> 2400 then
		Event_Start("Turain_Resourcecollector_Succeed")
		Player_GrantResearchOption(0, "ATTACKBOMBERIMPROVEDBOMBS")
		Player_GrantResearchOption(0, "SCOUTEMPABILITY")	
		Rule_Remove( "Rule_Turain_Resourcecollector_AllDeath" )
		Rule_Remove( "Rule_Turain_Resourcecollector_Succeed" )
	end
end

function Rule_Turain_Resourcecollector_CommingA()
	if SobGroup_PlayerIsInSensorRange("tempResourcecollector", 0)==1 then
		Event_Start("findTurainResourcecollectorA")
		Eden_AutoSave(1)
		Rule_Remove("Rule_Turain_Resourcecollector_CommingA")
	end
end

function Rule_Turain_Resourcecollector_Comming()
	if SobGroup_PlayerIsInSensorRange("tempResourcecollector", 0)==1 then
		Event_Start("protectStaticContainer")
		Timer_Start(0, 200)
		Rule_Add("Rule_HarvestingSec")
		Rule_Add("Rule_Turain_Resourcecollector_Succeed")
		Rule_Add("Rule_Turain_Resourcecollector_AllDeath")
		Rule_Remove("Rule_Turain_Resourcecollector_Comming")
	end
end

function Rule_Turain_Resourcecollector()
	for i=1,3,1 do
		SobGroup_SpawnNewShipInSobGroup(1, "TUR_RESOURCECOLLECTOR", "tur_resourcecollector", "tempResourcecollector", "Vol_tur_resourcecollector")
	end
	SobGroup_Resource( 1, "tempResourcecollector" )
	SobGroup_SetSpeed("tempResourcecollector",0.7)
	for i=1,3,1 do
		SobGroup_SpawnNewShipInSobGroup(1, "TUR_FIGHTER", "AttackInterceptor", "tempcecollectorGuard", "Vol_tur_resourcecollector")
	end
	SobGroup_GuardSobGroup("tempcecollectorGuard", "tempResourcecollector")
	SobGroup_ExitHyperSpace("Resource_Turain_Carrier", "Vol_tur_resource_carrier")
	Player_GrantResearchOption(1, "Tur_UtilityHealthUpgrade3")
	Player_GrantResearchOption(1, "Tur_AirHealthUpgrade3")
	Rule_Add("Rule_Turain_Harvesting")
	Rule_Add("Rule_Turain_Resourcecollector_Comming")
	Rule_Remove("Rule_Turain_Resourcecollector")
end

function Rule_WaveOne_Turain_Comming()
	local WaveOne_1 = SobGroup_PlayerIsInSensorRange("WaveOne1_Turain_Bombers", 0)
	local WaveOne_2 = SobGroup_PlayerIsInSensorRange("WaveOne2_Turain_Bombers", 0)
	if (WaveOne_1 == 1 or WaveOne_2 == 1) then
		Event_Start("Turain_AttackWave1_Here")
		SobGroup_AttackPlayer("WaveOne1_Turain_Fighters", 0)
		SobGroup_AttackPlayer("WaveOne2_Turain_Fighters", 0)
		SobGroup_Attack(1, "WaveOne1_Turain_Bombers", "Collector")
		SobGroup_Attack(1, "WaveOne2_Turain_Bombers", "Collector")
		Rule_Add("Rule_Turain_Resourcecollector")
		Rule_Remove("Rule_WaveOne_Turain_Comming")
	end
end

function Rule_WaveOne_Turain_Defeat()
	B1 = SobGroup_Empty("WaveOne1_Turain_Bombers")
	F1 = SobGroup_Empty("WaveOne1_Turain_Fighters")
	B2 = SobGroup_Empty("WaveOne2_Turain_Bombers")
	F2 = SobGroup_Empty("WaveOne2_Turain_Fighters")
	if B1 == 1 and F1 == 1 and B2 == 1 and F2 == 1 then 
		completeObjective("protectcollector")
		Rule_Remove("Rule_WaveOne_Turain_Defeat")
	end
end

function Rule_Collector_Death()
	if SobGroup_Empty("Collector") == 1 then
		Event_Start("AllCollectorDeath")
		Rule_Remove("Rule_Collector_Death")
	end
end

function Rule_HarvestingSec()
	if Timer_GetRemaining(0) <0.1 then
		Timer_End(0)
		SobGroup_ExitHyperSpace("Convoy", "Vol_convoy_start")
		SobGroup_TakeDamage("Convoy", 0.4)
		SobGroup_Move(4, "Convoy", "Vol_convoy_end")
		Rule_AddInterval("Rule_Convoy_SetSpeed",2)
		Rule_Add("Rule_Convoy_FirstPointer")
		Rule_Add("Rule_Convoy_SecondPointer")
		Rule_Add("Rule_Convoy_UnderAttack")
		Rule_Add("Rule_Convoy_Down")
		Rule_Add("Rule_Convoy_Arrive")
		Rule_Add("Rule_Convoy_Damaged")
		Rule_Remove( "Rule_HarvestingSec" )
	end 
end

function Rule_Turain_AttackWave_Check()
	if SobGroup_Empty("WaveTwo_Turain_Fighter")==0 then
		if SobGroup_AreAllInRealSpace("Convoy")==1 and SobGroup_Count("Convoy")~=0 then
			SobGroup_AttackPlayer("WaveTwo_Turain_Fighter", 4)
		else
			SobGroup_AttackPlayer("WaveTwo_Turain_Fighter", 0)
		end	
	end
	if SobGroup_Empty("WaveTwo_Turain_Bomber")==0 then
		if SobGroup_AreAllInRealSpace("Convoy")==1 and SobGroup_Count("Convoy")~=0 then
			SobGroup_AttackPlayer("WaveTwo_Turain_Bomber", 4)
		else
			SobGroup_AttackPlayer("WaveTwo_Turain_Bomber", 0)
		end
	end
end

function Rule_Turain_AttackWave_Send()
	if AttackTimes < 8 then
		if AttackTimes == 0 then
			InterceptorWaveSquadrons = Player0_interceptor + 2
			BomberWaveSquadrons = ceil(Player0_corvette/2) + 2
			Rule_Remove( "Rule_Turain_AttackWave_Send" )
			AttackFrame = 150
			Rule_AddInterval("Rule_Turain_AttackWave_Send",AttackFrame)
		else
			InterceptorWaveSquadrons = Player0_interceptor + 3
			BomberWaveSquadrons = ceil(Player0_corvette/2) + 3
		end
		for i = 1,InterceptorWaveSquadrons,1 do 
			SobGroup_SpawnNewShipInSobGroup(1, "TUR_FIGHTER", "AttackInterceptor", "WaveTwo_Turain_Fighter", "Vol_waveattack")
		end
		for i = 1,BomberWaveSquadrons,1 do 
			SobGroup_SpawnNewShipInSobGroup(1, "TUR_ATTACKBOMBER", "Attackbomber", "WaveTwo_Turain_Bomber", "Vol_waveattack")
		end
		AttackTimes = AttackTimes + 1
	else
		Rule_Remove( "Rule_Turain_AttackWave_Send" )
	end
end

function Rule_OwnerFrigate_Out()
	if SobGroup_Empty("OwnerFrigate") == 0 then
		if SobGroup_IsInVolume("OwnerFrigate", "Vol_convoy_end")==1 then
			SobGroup_Despawn("OwnerFrigate")
			if SobGroup_Empty("OwnerCorvette") == 0 then
				SobGroup_Despawn("OwnerCorvette")
			end
		end
	else
		if SobGroup_IsInVolume("OwnerCorvette", "Vol_convoy_end")==1 then
			SobGroup_Despawn("OwnerCorvette")
		end
	end
end

function Rule_OwnerFrigate_Return()
	if SobGroup_Empty("OwnerFrigate") == 0 or SobGroup_Empty("OwnerCorvette") == 0 then
		if SobGroup_Empty("WaveFour_Turain_Carrier") == 1 and SobGroup_Empty("TurainFrigate") == 1 and SobGroup_Empty("TurHeavyCruiser") == 1 then
			--Event_Start("OwnerFrigateReturn")
			Rule_Remove( "Rule_OwnerFrigate_Attack" )
			if SobGroup_Empty("OwnerFrigate") == 0 then
				SobGroup_SetROE("OwnerFrigate", PassiveTactics)
				SobGroup_Move(2, "OwnerFrigate", "Vol_convoy_end")
				if SobGroup_Empty("OwnerCorvette") == 0 then
					SobGroup_GuardSobGroup("OwnerCorvette", "OwnerFrigate")
				end
				Rule_Add( "Rule_OwnerFrigate_Out" )
			else
				if SobGroup_Empty("OwnerCorvette") == 0 then
					SobGroup_SetROE("OwnerCorvette", PassiveTactics)
					SobGroup_Move(2, "OwnerCorvette", "Vol_convoy_end")
					Rule_Add( "Rule_OwnerFrigate_Out" )
				end
			end
			Rule_Remove( "Rule_OwnerFrigate_Return" )
		end
	end
end

function Rule_OwnerFrigate_Attack()
	SobGroup_AttackPlayer( "OwnerFrigate", 3 )
end

function Rule_OwnerFrigate_Tohere()
	if SobGroup_IsInVolume("OwnerFrigate", "Vol_ownerfrigateto")==1 then
		Rule_AddInterval( "Rule_OwnerFrigate_Attack",10 )
		Rule_Remove( "Rule_OwnerFrigate_Tohere" )
	end
end

function Rule_OwnerFrigate_Comming()
	if ownerbackup == 0 then
		ownerbackup = 1
		Event_Start("OwnerFrigateComming")
		SobGroup_FormStrikeGroup("OwnerFrigate", "wall")
		SobGroup_Move(2, "OwnerFrigate", "Vol_ownerfrigateto")
		SobGroup_GuardSobGroup("OwnerCorvette", "OwnerFrigate")
		Rule_Add("Rule_OwnerFrigate_Tohere")
		Rule_Add("Rule_OwnerFrigate_Return")
		Rule_Remove( "Rule_OwnerFrigate_Comming" )
	end
end

function Rule_Convoy_FirstPointer()
	if SobGroup_IsInVolume("Convoy", "Vol_convoy_firstpointer")==1 then
		Rule_Add("Rule_Turain_AttackWave_Send")
		Rule_AddInterval( "Rule_Turain_AttackWave_Check",10 )	
		Rule_Remove( "Rule_Convoy_FirstPointer" )	
	end
end

function Rule_EnemyProbe1_Destroyed()
	if SobGroup_Empty("EnemyProbe1") == 1 then
		Ping_Remove(pointer_EnemyProbe1_id)
		Rule_Remove( "Rule_EnemyProbe1_Destroyed" )	
	end
end

function Rule_EnemyProbe2_Destroyed()
	if SobGroup_Empty("EnemyProbe1") == 1 then
		Ping_Remove(pointer_EnemyProbe2_id)
		Rule_Remove( "Rule_EnemyProbe2_Destroyed" )	
	end
end

function Rule_EnemyProbeAll_Destroyed()
	if SobGroup_Empty("EnemyProbe1") == 1 and SobGroup_Empty("EnemyProbe2") == 1 then
		Event_Start( "ConvoySendMayday" )
		Rule_Remove( "Rule_TimeOver" )
		Rule_Remove( "Rule_EnemyProbeAll_Destroyed" )
	end
end

function Rule_TimeOver()
	if Timer_GetRemaining(0) < 0.1 then
		Subtitle_TimeCounterEnd()
		Timer_End(0)
		--Event
		if SobGroup_Empty("EnemyProbe1") == 0 then
			Ping_Remove(pointer_EnemyProbe1_id)
		end
		if SobGroup_Empty("EnemyProbe2") == 0 then
			Ping_Remove(pointer_EnemyProbe2_id)
		end
		failObjective("callbackup")
		Rule_Remove("Rule_OwnerFrigate")
		Rule_Remove("Rule_TimeOver")
	end
end

function Rule_OwnerFrigate()
	if Timer_GetRemaining(0) > 0.1 and SobGroup_Empty("EnemyProbe1") == 1 and SobGroup_Empty("EnemyProbe2") == 1 then
		Subtitle_TimeCounterEnd()
		Rule_Remove("Rule_TimeOver")
		Timer_End(0)
		Rule_AddInterval( "Rule_OwnerFrigate_Comming",10 )
		Rule_Remove("Rule_OwnerFrigate")
	end
end

function Rule_ClearPointer()
	if SobGroup_PlayerIsInSensorRange("WaveFour_Turain_Carrier", 0)==1 then
		Ping_Remove(pointer_EnemyCarrier_id)
		Event_Start("EnemyForceHere")
		Rule_Remove("Rule_ClearPointer")
	end
end

function Rule_WaveFour_Turain()
	if Timer_GetRemaining(0) < 230 then
		SobGroup_ExitHyperSpace("WaveFour_Turain_Carrier", "Vol_waveattack_carrier")
		--SobGroup_ExitHyperSpace("WaveFour_Turain_Cruiser", "Vol_waveattack_carrier")
		SobGroup_CreateSubSystem("WaveFour_Turain_Carrier", "tur_ac_Frigate")
		SobGroup_CreateSubSystem("WaveFour_Turain_Carrier", "tur_ac_weapon")
		SobGroup_CreateSubSystem("WaveFour_Turain_Carrier", "tur_ac_hyperspace")
		SobGroup_CreateSubSystem("WaveFour_Turain_Carrier", "FRIGATEPRODUCTION")
		SobGroup_Attack(3, "WaveFour_Turain_Carrier", "OwnerCarrier")
		--SobGroup_Move(3, "WaveFour_Turain_Carrier", "Vol_center")
		--if (Player0_corvette > 8 and Player0_attackbomber > 6) or Player0_minelayer > 1 then
			local tur_cruiser = 1
			if (Player0_corvette > 11 and Player0_attackbomber > 10 and Player0_minelayer > 1) then
				tur_cruiser = 2
			end				
			if g_cheat == 1 then
				tur_cruiser = 15
			end			
			for i=1, tur_cruiser, 1 do 
				SobGroup_SpawnNewShipInSobGroup(3, "TUR_HEAVYCRUISER", "tur_heavycruiser", "TurHeavyCruiser", "Vol_waveattack_heavycruiser")
			end 
		--end
		--SobGroup_Attack(3, "TurHeavyCruiser", "OwnerCarrier")
		SobGroup_Move(3, "TurHeavyCruiser", "Vol_center")
		IonarraySquadrons = ceil(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "HGN_ATTACKBOMBER")/2)+2
		for i=1,IonarraySquadrons,1 do 
			SobGroup_SpawnNewShipInSobGroup(3, "TUR_IONARRAYFRIGATE", "tur_ionarrayfrigate", "TurainFrigate", "Vol_waveattack_frigate")
		end
		SobGroup_FormStrikeGroup("TurainFrigate", "wall")
		SobGroup_SetSpeed("TurainFrigate", 0.3)
		SobGroup_Attack(3, "TurainFrigate", "OwnerCarrier")
		--SobGroup_Move(3, "TurainFrigate", "Vol_center")
		Player_GrantAllResearch(3)
		Event_Start("WaveFourTurainComing")
		Rule_Add("Rule_WaveFour_TurainCarrier_Comming")
		Rule_Add("Rule_WaveFour_TurainHeavyCruiser_Comming")
		Rule_Remove( "Rule_WaveFour_Turain" )		
		Eden_AutoSave(3)
	end
end

function Rule_Convoy_SecondPointer()
	if SobGroup_IsInVolume("Convoy", "Vol_convoy_secondpointer")==1 then
		SobGroup_SpawnNewShipInSobGroup(1, "TUR_ECMGENERATOR", "TUR_ECMGENERATOR", "EnemyProbe1", "Vol_enemyprobe1")
		SobGroup_SpawnNewShipInSobGroup(1, "TUR_ECMGENERATOR", "TUR_ECMGENERATOR", "EnemyProbe2", "Vol_enemyprobe2")
		Rule_Add("Rule_EnemyProbe1_Destroyed")
		Rule_Add("Rule_EnemyProbe2_Destroyed")
		Rule_Add("Rule_EnemyProbeAll_Destroyed")
		Rule_Add("Rule_WaveFour_Turain")
		Rule_Add("Rule_OwnerFrigate")
		Rule_Add("Rule_WaveFour_Turain_UnderAttack")
		Rule_Add("Rule_WaveFour_Turain_Death")
		Rule_Add("Rule_Player_Wins")
		Rule_Remove( "Rule_Convoy_SecondPointer" )
	end
end

function Rule_Convoy_SetSpeed()
	ConvoySpeed = SobGroup_HealthPercentage("Convoy")+0.8
	if ConvoySpeed > 1.6 then
		ConvoySpeed = 1.6
	end
	SobGroup_SetSpeed("Convoy", ConvoySpeed)
end

function Rule_Convoy_UnderAttack()
	if SobGroup_UnderAttack("Convoy")==1 then
		Eden_AutoSave(2)
		Event_Start("ConvoyUnderAttack")
		Rule_Remove ( "Rule_Convoy_UnderAttack" )
	end
end

function Rule_Convoy_Down()
	if SobGroup_HealthPercentage("Convoy")==0 then
		Event_Start("ConvoyDown")
		Rule_Remove( "Rule_Convoy_Down" )
	end
end

function Rule_Convoy_Damaged()
	if SobGroup_HealthPercentage("Convoy")<0.15 then
		SobGroup_SetHealth("Convoy", 0.3)
		Event_Start( "RepairConvoy" )
		Rule_Remove( "Rule_Convoy_Damaged" )
	end
end

function Rule_Convoy_Arrive()
	if SobGroup_IsInVolume("Convoy", "Vol_convoy_end")==1 then
		Event_Start("ConvoyArrive")
		Rule_Remove( "Rule_Convoy_Arrive" )
	end
end

function Rule_WaveFour_TurainCarrier_Comming()
	if SobGroup_IsInVolume("WaveFour_Turain_Carrier", "Vol_center")==1 then
		SobGroup_Attack(3, "WaveFour_Turain_Carrier", "OwnerCarrier")
		Event_Start("DestroyCarrierEngine")
		Rule_Remove( "Rule_WaveFour_TurainCarrier_Comming" )
	end
end

function Rule_WaveFour_TurainHeavyCruiser_Comming()
	if SobGroup_IsInVolume("TurHeavyCruiser", "Vol_center")==1 then
		SobGroup_Attack(3, "TurHeavyCruiser", "OwnerCarrier")
		Event_Start("DestroyHeavyCruiserEngine")
		Rule_Remove( "Rule_WaveFour_TurainHeavyCruiser_Comming" )
	end
end

function Rule_TurCorvetteHere()
	if  SobGroup_GetHardPointHealth("WaveFour_Turain_Carrier", "Production_1")>0 then
			for i=1,2,1 do
				Turain_Standard = SobGroup_CreateShip("WaveFour_Turain_Carrier", "TUR_STANDARDCORVETTE")
				SobGroup_SobGroupAdd("tempStandard", Turain_Standard)
			end
			for i=1,2,1 do
				Turain_Missile = SobGroup_CreateShip("WaveFour_Turain_Carrier", "TUR_MISSILECORVETTE")
				SobGroup_SobGroupAdd("tempMissile", Turain_Missile)
			end
			SobGroup_GuardSobGroup("tempStandard", "WaveFour_Turain_Carrier")
			SobGroup_GuardSobGroup("tempMissile", "WaveFour_Turain_Carrier")
			Event_Start("DestroyCorvetteSubSystem")
			Rule_Remove( "Rule_TurCorvetteHere" )
	end
end

function Rule_TurCorvetteTimeCount()
	if Timer_GetRemaining( 1 ) < 0.1 then
		Rule_Add("Rule_TurCorvetteHere")
		Timer_End( 1 )
		Timer_Start( 1, 60 )
	end
end

function Rule_TurCarrierEngineDamage()
	if SobGroup_Empty("TurHeavyCruiser")==1 then
		if SobGroup_GetHardPointHealth("WaveFour_Turain_Carrier", "Engine")<0.05 then
			SobGroup_SetHardPointHealth("WaveFour_Turain_Carrier", "Engine", 0.15)
		end
	end
end

function Rule_TurainFrigate_UnderAttack()
	if SobGroup_Empty("TurainFrigate")==0 then
		if SobGroup_UnderAttack("TurainFrigate")==1 then
			SobGroup_SetSpeed("TurainFrigate", 2)
		end
	end
end

function Rule_WaveFour_Turain_UnderAttack()
	if SobGroup_HealthPercentage("WaveFour_Turain_Carrier")<0.99 then
		Timer_Start( 1, 60 )
		SobGroup_GuardSobGroup("TurainFrigate", "WaveFour_Turain_Carrier")
		Rule_Add("Rule_TurCorvetteHere")
		Rule_Add("Rule_TurCorvetteTimeCount")
		Rule_AddInterval("Rule_TurCarrierEngineDamage",10)
		Rule_Remove( "Rule_WaveFour_Turain_UnderAttack" )
	end
end

function Rule_WaveFour_Turain_Death()
	if SobGroup_HealthPercentage("WaveFour_Turain_Carrier")==0 then
		Timer_End( 1 )
		if SobGroup_Count("TurainFrigate")>0 then
			SobGroup_Attack(3, "TurainFrigate", "OwnerCarrier")
		end
		Rule_Remove("Rule_TurCorvetteHere")
		Rule_Remove("Rule_TurCarrierEngineDamage")
		Rule_Remove("Rule_TurCorvetteTimeCount")
		Rule_Remove("Rule_WaveFour_Turain_Death")
	end
end

function Rule_OwnerCarrier_Death()
	if SobGroup_HealthPercentage("OwnerCarrier")<0.001 then
		Event_Start("OwnerCarrierDeath")
		Rule_Remove( "Rule_OwnerCarrier_Death" )
	end
end

function Rule_Player_Wins()
	local G1 = SobGroup_Empty("WaveFour_Turain_Carrier")
	local G2 = SobGroup_Empty("TurainFrigate")
	local G3 = SobGroup_Empty("tempStandard")
	local G4 = SobGroup_Empty("tempMissile")
	local G5 = SobGroup_Empty("WaveTwo_Turain_Fighter")
	local G6 = SobGroup_Empty("WaveTwo_Turain_Bomber")
	local G7 = SobGroup_Empty("TurHeavyCruiser")
	if G1==1 and G2==1 and G3==1 and G4==1 and G5==1 and G6==1 and G7==1 then
		if Event_IsDone("OwnerFrigateReturn")==1 then
			Event_Start("PlayerWins")
			Set_FX_Achievements_Value("EdenComplete",1)
		end
	end
end


Events = {}

Events.PlayerWins =
{
	{	
		HW2_Wait( 10 ),},
	{
		{ "Camera_AllowControl(0)", "", }, 
		{ "Universe_AllowPlayerOrders( 0 )", "", }, 	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" },
		{ "Sensors_EnableCameraZoom( 0 )", "", }, 
		{ "Sensors_Toggle( 0 )", "", },  },
	{	HW2_Letterbox( 1 ),HW2_Wait( 2 ), },
	{
		{	"Camera_AltFocus('OwnerCarrier', 1)",""}, HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent(Actor_AllShips, "$57100", 2), HW2_Wait( 0.5 ), },
	{
		HW2_SubTitleEvent(Actor_AllShips, "$57101", 2), HW2_Wait( 0.5 ), },
	{
		{ "Camera_Interpolate( 'here', 'Cam_FocusOnTransportCorps', 5 )", "", },
		{ "SobGroup_ExitHyperSpace('TransportCorps', 'Vol_convoy1')", ""},HW2_Wait( 10 ), },		
	{
		HW2_SubTitleEvent(Actor_Bishop, "$57102", 6), HW2_Wait( 1 ), },
	{
		HW2_SubTitleEvent(Actor_AllShips, "$57103", 2), HW2_Wait( 2 ), },		
	{ 
		{ "Universe_Fade( 1, 2 )", "", }, HW2_Wait(3), }, 
	{ HW2_LocationCardEvent("$57104", 4), }, 
	{ HW2_Wait(2), }, 		
	{ 
		{ "Camera_AllowControl(1)", "", }, 
    	{ "Profile_SetSingleMissionComplete('mini', 4, 1)", "", }, 
    	{ "FE_ExitToMainMenu()", "", }, 
    	{ "UI_DialogAccept()", "", }, 
	}, 
}
Events.RepairConvoy =
{
	{	HW2_SubTitleEvent(Actor_Bishop, "$57124", 5), HW2_Wait( 1 ), }, 
}

Events.DestroyCorvetteSubSystem =
{
	{ HW2_SubTitleEvent(Actor_AllShips, "$57123", 5), HW2_Wait( 1 ), }, 
}

Events.DestroyCarrierEngine =
{
	{ HW2_SubTitleEvent(Actor_AllShips, "$57105", 5), HW2_Wait( 1 ), }, 		
	{	HW2_SubTitleEvent(Actor_AllShips, "$57106", 5), HW2_Wait( 1 ), },
}

Events.DestroyHeavyCruiserEngine =
{
	{	HW2_SubTitleEvent(Actor_AllShips, "$57107", 5), HW2_Wait( 1 ), }, 		
	{	HW2_SubTitleEvent(Actor_AllShips, "$57108", 5), HW2_Wait( 1 ), },
}

Events.Turain_AttackWave1_Here =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" }, 
		{ "Sensors_Toggle( 0 )", "", },},
	{	
		HW2_Letterbox( 1 ), HW2_Wait( 2 ), { "Camera_FocusSave()", "", }, },
	{ 	
		HW2_SubTitleEvent(Actor_AllShips, "$57050", 2), 
		{ "Camera_UseCameraPoint( 'Cam_AttackWave1' )", "", }, },
	{	
		{ "Camera_FocusSobGroupWithBuffer( 'WaveOne2_Turain_Bombers', 150, 1000, 0.5 )", "", }, 
		HW2_SubTitleEvent(Actor_AllShips, "$57051", 5), 
		{ "addObjective('protectcollector')", "", },
		HW2_Wait(6), },
	{
		{ "Camera_FocusRestore()", "", },
		HW2_Letterbox( 0 ),
		HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.TurainResourceCarrierOut =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" }, HW2_Wait( 3 ), },
	{	
		HW2_SubTitleEvent(Actor_AllShips, "$57052", 5), 
		HW2_Wait( 6 ), },
	{	
		{ "completeObjective('protectcontainer')", "" }, },		
	{
		HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.ConvoyDown =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" }, 
		{ "Sensors_Toggle( 0 )", "", },},
	{	
		{ "Camera_FocusSobGroupWithBuffer( 'Convoy', 300, 1000, 0.5 )", "", }, 
		HW2_SubTitleEvent(Actor_AllShips, "$57053", 5), 
		HW2_Wait( 6 ), },
	{	
		{ "failObjective('protectconvoy')", "" },
		{ "setMissionComplete( 0 )", "" }, }, 
	{
		HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.ConvoySendMayday =
{
	{	
		HW2_SubTitleEvent(Actor_Bishop, "$57054", 5), 
		HW2_Wait( 1 ), },
}

Events.EnemyForceHere =
{
	{	
		HW2_SubTitleEvent(Actor_AllShips, "$57122", 5), 
		HW2_Wait( 1 ), },
}

Events.AllCollectorDeath =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, },
	{	
		HW2_SubTitleEvent(Actor_AllShips, "$57055", 5), 
		HW2_Wait( 6 ), },
	{	
		{ "failObjective('protectcollector')", "" },
		{ "setMissionComplete( 0 )", "" }, }, 
	{
		HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.OwnerCarrierDeath =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Sensors_Toggle( 0 )", "", },		
		HW2_Letterbox( 1 ), HW2_Wait( 2 ), },
	{	
		{ "Camera_AltFocus('OwnerCarrier', 1)",""},
		HW2_SubTitleEvent(Actor_FleetCommand, "$57056", 5), 
		HW2_Wait( 6 ), },
	{
		{ "failObjective('protectcarrier')", "" },
		{ "setMissionComplete( 0 )", "" },
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.ConvoyArrive =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" }, },
	{	
		{ "SobGroup_EnterHyperSpaceOffMap('Convoy')", "" },
		HW2_SubTitleEvent(Actor_Bishop, "$57057", 5), 
		HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent(Actor_AllShips, "$57058", 5), 
		HW2_Wait( 2 ), },
	{
		{ "completeObjective('protectconvoy')", "" },
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.protectStaticContainer =
{
	{
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Universe_EnableSkip( 1 )", "" },
		{ "Universe_SlowDown(0, 0)", "" },  },
	{
		HW2_Letterbox(1), HW2_Wait(2), 
		{ "Camera_FocusSave()", "", }, }, 
	{	
		{ "Sound_EnterIntelEvent()", "", }, 
		{ "Sensors_Toggle( 1 )", "", }, HW2_Wait(1), },
	{
		{ "pointer_Resourcecollector_id = HW2_CreateEventPointerSobGroup( 'tempResourcecollector')", "", }, 
		{ "Camera_FocusSobGroupWithBuffer( 'tempResourcecollector', 50, 1000, 0.5 )", "", }, 
		HW2_SubTitleEvent(Actor_AllShips, "$57059", 5),
		HW2_Wait(3), },
	{
		{ "Sensors_Toggle( 0 )", "", }, HW2_Wait(0.5), },
	{
		HW2_SubTitleEvent(Actor_AllShips, "$57060", 5), 	
		{ "EventPointer_Remove(pointer_Resourcecollector_id)", "", }, 
		{ "Camera_FocusSobGroupWithBuffer( 'tempResourcecollector', 100, 1000, 1.5 )", "", }, 
		HW2_Wait(4), },
	{ 	
		HW2_SubTitleEvent(Actor_AllShips, "$57061", 5), 
		{ "Camera_UseCameraPoint( 'Cam_StaticContainer3' )", "", }, HW2_Wait(1),
		{ "Camera_Interpolate( 'here', 'Cam_StaticContainer4', 3 )", "", },
		HW2_Wait(2), },
	{	
		HW2_SubTitleEvent(Actor_AllShips, "$57062", 5), 
		{ "addObjective('protectcontainer',1)", "", },
		HW2_Wait(2), }, 
	{ 	HW2_Letterbox(0), 
		{ "Camera_FocusRestore()", "", }, 
		{ "Universe_SlowDown(1, 0)", "", }, 
		{ "Sound_ExitIntelEvent()", "", }, 
		{ "Sensors_Toggle( 0 )", "", }, 
		{ "Universe_EnableSkip(0)", "", }, }, 
}

Events.Turain_Resourcecollector_AllDeath =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		--{ "Universe_EnableSkip(1)", "" }, 
		},
	{	
		HW2_Letterbox( 1 ), HW2_Wait( 2 ), 
		{ "Camera_FocusSave()", "", }, },
	{
		{ "Camera_AltFocus('OwnerCarrier', 1)",""}, 
		HW2_SubTitleEvent( Actor_AllShips, "$57063", 5 ),HW2_Wait( 2 ),},
	{	 
		HW2_SubTitleEvent( Actor_AllShips, "$57064", 7 ),HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57065", 5 ),HW2_Wait( 2 ), },
	{	
		HW2_SubTitleEvent( Actor_AllShips, "$57066", 9 ),HW2_Wait( 2 ), },
	{
		{ "Camera_FocusRestore()", "", },
		HW2_Letterbox( 0 ),  HW2_Wait( 2 ), 
		--{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.findTurainResourcecollectorA =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" }, },
	{
		HW2_Letterbox(1), HW2_Wait(2), 
		{ "Camera_FocusSave()", "", }, }, 
	{	
		{ "Sensors_Toggle( 1 )", "", }, HW2_Wait(1), },
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57067", 5 ),
		{ "Camera_FocusSobGroupWithBuffer( 'tempResourcecollector', 300, 1000, 1.5 )", "", }, HW2_Wait( 2 ),},
	{
		{ "Camera_FocusSobGroupWithBuffer( 'Resource_Turain_Carrier', 500, 1000, 1.5 )", "", },
		{ "pointer_ResourCarrier_id = HW2_CreateEventPointerSobGroup( 'Resource_Turain_Carrier')", "", }, 
		HW2_SubTitleEvent( Actor_AllShips, "$57068", 5 ),
		HW2_Wait( 3 ),},
	{
		{ "EventPointer_Remove(pointer_ResourCarrier_id)", "", }, 
		HW2_Letterbox( 0 ),  HW2_Wait( 2 ),
		{ "Sensors_Toggle( 0 )", "", },
		{ "Camera_FocusRestore()", "", }, 
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.Turain_Resourcecollector_Succeed =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" }, },
	{	
		HW2_Letterbox( 1 ),	HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57069", 5 ),HW2_Wait( 2 ),},
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57070", 5 ),HW2_Wait( 2 ), },
	{	
		{ "failObjective('protectcontainer')", "" }, },
	{
		HW2_Letterbox( 0 ),  HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.OwnerFrigateReturn =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),  HW2_Wait( 2 ),},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$57071", 5 ),HW2_Wait( 2 ),},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$57072", 5 ),HW2_Wait( 2 ), },
	{
		HW2_Letterbox( 0 ),  HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.OwnerFrigateComming =
{
	{ HW2_Wait( 10 ), },
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" },
		{ "Sensors_Toggle( 0 )", "", },
		HW2_Letterbox( 1 ),  HW2_Wait( 2 ),	{ "Camera_FocusSave()", "", }, },
	{	
		HW2_SubTitleEvent( Actor_AllShips, "$57073", 3 ),HW2_Wait( 0.5 ), },
	{
		{ "Camera_Interpolate( 'here', 'Cam_FocusOnFrigate', 1 )", "", },
		{ "SobGroup_ExitHyperSpace('OwnerFrigate', 'Vol_ownerfrigate')", ""},
		{ "SobGroup_ExitHyperSpace('OwnerCorvette', 'Vol_ownercorvette')", ""},HW2_Wait( 10 ), },
	{
		{ "SobGroup_FormStrikeGroup('OwnerFrigate', 'wall')", ""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$57074", 5 ),HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$57075", 5 ),HW2_Wait( 2 ), },
	{
		{ "completeObjective('callbackup')", "" },
		{ "Camera_FocusRestore()", "", },
		HW2_Letterbox( 0 ),  HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.WaveFourTurainComing =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		--{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),  HW2_Wait( 2 ),
		{ "Camera_FocusSave()", "", }, },
	{	
		{ "Sound_MusicPlay('Data:sound/music/battle/battle_01')", ""},
		{ "Sensors_Toggle( 1 )", "", }, HW2_Wait(1), },
	{
	  	{ "Camera_FocusSobGroupWithBuffer( 'WaveFour_Turain_Carrier', 2000, 1000, 1.5 )", "", }, HW2_Wait( 1 ), },
	{	
		{ "pointer_TurainCarrier_id = HW2_CreateEventPointerSobGroup( 'WaveFour_Turain_Carrier')", "", },
		HW2_Wait( 0.3 ), },
	{	
		{ "pointer_TurHeavyCruiser_id = HW2_CreateEventPointerSobGroup( 'TurHeavyCruiser')", "", },
		HW2_Wait( 0.3 ), },
	{	
		{ "pointer_TurainFrigate_id = HW2_CreateEventPointerSobGroup( 'TurainFrigate')", "", },
		HW2_Wait( 0.3 ), },
	{	
		HW2_SubTitleEvent( Actor_AllShips, "$57076", 5 ), },
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57077", 5 ),HW2_Wait( 3 ), },
	{		 
		{ "EventPointer_Remove(pointer_TurainCarrier_id)", "", },
		{ "EventPointer_Remove(pointer_TurHeavyCruiser_id)", "", },
		{ "EventPointer_Remove(pointer_TurainFrigate_id)", "", }, },
	{
		{ "Camera_AltFocus('Convoy', 1)",""},
		HW2_SubTitleEvent(Actor_Bishop, "$57120", 3), }, 
	{		
		HW2_SubTitleEvent(Actor_Bishop, "$57078", 6), }, 
	{
		HW2_SubTitleEvent(Actor_Bishop, "$57079", 3),
		HW2_Wait(2), },
	{
		{ "Camera_FocusSobGroupWithBuffer( 'EnemyProbe1', 1000, 1000, 1.5 )", "", },
		{ "pointer_enemyprobe1_id = HW2_CreateEventPointerSobGroup( 'EnemyProbe1')", "", }, 
		HW2_SubTitleEvent(Actor_Bishop, "$57080", 3), }, 
	{	HW2_Wait(1), },
	{	
		{ "Camera_FocusSobGroupWithBuffer( 'EnemyProbe2', 1000, 1000, 1.5 )", "", },
		{ "pointer_enemyprobe2_id = HW2_CreateEventPointerSobGroup( 'EnemyProbe2')", "", }, 
		HW2_SubTitleEvent(Actor_Bishop, "$57081", 3), }, 
	{	HW2_Wait(1), },
	{ 	
		HW2_SubTitleEvent(Actor_Bishop, "$57082", 4), 
		{ "Timer_Start( 0, 210 )", "", }, 
		{ "Timer_Pause( 0 )", "", },
		{	"Rule_Add('Rule_TimeOver')", "", }, 
		{ "Subtitle_TimeCounter( 0, 57083 )", "", },
		{ "addObjective('callbackup',1)", "", }, }, 
	{	HW2_Wait(2), }, 
	{
		{ "EventPointer_Remove(pointer_enemyprobe1_id)", "", },
		{ "EventPointer_Remove(pointer_enemyprobe2_id)", "", }, 		
		{ "Sensors_Toggle( 0 )", "", },
		{ "pointer_EnemyProbe1_id = Ping_AddPoint('$57119', 'anomaly', 'Vol_enemyprobe1')", "", },
		{ "pointer_EnemyProbe2_id = Ping_AddPoint('$57119', 'anomaly', 'Vol_enemyprobe2')", "", },
		{ "pointer_EnemyCarrier_id = Ping_AddSobGroup('$57121', 'anomaly', 'WaveFour_Turain_Carrier')","",},
		{ "Ping_LabelVisible(pointer_EnemyProbe1_id, 1)","",},
		{ "Ping_LabelVisible(pointer_EnemyProbe2_id, 1)","",},
		{ "Ping_LabelVisible(pointer_EnemyCarrier_id, 1)","",},
		{ "Rule_Add('Rule_ClearPointer')", "",},
		{ "Timer_Resume(0)", "", }, 
		HW2_Letterbox(0), HW2_Wait(2), },	
	{
		{ "addObjective('protectcarrier')", "" ,},
		HW2_Letterbox( 0 ),  HW2_Wait( 2 ),
		{ "Sensors_Toggle( 0 )", "", },
		{ "Camera_FocusRestore()", "", },
		--{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.ConvoyUnderAttack =
{
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },
		{ "Sound_EnterIntelEvent()", "" }, 
		{ "Universe_EnableSkip(1)", "" },
		{ "Sensors_Toggle( 0 )", "", },
		HW2_Letterbox( 1 ),  HW2_Wait( 2 ),
		{ "Camera_FocusSave()", "", }, },
	{
		--{ "Camera_UseCameraPoint( 'Cam_FocusOnConvoy' )", "", },
		{ "Camera_AltFocus('Convoy', 1)",""},
		HW2_Wait( 2 ),},
	{
		HW2_SubTitleEvent( Actor_Bishop, "$57084", 5 ),HW2_Wait( 2 ),},
	{
		HW2_SubTitleEvent( Actor_Bishop, "$57085", 5 ),HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57086", 5 ),HW2_Wait( 2 ), },		
	{
	  { "addObjective('protectconvoy')", "" },
		{ "Camera_FocusRestore()", "", },
		HW2_Letterbox( 0 ),  HW2_Wait( 2 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()", "" }, },
}

Events.campaign_start =
{
	{
		{ "Camera_SetLetterboxStateNoUI( 1, 0 )", "" },
		{ "Camera_AllowControl(0)", "", }, 
		{ "Universe_AllowPlayerOrders( 0 )", "", }, 	
		{ "Sound_EnableAllSpeech( 0 )", "" },
		{ "Universe_EnableSkip(1)", "" }, --<
		{ "Sensors_Toggle( 0 )", "", },  
		{ "Universe_Fade( 1, 0 )", "", }, 
	}, 
	{ HW2_Wait(1), },
	{ 
		HW2_LocationCardEvent("$57087", 5), 	
		{ "Camera_UseCameraPoint( 'Cam_Start' )", "", }, HW2_Wait( 6 ),
	},
	{
		{ "Universe_Fade( 0, 3 )", "", },
		{"SobGroup_DockSobGroup( 'Patrol', 'OwnerCarrier' )", "",},
		HW2_Wait( 1 ), 
	},
	{ HW2_Pause(1), },
	{	
		{ "Sound_EnableAllSpeech( 1 )", "" },	
		{ "Camera_Interpolate( 'here', 'Cam_Start1', 12 )", "", }, 
		HW2_SubTitleEvent( Actor_FleetCommand, "$57088", 12 ), },
	{
		{ "Camera_Interpolate( 'here', 'Cam_Start2', 10 )", "", },
		HW2_SubTitleEvent( Actor_FleetCommand, "$57089", 10 ), },
	{	
		{ "Camera_Interpolate( 'here', 'Cam_Start4', 12 )", "", },
		HW2_SubTitleEvent( Actor_FleetCommand, "$57090", 12 ), },
	--{ { "Camera_Interpolate( 'here', 'Cam_Start4', 8 )", "", }, HW2_Wait( 9 ),},
	--{ { "Camera_Interpolate( 'here', 'Cam_Start5', 0.1 )", "", }, },
	{ { "Camera_UseCameraPoint( 'Cam_Start5' )", "", }, },
	--{ HW2_Wait(1), },
	{ HW2_Pause(0), },
	{
		{ "Camera_FocusSobGroupWithBuffer( 'Patrol', 100, 1000, 2 )", "", }, HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$57091", 7 ), },
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57092", 5 ), },
	{
		{ "SobGroup_Attack(0, 'Patrol', 'TurProbe')", ""}, },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$57097", 2 ), HW2_Wait( 4 ),},
	{
		{ "Camera_FocusSobGroupWithBuffer( 'TurProbe', 100, 1000, 1 )", "", }, HW2_Wait( 1 ),},	
	{	
		{ "SobGroup_TakeDamage( 'TurProbe', 1)" , "" },
		{ "SobGroup_DockSobGroup( 'Patrol', 'OwnerCarrier')", "" },HW2_Wait( 2 ), },
	{
		{ "Camera_FocusSobGroupWithBuffer( 'Patrol', 100, 1000, 2 )", "", }, HW2_Wait( 2 ), },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$57093", 3 ), },	
	{
		HW2_SubTitleEvent( Actor_AllShips, "$57094", 3 ), },
	{ 
		{ "Universe_Fade( 1, 2 )", "", },},
	{
		HW2_Wait( 3 ),},
	{
		{ "Camera_AltFocus('OwnerCarrier', 0)", "" }, },
	{ HW2_LocationCardEvent("$57095", 5), HW2_Wait( 1 ),}, 
	{ HW2_LocationCardEvent("$57096", 5), HW2_Wait( 1 ),}, 
	{
		{ "Timer_Start( 3, 60 )", "", }, 
		{ "Rule_Add( 'Rule_Harvesting' )", "" },
		{ "Camera_SetLetterboxStateNoUI( 0, 0 )", "" },
		{ "Universe_Fade( 0, 2 )", "", }, 
		{ "Universe_EnableSkip( 0 )", "" },
		{ "Camera_AllowControl( 1 )", "", },
		{ "Universe_AllowPlayerOrders( 1 )", "", }, },
}
