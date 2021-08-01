
dout("LOADING HIIGARAN UPGRADE INFO")

rt_capital = {
	KUS_CAPITALWEAPONUPGRADE1,
	KUS_CAPITALWEAPONUPGRADE2,
	KUS_CAPITALWEAPONUPGRADE3,
	KUS_CAPITALHEALTHUPGRADE1,
	KUS_CAPITALHEALTHUPGRADE2,
	KUS_CAPITALHEALTHUPGRADE3,
}

rt_fighter = {	
	--FIGHTERSPEEDUPGRADE1,
	--FIGHTERSPEEDUPGRADE2,
}

rt_corvette = {	
	KUS_AIRWEAPONUPGRADE1,
	KUS_AIRWEAPONUPGRADE2,
	KUS_AIRWEAPONUPGRADE3,
	KUS_AIRHEALTHUPGRADE1,
	KUS_AIRHEALTHUPGRADE2,
	KUS_AIRHEALTHUPGRADE3,
}

rt_frigate = {
	KUS_FRIGATEWEAPONUPGRADE1,
	KUS_FRIGATEWEAPONUPGRADE2,
	KUS_FRIGATEWEAPONUPGRADE3,
	KUS_FRIGATEHEALTHUPGRADE1,
	KUS_FRIGATEHEALTHUPGRADE2,
	KUS_FRIGATEHEALTHUPGRADE3,
}

rt_collector = {
	--UTILITYHEALTHUPGRADE1,
	--UTILITYHEALTHUPGRADE2,
}

function DoUpgradeDemand_Kushan()
	if (s_militaryStrength > 10) then
		-- do corvette upgrades
		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )
		if (numCorvette > 2) then
			inc_upgrade_demand( rt_corvette, numCorvette )
		end
		
		-- do frigate upgrades
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if (numFrigate > 2) then
			inc_upgrade_demand( rt_frigate, numFrigate )
		end
		-- do capital upgrades
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )
		if (numCapital > 5) then
			inc_upgrade_demand( rt_capital, numCapital/2 )
		end
	end
end

function DoResearchTechDemand_Kushan ()
end

DoUpgradeDemand = DoUpgradeDemand_Kushan
DoResearchTechDemand = DoResearchTechDemand_Kushan
