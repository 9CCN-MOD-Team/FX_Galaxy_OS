--version 2.1.2.2017.05.07

dofilepath("data:leveldata/multiplayer/resdata/XCode.lua")
dofilepath("data:leveldata/multiplayer/resdata/XTechFunction.lua")
TechnologyControlState = {}
TechnologyTimeCountDown = {}
TechnologyControlStateAnnal = {}
SHIPGLOBALSTATEOBLIGATENUMBER = 30
UNITUPDATETIME = 0.5 --��λ�б����ʱ����

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

--SEARCHTEMPTIME = 0.5 --��λ����ʱ��
SEARCHWAITTEMPTIME = 0 --���������ȴ�ʱ��
--UNITCHARACTERISTICCHECKTEMPTIME = 0.1 --���������
--UNITCHARACTERISTICTEMPTIME = 0.1 --�������м��

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
	---2:�������о��б������������ʼ�տɼ�(Lock=-1)
	---1:�������о��б��������������Xϵͳ��ֹ�о�(Lock=0 or 1)
	--0:δ���о��б��н�������δ��Xϵͳ����
	--1: �������о��б��Xϵͳ����������������Xϵͳ����(Lock=0 or -1)
	--2: �������о��б��Xϵͳ������������ʼ�տɼ�(Lock=1)
	--3: �����о���������Xϵͳ����(Lock=0 or -1)
	--4: �����о����Ҳ���Xϵͳ����(Lock=1)
	--5:���о����
	--6:������(AutoReset/FunctionReset)
	--7:��ȴ��(AutoReset/FunctionReset)
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
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:���о����ܿ�
						end
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 3--3:�о��е��ܿ�
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
								---------------------------��������
								iLegal = XTechConditionJudge[Technologies[iTechnology].Opener[iConditionGroup][iConditionItem][1]](iPlayerIndex,Technologies[iTechnology].Opener[iConditionGroup][iConditionItem])
									--�����ĵȼ�����ϵͳ���������ж�
								iConditionItem = iConditionItem + 1
							end
							iConditionGroup = iConditionGroup + 1
						end
						if(iConditionGroup == 1)then
							iLegal = 1
						end
						if(iLegal == 0)then
							if(Technologies[iTechnology].Lock == -1)then--���������㣬ʼ�տɼ�
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = -2---2:�ɼ�
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = -1---1:�ܿ���
							end
						else
							if(Technologies[iTechnology].Lock == 1)then--�������㣬ʼ�տɼ�
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 2--2:���о����ܿ�
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:���о����ܿ�
							end
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 1)then--1:���о����ܿ�
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 3--3:�о��е��ܿ�
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 2)then--2:���о����ܿ�
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 4--4:�о��в��ܿ�
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 3)then--3:�о��е��ܿ�
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
							if(Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 5--5:�о����
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:���о����ܿ�
							end
						end
					end
					
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 6)then--6:������
						if(Technologies[iTechnology].Type=="FunctionReset")then
							if(TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]==0)then
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:���о����ܿ�
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
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 7--7:��ȴ��
							end
						end
					end
										
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 7)then--7:��ȴ��
						TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]=TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]+1
						if(TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]==(Technologies[iTechnology].Length+Technologies[iTechnology].ColdTime)*10)then
							TechnologyControlState[iPlayerIndex + 1][iTechnology] = 1--1:���о����ܿ�
							TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology] = 0
							Player_UnrestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
						end
					end
										
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] == 4)then--4:�о��в��ܿ�
						if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
							if(Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 5--5:�о����
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							else
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 2--2:���о����ܿ�
							end
						end
					end
					--״̬�ı䣺
					if(TechnologyControlState[iPlayerIndex + 1][iTechnology] ~= TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology])then
						TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] = TechnologyControlState[iPlayerIndex + 1][iTechnology]
						if(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -1)then--״̬��Ϊ��-1:�ܿ���
							if(Player_CanResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then--����Ƽ�
								Player_RestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
							--״̬��Ϊ1��2�����о����ܿ�/���ܿأ��������㣬�����Ƽ�
						elseif(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == 1 or TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == 2)then
							if(Player_CanResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0 and Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
								Player_UnrestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
							if (Technologies[iTechnology].Type=="Grant") then--˲ʱ��ȡ�Ƽ�
								Player_GrantResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
							--״̬��Ϊ��-2���ɼ��������Ƽ�
						elseif(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -2)then
							if(Player_CanResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0 and Player_HasResearch(iPlayerIndex, Technologies[iTechnology].Name) == 0)then
								Player_UnrestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
							end
						end
					end
					--����������о��Ƽ���
					if(Player_HasQueuedResearch(iPlayerIndex, Technologies[iTechnology].Name) == 1)then
						--״̬Ϊ-1���ܿ��У��ɼ����������о�
						if(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -1)then
							Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
						--״̬Ϊ-2���ɼ����������о�
						elseif(TechnologyControlStateAnnal[iPlayerIndex + 1][iTechnology] == -2)then
							Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
						else
							if (Technologies[iTechnology].Type=="Instant") then--˲ʱ��ѿƼ�
								Player_GrantResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 5--5:�о����
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							elseif (Technologies[iTechnology].Type=="InstantReset") then--˲ʱ�����ͿƼ�
								Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							elseif (Technologies[iTechnology].Type=="AutoReset") then--�Զ������ͿƼ�
								Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
								Player_RestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 6--6:������
								TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology] = 1
								XDoTechFunction(iPlayerIndex,Technologies[iTechnology].Function,iTechnology)
							elseif (Technologies[iTechnology].Type=="FunctionReset") then--�ű������ͿƼ�
								Player_CancelResearch(iPlayerIndex, Technologies[iTechnology].Name)
								Player_RestrictResearchOption(iPlayerIndex, Technologies[iTechnology].Name)
								TechnologyControlState[iPlayerIndex + 1][iTechnology] = 6--6:������
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

