
dout("LOADING HIIGARAN UPGRADE INFO")

rt_capital = {
	Tur_CapitalWeaponUpgrade1,
	Tur_CapitalWeaponUpgrade2,
	Tur_CapitalWeaponUpgrade3,
}

rt_fighter = {	
	Tur_LightWeaponUpgrade1,
	Tur_LightWeaponUpgrade2,
	Tur_LightWeaponUpgrade3,
}

rt_corvette = {	
	Tur_HeavyWeaponUpgrade1,
	Tur_HeavyWeaponUpgrade2,
	Tur_HeavyWeaponUpgrade3,
	Tur_AirHealthUpgrade1,
	Tur_AirHealthUpgrade2,
	Tur_AirHealthUpgrade3,
}

rt_frigate = {
	Tur_FrigateHealthUpgrade1,
	Tur_FrigateHealthUpgrade2,
	Tur_FrigateHealthUpgrade3,
}

rt_collector = {
	Tur_UtilityHealthUpgrade1,
	Tur_UtilityHealthUpgrade2,
	Tur_UtilityHealthUpgrade3,
}


function DoUpgradeDemand_Turanic()
	if (s_militaryStrength > 10) then
		-- do fighter upgrades
		local numFighter = numActiveOfClass( s_playerIndex, eFighter )
		if (numFighter > 2) then
			inc_upgrade_demand( rt_fighter, numFighter )
		end
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
		if (numCapital > 4) then
			inc_upgrade_demand( rt_capital, numCapital/2 )
		end
	end
end

function DoResearchTechDemand_Turanic ()
end

DoUpgradeDemand = DoUpgradeDemand_Turanic
DoResearchTechDemand = DoResearchTechDemand_Turanic
