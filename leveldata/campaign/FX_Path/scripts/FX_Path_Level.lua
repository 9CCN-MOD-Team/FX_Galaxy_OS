FXP_StartingFleet=
{
	Hiigaran=
	{
		hgn_mothership=1,
		hgn_carrier=1,
	},
	Vaygr=
	{
		vgr_mothership=1,
		vgr_carrier=1,
	},
	Taiidan=
	{
		tai_mothership=1,
		tai_carrier=1,
		tai_researchship=1
	},
	Turanic=
	{
		tur_shipyard=1,
		tur_carrier=1,
	},
	Keeper=
	{
		kpr_balcoragate=1,
		kpr_deliver=1,
		kpr_carrier=1,
	},
	Kadesh=
	{
		kad_mothership=1,
		kad_carrier=1,
	},
	Kushan=
	{
		kus_mothership=1,
		kus_carrier=1,
	},
	Bentusi=
	{
		ben_bentus=1,
		ben_resourcecollector=1,
		ben_floatingcity=1,
		ben_cargobarge=6,
	},
}


function FXP_AddStartingFleet(iPlayer,iPosition,iDirection)
	local p_position={iPosition[1]-10000*sin(iDirection[2]),iPosition[2],iPosition[3]-10000*cos(iDirection[2])}
	local iRace=player[iPlayer].raceName
	addSphere("StartPos"..iPlayer,iPosition, 0)
 	createSOBGroup("Player_StartingFleet"..iPlayer)
 	createSOBGroup("Player_StartingFleetToDock"..iPlayer)
	for iShip,iNum in FXP_StartingFleet[iRace] do
		 for  i=1,iNum do
		 	addSquadron(iShip.."_"..iPlayer.."_"..i, iShip, p_position, iPlayer, {0, 0, 0}, 0, 0)
 			addToSOBGroup(iShip.."_"..iPlayer.."_"..i, "Player_StartingFleet"..iPlayer)
		 end
	end
	--for iShip,iNum in FXP_StartingFleetToDock[iRace] do
	--	 for  i=1,iNum do
	--	 	addSquadron(iShip.."_"..iPlayer.."_"..i, iShip, p_position, iPlayer, {0, 0, 0}, 0, 0)
 	--		addToSOBGroup(iShip.."_"..iPlayer.."_"..i, "Player_StartingFleetToDock"..iPlayer)
	--	 end
	--end
end