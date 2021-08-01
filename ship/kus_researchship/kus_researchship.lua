dofilepath("data:leveldata/multiplayer/resdata/CustomCode_Hide.lua")
															
function Load_Kus_ResearchShip(playerIndex)
end

function Create_Kus_ResearchShip(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("researchship_temp")
	Create_Hide(CustomGroup, playerIndex, shipID)	
end

function Update_Kus_ResearchShip(CustomGroup, playerIndex, shipID)		
  for i = 1,5,1 do
		SobGroup_Create("kus_researchship_" .. tostring(i) .. tostring(playerIndex))		
		SobGroup_FillShipsByType("researchship_temp", "Player_Ships"..playerIndex, "kus_researchship_"..i)
		SobGroup_SobGroupAdd("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "researchship_temp")
  end
	local numberofdockedresearchships = 0
	for i = 1,5,1 do		
		if SobGroup_Empty("kus_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 and SobGroup_AreAllInRealSpace("kus_researchship_" .. tostring(i) .. tostring(playerIndex))==1 then
			if SobGroup_AreAnyOfTheseTypes("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "kus_researchship_"..i) == 1 then
				if SobGroup_IsDocked("kus_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then					
					SobGroup_DockSobGroupAndStayDocked("kus_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup)
				else                                        
					numberofdockedresearchships = numberofdockedresearchships + 1              
				end
			end
		end		
	end
	if numberofdockedresearchships <= 5 then 
		SobGroup_SetSpeed(CustomGroup, 1-numberofdockedresearchships/10)
	end	
	Update_Hide(CustomGroup, playerIndex, shipID)
end

function Destroy_Kus_ResearchShip(CustomGroup, playerIndex, shipID)	
end
