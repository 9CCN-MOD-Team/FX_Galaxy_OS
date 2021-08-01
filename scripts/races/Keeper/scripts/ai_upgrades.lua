
dout("LOADING KEEPER UPGRADE INFO")

rt_fighter = {

}

rt_corvette = {
	KPR_AIRWEAPONUPGRADE1,
	KPR_AIRWEAPONUPGRADE2,
	KPR_AIRWEAPONUPGRADE3,
}

rt_frigate = {
	KPR_FRIGATEWEAPONUPGRADE1,
	KPR_FRIGATEWEAPONUPGRADE2,
	KPR_FRIGATEWEAPONUPGRADE3,
	KPR_AIHEALTHUPGRADE1,
	KPR_AIHEALTHUPGRADE2,
	KPR_AIHEALTHUPGRADE3,
}

rt_capital = {
	KPR_CAPITALWEAPONUPGRADE1,
	KPR_CAPITALWEAPONUPGRADE2,
	KPR_CAPITALWEAPONUPGRADE3,
	KPR_CAPITALHEALTHUPGRADE1,
	KPR_CAPITALHEALTHUPGRADE2,
	KPR_CAPITALHEALTHUPGRADE3,
}

rt_platform = {
	KPR_PLATFORMHEALTHUPGRADE1,
	KPR_PLATFORMHEALTHUPGRADE2,
	KPR_PLATFORMHEALTHUPGRADE3,
}


function DoUpgradeDemand_Keeper()
	if (s_militaryStrength > 10) then
		-- do corvette upgrades
		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )
		if (numCorvette > 2) then
			inc_upgrade_demand( rt_corvette, numCorvette )
		end
		-- do frigate upgrades
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if (numFrigate > 3) then
			inc_upgrade_demand( rt_frigate, numFrigate )
		end
		-- do capital upgrades
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )
		if (numCapital > 5) then
			inc_upgrade_demand( rt_capital, numCapital/2 )
		end
		-- do platform upgrades
		local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatform > 4) then
			inc_upgrade_demand( rt_platform, numPlatform )
		end
	end
end

function DoResearchTechDemand_Keeper ()
end

DoUpgradeDemand = DoUpgradeDemand_Keeper
DoResearchTechDemand = DoResearchTechDemand_Keeper
