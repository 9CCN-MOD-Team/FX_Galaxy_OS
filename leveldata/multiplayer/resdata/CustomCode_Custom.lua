dofilepath("data:scripts/camerashake.lua")

function X_IntervalHelper(shipID)
	Rule_RemoveParam(shipID)
end

function ProtectFX_Create(iAB,iGroup)
	if (SobGroup_AreAllInRealSpace(iGroup)==1) and (SobGroup_GroupInGroup("FXProtectGroup"..iAB,iGroup)==0) then
		SobGroup_SobGroupAdd("FXProtectGroup"..iAB,iGroup)
		SobGroup_AbilityActivate(iGroup, iAB, 1)
	end
end

function Player_GetLOD(iPlayer)
	local l_LOD=Player_GetLevelOfDifficulty(iPlayer) 
	if (l_LOD==0) then
		return 0
	elseif (Universe_RulesName()=="FXSINGLEPLAYER") then
		return tonumber(GameEvent_IsListening(6000+iPlayer))
	else
		return l_LOD
	end
end

X_CustomFunctionCreate={}
X_CustomFunctionUpdate={}
X_CustomFunctionDestroy={}
--Write your own custom code for units here follow the format below:
--X_CustomFunctionCreate[<ShipType>]=function(CustomGroup, playerIndex, shipID)
--
--<your code>
--
--end
--X_CustomFunctionUpdate[<ShipType>]=function(CustomGroup, playerIndex, shipID)
--
--<your code>
--
--end
--X_CustomFunctionDestroy[<ShipType>]=function(CustomGroup, playerIndex, shipID)
--
--<your code>
--
--end
X_CustomFunctionUpdate["hgn_shipyard"]=function (CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
end

X_CustomFunctionUpdate["vgr_shipyard"]=function (CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
end

X_CustomFunctionUpdate["tur_shipyard"]=function (CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
	ProtectFX_Create(AB_Attack, CustomGroup)
end

X_CustomFunctionUpdate["tai_shipyard"]=function (CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
end

X_CustomFunctionUpdate["tai_mothership"]=function (CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
end

X_CustomFunctionUpdate["kus_mothership"]=function (CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
end

X_CustomFunctionCreate["vgr_carrier"]=function (CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("AIAttackGroup")
end

--kus_repaircarrier
X_CustomFunctionUpdate["kus_mothership"]=function (CustomGroup, playerIndex, shipID)
	if (Race_GetName(Player_GetRace(playerIndex))=="Kushan")then
		local iRSM=
		{
			{"Kus_r", "Kus_ResearchShip"},
			{"Kus_r_PlasmaBombs", "Kus_ResearchShip_1"},
			{"Kus_ra_gravitywell", "Kus_ResearchShip_2"},
			{"Kus_r_Corvette", "Kus_ResearchShip_3"},
			{"Kus_r_HeavyCorvette", "Kus_ResearchShip_4"},
			{"Kus_r_rapidturret", "Kus_ResearchShip_5"},
			{"Kus_ra", "Kus_ResearchShipAdv"},
			{"Kus_ra_capship", "Kus_ResearchShipAdv_1"},
			{"Kus_r_ioncannon", "Kus_ResearchShipAdv_2"},
			{"Kus_ra_heavygun", "Kus_ResearchShipAdv_3"},
			{"Kus_ra_missile", "Kus_ResearchShipAdv_4"},
			{"Kus_r_cloakmodule", "Kus_ResearchShipAdv_5"},
		}
		for iIndex,iItem in iRSM do
			if (SobGroup_HasSubsystem(CustomGroup, iItem[1])==1) then
				SobGroup_CreateShip(CustomGroup, iItem[2])
				SobGroup_SetHardPointHealth(CustomGroup, "Generic1", 0)
				break
			end
		end
	end
end

--X_CustomFunctionUpdate["kpr_carrier"]=function (CustomGroup, playerIndex, shipID)
--	if (Race_GetName(Player_GetRace(playerIndex))=="Keeper")then
--		local iRSM=
--		{
--			{"kpr_BUILD", "Kpr_ResearchShip_1"},
--			{"kpr_Hyperspace", "Kpr_ResearchShip_2"},
--			{"kpr_Core", "Kpr_ResearchShip_3"},
--			{"kpr_E_ioncannon", "kpr_Energy_ioncannon"},
--			{"kpr_E_PhasedCannon", "kpr_Energy_PhasedCannon"},
--			{"kpr_E_photonBomb", "kpr_Energy_photonBomb"},
--			{"kpr_E_photoncannon", "kpr_Energy_photoncannon"},
--			{"kpr_E_Pulsar", "kpr_Energy_Pulsar"},
--			{"kpr_E_SuperPulsar", "kpr_Energy_SuperPulsar"},
--		}
--		for iIndex,iItem in iRSM do
--			if (SobGroup_HasSubsystem(CustomGroup, iItem[1])==1) then
--				SobGroup_CreateShip(CustomGroup, iItem[2])
--				SobGroup_SetHardPointHealth(CustomGroup, "Generic1", 0)
--				break
--			end
--		end
--	end
--end

X_CustomFunctionCreate["kpr_balcoragate"]=function (CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("researchship_temp")
	SobGroup_Create("LatchDockTempGroup"..shipID)
	Volume_AddSphere("LatchDockTempVolume", {0,100000,0}, 0)
end

X_CustomFunctionCreate["kpr_sajuuks"]=function (CustomGroup, playerIndex, shipID)	
	Player_RestrictBuildOption(playerIndex, "kpr_sajuuks")
end

X_CustomFunctionUpdate["kpr_balcoragate"]=function (CustomGroup, playerIndex, shipID)		
	for i = 1,3,1 do
		SobGroup_CreateIfNotExist("kpr_researchship_" .. tostring(i) .. tostring(playerIndex))		
	end
	for i = 1,3,1 do
		SobGroup_Clear("kpr_researchship_" .. tostring(i) .. tostring(playerIndex))
		SobGroup_FillShipsByType("kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "Player_Ships"..playerIndex, "kpr_researchship_"..i)
	end
	local iAbility = {AB_Lights,AB_HyperspaceInhibitor,AB_SensorPing}
	local iFlag = {0,0,0,}
	for i = 1,3,1 do		
		if SobGroup_Empty("kpr_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 and SobGroup_AreAllInRealSpace("kpr_researchship_" .. tostring(i) .. tostring(playerIndex))==1 then
			if SobGroup_AreAnyOfTheseTypes("kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "kpr_researchship_"..i) == 1 then
				if SobGroup_IsDocked("kpr_researchship_" .. tostring(i) .. tostring(playerIndex))==0 then 
					SobGroup_DockSobGroupAndStayDocked("kpr_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup)
				else
					iFlag[i]=1
				end
			end
		end		
		if SobGroup_CanDoAbility(CustomGroup, iAbility[i])==1 and iFlag[i]==0 then
			SobGroup_AbilityActivate(CustomGroup, iAbility[i], 0)
			FX_StopEvent( "kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "Pulse" )
			if (i==1) then
				FX_StopEvent(CustomGroup, "guang")
			end
			if (i~=2) then        
				FX_StopEvent( "kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "Pulse2" )
			end
		elseif SobGroup_CanDoAbility(CustomGroup, iAbility[i])==0 and iFlag[i]==1  then 
			SobGroup_AbilityActivate(CustomGroup, iAbility[i], 1)
			FX_StartEvent( "kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "Activate" )
			FX_StartEvent( "kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "Pulse" )
			if (i==1) then
				FX_StartEvent(CustomGroup, "guang")
			end
			if (i~=2) then        
				FX_StartEvent( "kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "Activate2" )
				FX_StartEvent( "kpr_researchship_" .. tostring(i) .. tostring(playerIndex), "Pulse2" )
			end
		end
	end
	if (SobGroup_AreAllInRealSpace(CustomGroup)==1) then
		if (SobGroup_Empty("LatchDockTempGroup"..shipID)==0) then
			SobGroup_Spawn("LatchDockTempGroup"..shipID, "LatchDockTempVolume")
			SobGroup_DockSobGroupInstant("LatchDockTempGroup"..shipID, CustomGroup)
			SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 0)
			SobGroup_Clear("LatchDockTempGroup"..shipID)
		end
	else
		SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "LatchDockTempGroup"..shipID)
		SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 1)
		SobGroup_Despawn("LatchDockTempGroup"..shipID)
	end
end

X_CustomFunctionDestroy["kpr_balcoragate"]=function (CustomGroup, playerIndex, shipID)
	if (SobGroup_Empty("LatchDockTempGroup"..shipID)==0) then
		SobGroup_SetHidden( "LatchDockTempGroup"..shipID, 0)
		SobGroup_Clear("LatchDockTempGroup"..shipID)
	end
	FX_StopEvent( "kpr_researchship_1"..tostring(playerIndex), "Pulse" )
	FX_StopEvent( "kpr_researchship_2"..tostring(playerIndex), "Pulse" )
	FX_StopEvent( "kpr_researchship_3"..tostring(playerIndex), "Pulse" )
	FX_StopEvent( "kpr_researchship_1"..tostring(playerIndex), "Pulse2" )
	FX_StopEvent( "kpr_researchship_3"..tostring(playerIndex), "Pulse2" )
end

X_CustomFunctionUpdate["hgn_lightcruiser"]=function (CustomGroup, playerIndex, shipID)
	if (Race_GetName(Player_GetRace(playerIndex))=="Hiigaran")then
		if (SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_Turret_f")==1)and(SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_Turret")==1)and(Player_GetLOD(playerIndex) > 1)and(SobGroup_IsDoingAbility(CustomGroup,AB_Attack)==0)and(SobGroup_HasSubsystem("Player_Ships"..playerIndex, "hgn_sy_production_capshipadvanced")==1)then
			SobGroup_SetHardPointHealth(CustomGroup, "Generic1", 0)
			Player_SetRU(playerIndex,Player_GetRU(playerIndex)+400)
		end
		if (SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_HeavyTurret_f")==1)and(SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_HeavyTurret")==0)then
			SobGroup_CreateSubSystem(CustomGroup, "hgn_lbc_HeavyTurret")
		elseif (SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_Turret_f")==1)and(SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_Turret")==0)then
			SobGroup_CreateSubSystem(CustomGroup, "hgn_lbc_Turret")
		elseif (SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_Turret_f")==0)and(SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_Turret")==1)then
			SobGroup_SetHardPointHealth(CustomGroup, "Generic2", 0)
		elseif (SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_HeavyTurret_f")==0)and(SobGroup_HasSubsystem(CustomGroup, "hgn_lbc_HeavyTurret")==1)then
			SobGroup_SetHardPointHealth(CustomGroup, "Generic2", 0)
		end
	end
end

X_CustomFunctionCreate["kad_variationswarmer"]=function(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("KVS_Resourcer"..shipID)
end

X_CustomFunctionUpdate["kad_variationswarmer"]=function(CustomGroup, playerIndex, shipID)
	if ((Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_mothershipdark")==0)) then
		if (SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==1) then
			SobGroup_CloakToggle(CustomGroup)
		end
		if (SobGroup_CanDoAbility(CustomGroup, AB_Cloak)==1) then
			SobGroup_AbilityActivate(CustomGroup, AB_Cloak, 0)
		end
	else
		if (SobGroup_CanDoAbility(CustomGroup, AB_Cloak)==0) then
			SobGroup_AbilityActivate(CustomGroup, AB_Cloak, 1)
		end
		if (SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==0) then
			SobGroup_CloakToggle(CustomGroup)
		end
		if(Player_GetLOD(playerIndex) > 3)and(Player_HasResearch(playerIndex,"cpuplayers_harmless")==0)and(Player_HasResearch(playerIndex,"cpuplayers_defensive")==0)then
			if(SobGroup_Empty("KVS_Resourcer"..shipID) == 1)then
				local iTarget=0
				for ipi=0,Universe_PlayerCount()-1 do
					if (ipi~=playerIndex) then
						if (AreAllied(ipi,playerIndex)==0)then
							SobGroup_Clear("UnitReplacementTempGroup")
							local iCollectorTable={"hgn_resourcecollector","vgr_resourcecollector","kpr_resourcecollector","tai_resourcecollector","kad_salvager","tur_resourcecollector","hgn_resourcecollector","kus_resourcecollector",}
							Player_FillShipsByType("UnitReplacementTempGroup", ipi, iCollectorTable[PlayerRace_GetNumber(ipi,"raceID", 1.0)])
							if(SobGroup_Empty("UnitReplacementTempGroup") == 0)then
								SobGroup_Clear("KVS_Resourcer"..shipID)
								local CollectorIndex=0
								while(SobGroup_Empty("KVS_Resourcer"..shipID) == 1)and(CollectorIndex<SobGroup_Count("UnitReplacementTempGroup"))do
									SobGroup_FillShipsByIndexRange("KVS_Resourcer"..shipID, "UnitReplacementTempGroup", CollectorIndex, 1)
									if(SobGroup_IsDocked("KVS_Resourcer"..shipID) == 1)then
										SobGroup_Clear("KVS_Resourcer"..shipID)
									end
									CollectorIndex=CollectorIndex+1 
								end
								if(SobGroup_Empty("KVS_Resourcer"..shipID) == 0)then
									iTarget=1
									SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
									break
								end
							end
						end
					end
				end
				if (iTarget==0)then
					SobGroup_SobGroupAdd("AITempAddGroup",CustomGroup)
				end
			elseif(SobGroup_IsDoingAbility(CustomGroup,AB_Attack)==0)and(SobGroup_HealthPercentage(CustomGroup)==1)then
				SobGroup_Clear("UnitReplacementTempGroup")
				SobGroup_FillProximitySobGroup("UnitReplacementTempGroup", "KVS_Resourcer"..shipID, CustomGroup, 1000)
				if(SobGroup_Empty("UnitReplacementTempGroup")==0)then
					SobGroup_Attack(playerIndex, CustomGroup,"KVS_Resourcer"..shipID)
				elseif(SobGroup_IsDoingAbility(CustomGroup,AB_Move)==0)then
					SobGroup_MoveToSobGroup(CustomGroup,"KVS_Resourcer"..shipID)
				end
			elseif(SobGroup_IsDocked("KVS_Resourcer"..shipID) == 1)then
				SobGroup_Clear("KVS_Resourcer"..shipID)
			end
		end
	end
end

X_CustomFunctionCreate["kus_repaircarrier"]=function(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("AIRepairGroup")
	SobGroup_CreateIfNotExist("KRC_RepairTarget"..shipID)
end

X_CustomFunctionUpdate["kus_repaircarrier"]=function(CustomGroup, playerIndex, shipID)
	if(Player_GetLOD(playerIndex) > 1)then
		--if (SobGroup_CanDoAbility(CustomGroup,AB_Repair)==0)then
			--AI控制时赋予维修能力
		--	SobGroup_AbilityActivate(CustomGroup, AB_Repair, 1)
		--end
		SobGroup_Clear("UnitCharacteristicTempGroup")
		SobGroup_Clear("UnitCharacteristicTempGroup2")
		SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "Player_Ships"..playerIndex, "attackFamily", "Frigate")
		SobGroup_SobGroupAdd("UnitCharacteristicTempGroup","UnitCharacteristicTempGroup2")
		SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "Player_Ships"..playerIndex, "attackFamily", "Capturer")
		SobGroup_SobGroupAdd("UnitCharacteristicTempGroup","UnitCharacteristicTempGroup2")
		SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "Player_Ships"..playerIndex, "attackFamily", "SmallCapitalShip")
		SobGroup_SobGroupAdd("UnitCharacteristicTempGroup","UnitCharacteristicTempGroup2")
		SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "Player_Ships"..playerIndex, "attackFamily", "BigCapitalShip")
		SobGroup_SobGroupAdd("UnitCharacteristicTempGroup","UnitCharacteristicTempGroup2")
		SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "Player_Ships"..playerIndex, "attackFamily", "Mothership")
		SobGroup_SobGroupAdd("UnitCharacteristicTempGroup","UnitCharacteristicTempGroup2")
		SobGroup_FilterInclude("UnitCharacteristicTempGroup2", "Player_Ships"..playerIndex, "attackFamily", "ResourceLarge")
		SobGroup_SobGroupAdd("UnitCharacteristicTempGroup","UnitCharacteristicTempGroup2")
		SobGroup_FillSobGroupByHealthBelow("UnitCharacteristicTempGroup2","UnitCharacteristicTempGroup",1)
		if(SobGroup_Empty("UnitCharacteristicTempGroup2")==0)then
			if (SobGroup_GroupInGroup("AIRepairGroup",CustomGroup)==0)then
			--舰队受损则脱离AI控制
				if (SobGroup_Empty("AITempRemoveGroup")==1)then
					SobGroup_SobGroupAdd("AIRepairGroup",CustomGroup)
					SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
				end
			elseif(SobGroup_IsDoingAbility(CustomGroup,AB_Guard)==0)or(SobGroup_Empty("KRC_RepairTarget"..shipID)==1)or(SobGroup_HealthPercentage("KRC_RepairTarget"..shipID)==1)then
				--接近受损单位			
				SobGroup_Clear("KRC_RepairTarget"..shipID)
				local CollectorIndex=0
				while(SobGroup_Empty("KRC_RepairTarget"..shipID) == 1)and(CollectorIndex<SobGroup_Count("UnitCharacteristicTempGroup2"))do
					SobGroup_FillShipsByIndexRange("KRC_RepairTarget"..shipID, "UnitCharacteristicTempGroup2", CollectorIndex, 1)
					if(SobGroup_HealthPercentage("KRC_RepairTarget"..shipID) == 1)then
						SobGroup_Clear("KRC_RepairTarget"..shipID)
					end
					CollectorIndex=CollectorIndex+1 
				end
				SobGroup_GuardSobGroup(CustomGroup, "KRC_RepairTarget"..shipID)
			end
		else
			--舰队完好则交还AI控制
			if (SobGroup_Empty("AITempAddGroup")==1) then
				SobGroup_RemoveSobGroup("AIRepairGroup",CustomGroup)
				SobGroup_SobGroupAdd("AITempAddGroup",CustomGroup)
			end
		end
	--elseif (SobGroup_CanDoAbility(CustomGroup,AB_Repair)==1)then
		--玩家控制时取消维修能力
		--SobGroup_AbilityActivate(CustomGroup, AB_Repair, 0)
	end
end

--tur_torpedocorvette

X_CustomFunctionCreate["tur_torpedocorvette"]=function(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("tur_torpedo"..shipID)
end

X_CustomFunctionUpdate["tur_torpedocorvette"]=function(CustomGroup, playerIndex, shipID)
	if(SobGroup_Empty("tur_torpedo"..shipID)==1)then
		FX_StartEvent(CustomGroup, "Torpedo")
		SobGroup_SobGroupAdd("tur_torpedo"..shipID,CustomGroup)
	elseif(SobGroup_CanDoAbility(CustomGroup, AB_Attack)==1)then
	    Selection_Create("AllMissiles")
	    if (Selection_GetMissiles("AllMissiles") > 0) then
			Selection_Create("OwnedMissiles"..playerIndex)
		    if Selection_FilterInclude("OwnedMissiles"..playerIndex, "AllMissiles", "PlayerOwner", ""..playerIndex, "")>0 then
				local LaunchSite = SobGroup_GetPosition(CustomGroup)
				local LaunchSitePos = LaunchSite[1]..","..LaunchSite[2]..","..LaunchSite[3]
			    Selection_Create("SelfTorpedo"..shipID)
			    if (Selection_FilterInclude("SelfTorpedo"..shipID, "OwnedMissiles"..playerIndex, "NearPoint", LaunchSitePos, ""..20)>0)and(SobGroup_IsDoingAbility(CustomGroup, AB_Attack)==1) then
					SobGroup_AbilityActivate(CustomGroup, AB_Attack, 0)
					SobGroup_DockSobGroup(CustomGroup, "Player_Ships"..playerIndex)
					xSetShipIdioStateKeyFromCustomCode(shipID,1,"On")
					FX_StopEvent(CustomGroup, "Torpedo")
				end
			end
		end
	elseif(SobGroup_IsDocked(CustomGroup)==1)then
		FX_StartEvent(CustomGroup, "Torpedo")
		SobGroup_AbilityActivate(CustomGroup, AB_Attack, 1)
		xSetShipIdioStateKeyFromCustomCode(shipID,1,"Off")
	end
end

X_CustomFunctionDestroy["tur_torpedocorvette"]=function(CustomGroup, playerIndex, shipID)
	if(SobGroup_CanDoAbility(CustomGroup, AB_Attack)==1)then
		FX_StartEvent(CustomGroup, "Death2")
	else
		FX_StartEvent(CustomGroup, "Death1")
	end
end

--X_CustomFunctionDestroy["kad_mothership"]=function(CustomGroup, playerIndex, shipID)
	--if(SobGroup_AreAllInHyperspace(CustomGroup)==0)then
		--shockwave(playerIndex,CustomGroup)	
	--end
--end

X_CustomFunctionUpdate["kad_guardianspirit"]=function(CustomGroup, playerIndex, shipID)
		if ((Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_mothershipdark")==0)or(SobGroup_GetROE(CustomGroup)~=2)) then
			if (SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==1) then
				SobGroup_CloakToggle(CustomGroup)
			end
			if (SobGroup_CanDoAbility(CustomGroup, AB_Cloak)==1) then
				SobGroup_AbilityActivate(CustomGroup, AB_Cloak, 0)
			end
		else
			if (SobGroup_CanDoAbility(CustomGroup, AB_Cloak)==0) then
				SobGroup_AbilityActivate(CustomGroup, AB_Cloak, 1)
			end
			if (SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==0) then
				SobGroup_CloakToggle(CustomGroup)
			end
		end
end

X_CustomFunctionDestroy["kad_guardianspirit"]=function(CustomGroup, playerIndex, shipID)
	shockwave(playerIndex,CustomGroup)	
end

X_CustomFunctionUpdate["kad_mothership"]=function(CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
	ProtectFX_Create(AB_Attack, CustomGroup)
	if (Race_GetName(Player_GetRace(playerIndex))=="Kadesh")then
		if(SobGroup_HasSubsystem(CustomGroup, "Kad_M_CapShip")==0)then
			if(Player_HasResearch(playerIndex,"KadCapital1")==1)then
				SobGroup_CreateSubSystem(CustomGroup, "Kad_M_CapShip")
			end
		end
	end
end

X_CustomFunctionUpdate["kad_fuelpod"]=function(CustomGroup, playerIndex, shipID)
	if (Race_GetName(Player_GetRace(playerIndex))~="Kadesh") then
		if (SobGroup_HasSubsystem(CustomGroup, "kad_module_firecontrol")==1) then
			SobGroup_SetHardPointHealth(CustomGroup, "Generic 1", 0)
		end
	end
end

X_CustomFunctionDestroy["kad_fuelpod"]=function(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("SupportPodGroup"..shipID)
	SobGroup_AbilityActivate("SupportPodGroup"..shipID, AB_UseSpecialWeaponsInNormalAttack, 0)
end

X_CustomFunctionUpdate["kad_mothershiplight"]=function (CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
	ProtectFX_Create(AB_Attack, CustomGroup)
end

X_CustomFunctionDestroy["kad_mothershiplight"]=function(CustomGroup, playerIndex, shipID)
	shockwave(playerIndex,CustomGroup)	
end

X_CustomFunctionDestroy["kpr_destroyer1"]=function(CustomGroup, playerIndex, shipID)
	shockwave(playerIndex,CustomGroup)	
end

X_CustomFunctionDestroy["tai_missiledestroyer"]=function(CustomGroup, playerIndex, shipID)
	shockwave(playerIndex,CustomGroup)	
end

X_CustomFunctionCreate["tur_carrier"]=function (CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("AIAttackGroup")
end

X_CustomFunctionUpdate["tur_carrier"]=function (CustomGroup, playerIndex, shipID)
	if Player_GetLOD(playerIndex)>0 then
		if (SobGroup_HasSubsystem(CustomGroup, "tur_ac_weapon")==1) and (SobGroup_GroupInGroup("AIAttackGroup",CustomGroup)==0) then
			if (SobGroup_Empty("AITempRemoveGroup")==1)then
				SobGroup_SobGroupAdd("AITempRemoveGroup",CustomGroup)
			end
			SobGroup_CreateIfNotExist("AIGuardGroup"..playerIndex)
			SobGroup_SobGroupAdd("AIAttackGroup",CustomGroup)
			SobGroup_Clear("AIGuardGroup"..playerIndex)
			SobGroup_SobGroupAdd("AIGuardGroup"..playerIndex,"Player_Ships"..playerIndex)
			SobGroup_RemoveType("AIGuardGroup"..playerIndex, "Tur_Shipyard")
			SobGroup_RemoveType("AIGuardGroup"..playerIndex, "Tur_resourcecontroller")
			SobGroup_RemoveType("AIGuardGroup"..playerIndex, "Tur_resourcecollector")
			SobGroup_RemoveType("AIGuardGroup"..playerIndex, "Tur_cloakgenerator")
			SobGroup_RemoveType("AIGuardGroup"..playerIndex, "Tur_minelayercorvette")
			SobGroup_RemoveType("AIGuardGroup"..playerIndex, "Tur_carrier")
			SobGroup_GuardSobGroup(CustomGroup, "Player_Ships"..playerIndex)
		elseif (SobGroup_HasSubsystem(CustomGroup, "tur_ac_weapon")==0) and (SobGroup_GroupInGroup("AIAttackGroup",CustomGroup)==1)then
			if (SobGroup_Empty("AITempAddGroup")==1)then
				SobGroup_SobGroupAdd("AITempAddGroup",CustomGroup)
			end
			SobGroup_RemoveSobGroup("AIAttackGroup",CustomGroup)
		end
	end
	if (SobGroup_HasSubsystem("Player_Ships"..playerIndex, "tur_as_capshipadvanced")==0) then
		if (SobGroup_IsBuilding(CustomGroup, "tur_ac_weapon")==1)or(SobGroup_HasSubsystem(CustomGroup, "tur_ac_weapon")==1) then
			SobGroup_RestrictBuildOption(CustomGroup, "tur_ac_frigate")
		elseif (SobGroup_IsBuilding(CustomGroup, "tur_ac_frigate")==1)or(SobGroup_HasSubsystem(CustomGroup, "tur_ac_frigate")==1) then
			SobGroup_RestrictBuildOption(CustomGroup, "tur_ac_weapon")
		else
			SobGroup_UnRestrictBuildOption(CustomGroup, "tur_ac_frigate")
			SobGroup_UnRestrictBuildOption(CustomGroup, "tur_ac_weapon")
		end
	else
		SobGroup_UnRestrictBuildOption(CustomGroup, "tur_ac_frigate")
		SobGroup_UnRestrictBuildOption(CustomGroup, "tur_ac_weapon")
	end
end

X_CustomFunctionDestroy["tur_carrier"]=function(CustomGroup, playerIndex, shipID)
	shockwave(playerIndex,CustomGroup)	
end

X_CustomFunctionUpdate["kad_carrier"]=function(CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
	if (Race_GetName(Player_GetRace(playerIndex))=="Kadesh")then
		if(Player_HasResearch(playerIndex,"KadCapital2")==0)then
			if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam_f")==0) then
				Player_RestrictBuildOption(playerIndex, "kad_c_multibeam_f")
			end
			if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer_f")==0) then
				Player_RestrictBuildOption(playerIndex, "kad_c_superswarmer_f")
			end
		else
			local iFlag={}
			if(SobGroup_HasSubsystem(CustomGroup, "kad_c_multibeam")==1)or(SobGroup_IsBuilding(CustomGroup, "kad_c_multibeam")==1)then
				iFlag[1]=1
			elseif(SobGroup_HasSubsystem(CustomGroup, "kad_c_superswarmer")==1)or(SobGroup_IsBuilding(CustomGroup, "kad_c_superswarmer")==1) then
				iFlag[1]=2
			else
				iFlag[1]=0
			end
			if(SobGroup_HasSubsystem(CustomGroup, "kad_c_multibeam_f")==1)or(SobGroup_IsBuilding(CustomGroup, "kad_c_multibeam_f")==1)then
				iFlag[2]=1
			elseif(SobGroup_HasSubsystem(CustomGroup, "kad_c_superswarmer_f")==1)or(SobGroup_IsBuilding(CustomGroup, "kad_c_superswarmer_f")==1) then
				iFlag[2]=2
			else
				iFlag[2]=0
			end
			if (iFlag[1]==1) then --一级造多光二级造超级细胞
				if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam_f")==0) then
					Player_RestrictBuildOption(playerIndex, "kad_c_multibeam_f")
				end
				if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer")==0) then
					Player_RestrictBuildOption(playerIndex, "kad_c_superswarmer")
				end
				if (iFlag[2]==0) then --一级造多光二级空
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer_f")==1) then
						Player_UnrestrictBuildOption(playerIndex, "kad_c_superswarmer_f")
					end
				end
			elseif (iFlag[1]==2) then --一级造超级细胞二级造多光
				if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer_f")==0) then
					Player_RestrictBuildOption(playerIndex, "kad_c_superswarmer_f")
				end
				if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam")==0) then
					Player_RestrictBuildOption(playerIndex, "kad_c_multibeam")
				end
				if (iFlag[2]==0) then --一级造超级细胞二级空
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam_f")==1) then
						Player_UnrestrictBuildOption(playerIndex, "kad_c_multibeam_f")
					end
				end
			elseif (iFlag[1]==0) then --一级空
				if (iFlag[2]==1) then --二级造多光
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam")==0) then
						Player_RestrictBuildOption(playerIndex, "kad_c_multibeam")
					end
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer_f")==0) then
						Player_RestrictBuildOption(playerIndex, "kad_c_superswarmer_f")
					end
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer")==1) then
						Player_UnrestrictBuildOption(playerIndex, "kad_c_superswarmer")
					end
				elseif (iFlag[2]==2) then --二级造超级细胞
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer")==0) then
						Player_RestrictBuildOption(playerIndex, "kad_c_superswarmer")
					end
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam_f")==0) then
						Player_RestrictBuildOption(playerIndex, "kad_c_multibeam_f")
					end
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam")==1) then
						Player_UnrestrictBuildOption(playerIndex, "kad_c_multibeam")
					end
				elseif (iFlag[1]==0)and(iFlag[2]==0) then --二级空
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer")==0) then
						Player_RestrictBuildOption(playerIndex, "kad_c_superswarmer")
					end
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam")==1) then
						Player_UnrestrictBuildOption(playerIndex, "kad_c_multibeam")
					end
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_multibeam_f")==0) then
						Player_restrictBuildOption(playerIndex, "kad_c_multibeam_f")
					end
					if (Player_BuildOptionIsRestricted(playerIndex, "kad_c_superswarmer_f")==1) then
						Player_UnrestrictBuildOption(playerIndex, "kad_c_superswarmer_f")
					end
				end
			end
		end

		if ((Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_mothershipdark")==0)) then
			if (SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==1) then
				SobGroup_CloakToggle(CustomGroup)
			end
			if (SobGroup_CanDoAbility(CustomGroup, AB_Cloak)==1) then
				SobGroup_AbilityActivate(CustomGroup, AB_Cloak, 0)
			end
		else
			if (SobGroup_CanDoAbility(CustomGroup, AB_Cloak)==0) then
				SobGroup_AbilityActivate(CustomGroup, AB_Cloak, 1)
			end
			if (SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==0) then
				SobGroup_CloakToggle(CustomGroup)
			end
		end
	end
end

X_CustomFunctionCreate["kad_mothershipdark"]=function(CustomGroup, playerIndex, shipID)
	if(Player_GetLOD(playerIndex) > 0)then
		SobGroup_CreateIfNotExist("KMD_TempGroup1"..shipID)
		SobGroup_Create("KMD_TempGroup2"..shipID)
		SobGroup_CreateIfNotExist("KMD_TempGroup")
		SobGroup_CreateIfNotExist("KMD_TempGroup2")
		SobGroup_CreateIfNotExist("FillPlayerShipsByTypeTempGroup")
	end
end

X_CustomFunctionUpdate["kad_mothershipdark"]=function(CustomGroup, playerIndex, shipID)
	ProtectFX_Create(AB_Move, CustomGroup)
	ProtectFX_Create(AB_Attack, CustomGroup)
	if(Player_GetLOD(playerIndex) > 1)then
				SobGroup_CreateIfNotExist("KMD_TempGroup1"..shipID)
				SobGroup_Clear("KMD_TempGroup1"..shipID)
				--SobGroup_Clear("KMD_TempGroup2"..shipID)
				SobGroup_FillProximitySobGroup("KMD_TempGroup1"..shipID, "Player_Ships"..playerIndex, CustomGroup, 7000)
				local supportType={"kad_multibeamfrigate"}
				for index,itype in supportType do
					SobGroup_Clear("FillPlayerShipsByTypeTempGroup")
					SobGroup_FillShipsByType("FillPlayerShipsByTypeTempGroup", "KMD_TempGroup1"..shipID, itype)
					SobGroup_SobGroupAdd("KMD_TempGroup2"..shipID,"FillPlayerShipsByTypeTempGroup")
				end
				SobGroup_Clear("KMD_TempGroup1"..shipID)
				for iPlayer=0,Universe_PlayerCount()-1 do
					if (iPlayer~=playerIndex) then
						if (AreAllied(iPlayer, playerIndex)==0) then
							SobGroup_Clear("KMD_TempGroup")
							SobGroup_FillProximitySobGroup("KMD_TempGroup", "Player_Ships"..iPlayer, CustomGroup, 8000)
							SobGroup_SobGroupAdd("KMD_TempGroup1"..shipID,"KMD_TempGroup")
						end
					end
				end
				local iForce=0
				if (SobGroup_AreAnyFromTheseAttackFamilies("KMD_TempGroup1"..shipID, "Frigate, SmallCapitalShip, BigCapitalShip, Mothership")==1) then
					SobGroup_Clear("KMD_TempGroup")
					SobGroup_Clear("KMD_TempGroup2")
					SobGroup_SobGroupAdd("KMD_TempGroup","KMD_TempGroup1"..shipID)
					SobGroup_FilterInclude("KMD_TempGroup2", "KMD_TempGroup", "attackFamily", "Frigate")
					SobGroup_SobGroupAdd("KMD_TempGroup1"..shipID,"KMD_TempGroup2")
					iForce=iForce+SobGroup_Count("KMD_TempGroup2")
					SobGroup_Clear("KMD_TempGroup2")
					SobGroup_FilterInclude("KMD_TempGroup2", "KMD_TempGroup", "attackFamily", "SmallCapitalShip")
					SobGroup_SobGroupAdd("KMD_TempGroup1"..shipID,"KMD_TempGroup2")
					iForce=iForce+4*SobGroup_Count("KMD_TempGroup2")
					SobGroup_Clear("KMD_TempGroup2")
					SobGroup_FilterInclude("KMD_TempGroup2", "KMD_TempGroup", "attackFamily", "BigCapitalShip")
					SobGroup_SobGroupAdd("KMD_TempGroup1"..shipID,"KMD_TempGroup2")
					iForce=iForce+8*SobGroup_Count("KMD_TempGroup2")
					SobGroup_Clear("KMD_TempGroup2")
					SobGroup_FilterInclude("KMD_TempGroup2", "KMD_TempGroup", "attackFamily", "Mothership")
					SobGroup_SobGroupAdd("KMD_TempGroup1"..shipID,"KMD_TempGroup2")
				else
					iForce=0
				end
				if (iForce==0) then
					if (SobGroup_UnderAttack("KMD_TempGroup2"..shipID)==1)or(SobGroup_UnderAttack(CustomGroup)==1) then
						KMD_Hide(CustomGroup, playerIndex, shipID)
					else
						KMD_Attack(CustomGroup, playerIndex, shipID)
					end
				elseif (SobGroup_Count("KMD_TempGroup2"..shipID)>iForce) then
					KMD_Attack(CustomGroup, playerIndex, shipID)
				else
					KMD_Hide(CustomGroup, playerIndex, shipID)
				end
	end
	if (SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==1) then
		if (SobGroup_IsDoingAbility(CustomGroup, AB_Move)==1) then
			SobGroup_Stop(playerIndex, CustomGroup)
		end
		if (SobGroup_CanDoAbility(CustomGroup, AB_Move)==1) then
			SobGroup_AbilityActivate(CustomGroup, AB_Move, 0)
		end
		if (SobGroup_CanDoAbility(CustomGroup, AB_Hyperspace)==1) then
			--SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)
			if (SobGroup_HasSubsystem(CustomGroup, "Kad_Module_Key3")==0) then
				SobGroup_CreateSubSystem(CustomGroup, "Kad_Module_Key3")
			end
		end
	else
		if (SobGroup_CanDoAbility(CustomGroup, AB_Move)==0) then
			SobGroup_AbilityActivate(CustomGroup, AB_Move, 1)
		end
		if (SobGroup_CanDoAbility(CustomGroup, AB_Hyperspace)==0) then
			--SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 1)
			SobGroup_SetHardPointHealth(CustomGroup, "Generic5", 0)
		end
	end
end

X_CustomFunctionDestroy["kad_mothershipdark"]=function(CustomGroup, playerIndex, shipID)
	if(Player_GetLOD(playerIndex) > 0)then
		SobGroup_SobGroupAdd("AITempAddGroup","KMD_TempGroup2"..shipID)
		SobGroup_AbilityActivate("KMD_TempGroup2"..shipID, AB_Attack,1)
		SobGroup_GuardSobGroup("KMD_TempGroup2"..shipID, "Player_Ships"..playerIndex)
	end
end

function KMD_Hide(CustomGroup, playerIndex, shipID)
	if (SobGroup_IsDoingAbility(CustomGroup,AB_Cloak)==1) then
		SobGroup_Stop(playerIndex, CustomGroup)
		SobGroup_SobGroupAdd("AITempRemoveGroup","KMD_TempGroup2"..shipID)
		SobGroup_GuardSobGroup("KMD_TempGroup2"..shipID, CustomGroup)
		SobGroup_AbilityActivate("KMD_TempGroup2"..shipID, AB_Attack,0)
	else
		if (SobGroup_HasSubsystem(CustomGroup, "Kad_Module_Key2")==0) then
			SobGroup_CreateSubSystem(CustomGroup, "Kad_Module_Key2")
			if (SobGroup_CanDoAbility(CustomGroup, AB_Attack)==1) then
				SobGroup_AbilityActivate(CustomGroup, AB_Attack,0)
			end
		elseif (SobGroup_IsCloaked(CustomGroup)==0) then
			SobGroup_AbilityActivate("KMD_TempGroup2"..shipID, AB_Attack,1)
			SobGroup_SobGroupAdd("AITempAddGroup","KMD_TempGroup2"..shipID)
			if (SobGroup_CanDoAbility(CustomGroup, AB_Attack)==0) then
				SobGroup_AbilityActivate(CustomGroup, AB_Attack,1)
			end
		end
		SobGroup_CloakToggle(CustomGroup)
	end
end

function KMD_Attack(CustomGroup, playerIndex, shipID)
	SobGroup_AbilityActivate("KMD_TempGroup2"..shipID, AB_Attack,1)
	SobGroup_SobGroupAdd("AITempRemoveGroup","KMD_TempGroup2"..shipID)
	if(SobGroup_GetCurrentOrder(CustomGroup)==COMMAND_Attack)then
		SobGroup_GetCommandTargets("KMD_TempGroup1"..shipID, CustomGroup, COMMAND_Attack)
		if (SobGroup_IsDoingAbility("KMD_TempGroup2"..shipID, AB_Attack)==0)and(SobGroup_Count("KMD_TempGroup1"..shipID)>0) then
			SobGroup_Attack(playerIndex,"KMD_TempGroup2"..shipID,"KMD_TempGroup1"..shipID)
		end
	elseif (SobGroup_Count("KMD_TempGroup1"..shipID)==0) then
		SobGroup_GuardSobGroup("KMD_TempGroup2"..shipID, CustomGroup)
	end
	if (SobGroup_HasSubsystem(CustomGroup, "Kad_Module_Key2")==1) then
		SobGroup_SetHardPointHealth(CustomGroup, "Generic3", 0)
		if (SobGroup_CanDoAbility(CustomGroup, AB_Attack)==0) then
			SobGroup_AbilityActivate(CustomGroup, AB_Attack,1)
		end
	end
	if (SobGroup_IsCloaked(CustomGroup)==1) then
		SobGroup_CloakToggle(CustomGroup)
	end
end

function SobGroup_RemoveSobGroup(sg1,sg2)
	SobGroup_CreateIfNotExist("SobGroupTempRemoveGroup")
	SobGroup_FillSubstract("SobGroupTempRemoveGroup", sg1, sg2)
	SobGroup_Clear(sg1)
	SobGroup_Copy(sg1,"SobGroupTempRemoveGroup")
end
