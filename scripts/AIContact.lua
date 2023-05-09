FX_AIRelation={0,0,0,0,0,0,0}
FX_AITransferTotal={0,0,0,0,0,0,0,0}
FX_AIContactPlayerData={}
FX_CurrentAIChoice={}
FX_CurrentAITask={}
FX_AIShipRequestIndex=0
FX_SobTaskFlag=2^4
FX_SobTaskFlag2=2^5
dofilepath("data:scripts/AIContact_TableFunctions.lua")
FX_AIContactPlayer=1

function FX_AIContact_SetEnableUIExit(bEnable)
	if bEnable then
		FX_AIContact_EnableUIExit = 1
		UI_SetElementEnabled("AIContact","CloseAIContact",1)
	else
		FX_AIContact_EnableUIExit = nil
		UI_SetElementEnabled("AIContact","CloseAIContact",0)
	end
end

--用原版YesNoDialog界面询问玩家
function DTM4_AskPlayer(iFunction1,iFunction2,iMessage)
	DTM4_Accept=iFunction1
	DTM4_Cancel=iFunction2
	UI_SetTextLabelText("YesNoDialog","m_lblMessage",iMessage)
	Rule_AddInterval("DTM4_ShowYesNoAgain",0.5)
	UI_ShowScreen("YesNoDialog",ePopup)
end
--不知道为啥界面不出现，只能再叫一次
function DTM4_ShowYesNoAgain()
	if (UI_IsScreenActive("YesNoDialog")==0) then
		UI_ShowScreen("YesNoDialog",ePopup)
	end
	Rule_Remove("DTM4_ShowYesNoAgain")
end

function FX_AITaskUpdate()
	for i=1,Universe_PlayerCount() do
		if FX_CurrentAITask[i]~=nil then
			if FX_CurrentAITask[i].accept==1 then
				FX_AITask[FX_CurrentAITask[i].kind].functionUpdate(i)
			elseif FX_CurrentAITask[i].accept==0 then
				FX_AITask[FX_CurrentAITask[i].kind].functionRefresh(i)
			end
		end
	end
end

function FX_AIContact_OnStartOrLoad()
	-- by default, do not show the AIContact btn,
	-- and the FX_ContactUIPopup function should do nothing
	UI_SetElementVisible('NewTaskbar', 'btnAIContact', 0)
	rawset(globals(), 'FX_ContactUIPopup', function() end)
	-- unless in a non-multiplayer game, where MainUI_ScarEvent works,
	-- we do show AIContact btn, and
	-- FX_ContactUIPopup will actually call FX_ContactUIPopup2
	MainUI_ScarEvent([[UI_SetElementVisible('NewTaskbar', 'btnAIContact', 1)]])
	MainUI_ScarEvent([[rawset(globals(), 'FX_ContactUIPopup', FX_ContactUIPopup2)]])
	
	FX_AIContact_SetEnableUIExit(1)
end

function FX_AIContactInit()
		SobGroup_CreateIfNotExist("FXAI_SelectedShip")
		SobGroup_CreateIfNotExist("FXAI_TempSelectedShip")
		SobGroup_CreateIfNotExist("FXAI_SelectedType")
		SobGroup_CreateIfNotExist("FXAI_SelectedShips")
		for i=1,Universe_PlayerCount() do
			for j=1,5 do
				SobGroup_CreateIfNotExist("FX_AI"..j.."Target"..i)
			end
			SobGroup_CreateIfNotExist("FX_AITargetAttacker"..i)
		end
		Rule_AddInterval("FX_AITaskUpdate",1)
		for iPlayer=1,7 do
			if (iPlayer<=Universe_PlayerCount()-1) then
				local jPlayer=FX_AIGetPlayerIndex(iPlayer)
				if (Player_IsAlive(jPlayer)==1) then
					if AreAllied(jPlayer, Universe_CurrentPlayer())==0 then
						FX_AIRelation[iPlayer]=-100
					end
				end
			end
		end
end

--AI给予玩家舰船
function FX_AIRequestShip()
	local iPlayer=FX_AIGetPlayerIndex(FX_AIContactPlayer)
	local lPlayer=Universe_CurrentPlayer()
	local iUnitCap=GetUnitCapData(lPlayer)
	local lUnitCap={}
	for iRace,iData in FX_AIContactData do
		dofilepath("data:/scripts/races/"..iRace.."/scripts/build.lua")
		for iIndex,iShip in build do
			if (iShip.Type == Ship) then
				dofilepath("data:/ship/"..iShip.ThingToBuild.."/"..iShip.ThingToBuild..".ship")
				for iFamily,iValue in NewShipType.UnitCap do
					if (lUnitCap[strupper(iFamily)]==nil) then
						lUnitCap[strupper(iFamily)]=0
					end
					lUnitCap[strupper(iFamily)]=lUnitCap[strupper(iFamily)]+iValue*Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(lPlayer, iShip.ThingToBuild)
				end
			end
		end
	end
	local iShipType=SobGroup_GetShipType("FXAI_SelectedShip")
	local iAmount=FX_AIGetShipValue("FXAI_SelectedShip")
	dofilepath("data:/ship/"..iShipType.."/"..iShipType..".ship")
	local iFlag=1
	for iFamily,iValue in NewShipType.UnitCap do
		if (lUnitCap[strupper(iFamily)]+iValue>iUnitCap[strupper(iFamily)]) then
			iFlag=0
			break
		end
	end
	if (FX_AIRelation[FX_AIContactPlayer]>=ceil(iAmount/100))and(iFlag==1) then
		UI_SetTextLabelText("AIContact","AIDialogue",ACText[74])
		FX_AIRelationChange(ceil(-1.5*iAmount/100))
		FX_AITransferTotal[Universe_CurrentPlayer()+1]=FX_AITransferTotal[Universe_CurrentPlayer()+1]+iAmount
		FX_AITransferTotal[iPlayer+1]=FX_AITransferTotal[iPlayer+1]-iAmount
		FX_ShowAIChoice("RequestReady","RequestCancel")
		SobGroup_SwitchOwner("FXAI_SelectedShip", Universe_CurrentPlayer())
	elseif (iFlag==0) then
		UI_SetTextLabelText("AIContact","AIDialogue",ACText[75])
	else
		UI_SetTextLabelText("AIContact","AIDialogue",ACText[76])
	end
end

function FX_AIShipDeliver()
	MainUI_SelectedShips("FXAI_SelectedShip")
	if (SobGroup_Empty("FXAI_SelectedShip")==0) then
		FX_ShowAIChoice("TransferSelected","ShipCancel")
	else
		FX_ShowAIChoice("ShipCancel")
	end
end

function FX_AIShipDeliverConfirm()
	local lPlayer=Universe_CurrentPlayer()
	local iUnitCap=GetUnitCapData(FX_AIContactPlayerData.Index)
	local lUnitCap={}
	for iRace,iData in FX_AIContactData do
		dofilepath("data:/scripts/races/"..iRace.."/scripts/build.lua")
		for iIndex,iShip in build do
			if (iShip.Type == Ship) then
				dofilepath("data:/ship/"..iShip.ThingToBuild.."/"..iShip.ThingToBuild..".ship")
				for iFamily,iValue in NewShipType.UnitCap do
					if (lUnitCap[strupper(iFamily)]==nil) then
						lUnitCap[strupper(iFamily)]=0
					end
					lUnitCap[strupper(iFamily)]=lUnitCap[strupper(iFamily)]+iValue*Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(FX_AIContactPlayerData.Index, iShip.ThingToBuild)
				end
			end
		end
	end
	SobGroup_Clear("FXAI_SelectedShip")
	SobGroup_Clear("FXAI_SelectedShips")
	SobGroup_Clear("FXAI_TempSelectedShip")
	MainUI_SelectedShips("FXAI_SelectedShip")
	local iShip=0
	local tValue=0
	local jFlag=1
	SobGroup_FillShipsByIndexRange("FXAI_TempSelectedShip", "FXAI_SelectedShip", 0, 1)
	while(SobGroup_Empty("FXAI_TempSelectedShip")==0)do
		local iShipType=SobGroup_GetShipType("FXAI_TempSelectedShip")
		dofilepath("data:/ship/"..iShipType.."/"..iShipType..".ship")
		local iFlag=1
		for iFamily,iValue in NewShipType.UnitCap do
			if (lUnitCap[strupper(iFamily)]+iValue>iUnitCap[strupper(iFamily)]) then
				iFlag=0
				break
			end
		end
		if (iFlag==1) then
			local iAmount=FX_AIGetShipValue("FXAI_TempSelectedShip")
			tValue=tValue+iAmount
			FX_AITransferTotal[Universe_CurrentPlayer()+1]=FX_AITransferTotal[Universe_CurrentPlayer()+1]-iAmount
			FX_AITransferTotal[FX_AIContactPlayerData.Index+1]=FX_AITransferTotal[FX_AIContactPlayerData.Index+1]+iAmount
			SobGroup_SobGroupAdd("FXAI_SelectedShips", "FXAI_TempSelectedShip")
			jFlag=0
			for iFamily,iValue in NewShipType.UnitCap do
				lUnitCap[strupper(iFamily)]=lUnitCap[strupper(iFamily)]+iValue
			end
		end
		SobGroup_Clear("FXAI_TempSelectedShip")
		iShip=iShip+1
		SobGroup_FillShipsByIndexRange("FXAI_TempSelectedShip", "FXAI_SelectedShip", iShip, 1)
	end
	if (jFlag==1) then
		UI_SetTextLabelText("AIContact","AIDialogue",ACText[78])
	else
		UI_SetTextLabelText("AIContact","AIDialogue",ACText[77])
		SobGroup_SwitchOwner("FXAI_SelectedShips", FX_AIContactPlayerData.Index)
		FX_AIRelationChange(floor(1.5*tValue/100))
	end
end

function FX_AIGetShipValue(iGroup)
	return (SobGroup_HealthPercentage(iGroup)^2)*SobGroup_Count(iGroup)*SobGroup_GetStaticF(SobGroup_GetShipType(iGroup), "buildCost")/SobGroup_GetStaticF(SobGroup_GetShipType(iGroup), "buildBatch")
end

function FX_AIShipDeliverCancel()
end

function FX_AICloseContact()
	if (Universe_RulesName()=="FXSINGLEPLAYER") then
		UI_SetElementVisible("AIContact","AIBG",0)
	end
	FX_ShowAIChoice()
	UI_HideScreen("AIContact") 
	Universe_SlowDown(1, 0)
end

function FX_ContactWithPlayer(iPlayer)
	if (FX_AIContactPlayer<=Universe_CurrentPlayer())and(FX_AIContactPlayer~=0) then
		FX_AIContactPlayer=FX_AIContactPlayer-1
	end
	if (Universe_RulesName()=="FXSINGLEPLAYER") then
		if (AreAllied(FX_AIContactPlayer, Universe_CurrentPlayer())==1) or (FXP_PlayerAI[iPlayer].Met==1) then
			UI_SetElementVisible("AIContact","AIBG",0)
		end
	end
	FX_AIContactPlayer=iPlayer
	if (iPlayer<=Universe_CurrentPlayer()) then
		iPlayer=iPlayer-1
	end
	local iRace = Race_GetName(Player_GetRace(iPlayer))
	
	FX_AIContactPlayerData=FX_AIContactData[iRace]
	FX_ShowAIChoice("","OpenContact")

	UI_SetTextLabelText("AIContact","AIDialogue","")
	FX_AIContactPlayerData.Index=iPlayer
	FX_AIContactPlayerData.Race=iRace
end

function FX_ContactAIPlayer(iData)
	if (Universe_RulesName()=="FXSINGLEPLAYER") then
		UI_SetElementVisible("AIContact","AIBG",0)
	end
	if AreAllied(iData.Index, Universe_CurrentPlayer())==1 then
		UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Welcome,FX_AIRelation[FX_AIContactPlayer]))
		FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
	else
		UI_SetTextLabelText("AIContact","AIDialogue",iData.Reject)
		FX_ShowAIChoice("","AskSurrender")
	end
end

function FX_AIDialogueChoose(iTable,iRelation)
	local iChoice=getn(iTable)
	iRelation=min(iRelation,99)
	local iReturn=ceil((iRelation+1)*iChoice/100)
	return iTable[iReturn]
end

function FX_AIGetPlayerIndex(iPlayer)
	local jPlayer=iPlayer
	if (iPlayer<=Universe_CurrentPlayer()) then
		jPlayer=jPlayer-1
	end
	return jPlayer
end

function Player_GetLOD(iPlayer)
	local l_LOD=Player_GetLevelOfDifficulty(iPlayer) 
	if (l_LOD==0) then
		return 0
	elseif (Universe_RulesName()=="FXSINGLEPLAYER") then
		return tonumber(GameEvent_IsListening(6000+iPlayer))
	else
		return l_LOD
	end
end

function FX_ContactUIPopup2()
	if (UI_ScreenIsActive("AIContact")==0) then
		UI_ShowScreen("AIContact", ePopup)
		local Difficulty={ACText[80],ACText[81],ACText[82],ACText[83],}
		--头像更新
		for iPlayer=1,7 do
			if (iPlayer<=Universe_PlayerCount()-1) then
				local jPlayer=FX_AIGetPlayerIndex(iPlayer)
				if (Player_IsAlive(jPlayer)==1) then
					local iRace = Race_GetName(Player_GetRace(jPlayer))
					local g_LOD=Player_GetLOD(jPlayer)
					if (Universe_RulesName()=="FXSINGLEPLAYER") then
						if (AreAllied(jPlayer, Universe_CurrentPlayer())==0)and(FXP_PlayerAI[iPlayer].Met==0) then
							UI_SetTextLabelText("AIContact","AIName"..iPlayer,ACText[95])
							UI_SetElementVisible("AIContact","AI"..iPlayer.."SpeechIcon"..FXP_AIData[FXP_PlayerAI[jPlayer].Actor].Actor,0)
							UI_SetElementVisible("AIContact","AI"..iPlayer.."SpeechIcon37",1)
						else
							UI_SetTextLabelText("AIContact","AIName"..iPlayer,FXP_AIData[FXP_PlayerAI[jPlayer].Actor].Name)
							UI_SetElementVisible("AIContact","AI"..iPlayer.."SpeechIcon37",0)
							UI_SetElementVisible("AIContact","AI"..iPlayer.."SpeechIcon"..FXP_AIData[FXP_PlayerAI[jPlayer].Actor].Actor,1)
						end
					else
						UI_SetTextLabelTextWF1("AIContact","AIName"..iPlayer, "%ls", Player_GetName(jPlayer))
						UI_SetElementVisible("AIContact","AI"..iPlayer.."SpeechIcon"..FX_AIContactData[iRace].Actor,1)
					end
					UI_SetTextLabelText("AIContact","AIRelation"..iPlayer,ACText[79]..FX_AIRelation[iPlayer])
				else
					UI_SetElementVisible("AIContact","AIPlayer"..iPlayer,0)
				end
			else
				UI_SetElementVisible("AIContact","AIPlayer"..iPlayer,0)
			end
		end
		UI_SetTextLabelText("AIContact","AIDialogue","")
		Universe_SlowDown(0, 0)
	elseif FX_AIContact_EnableUIExit then
		FX_AICloseContact()
	end
end

function FX_ShowAIChoice(...)
	for iIndex=1,10  do
		UI_SetElementVisible("AIContact","PlayerChoice_"..iIndex,0)
		UI_SetElementEnabled("AIContact","PlayerChoice_"..iIndex,1)
	end
	if arg[1]==nil then
		FX_AIContact_SetEnableUIExit(1)
	else
		if arg[1]=="" then
			FX_AIContact_SetEnableUIExit(1)
			local i=2
			while arg[i]~=nil do
				arg[i-1]=arg[i]
				i=i+1
			end
			arg[i-1]=nil
		else
			FX_AIContact_SetEnableUIExit(nil)
		end
		local ButtonTable={ONEKEY,TWOKEY,THREEKEY,FOURKEY,FIVEKEY,SIXKEY,SEVENKEY,EIGHTKEY,NINEKEY,ZEROKEY}
		local iIndex=1
		arg.n=nil
		for iIndex,iName in arg do
			UI_SetElementVisible("AIContact","PlayerChoice_"..iIndex,1)
			local iText=FX_AIPlayerChoice[iName].ButtonText(iIndex)
			--iText=mod(iIndex,10).."."..iText
			UI_SetButtonTextHotkey("AIContact","PlayerChoice_"..iIndex,iText,ButtonTable[iIndex])
		end
		FX_CurrentAIChoice=arg
	end
end

function FX_AIContactButtonClicked(iIndex)
	if AIContactButtonClicked~=nil then
		AIContactButtonClicked(FX_CurrentAIChoice[iIndex],FX_AIContactPlayerData)
	end
	FX_AIPlayerChoice[FX_CurrentAIChoice[iIndex]].ButtonClicked(FX_AIContactPlayerData)
end

function FX_AIRUTransfer(iIndex,iAmount)
		local iPlayer=Universe_CurrentPlayer()
		Player_SetRU(iPlayer,Player_GetRU(iPlayer)+iAmount)
		Player_SetRU(iIndex,Player_GetRU(iIndex)-iAmount)
		FX_AIRelationChange(-iAmount/100)
end

function FX_AIRelationChange(iPlayer,iAmount)
	if iAmount==nil then
		iAmount=iPlayer
		iPlayer=FX_AIContactPlayer
	end
	FX_AIRelation[iPlayer]=FX_AIRelation[iPlayer]+iAmount
	UI_SetTextLabelText("AIContact","AIRelation"..iPlayer,ACText[79]..FX_AIRelation[iPlayer])
end

function CPU_GetVarFX(iPlayer,iString)
	CPU_DoString(iPlayer, "FX_AIController="..iString)
	return CPU_GetVar(iPlayer,"FX_AIController")
end