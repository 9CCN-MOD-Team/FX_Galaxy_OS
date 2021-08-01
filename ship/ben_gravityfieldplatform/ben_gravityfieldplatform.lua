GravityWellGeneratorShipList = {"hgn_scout",
																"hgn_interceptor",
																"hgn_attackbomber",
																"hgn_assaultcorvette",
																"hgn_pulsarcorvette",
																"hgn_minelayercorvette",
																"vgr_scout",
																"vgr_interceptor",
																"vgr_lancefighter",
																"vgr_bomber",
                                "vgr_missilecorvette",
                                "vgr_lasercorvette",
                                "vgr_commandcorvette",
                                "vgr_minelayercorvette",
																"kus_scout",
																"kus_interceptor",
																"kus_attackbomber",
																"kus_defender",
																"kus_cloakedfighter",
																"kus_lightcorvette",
																"kus_heavycorvette",
																"kus_salvagecorvette",
																"kus_repaircorvette",
																"kus_multiguncorvette",
																"kus_minelayercorvette",
																"tai_scout",
																"tai_interceptor",
																"tai_attackbomber",
																"tai_defender",
																"tai_defensefighter",
																"tai_lightcorvette",
																"tai_heavycorvette",
																"tai_salvagecorvette",
																"tai_repaircorvette",
																"tai_multiguncorvette",
																"tai_minelayercorvette",--32
																"junk_junkyarddog",
																"tur_scout",
																"tur_fighter",
																"tur_attackbomber",
																"tur_missilecorvette",
																"tur_standardcorvette",
																"kad_swarmer",
																"kad_assaultswarmer",
																"kad_swarmer1",
																"kad_swarmerelite",
																"kad_Variationswarmer",
																"kad_advancedswarmer",
																"kad_advancedassaultswarmer",
																"kad_swarmeradvanced",
																"kpr_bomber",
																"kpr_drone",
																"kpr_scout",
																"kpr_mover",
																"kpr_capturemover",
																"kpr_mover1",
																"kpr_movers",
																"kpr_heavymover",
																"kpr_heavymover1",
																}

function Start_ben_gravityfieldplatform(CustomGroup, playerIndex, shipID)
	--local r = random(1,6)
	--FX_StartEvent(CustomGroup, "gravwellon_sfx"..r)
  SobGroup_CreateIfNotExist("gravitywellgenerators_ships"..shipID)
	SobGroup_Clear("gravitywellgenerators_ships"..shipID)	
	SobGroup_CreateIfNotExist("gravitywellgenerators_temp")
	SobGroup_CreateIfNotExist("gravitywellgenerators_temp1")
	SobGroup_CreateIfNotExist("gravitywellgenerators_temp2")
	SobGroup_CreateIfNotExist("gravitywellgenerators_temp3")
end

function Do_ben_gravityfieldplatform(CustomGroup, playerIndex, shipID)  	
  local playerIndex1 = 0
  while playerIndex1 < Universe_PlayerCount() do
		if Player_IsAlive(playerIndex1) == 1 then
			--if Player_HasShipWithBuildQueue(playerIndex1) == 1 then
				for i = 1,getn(GravityWellGeneratorShipList),1 do
					SobGroup_FillShipsByType("gravitywellgenerators_temp", "Player_Ships"..playerIndex1, GravityWellGeneratorShipList[i])					
					if SobGroup_AreAnyOfTheseTypes("gravitywellgenerators_temp", "kus_salvagecorvette, tai_salvagecorvette") == 1 then
						if AreAllied(playerIndex, SobGroup_OwnedBy("gravitywellgenerators_temp")) == 0 then
							SobGroup_SobGroupAdd("gravitywellgenerators_ships"..shipID, "gravitywellgenerators_temp")
						end
					else					
						SobGroup_SobGroupAdd("gravitywellgenerators_ships"..shipID, "gravitywellgenerators_temp")
					end	
				end
			--end
		end
		playerIndex1 = playerIndex1 + 1
  end
  --SobGroup_TakeDamage(CustomGroup, 0.0065)
  --FX_StartEvent(CustomGroup, "PowerUp")
  local distance = 1500
  --local modifier = 0.8
  --for k = 1,6,1 do
		if SobGroup_FillProximitySobGroup ("gravitywellgenerators_temp", "gravitywellgenerators_ships"..shipID, CustomGroup, distance) == 1 then
			--SobGroup_SetSpeed("gravitywellgenerators_temp", modifier)		
			SobGroup_Clear("gravitywellgenerators_temp2")
			local tumblerange = 100					
			while tumblerange < distance do
				if SobGroup_FillProximitySobGroup ("gravitywellgenerators_temp1", "gravitywellgenerators_temp", CustomGroup, tumblerange) == 1 then						
					SobGroup_FillSubstract("gravitywellgenerators_temp3", "gravitywellgenerators_temp1", "gravitywellgenerators_temp2") 					
					local targetspeed = SobGroup_GetSpeed("gravitywellgenerators_temp3")
					targetspeed = targetspeed / 2.5
					if targetspeed < 0.05 then
						targetspeed = 0				
					end
					if Universe_GameTime() > 35 then
						SobGroup_SetSpeed("gravitywellgenerators_temp3", targetspeed)
					end	
					if SobGroup_GetActualSpeed("gravitywellgenerators_temp3") <= 50 then
						SobGroup_AbilityActivate("gravitywellgenerators_temp3", AB_Move, 0)
						--FX_StartEvent("gravitywellgenerators_temp3", "PowerOff")
					end	
					SobGroup_AbilityActivate("gravitywellgenerators_temp3", AB_Targeting, 0)
					SobGroup_AbilityActivate("gravitywellgenerators_temp3", AB_Attack, 0)						
					local tumblerandomfactorbasedonposition = SobGroup_GetPosition("gravitywellgenerators_temp3")
					while tumblerandomfactorbasedonposition[1] > 0.45 or tumblerandomfactorbasedonposition[1] < -0.45 or tumblerandomfactorbasedonposition[2] > 0.45 or tumblerandomfactorbasedonposition[2] < -0.45 or tumblerandomfactorbasedonposition[3] > 0.45 or tumblerandomfactorbasedonposition[3] < -0.45 do
						for i = 1,3,1 do
							if tumblerandomfactorbasedonposition[i] > 0.45 or tumblerandomfactorbasedonposition[i] < -0.45 then
								tumblerandomfactorbasedonposition[i] = tumblerandomfactorbasedonposition[i] * 0.25
							end							
						end
					end	
					local tumbleVector = {tumblerandomfactorbasedonposition[1], tumblerandomfactorbasedonposition[2], tumblerandomfactorbasedonposition[3]}
					SobGroup_Tumble("gravitywellgenerators_temp3", tumbleVector) 	
					SobGroup_SobGroupAdd("gravitywellgenerators_temp2", "gravitywellgenerators_temp3")
				end
				tumblerange = tumblerange + 100
			end			
		end
		--distance = distance - 950
		--modifier = modifier - 0.155
  --end	
end

function Finish_ben_gravityfieldplatform(CustomGroup, playerIndex, shipID)	
	--local r = random(1,3)
  SobGroup_TakeDamage("gravitywellgenerators_ships"..shipID, 1)
	--FX_StartEvent(CustomGroup, "gravwellcollapse_sfx"..r)
	SobGroup_SetSpeed("gravitywellgenerators_ships"..shipID, 1)
	SobGroup_AbilityActivate("gravitywellgenerators_ships"..shipID, AB_Targeting, 1)
	SobGroup_AbilityActivate("gravitywellgenerators_ships"..shipID, AB_Attack, 1)
	SobGroup_AbilityActivate("gravitywellgenerators_ships"..shipID, AB_Move, 1)
	SobGroup_Clear("gravitywellgenerators_ships"..shipID)
end

function Create_ben_gravityfieldplatform(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("gravitywellgenerators_ships"..shipID)	
	SobGroup_CreateIfNotExist("gravitywellgenerators_temp")
	SobGroup_CreateIfNotExist("gravitywellgenerators_temp_ai")
end

function Update_ben_gravityfieldplatform(CustomGroup, playerIndex, shipID)	
	if(Player_GetLevelOfDifficulty(playerIndex)>0)and(SobGroup_CanDoAbility(CustomGroup, AB_Move)==0)then
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 1)
	elseif(Player_GetLevelOfDifficulty(playerIndex)==0)and(SobGroup_CanDoAbility(CustomGroup, AB_Move)==1)then
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 0)
	end	

	if Player_GetLevelOfDifficulty(playerIndex) > 0  then
		local playerIndex_ai = 0
		local alliedships = 0
		local enemyships = 0
		while playerIndex_ai < Universe_PlayerCount() do
			if Player_IsAlive(playerIndex_ai) == 1 then		
				SobGroup_Clear("gravitywellgenerators_temp_ai")
				for i = 1,getn(GravityWellGeneratorShipList),1 do
					SobGroup_FillShipsByType("gravitywellgenerators_temp", "Player_Ships"..playerIndex_ai, GravityWellGeneratorShipList[i])	
					SobGroup_SobGroupAdd("gravitywellgenerators_temp_ai", "gravitywellgenerators_temp")	
				end		
				local distance = 6750
				if SobGroup_FillProximitySobGroup ("gravitywellgenerators_temp", "gravitywellgenerators_temp_ai", CustomGroup, distance) == 1 then									
					if AreAllied(playerIndex, playerIndex_ai) == 1 then
						alliedships = alliedships + SobGroup_Count("gravitywellgenerators_temp")
					else
						enemyships = enemyships + SobGroup_Count("gravitywellgenerators_temp")
					end					
				end				
			end
			playerIndex_ai = playerIndex_ai + 1
		end
		if enemyships > 8 and enemyships > alliedships*2 then
			SobGroup_CustomCommand(CustomGroup)
		end
	end
	
	if(SobGroup_AreAllInHyperspace(CustomGroup)==1)then
		SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)
	end
end

function Destroy_ben_gravityfieldplatform(CustomGroup, playerIndex, shipID)	
	SobGroup_SetSpeed("gravitywellgenerators_ships"..shipID, 1)
	SobGroup_AbilityActivate("gravitywellgenerators_ships"..shipID, AB_Targeting, 1)
	SobGroup_AbilityActivate("gravitywellgenerators_ships"..shipID, AB_Attack, 1)
	SobGroup_AbilityActivate("gravitywellgenerators_ships"..shipID, AB_Move, 1)
	SobGroup_Clear("gravitywellgenerators_ships"..shipID)
end