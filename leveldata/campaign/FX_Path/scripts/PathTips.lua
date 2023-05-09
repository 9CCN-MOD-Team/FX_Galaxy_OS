function FX_PathTipOninit()
	UI_SetTextLabelText("ObjectivesList", "PriObj", "$2750")
	UI_SetTextLabelText("ObjectivesList", "SecObj", "$90219")
	UI_SetTextLabelText("ObjectivesList", "dialogWindow", "$90218")
	UI_SetTextLabelText("ObjectivesList", "descriptionTitle", "$90220")
	if (Path_Tips~=nil) then
		for index,tip in Path_Tips do
			Path_Tips[index].obj=Objective_Add(Path_Text.Tip, OT_Secondary)
			Objective_AddDescription(Path_Tips[index].obj, tip.desc)
		end
	end
end        

function DTM4_AvailableObjSelected(iIndex)
	UI_SetTextLabelText("ObjectivesList", "descriptionTitle", "$2754")
end

function DTM4_AcceptedObjSelected(iIndex)
	UI_SetTextLabelText("ObjectivesList", "descriptionTitle", "$90220")
end

function DTM4_GetPriObjIndex()
	return 0
end

function DTM4_GetSecObjIndex()
	return 0
end
