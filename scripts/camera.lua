Camera_Point={}
NumKeys={ONEKEY,TWOKEY,THREEKEY,FOURKEY,FIVEKEY,SIXKEY,SEVENKEY,EIGHTKEY,NINEKEY,ZEROKEY}

for i=1,10 do
	Camera_Point[i]={Position={0,0,0},Focus={0,0,0}}
	setglobal("CT_AddCameraPoint"..i,
		function()
			CT_AddingCameraPoint(tonumber(%i))
		end)
	setglobal("CT_DeleteCameraPoint"..i,
		function()
			CT_DeletingCameraPoint(tonumber(%i))
		end)
	setglobal("CT_SwitchCameraPoint"..i,
		function()
			CT_SwitchingCameraPoint(tonumber(%i))
		end)
	setglobal("CT_InterpolateCameraPoint"..i,
		function()
			CT_InterpolatingCameraPoint(tonumber(%i))
		end)
end
	
function CT_AddingCameraPoint(iIndex)
	Camera_Point[iIndex].Position=CT_GetCameraPosition()
	Camera_FocusSave()
	Camera_ZoomClose(1)
	--Camera_AllowControl(0)
	Rule_AddIntervalParam("CT_RestoreCameraAfterAdded",iIndex,1)
end

function CT_RestoreCameraAfterAdded(iIndex)
	iIndex=tonumber(iIndex)
	Camera_Point[iIndex].Focus=CT_GetCameraPosition()
	Camera_FocusRestore()
	Volume_AddSphere("CameraPoint"..iIndex, Camera_Point[iIndex].Focus, 0)
	Subtitle_Message("新增镜头点"..iIndex..":位置:"..Camera_Point[iIndex].Position[1]..","..Camera_Point[iIndex].Position[2]..","..Camera_Point[iIndex].Position[3].."焦点:"..Camera_Point[iIndex].Focus[1]..","..Camera_Point[iIndex].Focus[2]..","..Camera_Point[iIndex].Focus[3]..",", 5)
	UI_BindKeyEvent(AKEY,"CT_AddCameraPoint")
	UI_BindKeyEvent(DKEY,"CT_DeleteCameraPoint")
	UI_BindKeyEvent(SKEY,"CT_SwitchCameraPoint")
	UI_BindKeyEvent(OKEY,"CT_OutputCameraPoint")
	UI_BindKeyEvent(IKEY,"CT_InterpolateCameraPoint")
	for i=1,10 do
		UI_UnBindKeyEvent(NumKeys[i])
	end
	--Camera_AllowControl(1)
	Rule_RemoveParam("CT_RestoreCameraAfterAdded",iIndex)
end

function CT_OutputCameraPoint()
		local o_handle = writeto("CameraPoint.lua")
		local s_write = ""
		for i=1,10 do
			s_write=s_write.."\taddCamera(\"CameraPoint"..i.."\", {"..Camera_Point[i].Focus[1]..","..Camera_Point[i].Focus[2]..","..Camera_Point[i].Focus[3].."}, {"..Camera_Point[i].Position[1]..","..Camera_Point[i].Position[2]..","..Camera_Point[i].Position[3].."})\n"
		end
		if (o_handle~=nil) then
	    write(o_handle, s_write)
			writeto()
		end
end

function CT_DeletingCameraPoint(iIndex)
	Camera_Point[iIndex].Position={0,0,0,}
	Camera_Point[iIndex].Focus={0,0,0,}
	Volume_Delete("CameraPoint"..iIndex)
	UI_BindKeyEvent(AKEY,"CT_AddCameraPoint")
	UI_BindKeyEvent(DKEY,"CT_DeleteCameraPoint")
	UI_BindKeyEvent(SKEY,"CT_SwitchCameraPoint")
	UI_BindKeyEvent(OKEY,"CT_OutputCameraPoint")
	UI_BindKeyEvent(IKEY,"CT_InterpolateCameraPoint")
end

function CT_SwitchingCameraPoint(iIndex)
	local iCP=CT_GetCameraPosition()
	local iDis=sqrt((Camera_Point[iIndex].Position[1]-Camera_Point[iIndex].Focus[1])^2+(Camera_Point[iIndex].Position[2]-Camera_Point[iIndex].Focus[2])^2+(Camera_Point[iIndex].Position[3]-Camera_Point[iIndex].Focus[3])^2)
	Volume_AddSphere("PositionHelper", {iCP[1]-Camera_Point[iIndex].Position[1]+Camera_Point[iIndex].Focus[1],iCP[2]-Camera_Point[iIndex].Position[2]+Camera_Point[iIndex].Focus[2],iCP[3]-Camera_Point[iIndex].Position[3]+Camera_Point[iIndex].Focus[3],}, 0)
	Camera_FocusVolumeKeepingEyePosition("PositionHelper")
	Camera_FocusVolume("CameraPoint"..iIndex, 0, iDis, 0)
	Subtitle_Message("镜头点"..iIndex..":位置:"..Camera_Point[iIndex].Position[1]..","..Camera_Point[iIndex].Position[2]..","..Camera_Point[iIndex].Position[3].."焦点:"..Camera_Point[iIndex].Focus[1]..","..Camera_Point[iIndex].Focus[2]..","..Camera_Point[iIndex].Focus[3]..",", 5)
	Volume_Delete("PositionHelper")
	UI_BindKeyEvent(AKEY,"CT_AddCameraPoint")
	UI_BindKeyEvent(DKEY,"CT_DeleteCameraPoint")
	UI_BindKeyEvent(SKEY,"CT_SwitchCameraPoint")
	UI_BindKeyEvent(OKEY,"CT_OutputCameraPoint")
	UI_BindKeyEvent(IKEY,"CT_InterpolateCameraPoint")
end

function CT_InterpolatingCameraPoint(iIndex)
	Subtitle_Message("镜头点"..iIndex..":位置:"..Camera_Point[iIndex].Position[1]..","..Camera_Point[iIndex].Position[2]..","..Camera_Point[iIndex].Position[3].."焦点:"..Camera_Point[iIndex].Focus[1]..","..Camera_Point[iIndex].Focus[2]..","..Camera_Point[iIndex].Focus[3]..",", 5)
	Camera_Interpolate("here", "CameraPoint"..iIndex, 3)
	UI_BindKeyEvent(AKEY,"CT_AddCameraPoint")
	UI_BindKeyEvent(DKEY,"CT_DeleteCameraPoint")
	UI_BindKeyEvent(SKEY,"CT_SwitchCameraPoint")
	UI_BindKeyEvent(OKEY,"CT_OutputCameraPoint")
	UI_BindKeyEvent(IKEY,"CT_InterpolateCameraPoint")
end

function CT_Oninit()
	Volume_AddSphere("PositionHelper1", {0,0,0,}, 0)
	Volume_AddSphere("PositionHelper2", {10000,0,0,}, 0)
	Volume_AddSphere("PositionHelper3", {0,10000,0,}, 0)
	Volume_AddSphere("PositionHelper4", {0,0,10000,}, 0)
	for i=1,4 do
		SobGroup_Create("PositionHelper"..i)
		SobGroup_SpawnNewShipInSobGroup(0, "rpg_inhibitor", "PositionHelper"..i, "PositionHelper"..i, "PositionHelper"..i)
	end
	UI_BindKeyEvent(AKEY,"CT_AddCameraPoint")
	UI_BindKeyEvent(DKEY,"CT_DeleteCameraPoint")
	UI_BindKeyEvent(SKEY,"CT_SwitchCameraPoint")
	UI_BindKeyEvent(OKEY,"CT_OutputCameraPoint")
	UI_BindKeyEvent(IKEY,"CT_InterpolateCameraPoint")
end

function CT_AddCameraPoint()
	UI_UnBindKeyEvent(AKEY)
	UI_UnBindKeyEvent(DKEY)
	UI_UnBindKeyEvent(SKEY)
	UI_UnBindKeyEvent(OKEY)
	UI_UnBindKeyEvent(IKEY)
	for i=1,10 do
		UI_BindKeyEvent(NumKeys[i],"CT_AddCameraPoint"..i)
	end
end

function CT_DeleteCameraPoint()
	UI_UnBindKeyEvent(AKEY)
	UI_UnBindKeyEvent(DKEY)
	UI_UnBindKeyEvent(SKEY)
	UI_UnBindKeyEvent(OKEY)
	UI_UnBindKeyEvent(IKEY)
	for i=1,10 do
		UI_BindKeyEvent(NumKeys[i],"CT_DeleteCameraPoint"..i)
	end
end

function CT_SwitchCameraPoint()
	UI_UnBindKeyEvent(AKEY)
	UI_UnBindKeyEvent(DKEY)
	UI_UnBindKeyEvent(SKEY)
	UI_UnBindKeyEvent(OKEY)
	UI_UnBindKeyEvent(IKEY)
	for i=1,10 do
		UI_BindKeyEvent(NumKeys[i],"CT_SwitchCameraPoint"..i)
	end
end

function CT_InterpolateCameraPoint()
	Subtitle_Message("请选择要转到的镜头点（0-9）……", 2)
	UI_UnBindKeyEvent(AKEY)
	UI_UnBindKeyEvent(DKEY)
	UI_UnBindKeyEvent(SKEY)
	UI_UnBindKeyEvent(OKEY)
	UI_UnBindKeyEvent(IKEY)
	for i=1,10 do
		UI_BindKeyEvent(NumKeys[i],"CT_InterpolateCameraPoint"..i)
	end
end

function CT_GetCameraPosition()
	local iDis={}
	local iPosition={}
	for i=1,4 do
		iDis[i]=Camera_GetDistanceToSobGroup("PositionHelper"..i)
	end
	for i=1,3 do
		iPosition[i]=(iDis[1]^2-iDis[i+1]^2+10^8)/20000
	end
	return iPosition
end