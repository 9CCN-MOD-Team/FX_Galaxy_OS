function Create_Deliver(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("InsideHyperspace"..playerIndex)
	SobGroup_CreateIfNotExist("InsideDeliver"..shipID)
	SobGroup_CreateIfNotExist("InsideDeliver2"..shipID)
end

function Update_Deliver(CustomGroup, playerIndex, shipID)
	SobGroup_Clear("InsideDeliver"..shipID)
	SobGroup_Clear("InsideDeliver2"..shipID)
	SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "InsideDeliver2"..shipID)
	SobGroup_FilterExclude("InsideDeliver"..shipID, "InsideDeliver2"..shipID, "CurrentCommand", "COMMAND_Resource")
	SobGroup_Clear("InsideDeliver2"..shipID)
	SobGroup_FilterExclude("InsideDeliver2"..shipID, "InsideDeliver"..shipID, "attackFamily", "SmallCapitalShip")
	SobGroup_Clear("InsideDeliver"..shipID)
	SobGroup_FilterExclude("InsideDeliver"..shipID, "InsideDeliver2"..shipID, "attackFamily", "ResourceLarge")
	if (Player_HasResearch(playerIndex, "HyperspaceTech")==0)and(SobGroup_Count("InsideDeliver"..shipID)>3) then
		SobGroup_Launch("InsideDeliver"..shipID, CustomGroup)
	elseif (SobGroup_IsDockedSobGroup("InsideHyperspace"..playerIndex, CustomGroup)==1) then
		if (SobGroup_HealthPercentage("InsideHyperspace"..playerIndex)==1) then
			SobGroup_Launch("InsideHyperspace"..playerIndex, CustomGroup)
			SobGroup_Clear("InsideHyperspace"..playerIndex)
		end
	end
	if(SobGroup_Empty("InsideDeliver"..shipID)==1)and(SobGroup_Empty("InsideHyperspace"..playerIndex)==1)then
		SobGroup_AbilityActivate(CustomGroup,AB_Custom,0)
	elseif(Player_HasResearch(playerIndex, "HyperspaceTech")==1)then
		SobGroup_AbilityActivate(CustomGroup,AB_Custom,1)
	end
end

function Start_Deliver(CustomGroup, playerIndex, shipID)
	if(SobGroup_Empty("InsideDeliver"..shipID)==0)and(SobGroup_IsDockedCompletely("InsideDeliver"..shipID)==1)then
		SobGroup_ParadeSobGroup("InsideDeliver"..shipID, CustomGroup, 2)
		SobGroup_Despawn("InsideDeliver"..shipID)
		SobGroup_SobGroupAdd("InsideHyperspace"..playerIndex,"InsideDeliver"..shipID)
	elseif(SobGroup_Empty("InsideDeliver"..shipID)==1)and(SobGroup_Empty("InsideHyperspace"..playerIndex)==0)then
		SobGroup_DockSobGroupInstant("InsideHyperspace"..playerIndex, CustomGroup)
	end
end