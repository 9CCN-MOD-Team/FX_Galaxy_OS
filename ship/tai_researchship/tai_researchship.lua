dofilepath("data:leveldata/multiplayer/resdata/CustomCode_Hide.lua")

function Create_Tai_ResearchShip(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("researchship_temp")
	for i=1,5,1 do
		SobGroup_CreateIfNotExist("tai_researchship_" .. tostring(i) .. tostring(playerIndex))
	end
	Create_Hide(CustomGroup, playerIndex, shipID)	
end

function Update_Tai_ResearchShip(CustomGroup, playerIndex, shipID)	
	for i = 1,5,1 do
		SobGroup_FillShipsByType("researchship_temp", "Player_Ships"..playerIndex, "tai_researchship_"..i)
		SobGroup_SobGroupAdd("tai_researchship_" .. tostring(i) .. tostring(playerIndex), "researchship_temp")
	end
	local numberofdockedresearchships = 0
	for i = 1,5,1 do		
		if SobGroup_Empty("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 and SobGroup_AreAllInRealSpace("tai_researchship_" .. tostring(i) .. tostring(playerIndex))==1 then
			if SobGroup_IsDocked("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then					
				SobGroup_DockSobGroupInstant("tai_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup)
				SobGroup_DockSobGroupAndStayDocked("tai_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup)
			else                                        
				numberofdockedresearchships = numberofdockedresearchships + 1
				--if SobGroup_Selected("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 1 then
				--	SobGroup_SelectSobGroup(CustomGroup)
				--end	              
			end
		end		
	end
	SobGroup_SetSpeed(CustomGroup, 1-numberofdockedresearchships/10)
	if(SobGroup_AreAnyOfTheseTypes("Player_Ships"..playerIndex, "Tai_Mothership, Tai_Carrier, Tai_Shipyard, Tai_ResearchStation")==0)then
		if (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Tai_Mothership")==0)and(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Tai_Carrier")==0)and(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Tai_Shipyard")==0)and(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Tai_ResearchStation")==0) then
			SobGroup_TakeDamage(CustomGroup,1)
		end
	end
	Update_Hide(CustomGroup, playerIndex, shipID)
	--if (numberofdockedresearchships==5)and(SobGroup_CanDoAbility(CustomGroup, AB_Builder)==1) then
	--	SobGroup_AbilityActivate(CustomGroup, AB_Builder, 0)
	--elseif (numberofdockedresearchships<5)and(SobGroup_CanDoAbility(CustomGroup, AB_Builder)==0) then
	--	SobGroup_AbilityActivate(CustomGroup, AB_Builder, 1)
	--end
end