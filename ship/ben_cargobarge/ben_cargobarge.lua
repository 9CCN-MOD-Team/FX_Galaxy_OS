Ben_CargoBargeTable={}
TradeTime={45,90,135}
TradeRU=200
TradeGainRate={1,2.2,3.6}

function Start_Trade(CustomGroup, playerIndex, shipID)
	if(Ben_CargoBargeTable[shipID]==-2)then
		Ben_CargoBargeTable[shipID]=-1
	else
		Ben_CargoBargeTable[shipID]=-2
	end
end

function Do_Trade(CustomGroup, playerIndex, shipID)
end

function Finish_Trade(CustomGroup, playerIndex, shipID)
end

function Create_Trade(CustomGroup, playerIndex, shipID)
	Ben_CargoBargeTable[shipID]=-2
end

function Update_Trade(CustomGroup, playerIndex, shipID)
	if(Ben_CargoBargeTable[shipID]==0)then
		if(SobGroup_AreAllInHyperspace(CustomGroup)==1)then--完成贸易，返回
			SobGroup_CreateIfNotExist("CargoBargeTemp")
			SobGroup_FillShipsByType( "CargoBargeTemp", "Player_Ships"..playerIndex, "ben_resourcecollector" )
			if(SobGroup_Empty("CargoBargeTemp")==0)then
				SobGroup_ExitHyperSpaceSobGroup(CustomGroup, "CargoBargeTemp", 1000)
			end
		elseif(SobGroup_AreAllInRealSpace(CustomGroup)==1)then--已返回，卸矿
			if(SobGroup_IsDoingAbility(CustomGroup, AB_Dock)==0)then
				SobGroup_CreateIfNotExist("CargoBargeTemp")
				SobGroup_FillShipsByType( "CargoBargeTemp", "Player_Ships"..playerIndex, "ben_resourcecollector" )
				SobGroup_DockSobGroup(CustomGroup, "CargoBargeTemp")
			elseif(SobGroup_IsDocked(CustomGroup)==1)then
				Player_SetRU(playerIndex,Player_GetRU(playerIndex)+TradeRU*TradeGainRate[Trade_GetGainRate(playerIndex)])
				Ben_CargoBargeTable[shipID]=-1
			end
		end
	elseif(Ben_CargoBargeTable[shipID]==-1)then--启动星际贸易
		Ben_CargoBargeTable[shipID]=TradeTime[Trade_GetGainRate(playerIndex)]
		SobGroup_EnterHyperSpaceOffMap(CustomGroup)
	elseif(Ben_CargoBargeTable[shipID]~=-2)then
		Ben_CargoBargeTable[shipID]=Ben_CargoBargeTable[shipID]-1
	end
end

function Destroy_Trade(CustomGroup, playerIndex, shipID)
end

function Trade_GetGainRate(playerIndex)
	local iRate=1
	if(Player_HasResearch(playerIndex, "BenHarvestUpgrade1")==1)then
		if(Player_HasResearch(playerIndex, "BenHarvestUpgrade2")==1)then
			iRate=3
		else
			iRate=2
		end
	end
	return iRate
end