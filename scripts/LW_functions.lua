-------------------------------------------------------------
------LW_functions.lua-------2016��2��27��---------
--�� 9CCNMOD�� ������-���� ��д
--����ļ�����һЩ�Ҹ����������ط��õ��ĺ����õĺ���
-------------------------------------------------------------
-------------------------------------------------------------


dofilepath("data:scripts/debug.lua")

function findTableElement(tTarget,tCondition)
	local result=tTarget
	local i=1
	local n
	local found
	while(tCondition[i]) do
		found = 0
		if tCondition[i][3] == nil then
			tCondition[i][3] = 1
		end
		n=0
		while(found < tCondition[i][3]) do
			n=n+1
			while(result[n][tCondition[i][1]] ~= tCondition[i][2]) do
					n=n+1
			end
			found = found + 1
		end
		result=result[n]
		i=i+1
	end
	return result
end

table=
{
	getn=function(tTable)
		local i=1
		while(tTable[i]) do
			i=i+1
		end
		return i-1
	end,
	concat=function(tTable, sSep,  iStart, iEnd) 
		local i=1
		local result=""
		while(tTable[i]) do
			result=result..tTable[i]..sSep
			i=i+1
		end
		return result
	end,
	insert = function(tTable, value)
		local i=1
		while(tTable[i]) do
			i=i+1
		end
		tTable[i] = value
	end,
}
string=
{
	rep=function(sString,iNum)
		local result=""
		local i
		for i=1,iNum do
			result=result..sString
		end
		return result
	end
}

LW_filehash =
--���������ļ�Hash����
{
	set = function(sFile)
	--�������sFile��ָ�����ļ���Hashֵ��������ֵд����ļ�

		if (write) then --��������write��ʱ����У����򱨴�
			--��ȡ�ļ������ַ�ת��ΪASCII�����ֹ��ɵ�table ��filebyte��
			local filebyte = LW_filehash.private_ReadFileByte(sFile)
			--���á�filebyte������Hashֵ
			local HashNum = LW_filehash.private_CalculateHashNum(filebyte)
			--д�ļ�
			if (appendto(sFile)) then
				write("\nLW_HASHNUM = "..HashNum)
				writeto()	--�ܵ��۵�����appendto�򿪵��ļ�����ȴӦ����writeto���ر�
			else
				derr("Failed to open file "..sFile)
			end
		else
			derr("Using LW_filehash.set() in a scope where write() is nil!")
		end
		
	end,
	
	check = function(sFile, iHashNum)
	--�������sFile��ָ�����ļ���Hashֵ��������ֵ��iHashNum�Ƚ�
	--����򷵻�1�������򷵻�0
		if (read) then	--��������read��ʱ����У������¼��־������1
			--��ȡ�ļ������ַ�ת��ΪASCII�����ֹ��ɵ�table ��filebyte��
			local filebyte  = LW_filehash.private_ReadFileByte(sFile)
			if filebyte then --�������ļ��ɹ�ʱ�Ž�������Ĳ���
				if type(filebyte) == "table" then	--����private_ReadFileByte����tableʱ�Ž��м���
					--���á�filebyte������Hashֵ
					local HashNum = LW_filehash.private_CalculateHashNum(filebyte)
					--�ж������ؽ��
					if (HashNum == iHashNum) then
						dout("Hash Check Success For File "..sFile)
						return 1
					else
						derr("Hash Check Failure For File "..sFile.." !")
						return 0
					end
				else	--����һ����private_ReadFileByte������һ������
					derr(filebyte)
					return 0		
				end
			else
				dout("Open file failed. This will always return 1")
				return 1
			end
		else
			dout("tried using LW_filehash.check() in a scope where read() is nil. This will always return 1.")
			return 1
		end
	end,
	
	private_ReadFileByte = function(sFile)
	--��ȡ�ļ�sFile���������ļ����ַ�ת��ΪASCII�����ֹ��ɵ�table����
		--���ļ�
		if (readfrom(sFile)) then
			local line = read()	--���ж���
			local filetext = ""	--���ַ������ڱ���������Ҫ����Hash������ַ�
			while (line) do
				if (strsub(line, 1, 10) ~= "LW_HASHNUM") then	--�������в����Ǽ�¼LW_HASHNUM��ʱ�������Hash����
					filetext = filetext .. line
				else --������һ������û��ʲô�����ֵĶ���
					line = gsub(line,"LW_HASHNUM = ","")
					if not tonumber(line) then
						return "Error Happened When Check the Line Containing \"LW_HASHNUM = \"" 	--�������ֵĶ����Ļ��ͷ��ش����ı�
					end
				end
				line = read()	--ע�⵱�����ļ�βʱread()�᷵��nil���Ӷ�whileѭ��������ֹ
			end
			readfrom()	--�ر��ļ�
			local filebyte={}	--����ת���õ��ġ�ASCII�����ֹ��ɵ�table��
			for i = 1,strlen(filetext) do	--��filetext�е�ÿ���ַ���strbyteת��ΪASCII��ֵ
				tinsert(filebyte, strbyte(filetext, i))
			end
			return filebyte	--���ؽ��
		else
			derr("Failed to open file "..sFile)
			return nil
		end
	end,
	
	private_CalculateHashNum = function(filebyte)
	--���á�filebyte������Hashֵ�ĺ���
		local HashNum = 0
		for index, value in filebyte do --����filebyte�е�ÿ��ֵ����һϵ�����߰��������
			if (type(index) == "number") then	--ע��֮ǰtinsert����������filebyte������һ��n�������ж�һ�±ܿ���
				HashNum = HashNum +  LW_RandomNumbers[mod(index, LW_RandomNumbers.n) + 1] * LW_RandomNumbers[mod(value, LW_RandomNumbers.n) + 1]
			end
		end
		HashNum = mod(HashNum + floor(sqrt(HashNum)),200000000)
		return HashNum
	end,
}

LW_RandomNumbers =
{
	85,2791,2030,4484,1977,2978,2339,4291,2222,4700,
	227,4437,1621,208,2361,2018,392,3437,2388,4306,
	2716,1883,2417,2059,4930,4274,921,4062,705,4310,
	836,1621,4003,3823,2817,3172,4723,850,4956,1665,
	3034,3653,4822,1199,2064,2030,1284,98,2746,2540,
	3545,2168,4112,4046,1636,1933,3119,4139,1150,2478,
	1440,4,2326,4427,3633,3791,506,2915,1402,1799,
	4759,1746,1309,3367,1265,665,4302,4395,4532,4341,
	3786,473,1948,3570,4235,2284,893,1474,4009,4519,
	2876,4952,2586,1323,221,140,535,4643,3067,4283,
	1204,166,3019,2076,585,2755,2953,2100,2386,2568,
	3715,3338,2061,684,573,172,1145,1683,272,1191,
	2069,2867,1997,4295,3745,4615,437,3563,363,910,
	3666,2486,3524,3318,2356,3578,2946,3452,676,2469,
	4499,928,1611,3661,4392,2634,1634,1261,4696,3879,
	1769,1826,4588,1642,3547,4902,3582,2952,1914,2932,
	1543,1108,3976,542,4226,4414,2709,523,3192,4434,
	1638,117,4383,4815,3899,3992,4481,1878,547,2256,
	4147,4763,2578,4521,172,2517,21,2687,688,4422,
	4894,3966,1230,3287,2931,237,519,1554,4802,780,
	930,1288,4513,4482,1881,3646,2573,1554,284,2575,
	124,4014,772,4880,4313,2358,4643,2121,3015,3771,
	2630,526,549,4204,1141,2721,3922,1655,547,1941,
	1338,204,174,4669,4490,166,1281,2058,3812,298,
	2185,3309,1201,2046,4890,679,1621,3208,1093,2848,
	3565,2393,315,1668,2824,3381,4761,3316,1965,3641,
	2071,4057,2698,4147,3529,3325,2498,2626,3992,4794,
	3993,2093,2028,3483,741,1326,4273,55,4248,198,
	4626,2527,1190,2757,780,1570,2607,2250,4037,2812,
	361,3675,4177,1604,2917,4785,2281,595,2226,3932,
	4571,4191,3726,3843,2625,3664,135,993,3984,148,
	3974,344,1571,4035,3499,2639,360,218,1062,3130,
	4866,892,3988,3358,3812,3227,2753,4678,4450,2116,
	4953,556,1518,2965,268,922,4541,3426,294,2017,
	2101,208,1273,4469,3341,3781,1175,315,4906,331,
	3588,201,2127,4041,3522,2678,1364,2585,2972,2759,
	3750,1992,22,2217,633,1874,1566,2235,4540,2419,
	4568,4783,2599,257,1481,4819,3254,3100,131,4341,
	634,4355,3029,1121,4420,3083,2168,4993,2431,2405,
	4874,4333,3895,1153,1837,21,1540,4092,1326,1911,
	2320,782,1213,1854,452,3431,715,481,55,2966,
	4711,3032,4810,745,4231,1175,2102,182,2540,4938,
	691,73,3711,561,4380,2677,4679,5000,3537,4681,
	3563,1528,1653,3176,3487,4481,1237,1002,4031,777,
	711,362,2533,3715,4055,3819,980,3063,3328,3178,
	3137,2207,2922,4319,4267,944,2872,2531,2915,1918,
	3648,3352,3762,3145,3619,279,20,2478,4895,2922,
	3354,3859,2838,553,2317,1190,3511,1397,1366,3490,
	2150,360,2540,2160,4943,3099,4733,1362,2366,2376,
	2770,4821,3443,2227,3802,1801,4396,85,3957,2490;
	n = 500
}

function LW_SpeechRaceHelper()
	if (writeto("raceid.lua")) then
		local RaceCount = Race_GetCount()
		write("Race_ID = \n{\n")
		for i = 1,RaceCount-1 do
			write("\t\""..Race_GetName(i).."\",\n")
		end
			write("}")
		writeto()	
	end
end