DTM004 = {}
DTM004[1] = function(iGood)
	local iText = "体积："..DTM4_GetColorText(g_TransAmount,"NotLess",Goods[iGood].weight,Goods[iGood].weight).."\n"
	iText = iText.."军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",Goods[iGood].FightLevelNeed,Goods[iGood].FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(g_TradeLevel,"NotLess",Goods[iGood].TradeLevelNeed,Goods[iGood].TradeLevelNeed).."\n"
	iText = iText..Goods[iGood].Description
	return iText
end
DTM004[2] = "消耗（单位/天）：\n"
DTM004[3] = function(iGood)
	local iText = "体积："..Goods[iGood].weight.."\n"..Goods[iGood].Description
	return iText
end
--DTM004[3] = "货舱容量："
DTM004[4] = function(text)
	local iText="你确定要购买这艘“"..text.."”吗？"
	return iText
end
--DTM004[5] = "”吗？"
DTM004[5] = "、"
DTM004[6] = function(text)
	local iText="你确定要将“"..text.."”售出吗？"
	return iText
end
DTM004[7] = function(text)
	local iText="星门 - "..text
	return iText
end
DTM004[8] = "通行费："
DTM004[9] = "未停泊机艇托运费："
DTM004[10] = "您确定要付款并通过该星门吗？"
DTM004[11] = "你的舰船距离过远，无法使用该跳跃门。"
DTM004[12] = "舰队中没有拥有超空间跳跃能力的船，无法进行跳跃。"
DTM004[13] = "使用星门"
DTM004[14] = "通过星际跳跃门前往其他星系"
DTM004[15] = "确定"
DTM004[16] = "取消"
DTM004[17] = "无法使用"
DTM004[18] = "必需货物短缺"
DTM004[19] = "有必需货物储量为0"
DTM004[20] = "贸易信息"
DTM004[21] = "与对方进行贸易"
DTM004[22] = "银河标准历"
DTM004[23] = "您没有靠近该站的船只，无法与对方进行贸易。"
DTM004[24] = "您的舰队和其他空间站过近，无法与对方进行贸易。"
DTM004[25] = "星门收费站"
--DTM004[26] = "装卸速度："
DTM004[27] = "小时"
DTM004[28] = "天"
DTM004[29] = "月"
DTM004[30] = "年"
DTM004[31] = "分钟"
--DTM004[32] = "预计装卸效率："
--DTM004[33] = "体积，"
--DTM004[34] = "/次"
--DTM004[35] = "日常消耗（单位/天）：\n"
--DTM004[36] = "移动消耗（单位/天）：\n"
--DTM004[37] = "攻击消耗（单位/天）：\n"
--DTM004[38] = "维修消耗（单位/天）：\n"
--DTM004[39] = "跳跃消耗（单位/时）：\n"
DTM004[40] = function(warntext,iwarn,iwarn2,l_goodstake)
		local iText = "您的重要物资："..warntext.."发生短缺，"
		local jwarntext = ""
		kwarntext = {"有些舰船不能开火,","有些舰船动弹不得,","有些舰船的维修工作难以为继,","有些舰船无法进入超空间,","有些舰船无法隐形,","有些舰船无法开启防御场,"}
		if (iwarn2==1) then
			jwarntext = jwarntext.."相关产业正因此停产,"
		end
		if (iwarn[1]==1) then
			jwarntext = jwarntext.."舰队正因此每天损失"..l_goodstake.."点资金,"
		end
		for i=2,7 do
			if (iwarn[i]==1) then
				jwarntext = jwarntext..kwarntext[i-1]
			end
		end
		iText=iText..jwarntext.."为避免更多损失，请尽快补充相应货物"
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
	local iText="你遇到一位贩卖"..text1.."的奸商，他提议卖给你"..text2.."单位的"..text1..",但要向你收取"..text3.."点资金。你同意吗？"
	return iText
end
--DTM004[50] = "你遇到一位贩卖"
--DTM004[51] = "的奸商，他提议卖给你"
--DTM004[52] = "单位的"
--DTM004[53] = ",但要向你收取"
--DTM004[54] = "点资金。你同意吗？"
--DTM004[55] = "人口需求："
DTM004[56] = "停止装卸"
--DTM004[57] = "提示：让舰队尽量靠近贸易站，并用一些装卸速度快的机艇（比如舰载机和采矿船）辅助装卸可明显提高装卸效率"
DTM004[58] = "资金不足，不能购入！"
DTM004[59] = "人口不足，不能购入！"
DTM004[60] = "超过数量限制，不能购入！"
DTM004[61] = function(text)
	local iText="你确定要购买这台“"..text.."”吗？"
	return iText
end
DTM004[62] = "货仓空间不足，不能购入！"
DTM004[63] = "这是你的最后一艘船了，不能卖出！"
DTM004[64] = "该船上停泊有其他船只，不能卖出，请清空机库后再试！"
DTM004[65] = "该船上尚有余货，不能卖出，请卖掉一些货物后再试！"
DTM004[66] = "日生产："
DTM004[67] = "日消耗："
DTM004[68] = function(text)
	local iText="当前单位："..text.."%"
	return iText
end
DTM004[69] = function(text)
	local iText="管理至："..text.."单位"
	return iText
end
--DTM004[70] = "单位"
DTM004[71] = function(text)
	local iText="队列中："..text.."单位"
	return iText
end
DTM004[72] = function(text1,text2,text3)
	local iText="当前装卸效率："..text1.."单位/"..text2..text3
	return iText
end
DTM004[73] = function(text1,text2)
	local iText="仍需装卸："..text1.."单位("..text2.."%)"
	return iText
end
DTM004[74] = "装卸中……"
DTM004[75] = "星门已启动，部分靠近星门的战舰会经先行跳跃离开。请将还没有来得及离开的战舰向星门移动，以结束跳跃"
DTM004[76] = "你的舰队勇敢地冲过了这片危险的星区，脱离了重力陷阱区。惊魂未定的你重新组织舰队前往目的地星区，摆脱了捕猎者的追击。"
DTM004[77] = "你的舰队果断掉头逃离了这片危险的星区，脱离了重力陷阱区。惊魂未定的你重新组织舰队返回了来时的星区，摆脱了捕猎者的追击。"
DTM004[78] = "lblResourceUnitsSize_Date"
DTM004[79] = "该船尚在停泊中，不能卖出，请使其脱离机库后再试！"
DTM004[80] = "您的等级不足，无法与对方进行贸易"
DTM004[81] = function(text1,text2)
	local l_color1="FF0000"
	local l_color2="FF0000"
	if(g_FightLevel>=text1)then
		l_color1="00FF00"
	end
	if(g_TradeLevel>=text2)then
		l_color2="00FF00"
	end
	local iText="军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",text1,text1).." 贸易等级："..DTM4_GetColorText(g_FightLevel,"NotLess",text2,text2)
	return iText
end
--DTM004[82] = "贸易等级："
DTM004[83] = "您的等级不足，无法使用该星门。"
DTM004[84] = "您的等级不足，无法购买该种商品。"
DTM004[85] = "您的等级不足，无法购买该型船只。"
DTM004[86] = "您的等级不足，无法购买该种设备。"
DTM004[87] = function(iFactory)
	local iText = ""
	local iText2=DTM4_GetGTData2(iFactory)
	iText = iText.."军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",Factory[iFactory].FightLevelNeed,Factory[iFactory].FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(g_TradeLevel,"NotLess",Factory[iFactory].TradeLevelNeed,Factory[iFactory].TradeLevelNeed).."\n"
	iText = iText.."占用空间："..DTM4_GetColorText(g_factorylimit,"NotLess",Factory[iFactory].VCost+g_factoryweight,Factory[iFactory].VCost).."\n"
	iText = iText.."装卸时间："..Factory[iFactory].TCost.."分钟"
	iText = iText..iText2
	iText = iText..Factory[iFactory].Description
	return iText
end
--DTM004[88] = "装卸时间："
DTM004[89] = "游戏即将开始，请稍候……"
DTM004[90] = function(text)
	local iText="加入"..text.."开始游戏，确定吗？"
	return iText
end
--DTM004[91] = "开始游戏，确定吗？"
--DTM004[92] = "工业空间："
DTM004[93] = "工业空间不足，不能购入！"
DTM004[94] = function(text)
	local iText="贸易站 - "..text
	return iText
end
DTM004[95] = function(text)
	local iText="\n该船将被命名为“"..text.."”，如欲更改，请打开游戏的bin\\profiles\\ShipName.txt文件"
	return iText
end
DTM004[96] = "\n初始船只将被命名为“"
DTM004[97] = "”，如欲更改，请打开游戏的bin\\profiles\\ShipName.txt文件"
DTM004[98] = "\n初始船只目前尚没有名称，请在游戏的bin\\release\\ShipName.txt文件中为其编辑一个名称"
DTM004[99] = "单位货物体积超过舰队装卸能力"
DTM004[100] = function(text1,text2,text3,text4)
	local iText="你确定要将“"..text1.."”"..text2.."从“"..text3.."”改造为“"..text4.."”吗？"
	return iText
end
DTM004[101] = "该船上停泊有其他船只，不能改造，请清空机库后再试！"
DTM004[102] = "改造后没有足够的货舱空间，请卖掉一些货物后再试！"
--DTM004[103] = "”吗？"
DTM004[104] = "您的等级不足，无法进行改造。"
DTM004[105] = "资金不足，不能改造！"
DTM004[106] = "人口不足，不能改造！"
DTM004[107] = "欢迎进入FX:Galaxy - RPG模式.\n在该模式中，你可以从五个种族中选择开局（目前仅希格拉可选）。\n点击地图中的舰船从而选择相应种族开始游戏。"
DTM004[108] = "管理"
DTM004[109] = "出售选中船只或更改其名称、型号"
DTM004[110] = "货物"
DTM004[111] = "打开/关闭货仓界面"
DTM004[112] = "请选择改造型号"
DTM004[113] = "重命名"
DTM004[114] = "卖出"
DTM004[115] = "请选择购买型号"
DTM004[116] = "贸易等级"
DTM004[117] = "军事等级"
DTM004[118] = "人口"
DTM004[119] = "资金"
DTM004[120] = "游戏时间"
DTM004[121] = function(text1,text2)
	local iText="你确定要将“"..text1.."”"..text2.."”售出吗？"
	return iText
end
DTM004[122] = "【注意】购买该船将导致人口超过上限，确认后，在继续购买舰船或离开该地图前，必须卖出或托管足够的舰船使人口恢复到允许范围内。"
DTM004[123] = "当前人口超过限制，不能通过星门！"
DTM004[124] = function(l_ShipData,text)
	local iText = ""
	iText = iText.."单艘售价："..DTM4_GetColorText(g_money,"NotLess",l_ShipData.Price,l_ShipData.Price).."\n"
	iText = iText.."货舱容量："..l_ShipData.cap.."\n"
	iText = iText.."工业空间："..l_ShipData.fcap.."\n"
	iText = iText.."人口需求："..DTM4_GetColorText(g_PopPointLimit,"NotLess",g_PopPointTotal+l_ShipData.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."军事等级："..DTM4_GetColorText(g_FightLevel,"NotLess",l_ShipData.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(g_TradeLevel,"NotLess",l_ShipData.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."装卸能力："..l_ShipData.TransAmount.."\n"
	iText = iText.."装卸速度："..l_ShipData.TransSpeed.."\n"
	iText = iText.."日常消耗（单位/天）：\n"
			for i,j in l_ShipData.GTAnyTime do
				if (j[2]>0) then
					iText = iText..Goods[j[1]].name.."*"..j[2].."    "
				end
			end
			if (l_ShipData.GTWhileMoving[1]~=nil) then
				iText = iText.."\n".."移动消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileMoving do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileFiring[1]~=nil) then
				iText = iText.."\n".."攻击消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileFiring do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileRepairing[1]~=nil) then
				iText = iText.."\n".."维修消耗（单位/天）：\n"
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileHPJump[1]~=nil) then
				iText = iText.."\n".."跳跃消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[2]>0)and(j[1]~=g_GoodIndexForDockUnitHP) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileCloaking[1]~=nil) then
				iText = iText.."\n".."隐形消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileDSOpening[1]~=nil) then
				iText = iText.."\n".."力场消耗（单位/时）：\n"
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
	iText = iText..text
	return iText
end
DTM004[125] = "g_BuyShipName = \"\"\n\-\-使用方法：在引号中填写舰船名称，保存。"
DTM004[126] = function(text)
	local iText="贸易经验+"..text
	return iText
end
DTM004[127] = function(text)
	local iText="战斗经验+"..text
	return iText
end
DTM004[128] = "该船为舰队仅剩载舰，不能托管！"
DTM004[129] = "该船上有停泊中船只，不能托管，请释放全部载机后再试！"
DTM004[130] = "该船上尚有余货，不能托管，请卖掉一些货物后再试！"
DTM004[131] = function(text1,text2,text3,text4)
	local iText="你确定要将“"..text1.."”"..text2.."交给"..text3.."托管吗？托管费用为"..text4.."点资金/日"
	return iText
end
--DTM004[132] = "点资金/日"
DTM004[133] = "该船上尚有余货，不能卖出，请卖掉一些货物后再试！"
DTM004[134] = "托管"
--DTM004[135] = "交给"
--DTM004[136] = "从“"
DTM004[137] = function(text)
	local iText="你为所有托管中的舰船支付了"..text.."点资金。"
	return iText
end
--DTM004[138] = "点资金"
DTM004[139] = function(text)
	local iText="你为部分托管中的舰船支付了"..text.."点资金，其他托管中的舰船将无法得到维护！"
	return iText
end
--DTM004[140] = "点资金，其他托管中的舰船将无法得到维护！"
DTM004[141] = "你已无法为托管中的舰船支付费用，所有舰船均无法得到维护！"
DTM004[142] = function(text1,text2)
	local iText="“"..text1.."”"..text2.."状态完好，无需修理！"
	return iText
end
--DTM004[143] = "状态完好，无需修理！"
DTM004[144] = "资金不足，无法修理！"
DTM004[145] = "人口不足，无法接管！"
DTM004[146] = function(text1,text2)
	local iText="你确定要接管“"..text1.."”"..text2.."吗？"
	return iText
end
--DTM004[147] = "吗？"
DTM004[148] = function(text1,text2,text3)
	local iText="维修“"..text1.."”"..text2.."要花费"..text3.."点资金，确定维修吗？"
	return iText
end
--DTM004[149] = "要花费"
--DTM004[150] = "点资金，确定维修吗？"
--DTM004[151] = "”"
DTM004[152] = function(text1,text2)
	local iText="这是一个货箱，里面有"..text1.."单位的"..text2.."，回收该货箱吗？"
	return iText
end
--DTM004[153] = "单位的"
DTM004[154] = function(text)
	local iText="你拾到了一个货箱，根据上面的ID，你判断该货箱为"..text.."所有，上交该货箱吗？"
	return iText
end
--DTM004[155] = "所有，上交该货箱吗？"
DTM004[156] = function(text1,text2,text3)
	local iText="你将货箱上交给"..text1.."\n作为报答，你获得"..text2.."点资金\n你与"..text1.."的关系提升了。("..text3..")"
	return iText
end
--DTM004[157] = "作为报答，你获得"
--DTM004[158] = "点资金"
--DTM004[159] = "你与"
DTM004[160] = function(text1,text2,text3,text4)
	local iText="你将货箱里的货物据为己有，里面有"..text1.."单位的"..text2.."\n你与"..text3.."的关系下降了。("..text4..")"
	return iText
end
--DTM004[161] = "的关系提升了"
--DTM004[162] = "的关系下降了"
DTM004[163] = function(text1,text2,text3,text4,text5)
	local iText="欢迎光临"..text1.."\n"..text5.."\n预计装卸效率："..text2.."体积/"..text3..text4.."\n【提示】让你的舰队——尤其是其中装卸速度快的舰船——尽量靠近贸易站，可明显提高装卸效率\n祝您采购愉快！"
	return iText
end
--DTM004[164] = "祝您采购愉快！"
--DTM004[165] = "点资金办理托运业务。"
--DTM004[166] = "点资金以进行跳跃。"
DTM004[167] = "资金不足，不能跳跃！"
DTM004[168] = "改造"
DTM004[169] = function(text1,text2)
	local iText="Lv"..text1.." "..text2
	return iText
end
DTM004[170] = function(text)
	local iText="你的确很想帮助"..text.."，只可惜你没有足够的资金。"
	return iText
end
DTM004[171] = function(text1,text2,text3)
	local iText="你确定要资助"..text1.."点资金给"..text2.."的"..text3.."吗？"
	return iText
end
DTM004[172] = function(text1,text2,text3,text4)
	local iText="你已向"..text1.."的"..text2.."资助了"..text3.."点资金。预计偿还时间为：\n"..text4
	return iText
end
DTM004[173] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您的无私资助，我的生意目前已经有所好转，约定好的偿还金额已经打入您的账户，请查收。\n"..text1.."\n"..text2
	return iText
end
DTM004[174] = function(text1,text2,text3,text4)
	local iText=text1.."的"..text2..text3.."最近遇到了财政困难，需要大量资金的帮助来走出困境。"..text3.."承诺，任何为其资助"..text4.."资金的人都可以在1个月内得到双倍的偿还。"
	return iText
end
DTM004[175] = "任务"
DTM004[176] = "可领受任务"
DTM004[177] = "已领受任务"
DTM004[178] = "任务详情"
DTM004[179] = "商人"
DTM004[180] = "企业家"
DTM004[181] = "借钱任务"
DTM004[182] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您的无私资助，然而不幸的是，我的生意仍无好转迹象，我想我不得不申请破产保护了，对于没能信守承诺我表示深深的歉意，我已将您对我的帮助向"..text1.."内部公布并大力宣传，希望对您会有所帮助\n"..text1.."\n"..text2
	return iText
end
DTM004[183] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您的无私资助，然而不幸的是，我的生意仍无好转迹象，如果可能的话我想晚一个月偿还您的资助金，对于没能信守承诺我表示深深的歉意\n"..text1.."\n"..text2
	return iText
end
DTM004[184] = "采购任务"
DTM004[185] = function(text1,text2,text3)
	local iText="你确定要帮助"..text1.."在十天内完成"..text2.."单位"..text3.."的采购任务吗？"
	return iText
end
DTM004[186] = function(text1,text2,text3,text4,text5)
	local iText=text1.."的"..text2.."最近出现短缺，现愿出"..text3.."点资金高价收购"..text4.."单位的"..text2.."。\n采购截止时间："..text5
	return iText
end
DTM004[187] = function(text1,text2,text3,text4,text5)
	local iText="你与"..text1.."签下一批"..text2.."的采购合同，如能在指定日期前将"..text4.."单位的"..text2.."送达，就可获得"..text3.."点资金作为报酬。\n任务截止时间："..text5
	return iText
end
DTM004[188] = function(text)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您答应帮忙，我们已经在附近放置了一个货箱，一旦购得相应货物，只要将它们放到货箱内即可。\n"..text
	return iText
end
DTM004[189] = function(text)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您送来的货物，约定的报酬已经打入您的账户，对您的帮助我们再次表示深深的感谢。\n"..text
	return iText
end
DTM004[190] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n约定的期限已到，然而我们并没有收到您送来的货物，非常遗憾地通知您，我们已经不再需要"..text2.."了，之前的合同就此作废。\n"..text1
	return iText
end
DTM004[191] = "你确定要放弃这个任务吗？"
DTM004[192] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n了解，看来我们要另找他人采购"..text2.."了。\n"..text1
	return iText
end
DTM004[193] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n真不知我该如何感谢您，我已将您对我的帮助向"..text1.."内部公布并大力宣传，希望对您会有所帮助\n"..text1.."\n"..text2
	return iText
end
DTM004[194] = "附近没有载货舰船，无法拾取！"
DTM004[195] = "该货箱对于你的船而言太大了，无法拾取！"
DTM004[196] = function(text1,text2)
	local iText="你确定要将"..text1.."单位的"..text2.."放进这个货箱吗？"
	return iText
end
DTM004[197] = function(text1,text2)
	local iText="你还没有采购到"..text1.."单位的"..text2.."！"
	return iText
end
DTM004[198] = "附近没有载货舰船，无法卸货！"
DTM004[199] = "清仓任务"
DTM004[200] = function(text)
	local iText="你的确很想购买这批"..text.."，但你没有足够的资金。"
	return iText
end
DTM004[201] = function(text1,text2,text3)
	local iText="你确定要以"..text1.."点资金的价格购买"..text2.."的这批"..text3.."吗？"
	return iText
end
DTM004[202] = function(text1,text2,text3)
	local iText="你刚刚从个人终端上收到一则消息：\n我们已经将"..text1.."单位的"..text2.."装箱并放置在了附近，现在这批货是您的了。\n"..text3
	return iText
end
DTM004[203] = function(text1,text2,text3,text4,text5)
	local iText=text1.."的"..text2.."近日出现滞销，现愿以"..text3.."点资金的低价抛售"..text4.."单位的"..text2.."。\n清仓截止时间："..text5
	return iText
end
DTM004[204] = function(text1,text2,text3,text4)
	local iText="你以"..text3.."点资金的低价从"..text1.."买入了"..text4.."单位的"..text2.."。现在这批货就在"..text1.."附近，请及时取走它们。"
	return iText
end
DTM004[205] = function(text)
	local iText="你告诉"..text.."不用还钱了，对方感激不已。"
	return iText
end
DTM004[206] = function(text)
	local iText=text.."已经连本带利还清了你的资助金。"
	return iText
end
DTM004[207] = function(text1,text2)
	local iText=text1.."破产了，但是你对他的帮助已经在"..text2.."内部广为人知。"
	return iText
end
DTM004[208] = function(text)
	local iText="你已通知"..text.."你无法完成采购任务，估计对方不会高兴的。"
	return iText
end
DTM004[209] = function(text)
	local iText="你完成了与"..text.."签订的采购合同，对方似乎很高兴。"
	return iText
end
DTM004[210] = function(text)
	local iText="你与"..text.."关系紧张，对方禁止你的舰队进入该站！"
	return iText
end
DTM004[211] = "关系不足，不能购入！"
DTM004[212] = "修理"
DTM004[213] = function(l_ShipData,text,l_ShipData2,text2)
	local iText = ""
	iText = iText.."单艘售价："..DTM4_GetColorText(l_ShipData.Price,"Less",l_ShipData2.Price,l_ShipData.Price).."\n"
	iText = iText.."货舱容量："..DTM4_GetColorText(l_ShipData2.cap,"Less",l_ShipData.cap,l_ShipData.cap).."\n"
	iText = iText.."工业空间："..DTM4_GetColorText(l_ShipData2.fcap,"Less",l_ShipData.fcap,l_ShipData.fcap).."\n"
	iText = iText.."人口需求："..DTM4_GetColorText(l_ShipData.PopPoint,"Less",l_ShipData2.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."军事等级："..DTM4_GetColorText(l_ShipData.FightLevelNeed,"Less",l_ShipData2.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."贸易等级："..DTM4_GetColorText(l_ShipData.TradeLevelNeed,"Less",l_ShipData2.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."装卸能力："..DTM4_GetColorText(l_ShipData2.TransAmount,"Less",l_ShipData.TransAmount,l_ShipData.TransAmount).."\n"
	iText = iText.."装卸速度："..DTM4_GetColorText(l_ShipData2.TransSpeed,"Less",l_ShipData.TransSpeed,l_ShipData.TransSpeed).."\n"
	iText = iText.."日常消耗（单位/天）：\n"
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
				iText = iText.."移动消耗（单位/天）：\n"
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
				iText = iText.."攻击消耗（单位/天）：\n"
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
				iText = iText.."维修消耗（单位/天）：\n"
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
				iText = iText.."跳跃消耗（单位/时）：\n"
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
				iText = iText.."隐形消耗（单位/时）：\n"
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
				iText = iText.."力场消耗（单位/时）：\n"
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
DTM004[214] = "清除任务"
DTM004[215] = function(iCamp,iEnemyCamp)
	local iText="你确定要帮助"..iCamp.."摧毁"..iEnemyCamp.."的目标吗？"
	return iText
end
DTM004[216] = function(iCamp,iEnemyCamp)
	local iText="感谢你决定帮助我们，"..iEnemyCamp.."的舰队位置已经传输给你，请务必小心。\n"..iCamp
	return iText
end
DTM004[217] = function(iCamp,iEnemyCamp,iReward,iDate)
	local iText=iCamp.."日前获悉一支"..iEnemyCamp.."的舰队已经抵达本星区，正策划制造破坏活动，"..iCamp.."愿出"..iReward.."点资金悬赏消灭这支舰队。\n悬赏截止时间："..iDate
	return iText
end
DTM004[218] = function(iCamp,iEnemyCamp,iReward,iPos)
	local iText="你答应帮助"..iCamp.."清除"..iPos.."的"..iEnemyCamp.."威胁，只要将"..iEnemyCamp.."的舰队摧毁，就可获得"..iReward.."点资金作为报酬。"
	return iText
end
DTM004[219] = function(iCamp)
	local iText="你已通知"..iCamp.."你无法完成清除任务，估计对方不会高兴的。"
	return iText
end
DTM004[220] = function(iEnemyCamp)
	local iText="你如约摧毁了"..iEnemyCamp.."的舰队，并暗自希望对方不会知道是谁干的。"
	return iText
end
DTM004[221] = function(iCamp,iEnemyCamp)
	local iText="你刚刚从个人终端上收到一则消息：\n了解，看来我们要另找他人清除来自"..iEnemyCamp.."的威胁了。\n"..iCamp
	return iText
end
DTM004[222] = function(iCamp,iEnemyCamp)
	local iText="你刚刚从个人终端上收到一则消息：\n约定的期限已到，然而我们并没有看到"..iEnemyCamp.."的目标被摧毁，非常遗憾地通知您，它们已经不再构成威胁了，之前的合同就此作废。\n"..iCamp
	return iText
end
DTM004[223] = function(text)
	local iText="你没能在约定的期限前完成与"..text.."的采购合同，估计对方不会高兴的。"
	return iText
end
DTM004[224] = function(iCamp,iEnemyCamp)
	local iText="你没能在约定的期限前帮助"..iCamp.."摧毁"..iEnemyCamp.."的目标，估计对方不会高兴的。"
	return iText
end
DTM004[225] = function(iCamp,iEnemyCamp)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您帮助我们清除了"..iEnemyCamp.."的威胁，约定的报酬已经打入您的账户，对您的帮助我们再次表示深深的感谢。\n"..iCamp
	return iText
end
DTM004[226] = "规模："
DTM004[227] = function(iDate)
	local iText="应于"..iDate.."前将之摧毁"
	return iText
end
DTM004[228] = "请输入数量！"
DTM004[229] = "（双击抛弃全部）"
DTM004[230] = "（双击卖出全部）"
DTM004[231] = "寻货任务"
DTM004[232] = function(text)
	local iText="你确定要帮助"..text.."寻找遗失的货箱吗？"
	return iText
end
DTM004[233] = "你刚刚从个人终端上收到一则消息：\n感谢你决定帮助我们寻找遗失的货箱，我们已经将货箱可能的坐标发给你了。\n"
DTM004[234] = function(text1,text2,text3)
	local iText="你发现了"..text1.."遗失的货箱，里面有"..text2.."单位的"..text3.."，上交该货箱吗？"
	return iText
end
DTM004[235] = function(text1,text2)
	local iText="你帮助"..text1.."找到了遗失的货箱，你与"..text1.."的关系上升了。("..text2..")"
	return iText
end
DTM004[236] = function(text1,text2)
	local iText="你找到了"..text1.."遗失的货箱并据为己有，你与"..text1.."的关系下降了。("..text2..")"
	return iText
end
DTM004[237] = function(text1)
	local iText="你刚刚从个人终端上收到一则消息：\n我们丢失的那批货已经被别人捷足先登了，我们会尝试索回那批货物，不过那已经不是你该做的事了。因此很遗憾地通知您，我们的合约就此作废。\n"..text1
	return iText
end
DTM004[238] = function(text1,text2)
	local iText=text1.."的一支船队近日在该地区遗失了一个货箱，现愿以"..text2.."点资金作为报酬奖励能在3日内寻得该货箱的人。"
	return iText
end
DTM004[239] = function(text1,text2,iDate)
	local iText="你答应帮助"..text1.."寻找在"..text2.."遗失的货箱。\n任务截止时间："..iDate
	return iText
end
DTM004[240] = function(text)
	local iText="你没能将"..text.."遗失的货箱物归原主。"
	return iText
end
DTM004[241] = function(text)
	local iText="你帮助"..text.."找到了遗失的货箱。"
	return iText
end
DTM004[242] = "送货任务"
DTM004[243] = function(text1,text2,text3,text4)
	local iText="你确定要接受将位于"..text2.."星门的"..text3.."单位"..text4.."在三天内送达"..text1.."的任务吗？"
	return iText
end
DTM004[244] = function(text)
	local iText="你刚刚从个人终端上收到一则消息：\n感谢您答应帮忙，我们已经在附近放置了一个货箱，一旦取得货物，只要将它们放到货箱内即可。\n"..text
	return iText
end
DTM004[245] = function(text1,text2,text3)
	local iText="这是"..text1.."订购的货物，里面有"..text2.."单位的"..text3.."，拾取该货箱吗？"
	return iText
end
DTM004[246] = function(text1,text2,text3)
	local iText="这是"..text1.."订购的货物，里面有"..text2.."单位的"..text3.."，你的货仓目前装不下！"
	return iText
end
DTM004[247] = function(text1,text2)
	local iText="你刚刚从个人终端上收到一则消息：\n约定的期限已到，然而我们并没有收到您送来的货物，非常遗憾地通知您，我们已经不再需要"..text2.."了，之前的合同就此作废。\n"..text1
	return iText
end
DTM004[248] = function(text)
	local iText="你刚刚从个人终端上收到一则消息：\n了解，看来我们要另找他人运送这批货了。\n"..text
	return iText
end
DTM004[249] = function(text1,text2,text3,text4,text5)
	local iText=text1.."采购了一批"..text2.."，现在这批货物在"..text3.."星门附近，"..text1.."愿出点"..text4.."资金作为报酬雇一支船队于3日内将这批货物运来。\n送货截止时间："..text5
	return iText
end
DTM004[250] = function(text1,text2,text3,text4,text5)
	local iText="你与"..text1.."签下一批"..text2.."的运送合同，如能在指定日期前将位于"..text4.."星门的这批货物送达"..text1.."，就可获得"..text3.."点资金作为报酬。\n任务截止时间："..text5
	return iText
end
DTM004[251] = function(text)
	local iText="你没能在约定的期限前完成与"..text.."的货物运送合同，估计对方不会高兴的。"
	return iText
end
DTM004[252] = function(text)
	local iText="你已通知"..text.."你无法完成运货任务，估计对方不会高兴的。"
	return iText
end
DTM004[253] = function(text)
	local iText="你完成了与"..text.."签订的运货合同，对方似乎很高兴。"
	return iText
end
DTM004[254] = "需运送的货物"
DTM004[255] = function(text1,text2,text3)
	local iText=text2.."单位"..text3.."，需送往："..text1
	return iText
end
DTM004[256] = "货物接收点"
DTM004[257] = function(text1,text2)
	local iText="需要："..text1.."单位"..text2
	return iText
end
DTM004[258] = "接受任务"
DTM004[259] = "放弃任务"
DTM004[260] = "关闭"
DTM004[261] = "技能点数（点击分配技能）"
DTM004[262] = "请输入数量！"
DTM004[263] = "（双击抛弃全部）"
DTM004[264] = "为您的舰船命名："