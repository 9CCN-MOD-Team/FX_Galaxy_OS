
dout("LOADING HIIGARAN UPGRADE INFO")

rt_capital = {
	TAI_CAPITALWEAPONUPGRADE1,
	TAI_CAPITALWEAPONUPGRADE2,
	TAI_CAPITALWEAPONUPGRADE3,
	TAI_CAPITALHEALTHUPGRADE1,
	TAI_CAPITALHEALTHUPGRADE2,
	TAI_CAPITALHEALTHUPGRADE3,
}

rt_fighter = {	
	--FIGHTERSPEEDUPGRADE1,
	--FIGHTERSPEEDUPGRADE2,
}

rt_corvette = {	
	TAI_AIRWEAPONUPGRADE1,
	TAI_AIRWEAPONUPGRADE2,
	TAI_AIRWEAPONUPGRADE3,
	TAI_AIRHEALTHUPGRADE1,
	TAI_AIRHEALTHUPGRADE2,
	TAI_AIRHEALTHUPGRADE3,
}

rt_frigate = {
	TAI_FRIGATEWEAPONUPGRADE1,
	TAI_FRIGATEWEAPONUPGRADE2,
	TAI_FRIGATEWEAPONUPGRADE3,
	TAI_FRIGATEHEALTHUPGRADE1,
	TAI_FRIGATEHEALTHUPGRADE2,
	TAI_FRIGATEHEALTHUPGRADE3,
}

rt_collector = {
	--UTILITYHEALTHUPGRADE1,
	--UTILITYHEALTHUPGRADE2,
}

function DoUpgradeDemand_Taiidan()
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

function DoResearchTechDemand_Taiidan ()
end

DoUpgradeDemand = DoUpgradeDemand_Taiidan
DoResearchTechDemand = DoResearchTechDemand_Taiidan
