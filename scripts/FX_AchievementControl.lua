-------------------------------------------------------------
------FX_AchievementControl.lua-------2018��12��26��---------
--�� 9CCNMOD�� ������-���� ��д
--����ļ�����FX MOD�еĳɾ�ϵͳ��صĿ��ƺ���
--���ú����У�
--Write_FX_Achievements_Lua()									--���ɾ��������浵
--Read_FX_Achievements_Lua()									--��ȡ�浵�ĳɾ����
--Get_FX_Achievements_Value(sName)						--���سɾ͡�sName���ġ���ɶȡ�
--Set_FX_Achievements_Value(sName,iValue)			--���óɾ͡�sName���ġ���ɶȡ�ֵΪiValue
--Get_FX_Achievements_isComplete(sName)				--���سɾ͡�sName���Ƿ������
--Set_FX_Achievements_ValueAdd(sName,iValue)	--�޸ĳɾ͡�sName���ġ���ɶȡ�ֵ��ʹ������iValue
--�κ�ʱ����Ҫ���ô��ļ�������ִ��Read_FX_Achievements_Lua()��
--Ȼ��ʹ�������Set������Get����������ز�����
--����ڼ������Set�������ű����Զ�ִ��һ��Write_FX_Achievements_Lua()��
-------------------------------------------------------------
--�ɾ��б���data:ui/newui/Achievement/AchievementList.lua�ж���
-------------------------------------------------------------
-------------------------------------------------------------


dofilepath("data:ui/newui/Achievement/AchievementList.lua")
dofilepath("data:scripts/debug.lua")
dofilepath("data:scripts/LW_functions.lua")
dofilepath("data:scripts/ThoughtDump_modified.lua")

function Write_FX_Achievements_Lua()
	if (writeto and writeto("FX_Achievements.lua") ~= nil) then
		write("FX_Achievements=\n{\n")
		write(GetTableDump(FX_Achievements))
		write("}")
		writeto()
		LW_filehash.set("FX_Achievements.lua")
	else
		dout("Fail to write in FX_Achievements.lua!")
	end
end

function Read_FX_Achievements_Lua()
	if (GetVersionInfo and MainUI_ScarEvent ) then --����Ϸ��UI��Ļ����ͽ���gamerule��ȥ����ļ���ȷ��
	--ע��GetVersionInfo�����ж��ǲ���UI��MainUI_ScarEvent�����ж��ǲ�����Ϸ�ڣ������÷�������Щhack��
		MainUI_ScarEvent([[
			if (not Write_FX_Achievements_Lua) then
				--���û�м��سɾͿ⣬���ȼ���һ��
				dofilepath("data:scripts/FX_AchievementControl.lua")
				--ע�ⲻ��Ҫ����FX_AchievementControl_TableFunctions.lua����Ϊ����ֻ�õ��˻�����hash��鹦��
			end
			Read_FX_Achievements_Lua()
		]])
	end
	dofilepath("player:FX_Achievements.lua")
	if (FX_Achievements == nil or LW_filehash.check("FX_Achievements.lua", LW_HASHNUM) == 0) then
		FX_Achievements={}		
	end
	
	for index,item in AchievementList do
		if (FX_Achievements[index]==nil) then
			FX_Achievements[index]=
			{
				completeDate = "$90035",
				value = 0,
			}
		end
	end
	
	Write_FX_Achievements_Lua()
end

function Get_FX_Achievements_Value(sName)
  Read_FX_Achievements_Lua() --�����������һ�ζ�ȡ�����ر��Ҫ�����ҿ���������Ե������½���
                              --����Ϊ�˱�֤һ������û���������һ�±ȽϺ�
	return FX_Achievements[sName] and FX_Achievements[sName].value or 0
end

function Set_FX_Achievements_Value(sName,iValue)
	if (Get_FX_Achievements_isComplete(sName) == 0) then
		FX_Achievements[sName].value = iValue
		Write_FX_Achievements_Lua()
		if (Get_FX_Achievements_isComplete(sName) == 1) then
			FX_Achievements[sName].completeDate=date("%Y-%m-%d")
			Write_FX_Achievements_Lua()
			local subtitleMessage = Message_FormatFs("$90026", AchievementList[sName].localeName)
			Subtitle_Messagew(subtitleMessage, 2)
		--else
		--	local subtitleMessage = Message_FormatFs("$90045", AchievementList[sName].localeName,iValue,AchievementList[sName].maxValue)
		--	Subtitle_Messagew(subtitleMessage, 2)
		end
	end
end

function Get_FX_Achievements_isComplete(sName)
  return Get_FX_Achievements_Value(sName) >= AchievementList[sName].maxValue and 1 or 0
end

function Set_FX_Achievements_ValueAdd(sName,iValue)
	Set_FX_Achievements_Value(sName,Get_FX_Achievements_Value(sName)+iValue)
end
-------------------------------------------------------------
------FX_AchievementControl.lua-------2015��12��02��---------
--�� 9CCNMOD�� ���ȿ˽��� ��д
--����ļ�����FX MOD�еĳɾ�ϵͳ��ص����������������жϺ�����������ʽ��
--dofilepath("Data:scripts/FX_AchievementControl.lua")
--
--function OnInit()
--����
--FX_Achievements_Init(iTag)--iTagΪ��Ϸģʽ��ǩ���ƣ���ӦAchievementList�е�GameModeTags
--����
--end

dofilepath("data:scripts/FX_AchievementControl_TableFunctions.lua")

FX_Achievements_GameModeTag = ""
FX_Achievements_Values = {}

function FX_Achievements_Init(iTag)
	FX_Achievements_GameModeTag = iTag
	Read_FX_Achievements_Lua()
	Rule_AddInterval("FX_Achievements_Judge",0.5)
end

function FX_Achievements_Judge()
	for iPlayer=1,Universe_PlayerCount() do
		if(iPlayer==Universe_CurrentPlayer()+1)then
			for iName,iAchievement in AchievementList do
				if FX_Achievements_HaveTag(iAchievement.GameModeTags,FX_Achievements_GameModeTag)==1 and(Get_FX_Achievements_isComplete(iName)==0)then
					local iFlag=0
					for iConditionGroupIndex,iConditionGroup in iAchievement.Conditions do
						iFlag=1
						for iConditionIndex,iCondition in iConditionGroup do
							if FX_Achievements_ConditionJudge[iCondition[1]](iPlayer-1,iCondition)==0 then
								iFlag=0
								break
							end
						end
						if iFlag==1 then
							break
						end
					end
					if iFlag==1 then
						--�������,��ɶ�+1
						Set_FX_Achievements_ValueAdd(iName,1)
						--Write_FX_Achievements_Lua()
					end
				end
			end
		end
	end
	if (Rule_Exists("waitForEnd")==1)then
		Rule_Remove("FX_Achievements_Judge")
	end
end

function FX_Achievements_HaveTag(Tags,iTag)
	local iFlag = 0
	for Index,Tag in Tags do
		if Tag==iTag then
			iFlag=1
			break
		end
	end
	return iFlag
end
