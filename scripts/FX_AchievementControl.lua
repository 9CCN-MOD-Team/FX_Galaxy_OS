-------------------------------------------------------------
------FX_AchievementControl.lua-------2018年12月26日---------
--由 9CCNMOD组 破天者-孤狼 编写
--这个文件包含FX MOD中的成就系统相关的控制函数
--可用函数有：
--Write_FX_Achievements_Lua()									--将成就完成情况存档
--Read_FX_Achievements_Lua()									--读取存档的成就情况
--Get_FX_Achievements_Value(sName)						--返回成就“sName”的“完成度”
--Set_FX_Achievements_Value(sName,iValue)			--设置成就“sName”的“完成度”值为iValue
--Get_FX_Achievements_isComplete(sName)				--返回成就“sName”是否已完成
--Set_FX_Achievements_ValueAdd(sName,iValue)	--修改成就“sName”的“完成度”值，使其增加iValue
--任何时候需要调用此文件，请先执行Read_FX_Achievements_Lua()，
--然后使用所需的Set函数或Get函数进行相关操作，
--如果期间进行了Set函数，脚本将自动执行一次Write_FX_Achievements_Lua()。
-------------------------------------------------------------
--成就列表在data:ui/newui/Achievement/AchievementList.lua中定义
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
	if (GetVersionInfo and MainUI_ScarEvent ) then --在游戏内UI域的话，就交给gamerule域去检查文件正确性
	--注意GetVersionInfo用于判断是不是UI，MainUI_ScarEvent用于判断是不是游戏内（这俩用法稍稍有些hack）
		MainUI_ScarEvent([[
			if (not Write_FX_Achievements_Lua) then
				--如果没有加载成就库，就先加载一下
				dofilepath("data:scripts/FX_AchievementControl.lua")
				--注意不需要加载FX_AchievementControl_TableFunctions.lua，因为这里只用到了基础的hash检查功能
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
  Read_FX_Achievements_Lua() --理论上这里加一次读取不是特别必要，而且可能造成明显的性能下降，
                              --但是为了保证一致性最好还是这样读一下比较好
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
------FX_AchievementControl.lua-------2015年12月02日---------
--由 9CCNMOD组 萨尤克教主 编写
--这个文件包含FX MOD中的成就系统相关的启动函数和条件判断函数，启动方式：
--dofilepath("Data:scripts/FX_AchievementControl.lua")
--
--function OnInit()
--……
--FX_Achievements_Init(iTag)--iTag为游戏模式标签名称，对应AchievementList中的GameModeTags
--……
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
						--条件达成,完成度+1
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
