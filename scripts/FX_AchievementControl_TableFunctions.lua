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

FX_Achievements_ConditionJudge.Function=function(iPlayer,iCondition)--函数判断，{"Function",<iFunction>}
	local iFlag=0
	--_ALERT(iCondition[2]())
	if (iCondition[2]~=nil)then
		iFlag=iCondition[2]()
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

FX_Achievements_ConditionJudge.IsPlayerWinInMP=function(iPlayer,iCondition)--联机对战胜利判断，{"IsPlayerWinInMP"}
	local iFlag=0
	if (Rule_Exists("waitForEnd")==1)then
		if(Player_IsAlive(iPlayer)==1)then
			for i=0,Universe_PlayerCount()-1 do
				if (Player_GetLevelOfDifficulty(i)==0) and (i~=iPlayer) then
					if (AreAllied(i, iPlayer)==0) then
						iFlag=1
					end
				end
			end
		end
	end
	return iFlag
end

function FXA_Rep80()
	local iMaxRep=0
	if FX_AIRelation~=nil then
		local iPlayer=1
		while FX_AIRelation[iPlayer]~=nil do
			if (FX_AIRelation[iPlayer]>iMaxRep) then
				iMaxRep=FX_AIRelation[iPlayer]
			end
			iPlayer=iPlayer+1
		end
	end
	if iMaxRep>80 then
		return 1
	else
		return 0
	end
end

function FXA_PathFinish()
	dofilepath("player:playercfg.lua")
	if fx_path~=nil then
		if fx_path.M35~=nil and fx_path.M36~=nil and fx_path.M37~=nil then
			if fx_path.M35.complete==1 and fx_path.M36.complete==1 and fx_path.M37.complete==1 then
				return 1
			end
		end
	end
	return 0
end