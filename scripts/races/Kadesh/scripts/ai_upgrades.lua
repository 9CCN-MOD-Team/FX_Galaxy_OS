
dout("LOADING HIIGARAN UPGRADE INFO")

rt_capital = {

}

rt_fighter = {	
	KAD_FIGHTERWEAPONUPGRADE1,
	KAD_FIGHTERWEAPONUPGRADE2,
	KAD_FIGHTERWEAPONUPGRADE3,
}

rt_corvette = {	
	KAD_CORVETTEWEAPONUPGRADE1,
	KAD_CORVETTEWEAPONUPGRADE2,
	KAD_CORVETTEWEAPONUPGRADE3,
	KAD_AIRHEALTHUPGRADE1,
	KAD_AIRHEALTHUPGRADE2,
	KAD_AIRHEALTHUPGRADE3,

}

rt_frigate = {
	KAD_SHIPWEAPONUPGRADE1,
	KAD_SHIPWEAPONUPGRADE2,
	KAD_SHIPWEAPONUPGRADE3,
	KAD_SHIPHEALTHUPGRADE1,
	KAD_SHIPHEALTHUPGRADE2,
	KAD_SHIPHEALTHUPGRADE3,

}

rt_platform = {
	KAD_PLATFORMHEALTHUPGRADE1,
	KAD_PLATFORMHEALTHUPGRADE2,
	KAD_PLATFORMHEALTHUPGRADE3,
}

function DoUpgradeDemand_Kadesh()
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
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )
		if (numFrigate > 3) or (numCapital > 3) then
			inc_upgrade_demand( rt_frigate, numFrigate )
		end
		-- do platform upgrades
		local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatform > 4) then
			inc_upgrade_demand( rt_platform, numPlatform )
		end
	end
end

function DoResearchTechDemand_Kadesh ()
end


DoUpgradeDemand = DoUpgradeDemand_Kadesh
DoResearchTechDemand = DoResearchTechDemand_Kadesh
