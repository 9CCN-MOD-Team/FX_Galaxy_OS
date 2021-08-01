function Create_XSYS_initiator(CustomGroup, playerIndex, shipID)
	_ALERT("Initializing X System in CustomCode Scope...")
	SobGroup_CreateIfNotExist("X_RunningGroup")
	dofilepath("data:leveldata/multiplayer/resdata/XCustomCodeFunction.lua")
	dofilepath("data:leveldata/multiplayer/resdata/CustomCode_Custom.lua")
end

function Update_XSYS_initiator(CustomGroup, playerIndex, shipID)
	SobGroup_MakeDead(CustomGroup)
	_ALERT("Initialized X System in CustomCode Scope...")
end