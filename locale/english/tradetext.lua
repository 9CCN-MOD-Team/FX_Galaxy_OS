DTM004 = {}
DTM004[1] = function(iGood)
	local iText = "�����"..DTM4_GetColorText(g_TransAmount,"NotLess",Goods[iGood].weight,Goods[iGood].weight).."\n"
	iText = iText.."���µȼ���"..DTM4_GetColorText(g_FightLevel,"NotLess",Goods[iGood].FightLevelNeed,Goods[iGood].FightLevelNeed).."\n"
	iText = iText.."ó�׵ȼ���"..DTM4_GetColorText(g_TradeLevel,"NotLess",Goods[iGood].TradeLevelNeed,Goods[iGood].TradeLevelNeed).."\n"
	iText = iText..Goods[iGood].Description
	return iText
end
DTM004[2] = "���ģ���λ/�죩��\n"
DTM004[3] = function(iGood)
	local iText = "�����"..Goods[iGood].weight.."\n"..Goods[iGood].Description
	return iText
end
--DTM004[3] = "����������"
DTM004[4] = function(text)
	local iText="��ȷ��Ҫ�������ҡ�"..text.."����"
	return iText
end
--DTM004[5] = "����"
DTM004[5] = "��"
DTM004[6] = function(text)
	local iText="��ȷ��Ҫ����"..text.."���۳���"
	return iText
end
DTM004[7] = function(text)
	local iText="���� - "..text
	return iText
end
DTM004[8] = "ͨ�зѣ�"
DTM004[9] = "δͣ����ͧ���˷ѣ�"
DTM004[10] = "��ȷ��Ҫ���ͨ����������"
DTM004[11] = "��Ľ��������Զ���޷�ʹ�ø���Ծ�š�"
DTM004[12] = "������û��ӵ�г��ռ���Ծ�����Ĵ����޷�������Ծ��"
DTM004[13] = "ʹ������"
DTM004[14] = "ͨ���Ǽ���Ծ��ǰ��������ϵ"
DTM004[15] = "ȷ��"
DTM004[16] = "ȡ��"
DTM004[17] = "�޷�ʹ��"
DTM004[18] = "��������ȱ"
DTM004[19] = "�б�����ﴢ��Ϊ0"
DTM004[20] = "ó����Ϣ"
DTM004[21] = "��Է�����ó��"
DTM004[22] = "���ӱ�׼��"
DTM004[23] = "��û�п�����վ�Ĵ�ֻ���޷���Է�����ó�ס�"
DTM004[24] = "���Ľ��Ӻ������ռ�վ�������޷���Է�����ó�ס�"
DTM004[25] = "�����շ�վ"
--DTM004[26] = "װж�ٶȣ�"
DTM004[27] = "Сʱ"
DTM004[28] = "��"
DTM004[29] = "��"
DTM004[30] = "��"
DTM004[31] = "����"
--DTM004[32] = "Ԥ��װжЧ�ʣ�"
--DTM004[33] = "�����"
--DTM004[34] = "/��"
--DTM004[35] = "�ճ����ģ���λ/�죩��\n"
--DTM004[36] = "�ƶ����ģ���λ/�죩��\n"
--DTM004[37] = "�������ģ���λ/�죩��\n"
--DTM004[38] = "ά�����ģ���λ/�죩��\n"
--DTM004[39] = "��Ծ���ģ���λ/ʱ����\n"
DTM004[40] = function(warntext,iwarn,iwarn2,l_goodstake)
		local iText = "������Ҫ���ʣ�"..warntext.."������ȱ��"
		local jwarntext = ""
		kwarntext = {"��Щ�������ܿ���,","��Щ������������,","��Щ������ά�޹�������Ϊ��,","��Щ�����޷����볬�ռ�,","��Щ�����޷�����,","��Щ�����޷�����������,"}
		if (iwarn2==1) then
			jwarntext = jwarntext.."��ز�ҵ�����ͣ��,"
		end
		if (iwarn[1]==1) then
			jwarntext = jwarntext.."���������ÿ����ʧ"..l_goodstake.."���ʽ�,"
		end
		for i=2,7 do
			if (iwarn[i]==1) then
				jwarntext = jwarntext..kwarntext[i-1]
			end
		end
		iText=iText..jwarntext.."Ϊ���������ʧ���뾡�첹����Ӧ����"
		return iText
end
--DTM004[40] = "��Щ�������ܿ���,"
--DTM004[41] = "��Щ������������,"
--DTM004[42] = "��Щ������ά�޹�������Ϊ��,"
--DTM004[43] = "��Щ�����޷����볬�ռ�,"
--DTM004[44] = "��ز�ҵ�����ͣ��,"
--DTM004[45] = "���������ÿ����ʧ"
--DTM004[46] = "���ʽ�,"
--DTM004[47] = "������Ҫ���ʣ�"
--DTM004[48] = "������ȱ��"
--DTM004[49] = "Ϊ���������ʧ���뾡�첹����Ӧ����"
DTM004[50] = function(text1,text2,text3)
	local iText="������һλ����"..text1.."�ļ��̣�������������"..text2.."��λ��"..text1..",��Ҫ������ȡ"..text3.."���ʽ���ͬ����"
	return iText
end
--DTM004[50] = "������һλ����"
--DTM004[51] = "�ļ��̣�������������"
--DTM004[52] = "��λ��"
--DTM004[53] = ",��Ҫ������ȡ"
--DTM004[54] = "���ʽ���ͬ����"
--DTM004[55] = "�˿�����"
DTM004[56] = "ֹͣװж"
--DTM004[57] = "��ʾ���ý��Ӿ�������ó��վ������һЩװж�ٶȿ�Ļ�ͧ�����罢�ػ��Ͳɿ󴬣�����װж���������װжЧ��"
DTM004[58] = "�ʽ��㣬���ܹ��룡"
DTM004[59] = "�˿ڲ��㣬���ܹ��룡"
DTM004[60] = "�����������ƣ����ܹ��룡"
DTM004[61] = function(text)
	local iText="��ȷ��Ҫ������̨��"..text.."����"
	return iText
end
DTM004[62] = "���ֿռ䲻�㣬���ܹ��룡"
DTM004[63] = "����������һ�Ҵ��ˣ�����������"
DTM004[64] = "�ô���ͣ����������ֻ����������������ջ�������ԣ�"
DTM004[65] = "�ô����������������������������һЩ��������ԣ�"
DTM004[66] = "��������"
DTM004[67] = "�����ģ�"
DTM004[68] = function(text)
	local iText="��ǰ��λ��"..text.."%"
	return iText
end
DTM004[69] = function(text)
	local iText="��������"..text.."��λ"
	return iText
end
--DTM004[70] = "��λ"
DTM004[71] = function(text)
	local iText="�����У�"..text.."��λ"
	return iText
end
DTM004[72] = function(text1,text2,text3)
	local iText="��ǰװжЧ�ʣ�"..text1.."��λ/"..text2..text3
	return iText
end
DTM004[73] = function(text1,text2)
	local iText="����װж��"..text1.."��λ("..text2.."%)"
	return iText
end
DTM004[74] = "װж�С���"
DTM004[75] = "���������������ֿ������ŵ�ս���ᾭ������Ծ�뿪���뽫��û�����ü��뿪��ս���������ƶ����Խ�����Ծ"
DTM004[76] = "��Ľ����¸ҵس������ƬΣ�յ�����������������������������δ������������֯����ǰ��Ŀ�ĵ������������˲����ߵ�׷����"
DTM004[77] = "��Ľ��ӹ��ϵ�ͷ��������ƬΣ�յ�����������������������������δ������������֯���ӷ�������ʱ�������������˲����ߵ�׷����"
DTM004[78] = "lblResourceUnitsSize_Date"
DTM004[79] = "�ô�����ͣ���У�������������ʹ�������������ԣ�"
DTM004[80] = "���ĵȼ����㣬�޷���Է�����ó��"
DTM004[81] = function(text1,text2)
	local l_color1="FF0000"
	local l_color2="FF0000"
	if(g_FightLevel>=text1)then
		l_color1="00FF00"
	end
	if(g_TradeLevel>=text2)then
		l_color2="00FF00"
	end
	local iText="���µȼ���"..DTM4_GetColorText(g_FightLevel,"NotLess",text1,text1).." ó�׵ȼ���"..DTM4_GetColorText(g_FightLevel,"NotLess",text2,text2)
	return iText
end
--DTM004[82] = "ó�׵ȼ���"
DTM004[83] = "���ĵȼ����㣬�޷�ʹ�ø����š�"
DTM004[84] = "���ĵȼ����㣬�޷����������Ʒ��"
DTM004[85] = "���ĵȼ����㣬�޷�������ʹ�ֻ��"
DTM004[86] = "���ĵȼ����㣬�޷���������豸��"
DTM004[87] = function(iFactory)
	local iText = ""
	local iText2=DTM4_GetGTData2(iFactory)
	iText = iText.."���µȼ���"..DTM4_GetColorText(g_FightLevel,"NotLess",Factory[iFactory].FightLevelNeed,Factory[iFactory].FightLevelNeed).."\n"
	iText = iText.."ó�׵ȼ���"..DTM4_GetColorText(g_TradeLevel,"NotLess",Factory[iFactory].TradeLevelNeed,Factory[iFactory].TradeLevelNeed).."\n"
	iText = iText.."ռ�ÿռ䣺"..DTM4_GetColorText(g_factorylimit,"NotLess",Factory[iFactory].VCost+g_factoryweight,Factory[iFactory].VCost).."\n"
	iText = iText.."װжʱ�䣺"..Factory[iFactory].TCost.."����"
	iText = iText..iText2
	iText = iText..Factory[iFactory].Description
	return iText
end
--DTM004[88] = "װжʱ�䣺"
DTM004[89] = "��Ϸ������ʼ�����Ժ򡭡�"
DTM004[90] = function(text)
	local iText="����"..text.."��ʼ��Ϸ��ȷ����"
	return iText
end
--DTM004[91] = "��ʼ��Ϸ��ȷ����"
--DTM004[92] = "��ҵ�ռ䣺"
DTM004[93] = "��ҵ�ռ䲻�㣬���ܹ��룡"
DTM004[94] = function(text)
	local iText="ó��վ - "..text
	return iText
end
DTM004[95] = function(text)
	local iText="\n�ô���������Ϊ��"..text.."�����������ģ������Ϸ��bin\\profiles\\ShipName.txt�ļ�"
	return iText
end
DTM004[96] = "\n��ʼ��ֻ��������Ϊ��"
DTM004[97] = "�����������ģ������Ϸ��bin\\profiles\\ShipName.txt�ļ�"
DTM004[98] = "\n��ʼ��ֻĿǰ��û�����ƣ�������Ϸ��bin\\release\\ShipName.txt�ļ���Ϊ��༭һ������"
DTM004[99] = "��λ���������������װж����"
DTM004[100] = function(text1,text2,text3,text4)
	local iText="��ȷ��Ҫ����"..text1.."��"..text2.."�ӡ�"..text3.."������Ϊ��"..text4.."����"
	return iText
end
DTM004[101] = "�ô���ͣ����������ֻ�����ܸ��죬����ջ�������ԣ�"
DTM004[102] = "�����û���㹻�Ļ��տռ䣬������һЩ��������ԣ�"
--DTM004[103] = "����"
DTM004[104] = "���ĵȼ����㣬�޷����и��졣"
DTM004[105] = "�ʽ��㣬���ܸ��죡"
DTM004[106] = "�˿ڲ��㣬���ܸ��죡"
DTM004[107] = "��ӭ����FX:Galaxy - RPGģʽ.\n�ڸ�ģʽ�У�����Դ����������ѡ�񿪾֣�Ŀǰ��ϣ������ѡ����\n�����ͼ�еĽ����Ӷ�ѡ����Ӧ���忪ʼ��Ϸ��"
DTM004[108] = "����"
DTM004[109] = "����ѡ�д�ֻ����������ơ��ͺ�"
DTM004[110] = "����"
DTM004[111] = "��/�رջ��ֽ���"
DTM004[112] = "��ѡ������ͺ�"
DTM004[113] = "������"
DTM004[114] = "����"
DTM004[115] = "��ѡ�����ͺ�"
DTM004[116] = "ó�׵ȼ�"
DTM004[117] = "���µȼ�"
DTM004[118] = "�˿�"
DTM004[119] = "�ʽ�"
DTM004[120] = "��Ϸʱ��"
DTM004[121] = function(text1,text2)
	local iText="��ȷ��Ҫ����"..text1.."��"..text2.."���۳���"
	return iText
end
DTM004[122] = "��ע�⡿����ô��������˿ڳ������ޣ�ȷ�Ϻ��ڼ������򽢴����뿪�õ�ͼǰ�������������й��㹻�Ľ���ʹ�˿ڻָ�������Χ�ڡ�"
DTM004[123] = "��ǰ�˿ڳ������ƣ�����ͨ�����ţ�"
DTM004[124] = function(l_ShipData,text)
	local iText = ""
	iText = iText.."�����ۼۣ�"..DTM4_GetColorText(g_money,"NotLess",l_ShipData.Price,l_ShipData.Price).."\n"
	iText = iText.."����������"..l_ShipData.cap.."\n"
	iText = iText.."��ҵ�ռ䣺"..l_ShipData.fcap.."\n"
	iText = iText.."�˿�����"..DTM4_GetColorText(g_PopPointLimit,"NotLess",g_PopPointTotal+l_ShipData.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."���µȼ���"..DTM4_GetColorText(g_FightLevel,"NotLess",l_ShipData.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."ó�׵ȼ���"..DTM4_GetColorText(g_TradeLevel,"NotLess",l_ShipData.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."װж������"..l_ShipData.TransAmount.."\n"
	iText = iText.."װж�ٶȣ�"..l_ShipData.TransSpeed.."\n"
	iText = iText.."�ճ����ģ���λ/�죩��\n"
			for i,j in l_ShipData.GTAnyTime do
				if (j[2]>0) then
					iText = iText..Goods[j[1]].name.."*"..j[2].."    "
				end
			end
			if (l_ShipData.GTWhileMoving[1]~=nil) then
				iText = iText.."\n".."�ƶ����ģ���λ/�죩��\n"
				for i,j in l_ShipData.GTWhileMoving do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileFiring[1]~=nil) then
				iText = iText.."\n".."�������ģ���λ/�죩��\n"
				for i,j in l_ShipData.GTWhileFiring do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileRepairing[1]~=nil) then
				iText = iText.."\n".."ά�����ģ���λ/�죩��\n"
				for i,j in l_ShipData.GTWhileRepairing do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileHPJump[1]~=nil) then
				iText = iText.."\n".."��Ծ���ģ���λ/ʱ����\n"
				for i,j in l_ShipData.GTWhileHPJump do
					if (j[2]>0)and(j[1]~=g_GoodIndexForDockUnitHP) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileCloaking[1]~=nil) then
				iText = iText.."\n".."�������ģ���λ/ʱ����\n"
				for i,j in l_ShipData.GTWhileCloaking do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
			if (l_ShipData.GTWhileDSOpening[1]~=nil) then
				iText = iText.."\n".."�������ģ���λ/ʱ����\n"
				for i,j in l_ShipData.GTWhileDSOpening do
					if (j[2]>0) then
						iText = iText..Goods[j[1]].name.."*"..j[2].."    "
					end
				end
			end
	iText = iText..text
	return iText
end
DTM004[125] = "g_BuyShipName = \"\"\n\-\-ʹ�÷���������������д�������ƣ����档"
DTM004[126] = function(text)
	local iText="ó�׾���+"..text
	return iText
end
DTM004[127] = function(text)
	local iText="ս������+"..text
	return iText
end
DTM004[128] = "�ô�Ϊ���ӽ�ʣ�ؽ��������йܣ�"
DTM004[129] = "�ô�����ͣ���д�ֻ�������йܣ����ͷ�ȫ���ػ������ԣ�"
DTM004[130] = "�ô�����������������йܣ�������һЩ��������ԣ�"
DTM004[131] = function(text1,text2,text3,text4)
	local iText="��ȷ��Ҫ����"..text1.."��"..text2.."����"..text3.."�й����йܷ���Ϊ"..text4.."���ʽ�/��"
	return iText
end
--DTM004[132] = "���ʽ�/��"
DTM004[133] = "�ô����������������������������һЩ��������ԣ�"
DTM004[134] = "�й�"
--DTM004[135] = "����"
--DTM004[136] = "�ӡ�"
DTM004[137] = function(text)
	local iText="��Ϊ�����й��еĽ���֧����"..text.."���ʽ�"
	return iText
end
--DTM004[138] = "���ʽ�"
DTM004[139] = function(text)
	local iText="��Ϊ�����й��еĽ���֧����"..text.."���ʽ������й��еĽ������޷��õ�ά����"
	return iText
end
--DTM004[140] = "���ʽ������й��еĽ������޷��õ�ά����"
DTM004[141] = "�����޷�Ϊ�й��еĽ���֧�����ã����н������޷��õ�ά����"
DTM004[142] = function(text1,text2)
	local iText="��"..text1.."��"..text2.."״̬��ã���������"
	return iText
end
--DTM004[143] = "״̬��ã���������"
DTM004[144] = "�ʽ��㣬�޷�����"
DTM004[145] = "�˿ڲ��㣬�޷��ӹܣ�"
DTM004[146] = function(text1,text2)
	local iText="��ȷ��Ҫ�ӹܡ�"..text1.."��"..text2.."��"
	return iText
end
--DTM004[147] = "��"
DTM004[148] = function(text1,text2,text3)
	local iText="ά�ޡ�"..text1.."��"..text2.."Ҫ����"..text3.."���ʽ�ȷ��ά����"
	return iText
end
--DTM004[149] = "Ҫ����"
--DTM004[150] = "���ʽ�ȷ��ά����"
--DTM004[151] = "��"
DTM004[152] = function(text1,text2)
	local iText="����һ�����䣬������"..text1.."��λ��"..text2.."�����ոû�����"
	return iText
end
--DTM004[153] = "��λ��"
DTM004[154] = function(text)
	local iText="��ʰ����һ�����䣬���������ID�����жϸû���Ϊ"..text.."���У��Ͻ��û�����"
	return iText
end
--DTM004[155] = "���У��Ͻ��û�����"
DTM004[156] = function(text1,text2,text3)
	local iText="�㽫�����Ͻ���"..text1.."\n��Ϊ��������"..text2.."���ʽ�\n����"..text1.."�Ĺ�ϵ�����ˡ�("..text3..")"
	return iText
end
--DTM004[157] = "��Ϊ��������"
--DTM004[158] = "���ʽ�"
--DTM004[159] = "����"
DTM004[160] = function(text1,text2,text3,text4)
	local iText="�㽫������Ļ����Ϊ���У�������"..text1.."��λ��"..text2.."\n����"..text3.."�Ĺ�ϵ�½��ˡ�("..text4..")"
	return iText
end
--DTM004[161] = "�Ĺ�ϵ������"
--DTM004[162] = "�Ĺ�ϵ�½���"
DTM004[163] = function(text1,text2,text3,text4,text5)
	local iText="��ӭ����"..text1.."\n"..text5.."\nԤ��װжЧ�ʣ�"..text2.."���/"..text3..text4.."\n����ʾ������Ľ��ӡ�������������װж�ٶȿ�Ľ���������������ó��վ�����������װжЧ��\nף���ɹ���죡"
	return iText
end
--DTM004[164] = "ף���ɹ���죡"
--DTM004[165] = "���ʽ��������ҵ��"
--DTM004[166] = "���ʽ��Խ�����Ծ��"
DTM004[167] = "�ʽ��㣬������Ծ��"
DTM004[168] = "����"
DTM004[169] = function(text1,text2)
	local iText="Lv"..text1.." "..text2
	return iText
end
DTM004[170] = function(text)
	local iText="���ȷ�������"..text.."��ֻ��ϧ��û���㹻���ʽ�"
	return iText
end
DTM004[171] = function(text1,text2,text3)
	local iText="��ȷ��Ҫ����"..text1.."���ʽ��"..text2.."��"..text3.."��"
	return iText
end
DTM004[172] = function(text1,text2,text3,text4)
	local iText="������"..text1.."��"..text2.."������"..text3.."���ʽ�Ԥ�Ƴ���ʱ��Ϊ��\n"..text4
	return iText
end
DTM004[173] = function(text1,text2)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n��л������˽�������ҵ�����Ŀǰ�Ѿ�������ת��Լ���õĳ�������Ѿ����������˻�������ա�\n"..text1.."\n"..text2
	return iText
end
DTM004[174] = function(text1,text2,text3,text4)
	local iText=text1.."��"..text2..text3.."��������˲������ѣ���Ҫ�����ʽ�İ������߳�������"..text3.."��ŵ���κ�Ϊ������"..text4.."�ʽ���˶�������1�����ڵõ�˫���ĳ�����"
	return iText
end
DTM004[175] = "����"
DTM004[176] = "����������"
DTM004[177] = "����������"
DTM004[178] = "��������"
DTM004[179] = "����"
DTM004[180] = "��ҵ��"
DTM004[181] = "��Ǯ����"
DTM004[182] = function(text1,text2)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n��л������˽������Ȼ�����ҵ��ǣ��ҵ��������޺�ת���������Ҳ��ò������Ʋ������ˣ�����û�����س�ŵ�ұ�ʾ�����Ǹ�⣬���ѽ������ҵİ�����"..text1.."�ڲ�����������������ϣ����������������\n"..text1.."\n"..text2
	return iText
end
DTM004[183] = function(text1,text2)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n��л������˽������Ȼ�����ҵ��ǣ��ҵ��������޺�ת����������ܵĻ�������һ���³������������𣬶���û�����س�ŵ�ұ�ʾ�����Ǹ��\n"..text1.."\n"..text2
	return iText
end
DTM004[184] = "�ɹ�����"
DTM004[185] = function(text1,text2,text3)
	local iText="��ȷ��Ҫ����"..text1.."��ʮ�������"..text2.."��λ"..text3.."�Ĳɹ�������"
	return iText
end
DTM004[186] = function(text1,text2,text3,text4,text5)
	local iText=text1.."��"..text2.."������ֶ�ȱ����Ը��"..text3.."���ʽ�߼��չ�"..text4.."��λ��"..text2.."��\n�ɹ���ֹʱ�䣺"..text5
	return iText
end
DTM004[187] = function(text1,text2,text3,text4,text5)
	local iText="����"..text1.."ǩ��һ��"..text2.."�Ĳɹ���ͬ��������ָ������ǰ��"..text4.."��λ��"..text2.."�ʹ�Ϳɻ��"..text3.."���ʽ���Ϊ���ꡣ\n�����ֹʱ�䣺"..text5
	return iText
end
DTM004[188] = function(text)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n��л����Ӧ��æ�������Ѿ��ڸ���������һ�����䣬һ��������Ӧ���ֻҪ�����Ƿŵ������ڼ��ɡ�\n"..text
	return iText
end
DTM004[189] = function(text)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n��л�������Ļ��Լ���ı����Ѿ����������˻��������İ��������ٴα�ʾ����ĸ�л��\n"..text
	return iText
end
DTM004[190] = function(text1,text2)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\nԼ���������ѵ���Ȼ�����ǲ�û���յ��������Ļ���ǳ��ź���֪ͨ���������Ѿ�������Ҫ"..text2.."�ˣ�֮ǰ�ĺ�ͬ�ʹ����ϡ�\n"..text1
	return iText
end
DTM004[191] = "��ȷ��Ҫ�������������"
DTM004[192] = function(text1,text2)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n�˽⣬��������Ҫ�������˲ɹ�"..text2.."�ˡ�\n"..text1
	return iText
end
DTM004[193] = function(text1,text2)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n�治֪�Ҹ���θ�л�������ѽ������ҵİ�����"..text1.."�ڲ�����������������ϣ����������������\n"..text1.."\n"..text2
	return iText
end
DTM004[194] = "����û���ػ��������޷�ʰȡ��"
DTM004[195] = "�û��������Ĵ�����̫���ˣ��޷�ʰȡ��"
DTM004[196] = function(text1,text2)
	local iText="��ȷ��Ҫ��"..text1.."��λ��"..text2.."�Ž����������"
	return iText
end
DTM004[197] = function(text1,text2)
	local iText="�㻹û�вɹ���"..text1.."��λ��"..text2.."��"
	return iText
end
DTM004[198] = "����û���ػ��������޷�ж����"
DTM004[199] = "�������"
DTM004[200] = function(text)
	local iText="���ȷ���빺������"..text.."������û���㹻���ʽ�"
	return iText
end
DTM004[201] = function(text1,text2,text3)
	local iText="��ȷ��Ҫ��"..text1.."���ʽ�ļ۸���"..text2.."������"..text3.."��"
	return iText
end
DTM004[202] = function(text1,text2,text3)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n�����Ѿ���"..text1.."��λ��"..text2.."װ�䲢�������˸����������������������ˡ�\n"..text3
	return iText
end
DTM004[203] = function(text1,text2,text3,text4,text5)
	local iText=text1.."��"..text2.."���ճ�����������Ը��"..text3.."���ʽ�ĵͼ�����"..text4.."��λ��"..text2.."��\n��ֽ�ֹʱ�䣺"..text5
	return iText
end
DTM004[204] = function(text1,text2,text3,text4)
	local iText="����"..text3.."���ʽ�ĵͼ۴�"..text1.."������"..text4.."��λ��"..text2.."����������������"..text1.."�������뼰ʱȡ�����ǡ�"
	return iText
end
DTM004[205] = function(text)
	local iText="�����"..text.."���û�Ǯ�ˣ��Է��м����ѡ�"
	return iText
end
DTM004[206] = function(text)
	local iText=text.."�Ѿ������������������������"
	return iText
end
DTM004[207] = function(text1,text2)
	local iText=text1.."�Ʋ��ˣ�����������İ����Ѿ���"..text2.."�ڲ���Ϊ��֪��"
	return iText
end
DTM004[208] = function(text)
	local iText="����֪ͨ"..text.."���޷���ɲɹ����񣬹��ƶԷ�������˵ġ�"
	return iText
end
DTM004[209] = function(text)
	local iText="���������"..text.."ǩ���Ĳɹ���ͬ���Է��ƺ��ܸ��ˡ�"
	return iText
end
DTM004[210] = function(text)
	local iText="����"..text.."��ϵ���ţ��Է���ֹ��Ľ��ӽ����վ��"
	return iText
end
DTM004[211] = "��ϵ���㣬���ܹ��룡"
DTM004[212] = "����"
DTM004[213] = function(l_ShipData,text,l_ShipData2,text2)
	local iText = ""
	iText = iText.."�����ۼۣ�"..DTM4_GetColorText(l_ShipData.Price,"Less",l_ShipData2.Price,l_ShipData.Price).."\n"
	iText = iText.."����������"..DTM4_GetColorText(l_ShipData2.cap,"Less",l_ShipData.cap,l_ShipData.cap).."\n"
	iText = iText.."��ҵ�ռ䣺"..DTM4_GetColorText(l_ShipData2.fcap,"Less",l_ShipData.fcap,l_ShipData.fcap).."\n"
	iText = iText.."�˿�����"..DTM4_GetColorText(l_ShipData.PopPoint,"Less",l_ShipData2.PopPoint,l_ShipData.PopPoint).."\n"
	iText = iText.."���µȼ���"..DTM4_GetColorText(l_ShipData.FightLevelNeed,"Less",l_ShipData2.FightLevelNeed,l_ShipData.FightLevelNeed).."\n"
	iText = iText.."ó�׵ȼ���"..DTM4_GetColorText(l_ShipData.TradeLevelNeed,"Less",l_ShipData2.TradeLevelNeed,l_ShipData.TradeLevelNeed).."\n"
	iText = iText.."װж������"..DTM4_GetColorText(l_ShipData2.TransAmount,"Less",l_ShipData.TransAmount,l_ShipData.TransAmount).."\n"
	iText = iText.."װж�ٶȣ�"..DTM4_GetColorText(l_ShipData2.TransSpeed,"Less",l_ShipData.TransSpeed,l_ShipData.TransSpeed).."\n"
	iText = iText.."�ճ����ģ���λ/�죩��\n"
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
				iText = iText.."�ƶ����ģ���λ/�죩��\n"
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
				iText = iText.."�������ģ���λ/�죩��\n"
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
				iText = iText.."ά�����ģ���λ/�죩��\n"
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
				iText = iText.."��Ծ���ģ���λ/ʱ����\n"
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
				iText = iText.."�������ģ���λ/ʱ����\n"
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
				iText = iText.."�������ģ���λ/ʱ����\n"
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
DTM004[214] = "�������"
DTM004[215] = function(iCamp,iEnemyCamp)
	local iText="��ȷ��Ҫ����"..iCamp.."�ݻ�"..iEnemyCamp.."��Ŀ����"
	return iText
end
DTM004[216] = function(iCamp,iEnemyCamp)
	local iText="��л������������ǣ�"..iEnemyCamp.."�Ľ���λ���Ѿ�������㣬�����С�ġ�\n"..iCamp
	return iText
end
DTM004[217] = function(iCamp,iEnemyCamp,iReward,iDate)
	local iText=iCamp.."��ǰ��Ϥһ֧"..iEnemyCamp.."�Ľ����Ѿ��ִﱾ���������߻������ƻ����"..iCamp.."Ը��"..iReward.."���ʽ�����������֧���ӡ�\n���ͽ�ֹʱ�䣺"..iDate
	return iText
end
DTM004[218] = function(iCamp,iEnemyCamp,iReward,iPos)
	local iText="���Ӧ����"..iCamp.."���"..iPos.."��"..iEnemyCamp.."��в��ֻҪ��"..iEnemyCamp.."�Ľ��Ӵݻ٣��Ϳɻ��"..iReward.."���ʽ���Ϊ���ꡣ"
	return iText
end
DTM004[219] = function(iCamp)
	local iText="����֪ͨ"..iCamp.."���޷����������񣬹��ƶԷ�������˵ġ�"
	return iText
end
DTM004[220] = function(iEnemyCamp)
	local iText="����Լ�ݻ���"..iEnemyCamp.."�Ľ��ӣ�������ϣ���Է�����֪����˭�ɵġ�"
	return iText
end
DTM004[221] = function(iCamp,iEnemyCamp)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n�˽⣬��������Ҫ���������������"..iEnemyCamp.."����в�ˡ�\n"..iCamp
	return iText
end
DTM004[222] = function(iCamp,iEnemyCamp)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\nԼ���������ѵ���Ȼ�����ǲ�û�п���"..iEnemyCamp.."��Ŀ�걻�ݻ٣��ǳ��ź���֪ͨ���������Ѿ����ٹ�����в�ˣ�֮ǰ�ĺ�ͬ�ʹ����ϡ�\n"..iCamp
	return iText
end
DTM004[223] = function(text)
	local iText="��û����Լ��������ǰ�����"..text.."�Ĳɹ���ͬ�����ƶԷ�������˵ġ�"
	return iText
end
DTM004[224] = function(iCamp,iEnemyCamp)
	local iText="��û����Լ��������ǰ����"..iCamp.."�ݻ�"..iEnemyCamp.."��Ŀ�꣬���ƶԷ�������˵ġ�"
	return iText
end
DTM004[225] = function(iCamp,iEnemyCamp)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n��л���������������"..iEnemyCamp.."����в��Լ���ı����Ѿ����������˻��������İ��������ٴα�ʾ����ĸ�л��\n"..iCamp
	return iText
end
DTM004[226] = "��ģ��"
DTM004[227] = function(iDate)
	local iText="Ӧ��"..iDate.."ǰ��֮�ݻ�"
	return iText
end
DTM004[228] = "������������"
DTM004[229] = "��˫������ȫ����"
DTM004[230] = "��˫������ȫ����"
DTM004[231] = "Ѱ������"
DTM004[232] = function(text)
	local iText="��ȷ��Ҫ����"..text.."Ѱ����ʧ�Ļ�����"
	return iText
end
DTM004[233] = "��ոմӸ����ն����յ�һ����Ϣ��\n��л�������������Ѱ����ʧ�Ļ��䣬�����Ѿ���������ܵ����귢�����ˡ�\n"
DTM004[234] = function(text1,text2,text3)
	local iText="�㷢����"..text1.."��ʧ�Ļ��䣬������"..text2.."��λ��"..text3.."���Ͻ��û�����"
	return iText
end
DTM004[235] = function(text1,text2)
	local iText="�����"..text1.."�ҵ�����ʧ�Ļ��䣬����"..text1.."�Ĺ�ϵ�����ˡ�("..text2..")"
	return iText
end
DTM004[236] = function(text1,text2)
	local iText="���ҵ���"..text1.."��ʧ�Ļ��䲢��Ϊ���У�����"..text1.."�Ĺ�ϵ�½��ˡ�("..text2..")"
	return iText
end
DTM004[237] = function(text1)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n���Ƕ�ʧ���������Ѿ������˽����ȵ��ˣ����ǻ᳢��������������������Ѿ���������������ˡ���˺��ź���֪ͨ�������ǵĺ�Լ�ʹ����ϡ�\n"..text1
	return iText
end
DTM004[238] = function(text1,text2)
	local iText=text1.."��һ֧���ӽ����ڸõ�����ʧ��һ�����䣬��Ը��"..text2.."���ʽ���Ϊ���꽱������3����Ѱ�øû�����ˡ�"
	return iText
end
DTM004[239] = function(text1,text2,iDate)
	local iText="���Ӧ����"..text1.."Ѱ����"..text2.."��ʧ�Ļ��䡣\n�����ֹʱ�䣺"..iDate
	return iText
end
DTM004[240] = function(text)
	local iText="��û�ܽ�"..text.."��ʧ�Ļ������ԭ����"
	return iText
end
DTM004[241] = function(text)
	local iText="�����"..text.."�ҵ�����ʧ�Ļ��䡣"
	return iText
end
DTM004[242] = "�ͻ�����"
DTM004[243] = function(text1,text2,text3,text4)
	local iText="��ȷ��Ҫ���ܽ�λ��"..text2.."���ŵ�"..text3.."��λ"..text4.."���������ʹ�"..text1.."��������"
	return iText
end
DTM004[244] = function(text)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n��л����Ӧ��æ�������Ѿ��ڸ���������һ�����䣬һ��ȡ�û��ֻҪ�����Ƿŵ������ڼ��ɡ�\n"..text
	return iText
end
DTM004[245] = function(text1,text2,text3)
	local iText="����"..text1.."�����Ļ��������"..text2.."��λ��"..text3.."��ʰȡ�û�����"
	return iText
end
DTM004[246] = function(text1,text2,text3)
	local iText="����"..text1.."�����Ļ��������"..text2.."��λ��"..text3.."����Ļ���Ŀǰװ���£�"
	return iText
end
DTM004[247] = function(text1,text2)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\nԼ���������ѵ���Ȼ�����ǲ�û���յ��������Ļ���ǳ��ź���֪ͨ���������Ѿ�������Ҫ"..text2.."�ˣ�֮ǰ�ĺ�ͬ�ʹ����ϡ�\n"..text1
	return iText
end
DTM004[248] = function(text)
	local iText="��ոմӸ����ն����յ�һ����Ϣ��\n�˽⣬��������Ҫ�������������������ˡ�\n"..text
	return iText
end
DTM004[249] = function(text1,text2,text3,text4,text5)
	local iText=text1.."�ɹ���һ��"..text2.."����������������"..text3.."���Ÿ�����"..text1.."Ը����"..text4.."�ʽ���Ϊ�����һ֧������3���ڽ���������������\n�ͻ���ֹʱ�䣺"..text5
	return iText
end
DTM004[250] = function(text1,text2,text3,text4,text5)
	local iText="����"..text1.."ǩ��һ��"..text2.."�����ͺ�ͬ��������ָ������ǰ��λ��"..text4.."���ŵ����������ʹ�"..text1.."���Ϳɻ��"..text3.."���ʽ���Ϊ���ꡣ\n�����ֹʱ�䣺"..text5
	return iText
end
DTM004[251] = function(text)
	local iText="��û����Լ��������ǰ�����"..text.."�Ļ������ͺ�ͬ�����ƶԷ�������˵ġ�"
	return iText
end
DTM004[252] = function(text)
	local iText="����֪ͨ"..text.."���޷�����˻����񣬹��ƶԷ�������˵ġ�"
	return iText
end
DTM004[253] = function(text)
	local iText="���������"..text.."ǩ�����˻���ͬ���Է��ƺ��ܸ��ˡ�"
	return iText
end
DTM004[254] = "�����͵Ļ���"
DTM004[255] = function(text1,text2,text3)
	local iText=text2.."��λ"..text3.."����������"..text1
	return iText
end
DTM004[256] = "������յ�"
DTM004[257] = function(text1,text2)
	local iText="��Ҫ��"..text1.."��λ"..text2
	return iText
end
DTM004[258] = "��������"
DTM004[259] = "��������"
DTM004[260] = "�ر�"
DTM004[261] = "���ܵ�����������似�ܣ�"
DTM004[262] = "������������"
DTM004[263] = "��˫������ȫ����"
DTM004[264] = "Ϊ���Ľ���������"