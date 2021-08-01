dofilepath("data:leveldata/multiplayer/resdata/customcode_repair.lua")
dofilepath("data:leveldata/multiplayer/resdata/customcode_latchdock.lua")

function Create_Support(CustomGroup, playerIndex, shipID)
	Create_Repair(CustomGroup, playerIndex, shipID)
	Create_LatchDock(CustomGroup, playerIndex, shipID)
end

function Update_Support(CustomGroup, playerIndex, shipID)
	Update_Repair(CustomGroup, playerIndex, shipID)
	Update_LatchDock(CustomGroup, playerIndex, shipID)
end