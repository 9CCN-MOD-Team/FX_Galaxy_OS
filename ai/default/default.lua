-----------------------------------
--通用家园重制版AI脚本
--作者：萨尤克教主
--default.lua for HWRM 2.0+
--version 1.1.2
--2020.08.19
-----------------------------------

if g_LOD==nil then
	g_LOD = getLevelOfDifficulty()
end

dofilepath("data:ai/default/classdef.lua")
dofilepath("data:ai/cpubuild.lua")
dofilepath("data:ai/cpuresearch.lua")
dofilepath("data:ai/cpumilitary.lua")
dofilepath("data:ai/cpulogic.lua")

old_aitrace = aitrace
rawset(globals(),"aitrace",nil)
aitrace = function() end

function Load_ClassDef(FileTable)
	Custom_ClassDef={}
	for Index,File in FileTable do
		dofilepath(File)
	end
	for unit,classTable in Custom_ClassDef do
		for index,class in classTable do
			if (isOfClass(unit,class)==0) then
				AddToClass(unit,class)
			end
		end
	end
end

function Load_AIData(path_ai)
	if(path_ai=="")then
		_ALERT("AI Script Error: No configuration file found.")
		return 0
	else
		dofilepath(path_ai)
		if(ai_data==nil)then
			_ALERT("AI Script warning: No configuration data, ai_data doesn't exist! Check: "..path_ai)
			return 0
		elseif(next(ai_data)==nil)then
			_ALERT("AI Script warning: No configuration data, ai_data is empty! Check: "..path_ai)
			return 0
		end
	end
end

function oninit(path_ai)
	Proc_DetermineDemandWithNoCounterInfo = nil
	Proc_DetermineSpecialDemand = nil
	CpuBuildSS_DefaultSubSystemDemandRules = nil
	DoResearchTechDemand = nil
	Override_MilitaryInit = nil
	if (path_ai~=nil) then
		_ALERT("AI Script warning: No configuration data, using auto-created ai data.")
		if Load_AIData(path_ai)==0 then
			return
		end
	else
		local path_ai=SelfRace_GetString("path_ai", "")
		if Load_AIData(path_ai)==0 then
			return
		end
	end
	s_playerIndex = Player_Self()
	cp_processResource = 1
	cp_processMilitary = 1
	
	sg_lastSpendMoneyTime = gameTime()
	sg_spendMoneyDelay = 0	
	if (g_LOD == 0) then
		sg_spendMoneyDelay = 8
	elseif (g_LOD == 1) then
		sg_spendMoneyDelay = 4
	elseif (g_LOD == 2) then
		sg_spendMoneyDelay = 2
	end
	
	ClassInitialize()
	CpuBuild_Init()
	CpuResearch_Init()
	CpuMilitary_Init()
	
	sg_dobuild = 1
	sg_dosubsystems = 1
	sg_doresearch = 1
	sg_doupgrades = 1
	sg_domilitary = 1
	sg_fightersize=1
	sg_corvettesize=1
	sg_frigatesize=1
	sg_kDemandResetValue = 4
	sg_classPersonalityDemand[ eFighter ] = 0.25
	sg_classPersonalityDemand[ eCorvette ] = 0.25
	sg_classPersonalityDemand[ eFrigate ] = 0.25
	sg_classPersonalityDemand[ ePlatform ] = -0.5
	sg_numCollectorPerChannel=4
	sg_resourceControllerRequests=5
	sg_RUsPerChannel=500
	sg_ForceBuilderRU=2000
	sg_resourcedockfamily="Utility"
	sg_ScaleComp=1
	sg_debug=0
	sg_LinkedClass=
	{
		{eCapital,eBattleCruiser,1},
		{eSubsystemOwners,eSubSystemAttackers,0.5},
		{eCloak,eAntiCloak,1},
	}
	if (Override_Init) then
		Override_Init()
	end
	SetResourceDockFamily(sg_resourcedockfamily)
	if (g_LOD == 0) then
		cp_attackPercent = 75
		cp_minSquadGroupSize = 3*sg_ScaleComp
		cp_minSquadGroupValue = 120*sg_ScaleComp
		cp_maxGroupSize = 14*sg_ScaleComp
		cp_maxGroupValue = 180*sg_ScaleComp
		cp_forceAttackGroupSize = 8*sg_ScaleComp
		cp_initThreatModifier = 0.5		
	elseif (g_LOD == 1) then
		cp_minSquadGroupSize = 4*sg_ScaleComp
		cp_minSquadGroupValue = 155*sg_ScaleComp
		cp_maxGroupSize = 15*sg_ScaleComp
		cp_maxGroupValue = 200*sg_ScaleComp
		cp_forceAttackGroupSize = 11*sg_ScaleComp
		cp_initThreatModifier = 0.7
	elseif (g_LOD == 2) then
		cp_minSquadGroupSize = 5*sg_ScaleComp
		cp_minSquadGroupValue = 190*sg_ScaleComp
		cp_maxGroupSize = 16*sg_ScaleComp
		cp_maxGroupValue = 220*sg_ScaleComp
		cp_forceAttackGroupSize = 14*sg_ScaleComp
		cp_initThreatModifier = 0.9
	else								-- g_LOD 3
		cp_minSquadGroupSize = 6*sg_ScaleComp
		cp_minSquadGroupValue = 225*sg_ScaleComp
		cp_maxGroupSize = 17*sg_ScaleComp
		cp_maxGroupValue = 240*sg_ScaleComp
		cp_forceAttackGroupSize = 17*sg_ScaleComp
		cp_initThreatModifier = 1.1
	end	
	sg_reseachDemand = -sg_kDemandResetValue	
	Rule_AddInterval("doai", 2.0 )
	local temp_ai_data=ai_data
	ai_data={}
	for item,item_info in temp_ai_data do
		local sInfo=item_info
		local sItem="s"..tostring(item)
		ai_data[sItem]=sInfo
		ai_data[sItem].ID=item
	end
	temp_ai_data=nil
	Load_ClassDef({"data:ai/customclassdef.lua"})
end
