function DoSubSystemDemand_Kadesh()
       SubSystemDemandSet(FIGHTERPRODUCTION,1)
       local anfidemand = ShipDemandMaxByClass(eAntiFrigate)
       if NumSubSystems(FIGHTERPRODUCTION) > 0 then
       		if(ShipDemandGet(KAD_ARANEID) > 0)then
          		SubSystemDemandSet(PLATFORMPRODUCTION,0.5)
          end
          if(anfidemand>0)then
          		SubSystemDemandSet(PLASMABOMB,1)
          end
              SubSystemDemandSet(FRIGATEPRODUCTION,1.5)
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and (NumSquadrons(KAD_MOTHERSHIP) > 0) then
               SubSystemDemandSet(CAPSHIP,1)
       end
       if (ShipDemandGet(KAD_VARIATIONSWARMER) > 0) and (NumSubSystems(CAPSHIP) > 0) then
               SubSystemDemandSet(CORVETTEPRODUCTION,1.5)
       end
       if (NumSubSystems(CAPSHIP) > 0) and (NumSquadrons(KAD_MOTHERSHIP) > 0) then
               SubSystemDemandSet(CAPSHIPPRODUCTION,1.5)
       end
       if (NumSubSystems(CAPSHIP) > 0) and (NumSquadrons(KAD_MOTHERSHIP) > 0) then
               SubSystemDemandSet(CAPSHIPADVANCED,1)
       end
       if (NumSubSystems(CAPSHIPADVANCED) > 0) and (ShipDemandGet(KAD_ADVANCEDSWARMER) > 0.5) then
               SubSystemDemandSet(CLUSTERGUN,1.5)
       end
       if (NumSubSystems(CAPSHIPADVANCED) > 0) then
               SubSystemDemandSet(IONCANNON,1)
       end
       local anfrdemand = ShipDemandMaxByClass(eAntiFrigate)
       if anfrdemand >2 then
               SubSystemDemandSet(MISSILE,1)
       end
end

CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Kadesh