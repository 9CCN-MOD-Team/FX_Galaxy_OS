XTechConditionJudge={}
XTechConditionJudge.ShipCount=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchShipCount = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												SobGroup_Clear("TechnologyControlTempGroup")
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														SobGroup_FillShipsByType("TechnologyControlTempGroup", "Player_Ships"..iSearchPlayer, iCondition[5])
														iSearchShipCount = SobGroup_Count("TechnologyControlTempGroup")
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														SobGroup_FillShipsByType("TechnologyControlTempGroup", "Player_Ships"..iSearchPlayer, iCondition[5])
														if(SobGroup_Count("TechnologyControlTempGroup") > iSearchShipCount)then
															iSearchShipCount = SobGroup_Count("TechnologyControlTempGroup")
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														SobGroup_FillShipsByType("TechnologyControlTempGroup", "Player_Ships"..iSearchPlayer, iCondition[5])
														if(SobGroup_Count("TechnologyControlTempGroup") > iSearchShipCount)then
															iSearchShipCount = SobGroup_Count("TechnologyControlTempGroup")
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														SobGroup_FillShipsByType("TechnologyControlTempGroup", "Player_Ships"..iSearchPlayer, iCondition[5])
														iSearchShipCount = iSearchShipCount + SobGroup_Count("TechnologyControlTempGroup")
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														SobGroup_FillShipsByType("TechnologyControlTempGroup", "Player_Ships"..iSearchPlayer, iCondition[5])
														iSearchShipCount = iSearchShipCount + SobGroup_Count("TechnologyControlTempGroup")
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchShipCount < iCondition[6])then
											iReturn = 0
										end
									else
										if(iSearchShipCount > iCondition[6])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.Research=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchResearch = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														if(Player_HasResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												elseif(iCondition[2] == "Alliance" or iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Player_HasResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												elseif(iCondition[2] == "Enemy" or iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Player_HasResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchResearch == 0)then
											iReturn = 0
										end
									else
										if(iSearchResearch ~= 0)then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.Researching=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchResearch = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														if(Player_HasQueuedResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												elseif(iCondition[2] == "Alliance" or iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Player_HasQueuedResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												elseif(iCondition[2] == "Enemy" or iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Player_HasQueuedResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchResearch == 0)then
											iReturn = 0
										end
									else
										if(iSearchResearch ~= 0)then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.CanResearch=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchResearch = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														if(Player_CanResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												elseif(iCondition[2] == "Alliance" or iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Player_CanResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												elseif(iCondition[2] == "Enemy" or iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Player_CanResearch(iSearchPlayer, iCondition[5]) == 1)then
															iSearchResearch = 1
														end
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchResearch == 0)then
											iReturn = 0
										end
									else
										if(iSearchResearch ~= 0)then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ResUnit=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchRU = Player_GetRU(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Player_GetRU(iSearchPlayer) > iSearchRU)then
															iSearchRU = Player_GetRU(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Player_GetRU(iSearchPlayer) > iSearchRU)then
															iSearchRU = Player_GetRU(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchRU = iSearchRU + Player_GetRU(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchRU = iSearchRU + Player_GetRU(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchRU < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchRU > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ShipKills=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TotalKills(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TotalKills(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalKills(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TotalKills(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalKills(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TotalKills(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TotalKills(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ShipKillsInRU=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TotalKillsInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TotalKillsInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalKillsInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TotalKillsInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalKillsInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TotalKillsInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TotalKillsInRUs(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ShipLosses=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TotalLosses(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TotalLosses(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalLosses(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TotalLosses(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalLosses(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TotalLosses(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TotalLosses(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ShipLossesInRU=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TotalLossesInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TotalLossesInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalLossesInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TotalLossesInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalLossesInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TotalLossesInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TotalLossesInRUs(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ShipBuild=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TotalShipsBuilt(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TotalShipsBuilt(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalShipsBuilt(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TotalShipsBuilt(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalShipsBuilt(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TotalShipsBuilt(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TotalShipsBuilt(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ShipBuildInRU=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TotalShipsBuiltInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TotalShipsBuiltInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalShipsBuiltInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TotalShipsBuiltInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TotalShipsBuiltInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TotalShipsBuiltInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TotalShipsBuiltInRUs(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end


XTechConditionJudge.ShipCaptured=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_EnemyShipsCaptured(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_EnemyShipsCaptured(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_EnemyShipsCaptured(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_EnemyShipsCaptured(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_EnemyShipsCaptured(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_EnemyShipsCaptured(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_EnemyShipsCaptured(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.ShipCapturedInRU=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_EnemyShipsCapturedInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_EnemyShipsCapturedInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_EnemyShipsCapturedInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_EnemyShipsCapturedInRUs(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_EnemyShipsCapturedInRUs(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_EnemyShipsCapturedInRUs(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_EnemyShipsCapturedInRUs(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.TributeDonated=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TributeDonated(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TributeDonated(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TributeDonated(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TributeDonated(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TributeDonated(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TributeDonated(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TributeDonated(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.TributeReceived=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TributeReceived(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TributeReceived(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TributeReceived(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TributeReceived(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TributeReceived(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TributeReceived(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TributeReceived(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end

XTechConditionJudge.TributeReceived=function (iPlayerIndex,iCondition)
									local iSearchPlayer = 0
									local iSearchRU = 0
									local iPlayerCount = Universe_PlayerCount()
									local iReturn = 1
									while(iSearchPlayer < iPlayerCount)do
										if(Player_IsAlive(iSearchPlayer) == 1)then
											local iSearchPlayerRace = Race_GetName(Player_GetRace(iSearchPlayer))
											if(iCondition[3] == "ALL" or iSearchPlayerRace == iCondition[3])then
												if(iCondition[2] == "Player")then
													if(iSearchPlayer == iPlayerIndex)then
														iSearchNumber = Stats_TributeReceived(iSearchPlayer)
													end
												elseif(iCondition[2] == "Alliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														if(Stats_TributeReceived(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TributeReceived(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "Enemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														if(Stats_TributeReceived(iSearchPlayer) > iSearchNumber)then
															iSearchNumber = Stats_TributeReceived(iSearchPlayer)
														end
													end
												elseif(iCondition[2] == "AllAlliance")then
													if(iSearchPlayer ~= iPlayerIndex and AreAllied(iSearchPlayer, iPlayerIndex) == 1)then
														iSearchNumber = iSearchNumber + Stats_TributeReceived(iSearchPlayer)
													end
												elseif(iCondition[2] == "AllEnemy")then
													if(AreAllied(iSearchPlayer, iPlayerIndex) == 0)then
														iSearchNumber = iSearchNumber + Stats_TributeReceived(iSearchPlayer)
													end
												end
											end
										end
										iSearchPlayer = iSearchPlayer + 1
									end
									if(iCondition[4] == 0)then
										if(iSearchNumber < iCondition[5])then
											iReturn = 0
										end
									else
										if(iSearchNumber > iCondition[5])then
											iReturn = 0
										end
									end
									return iReturn
end