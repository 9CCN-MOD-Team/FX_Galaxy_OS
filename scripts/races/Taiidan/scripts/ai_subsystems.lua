function DoSubSystemDemand_Taiidan()
       if NumSquadrons(TAI_RESEARCHSTATION) > 0 then
               SubSystemDemandSet(FRIGATEPRODUCTION,2.5)
       end
       if NumSquadrons(TAI_RESEARCHSTATION) > 0 then
               if NumSubSystems(FRIGATEPRODUCTION) > 0 then
                      SubSystemDemandSet(DEFENSE,1)
               end
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and (ShipDemandGet(kDestroyer) > 0) then
               SubSystemDemandSet(CAPSHIPPRODUCTION,1)
       end
       if (NumSubSystems(CAPSHIPPRODUCTION) > 0) and (ShipDemandGet(kBattleCruiser) > 0) then
               SubSystemDemandSet(HEAVYGUN,1.5)
       end
       if (NumSubSystems(CAPSHIPPRODUCTION) > 0) and (ShipDemandGet(TAI_MISSILEDESTROYER) > 0.5) then
               SubSystemDemandSet(MISSILE,1)
       end
       local numRUs = GetRU()
       if ((numRUs > 1000) or (NumSquadrons(TAI_DESTROYER) > 0)) and (NumSquadrons(TAI_RESEARCHSTATION) > 0)then
               SubSystemDemandSet(HYPERSPACE,2.5)
       end
       if (NumSubSystems(HYPERSPACE) > 0) then
               SubSystemDemandSet(SENSORARRAY,1)
       end
end

CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Taiidan