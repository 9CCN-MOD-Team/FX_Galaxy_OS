function Update_CruiseMissile(CustomGroup, playerIndex, shipID)	
	if (SobGroup_CanDoAbility(CustomGroup, AB_Move)==0) and (SobGroup_IsDoingAbility(CustomGroup, AB_Move)==0) then
		SobGroup_TakeDamage(CustomGroup, 1)
	end
end

function Destroy_CruiseMissile(CustomGroup, playerIndex, shipID)	
		local iPlayer=0
		local iPlayerCount = Universe_PlayerCount()
		
		while(iPlayer < iPlayerCount) do--循环每个玩家
		  SobGroup_DoDamageProximitySobGroup(CustomGroup, iPlayer,10000, 1000)
		  iPlayer = iPlayer +1
		end
end

