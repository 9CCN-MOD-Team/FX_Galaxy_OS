g_Mission = 0
g_Num = 0
g_position = 50

function DT_L(iMission, iNum)
    g_Mission = iMission
    g_Num = iNum
    Universe_AllowPlayerOrders(0)
    Rule_Add("Rule_L")
    Rule_Add("Rule_Sound")
    local k = 0
    for i = 1, g_Num do
			k = k + textlength[i]
    end
    g_TotalNum = g_Num
    Rule_AddInterval("Rule_Silent", k/10 - 2)
    Rule_Add("Rule_Display")
    UI_SetElementVisible("LocationMenu", g_Mission.."location"..g_Num, 1)
end

function Rule_L()
    if (UI_ScreenIsActive("LocationMenu") == 0) and (UI_ScreenIsActive("NewTaskbar") == 1) and (UI_ScreenIsActive("ResourceMenu") == 1) then
        UI_ShowScreen("LocationMenu", ePopup)
				UI_HideScreen("NewTaskbar")
				UI_HideScreen("ResourceMenu")
				Rule_Remove("Rule_L")
        UI_BindKeyEvent(ESCKEY, "Rule_Esc")
    end
end

function Rule_When()
    UI_UnBindKeyEvent(ESCKEY)
    UI_HideScreen("LocationMenu")
    Universe_AllowPlayerOrders(1)
    Rule_Start()
    Rule_Remove("Rule_When")
    for i = 1, g_TotalNum do
	UI_SetElementVisible("LocationMenu", g_Mission.."location"..i, 0)
    end
end

function Rule_Display()
    if (g_Num > 0) and (g_position < (textlength[g_Num] + 50)) then
			UI_SetElementSize("LocationMenu", g_Mission.."location"..g_Num, 6*(g_position - 50), 13)
			g_position = g_position + 1
			UI_SetElementPosition("LocationMenu","FloatFrame",5*(g_position - 50) + 50,110 + 15*(g_TotalNum - g_Num))
    elseif (g_Num > 0) and (g_position == (textlength[g_Num] + 50))  then
			g_position = 50
			g_Num = g_Num - 1
			if (g_Num ~= 0) then
			    UI_SetElementVisible("LocationMenu", g_Mission.."location"..g_Num, 1)
			    UI_SetElementPosition("LocationMenu","FloatFrame",5*(g_position - 50) + 50,110 + 15*(g_TotalNum - g_Num))
			else
			    Rule_Remove("Rule_Display")
			    Rule_AddInterval("Rule_When", 3)
			end
	  end
end

function Rule_Esc()
    UI_UnBindKeyEvent(ESCKEY)
    Rule_Remove("Rule_Display")
    Rule_Remove("Rule_When")
    Rule_Add("Rule_When")
    Rule_Remove("Rule_Silent")
    Rule_Add("Rule_Silent")
end

function Rule_Silent()
    Rule_Remove("Rule_Sound")
    Rule_Remove("Rule_Silent")
end

function Rule_Sound()
    UI_PlaySound("SFX_ShowText")
end