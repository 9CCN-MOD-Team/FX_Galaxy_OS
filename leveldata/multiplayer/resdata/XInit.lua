dofilepath("data:leveldata/multiplayer/resdata/logics.lua")

function XInit(sReslist, sSurviveJudgeAndTechnologies)
	_ALERT("Initializing X System in GameRule Scope...")
	dofilepath("data:leveldata/multiplayer/resdata/"..sReslist)
	if sSurviveJudgeAndTechnologies ~= "" then
		dofilepath("data:leveldata/multiplayer/resdata/"..sSurviveJudgeAndTechnologies)
	else
		PlayerSurviveJudge = 0
		ShipForSurvive = {}
		Technologies ={}
	end
	Entrance()
	XInitOnLoad()
	--GameEvent_Listen(35587, sReslist)
	
end

function XInitOnLoad()
	dofilepath("data:leveldata/multiplayer/resdata/XConditionJudge.lua")
	dofilepath("data:leveldata/multiplayer/resdata/XTechConditionJudge.lua")
	Volume_AddSphere("XInitVolume", {0, 0, 0}, 0)
	SobGroup_CreateIfNotExist("XInitGroup")
	SobGroup_SpawnNewShipInSobGroup(-1, "XSYS_initiator", "XSYS_initiator", "XInitGroup", "XInitVolume")
	Volume_Delete("XInitVolume")
	_ALERT("Initialized X System in GameRule Scope...")
end