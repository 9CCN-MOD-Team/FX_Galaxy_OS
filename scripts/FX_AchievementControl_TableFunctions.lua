dofilepath("data:scripts/LW_functions.lua")

FX_Achievements_ConditionJudge = {}
-----------------------------------------------------------------------
FX_Achievements_ConditionJudge.Value=function(iPlayer,iCondition)--完成度判断，{"Value",X}
	local iFlag=0
	if (iCondition[2]==Get_FX_Achievements_Value(iCondition[1]))then
		iFlag=1
	end
	return iFlag
end

FX_Achievements_ConditionJudge.ValueDetect=function(iPlayer,iCondition)--变量判断，{"ValueDetect",<ValueIndex>,X}
	local iFlag=0
	if (FX_Achievements_Values[iCondition[2]]~=nil)then
		if(FX_Achievements_Values[iCondition[2]]==iCondition[3])then
			iFlag=1
		end
	end
	return iFlag
end

FX_Achievements_ConditionJudge.IsPlayerWinInDM=function(iPlayer,iCondition)--死亡竞赛胜利判断，{"IsPlayerWinInDM"}
	local iFlag=0
	if (Rule_Exists("waitForEnd")==1)then
		if(Player_IsAlive(iPlayer)==1)then
			iFlag=1
		end
	end
	return iFlag
end