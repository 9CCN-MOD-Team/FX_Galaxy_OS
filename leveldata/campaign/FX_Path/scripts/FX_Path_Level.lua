FXP_StartingFleet=
{
	Hiigaran={"hgn_mothership","hgn_carrier",},
	Vaygr={"vgr_mothership","vgr_carrier",},
	Taiidan={"tai_mothership","tai_carrier","tai_researchship"},
	Turanic={"tur_shipyard","tur_carrier",},
	Keeper={"kpr_balcoragate","kpr_deliver","kpr_carrier",},
	Kadesh={"kad_mothership","kad_carrier",},
	Kushan={"kus_mothership","kus_carrier",},
	Bentusi={"ben_bentus","ben_resourcecollector","ben_floatingcity","ben_cargobarge","ben_cargobarge","ben_cargobarge","ben_cargobarge","ben_cargobarge","ben_cargobarge",},
}


function FXP_AddStartingFleet(iPlayer,iPosition,iDirection)
	local p_position={iPosition[1]-10000*sin(iDirection[2]),iPosition[2],iPosition[3]-10000*cos(iDirection[2])}
	local iRace=player[iPlayer].raceName
	addSphere("StartPos"..iPlayer,iPosition, 0)
 	createSOBGroup("Player_StartingFleet"..iPlayer)
 	createSOBGroup("Player_StartingFleetToDock"..iPlayer)
	for iNum,iShip in FXP_StartingFleet[iRace] do
		addSquadron(iShip.."_"..iPlayer.."_"..iNum, iShip, p_position, iPlayer, {0, 0, 0}, 0, 0)
 		addToSOBGroup(iShip.."_"..iPlayer.."_"..iNum, "Player_StartingFleet"..iPlayer)
	end
	--for iShip,iNum in FXP_StartingFleetToDock[iRace] do
	--	 for  i",iNum do
	--	 	addSquadron(iShip.."_"..iPlayer.."_"..i, iShip, p_position, iPlayer, {0, 0, 0}, 0, 0)
 	--		addToSOBGroup(iShip.."_"..iPlayer.."_"..i, "Player_StartingFleetToDock"..iPlayer)
	--	 end
	--end
end