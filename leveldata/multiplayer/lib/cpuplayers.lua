pass = 0

function cpuplayers_updating()			
		local playerIndex = 0
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								if Player_GetLevelOfDifficulty(playerIndex) > 0 then
										
										--behaviour		
										if pass == 0 then
											SobGroup_CreateIfNotExist("CPUTempAttackGroup")
											if cpuplayers == 0 then
													Restrict_Research(playerIndex,"cpuplayers_defensive")
													Restrict_Research(playerIndex,"cpuplayers_aggressive")
													Restrict_Research(playerIndex,"cpuplayers_dynamic")
													--原版这些地方都用的是Flag_Research，但是这样似乎会有延迟
													--会导致头两波攻击不受该设置的影响
													--所以都改成了Player_GrantResearchOption
													--感觉这样效果就挺好
													--Flag_Research(playerIndex,"cpuplayers_harmless")
													Player_GrantResearchOption(playerIndex,"cpuplayers_harmless")
											elseif cpuplayers == 1 then
													--Flag_Research(playerIndex,"cpuplayers_defensive")
													Player_GrantResearchOption(playerIndex,"cpuplayers_defensive")
													Restrict_Research(playerIndex,"cpuplayers_aggressive")
													Restrict_Research(playerIndex,"cpuplayers_dynamic")
													Restrict_Research(playerIndex,"cpuplayers_harmless")
											elseif cpuplayers == 2 then
													Restrict_Research(playerIndex,"cpuplayers_defensive")
													Restrict_Research(playerIndex,"cpuplayers_aggressive")
													Restrict_Research(playerIndex,"cpuplayers_dynamic")
													Restrict_Research(playerIndex,"cpuplayers_harmless")
											elseif cpuplayers == 3 then
													Restrict_Research(playerIndex,"cpuplayers_defensive")
													--Flag_Research(playerIndex,"cpuplayers_aggressive")
													Player_GrantResearchOption(playerIndex,"cpuplayers_aggressive")
													Restrict_Research(playerIndex,"cpuplayers_dynamic")
													Restrict_Research(playerIndex,"cpuplayers_harmless")
											elseif cpuplayers == 4 then
													Restrict_Research(playerIndex,"cpuplayers_defensive")
													Restrict_Research(playerIndex,"cpuplayers_aggressive")
													--Flag_Research(playerIndex,"cpuplayers_dynamic")	
													Player_GrantResearchOption(playerIndex,"cpuplayers_dynamic")	
													Restrict_Research(playerIndex,"cpuplayers_harmless")									
											end
										elseif  fx_option_aicheat=="extreme" then
											if cpuplayers == 3 then
												for playerIndex2 = 0,Universe_PlayerCount()-1,1 do
													if Player_IsAlive(playerIndex2) == 1 then
														if Player_HasShipWithBuildQueue(playerIndex2) == 1 then
															if playerIndex~=playerIndex2 then
																if AreAllied(playerIndex, playerIndex2) == 0 then
																	SobGroup_SobGroupAdd("CPUTempAttackGroup", "Player_Ships"..playerIndex2)
																end
															end
														end
													end
												end
												SobGroup_RemoveType("Player_Ships"..playerIndex, "Hgn_MarineFrigate,Hgn_Scout,Kad_Carrier,Kad_MilitaryFuelPod,Kad_Variationswarmer,Tai_Carrier,Tai_DefenseFighter,Tai_Scout,Tai_SupportFrigate,Yur_Scout,Tur_MinelayerCorvette,Tur_EnergyFrigate,Tur_ResourceController,Tur_SiegeDrillFrigate,Vgr_Scout,Vgr_EWFighter,Vgr_InfiltratorFrigate")
												SobGroup_Attack(playerIndex, "Player_Ships"..playerIndex, "CPUTempAttackGroup")
												SobGroup_Clear("CPUTempAttackGroup")
											end
											Player_SetRU(playerIndex,Player_GetRU(playerIndex)+100*Player_GetLevelOfDifficulty(playerIndex))
										end
										--no-rush time
										if norushtime > 0 then
											if pass == 0 then
												--prevents the AI to attack												
												if norushtime == 5 then
														Flag_Research(playerIndex,"cpuplayers_norushtime5")		
														Restrict_Research(playerIndex,"cpuplayers_norushtime10")
														Restrict_Research(playerIndex,"cpuplayers_norushtime15")
												elseif norushtime == 10 then
														Restrict_Research(playerIndex,"cpuplayers_norushtime5")		
														Flag_Research(playerIndex,"cpuplayers_norushtime10")
														Restrict_Research(playerIndex,"cpuplayers_norushtime15")
												elseif norushtime == 15 then
														Restrict_Research(playerIndex,"cpuplayers_norushtime5")		
														Restrict_Research(playerIndex,"cpuplayers_norushtime10")
														Flag_Research(playerIndex,"cpuplayers_norushtime15")																
												end		
											end	
											--prevents the AI to move
											local mothership = PlayerRace_GetString(playerIndex, "def_type_mothership", "hgn_mothership")
											local carrier = PlayerRace_GetString(playerIndex, "def_type_carrier", "hgn_carrier")								
											SobGroup_CreateIfNotExist("temp")
											SobGroup_Clear("temp")
											SobGroup_CreateIfNotExist("norushtime_nomove"..playerIndex)
											SobGroup_Clear("norushtime_nomove"..playerIndex)
											SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, mothership)
											SobGroup_SobGroupAdd("norushtime_nomove"..playerIndex, "temp")
											SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, carrier)
											SobGroup_SobGroupAdd("norushtime_nomove"..playerIndex, "temp")											
											if norushtime > 1 then
												SobGroup_AbilityActivate("norushtime_nomove"..playerIndex, AB_Move, 0)
											else
												SobGroup_AbilityActivate("norushtime_nomove"..playerIndex, AB_Move, 1)
											end										
										end	
										
										--AI build speed cheat
										if pass == 0 then
											if (fx_option_aicheat=="on") then
												if Player_GetLevelOfDifficulty(playerIndex) == 2 then
														Flag_Research(playerIndex,"AllShipBuildSpeed")
														Restrict_Research(playerIndex,"AllShipBuildSpeedHard")
														Restrict_Research(playerIndex,"AllShipBuildSpeedExpert")
												elseif Player_GetLevelOfDifficulty(playerIndex) == 3 then
														Restrict_Research(playerIndex,"AllShipBuildSpeed")
														Flag_Research(playerIndex,"AllShipBuildSpeedHard")
														Restrict_Research(playerIndex,"AllShipBuildSpeedExpert")
														Flag_Research(playerIndex,"ResourceCollectionRateHard")
														Restrict_Research(playerIndex,"ResourceCollectionRateExpert")													
												elseif Player_GetLevelOfDifficulty(playerIndex) == 4 then
														Restrict_Research(playerIndex,"ResourceCollectionRateHard")
														Flag_Research(playerIndex,"ResourceCollectionRateExpert")													
														Restrict_Research(playerIndex,"AllShipBuildSpeed")
														Restrict_Research(playerIndex,"AllShipBuildSpeedHard")
														Flag_Research(playerIndex,"AllShipBuildSpeedExpert")
												end
											elseif (fx_option_aicheat=="extreme") then
												if Player_GetLevelOfDifficulty(playerIndex) > 0 then
														Flag_Research(playerIndex,"AllShipBuildSpeedExtreme")
														Flag_Research(playerIndex,"ResourceCollectionRateExtreme")
														Player_SetRU(playerIndex,Player_GetRU(playerIndex)*Player_GetLevelOfDifficulty(playerIndex)*5)
												end
											end
										end	
																				
										--enables AI special weapons
										if pass == 0 then
											AI_Special_Research = nil
										
											dofilepath(PlayerRace_GetString(playerIndex, "path_ai_special", ""))
											
											if (AI_Special_Research ~= nil) then
												AI_Special_Research(playerIndex)
												AI_Special_Research = nil
											end
														
										end	
											
										--relics
										if relics > 0 then
												if Universe_GameTime() > relic_start+10 then
														for i = 1,relic_max,1 do
																if SobGroup_Empty("Relic"..i) == 0 then
																		if SobGroup_AreAnyOfTheseTypes("Relic"..i, "Meg_Relic_RUGenerator") == 1 then									
																				local relic_weight = 150
																				-- Don't need to clear this since FillProximitySobGroup will clear it
																				SobGroup_CreateIfNotExist("temp")
																				if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..playerIndex, "Relic"..i, 50000) == 1 then																						
																						if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..playerIndex, "Relic"..i, 15000) == 1 then
																								relic_weight = relic_weight + 150
																						end																					
																						if playerIndex ~= SobGroup_OwnedBy("Relic"..i) and SobGroup_OwnedBy("Relic"..i) >= 0 and AreAllied(playerIndex, SobGroup_OwnedBy("Relic"..i)) == 0 then
																								relic_weight = relic_weight + 150																								
																								if Player_GetLevelOfDifficulty(SobGroup_OwnedBy("Relic"..i)) > 0 then
																										relic_weight = relic_weight + 300
																								end
																						end																				
																						CPU_AddDefendSobGroup(playerIndex, "Relic"..i, relic_weight)
																				end
																		end
																end
														end
												end
										end
										--crates
										if crates > 0 then
												if Universe_GameTime() > timer_interval*46 then
														for i = 0,Universe_PlayerCount()-1,1 do
																if SobGroup_Empty("CrateSpawnGroup"..i) == 0 then
																		if SobGroup_AreAnyOfTheseTypes("CrateSpawnGroup"..i, "Meg_Crate_HW1Container") == 1 then																				
																				-- FillShipsByType does not clear out the destination sob group, so if we didn't create it then clear it
																				if SobGroup_CreateIfNotExist("temp") == 0 then
																					SobGroup_Clear("temp")
																				end
																				-- FillProximitySobGroup clears the destination sob group, so we don't need to clear it if it already existed
																				SobGroup_CreateIfNotExist("temp1")
																				
																				local scout = PlayerRace_GetString(playerIndex, "def_type_scout", "hgn_scout")
																				
																				SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, scout)
																						
																				if SobGroup_FillProximitySobGroup ("temp1", "temp", "CrateSpawnGroup"..i, 25000) == 1 then																						
																						SobGroup_MoveToSobGroup("temp1", "CrateSpawnGroup"..i)																						
																				end
																		end
																end
														end
												end		
										end									
								end
						end
				end
		end		
		if pass == 0 then
			Rule_Remove("cpuplayers_updating")
		  Rule_AddInterval("cpuplayers_updating",12)
		end
		pass = pass + 1
end