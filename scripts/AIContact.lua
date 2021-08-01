FX_AIRelation={0,0,0,0,0,0,0}
FX_AITransferTotal={0,0,0,0,0,0,0,0}
FX_AIContactPlayerData={}
FX_CurrentAIChoice={}
FX_CurrentAITask={}
FX_AIShipRequestIndex=0
FX_SobTaskFlag=2^4
FX_SobTaskFlag2=2^5
dofilepath("locale:aicontact.lua")
dofilepath("locale:ai/ailist.lua")
FX_AIContactPlayer=1
FX_AIBGPage=1

FX_AIPlayerChoice=
{
	TaskAquire={
		ButtonText=
		function()
			if FX_CurrentAITask[FX_AIContactPlayer]~=nil then
				return ACText[1]
			else
				return ACText[2]
			end
		end,
		ButtonClicked=
		function(iData)
			if FX_CurrentAITask[FX_AIContactPlayer]~=nil then
				local iKind=FX_CurrentAITask[FX_AIContactPlayer].kind
				if FX_CurrentAITask[FX_AIContactPlayer].accept==1 then
					FX_AITask[iKind].functionReCheck(FX_AIContactPlayer)
				else
					FX_AITask[iKind].functionRequire(FX_AIContactPlayer)
				end
			else
				local iTaskTable={}
				local iFlag=0
				for iKind,iTask in FX_AITask do
					iTaskTable[iKind]=iTask.functionLoad(FX_AIContactPlayer)
					iFlag=iFlag+iTaskTable[iKind]
				end
				if iFlag==0 then
					UI_SetTextLabelText("AIContact","AIDialogue",ACText[3])
				else
					local iNum=getn(iTaskTable)
					local iKind=random(iNum)
					while iTaskTable[iKind]==0 do
						iKind=random(iNum)
					end
					FX_AITask[iKind].functionCreate(FX_AIContactPlayer)
				end
			end
		end,
	},
	TaskAccept={
		ButtonText=function() return ACText[4] end,
		ButtonClicked=
		function(iData)
			FX_AITask[FX_CurrentAITask[FX_AIContactPlayer].kind].functionAccept(FX_AIContactPlayer)
		end,
	},
	TaskRefuse={
		ButtonText=function() return ACText[5] end,
		ButtonClicked=
		function(iData)
			FX_AITask[FX_CurrentAITask[FX_AIContactPlayer].kind].functionRefuse(FX_AIContactPlayer)
		end,
	},
	TaskDoing={
		ButtonText=function() return ACText[6] end,
		ButtonClicked=
		function(iData)
			FX_AITask[FX_CurrentAITask[FX_AIContactPlayer].kind].functionDoing(FX_AIContactPlayer)
		end,
	},
	TaskGiveUp={
		ButtonText=function() return ACText[7] end,
		ButtonClicked=
		function(iData)
			FX_AITask[FX_CurrentAITask[FX_AIContactPlayer].kind].functionGiveUp(FX_AIContactPlayer)
		end,
	},
	RUTransfer={
		ButtonText=function() return ACText[8] end,
		ButtonClicked=
		function(iData)
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RUTransfer,FX_AIRelation[FX_AIContactPlayer]))
				FX_ShowAIChoice("RURequest","RUDeliver","ShipRequest","ShipDeliver","TransferCancel")
		end,
	},
	RURequest={
		ButtonText=function() return ACText[9] end,
		ButtonClicked=
		function(iData)
				local iRU=Player_GetRU(iData.Index)
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RURequest,FX_AIRelation[FX_AIContactPlayer])(iRU))
				FX_ShowAIChoice("RURequest100","RURequest500","RURequest1000","RURequest5000","RURequestCancel")
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount and FX_AIRelation[FX_AIContactPlayer]*100>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RURequest100={
		ButtonText=function() return ACText[10] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,100)
				local iRU=Player_GetRU(iData.Index)
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RURequested,FX_AIRelation[FX_AIContactPlayer])(iRU))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount and FX_AIRelation[FX_AIContactPlayer]*100>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RURequest500={
		ButtonText=function() return ACText[11] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,500)
				local iRU=Player_GetRU(iData.Index)
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RURequested,FX_AIRelation[FX_AIContactPlayer])(iRU))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount and FX_AIRelation[FX_AIContactPlayer]*100>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RURequest1000={
		ButtonText=function() return ACText[12] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,1000)
				local iRU=Player_GetRU(iData.Index)
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RURequested,FX_AIRelation[FX_AIContactPlayer])(iRU))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount and FX_AIRelation[FX_AIContactPlayer]*100>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RURequest5000={
		ButtonText=function() return ACText[13] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,5000)
				local iRU=Player_GetRU(iData.Index)
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RURequested,FX_AIRelation[FX_AIContactPlayer])(iRU))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount and FX_AIRelation[FX_AIContactPlayer]*100>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RURequestCancel={
		ButtonText=function() return ACText[14] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.WhatElse,FX_AIRelation[FX_AIContactPlayer]))
			FX_ShowAIChoice("RURequest","RUDeliver","ShipRequest","ShipDeliver","TransferCancel")
		end,
	},
	RUDeliver={
		ButtonText=function() return ACText[15] end,
		ButtonClicked=
		function(iData)
				local iRU=Player_GetRU(Universe_CurrentPlayer())
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RUDeliver,FX_AIRelation[FX_AIContactPlayer])(Player_GetRU(iData.Index)))
				FX_ShowAIChoice("RUDeliver100","RUDeliver500","RUDeliver1000","RUDeliver5000","RURequestCancel")
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RUDeliver100={
		ButtonText=function() return ACText[16] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,-100)
				local iRU=Player_GetRU(Universe_CurrentPlayer())
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RUDelivered,FX_AIRelation[FX_AIContactPlayer])(Player_GetRU(iData.Index)))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RUDeliver500={
		ButtonText=function() return ACText[17] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,-500)
				local iRU=Player_GetRU(Universe_CurrentPlayer())
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RUDelivered,FX_AIRelation[FX_AIContactPlayer])(Player_GetRU(iData.Index)))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RUDeliver1000={
		ButtonText=function() return ACText[18] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,-1000)
				local iRU=Player_GetRU(Universe_CurrentPlayer())
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RUDelivered,FX_AIRelation[FX_AIContactPlayer])(Player_GetRU(iData.Index)))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RUDeliver5000={
		ButtonText=function() return ACText[19] end,
		ButtonClicked=
		function(iData)
				FX_AIRUTransfer(iData.Index,-5000)
				local iRU=Player_GetRU(Universe_CurrentPlayer())
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.RUDelivered,FX_AIRelation[FX_AIContactPlayer])(Player_GetRU(iData.Index)))
				local iTable={100,500,1000,5000}
				for Index,Amount in iTable do
					if iRU>=Amount then
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,1)
					else
						UI_SetElementEnabled("AIContact","PlayerChoice_"..Index,0)
					end
				end
		end,
	},
	RUDeliverCancel={
		ButtonText=function() return ACText[20] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.WhatElse,FX_AIRelation[FX_AIContactPlayer]))
			FX_ShowAIChoice("RURequest","RUDeliver","ShipRequest","ShipDeliver","TransferCancel")
		end,
	},
	ShipRequest={
		ButtonText=function() return ACText[21] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[22])
			FX_ShowAIChoice("RequestReady","RequestCancel")
		end,
	},
	RequestReady={
		ButtonText=function() return ACText[90] end,
		ButtonClicked=
		function(iData)
			local iShip=0
			SobGroup_Clear("FXAI_SelectedShip")
			SobGroup_FillShipsByIndexRange("FXAI_SelectedShip", "Player_Ships"..iData.Index, 0, 1)
			while(SobGroup_Empty("FXAI_SelectedShip")==0)do
				if (SobGroup_Selected("FXAI_SelectedShip")==1) then
					break
				end
				SobGroup_Clear("FXAI_SelectedShip")
				iShip=iShip+1
				SobGroup_FillShipsByIndexRange("FXAI_SelectedShip", "Player_Ships"..iData.Index, iShip, 1)
			end
			if SobGroup_Empty("FXAI_SelectedShip")==0 then
				DTM4_AskPlayer(FX_AIRequestShip,FX_AIShipDeliverCancel,ACText[89](floor(1.5*FX_AIGetShipValue("FXAI_SelectedShip")/100)))
			else
				UI_SetTextLabelText("AIContact","AIDialogue",ACText[91])
			end
		end,
	},
	RequestCancel={
		ButtonText=function() return ACText[20] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.WhatElse,FX_AIRelation[FX_AIContactPlayer]))
			FX_ShowAIChoice("RURequest","RUDeliver","ShipRequest","ShipDeliver","TransferCancel")
		end,
	},
	ShipDeliver={
		ButtonText=function() return ACText[40] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[41])
			FX_ShowAIChoice("ShipCancel")
			Rule_AddInterval("FX_AIShipDeliver",1)
		end,
	},
	ShipCancel={
		ButtonText=function() return ACText[20] end,
		ButtonClicked=
		function(iData)
			Rule_Remove("FX_AIShipDeliver")
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.WhatElse,FX_AIRelation[FX_AIContactPlayer]))
			FX_ShowAIChoice("RURequest","RUDeliver","ShipRequest","ShipDeliver","TransferCancel")
		end,
	},
	TransferSelected={
		ButtonText=function() return ACText[42] end,
		ButtonClicked=
		function(iData)
			SobGroup_Clear("FXAI_SelectedShip")
			SobGroup_Clear("FXAI_TempSelectedShip")
			MainUI_SelectedShips("FXAI_SelectedShip")
			local iShip=0
			local tValue=0
			SobGroup_FillShipsByIndexRange("FXAI_TempSelectedShip", "FXAI_SelectedShip", 0, 1)
			while(SobGroup_Empty("FXAI_TempSelectedShip")==0)do
			    tValue=tValue+FX_AIGetShipValue("FXAI_TempSelectedShip")
			    SobGroup_Clear("FXAI_TempSelectedShip")
			    iShip=iShip+1
			    SobGroup_FillShipsByIndexRange("FXAI_TempSelectedShip", "FXAI_SelectedShip", iShip, 1)
			end
			DTM4_AskPlayer(FX_AIShipDeliverConfirm,FX_AIShipDeliverCancel,ACText[43](iData.Index,floor(1.5*tValue/100)))
		end,
	},
	TransferCancel={
		ButtonText=function() return ACText[20] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.WhatElse,FX_AIRelation[FX_AIContactPlayer]))
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
	},
	TacticOrder={
		ButtonText=
		function(iIndex) 
			return ACText[44]
		end,
		ButtonClicked=
		function(iData)
			local g_LOD=Player_GetLOD(iData.Index)
			if (FX_AIRelation[FX_AIContactPlayer]<20*g_LOD) then
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.TacticRefuse,FX_AIRelation[FX_AIContactPlayer]))
			else
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Tactic,FX_AIRelation[FX_AIContactPlayer]))
				FX_ShowAIChoice("AttackNow","TacticHarmless","TacticDeffensive","TacticNormal","TacticAggressive","TacticActive","TacticCancel")
				UI_SetElementVisible("AIContact","PlayerChoice_"..(CPU_GetVar(iData.Index,"sg_Delay")+2),0)
			end
		end,
	},
	AttackNow={
		ButtonText=function() return ACText[45] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Attack,FX_AIRelation[FX_AIContactPlayer]))
			CPU_DoString(iData.Index, "Rule_Remove('attack_now_timer')")
			CPU_DoString(iData.Index, "Rule_AddInterval('attack_now_timer', 1 )")
		end,
	},
	TacticHarmless={
		ButtonText=function() return ACText[46] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Harmless,FX_AIRelation[FX_AIContactPlayer]))
			UI_SetElementVisible("AIContact","PlayerChoice_"..(CPU_GetVar(iData.Index,"sg_Delay")+2),1)
			UI_SetElementVisible("AIContact","PlayerChoice_2",0)
			CPU_DoString(iData.Index, "sg_Delay=0")
		end,
	},
	TacticDeffensive={
		ButtonText=function() return ACText[47] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Deffensive,FX_AIRelation[FX_AIContactPlayer]))
			UI_SetElementVisible("AIContact","PlayerChoice_"..(CPU_GetVar(iData.Index,"sg_Delay")+2),1)
			UI_SetElementVisible("AIContact","PlayerChoice_3",0)
			CPU_DoString(iData.Index, "sg_Delay=1")
		end,
	},
	TacticNormal={
		ButtonText=function() return ACText[48] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Normal,FX_AIRelation[FX_AIContactPlayer]))
			UI_SetElementVisible("AIContact","PlayerChoice_"..(CPU_GetVar(iData.Index,"sg_Delay")+2),1)
			UI_SetElementVisible("AIContact","PlayerChoice_4",0)
			CPU_DoString(iData.Index, "sg_Delay=2")
		end,
	},
	TacticAggressive={
		ButtonText=function() return ACText[49] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Aggressive,FX_AIRelation[FX_AIContactPlayer]))
			UI_SetElementVisible("AIContact","PlayerChoice_"..(CPU_GetVar(iData.Index,"sg_Delay")+2),1)
			UI_SetElementVisible("AIContact","PlayerChoice_5",0)
			CPU_DoString(iData.Index, "sg_Delay=3")
		end,
	},
	TacticActive={
		ButtonText=function() return ACText[50] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.Active,FX_AIRelation[FX_AIContactPlayer]))
			UI_SetElementVisible("AIContact","PlayerChoice_"..(CPU_GetVar(iData.Index,"sg_Delay")+2),1)
			UI_SetElementVisible("AIContact","PlayerChoice_6",0)
			CPU_DoString(iData.Index, "sg_Delay=4")
		end,
	},
	TacticCancel={
		ButtonText=function() return ACText[20] end,
		ButtonClicked=
		function(iData)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(iData.WhatElse,FX_AIRelation[FX_AIContactPlayer]))
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
	},
	CloseContact={
		ButtonText=function() return ACText[51] end,
		ButtonClicked=
		function() 
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIDialogueChoose(FX_AIContactPlayerData.GoodBye,FX_AIRelation[FX_AIContactPlayer]))
			FX_ShowAIChoice()
		end,
	},
	AskSurrender={
		ButtonText=function() return ACText[86] end,
		ButtonClicked=
		function(iData) 
			--local numEnemies = CPU_GetVarFX(iData.Index,"PlayersAlive( player_enemy )")
			local numAllies = CPU_GetVarFX(iData.Index,"PlayersAlive( player_ally )")
			local s_selfTotalValue = CPU_GetVarFX(iData.Index,"PlayersMilitary_Total( s_playerIndex, player_total )")
			local s_enemyTotalValue = CPU_GetVarFX(iData.Index,"PlayersMilitary_Total( player_enemy, player_max )")
			if numAllies==1 and s_selfTotalValue<100 and s_enemyTotalValue>2*s_selfTotalValue then
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIContactPlayerData.Surrender)
				FX_ShowAIChoice("AgreeSurrender","DisagreeSurrender")
			else
				UI_SetTextLabelText("AIContact","AIDialogue",FX_AIContactPlayerData.RefuseSurrender)
				FX_ShowAIChoice()
			end
		end,
	},
	AgreeSurrender={
		ButtonText=function() return ACText[87] end,
		ButtonClicked=
		function(iData) 
			Player_Kill(iData.Index)
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIContactPlayerData.SurrenderAgreed)
			FX_ShowAIChoice()
		end,
	},
	DisagreeSurrender={
		ButtonText=function() return ACText[88] end,
		ButtonClicked=
		function(iData) 
			UI_SetTextLabelText("AIContact","AIDialogue",FX_AIContactPlayerData.SurrenderRefused)
			FX_ShowAIChoice()
		end,
	},
	LastPage={
		ButtonText=function() return ACText[92] end,
		ButtonClicked=
		function(iData)
			UI_SetElementEnabled("AIContact","PlayerChoice_2",1)
			UI_SetElementVisible("AIContact",FXP_PlayerAI[FX_AIContactPlayer].Actor.."_IMG_"..FX_AIBGPage,0)
			FX_AIBGPage=FX_AIBGPage-1
			UI_SetElementVisible("AIContact",FXP_PlayerAI[FX_AIContactPlayer].Actor.."_IMG_"..FX_AIBGPage,1)
			if (FX_AIBGPage==1) then
				UI_SetElementEnabled("AIContact","PlayerChoice_1",0)
			end
		end,
	},
	NextPage={
		ButtonText=function() return ACText[93] end,
		ButtonClicked=
		function(iData)
			UI_SetElementEnabled("AIContact","PlayerChoice_1",1)
			UI_SetElementVisible("AIContact",FXP_PlayerAI[FX_AIContactPlayer].Actor.."_IMG_"..FX_AIBGPage,0)
			FX_AIBGPage=FX_AIBGPage+1
			UI_SetElementVisible("AIContact",FXP_PlayerAI[FX_AIContactPlayer].Actor.."_IMG_"..FX_AIBGPage,1)
			if (AI_IMGs[FXP_PlayerAI[iData.Index].Actor][FX_AIBGPage+1]==nil) then
				UI_SetElementEnabled("AIContact","PlayerChoice_2",0)
			end
		end,
	},
	OpenContact={
		ButtonText=function() return ACText[94] end,
		ButtonClicked=
		function(iData)
			FX_ContectAIPlayer(iData)
		end,
	},
}
FX_AITask=
{
	{--侦察任务
		functionLoad=--任务生成条件判断
		function(iPlayer)
			if Universe_GameTime()<60 then
				return 0
			end
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			for jPlayer=0,Universe_PlayerCount()-1 do
				if (jPlayer~=iPlayerIndex)and(jPlayer~=Universe_CurrentPlayer()) then
					if (AreAllied(jPlayer, iPlayerIndex)~=1) then
						SobGroup_Clear("FXAI_SelectedType")
						SobGroup_FilterInclude("FXAI_SelectedType", "Player_Ships"..jPlayer, "displayFamily", "Capital")
						local iShip=0
						while iShip<SobGroup_Count("FXAI_SelectedType") do
							SobGroup_Clear("FX_AI1Target"..iPlayer)
							SobGroup_FillShipsByIndexRange("FX_AI1Target"..iPlayer, "FXAI_SelectedType", iShip, 1)
							if (SobGroup_CountByScriptFlag("FX_AI1Target"..iPlayer, FX_SobTaskFlag)==0)and(SobGroup_CountByScriptFlag("FX_AI1Target"..iPlayer, FX_SobTaskFlag2)==0)and(SobGroup_PlayerIsInSensorRange("FX_AI1Target"..iPlayer, Universe_CurrentPlayer())==0)and(SobGroup_PlayerIsInSensorRange("FX_AI1Target"..iPlayer,iPlayerIndex)==0) then
								SobGroup_SetScriptFlag("FX_AI1Target"..iPlayer, FX_SobTaskFlag+FX_SobTaskFlag2)
								return 3
							end
							iShip=iShip+1
						end
					end
				end
			end
			return 0
		end,
		functionCreate=--任务生成，询问玩家
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[52])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
			FX_CurrentAITask[iPlayer]={kind=1,accept=-1}
		end,
		functionReCheck=--玩家同意后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[52])
			FX_ShowAIChoice("TaskDoing","TaskGiveUp")
		end,
		functionRequire=--玩家拒绝后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[52])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
		end,
		functionRefuse=--玩家拒绝
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[53])
			FX_CurrentAITask[iPlayer]={kind=1,accept=0}
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionDoing=--玩家正在做
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionGiveUp=--玩家放弃
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[55])
			SobGroup_ClearScriptFlag("FX_AI1Target"..iPlayer, FX_SobTaskFlag)
			Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
			Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
			FX_CurrentAITask[iPlayer]=nil
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionRefresh=--拒绝后刷新
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			if (SobGroup_PlayerIsInSensorRange("FX_AI1Target"..iPlayer, Universe_CurrentPlayer())==1)or(SobGroup_PlayerIsInSensorRange("FX_AI1Target"..iPlayer, iPlayerIndex)==1) then
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
		functionAccept=--玩家同意
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_CurrentAITask[iPlayer]={kind=1,accept=1}
			dofilepath("data:/ship/"..SobGroup_GetShipType("FX_AI1Target"..iPlayer).."/"..SobGroup_GetShipType("FX_AI1Target"..iPlayer)..".ship")
			FX_CurrentAITask[iPlayer].Ping=Ping_AddSobGroup(ACText[56]..iPlayerIndex..ACText[57], "anomaly", "FX_AI1Target"..iPlayer)
			Ping_AddDescription(FX_CurrentAITask[iPlayer].Ping, 0, NewShipType.displayedName)
			FX_CurrentAITask[iPlayer].Obj=Objective_Add(ACText[56]..iPlayerIndex..ACText[57], OT_Secondary)
			Objective_AddDescription(FX_CurrentAITask[iPlayer].Obj, NewShipType.displayedName)
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionUpdate=--同意后刷新
		function(iPlayer)
			if (SobGroup_PlayerIsInSensorRange("FX_AI1Target"..iPlayer, Universe_CurrentPlayer())==1) then
				SobGroup_ClearScriptFlag("FX_AI1Target"..iPlayer, FX_SobTaskFlag)
				Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Complete)
				FX_AIRelationChange(iPlayer,3)
				Subtitle_Message(ACText[58], 3)
				FX_CurrentAITask[iPlayer]=nil
			elseif (SobGroup_Empty("FX_AI1Target"..iPlayer)==1) then
				--Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
				Subtitle_Message(ACText[85], 3)
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
	},
	{--2.摧毁任务
		functionLoad=--任务生成条件判断
		function(iPlayer)
			if Universe_GameTime()<600 then
				return 0
			end
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			for jPlayer=0,Universe_PlayerCount()-1 do
				if (jPlayer~=iPlayerIndex)and(jPlayer~=Universe_CurrentPlayer()) then
					if (AreAllied(jPlayer, iPlayerIndex)~=1) then
						SobGroup_Clear("FXAI_SelectedType")
						SobGroup_FilterInclude("FXAI_SelectedType", "Player_Ships"..jPlayer, "displayFamily", "Capital")
						local iShip=0
						while iShip<SobGroup_Count("FXAI_SelectedType") do
							SobGroup_FillShipsByIndexRange("FX_AI2Target"..iPlayer, "FXAI_SelectedType", iShip, 1)
							if (SobGroup_CountByScriptFlag("FX_AI2Target"..iPlayer, FX_SobTaskFlag)==0)and((SobGroup_PlayerIsInSensorRange("FX_AI2Target"..iPlayer, Universe_CurrentPlayer())==1)or(SobGroup_PlayerIsInSensorRange("FX_AI2Target"..iPlayer,iPlayerIndex)==1)) then
								SobGroup_SetScriptFlag("FX_AI2Target"..iPlayer, FX_SobTaskFlag)
								return floor(FX_AIGetShipValue("FX_AI2Target"..iPlayer)/10)
							end
							iShip=iShip+1
						end
					end
				end
			end
			return 0
		end,
		functionCreate=--任务生成，询问玩家
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[59])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
			FX_CurrentAITask[iPlayer]={kind=2,accept=-1}
		end,
		functionReCheck=--玩家同意后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[59])
			FX_ShowAIChoice("TaskDoing","TaskGiveUp")
		end,
		functionRequire=--玩家拒绝后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[59])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
		end,
		functionRefuse=--玩家拒绝
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[53])
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
			FX_CurrentAITask[iPlayer]={kind=2,accept=0}
		end,
		functionDoing=--玩家正在做
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionGiveUp=--玩家放弃
		function(iPlayer)
			SobGroup_ClearScriptFlag("FX_AI2Target"..iPlayer, FX_SobTaskFlag)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[55])
			Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
			Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
			FX_CurrentAITask[iPlayer]=nil
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionRefresh=--拒绝后刷新
		function(iPlayer)
			if (SobGroup_Empty("FX_AI2Target"..iPlayer)==1) then
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
		functionAccept=--玩家同意
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			dofilepath("data:/ship/"..SobGroup_GetShipType("FX_AI2Target"..iPlayer).."/"..SobGroup_GetShipType("FX_AI2Target"..iPlayer)..".ship")
			FX_CurrentAITask[iPlayer].Ping=Ping_AddSobGroup(ACText[56]..iPlayerIndex..ACText[60], "anomaly", "FX_AI2Target"..iPlayer)
			Ping_AddDescription(FX_CurrentAITask[iPlayer].Ping, 0, NewShipType.displayedName)
			FX_CurrentAITask[iPlayer].Obj=Objective_Add(ACText[56]..iPlayerIndex..ACText[60], OT_Secondary)
			Objective_AddDescription(FX_CurrentAITask[iPlayer].Obj, NewShipType.displayedName)
			FX_CurrentAITask[iPlayer]={kind=2,accept=1,reward=floor(FX_AIGetShipValue("FX_AI2Target"..iPlayer)/10)}
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionUpdate=--同意后刷新
		function(iPlayer)
			if (SobGroup_Empty("FX_AI2Target"..iPlayer)==1) then
				--Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Complete)
				FX_AIRelationChange(iPlayer,FX_CurrentAITask[iPlayer].reward)
				Subtitle_Message(ACText[61], 3)
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
	},
	{--3.夺取任务
		functionLoad=--任务生成条件判断
		function(iPlayer)
			if Universe_GameTime()<600 then
				return 0
			end
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			for jPlayer=0,Universe_PlayerCount()-1 do
				if (jPlayer~=iPlayerIndex)and(jPlayer~=Universe_CurrentPlayer()) then
					if (AreAllied(jPlayer, iPlayerIndex)~=1) then
						SobGroup_Clear("FXAI_SelectedType")
						SobGroup_FilterInclude("FXAI_SelectedType", "Player_Ships"..jPlayer, "displayFamily", "Capital")
						local iShip=0
						while iShip<SobGroup_Count("FXAI_SelectedType") do
							SobGroup_FillShipsByIndexRange("FX_AI3Target"..iPlayer, "FXAI_SelectedType", iShip, 1)
							if (SobGroup_CountByScriptFlag("FX_AI3Target"..iPlayer, FX_SobTaskFlag)==0)and((SobGroup_PlayerIsInSensorRange("FX_AI3Target"..iPlayer, Universe_CurrentPlayer())==1)or(SobGroup_PlayerIsInSensorRange("FX_AI3Target"..iPlayer,iPlayerIndex)==1)) then
								SobGroup_SetScriptFlag("FX_AI3Target"..iPlayer, FX_SobTaskFlag)
								SobGroup_SetSwitchOwnerFlag("FX_AI3Target"..iPlayer, 0)
								return floor(FX_AIGetShipValue("FX_AI3Target"..iPlayer)/5)
							end
							iShip=iShip+1
						end
					end
				end
			end
			return 0
		end,
		functionCreate=--任务生成，询问玩家
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[62])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
			FX_CurrentAITask[iPlayer]={kind=3,accept=-1}
		end,
		functionReCheck=--玩家同意后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[62])
			FX_ShowAIChoice("TaskDoing","TaskGiveUp")
		end,
		functionRequire=--玩家拒绝后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[62])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
		end,
		functionRefuse=--玩家拒绝
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[53])
			FX_CurrentAITask[iPlayer]={kind=3,accept=0}
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionDoing=--玩家正在做
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionGiveUp=--玩家放弃
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[55])
			Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
			SobGroup_SetScriptFlag("FX_AI3Target"..iPlayer, FX_SobTaskFlag)
			Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
			FX_CurrentAITask[iPlayer]=nil
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionRefresh=--拒绝后刷新
		function(iPlayer)
			if (SobGroup_Empty("FX_AI3Target"..iPlayer)==1) then
				SobGroup_SetSwitchOwnerFlag("FX_AI3Target"..iPlayer, 1)
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
		functionAccept=--玩家同意
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_CurrentAITask[iPlayer]={kind=3,accept=1}
			dofilepath("data:/ship/"..SobGroup_GetShipType("FX_AI3Target"..iPlayer).."/"..SobGroup_GetShipType("FX_AI3Target"..iPlayer)..".ship")
			FX_CurrentAITask[iPlayer].Ping=Ping_AddSobGroup(ACText[56]..iPlayerIndex..ACText[63], "anomaly", "FX_AI3Target"..iPlayer)
			Ping_AddDescription(FX_CurrentAITask[iPlayer].Ping, 0, NewShipType.displayedName)
			FX_CurrentAITask[iPlayer].Obj=Objective_Add(ACText[56]..iPlayerIndex..ACText[63], OT_Secondary)
			Objective_AddDescription(FX_CurrentAITask[iPlayer].Obj, NewShipType.displayedName)
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionUpdate=--同意后刷新
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			if (SobGroup_OwnedBy("FX_AI3Target"..iPlayer)==Universe_CurrentPlayer()) then
				SobGroup_ClearScriptFlag("FX_AI3Target"..iPlayer, FX_SobTaskFlag)
				SobGroup_SwitchOwner("FX_AI3Target"..iPlayer, iPlayerIndex)
				Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Complete)
				FX_AIRelationChange(iPlayer,floor(FX_AIGetShipValue("FX_AI3Target"..iPlayer)/5))
				Subtitle_Message(ACText[64], 3)
				SobGroup_SetSwitchOwnerFlag("FX_AI3Target"..iPlayer, 1)
				FX_CurrentAITask[iPlayer]=nil
			elseif (SobGroup_Empty("FX_AI3Target"..iPlayer)==1) then
				Subtitle_Message(ACText[65], 3)
				--Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
	},
	{--4.维修任务
		functionLoad=--任务生成条件判断
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			--for jPlayer=0,Universe_PlayerCount()-1 do
				--if (jPlayer~=iPlayerIndex)and(jPlayer~=Universe_CurrentPlayer()) then
					--if (AreAllied(jPlayer, iPlayerIndex)~=1) then
						SobGroup_Clear("FXAI_SelectedType")
						SobGroup_FilterInclude("FXAI_SelectedType", "Player_Ships"..iPlayerIndex, "displayFamily", "Capital")
						local iShip=0
						while iShip<SobGroup_Count("FXAI_SelectedType") do
							SobGroup_FillShipsByIndexRange("FX_AI4Target"..iPlayer, "FXAI_SelectedType", iShip, 1)
							if (SobGroup_HealthPercentage("FX_AI4Target"..iPlayer)<0.5) then
								return floor(FX_AIGetShipValue("FX_AI4Target"..iPlayer)/20)
							end
							iShip=iShip+1
						end
					--end
				--end
			--end
			return 0
		end,
		functionCreate=--任务生成，询问玩家
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[66])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
			FX_CurrentAITask[iPlayer]={kind=4,accept=-1}
		end,
		functionReCheck=--玩家同意后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[66])
			FX_ShowAIChoice("TaskDoing","TaskGiveUp")
		end,
		functionRequire=--玩家拒绝后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[66])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
		end,
		functionRefuse=--玩家拒绝
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[53])
			FX_CurrentAITask[iPlayer]={kind=4,accept=0}
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionDoing=--玩家正在做
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionGiveUp=--玩家放弃
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[55])
			Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
			Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
			FX_CurrentAITask[iPlayer]=nil
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionRefresh=--拒绝后刷新
		function(iPlayer)
			if (SobGroup_HealthPercentage("FX_AI4Target"..iPlayer)>=0.5)or(SobGroup_Empty("FX_AI4Target"..iPlayer)==1) then
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
		functionAccept=--玩家同意
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_CurrentAITask[iPlayer]={kind=4,accept=1}
			dofilepath("data:/ship/"..SobGroup_GetShipType("FX_AI4Target"..iPlayer).."/"..SobGroup_GetShipType("FX_AI4Target"..iPlayer)..".ship")
			FX_CurrentAITask[iPlayer].Ping=Ping_AddSobGroup(ACText[56]..iPlayerIndex..ACText[67], "anomaly", "FX_AI4Target"..iPlayer)
			Ping_AddDescription(FX_CurrentAITask[iPlayer].Ping, 0, NewShipType.displayedName)
			FX_CurrentAITask[iPlayer].Obj=Objective_Add(ACText[56]..iPlayerIndex..ACText[67], OT_Secondary)
			Objective_AddDescription(FX_CurrentAITask[iPlayer].Obj, NewShipType.displayedName)
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionUpdate=--同意后刷新
		function(iPlayer)
			if (SobGroup_HealthPercentage("FX_AI4Target"..iPlayer)==1) then
				Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Complete)
				FX_AIRelationChange(iPlayer,floor(FX_AIGetShipValue("FX_AI4Target"..iPlayer)/20))
				Subtitle_Message(ACText[68], 3)
				FX_CurrentAITask[iPlayer]=nil
			elseif (SobGroup_Empty("FX_AI4Target"..iPlayer)==1) then
				Subtitle_Message(ACText[69], 3)
				--Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
	},
	{--5.保护任务
		functionLoad=--任务生成条件判断
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			--for jPlayer=0,Universe_PlayerCount()-1 do
				--if (jPlayer~=iPlayerIndex)and(jPlayer~=Universe_CurrentPlayer()) then
					--if (AreAllied(jPlayer, iPlayerIndex)~=1) then
						SobGroup_Clear("FXAI_SelectedType")
						SobGroup_FilterInclude("FXAI_SelectedType", "Player_Ships"..iPlayerIndex, "displayFamily", "Capital")
						local iShip=0
						while iShip<SobGroup_Count("FXAI_SelectedType") do
							SobGroup_FillShipsByIndexRange("FX_AI5Target"..iPlayer, "FXAI_SelectedType", iShip, 1)
							SobGroup_Clear("FX_AITargetAttacker"..iPlayer)
							SobGroup_GetAttackers("FX_AI5Target"..iPlayer, "FX_AITargetAttacker"..iPlayer)
							if (SobGroup_Count("FX_AITargetAttacker"..iPlayer)>10)and(SobGroup_HealthPercentage("FX_AI5Target"..iPlayer)<0.8) then
								return floor(FX_AIGetShipValue("FX_AI5Target"..iPlayer)*SobGroup_Count("FX_AITargetAttacker"..iPlayer)/200)
							end
							iShip=iShip+1
						end
					--end
				--end
			--end
			return 0
		end,
		functionCreate=--任务生成，询问玩家
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[70])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
			FX_CurrentAITask[iPlayer]={kind=5,accept=-1}
		end,
		functionReCheck=--玩家同意后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[70])
			FX_ShowAIChoice("TaskDoing","TaskGiveUp")
		end,
		functionRequire=--玩家拒绝后再次联系
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[70])
			FX_ShowAIChoice("TaskAccept","TaskRefuse")
		end,
		functionRefuse=--玩家拒绝
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[53])
			FX_CurrentAITask[iPlayer]={kind=5,accept=-1}
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionDoing=--玩家正在做
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionGiveUp=--玩家放弃
		function(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[55])
			Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
			Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
			FX_CurrentAITask[iPlayer]=nil
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionRefresh=--拒绝后刷新
		function(iPlayer)
			SobGroup_Clear("FX_AITargetAttacker"..iPlayer)
			SobGroup_GetAttackers("FX_AI5Target"..iPlayer, "FX_AITargetAttacker"..iPlayer)
			if (SobGroup_Empty("FX_AI5Target"..iPlayer)==1)or(SobGroup_Count("FX_AITargetAttacker"..iPlayer)<=10) then
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
		functionAccept=--玩家同意
		function(iPlayer)
			local iPlayerIndex=FX_AIGetPlayerIndex(iPlayer)
			UI_SetTextLabelText("AIContact","AIDialogue",ACText[54])
			FX_CurrentAITask[iPlayer]={kind=5,accept=1}
			dofilepath("data:/ship/"..SobGroup_GetShipType("FX_AI5Target"..iPlayer).."/"..SobGroup_GetShipType("FX_AI5Target"..iPlayer)..".ship")
			FX_CurrentAITask[iPlayer].Ping=Ping_AddSobGroup(ACText[56]..iPlayerIndex..ACText[71], "anomaly", "FX_AI5Target"..iPlayer)
			Ping_AddDescription(FX_CurrentAITask[iPlayer].Ping, 0, NewShipType.displayedName)
			FX_CurrentAITask[iPlayer].Obj=Objective_Add(ACText[56]..iPlayerIndex..ACText[71], OT_Secondary)
			Objective_AddDescription(FX_CurrentAITask[iPlayer].Obj, NewShipType.displayedName)
			FX_ShowAIChoice("TaskAquire","RUTransfer","TacticOrder","CloseContact")
		end,
		functionUpdate=--同意后刷新
		function(iPlayer)
			if (SobGroup_Count("FX_AITargetAttacker"..iPlayer)<=10) then
				Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Complete)
				FX_AIRelationChange(iPlayer,floor(FX_AIGetShipValue("FX_AI5Target"..iPlayer)*SobGroup_Count("FX_AITargetAttacker"..iPlayer)/200))
				Subtitle_Message(ACText[72], 3)
				FX_CurrentAITask[iPlayer]=nil
			elseif(SobGroup_Empty("FX_AI5Target"..iPlayer)==1) then
				Subtitle_Message(ACText[73], 3)
				--Ping_Remove(FX_CurrentAITask[iPlayer].Ping)
				Objective_SetState(FX_CurrentAITask[iPlayer].Obj, OS_Failed)
				FX_CurrentAITask[iPlayer]=nil
			end
		end,
	},
}
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

function FX_ContectUIPopup()
end

function FX_AIContactInit()
		MainUI_ScarEvent("UI_SetElementVisible('NewTaskbar', 'btnAIContact', 1)")
		MainUI_ScarEvent("rawset(globals(),'FX_ContectUIPopup',FX_ContectUIPopup2)")
		
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
		UI_SetButtonTextHotkey("AIContact","CloseAIContact",ACText[84],KKEY)
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
		UI_SetElementVisible("AIContact",FXP_PlayerAI[FX_AIGetPlayerIndex(FX_AIContactPlayer)].Actor.."_IMG_"..FX_AIBGPage,0)
		UI_SetElementVisible("AIContact","AIBG",0)
	end
	FX_ShowAIChoice()
	UI_HideScreen("AIContact") 
	Universe_SlowDown(1, 0)
end

function FX_ContectWithPlayer(iPlayer)
	if (FX_AIContactPlayer<=Universe_CurrentPlayer())and(FX_AIContactPlayer~=0) then
		FX_AIContactPlayer=FX_AIContactPlayer-1
	end
	if (Universe_RulesName()=="FXSINGLEPLAYER") then
		if (AreAllied(FX_AIContactPlayer, Universe_CurrentPlayer())==1) or (FXP_PlayerAI[iPlayer].Met==1) then
			UI_SetElementVisible("AIContact",FXP_PlayerAI[FX_AIContactPlayer].Actor.."_IMG_"..FX_AIBGPage,0)
			UI_SetElementVisible("AIContact","AIBG",0)
		end
	end
	FX_AIContactPlayer=iPlayer
	if (iPlayer<=Universe_CurrentPlayer()) then
		iPlayer=iPlayer-1
	end
	local iRace = Race_GetName(Player_GetRace(iPlayer))
	--if (Universe_RulesName()=="FXSINGLEPLAYER") then
	--	if (AreAllied(iPlayer, Universe_CurrentPlayer())==1) or (FXP_PlayerAI[FX_AIContactPlayer].Met==1) then
	--		FX_AIContactPlayerData=FXP_AIData[FXP_PlayerAI[iPlayer].Actor]
	--		FX_ShowAIChoice("","LastPage","NextPage","OpenContact")
	--		UI_SetElementVisible("AIContact",FXP_PlayerAI[iPlayer].Actor.."_IMG_1",1)
	--		UI_SetElementVisible("AIContact","AIBG",1)
	--		FX_AIBGPage=1
	--		UI_SetElementEnabled("AIContact","PlayerChoice_1",0)
	--		if (AI_IMGs[FXP_PlayerAI[iPlayer].Actor][2]==nil) then
	--			UI_SetElementEnabled("AIContact","PlayerChoice_2",0)
	--		end
	--	end
	--else
		FX_AIContactPlayerData=FX_AIContactData[iRace]
		FX_ShowAIChoice("","OpenContact")
	--end
	UI_SetTextLabelText("AIContact","AIDialogue","")
	FX_AIContactPlayerData.Index=iPlayer
	FX_AIContactPlayerData.Race=iRace
end

function FX_ContectAIPlayer(iData)
	if (Universe_RulesName()=="FXSINGLEPLAYER") then
		UI_SetElementVisible("AIContact",FXP_PlayerAI[iData.Index].Actor.."_IMG_"..FX_AIBGPage,0)
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

function FX_ContectUIPopup2()
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
	end
end

function FX_ShowAIChoice(...)
	for iIndex=1,10  do
		UI_SetElementVisible("AIContact","PlayerChoice_"..iIndex,0)
		UI_SetElementEnabled("AIContact","PlayerChoice_"..iIndex,1)
	end
	if arg[1]==nil then
		UI_SetElementVisible("AIContact","CloseAIContact",1)
		UI_SetElementEnabled("AIContact","CloseAIContact",1)
	else
		if arg[1]=="" then
			UI_SetElementVisible("AIContact","CloseAIContact",1)
			UI_SetElementEnabled("AIContact","CloseAIContact",1)
			local i=2
			while arg[i]~=nil do
				arg[i-1]=arg[i]
				i=i+1
			end
			arg[i-1]=nil
		else
			UI_SetElementVisible("AIContact","CloseAIContact",0)
			UI_SetElementEnabled("AIContact","CloseAIContact",0)
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