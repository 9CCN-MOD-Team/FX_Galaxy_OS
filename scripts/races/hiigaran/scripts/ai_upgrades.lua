
dout("LOADING HIIGARAN UPGRADE INFO")

rt_fighter = {
	HGN_AIRWEAPONUPGRADE1,
	HGN_AIRWEAPONUPGRADE2,
	HGN_AIRWEAPONUPGRADE3,
	HGN_AIRHEALTHUPGRADE1,
	HGN_AIRHEALTHUPGRADE2,
	HGN_AIRHEALTHUPGRADE3,
}

rt_corvette = {
	
}

rt_frigate = {
	HGN_SHIPWEAPONUPGRADE1,
	HGN_SHIPWEAPONUPGRADE2,
	HGN_SHIPWEAPONUPGRADE3,
	HGN_SHIPHEALTHUPGRADE1,
	HGN_SHIPHEALTHUPGRADE2,
	HGN_SHIPHEALTHUPGRADE3,
}

rt_capital = {
	HGN_CAPITALHEALTHUPGRADE1,
	HGN_CAPITALHEALTHUPGRADE2,
	HGN_CAPITALHEALTHUPGRADE3,
}

rt_platform = {
	HGN_PLATFORMWEAPONUPGRADE1,
	HGN_PLATFORMWEAPONUPGRADE2,
	HGN_PLATFORMWEAPONUPGRADE3,
}

function DoUpgradeDemand_Hiigaran()
	local numFighter = numActiveOfClass( s_playerIndex, eFighter )+numActiveOfClass( s_playerIndex, eCorvette )
	if (numFighter > 2) then
		inc_upgrade_demand( rt_fighter, numFighter )
	end
	local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )+numActiveOfClass( s_playerIndex, eCapital )
	if (numFrigate > 3) then
		inc_upgrade_demand( rt_frigate, numFrigate*1 )
	end
	local numCapital = numActiveOfClass( s_playerIndex, eCapital )
	if (numCapital > 1) then
		inc_upgrade_demand( rt_capital, numCapital*0.5 )
	end	
	local numPlatforms = numActiveOfClass( s_playerIndex, ePlatform )
	if (numPlatforms > 0) then
		inc_upgrade_demand( rt_platform, numPlatforms*1 )
	end
end

function DoResearchTechDemand_Hiigaran()
end

DoUpgradeDemand = DoUpgradeDemand_Hiigaran
DoResearchTechDemand = DoResearchTechDemand_Hiigaran
