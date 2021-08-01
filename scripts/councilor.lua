dofilepath("locale:councilor.lua")
Councilor_Switch = 1

function CouncilorOninit()
	if Councilor_Switch==0 then
		return
	else
		local iInterval = GetGameSettingAsNumber("AdviseInterval")
		if (iInterval==0)or(Race_GetName(Player_GetRace(Universe_CurrentPlayer()))=="Observer") then
			return
		else
			UI_SetElementVisible("NewTaskbar", "btnCouncilor", 1)
		end
	end
	CouncilorData={}
	CouncilorRaceData={}
	CouncilorSuggestIndex={}
	for iPlayer=0,Universe_PlayerCount()-1 do
		CouncilorSuggestIndex[iPlayer]=getn(Councilor_Suggestions)
		CouncilorData[iPlayer]=
		{
			Race=Race_GetName(Player_GetRace(iPlayer)),
			Fighter=0,
			Corvette=0,
			Frigate=0,
			AntiFi=0,
			AntiCo=0,
			AntiFr=0,
			UnitCap={},
		}
		if (iPlayer==Universe_CurrentPlayer()) then
			if (CouncilorRaceData[CouncilorData[iPlayer].Race]==nil) then
				CouncilorRaceData[CouncilorData[iPlayer].Race]=
				{
					AntiFi={},
					AntiCo={},
					AntiFr={},
					Builder={},
					Worker={},
					UnitCap=GetUnitCapData(iPlayer),
				}
				if (CouncilorData[iPlayer].Race=="Bentusi") then
					tinsert(CouncilorRaceData[CouncilorData[iPlayer].Race].Worker,{"ben_cargobarge","$11108",{ResourceCollector=1,Utility=1,}})
				end
				if (CouncilorData[iPlayer].Race~="Observer") then
					dofilepath("data:/scripts/races/"..CouncilorData[iPlayer].Race.."/scripts/build.lua")
					for iIndex,iShip in build do
						if (iShip.Type == Ship) then
							dofilepath("data:/ship/"..iShip.ThingToBuild.."/"..iShip.ThingToBuild..".ship")
							if (NewShipType.antiFighterValue>0)and(NewShipType.antiFighterValue==max(NewShipType.antiFighterValue,NewShipType.antiCorvetteValue,NewShipType.antiFrigateValue))and(Player_BuildOptionIsRestricted(iPlayer,iShip.ThingToBuild)==0) then
								tinsert(CouncilorRaceData[CouncilorData[iPlayer].Race].AntiFi,{iShip.ThingToBuild,iShip.DisplayedName,NewShipType.UnitCap})
							end
							if (NewShipType.antiCorvetteValue>0)and(NewShipType.antiCorvetteValue==max(NewShipType.antiFighterValue,NewShipType.antiCorvetteValue,NewShipType.antiFrigateValue))and(Player_BuildOptionIsRestricted(iPlayer,iShip.ThingToBuild)==0) then
								tinsert(CouncilorRaceData[CouncilorData[iPlayer].Race].AntiCo,{iShip.ThingToBuild,iShip.DisplayedName,NewShipType.UnitCap})
							end
							if (NewShipType.antiFrigateValue>0)and(NewShipType.antiFrigateValue==max(NewShipType.antiFighterValue,NewShipType.antiCorvetteValue,NewShipType.antiFrigateValue))and(Player_BuildOptionIsRestricted(iPlayer,iShip.ThingToBuild)==0) then
								tinsert(CouncilorRaceData[CouncilorData[iPlayer].Race].AntiFr,{iShip.ThingToBuild,iShip.DisplayedName,NewShipType.UnitCap})
							end
							if (NewShipType.ability.CanBuildShips~=nil)and(Player_BuildOptionIsRestricted(iPlayer,iShip.ThingToBuild)==0) then
								tinsert(CouncilorRaceData[CouncilorData[iPlayer].Race].Builder,{iShip.ThingToBuild,iShip.DisplayedName,NewShipType.UnitCap})
							end
							if (NewShipType.ability.Harvest~=nil)and(Player_BuildOptionIsRestricted(iPlayer,iShip.ThingToBuild)==0) then
								tinsert(CouncilorRaceData[CouncilorData[iPlayer].Race].Worker,{iShip.ThingToBuild,iShip.DisplayedName,NewShipType.UnitCap})
							end
						end
					end
				end
			end
		end
	end
	Rule_Add("CallCouncilor")
end

function Councilor_UpdatePlayerShipsValue(iPlayer)
		CouncilorData[iPlayer].Fighter=0
		CouncilorData[iPlayer].Corvette=0
		CouncilorData[iPlayer].Frigate=0
		CouncilorData[iPlayer].AntiFi=0
		CouncilorData[iPlayer].AntiCo=0
		CouncilorData[iPlayer].AntiFr=0
		for iFamily,iValue in CouncilorData[iPlayer].UnitCap do
			CouncilorData[iPlayer].UnitCap[strupper(iFamily)]=0
		end
		dofilepath("data:/scripts/races/"..CouncilorData[iPlayer].Race.."/scripts/build.lua")
		for iIndex,iShip in build do
			if (iShip.Type == Ship) then
				dofilepath("data:/ship/"..iShip.ThingToBuild.."/"..iShip.ThingToBuild..".ship")
				local iNum=Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(iPlayer, iShip.ThingToBuild)
				local iBatchNum=1
				if (NewShipType.buildBatch~=nil) then
					iBatchNum=NewShipType.buildBatch
				end
				CouncilorData[iPlayer].Fighter=CouncilorData[iPlayer].Fighter+iNum*NewShipType.fighterValue*iBatchNum
				CouncilorData[iPlayer].Corvette=CouncilorData[iPlayer].Corvette+iNum*NewShipType.corvetteValue*iBatchNum
				CouncilorData[iPlayer].Frigate=CouncilorData[iPlayer].Frigate+iNum*NewShipType.frigateValue*iBatchNum
				CouncilorData[iPlayer].AntiFi=CouncilorData[iPlayer].AntiFi+iNum*NewShipType.antiFighterValue*iBatchNum
				CouncilorData[iPlayer].AntiCo=CouncilorData[iPlayer].AntiCo+iNum*NewShipType.antiCorvetteValue*iBatchNum
				CouncilorData[iPlayer].AntiFr=CouncilorData[iPlayer].AntiFr+iNum*NewShipType.antiFrigateValue*iBatchNum
				for iFamily,iValue in NewShipType.UnitCap do
					if (CouncilorData[iPlayer].UnitCap[strupper(iFamily)]==nil) then
						CouncilorData[iPlayer].UnitCap[strupper(iFamily)]=0
					end
					CouncilorData[iPlayer].UnitCap[strupper(iFamily)]=CouncilorData[iPlayer].UnitCap[strupper(iFamily)]+iValue*iNum
				end
			end
		end
		--_ALERT("Pl:"..iPlayer.."|Fi:"..CouncilorData[iPlayer].Fighter.."|Co:"..CouncilorData[iPlayer].Corvette.."|Fr:"..CouncilorData[iPlayer].Frigate.."|AFi:"..CouncilorData[iPlayer].AntiFi.."|ACo:"..CouncilorData[iPlayer].AntiCo.."|AFr:"..CouncilorData[iPlayer].AntiFr)
end

function Councilor_ButtonReset()
	UI_SetElementEnabled("NewTaskbar", "btnCouncilor", 1)
	Rule_Remove("Councilor_ButtonReset")
end

function CallCouncilor()
	if (UI_IsNamedElementVisible("NewTaskbar", "CallCouncilor")==1) then
		UI_SetElementVisible("NewTaskbar", "CallCouncilor", 0)
		if (Rule_Exists("Councilor_ButtonReset")==0) then
			UI_SetElementEnabled("NewTaskbar", "btnCouncilor", 0)
			Rule_AddInterval("Councilor_ButtonReset",GetGameSettingAsNumber("AdviseInterval"))
			local Councilor_MData=
			{
				AFighter=0,
				ACorvette=0,
				AFrigate=0,
				AAFi=0,
				AACo=0,
				AAFr=0,
				EFighter=0,
				ECorvette=0,
				EFrigate=0,
				EAFi=0,
				EACo=0,
				EAFr=0,
			}
			local l_Player=Universe_CurrentPlayer()
			for iPlayer=0,Universe_PlayerCount()-1 do
				Councilor_UpdatePlayerShipsValue(iPlayer)
				if (iPlayer~=l_Player) then
					if (AreAllied(iPlayer, l_Player)==1) then
						Councilor_MData.AFighter=Councilor_MData.AFighter+CouncilorData[iPlayer].Fighter
						Councilor_MData.ACorvette=Councilor_MData.ACorvette+CouncilorData[iPlayer].Corvette
						Councilor_MData.AFrigate=Councilor_MData.AFrigate+CouncilorData[iPlayer].Frigate
						Councilor_MData.AAFi=Councilor_MData.AAFi+CouncilorData[iPlayer].AntiFi
						Councilor_MData.AACo=Councilor_MData.AACo+CouncilorData[iPlayer].AntiCo
						Councilor_MData.AAFr=Councilor_MData.AAFr+CouncilorData[iPlayer].AntiFr
					else
						Councilor_MData.EFighter=Councilor_MData.EFighter+CouncilorData[iPlayer].Fighter
						Councilor_MData.ECorvette=Councilor_MData.ECorvette+CouncilorData[iPlayer].Corvette
						Councilor_MData.EFrigate=Councilor_MData.EFrigate+CouncilorData[iPlayer].Frigate
						Councilor_MData.EAFi=Councilor_MData.EAFi+CouncilorData[iPlayer].AntiFi
						Councilor_MData.EACo=Councilor_MData.EACo+CouncilorData[iPlayer].AntiCo
						Councilor_MData.EAFr=Councilor_MData.EAFr+CouncilorData[iPlayer].AntiFr
					end
				end
			end
			--_ALERT("EFi:"..Councilor_MData.EFighter.."|ECo:"..Councilor_MData.ECorvette.."|EFr:"..Councilor_MData.EFrigate.."|EAFi:"..Councilor_MData.EAFi.."|EACo:"..Councilor_MData.EACo.."|EAFr:"..Councilor_MData.EAFr)
			--_ALERT("AFi:"..Councilor_MData.AFighter.."|ACo:"..Councilor_MData.ACorvette.."|AFr:"..Councilor_MData.AFrigate.."|AAFi:"..Councilor_MData.AAFi.."|AACo:"..Councilor_MData.AACo.."|AAFr:"..Councilor_MData.AAFr)
			local iSugge =0
			if (CouncilorSuggestIndex[l_Player]==getn(Councilor_Suggestions)) then
				iSugge = 1
			else
				iSugge = CouncilorSuggestIndex[l_Player] + 1
			end
			local iFlag=0
			while (Councilor_Suggestions[iSugge](l_Player,CouncilorData[l_Player].Race,Councilor_MData)~=1) do
				if (iFlag~=0) then
					if (iSugge == iFlag) then
						break
					end
				else
					iFlag=iSugge
				end
				if (iSugge==getn(Councilor_Suggestions)) then
					iSugge = 1
				else
					iSugge = iSugge + 1
				end
			end
			if (iSugge == iFlag) then
				Subtitle_Add2(Councilor_Actor[CouncilorData[l_Player].Race].Military, Councilor_Text[194], 4)
			else
				CouncilorSuggestIndex[l_Player]=iSugge
			end
		end
	end
end


function Councilor_DevelopPossible(iPlayer,iData)
	if (iData.NaSu~=nil) then
		for iIndex,iSubs in iData.NaSu do
			if (SobGroup_HasSubsystem("Player_Ships"..iPlayer,iSubs)==1) then
				return 0
			end
		end
	elseif (iData.NaSh~=nil) then
		if (SobGroup_AreAnyOfTheseTypes("Player_Ships"..iPlayer,iData.NaSh)==1) then
			return 0
		end
	end
	return Councilor_DevelopPossible2(iPlayer,iData)
end

function Councilor_DevelopPossible2(iPlayer,iData)
	local iFlag=0
	if (iData.RqSu[1]~=nil) then
		for iIndex,iSubs in iData.RqSu do
			if (SobGroup_HasSubsystem("Player_Ships"..iPlayer,iSubs)==1) then
				iFlag=1
			end
		end
	else
		iFlag=1
	end
	if (iFlag==1)and(iData.RqSh~="") then
		if (SobGroup_AreAnyOfTheseTypes("Player_Ships"..iPlayer, iData.RqSh)==0) then
			iFlag=0
		end
	end
	return iFlag
end

function Concilor_RecommandItem(iPlayer,iRace,iText,iTable)
	local iShip=random(getn(iTable))
	local iCap=1
	local iNum=Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(iPlayer,iTable[iShip][1])
	for iFamily,iValue in CouncilorRaceData[iRace].AntiFr[iShip][3] do
		if ((iValue+CouncilorData[iPlayer].UnitCap[strupper(iFamily)])>CouncilorRaceData[CouncilorData[iPlayer].Race].UnitCap[strupper(iFamily)]) then
			iCap=0
			break
		end
	end
	if (iNum>0)and(iCap==1) then
		Subtitle_Add3(Councilor_Actor[iRace].Military, iText, iTable[iShip][2])
		return 1
	end
	return 0
end

