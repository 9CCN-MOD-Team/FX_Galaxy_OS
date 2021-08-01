function DoSubSystemDemand_Turanic()
       SubSystemDemandSet(FIGHTERPRODUCTION,0.5)
       if ShipDemandGet(TUR_ATTACKBOMBER) > 0.5 or ShipDemandMaxByClass( eAntiFighter ) > 0.5 then
               SubSystemDemandSet(LIGHTWEAPON,1)
       end
       if ShipDemandMaxByClass( eAntiCorvette ) > 1 then
               SubSystemDemandSet(HEAVYWEAPON,1)
       end
       if (NumSubSystems(LIGHTWEAPON) > 0) and (NumSubSystems(HEAVYWEAPON) > 0) then
               SubSystemDemandSet(FRIGATEPRODUCTION,1.5)
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and ((ShipDemandGet(TUR_TORPEDOCORVETTE) > 0.5) or (ShipDemandGet(TUR_IONARRAYFRIGATE) > 0.5)) then
               SubSystemDemandSet(FRIGATEADVANCED,1.5)
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and (ShipDemandGet(TUR_SIEGEDRILLFRIGATE) > 0.5) then
               SubSystemDemandSet(FRIGATECAPTURE,1.5)
       end
       if (NumSubSystems(FRIGATEPRODUCTION) > 0) and (ShipDemandMaxByClass(eCapital) > 0.5) then
               SubSystemDemandSet(CAPSHIPPRODUCTION,1.5)
       end
       if (NumSubSystems(CAPSHIPPRODUCTION) > 0) and (NumSquadrons(TUR_SHIPYARD) > 0) then
               SubSystemDemandSet(HEAVYGUNARRAY,1)
       end
       if (NumSubSystems(HEAVYGUNARRAY) > 0) and (ShipDemandGet(kBattleCruiser) > 0.5) then
               SubSystemDemandSet(CAPSHIPADVANCED,1.5)
       end
       if (NumSubSystems(CAPSHIPADVANCED) > 0) and (NumSquadrons(kBattleCruiser) > 0) then
               SubSystemDemandSet(BCIONBEAMTURRET,1.5)
       end
end

CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Turanic