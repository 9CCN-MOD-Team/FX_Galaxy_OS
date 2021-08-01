ShipCannotBuiltByHPGate={"Vgr_Carrier","Vgr_LanceFighter","Vgr_Bomber","Vgr_EWFighter","Vgr_LaserCorvette","Vgr_InfiltratorFrigate","Vgr_ArtilleryFrigate"}

function Create_GateHQ(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("Vgr_BuilderGate"..playerIndex)
end

function Update_GateHQ(CustomGroup, playerIndex, shipID)
	if(SobGroup_GroupInGroup("Vgr_BuilderGate"..playerIndex,CustomGroup)==0)then
		SobGroup_SobGroupAdd("Vgr_BuilderGate"..playerIndex,CustomGroup)
		SobGroup_SetMadState(CustomGroup,"HyperspaceGateActivate")
		for i,iShip in ShipCannotBuiltByHPGate do
			SobGroup_RestrictBuildOption(CustomGroup,iShip)
		end
	end
end

function Destroy_GateHQ(CustomGroup, playerIndex, shipID)
end