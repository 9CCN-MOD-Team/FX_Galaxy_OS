dofilepath("data:leveldata/multiplayer/resdata/CustomCode_Hide.lua")

															
function Load_Kus_ResearchShipAdv(playerIndex)
end

function Create_Kus_ResearchShipAdv(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("researchshipadv_temp")
	Create_Hide(CustomGroup, playerIndex, shipID)	
end

function Update_Kus_ResearchShipAdv(CustomGroup, playerIndex, shipID)		
  for i = 1,5,1 do
		SobGroup_Create("kus_researchshipadv_" .. tostring(i) .. tostring(playerIndex))		
		SobGroup_FillShipsByType("researchshipadv_temp", "Player_Ships"..playerIndex, "kus_researchshipadv_"..i)
		SobGroup_SobGroupAdd("kus_researchshipadv_" .. tostring(i) .. tostring(playerIndex), "researchshipadv_temp")
  end
	local numberofdockedresearchships = 0
	for i = 1,5,1 do		
		if SobGroup_Empty("kus_researchshipadv_" .. tostring(i) .. tostring(playerIndex)) == 0 and SobGroup_AreAllInRealSpace("kus_researchshipadv_" .. tostring(i) .. tostring(playerIndex))==1 then
			if SobGroup_AreAnyOfTheseTypes("kus_researchshipadv_" .. tostring(i) .. tostring(playerIndex), "kus_researchshipadv_"..i) == 1 then
				if SobGroup_IsDocked("kus_researchshipadv_" .. tostring(i) .. tostring(playerIndex)) == 0 then					
					SobGroup_DockSobGroupAndStayDocked("kus_researchshipadv_" .. tostring(i) .. tostring(playerIndex), CustomGroup)
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

function Destroy_Kus_ResearchShipAdv(CustomGroup, playerIndex, shipID)	
end