PlayerArtifacts={0,0,0,0,0,0,0,0,}
ArtifactPoints={}
ArtifactSpawnInterval=300
ArtifactSpawnInterval2=120
ArtifactAIs={}
ArtifactCollector={"hgn_resourcecollector","vgr_resourcecollector","kpr_resourcecollector","tai_resourcecollector","kad_salvager","tur_resourcecollector","hgn_resourcecollector","kus_resourcecollector",}
PlayerPositions={}
ArtifactPing={}
ArtifactTeam={}
artifacttowin = 0
dofilepath("locale:localetext.lua")
objectiveArtifact = 0

function ArtifactMode_Init()
    artifacttowin = GetGameSettingAsNumber("artifacts")
    timelimit = 60*GetGameSettingAsNumber("TimeCountDown")
	Rule_AddInterval("SpawnArtifact",1)
	for i=1,Universe_PlayerCount()+1 do
		ArtifactPoints[i]=ArtifactSpawnInterval
		SobGroup_Create("Artifact"..i)
		SobGroup_Create("ArtifactTempGroup_"..i)
		SobGroup_SetSwitchOwnerFlag("Artifact"..i, 0)
	end
	for playerIndex=0,Universe_PlayerCount()-1 do
		local l_LOD=Player_GetLevelOfDifficulty(playerIndex)
		if(l_LOD~=0)then
			ArtifactAIs[playerIndex+1]=l_LOD
			for i=1,Universe_PlayerCount()+1 do
				SobGroup_Create("ArtifactGroup"..playerIndex.."_"..i)
			end
		end
	end
	ArtifactTeamAdd()
	SobGroup_Create("AllArtifact")
	SobGroup_Create("ArtifactTempGroup")
	SobGroup_Create("ArtifactTempGroup2")
	Rule_AddInterval("ArtifactCheck",1)
	Rule_AddInterval("ArtifactUIUpdate",1)
	if(cpuplayers~=0)then
		Rule_AddInterval("ArtifactAI",5)
	end
	Rule_AddInterval("Timer",0.1)
	Rule_AddInterval("GetArtifactPosition",15)
end

function Timer()
    Timer_Start(1, timelimit)
    Subtitle_TimeCounter(1,90212)
	Rule_Remove("Timer")
end

function ArtifactUIUpdate()
	if(Timer_GetRemaining(1)<1)then
		local artifactNum=0
		local maxNum=0
		local maxPlayer=0
		for playerIndex=0,Universe_PlayerCount()-1 do
			artifactNum=PlayerArtifacts[playerIndex+1]
			for otherPlayer=0,Universe_PlayerCount()-1 do
				if(playerIndex~=otherPlayer)then
					if(AreAllied(playerIndex, otherPlayer)==1)then
						artifactNum=artifactNum+PlayerArtifacts[otherPlayer+1]
					end
				end
			end
			if(artifactNum>maxNum)then
				maxNum=artifactNum
				maxPlayer=playerIndex
			end
			artifactNum=0
		end
		for otherPlayer=0,Universe_PlayerCount()-1 do
			if(maxPlayer~=otherPlayer)then
				if(AreAllied(maxPlayer, otherPlayer)==0)and(Player_IsAlive(otherPlayer)==1)then
					Player_Kill(otherPlayer)
				end
			end
		end
		Rule_AddInterval("waitForEnd",2)
		Rule_Remove("mainrule_updating")
		Rule_Remove("SpawnArtifact")
		Rule_Remove("ArtifactCheck")
		Rule_Remove("ArtifactUIUpdate")
	end
end

function GetArtifactPosition()
	for playerIndex=0,Universe_PlayerCount()-1 do
		PlayerPositions[playerIndex+1]=SobGroup_GetPosition("Player_Ships"..playerIndex)
	end
	objectiveArtifact = Objective_Add("$90213", OT_Primary)
	Objective_AddDescription(objectiveArtifact, LocaleText[10](artifacttowin))
	Rule_Remove("GetArtifactPosition")
end

function SpawnArtifact()
	local ArtifactPosition={}
	for PointIndex,PointStatus in ArtifactPoints do
		if (PointStatus>0) then
			ArtifactPoints[PointIndex]=ArtifactPoints[PointIndex]-1
		elseif (PointStatus==0)and(SobGroup_Empty("Artifact"..PointIndex)==1)and(((PointIndex~=Universe_PlayerCount()+1)and(Player_IsAlive(PointIndex-1)==1))or(PointIndex==Universe_PlayerCount()+1)) then
			ArtifactPosition[PointIndex]={0,0,0,}
			for playerIndex=0,Universe_PlayerCount()-1 do
				ArtifactPosition[PointIndex][1]=ArtifactPosition[PointIndex][1]+PlayerPositions[playerIndex+1][1]
				ArtifactPosition[PointIndex][2]=ArtifactPosition[PointIndex][2]+PlayerPositions[playerIndex+1][2]
				ArtifactPosition[PointIndex][3]=ArtifactPosition[PointIndex][3]+PlayerPositions[playerIndex+1][3]
			end
			ArtifactPosition[PointIndex][1]=ArtifactPosition[PointIndex][1]/Universe_PlayerCount()
			ArtifactPosition[PointIndex][2]=ArtifactPosition[PointIndex][2]/Universe_PlayerCount()
			ArtifactPosition[PointIndex][3]=ArtifactPosition[PointIndex][3]/Universe_PlayerCount()
			if(PointIndex<=Universe_PlayerCount())then
				ArtifactPosition[PointIndex][1]=ArtifactPosition[PointIndex][1]+(PlayerPositions[PointIndex][1]-ArtifactPosition[PointIndex][1])/3
				ArtifactPosition[PointIndex][2]=ArtifactPosition[PointIndex][2]+(PlayerPositions[PointIndex][2]-ArtifactPosition[PointIndex][2])/3
				ArtifactPosition[PointIndex][3]=ArtifactPosition[PointIndex][3]+(PlayerPositions[PointIndex][3]-ArtifactPosition[PointIndex][3])/3
			end
			Volume_AddSphere("Artifact"..PointIndex, ArtifactPosition[PointIndex], 10)
			SobGroup_SpawnNewShipInSobGroup(-1, "Kpr_Mover_Salvage", "Artifact"..PointIndex, "Artifact"..PointIndex, "Artifact"..PointIndex)
			ArtifactPing[PointIndex]=Ping_AddSobGroup("Artifact"..PointIndex, "anomaly", "Artifact"..PointIndex)
			SobGroup_SobGroupAdd("AllArtifact", "Artifact"..PointIndex)
			ArtifactPoints[PointIndex]=-1
		elseif (PointStatus==-1)then
			if(SobGroup_Empty("Artifact"..PointIndex)==1)then
				ArtifactPoints[PointIndex]=ArtifactSpawnInterval2
			else
				if(SobGroup_IsInVolume("Artifact"..PointIndex, "Artifact"..PointIndex)==0)then
					ArtifactPoints[PointIndex]=ArtifactSpawnInterval2
				end
			end
		end
	end
end

function ArtifactCheck()
	for Artifact,PointStatus in ArtifactPoints do
		if(SobGroup_Empty("Artifact"..Artifact)==0)then
			for playerIndex=0,Universe_PlayerCount()-1 do
				if (SobGroup_SalvagedByPlayer("Artifact"..Artifact, playerIndex)==1) then
					PlayerArtifacts[playerIndex+1]=PlayerArtifacts[playerIndex+1]+1
					SobGroup_Clear("Artifact"..Artifact)
					Volume_Delete("Artifact"..Artifact)
					Ping_Remove(ArtifactPing[Artifact])
					ArtifactTeamCheck(playerIndex)
					if (playerIndex==Universe_CurrentPlayer()) then
						TreasureHunter()
					end
				end
			end
		end
	end
end

function ArtifactTeamAdd()
	local TeamIndex=0
	for playerIndex=0,Universe_PlayerCount()-1 do
		if (ArtifactTeam[playerIndex]==nil)then
			TeamIndex=TeamIndex+1
			ArtifactTeam[playerIndex]=TeamIndex
			for otherPlayer=0,Universe_PlayerCount()-1 do
				if(playerIndex~=otherPlayer)then
					if(AreAllied(playerIndex, otherPlayer)==1)then
						ArtifactTeam[otherPlayer]=TeamIndex
					end
				end
			end
		end
	end
end

function ArtifactTeamCheck(pIndex)
	local artifactNum=0
	for playerIndex=0,Universe_PlayerCount()-1 do
		artifactNum=PlayerArtifacts[playerIndex+1]
		for otherPlayer=0,Universe_PlayerCount()-1 do
			if(playerIndex~=otherPlayer)then
				if(AreAllied(playerIndex, otherPlayer)==1)then
					artifactNum=artifactNum+PlayerArtifacts[otherPlayer+1]
				end
			end
		end
		if(artifactNum>=artifacttowin)and(artifacttowin~=0)then
			for otherPlayer=0,Universe_PlayerCount()-1 do
				if(playerIndex~=otherPlayer)then
					if(AreAllied(playerIndex, otherPlayer)==0)and(Player_IsAlive(otherPlayer)==1)then
						Player_Kill(otherPlayer)
					end
				end
			end
			Rule_AddInterval("waitForEnd",2)
			Rule_Remove("mainrule_updating")
			Rule_Remove("SpawnArtifact")
			Rule_Remove("ArtifactCheck")
			Rule_Remove("ArtifactUIUpdate")
			break
		end
		if(playerIndex==pIndex)then
			Subtitle_Message(LocaleText[9](ArtifactTeam[pIndex],pIndex,artifactNum,artifacttowin), 3)
		end
		artifactNum=0
	end
end

function ArtifactAI()
	for Index,LOD in ArtifactAIs do
		local playerIndex=Index-1
		local ArtifactNum=0
		for Artifact,PointStatus in ArtifactPoints do
			if(PointStatus==0)then
				CPU_AddDefendTarget(playerIndex, "Artifact"..Artifact, 25)
			end
			SobGroup_Clear("ArtifactTempGroup_"..Artifact)
			SobGroup_GetSobGroupSalvagingGroup("Artifact"..Artifact, "ArtifactTempGroup_"..Artifact)
--AI缺少打捞遗物的船，从现有采集船中抽调
			if(SobGroup_Empty("Artifact"..Artifact)==0)and(SobGroup_Empty("ArtifactTempGroup_"..Artifact)==1)and(SobGroup_Empty("ArtifactGroup"..playerIndex.."_"..Artifact)==1)then
				Player_FillShipsByType("ArtifactTempGroup", playerIndex, ArtifactCollector[PlayerRace_GetNumber(playerIndex,"raceID", 1.0)])
				local CollectorIndex=0
				while(CollectorIndex<=SobGroup_Count("ArtifactTempGroup"))and(SobGroup_Empty("ArtifactTempGroup")==0)and(SobGroup_Empty("ArtifactGroup"..playerIndex.."_"..Artifact)==1)do
					SobGroup_FillShipsByIndexRange("ArtifactTempGroup2", "ArtifactTempGroup", CollectorIndex, 1)
					local iFlag=0
					for Artifact2,PointStatus2 in ArtifactPoints do
						if(Artifact2~=Artifact)then
							if(SobGroup_GroupInGroup("ArtifactGroup"..playerIndex.."_"..Artifact2, "ArtifactTempGroup2")==1)then
								iFlag=1
								break
							end
						end
					end
					if(iFlag==0)then
						CPU_RemoveSobGroup(playerIndex, "ArtifactTempGroup2")
						SobGroup_SobGroupAdd("ArtifactGroup"..playerIndex.."_"..Artifact, "ArtifactTempGroup2")
						CPU_AddDefendSobGroup(playerIndex, "ArtifactTempGroup2", 50)
						SobGroup_Clear("ArtifactTempGroup2")
						break
					end
					CollectorIndex=CollectorIndex+1
				end
				SobGroup_Clear("ArtifactTempGroup")
--打捞船过剩，转回AI控制
			elseif((SobGroup_Empty("Artifact"..Artifact)==1)or(SobGroup_Empty("ArtifactTempGroup_"..Artifact)==0))and(SobGroup_Empty("ArtifactGroup"..playerIndex.."_"..Artifact)==0)then
				SobGroup_GetSobGroupSalvagingGroup("AllArtifact", "ArtifactTempGroup")
				if(SobGroup_GroupInGroup("ArtifactTempGroup", "ArtifactGroup"..playerIndex.."_"..Artifact)==0)then
					SobGroup_Clear("ArtifactTempGroup")
					CPU_AddSobGroup(playerIndex, "ArtifactGroup"..playerIndex.."_"..Artifact)
					CPU_AddDefendSobGroup(playerIndex, "ArtifactGroup"..playerIndex.."_"..Artifact, 0)
				end
				SobGroup_Clear("ArtifactTempGroup")
--控制AI打捞遗物
			elseif(SobGroup_Empty("Artifact"..Artifact)==0)and(SobGroup_Empty("ArtifactTempGroup_"..Artifact)==1)and(SobGroup_Empty("ArtifactGroup"..playerIndex.."_"..Artifact)==0)then
				SobGroup_GetSobGroupSalvagingGroup("AllArtifact", "ArtifactTempGroup")
				if(SobGroup_GroupInGroup("ArtifactTempGroup", "ArtifactGroup"..playerIndex.."_"..Artifact)==0)and(SobGroup_IsDoingAbility("ArtifactGroup"..playerIndex.."_"..Artifact,AB_Salvage)==0)then
					SobGroup_SalvageSobGroup("ArtifactGroup"..playerIndex.."_"..Artifact, "Artifact"..Artifact)
					CPU_AddDefendSobGroup(playerIndex, "ArtifactGroup"..playerIndex.."_"..Artifact, 50)
				elseif(SobGroup_IsDoingAbility("ArtifactGroup"..playerIndex.."_"..Artifact,AB_Salvage)==1)then
					CPU_AddDefendSobGroup(playerIndex, "ArtifactGroup"..playerIndex.."_"..Artifact, 100)
				elseif(SobGroup_GroupInGroup("ArtifactTempGroup", "ArtifactGroup"..playerIndex.."_"..Artifact)==1)then
					CPU_AddDefendSobGroup(playerIndex, "ArtifactGroup"..playerIndex.."_"..Artifact, 150)
				end
				SobGroup_Clear("ArtifactTempGroup")
			end
		end
	end
end