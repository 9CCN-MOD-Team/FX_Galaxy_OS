
dout("LOADING HIIGARAN UPGRADE INFO")

function DoUpgradeDemand_Bentusi()
end

function DoResearchTechDemand_Bentusi ()
	if (Util_CheckResearch(HEAVYFIGHTERTECH)) then
		local fidemand = ShipDemandGet(kInterceptor)
		if (fidemand > 0) then
			ResearchDemandSet( HEAVYFIGHTERTECH, fidemand+0.5 )
		end
	end
	ResearchDemandSet( FRIGATETECH, frdemand+0.5 )
	if (Util_CheckResearch(IONCANNONTECH)) then
		local frdemand = ShipDemandGet(BEN_IONCANNONFRIGATE)
		if (frdemand > 0) then
			ResearchDemandSet( IONCANNONTECH, frdemand )
		end
	end
        if IsResearchDone(FRIGATETECH)==1 then
                ResearchDemandAdd(CAPITALTECH,1)
        end
        if IsResearchDone(IONCANNONTECH)==1 then
                ResearchDemandAdd(IMPROVEDIONCANNON,1)
        end
	if (Util_CheckResearch(SUPERCAPTECH)) then
		local bcdemand = ShipDemandGet(kBattleCruiser)
		if (bcdemand > 0) then
			ResearchDemandSet( SUPERCAPTECH, bcdemand+0.5 )
		end
	end   
end

DoUpgradeDemand = DoUpgradeDemand_Bentusi
DoResearchTechDemand = DoResearchTechDemand_Bentusi


