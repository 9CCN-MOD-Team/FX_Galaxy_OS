dofilepath("data:leveldata/multiplayer/resdata/customcode_custom.lua")

function Start_X_Missile(CustomGroup, playerIndex, shipID)  
	xSetShipIdioStateKeyFromCustomCode(shipID,1,"On")
end

function Do_X_Missile(CustomGroup, playerIndex, shipID)  	
end

function Finish_X_Missile(CustomGroup, playerIndex, shipID)	
	xSetShipIdioStateKeyFromCustomCode(shipID,1,"Off")
end