CloakFighterCanBeLocked=
{
	{"Ben_Corvette",5000,"",},
	{"Hgn_Mothership",7000,"HardpointSensors1",},
	{"Hgn_Carrier",5000,"HardpointSensors1",},
	{"Hgn_Shipyard",5000,"HardpointSensors1",},
	{"Hgn_GunTurret",5000,"",},
	{"Kad_GunTurret",5000,"",},
	{"Kad_VariationSwarmer",3500,"",},
	{"Kpr_Probe",10000,"",},
	{"Kus_CloakedFighter",5000,"",},
	{"Tai_DefenseFighter",5000,"",},
	{"Tur_MinelayerCorvette",5000,"",},
	{"Vgr_WeaponPlatform_Missile",5000,"",},
	{"Vgr_Probe_Prox",7000,"",}
}

function Create_CloakFighter(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("CloakFighterLocker")
	SobGroup_CreateIfNotExist("CloakFighterLocker2")
end

function Update_CloakFighter(CustomGroup, playerIndex, shipID)
	if(SobGroup_IsDoingAbility(CustomGroup, AB_Cloak)==1)then
		local iFlag=0
		for iIndex,iInfo in CloakFighterCanBeLocked do
			if(iFlag==0)then
				for iPlayerindex=0,Universe_PlayerCount()-1 do
					if(iPlayerindex~=playerIndex)then
						if(AreAllied(iPlayerindex, playerIndex)~=1)then
							Player_FillProximitySobGroup("CloakFighterLocker", iPlayerindex, CustomGroup, iInfo[2])
							SobGroup_FillShipsByType("CloakFighterLocker2", "CloakFighterLocker", iInfo[1])
							if (SobGroup_Empty("CloakFighterLocker2")==0) then
								if(iInfo[3]~="")then
									if(SobGroup_GetHardPointHealth("CloakFighterLocker2", iInfo[3])>0)then
										iFlag=1
										break
									end
								else
									iFlag=1
									break
								end
							end
						end
					end
				end
			else
				break
			end
		end
		if(iFlag==0)then
			SobGroup_SetInvulnerability(CustomGroup, 1)
		else
			SobGroup_SetInvulnerability(CustomGroup, 0)
		end
	else
		SobGroup_SetInvulnerability(CustomGroup, 0)
	end
end