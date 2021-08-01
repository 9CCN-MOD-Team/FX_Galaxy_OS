FX_TacticalReport_Names = {
  FX_TacticalReport_RU = {"$90300", "$90301"},
  FX_TacticalReport_GatheredRU = {"$90302", "$90303"},
  FX_TacticalReport_KillInRUs = {"$90304", "$90305"},
  FX_TacticalReport_ShipInRUs = {"$90306", "$90307"},
  FX_TacticalReport_FighterCount = {"$90308", "$90309"},
  FX_TacticalReport_CorvetteCount = {"$90310", "$90311"},
  FX_TacticalReport_FrigateCount = {"$90312", "$90313"},
  FX_TacticalReport_CapshipCount = {"$90314", "$90315"},
}

ob_InfoIndex=1
ob_InfoTable={"FX_TacticalReport_RU","FX_TacticalReport_GatheredRU","FX_TacticalReport_KillInRUs","FX_TacticalReport_ShipInRUs","FX_TacticalReport_FighterCount","FX_TacticalReport_CorvetteCount","FX_TacticalReport_FrigateCount","FX_TacticalReport_CapshipCount",}

function OBInfoOninit()
	if (Universe_RulesName()=="PVPFXG") then
		FX_TimingOutputInit()
		if (Race_GetName(Player_GetRace(Universe_CurrentPlayer()))=="Observer") then
			Rule_Add("ShowOtherPlayerRU")
			Rule_Add("OtherPlayerRUUpdate")
			for iPlayerIndex=0,Universe_PlayerCount()-1 do
				if (Player_IsAlive(iPlayerIndex)==1)and(iPlayerIndex~=Universe_CurrentPlayer()) then
					UI_SetTextLabelTextWF1("OBInfo", "Player"..(iPlayerIndex+1), "%ls", Player_GetName(iPlayerIndex))
				end
			end
			for i=2,8 do
				UI_SetElementVisible("OBInfo", "btnMode"..i, 0)
			end
			UI_SetElementVisible("NewTaskbar", "btnOBIntel", 1)
			UI_SetElementVisible("NewTaskbar", "btnFleet", 0)
			UI_SetElementVisible("NewTaskbar", "btnQueue", 0)
		end
	end
end

function FX_TimingOutputInit()
	local iRace=Race_GetName(Player_GetRace(Universe_CurrentPlayer()))
	if iRace~="Observer" then
		dofilepath("data:scripts/races/"..iRace.."/scripts/build.lua")
		FX_TimingOutputTable = {}
		for index,data in build do
			if data.Type==SubSystem then
				tinsert(FX_TimingOutputTable,{data.ThingToBuild,0})
			end
		end
		FX_TimingOutputTable.n=nil
		Rule_AddInterval("FX_TimingOutput",1)
	else
		FX_TimingOutputTable = {}
		for iPlayer=0,Universe_PlayerCount()-1 do
			iRace=Race_GetName(Player_GetRace(iPlayer))
			if iRace~="Observer" then
				dofilepath("data:scripts/races/"..iRace.."/scripts/build.lua")
				FX_TimingOutputTable[iPlayer]={}
				if iRace=="Keeper" then
					FX_TimingOutputTable[iPlayer]=
					{
						{"Kpr_ResearchShip_1",0,"$8330"},
						{"Kpr_ResearchShip_2",0,"$8331"},
						{"Kpr_ResearchShip_3",0,"$8332"},
						{"Kpr_Energy_PhotonBomb",0,"$8310"},
						{"Kpr_Energy_Photoncannon",0,"$8312"},
						{"Kpr_Energy_Pulsar",0,"$8318"},
						{"Kpr_Energy_IonCannon",0,"$8314"},
						{"Kpr_Energy_PhasedCannon",0,"$8316"},
						{"Kpr_Energy_SuperPulsar",0,"$8320"},
					}
				else
					if iRace=="Taiidan" then
						FX_TimingOutputTable[iPlayer]=
						{
							{"Tai_ResearchShip_1f",0,"$9611"},
							{"Tai_ResearchShip_2f",0,"$9613"},
							{"Tai_ResearchShip_3f",0,"$9615"},
							{"Tai_ResearchShip_4f",0,"$9617"},
							{"Tai_ResearchShip_5f",0,"$9643"},
							{"Tai_ResearchStation",0,"$9609"},
						}
					end
					for index,data in build do
						if data.Type==SubSystem then
							tinsert(FX_TimingOutputTable[iPlayer],{data.ThingToBuild,0,data.DisplayedName})
						end
					end
				end
				FX_TimingOutputTable[iPlayer].n=nil
			end
		end
		FX_TimingOutputTable.n=nil
		Rule_AddInterval("FX_TimingReport",1)
	end
end

function FX_TimingOutput()
	for index,data in FX_TimingOutputTable do
		if data[2]==0 then
			if (SobGroup_IsBuilding("Player_Ships"..Universe_CurrentPlayer(), data[1])==1) then
				local iTime=floor(Universe_GameTime())
				local iHour=floor(iTime/3600)
				local iMinute=floor(iTime/60)
				local iSecond=floor(mod(iTime,60))
				if iHour<10 then iHour="0"..iHour end
				if iMinute<10 then iMinute="0"..iMinute end
				if iSecond<10 then iSecond="0"..iSecond end
				iTime=iHour..":"..iMinute..":"..iSecond
				data[2]=1
			end
		elseif data[2]==1 then
			if (SobGroup_HasSubsystem("Player_Ships"..Universe_CurrentPlayer(), data[1])==1)or(SobGroup_AreAnyOfTheseTypes("Player_Ships"..Universe_CurrentPlayer(), data[1])==1) then
				local iTime=floor(Universe_GameTime())
				local iHour=floor(iTime/3600)
				local iMinute=floor(iTime/60)
				local iSecond=floor(mod(iTime,60))
				if iHour<10 then iHour="0"..iHour end
				if iMinute<10 then iMinute="0"..iMinute end
				if iSecond<10 then iSecond="0"..iSecond end
				iTime=iHour..":"..iMinute..":"..iSecond
				data[2]=2
			end
		end
	end
end

function FX_TimingReport()
	for iPlayer,iTable in FX_TimingOutputTable do
		for index,data in iTable do
			if data[2]==0 then
				if (SobGroup_IsBuilding("Player_Ships"..iPlayer, data[1])==1) then
					Subtitle_Add4(1,"%ls".." Build:",Player_GetName(iPlayer),data[3],time)
					data[2]=1
				end
			elseif data[2]==1 then
				if (SobGroup_HasSubsystem("Player_Ships"..iPlayer, data[1])==1)or(SobGroup_AreAnyOfTheseTypes("Player_Ships"..Universe_CurrentPlayer(), data[1])==1) then
					Subtitle_Add4(1,"%ls".." Built:",Player_GetName(iPlayer),data[3],time)
					data[2]=2
				end
			end
		end
	end
end

function ShowOtherPlayerRU()
	for i=1,8 do
		if (UI_IsNamedElementVisible("OBInfo", "btnMode"..i)==1) then
			ob_InfoIndex=i
			break
		end
	end
end

function OtherPlayerRUUpdate()
	local iText=""
	for iPlayerIndex=0,Universe_PlayerCount()-1 do
		if (Player_IsAlive(iPlayerIndex)==1)and(iPlayerIndex~=Universe_CurrentPlayer()) then
			iText=floor(XTR_Output[ob_InfoTable[ob_InfoIndex]](iPlayerIndex))
			UI_SetTextLabelText("OBInfo", "Information"..(iPlayerIndex+1), iText)
		end
	end
end
