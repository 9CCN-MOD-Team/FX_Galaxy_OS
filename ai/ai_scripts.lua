dofilepath("data:ai/data_reader.lua")

function FX_AI_OutputPath(iPlayer,iFile)
	return iFile.."_"..Race_GetName(Player_GetRace(iPlayer))..".lua"
end

function FX_AI_DoFilePath(iPlayer,iFile)
	return "player:"..iFile.."_"..Race_GetName(Player_GetRace(iPlayer))..".lua"
end

dofilepath("data:ai/oldfunctions.lua")

function FX_AI_Init(iAutoConfig,iAutoClassdef)
	SobGroup_Create("FXAITempGroup")
	Rule_AddInterval("FX_AI_Script",1)
	CheckAIData(iAutoConfig)
	if iAutoClassdef==1 then
		CreateClassDef()
	end
end

function FX_AI_Script()
	for iPlayer=0,Universe_PlayerCount()-1 do
		if (Player_GetLevelOfDifficulty(iPlayer)>0)and(Player_IsAlive(iPlayer)==1) then
			SobGroup_Clear("FXAITempGroup")
			SobGroup_GetSobGroupBeingCapturedGroup("Player_Ships"..iPlayer, "FXAITempGroup")
			if (SobGroup_Empty("FXAITempGroup")==0) then
				CPU_SetDefendTargetCapturePriority(iPlayer, CPU_AddDefendSobGroup(iPlayer, "FXAITempGroup", 100))
			end
		end
	end
end

function CreateClassDef()
	local FileTable="{"
	for iPlayer=0,Universe_PlayerCount()-1 do
		FX_AI_ClassDef(iPlayer)
		FileTable=FileTable.."\""..FX_AI_DoFilePath(iPlayer,"AutoClassDef").."\","
	end
	FileTable=FileTable.."}"
	for iPlayer=0,Universe_PlayerCount()-1 do
		if (Player_GetLevelOfDifficulty(iPlayer)>0)and(Player_IsAlive(iPlayer)==1) then
			CPU_DoString(iPlayer,"Load_ClassDef("..FileTable..")")
		end
	end
end

function CheckAIData(iAutoConfig,iAutoClassdef)
	for iPlayer=0,Universe_PlayerCount()-1 do
		if (Player_GetLevelOfDifficulty(iPlayer)>0)and(iAutoConfig==1) then
			local path_ai=PlayerRace_GetString(iPlayer,"path_ai", "")
			if(path_ai=="")then
				CreateAutoAIData(iPlayer)
				CPU_DoString(iPlayer,"oninit(\""..FX_AI_DoFilePath(iPlayer,"AutoAIData").."\")")
			else
				dofilepath(path_ai)
				if(ai_data==nil)then
					CreateAutoAIData(iPlayer)
					CPU_DoString(iPlayer,"oninit(\""..FX_AI_DoFilePath(iPlayer,"AutoAIData").."\")")
				end
			end
		end
	end
end

function FX_AI_ClassDef(iPlayer)
	if (writeto and writeto(FX_AI_OutputPath(iPlayer,"AutoClassDef"))~=nil) then
		write("")
		writeto()
	end
	if (appendto and appendto(FX_AI_OutputPath(iPlayer,"AutoClassDef"))~=nil) then
		dofilepath(PlayerRace_GetString(iPlayer,"path_build",""))
		for Index,Item in build do
			local iData=GetItemData(Item.Type,Item.ThingToBuild)
			if Item.Type==Ship then
				write("Custom_ClassDef["..strupper(Item.ThingToBuild).."]={")
				write(FX_AI_IsCollector(iData))
				write(FX_AI_IsRefinery(iData))
				write(FX_AI_IsBuilder(iData))
				write(FX_AI_IsDropOff(iData))
				write(FX_AI_IsSalvageDropOff(iData))
				write(FX_AI_IsFighter(iData))
				write(FX_AI_IsCorvette(iData))
				write(FX_AI_IsFrigate(iData))
				write(FX_AI_IsCapture(iData))
				write(FX_AI_IsShield(iData))
				write(FX_AI_IsPlatform(iData))
				write(FX_AI_IsAntiFighter(iData))
				write(FX_AI_IsAntiCorvette(iData))
				write(FX_AI_IsAntiFrigate(iData))
				write(FX_AI_IsCapital(iData))
				write(FX_AI_IsNonThreat(iData))
				write(FX_AI_IsHyperspaceGate(iData))
				write(FX_AI_IsBattleCruiser(iData))
				write(FX_AI_IsDestroyer(iData))
				write("}\n")
			end
		end
		writeto()
	end
end

function FX_AI_IsCollector(iData)
	if iData.ability.Harvest~=nil then
		return "eCollector,"
	else
		return ""
	end
end

function FX_AI_IsRefinery(iData)
	local iReturn=""
	if iData.ability.ShipHold~=nil and iData.ability.CanBuildShips==nil then
		if iData.ability.ShipHold[2]>0 then
			iReturn="eRefinery,"
		end
	end
	return iReturn
end

function FX_AI_IsBuilder(iData)
	if iData.ability.CanBuildShips~=nil then
		return "eBuilder,"
	else
		return ""
	end
end

function FX_AI_IsDropOff(iData)
	local iReturn=""
	if iData.ability.ShipHold~=nil then
		if iData.ability.ShipHold[2]>0 then
			iReturn="eDropOff,"
		end
	end
	return iReturn
end

function FX_AI_IsSalvageDropOff(iData)
	local iReturn=""
	if iData.ability.CanBuildShips~=nil then
		if iData.ability.ShipHold~=nil then
			if iData.ability.ShipHold[2]>0 then
				iReturn="eSalvageDropOff,"
			end
		end
	end
	return iReturn
end

function FX_AI_IsFighter(iData)
	if iData.DisplayFamily == "Fighter" then
		return "eFighter,"
	else
		return ""
	end
end

function FX_AI_IsCorvette(iData)
	if iData.DisplayFamily == "Corvette" then
		return "eCorvette,"
	else
		return ""
	end
end

function FX_AI_IsFrigate(iData)
	if iData.DisplayFamily == "Frigate" then
		return "eFrigate,"
	else
		return ""
	end
end

function FX_AI_IsCapture(iData)
	if iData.ability.CaptureCommand~=nil then
		return "eCapture,"
	else
		return ""
	end
end

function FX_AI_IsShield(iData)
	if iData.ability.DefenseFieldAbility~=nil or iData.ability.MagneticField~=nil then
		return "eShield,"
	else
		return ""
	end
end

function FX_AI_IsPlatform(iData)
	if iData.DisplayFamily == "Platform" then
		return "ePlatform,"
	else
		return ""
	end
end

function FX_AI_IsAntiFighter(iData)
	if iData.antiFighterValue > iData.antiCorvetteValue+iData.antiFrigateValue and iData.antiFighterValue > 0.5*iData.totalValue then
		return "eAntiFighter,"
	else
		return ""
	end
end

function FX_AI_IsAntiCorvette(iData)
	if iData.antiCorvetteValue > iData.antiFighterValue+iData.antiFrigateValue and iData.antiCorvetteValue > 0.5*iData.totalValue  then
		return "eAntiCorvette,"
	else
		return ""
	end
end

function FX_AI_IsAntiFrigate(iData)
	if iData.antiFrigateValue > iData.antiCorvetteValue+iData.antiFighterValue and iData.antiFrigateValue > 0.5*iData.totalValue  then
		return "eAntiFrigate,"
	else
		return ""
	end
end

function FX_AI_IsCapital(iData)
	if iData.DisplayFamily == "Capital" then
		return "eCapital,"
	else
		return ""
	end
end

function FX_AI_IsNonThreat(iData)
	local iReturn=""
	local iHPWeapon=0
	if iData.Hardpoint~=nil then
		for HPName,HPData in iData.Hardpoint do
			if HPData.HardpointType=="Weapon" then
				iHPWeapon=1
				break
			end
		end
	end
	if iData.Weapon==nil and iHPWeapon==0 then
		iReturn="eNonThreat,"
	end
	return iReturn
end

function FX_AI_IsHyperspaceGate(iData)
	if iData.ability.FormHyperspaceGateCommand~=nil then
		return "eHyperspaceGate,"
	else
		return ""
	end
end

function FX_AI_IsDestroyer(iData)
	local iReturn=""
	if (iData.UnitCap=={}) then
		if iData.UnitCapsShipType=="Destroyer" then
			iReturn="eDestroyer,"
		end
	else
		if iData.UnitCap.Destroyer~=nil then
			iReturn="eDestroyer,"
		end
	end
	return iReturn
end

function FX_AI_IsBattleCruiser(iData)
	local iReturn=""
	if (iData.UnitCap=={}) then
		if iData.UnitCapsShipType=="Battlecruiser" then
			iReturn="eBattleCruiser,"
		end
	else
		if iData.UnitCap.BattleCruiser~=nil then
			iReturn="eBattleCruiser,"
		end
	end
	return iReturn
end

function FX_AI_GetRequirement(iRR,iRSS,iFSS,iSub)
	local iRequirement={}
	if iRR==nil then
		iRR=""
	end
	if iRSS==nil then
		iRSS=""
	end
	if iFSS==nil then
		iFSS=""
	end
	local iReturn={{},{},{}}
	iRequirement[1]=gsub(strupper(iRR), " ", "")
	iRequirement[2]=gsub(strupper(iRSS), " ", "")
	iRequirement[3]=gsub(strupper(iFSS), " ", "")
	for i=1,3 do
		local iMode1=0
		local iMode2=0
		local iPing1=1
		local iPing2=1
		local iGet=1
		while iPing1<=strlen(iRequirement[i]) do
			local iStr=strsub(iRequirement[i], iPing1, iPing1)
			if (iStr=="!")or(iStr=="&")or(iStr=="|")or(iStr=="(")or(iStr==")") then
				iGet=iGet+1
			else
				iGet=0
			end
			if iGet>=1 then
				if iGet==1 then
					local iRequire=strsub(iRequirement[i], iPing2, iPing1-1)
					tinsert(iReturn[iMode1+1],iRequire)
					if i==2 then
						tinsert(iReturn[3],iRequire)
					end
				end
				iPing2=iPing1+1
			end
			if iStr=="!"  then
				iMode1=1-iMode1
			elseif (iStr=="&"or iStr=="|") and iMode1==1 and iMode2==0 then
				iMode1=0
			elseif iStr=="(" then
				iMode2=iMode2+1
			elseif iStr==")" then
				iMode2=iMode2-1
			end
			iPing1=iPing1+1
		end
		if iGet==0 and iRequirement[i]~="" then
			local iRequire=strsub(iRequirement[i], iPing2, iPing1-1)
			tinsert(iReturn[iMode1+1],iRequire)
			if i==2 then
				tinsert(iReturn[3],iRequire)
			end
		end
	end
	iReturn[1].n=nil
	iReturn[2].n=nil
	return iReturn
end

function FX_AI_GetUpgrades(iShip,iFamily,iResearch)
	local iReturn={}
	for iIndex,iItem in iResearch do
		if (strupper(iItem.TargetType==AllShips)and(iItem.UpgradeValue~=nil)) then
			tinsert(iReturn,strupper(iItem.Name))
		elseif (strupper(iItem.TargetName)==strupper(iShip) or strupper(iItem.TargetName)==strupper(iFamily))and(iItem.UpgradeValue~=nil) then
			tinsert(iReturn,strupper(iItem.Name))
		end
	end
	iReturn.n=nil
	return iReturn
end

function CreateAutoAIData(iPlayer)
	dofilepath(PlayerRace_GetString(iPlayer,"path_research",""))
	local temp_ai_data={}
	local l_Collector=""
	for Index,Item in research do
		if (Player_ResearchOptionIsComplete(iPlayer,Item.Name)==0)and(Player_ResearchOptionIsRestricted(iPlayer,Item.Name)==0) then
			if (Item.UpgradeValue==nil) then
				temp_ai_data[strupper(Item.Name)]={}
				temp_ai_data[strupper(Item.Name)].BasicDemand=1
				temp_ai_data[strupper(Item.Name)].Require=FX_AI_GetRequirement(Item.RequiredResearch,"",Item.RequiredSubSystems,iSub)
				temp_ai_data[strupper(Item.Name)].Type="Research"
				temp_ai_data[strupper(Item.Name)].Name=Item.Name
			end
		end
	end
	dofilepath(PlayerRace_GetString(iPlayer,"path_build",""))
	for Index,Item in build do
		local iData=GetItemData(Item.Type,Item.ThingToBuild)
		if (Player_BuildOptionIsRestricted(iPlayer,Item.ThingToBuild)==0) then
			if Item.Type==Ship then
				local iName=strupper(Item.ThingToBuild)
				temp_ai_data[iName]={}
				temp_ai_data[iName].Type="Ship"
				temp_ai_data[iName].UpgradeDemand=1
				temp_ai_data[iName].BasicDemand=1
				if iData.UnitCapsShipType~=nil then
					temp_ai_data[iName].UnitCap=iData.UnitCapsShipType
				elseif iData.UnitCapsFamily~=nil then
					temp_ai_data[iName].UnitCap=iData.UnitCapsFamily
				else
					local iUnitCap=GetUnitCapData(iPlayer)
					local minUnitCap=0
					for iFamily,iValue in iData.UnitCap do
						if (iUnitCap[strupper(iFamily)]~=nil) then
							if (iUnitCap[strupper(iFamily)]<minUnitCap)or(minUnitCap==0) then
								temp_ai_data[iName].UnitCap=iFamily
								minUnitCap=iUnitCap[strupper(iFamily)]
							end
						end
					end
				end
				if iData.ability.CanBuildShips~=nil then --只要有建造能力默认同时有造船和子系统的能力，影响AI判断生产线数量
					temp_ai_data[iName].BuildShipChannel=1
					temp_ai_data[iName].BuildSubsystemChannel=1
				else
					temp_ai_data[iName].BuildShipChannel=0
					temp_ai_data[iName].BuildSubsystemChannel=0
				end
				temp_ai_data[iName].Require=FX_AI_GetRequirement(Item.RequiredResearch,Item.RequiredShipSubSystems,Item.RequiredFleetSubSystems,iSub)
				temp_ai_data[iName].Upgrades=FX_AI_GetUpgrades(Item.ThingToBuild,iData.DisplayFamily,research)
				if iData.ability.Harvest~=nil then
					l_Collector=iName
				end
				temp_ai_data[iName].Name=Item.ThingToBuild
			elseif Item.Type==SubSystem then
				local iName=strupper(iData.typeString)
				if temp_ai_data[iName]==nil then
					temp_ai_data[iName]={}
					temp_ai_data[iName].Type="Subsystem"
					temp_ai_data[iName].BasicDemand=1
					temp_ai_data[iName].IsForFleet=1 --默认非全域子系统，AI可能会建造过量的全域子系统
					temp_ai_data[iName].Require=FX_AI_GetRequirement(Item.RequiredResearch,Item.RequiredShipSubSystems,Item.RequiredFleetSubSystems,iSub)
					temp_ai_data[iName].Name=iData.typeString
				end
			end
		end
	end
	FX_AI_SearchForInnateSub(temp_ai_data)
	if (writeto and writeto(FX_AI_OutputPath(iPlayer,"AutoAIData"))~=nil) then
		write("")
		writeto()
	end
	if (appendto and appendto(FX_AI_OutputPath(iPlayer,"AutoAIData")) ~= nil) then
		write("function Override_Init()\n")
		write("\tsg_dobuild = 1\n")
		write("\tsg_dosubsystems = "..PlayerRace_GetNumber(iPlayer,"cfg_buildable_subsystems",1).."\n")
		write("\tsg_doresearch = 1\n")
		write("\tsg_doupgrades = 1\n")
		write("\tsg_domilitary = 1\n")
		write("\tsg_fightersize="..PlayerRace_GetNumber(iPlayer,"persona_demand_scale_fighters",1).."\n")
		write("\tsg_corvettesize="..PlayerRace_GetNumber(iPlayer,"persona_demand_scale_corvettes",1).."\n")
		write("\tsg_frigatesize="..PlayerRace_GetNumber(iPlayer,"persona_demand_scale_frigates",1).."\n")
		write("\tsg_kDemandResetValue = 4\n")
		write("\tsg_kCollector = "..l_Collector.."\n")
		write("\tsg_classPersonalityDemand[ eFighter ] = "..(10*PlayerRace_GetNumber(iPlayer,"persona_class_demand_fighter",0.5)).."\n")
		write("\tsg_classPersonalityDemand[ eCorvette ] = "..(10*PlayerRace_GetNumber(iPlayer,"persona_class_demand_corvette",0.5)).."\n")
		write("\tsg_classPersonalityDemand[ eFrigate ] = "..(10*PlayerRace_GetNumber(iPlayer,"persona_class_demand_frigate",0.5)).."\n")
		write("\tsg_classPersonalityDemand[ ePlatform ] = -5\n")
		write("\tSetResourceDockFamily(\"Utility\")\n")
		write("\tsg_numCollectorPerChannel=4\n")
		write("\tsg_RUsPerChannel=500\n")
		write("\tsg_ForceBuilderRU="..(2000+PlayerRace_GetNumber(iPlayer,"persona_rus_for_builder",0)).."\n")
		write("\tsg_militaryDemand = 1\n")
		write("\tsg_subSystemDemand = 0\n")
		write("\tsg_shipDemand = 4\n")
		write("\tsg_militaryToBuildPerCollector = 1\n")
		write("\tsg_debug=0\n")
		write("end\n")
		write("ai_data={}\n")
		for iName,Item in temp_ai_data do
			if temp_ai_data[iName].Type=="Research" then
				write("ai_data["..iName.."]=\n")			
				write("{\n")
				write("\tType=\"Research\",\n")
				write("\tName=\""..temp_ai_data[iName].Name.."\",\n")
				write("\tRequire={")
				for iIndex,iItem in Item.Require[1] do
					if iItem~="" then
						write(iItem..",")
					end
				end
				for iIndex,iItem in Item.Require[2] do
					if iItem~="" then
						write("-"..iItem..",")
					end
				end
				write("},\n")
				write("\tBasicDemand="..Item.BasicDemand..",\n")
				write("}\n")
			elseif temp_ai_data[iName].Type=="Ship" then
				write("ai_data["..iName.."]=\n")			
				write("{\n")
				write("\tType=\"Ship\",\n")
				write("\tName=\""..temp_ai_data[iName].Name.."\",\n")
				write("\tRequire={")
				for iIndex,iItem in Item.Require[1] do
					if iItem~="" then
						write(iItem..",")
					end
				end
				for iIndex,iItem in Item.Require[2] do
					if iItem~="" then
						write("-"..iItem..",")
					end
				end
				write("},\n")
				write("\tUpgrades={")
				for iIndex,iItem in Item.Upgrades do
					write(iItem..",")
				end
				write("},\n")
				if Item.UpgradeSubsystem~=nil then
					write("\tUpgradeSubsystem=\n")
					write("\t{\n")
					for iIndex,iItem in Item.UpgradeSubsystem do
						write("\t\t{")
						for jIndex,jItem in iItem do
							write(jItem..",")
						end
						write("},\n")
					end
					write("\t},\n")
				end
				write("\tUpgradeDemand="..Item.UpgradeDemand..",\n")
				write("\tBasicDemand="..Item.BasicDemand..",\n")
				write("\tUnitCap=\""..Item.UnitCap.."\",\n")
				write("\tBuildShipChannel="..Item.BuildShipChannel..",\n")
				write("\tBuildSubsystemChannel="..Item.BuildSubsystemChannel..",\n")
				write("}\n")
			elseif temp_ai_data[iName].Type=="Subsystem" then
				write("ai_data["..iName.."]=\n")			
				write("{\n")
				write("\tType=\"Subsystem\",\n")
				write("\tName=\""..temp_ai_data[iName].Name.."\",\n")
				write("\tRequire={")
				for iIndex,iItem in Item.Require[1] do
					if iItem~="" then
						write(iItem..",")
					end
				end
				for iIndex,iItem in Item.Require[2] do
					if iItem~="" then
						write("-"..iItem..",")
					end
				end
				write("},\n")
				write("\tBasicDemand="..Item.BasicDemand..",\n")
				write("\tIsForFleet="..Item.IsForFleet..",\n")
				write("}\n")
			end
		end
		writeto()
	end
end

function FX_AI_SearchForInnateSub(iData)
	for iName,Item in iData do
		for iIndex,iRequire in Item.Require[1] do
			if (iData[iRequire]==nil) then
				for jName,jItem in iData do
					if jItem.Type=="Ship" then
						local jData=GetItemData(0,jName)
						if jData.Hardpoint~=nil then
							for iHardpoint,iHPData in jData.Hardpoint do
								local iString=GetItemData(1,iHPData.Innate,"typeString")
								if iString~=nil then
									if strupper(iString)==iRequire then
										tinsert(Item.Require[1],jName)
										Item.Require[1].n=nil
									end
								end
							end
						end
					end
				end
				Item.Require[1][iIndex]=""
			end
		end
		for iIndex,iRequire in Item.Require[3] do
			if (iData[iRequire]~=nil) then
				if iData[iRequire].Type=="Subsystem" then
					iData[iRequire].IsForFleet=0
				end
			end
		end
		if Item.Type=="Ship" then
			local jData=GetItemData(0,iName,"Hardpoint")
			if jData~=nil then
				Item.UpgradeSubsystem={}
				for iHardpoint,iHPData in jData do
					if iHPData.Subs~=nil then
						tinsert(Item.UpgradeSubsystem,{})
						local iFlag=0
						for iIndex,iSub in iHPData.Subs do
							local iString=GetItemData(1,iSub,"typeString")
							if iString~=nil then
								if iData[strupper(iString)]~=nil then
									tinsert(Item.UpgradeSubsystem[Item.UpgradeSubsystem.n],strupper(iString))
									iFlag=1
								end
							end
						end
						if iFlag==1 and getn(Item.UpgradeSubsystem[Item.UpgradeSubsystem.n])>1 then
							tinsert(Item.UpgradeSubsystem[Item.UpgradeSubsystem.n],1,1)
							Item.UpgradeSubsystem[Item.UpgradeSubsystem.n].n=nil
						else
							Item.UpgradeSubsystem[Item.UpgradeSubsystem.n]=nil
						end
					end
				end
				if Item.UpgradeSubsystem[1]==nil then
					Item.UpgradeSubsystem=nil
				else
					Item.UpgradeSubsystem.n=nil
				end
			end
		end
	end
end