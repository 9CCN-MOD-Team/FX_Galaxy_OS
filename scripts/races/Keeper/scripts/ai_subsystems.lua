function DoSubSystemDemand_Keeper()
        if (NumSquadrons(KPR_BALCORAGATE) > 0) and (NumSquadrons(KPR_ENERGY_PHOTONBOMB) > 0) then
                 SubSystemDemandSet(BUILD,1.5)
        end
        local numRUs = GetRU()
        if (NumSquadrons(KPR_BALCORAGATE) > 0) and (NumSubSystems(BUILD) > 0) and (numRUs > 1000) then
                 SubSystemDemandSet(HYPERSPACE,1.5)
        end
        local numRUs = GetRU()
        if (NumSquadrons(KPR_BALCORAGATE) > 0) and (NumSubSystems(HYPERSPACE) > 0) and (NumSquadrons(KPR_ENERGY_PHASEDCANNON) > 0) and (numRUs > 2500) then
                 SubSystemDemandSet(CORE,1.5)
        end       
end

CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Keeper