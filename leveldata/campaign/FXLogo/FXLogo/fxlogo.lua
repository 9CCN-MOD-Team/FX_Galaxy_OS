function OnInit()
	Rule_Add("Rule_Start")
end

function Rule_Start()
	setMissionComplete(1)
	Rule_Remove("Rule_Start")
end