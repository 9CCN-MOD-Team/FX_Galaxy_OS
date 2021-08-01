--version 2.1.2.2017.05.07

dofilepath("data:leveldata/multiplayer/resdata/XCode.lua")
dofilepath("data:leveldata/multiplayer/resdata/XTechFunction.lua")
TechnologyControlState = {}
TechnologyTimeCountDown = {}
TechnologyControlStateAnnal = {}
SHIPGLOBALSTATEOBLIGATENUMBER = 30
UNITUPDATETIME = 0.5 --单位列表更新时间间隔

SG_Characteristic = 
{
	--{"EnergyMachinery", 1},
	{"OneselfChangePower", 1},
	--{"OneselfChangePower2", 1},
	{"OneselfSpeedChange", 1},
	--{"OneselfSpeedChange2", 1},
	{"OneselfBuildingSpeedChange", 1},
	{"OneselfDamageChange", 1},
	{"OneselfRepair", 1},
	{"OneselfInvulnerability", 1},
	{"OneselfHardpointInvulnerability", 1},
	{"OneselfUntargeted", 1},
	{"OneselfHypespace", 1},
	{"OneselfShipAbility", 1},
	{"OneselfIdioFuel", 1},
	{"OneselfIdioShield", 1},
	{"OneselfIdioArmor", 1},
	{"AssistantStructure", 1},
	{"OneselfHardPointUnderDefend", 2},
	{"OneselfHardPointDamageChange", 1},
	{"SheepShip", 1},
	{"ShipExperience", 1},
	{"DroneShip", 5},
	{"AreaSemaphore", 3},
	{"LockingSemaphore", 3},
	{"PassiveSemaphore", 3},
	{"GuardingSemaphore", 3},
	{"PunySemaphore", 3},
	{"MotherShip", 3},
	{"DockingMotherShip", 3},
	{"MotherShipFilter", 5},
	{"OneselfCommand", 1},
	{"CommandSemaphore", 1},
	{"ControlDock", 1},
	{"ControlAttack", 1},
	{"ControlScuttle", 1},
	{"ControlHarvest", 1},
	{"CycExplode", 1},
	--{"DeliverShip", 5},
	--{"DeliverGate", 5},
	{"ResourceUnitBuildAward", 1},
	{"ResourceUnitLossesCompensate", 1},
	{"ResourceUnitKillsBounty", 1},
	{"ResourceUnitFabricated", 1},
	--{"CustomResourceUnitFabricated", 1},
	{"RestrictShipBuildingOption", 1},
	{"ShipDockAmelioration", 2},
	{"ShipAutoAmelioration", 2},
	{"ShipInstantAmelioration", 2},
	{"EffectOnly", 1},
	{"SubsystemBuild", 1},
	{"ShipIdioStateKeyOn", 1},
	{"ShipIdioStateKeyOff", 1},
	{"ShipIdioStateKeyTempOn", 1},
	{"CustomCommandCode", 1},
}

function Entrance()
	
	TechnologyControlInitlize()
	
	if(PlayerSurviveJudge ~= 0)then
		InitlizeAzrael()
	end
	
	UnitCharacteristicInitlize()

	--UI_SetElementEnabled("NewResearchMenu","btnShowAll",0)
end

function UnitCharacteristicInitlize()
	SobGroup_Create("X_CommandTempGroup")
	SobGroup_SetSwitchOwnerFlag("X_CommandTempGroup", 0)
	SobGroup_Create("X_CommandTempGroup2")
	SobGroup_SetSwitchOwnerFlag("X_CommandTempGroup2", 0)
	SobGroup_Create("UnitCharacteristicTempGroup")
	SobGroup_SetSwitchOwnerFlag("UnitCharacteristicTempGroup", 0)
	SobGroup_Create("UnitCharacteristicTempGroup2")
	SobGroup_SetSwitchOwnerFlag("UnitCharacteristicTempGroup2", 0)
	SobGroup_Create("UnitCharacteristicTempGroup3")
	SobGroup_SetSwitchOwnerFlag("UnitCharacteristicTempGroup3", 0)
	SobGroup_Create("UnitReplacementTempGroup")
	SobGroup_SetSwitchOwnerFlag("UnitReplacementTempGroup", 0)
	SobGroup_Create("UnitReplacementTempGroup2")
	SobGroup_SetSwitchOwnerFlag("UnitReplacementTempGroup2", 0)
	Volume_AddCube("UnitReplacementTempVolume", {100000,100000,100000,}, 100)
	for iIndex,iGroup in SG_Characteristic do
		SobGroup_Create("SG_"..iGroup[1])
		SobGroup_SetSwitchOwnerFlag("SG_"..iGroup[1], 0)
	end
	for i=1,ScheduledShipAbilityMaxNumber do
		SobGroup_Create("SG_Ability_"..i)
		SobGroup_SetSwitchOwnerFlag("SG_Ability_"..i, 0)
	end
	SobGroup_Create("UnitControlTempGroup")
	SobGroup_SetSwitchOwnerFlag("UnitControlTempGroup", 0)
	SobGroup_Create("UnitControlTempGroup2")
	SobGroup_SetSwitchOwnerFlag("UnitControlTempGroup2", 0)
	
	Rule_AddInterval("X_UpdateUnitFromGameEvent",UNITUPDATETIME)
	Rule_Add("X_Run")
	--Rule_Add("UnitCharacteristicCheck")
	--Rule_Add("UnitCharacteristicRuning")
	--Rule_AddInterval("UnitCharacteristicRuning",UNITCHARACTERISTICTEMPTIME)
end

--SEARCHTEMPTIME = 0.5 --单位检索时间
SEARCHWAITTEMPTIME = 0 --检索启动等待时间
--UNITCHARACTERISTICCHECKTEMPTIME = 0.1 --能力检测间隔
--UNITCHARACTERISTICTEMPTIME = 0.1 --能力运行间隔

function TechnologyControlInitlize()
	local iPlayer = 0
	local iPlayerCount = Universe_PlayerCount()
	while(iPlayer < iPlayerCount)do
		tinsert(TechnologyControlState, (iPlayer + 1), {})
		tinsert(TechnologyTimeCountDown, (iPlayer + 1), {})
		tinsert(TechnologyControlStateAnnal, (iPlayer + 1), {})
		local iTechnology = 1
		while(Technologies[iTechnology] ~= nil)do
			tinsert(TechnologyControlState[iPlayer + 1], iTechnology, 0)
			tinsert(TechnologyTimeCountDown[iPlayer + 1], iTechnology, 0)
			tinsert(TechnologyControlStateAnnal[iPlayer + 1], iTechnology, 0)
			iTechnology = iTechnology + 1
		end
		iPlayer = iPlayer + 1
	end
	SobGroup_Create("TechnologyControlTempGroup")
	SobGroup_SetSwitchOwnerFlag("TechnologyControlTempGroup", 0)
	Rule_AddInterval("TechnologyControl",0.1)
end

function TechnologyControl()
	---2:已满足研究列表解锁条件，将始终可见(Lock=-1)
	---1:已满足研究列表解锁条件，但被X系统禁止研究(Lock=0 or 1)
	--0:未在研究列表中解锁，尚未受X系统控制
	--1: 已满足研究列表和X系统解锁条件，但仍受X系统控制(Lock=0 or -1)
	--2: 已满足研究列表和X系统解锁条件，将始终可见(Lock=1)
	--3: 正在研究，且仍受X系统控制(Lock=0 or -1)
	--4: 正在研究，且不受X系统控制(Lock=1)
	--5:已研究完成
	--6:激活中(AutoReset/FunctionReset)
	--7:冷却中(AutoReset/FunctionReset)
	local iPlayerIndex = 0
	local iPlayerCount = Universe_PlayerCount()
	while(iPlayerIndex < iPlayerCount)do
		if(Player_IsAlive(iPlayerIndex) == 1)then
			local iPlayerRace = Race_GetName(Player_GetRace(iPlayerIndex))
			local iTechnology = 1
			while(Technologies[iTechnology] ~= nil)do
				if(iPlayerRace == Technologies[iTechnology].RaceName)then
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 0)then
						if(Player_CanResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:可研究但受控
						end
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 3--3:研究中但受控
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 1 
					or TechnologyControlState[iPlayerIndex + 1][iTechnology] == -1 
					or TechnologyControlState[iPlayerIndex + 1][iTechnology] == -2 
					or TechnologyControlState[iPlayerIndex + 1][iTechnology] == 3)then
						local iLegal = 0
						local iConditionGroup = 1
						while(iLegal == 0 and Technologies[iTechnology].Opener[iConditionGroup] ~= nil)do
							iLegal = 1
							local iConditionItem = 1
							while(iLegal == 1 and Technologies[iTechnology].Opener[iConditionGroup][iConditionItem] ~= nil)do
								---------------------------条件处理
								iLegal = XTechConditionJudge[Technologies[iTechnology].Opener[iConditionGroup][iConditionItem][1]](iPlayerIndex,Technologies[iTechnology].Opener[iConditionGroup][iConditionItem])
									--废弃的等级和子系统数量条件判断
								iConditionItem = iConditionItem + 1
							end
							iConditionGroup = iConditionGroup + 1
						end
						if(iConditionGroup == 1)then
							iLegal = 1
						end
						if(iLegal == 0)then
							if(Technologies[iTechnology].Lock == -1)then--条件不满足，始终可见
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = -2---2:可见
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = -1---1:受控中
							end
						else
							if(Technologies[iTechnology].Lock == 1)then--条件满足，始终可见
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 2--2:可研究不受控
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:可研究但受控
							end
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 1)then--1:可研究但受控
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 3--3:研究中但受控
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 2)then--2:可研究不受控
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 4--4:研究中不受控
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 3)then--3:研究中但受控
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
							if(Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 5--5:研究完成
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:可研究但受控
							end
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 6)then--6:激活中
						if(Technologies[iTechnology].Type=="FunctionReset")then
							if(TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]==0)then
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:可研究但受控
								TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology] = 0
								Player_UnrestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							else
								TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]=TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]+1
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							end
						elseif(Technologies[iTechnology].Type=="AutoReset")then
							if(TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]<Technologies[iTechnology].Length*10)then
								TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]=TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]+1
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							else
								TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]=TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]+1
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 7--7:冷却中
							end
						end
					end
										
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 7)then--7:冷却中
						TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]=TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]+1
						if(TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]==(Technologies[iTechnology].Length+Technologies[iTechnology].ColdTime)*10)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:可研究但受控
							TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology] = 0
							Player_UnrestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
						end
					end
										
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 4)then--4:研究中不受控
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
							if(Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 5--5:研究完成
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 2--2:可研究不受控
							end
						end
					end
					--状态改变：
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] ~= TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology])then
						TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] = TechnologyControlState[iPlayerIndex + 1][iTechnology]
						if(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -1)then--状态改为：-1:受控中
							if(Player_CanResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then--封禁科技
								Player_RestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
							--状态改为1或2：可研究但受控/不受控，条件满足，解锁科技
						elseif(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == 1 or TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == 2)then
							if(Player_CanResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0 and Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
								Player_UnrestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
							if (Technologies[iTechnology].Type=="Grant") then--瞬时获取科技
								Player_GrantResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
							--状态改为：-2：可见，解锁科技
						elseif(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -2)then
							if(Player_CanResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0 and Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
								Player_UnrestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
						end
					end
					--若玩家正在研究科技：
					if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
						--状态为-1：受控中，可见但不允许研究
						if(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -1)then
							Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
						--状态为-2：可见，不允许研究
						elseif(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -2)then
							Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
						else
							if (Technologies[iTechnology].Type=="Instant") then--瞬时免费科技
								Player_GrantResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 5--5:研究完成
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							elseif (Technologies[iTechnology].Type=="InstantReset") then--瞬时重置型科技
								Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							elseif (Technologies[iTechnology].Type=="AutoReset") then--自动重置型科技
								Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
								Player_RestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 6--6:激活中
								TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology] = 1
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							elseif (Technologies[iTechnology].Type=="FunctionReset") then--脚本重置型科技
								Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
								Player_RestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 6--6:激活中
								TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology] = 1
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							end
						end
					end
				end
				iTechnology = iTechnology + 1
			end
		end
		iPlayerIndex = iPlayerIndex + 1
	end
end

function InitlizeAzrael()
	Rule_Add("Azrael")
	SobGroup_Create("AzraelGroup")
	SobGroup_SetSwitchOwnerFlag("AzraelGroup", 0)
end

function Azrael()
	if(Rule_Exists("MainRule") == 1)then
		Rule_Remove("MainRule")
	end
	
	local iPlayer = 0
	local iPlayerCount = Universe_PlayerCount()
	while(iPlayer < iPlayerCount)do
		if(Player_IsAlive(iPlayer) == 1)then
			local iSurvive = -1
			local iRace = Race_GetName(Player_GetRace(iPlayer))
			if(ShipForSurvive[iRace] ~= nil)then
				local iShip = 1
				while(iSurvive <= 0 and ShipForSurvive[iRace][iShip] ~= nil)do
					SobGroup_Clear("AzraelGroup")
					Player_FillShipsByType("AzraelGroup", iPlayer, ShipForSurvive[iRace][iShip])
					if(SobGroup_Count("AzraelGroup") > 0)then
						if(iSurvive ~= 1)then
							iSurvive = 1
						end
					else
						if(iSurvive == -1)then
							iSurvive = 0
						end
					end
					--if(SobGroup_AreAnyOfTheseTypes("Player_Ships"..iPlayer, ShipForSurvive[iRace][iShip]) == 1)then
					--	iSurvive = 1
					--end
					iShip = iShip + 1
				end
			end
			if(iSurvive == 0)then
				Player_Kill(iPlayer)
			end
		end
		iPlayer = iPlayer + 1
	end
	
	iPlayer = 0
	local iEnemies = 0
	while(iPlayer < iPlayerCount)do
		if(Player_IsAlive(iPlayer) == 1)then
			local iOtherPlayer = 0
			while(iOtherPlayer < iPlayerCount)do
				if(AreAllied(iPlayer, iOtherPlayer) == 0)then
					if(Player_IsAlive(iOtherPlayer) == 1)then
						iEnemies = iEnemies + 1
					end
				end
				iOtherPlayer = iOtherPlayer + 1
			end
		end
		iPlayer = iPlayer + 1
	end
	
	if(iEnemies == 0)then
		Rule_AddInterval("waitForEnd",2)
		--Event_Start("endGame")
		Rule_Remove("Azrael")
	end
end
if(waitForEnd == nil) then
	function waitForEnd()	
		--if (Event_IsDone("endGame")) then	
			setGameOver()
			Rule_Remove("waitForEnd")
		--end
	end
end

