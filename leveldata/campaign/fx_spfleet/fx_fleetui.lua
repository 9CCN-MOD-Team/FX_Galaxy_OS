
dofilepath("locale:leveldata/campaign/fx_spfleet/ui_header.lua") 

function FXLF_UI_Init()
UI_SetTextLabelText("FXLF_FleetMenu", "m_NCCNFleet", "$100009")

UI_BindKeyEvent(PKEY,"FXLF_MainUI")

Rule_AddInterval("FXLF_MaintainBtnState",0.5)

Rule_AddInterval("FXLF_CheckOwned",0.5)

--现在似乎在读档之后进入游戏时这个FXLF_FleetMenu中本来不该显示的、已有的单位又会冒出来，所以加入下面的代码——by 破天者-孤狼
	for i=1,LF_BuyCount do
		if (buyOwned[i]==1) then
			UI_SetElementVisible("FXLF_FleetMenu","m_btn"..i,0)
		end
	end
--------------------------------------------
end



function FXLF_MainUI()

  if UI_IsScreenActive("FXLF_FleetMenu") == 0 then
    UI_ShowScreen("FXLF_FleetMenu", ePopup)
  else 
     UI_HideScreen("FXLF_FleetMenu")
  end

end
--	UI_SetElementVisible("NewTaskbar","frame_UpperRight",0)
--	UI_SetElementVisible("NewTaskbar","frame_UpperRight_Trade",1)
--	UI_SetElementVisible("ResourceMenu","ResourceBasic",0)
--	UI_SetElementVisible("ResourceMenu","ResourceTrade",1)


function FXLF_MaintainBtnState()

  for i=1,LF_BuyCount do
  --  if btnpressed[i]==1 then
  if UI_IsNamedElementVisible("FXLF_FleetMenu","m_btn"..i)==0 and buyOwned[i]==0  then
  
      WatchBuy(i)
      btnpressed[i]=0 
    end
  end
end




buy_count=0


function FXLF_CheckOwned()
	for i=1,LF_BuyCount do
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0,BuyContent[i]) ==0 then
			buyOwned[i]=0
			UI_SetElementVisible("FXLF_FleetMenu","m_btn"..i,1)
		end
	end
end

function WatchBuy(iNum)

  local RUNow=Player_GetRU(0)
  if RUNow>=BuyCost[iNum] and buyOwned[iNum]==0  then

    buy_count=buy_count+1
    SobGroup_Create("TMP_BUY"..buy_count)
    SobGroup_SpawnNewShipInSobGroup(0, BuyContent[iNum], "BUY"..buy_count, "TMP_BUY"..buy_count, "vol_JUMP")
    Player_SetRU(0,RUNow-BuyCost[iNum])
    Subtitle_Add(22, buyMessage[iNum], 5)
    buyOwned[iNum]=1
    nccnOwned[iNum]=1
    --UI_SetElementVisible("FXLF_FleetMenu","m_btn"..iNum,0)
    local sNum=Get_FX_Achievements_Value("Friend9CCN")
	if (sNum==0) then
		local iFlag=1
		for aIndex,aNum in nccnOwned do
			if aNum==0 then
				iFlag=0
				break
			end
		end
		if (iFlag==1) then
			Set_FX_Achievements_Value("Friend9CCN",1)
		end
	end

  elseif RUNow<BuyCost[iNum] then
    Subtitle_Add(22, noRUMessage[iNum], 5)
    UI_SetElementVisible("FXLF_FleetMenu","m_btn"..iNum,1)

  else
    Subtitle_Add(22, AlreadyOwned, 5)
    UI_SetElementVisible("FXLF_FleetMenu","m_btn"..iNum,1)
  end
    
end



