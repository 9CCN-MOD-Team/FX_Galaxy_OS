function Create_RAIN(CustomGroup, playerIndex, shipID)  

end

function Update_RAIN(CustomGroup, playerIndex, shipID)  

  if SobGroup_IsDoingAbility(CustomGroup,AB_Capture) == 1 and SobGroup_GetActualSpeed(CustomGroup)<0.1 then
  
  SobGroup_SetMadState(CustomGroup, "Mad_Open")
  FX_StartEvent(CustomGroup, "E_Shocking")
 

  else
  FX_StopEvent(CustomGroup, "E_Shocking")
  end
  
end

function Destroy_RAIN(CustomGroup, playerIndex, shipID)  


end

