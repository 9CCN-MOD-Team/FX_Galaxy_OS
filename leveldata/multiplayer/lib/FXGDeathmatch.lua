dofilepath("Data:leveldata/multiplayer/lib/FXGDeathmatch_Data.lua")

function FXG_DeathmatchInit()
	for iPlayer=1,Universe_PlayerCount() do
		FXG_PlayerBranch[iPlayer]=0
		if (Player_GetLevelOfDifficulty(iPlayer-1)~=0) then
			local iBranch = random(3)
			Player_GrantResearchOption(iPlayer-1,"Branch"..iBranch)
			FXG_PlayerBranch[iPlayer]=iBranch
			FXG_RaceBranchFunction[Race_GetName(Player_GetRace(iPlayer-1))][iBranch](iPlayer-1)
		end
	end
	Rule_AddInterval("FXG_WaitForBranchSelect",0.1)
	Rule_AddInterval("FXG_Sumon_AllPlayer",0.1)
end

function FXG_WaitForBranchSelect()
	iFlag = 1
	for iPlayer=1,Universe_PlayerCount() do
		if (Player_GetLevelOfDifficulty(iPlayer-1)==0)and(FXG_PlayerBranch[iPlayer]==0) then
			iFlag = 0
			for i=1,3 do
				if (Player_HasQueuedResearch(iPlayer-1,"Branch"..i)==1) then
					Player_CancelResearch(iPlayer-1,"Branch"..i)
					Player_GrantResearchOption(iPlayer-1,"Branch"..i)
					for j=1,3 do
						if(i~=j)then
							Player_RestrictResearchOption(iPlayer-1,"Branch"..j)
						end
					end
					FXG_PlayerBranch[iPlayer]=i
					FXG_RaceBranchFunction[Race_GetName(Player_GetRace(iPlayer-1))][i](iPlayer-1)
					break
				end
			end
		end
	end
	if (iFlag==1) then
		Rule_Remove("FXG_WaitForBranchSelect")
	end
end

function FXG_Sumon_AllPlayer()
	for iPlayer=1,Universe_PlayerCount() do
		if(FXG_PlayerBranch[iPlayer]~=0)then
			FXG_Sumon_SinglePlayer(iPlayer-1,Race_GetName(Player_GetRace(iPlayer-1)),FXG_PlayerBranch[iPlayer])
			FXG_InstantBuild(iPlayer-1,Race_GetName(Player_GetRace(iPlayer-1)),FXG_PlayerBranch[iPlayer])
		end
	end
end

function FXG_Sumon_SinglePlayer(iPlayer,iRace,iBranch)
	local iData=FXG_Sumon_Data[iRace][iBranch]
	if(Player_HasQueuedResearch(iPlayer,iData.Research)==1)then
		Player_CancelResearch(iPlayer,iData.Research)
		if FXG_PlayerCanSumonUnit(iPlayer,iData)==1 then
			SobGroup_CreateShip("Player_Ships"..iPlayer,iData.Unit)
			Player_SetRU(iPlayer,Player_GetRU(iPlayer)-iData.Cost)
		end
	end
end

function FXG_PlayerCanSumonUnit(iPlayer,iData)
	local iFlag=0--玩家是否具有关键单位
	for iIndex,iUnit in iData.NeedUnits do
		if(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(iPlayer,iUnit)>0)then
			iFlag=1
			break
		end
	end
	if(iFlag==1)then--人口是否达到上限
		local iNum=Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(iPlayer,iData.Unit)
		if(iNum<iData.UnitCap)then
			for iIndex,iUnit in iData.SameTypeUnits do
				iNum=iNum+Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(iPlayer,iUnit)
			end
			if(iNum<iData.TotalUnitCap)then--RU是否足够
				if(Player_GetRU(iPlayer)>=iData.Cost)then
					return 1
				else
					Subtitle_Message_Handlerw("RU不足，无法召唤", 2, "", iPlayer)
					return 0
				end
			else
				Subtitle_Message_Handlerw("已达同类单位人口上限，无法召唤", 2, "", iPlayer)
				return 0
			end
		else
			Subtitle_Message_Handlerw("已达单位人口上限，无法召唤", 2, "", iPlayer)
			return 0
		end
	else
		Subtitle_Message_Handlerw("生产单位缺失，无法召唤", 2, "", iPlayer)
		return 0
	end
end

function FXG_InstantBuild(iPlayer,iRace,iBranch)
	local iData=FXG_InstantBuild_Data[iRace][iBranch]
	if(Player_CanResearch(iPlayer,iData.Research)==1)then
		Player_GrantResearchOption(iPlayer,iData.Research)
		if(iData.Type=="Ship")then
			SobGroup_CreateShip("Player_Ships"..iPlayer,iData.ThingToBuild)
		else
			SobGroup_CreateSubSystem("Player_Ships"..iPlayer,iData.ThingToBuild)
		end
	end
end