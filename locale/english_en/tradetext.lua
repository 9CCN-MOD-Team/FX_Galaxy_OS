DTM004 = {}
DTM004[1] = function(iGood)
	local iText = "Volume: "..DTM4_GetColorText(g_TransAmount,"NotLess",Goods[iGood].weight,Goods[iGood].weight).."\n"
	iText = iText.."Military Lv.: "..DTM4_GetColorText(g_FightLevel,"NotLess",Goods[iGood].FightLevelNeed,Goods[iGood].FightLevelNeed).."\n"
	iText = iText.."Trade Lv.: "..DTM4_GetColorText(g_TradeLevel,"NotLess",Goods[iGood].TradeLevelNeed,Goods[iGood].TradeLevelNeed).."\n"
	iText = iText..Goods[iGood].Description
	return iText
end
DTM004[2] = "Daily consumption: \n"
DTM004[3] = function(iGood)
	local iText = "Volume: "..Goods[iGood].weight.."\n"..Goods[iGood].Description
	return iText
end
--DTM004[3] = "货舱容量："
DTM004[4] = function(text)
	local iText="Are you sure you want to purchase this \""..text.."\"?"
	return iText
end
--DTM004[5] = "”吗？"
DTM004[5] = ", "
DTM004[6] = function(text)
	local iText="Are you sure you want to sell \""..text.."\"?"
	return iText
end
DTM004[7] = function(text)
	local iText="Stargate - "..text
	return iText
end
DTM004[8] = "Stargate Initiation Fee: "
DTM004[9] = "Undocked Vessels Consignment Fee: "
DTM004[10] = "Are you sure you want to pay and jump through this gate?"
DTM004[11] = "Your fleet is too far away, you cannot use this gate."
DTM004[12] = "You don't have any ship capable of entering hyperspace, you cannot proceed hyperspace jump."
DTM004[13] = "Use Stargate"
DTM004[14] = "Jump to other systems through the gate"
DTM004[15] = "Accept"
DTM004[16] = "Cancel"
DTM004[17] = "Unavailable"
DTM004[18] = "Shortage of essential goods"
DTM004[19] = "Number of essential goods is 0"
DTM004[20] = "Trade information"
DTM004[21] = "Trade with the other side"
DTM004[22] = "Galactic Standard Year"
DTM004[23] = "You can't trade with each other without a vessel near the station."
DTM004[24] = "Ships in your fleet are too close to another space station to trade with this one."
DTM004[25] = "STARGATE TOLLBOOTH"
--DTM004[26] = "装卸速度："
DTM004[27] = "Hour"
DTM004[28] = "Day"
DTM004[29] = "Month"
DTM004[30] = "Year"
DTM004[31] = "Minute"
--DTM004[32] = "预计装卸效率："
--DTM004[33] = "体积，"
--DTM004[34] = "/次"
--DTM004[35] = "日常消耗（单位/天）：\n"
--DTM004[36] = "移动消耗（单位/天）：\n"
--DTM004[37] = "攻击消耗（单位/天）：\n"
--DTM004[38] = "维修消耗（单位/天）：\n"
--DTM004[39] = "跳跃消耗（单位/时）：\n"
DTM004[40] = function(warntext,iwarn,iwarn2,l_goodstake)
		local iText = "There is a shortage in your fleet of the following material: ["..warntext.."]"
		local jwarntext = ""
		kwarntext = {"Some ships cannot attack,","Some ships cannot move,","The upkeep of some ships is unsustainable,","Some ships cannot enter hyperspace,","Some ships cannot cloak,","Some ships cannot activate defense fields,"}
		if (iwarn2==1) then
			jwarntext = jwarntext.."Relevant industries are shutting down as a result,"
		end
		if (iwarn[1]==1) then
			jwarntext = jwarntext.."The fleet is losing "..l_goodstake.." funds every day."
		end
		for i=2,7 do
			if (iwarn[i]==1) then
				jwarntext = jwarntext..kwarntext[i-1]
			end
		end
		iText=iText..jwarntext.."In order to avoid further losses, please replenish the corresponding goods as soon as possible."
		return iText
end
--DTM004[40] = "有些舰船不能开火,"
--DTM004[41] = "有些舰船动弹不得,"
--DTM004[42] = "有些舰船的维修工作难以为继,"
--DTM004[43] = "有些舰船无法进入超空间,"
--DTM004[44] = "相关产业正因此停产,"
--DTM004[45] = "舰队正因此每天损失"
--DTM004[46] = "点资金,"
--DTM004[47] = "您的重要物资："
--DTM004[48] = "发生短缺，"
--DTM004[49] = "为避免更多损失，请尽快补充相应货物"
DTM004[50] = function(text1,text2,text3)
	local iText="You meet a profiteer who sells "..text1.." and he offers to sell you "..text2.." unit of "..text1..", but he want "..text3.." funds in return. Do you agree?"
	return iText
end
--DTM004[50] = "你遇到一位贩卖"
--DTM004[51] = "的奸商，他提议卖给你"
--DTM004[52] = "单位的"
--DTM004[53] = ",但要向你收取"
--DTM004[54] = "点资金。你同意吗？"
--DTM004[55] = "人口需求："
DTM004[56] = "Cancel"
--DTM004[57] = "提示：让舰队尽量靠近贸易站，并用一些装卸速度快的机艇（比如舰载机和采矿船）辅助装卸可明显提高装卸效率"
DTM004[58] = "Insufficient funds, can not purchase!"
DTM004[59] = "Insufficient population, can not purchase!"
DTM004[60] = "Over the limit of quantity, can not purchase!"
DTM004[61] = function(text)
	local iText="Are you sure you want to buy this \""..text.."\"?"
	return iText
end
DTM004[62] = "Insufficient cargo capacity, can not purchase!"
DTM004[63] = "This is your last ship. You can't sell it!"
DTM004[64] = "There are other ships docked in this vessel. Please empty the hangar and try again!"
DTM004[65] = "There is still surplus cargo on board this vessel. Please sell some cargo and try again."
DTM004[66] = "Daily production: "
DTM004[67] = "Daily consumption: "
DTM004[68] = function(text)
	local iText="Current Unit: "..text.."%"
	return iText
end
DTM004[69] = function(text)
	local iText="Manage to: "..text.." Unit"
	return iText
end
--DTM004[70] = "单位"
DTM004[71] = function(text)
	local iText="In the queue: "..text.." Unit"
	return iText
end
DTM004[72] = function(text1,text2,text3)
	local iText="Current stevedoring efficiency: "..text1.." Unit/"..text2..text3
	return iText
end
DTM004[73] = function(text1,text2)
	local iText="still awaiting processing: "..text1.."Units("..text2.."%)"
	return iText
end
DTM004[74] = "Processing..."
DTM004[75] = "Stargate has been activated, ships close to the Stargate will jump out first. Please move your other ships to the Stargate to complete the jump."
DTM004[76] = "Your fleet bravely crossed this dangerous star zone and escaped from the gravity trap. You reorganize your fleet to the destination Star area and get out of the hunter's pursuit."
DTM004[77] = "Your fleet resolutely turned around and fled the dangerous star zone, out of the gravity trap. You reorganize the fleet and return to the Star Zone, free from the hunter's pursuit."
DTM004[78] = "lblResourceUnitsSize_Date"
DTM004[79] = "The ship is still docking and cannot be sold. Please launch it and try again!"
DTM004[80] = "Your level is insufficient to trade"
DTM004[81] = function(text1,text2)
	local l_color1="FF0000"
	local l_color2="FF0000"
	if(g_FightLevel>=text1)then
		l_color1="00FF00"
	end
	if(g_TradeLevel>=text2)then
		l_color2="00FF00"
	end
	local iText="Military Lv.: "..DTM4_GetColorText(g_FightLevel,"NotLess",text1,text1).." Trade Lv.: "..DTM4_GetColorText(g_FightLevel,"NotLess",text2,text2)
	return iText
end
--DTM004[82] = "贸易等级："
DTM004[83] = "Your level is insufficient to use the gate."
DTM004[84] = "Your level is insufficient to buy this product."
DTM004[85] = "Your level is insufficient to buy this type of vessel."
DTM004[86] = "Your level is insufficient to buy this kind of equipment."
DTM004[87] = function(iFactory)
	local iText = ""
	local iText2=DTM4_GetGTData2(iFactory)
	iText = iText.."Military Lv.: "..DTM4_GetColorText(g_FightLevel,"NotLess",Factory[iFactory].FightLevelNeed,Factory[iFactory].FightLevelNeed).."\n"
	iText = iText.."Trade Lv.: "..DTM4_GetColorText(g_TradeLevel,"NotLess",Factory[iFactory].TradeLevelNeed,Factory[iFactory].TradeLevelNeed).."\n"
	iText = iText.."Space Occupation: "..DTM4_GetColorText(g_factorylimit,"NotLess",Factory[iFactory].VCost+g_factoryweight,Factory[iFactory].VCost).."\n"
	iText = iText.."Stevedore Time: "..Factory[iFactory].TCost.." Minutes"
	iText = iText..iText2
	iText = iText..Factory[iFactory].Description
	return iText
end
--DTM004[88] = "装卸时间："
DTM004[89] = "Your adventure among the stars is beginning..."
DTM004[90] = function(text)
	local iText="Join the "..text.." to start the game. Are you sure?"
	return iText
end
--DTM004[91] = "开始游戏，确定吗？"
--DTM004[92] = "工业空间："
DTM004[93] = "Insufficient industrial capacity, can not purchase!"
DTM004[94] = function(text)
	local iText="Trade Station - "..text
	return iText
end
DTM004[95] = function(text)
	local iText="\nThe ship will be named \""..text.."\". If you want to change it, please open bin\\profiles\\ShipName.txt"
	return iText
end
DTM004[96] = "\nInitial vessel will be named\""
DTM004[97] = "\", If you want to change it, please open bin\\profiles\\ShipName.txt"
DTM004[98] = "\nInitial vessel is not yet named, please open bin\\release\\ShipName.txt and give it a name."
DTM004[99] = "Volume of one unit of cargo is bigger than fleet's Stevedoring capacity"
DTM004[100] = function(text1,text2,text3,text4)
	local iText="Are you sure you want to reconstruct \""..text1.."\""..text2.." from \""..text3.."\" to \""..text4.."\"?"
	return iText
end
DTM004[101] = "There are other ships docking on this ship. Please empty the hangar and try again!"
DTM004[102] = "There is not enough cargo space after the reconstruction. Please sell some cargo and try again!"
--DTM004[103] = "”吗？"
DTM004[104] = "Your level is insufficient, cannot reconstruct."
DTM004[105] = "Insufficient funds, can not reconstruct."
DTM004[106] = "Insufficient population, can not reconstruct."
DTM004[107] = "Welcome to the FX: Galaxy RPG mode. \nIn this mode, you can choose the start from five races (currently only Hiigaran is available). Select the race by clicking on the ship to start the game."
DTM004[108] = "MANAGE"
DTM004[109] = "Selling the selected vessel or changing its name and model"
DTM004[110] = "CARGO"
DTM004[111] = "Open/close the cargo interface"
DTM004[112] = "Please select the model to reconstruct."
DTM004[113] = "Rename"
DTM004[114] = "Sell"
DTM004[115] = "Please choose the model you want to purchase."
DTM004[116] = "Trade Lv."
DTM004[117] = "Military Lv."
DTM004[118] = "Population"
DTM004[119] = "Funds"
DTM004[120] = "Game Time"
DTM004[121] = function(text1,text2)
	local iText="Are you sure you want to sell \""..text1.."\""..text2.."?"
	return iText
end
DTM004[122] = "[Attention] Purchasing this vessel will result in your population exceeding the maximum limit. After confirmation, sufficient vessels must be sold or managed to restore the population to the allowed levels before you can purchase more vessels or leave the map."
DTM004[123] = "The current population is over the limit, can not pass through the Stargate!"
DTM004[124] = function(l_ShipData,text)
	local iText = ""
	iText = iText.."Price: "..DTM4_GetColorText(g_money,"NotLess",l_ShipData.Price,l_ShipData.Price).."\n"
	iText = iText.."Cargo: "..l_ShipData.cap.."\n"
	iText = iText.."Industrial Capacity: "..l_ShipData.fcap.."\n"
	iText = iText.."Population Needs: "..DTM4_GetColorText(g_PopPointLimit,"NotLess",g_PopPointTotal+l_ShipData.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."Military Lv.: "..DTM4_GetColorText(g_FightLevel,"NotLess",l_ShipData.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."Trade Lv.: "..DTM4_GetColorText(g_TradeLevel,"NotLess",l_ShipData.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."Stevedoring Capacity: "..l_ShipData.TransAmount.."\n"
	iText = iText.."Stevedoring Speed: "..l_ShipData.TransSpeed.."\n"
	iText = iText.."Daily Consumption: \n"
			for i,j in l_ShipData.GTAnyTime do
				if (j[2]>0) then
					iText = iText..Goods[j[1]].name.."*"..j[2].."    "
				end
			end
			if (l_ShipData.GTWhileMoving[1]~=nil) then
				iText = iText.."\n".."Mobile Consumption: \n"
				for i,j in l_ShipData.GTWhileMoving do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileFiring[1]~=nil) then
				iText = iText.."\n".."Attack Consumption: \n"
				for i,j in l_ShipData.GTWhileFiring do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileRepairing[1]~=nil) then
				iText = iText.."\n".."Repair Consumption: \n"
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileHPJump[1]~=nil) then
				iText = iText.."\n".."HP Jump Consumption (per hour): \n"
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[2]>0)and(j[1]~=g_GoodIndexForDockUnitHP) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileCloaking[1]~=nil) then
				iText = iText.."\n".."Stealth Consumption (per hour): \n"
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileDSOpening[1]~=nil) then
				iText = iText.."\n".."Defense Field Consumption (per hour): \n"
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
	iText = iText..text
	return iText
end
DTM004[125] = "g_BuyShipName = \"\"\n\-\-Usage: Fill in the quotation marks and save."
DTM004[126] = function(text)
	local iText="Trade EXP + "..text
	return iText
end
DTM004[127] = function(text)
	local iText="Military EXP + "..text
	return iText
end
DTM004[128] = "The vessel is the only remaining carrier in the fleet and can not be deposited!"
DTM004[129] = "There are other ships docking on this ship. Please empty the hangar and try again!"
DTM004[130] = "There is still surplus cargo on board and it can't be deposited. Please sell some cargo and try again."
DTM004[131] = function(text1,text2,text3,text4)
	local iText="Are you sure you want "..text3.." to deposit \""..text1.."\""..text2.." for you? The cost is "..text4.." funds per day."
	return iText
end
--DTM004[132] = "点资金/日"
DTM004[133] = "There is still surplus cargo on board, so we can't sell it. Please sell some cargo and try again."
DTM004[134] = "Deposit"
--DTM004[135] = "交给"
--DTM004[136] = "从“"
DTM004[137] = function(text)
	local iText="You paid "..text.." funds for all the ships that are being deposited."
	return iText
end
--DTM004[138] = "点资金"
DTM004[139] = function(text)
	local iText="You have paid "..text.." funds for some of the ships that are being deposited, the others will not be maintained!"
	return iText
end
--DTM004[140] = "点资金，其他托管中的舰船将无法得到维护！"
DTM004[141] = "You can't pay for the ships that are being deposited, all the ships can't be maintained!"
DTM004[142] = function(text1,text2)
	local iText="\""..text1.."\""..text2.." is in good condition, no repair is needed!"
	return iText
end
--DTM004[143] = "状态完好，无需修理！"
DTM004[144] = "Insufficient funds to repair!"
DTM004[145] = "Insufficient population to take over!"
DTM004[146] = function(text1,text2)
	local iText="Are you sure you want to take over \""..text1.."\""..text2.."?"
	return iText
end
--DTM004[147] = "吗？"
DTM004[148] = function(text1,text2,text3)
	local iText="Repair \""..text1.."\""..text2.." will cost "..text3.." funds, are you sure?"
	return iText
end
--DTM004[149] = "要花费"
--DTM004[150] = "点资金，确定维修吗？"
--DTM004[151] = "”"
DTM004[152] = function(text1,text2)
	local iText="This is a container with "..text1.." unit of "..text2..", recycle the container?"
	return iText
end
--DTM004[153] = "单位的"
DTM004[154] = function(text)
	local iText="You picked up a container, according to the ID above, you judged that the container belongs to "..text..", hand it in?"
	return iText
end
--DTM004[155] = "所有，上交该货箱吗？"
DTM004[156] = function(text1,text2,text3)
	local iText="In return for handing over the containers to" ..text1..", you get "..text2.." funds.\nYour relationship with "..text1.." has improved.("..text3..")"
	return iText
end
--DTM004[157] = "作为报答，你获得"
--DTM004[158] = "点资金"
--DTM004[159] = "你与"
DTM004[160] = function(text1,text2,text3,text4)
	local iText="You take possession of the goods in the container, which contains "..text1.." units of "..text2..".\nYour relationship with "..text3.." has declined.("..text4..")"
	return iText
end
--DTM004[161] = "的关系提升了"
--DTM004[162] = "的关系下降了"
DTM004[163] = function(text1,text2,text3,text4)
	local iText="Welcome to "..text1..".\nPredicted Stevedoring Efficiency: "..text2.."Volume/"..text3..text4.."\n[Tips] Let your fleet be as close as possible to the trading station, which can significantly improve the stevedoring efficiency.\nWish you a pleasant purchase!"
	return iText
end
--DTM004[164] = "祝您采购愉快！"
--DTM004[165] = "点资金办理托运业务。"
--DTM004[166] = "点资金以进行跳跃。"
DTM004[167] = "Insufficient funds, can not jump!"
DTM004[168] = "Reconstruct"
DTM004[169] = function(text1,text2)
	local iText="Lv"..text1.." "..text2
	return iText
end
DTM004[170] = function(text)
	local iText="You really want to help "..text..", but unfortunately you don't have enough money."
	return iText
end
DTM004[171] = function(text1,text2,text3)
	local iText="Are you sure you want to imburse "..text1.." funds to "..text3.." from "..text2.."?"
	return iText
end
DTM004[172] = function(text1,text2,text3,text4)
	local iText="You have sponsored "..text3.." funds to "..text2.." from "..text1..". Expected reimbursement date is: \n"..text4
	return iText
end
DTM004[173] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \nThank you for your selfless support. My business has improved. The agreed amount of repayment has been entered into your account. Please check it.\n"..text1.."\n"..text2
	return iText
end
DTM004[174] = function(text1,text2,text3,text4)
	local iText=text2..text3.." from "..text1.." encountered financial difficulties recently, and need a lot of money out of the dilemma. "..text3.." promises that anyone who sponsors the fund can get double repayment within a month."
	return iText
end
DTM004[175] = "Tasks"
DTM004[176] = "Acceptable Tasks"
DTM004[177] = "Accepted Tasks"
DTM004[178] = "Task Details"
DTM004[179] = "Businessman"
DTM004[180] = "Entrepreneur"
DTM004[181] = "Sponsor Task"
DTM004[182] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \nThank you for your selfless support, but unfortunately, my business is still not improving. I think I have to apply for bankruptcy protection. I am deeply sorry for not keeping my promise. I have announced your help to "..text1.." and I hope it will be helpful to you.\n"..text1.."\n"..text2
	return iText
end
DTM004[183] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \nThank you for your selfless support, but unfortunately, my business is still not improving. If possible, I would like to pay you back one month later. I apologize for not keeping my promise.\n"..text1.."\n"..text2
	return iText
end
DTM004[184] = "Procurement task"
DTM004[185] = function(text1,text2,text3)
	local iText="Are you sure you want to help "..text1.." purchase "..text2.." units of "..text3.." in ten days?"
	return iText
end
DTM004[186] = function(text1,text2,text3,text4,text5)
	local iText="There has been a shortage of "..text2.." in "..text1.."recently, We are willing to buy "..text4.." units of "..text2.." at a high price of "..text3.." funds.\nProcurement Deadline: "..text5
	return iText
end
DTM004[187] = function(text1,text2,text3,text4,text5)
	local iText="You've signed a procurement contract of purchasing a batch of "..text2.." with "..text1..". If you can deliver "..text4.." units of "..text2.." before the specified date,  you will get "..text3.." funds as reward.\nTask Deadline: "..text5
	return iText
end
DTM004[188] = function(text)
	local iText="You just received a message from your personal terminal: \nThank you for your help. We have placed a container nearby. Once you buy the corresponding goods, just put them in the container.\n"..text
	return iText
end
DTM004[189] = function(text)
	local iText="You just received a message from your personal terminal: \nThank you for the goods you sent. The agreed payment has entered into your account. Once again, we are deeply grateful for your help.\n"..text
	return iText
end
DTM004[190] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \nThe agreed time limit has expired, but we have not received the goods you sent. We regret to inform you that we no longer need "..text2..", and the previous contract is cancelled.\n"..text1
	return iText
end
DTM004[191] = "Are you sure you want to give up this task?"
DTM004[192] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \nUnderstood, it seems that we need to find someone else to buy "..text2..".\n"..text1
	return iText
end
DTM004[193] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \nI really don't know how to thank you. I have published and publicized your help to "..text1..". I hope it will be helpful to you.\n"..text1.."\n"..text2
	return iText
end
DTM004[194] = "There is no ship nearby, so it can't be picked up!"
DTM004[195] = "The container is too big for your ship to pick up!"
DTM004[196] = function(text1,text2)
	local iText="Are you sure you want to put "..text1.." unit of "..text2.." in this container?"
	return iText
end
DTM004[197] = function(text1,text2)
	local iText="You haven't purchased "..text1.." unit of "..text2.." yet!"
	return iText
end
DTM004[198] = "There is no cargo ship nearby, so it can't be unloaded!"
DTM004[199] = "Store Clearance Task"
DTM004[200] = function(text)
	local iText="You really want to buy this batch of "..text..", but you don't have enough money."
	return iText
end
DTM004[201] = function(text1,text2,text3)
	local iText="Are you sure you want to buy this batch of "..text3.." from "..text2.." at the price of "..text1.." funds?"
	return iText
end
DTM004[202] = function(text1,text2,text3)
	local iText="You just received a message from your personal terminal: \nWe have packed and placed "..text1.." units of "..text2.." nearby. Now this shipment is yours.\n"..text3
	return iText
end
DTM004[203] = function(text1,text2,text3,text4,text5)
	local iText=text2.." have been unsalable in "..text1.." recently，We are willing to sell "..text4.." units of "..text2.." at a low price of "..text3.." funds.\nClearance Deadline: "..text5
	return iText
end
DTM004[204] = function(text1,text2,text3,text4)
	local iText="You bought "..text4.." units of "..text2.." from "..text1.." at a low price of "..text3.." funds. Now the goods are near "..text1..", please take them away in time."
	return iText
end
DTM004[205] = function(text)
	local iText="You tell "..text.." that he(she) don't need to pay back the money, and he(she) is very grateful."
	return iText
end
DTM004[206] = function(text)
	local iText=text.." have paid off your grant with interest."
	return iText
end
DTM004[207] = function(text1,text2)
	local iText=text1.." is bankrupt, but your help to him(her) is already well known within "..text2.."."
	return iText
end
DTM004[208] = function(text)
	local iText="You have notified "..text.." that you can't complete the procurement task, and they will not be happy."
	return iText
end
DTM004[209] = function(text)
	local iText="You have completed the purchase contract with "..text..", and they seems very happy."
	return iText
end
DTM004[210] = function(text)
	local iText="You are in a tense relationship with "..text..", and your fleet is forbidden to enter the station!"
	return iText
end
DTM004[211] = "Insufficient relationship, can not buy!"
DTM004[212] = "Repair"
DTM004[213] = function(l_ShipData,text,l_ShipData2,text2)
	local iText = ""
	iText = iText.."Price: "..DTM4_GetColorText(l_ShipData.Price,"Less",l_ShipData2.Price,l_ShipData.Price).."\n"
	iText = iText.."Cargo: "..DTM4_GetColorText(l_ShipData2.cap,"Less",l_ShipData.cap,l_ShipData.cap).."\n"
	iText = iText.."Industrial Capacity: "..DTM4_GetColorText(l_ShipData2.fcap,"Less",l_ShipData.fcap,l_ShipData.fcap).."\n"
	iText = iText.."Population Needs: "..DTM4_GetColorText(l_ShipData.PopPoint,"Less",l_ShipData2.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."Military Lv.: "..DTM4_GetColorText(l_ShipData.FightLevelNeed,"Less",l_ShipData2.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."Trade Lv.: "..DTM4_GetColorText(l_ShipData.TradeLevelNeed,"Less",l_ShipData2.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."Stevedoring Capacity: "..DTM4_GetColorText(l_ShipData2.TransAmount,"Less",l_ShipData.TransAmount,l_ShipData.TransAmount).."\n"
	iText = iText.."Stevedoring Speed: "..DTM4_GetColorText(l_ShipData2.TransSpeed,"Less",l_ShipData.TransSpeed,l_ShipData.TransSpeed).."\n"
	iText = iText.."Daily Consumption: \n"
			for i,j in l_ShipData.GTAnyTime do
				if (j[2]>0) then
					if(l_ShipData2.GTAnyTime[i]~=nil)then
						iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTAnyTime[i][2],j[2]).."\n"
					else
						iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
					end
				end
			end
			if (l_ShipData.GTWhileMoving[1]~=nil) then
				iText = iText.."Mobile Consumption: \n"
				for i,j in l_ShipData.GTWhileMoving do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileMoving[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileMoving[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileFiring[1]~=nil) then
				iText = iText.."Attack Consumption: \n"
				for i,j in l_ShipData.GTWhileFiring do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileFiring[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileFiring[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileRepairing[1]~=nil) then
				iText = iText.."Repair Consumption: \n"
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileRepairing[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileRepairing[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileHPJump[1]~=nil) then
				iText = iText.."HP Jump Consumption (per hour): \n"
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[2]>0)and(j[1]~=g_GoodIndexForDockUnitHP) then
						if(l_ShipData2.GTWhileHPJump[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileHPJump[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileCloaking[1]~=nil) then
				iText = iText.."Stealth Consumption (per hour): \n"
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileCloaking[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileCloaking[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
			if (l_ShipData.GTWhileDSOpening[1]~=nil) then
				iText = iText.."Defense Field Consumption (per hour): \n"
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[2]>0) then
						if(l_ShipData2.GTWhileDSOpening[i]~=nil)then
							iText = iText..Goods[j[1]].name.."*"..DTM4_GetColorText(j[2],"Less",l_ShipData2.GTWhileDSOpening[i][2],j[2]).."\n"
						else
							iText = iText..Goods[j[1]].name.."*"..j[2].."\n"
						end
					end
				end
			end
	iText = iText..text
	return iText
end
DTM004[214] = "Threat Clearance Task"
DTM004[215] = function(iCamp,iEnemyCamp)
	local iText="Are you sure you want to help "..iCamp.." clear the threat from"..iEnemyCamp.."?"
	return iText
end
DTM004[216] = function(iCamp,iEnemyCamp)
	local iText="Thank you for your decision to help us, "..iEnemyCamp.."'s fleet location has been transmitted to you, please be careful.\n"..iCamp
	return iText
end
DTM004[217] = function(iCamp,iEnemyCamp,iReward,iDate)
	local iText="A few days ago, "..iCamp.." learned about a "..iEnemyCamp.." fleet has arrived in this region, and is planning to create sabotage activities，"..iCamp.." would like to offer "..reward.." funds to destroy the fleet.\nDeadline for Reward: "..iDate
	return iText
end
DTM004[218] = function(iCamp,iEnemyCamp,iReward,iPos)
	local iText="You've promised to help "..iCamp.." clear the threat from "..iEnemyCamp.." at "..iPos..". As long as the fleet of "..iEnemyCamp.." is destroyed, "..iReward.." funds will be paid."
	return iText
end
DTM004[219] = function(iCamp)
	local iText="You have notified "..iCamp.." that you are unable to complete the threat clearance task, and they will not be happy."
	return iText
end
DTM004[220] = function(iEnemyCamp)
	local iText="You destroyed the fleet of "..iEnemyCamp.." as promised, secretly hoped that they won't know who did it."
	return iText
end
DTM004[221] = function(iCamp,iEnemyCamp)
	local iText="You just received a message from your personal terminal: \nUnderstood, it seems that we have to look for someone else to clear the threat from "..iEnemyCamp.."\n"..iCamp
	return iText
end
DTM004[222] = function(iCamp,iEnemyCamp)
	local iText="You've just received a message from your personal terminal: \nThe deadline has expired, but we haven't seen the threat from "..iEnemyCamp.." cleared. I'm sorry to inform you that they no longer pose a threat and our previous contract is cancelled.\n"..iCamp
	return iText
end
DTM004[223] = function(text)
	local iText="You failed to complete the purchase contract with "..text.." before the agreed time limit, and they will not be happy."
	return iText
end
DTM004[224] = function(iCamp,iEnemyCamp)
	local iText="You failed to help "..iCamp.." clear the threat from "..iEnemyCamp..", and they will not be happy."
	return iText
end
DTM004[225] = function(iCamp,iEnemyCamp)
	local iText="You have just received a message from your personal terminal: \nThank you for helping us clear the threat from "..iEnemyCamp..". The agreed payment has entered into your account. Once again, we are deeply grateful for your help.\n"..iCamp
	return iText
end
DTM004[226] = "Scale: "
DTM004[227] = function(iDate)
	local iText="Should be destroyed before "..iDate
	return iText
end
DTM004[228] = "Please enter quantity!"
DTM004[229] = "(Double-click to discard all)"
DTM004[230] = "(Double-click to sell all)"
DTM004[231] = "Cargo Recovery Task"
DTM004[232] = function(text)
	local iText="Are you sure you want to help "..text.." find the missing container?"
	return iText
end
DTM004[233] = "You just received a message from your personal terminal: \nThank you for your decision to help us find the missing container. We have sent you the possible coordinates of the container.\n"
DTM004[234] = function(text1,text2,text3)
	local iText="You have found the missing container of "..text1..", which contains "..text2.." units of "..text3..", hand it in?"
	return iText
end
DTM004[235] = function(text1,text2)
	local iText="You helped "..text1.."' find the missing container, and your relationship with "..text1.." has improved.("..text2..")"
	return iText
end
DTM004[236] = function(text1,text2)
	local iText="You found the missing container of "..text1.." and take it for yourself. Your relationship with "..text1.." has declined.("..text2..")"
	return iText
end
DTM004[237] = function(text1)
	local iText="You've just received a message from your personal terminal: \nThe goods we lost have already been boarded by someone else. We'll try to get them back, but that's not what you should do. We regret to inform you that our contract is cancelled.\n"..text1
	return iText
end
DTM004[238] = function(text1,text2)
	local iText="A fleet of "..text1.." recently lost a container in the area and is now willing to reward "..text2.." funds to those who can find it within three days"
	return iText
end
DTM004[239] = function(text1,text2,iDate)
	local iText="You promised to help "..text1.." find the lost container in "..text2..".\nTask Deadline: "..iDate
	return iText
end
DTM004[240] = function(text)
	local iText="You failed to return the lost container to "..text.."."
	return iText
end
DTM004[241] = function(text)
	local iText="You helped "..text.." find the missing container."
	return iText
end
DTM004[242] = "Cargo Delivery task"
DTM004[243] = function(text1,text2,text3,text4)
	local iText="Are you sure you want to accept the task of delivering "..text3.." units of "..text4.." from Stargate "..text2.." to "..text1.." within three days?"
	return iText
end
DTM004[244] = function(text)
	local iText="You just received a message from your personal terminal: \nThank you for your help. We have placed a container nearby. Once you get the goods, just put them in the container.\n"..text
	return iText
end
DTM004[245] = function(text1,text2,text3)
	local iText="This is the goods ordered by "..text1..", which contains "..text2.." units of "..text3..", pick up the container?"
	return iText
end
DTM004[246] = function(text1,text2,text3)
	local iText="This is the goods ordered by "..text1..", which contains "..text2.." units of "..text3..", your cargo is currently out of stock!"
	return iText
end
DTM004[247] = function(text1,text2)
	local iText="You just received a message from your personal terminal: \nThe agreed time limit has expired, but we have not received the goods you sent. We regret to inform you that we no longer need "..text2..", and our previous contract is cancelled.\n"..text1
	return iText
end
DTM004[248] = function(text)
	local iText="You just received a message from your personal terminal: \nUnderstood, it seems that we have to find someone else to deliver the goods.\n"..text
	return iText
end
DTM004[249] = function(text1,text2,text3,text4,text5)
	local iText=text1.." purchased a batch of "..text2.." and now the goods are near Stargate "..text3..". "..text1.." would like to pay "..text4.." funds as a reward to deliver the goods within three days.\nDelivery deadline: "..text5
	return iText
end
DTM004[250] = function(text1,text2,text3,text4,text5)
	local iText="You have signed a delivery contract with"..text1.." of a batch of "..text2..", you can get "..text3.." funds as a reward if you deliver the goods at Stargate "..text4.." to "..text1.." before the specified date.\nTask Deadline: "..text5
	return iText
end
DTM004[251] = function(text)
	local iText="You failed to complete the delivery contract with "..text.." before the agreed time limit, and thay will not be happy."
	return iText
end
DTM004[252] = function(text)
	local iText="You have notified "..text.." that you can't complete the delivery task, and they will not be happy."
	return iText
end
DTM004[253] = function(text)
	local iText="You have completed the delivery contractwith "..text..", and they seems very happy."
	return iText
end
DTM004[254] = "Goods to be delivered"
DTM004[255] = function(text1,text2,text3)
	local iText=text2.." units of "..text3..", need to be delivered to: "..text1
	return iText
end
DTM004[256] = "Receiving Point of Goods"
DTM004[257] = function(text1,text2)
	local iText="Needs: "..text1.." units of "..text2
	return iText
end
DTM004[258] = "Accept Task"
DTM004[259] = "Give Up Task"
DTM004[260] = "Close"
DTM004[261] = "Skill Point (Click to distribute)"
DTM004[262] = "Please input a number!"
DTM004[263] = "(Double click to throw all you have)"
DTM004[264] = "Name this ship: "