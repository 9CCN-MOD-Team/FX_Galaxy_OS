cr_mover = {0,0,0,0,0}
ct_pos={}
ct_dis=100
ct_init=40
cf_dis=0

function Camera_ForwardInit(c_spd)
	if UI_IsScreenActive("PinYinIME")==0 then
		if (ct_pos.pos==nil) then
			Camera_PosInit()
			ct_pos.pos=Camera_GetPosition()
			ct_pos.tgt=SobGroup_GetPosition("Player_Ships"..Universe_CurrentPlayer())
			ct_pos.spd=20
			c_dis=sqrt((ct_pos.tgt[1]-ct_pos.pos[1])^2+(ct_pos.tgt[2]-ct_pos.pos[2])^2+(ct_pos.tgt[3]-ct_pos.pos[3])^2)
			for i=1,3 do--计算目标位置
				ct_pos.tgt[i]=ct_pos.pos[i]+(ct_pos.tgt[i]-ct_pos.pos[i])*(ct_dis/c_dis)
			end
			Volume_AddSphere("target",ct_pos.tgt,1)
			Camera_FocusVolumeKeepingEyePosition("target")	
			Volume_Delete("target")
		end
		if (Rule_Exists("Camera_Forward")==0)and(Rule_Exists("Camera_Rotate")==0)and(Rule_Exists("Camera_Track")==0) then
			ct_init=10
			Rule_Add("Camera_Forward")
			Camera_UsePanning(0)
			Subtitle_Message("$90233", 1)
		else
			MainUI_UserEvent( eSubtitleOk )
			Rule_Remove("Camera_Forward")
			Camera_UsePanning(1)
		end
	end
end

function Camera_Forward()
		local c_pos=Camera_GetPosition()
		local c_dis=0
		local l_dis=(ct_pos.pos[1]-c_pos[1])^2+(ct_pos.pos[2]-c_pos[2])^2+(ct_pos.pos[3]-c_pos[3])^2
		if (l_dis>0.2)and(ct_init==0) then
			for i=1,3 do--计算新的镜头距离
				c_dis=c_dis+(ct_pos.tgt[i]-c_pos[i])^2
			end
			c_dis=sqrt(c_dis)
			ct_pos.spd=ct_pos.spd+0.3*(ct_dis-c_dis)
			ct_pos.spd=min(100,ct_pos.spd)
			ct_pos.spd=max(-20,ct_pos.spd)
		else
			c_dis=ct_dis
		end
		local c_tgt={}
		local c_dir={}
		for i=1,3 do--计算新的镜头及目标位置，将镜头旋转改为原地旋转
			if (l_dis>0.2)and(ct_init==0) then
				c_tgt[i]=c_pos[i]+ct_dis*(ct_pos.tgt[i]-c_pos[i])/c_dis
				ct_pos.pos[i]=ct_pos.pos[i]+c_tgt[i]-ct_pos.tgt[i]
				ct_pos.tgt[i]=ct_pos.pos[i]+c_tgt[i]-c_pos[i]
			end
			c_dir[i]=ct_pos.tgt[i]-ct_pos.pos[i]
			ct_pos.pos[i]=ct_pos.pos[i]+c_dir[i]*(ct_pos.spd/ct_dis)
			ct_pos.tgt[i]=ct_pos.tgt[i]+c_dir[i]*(ct_pos.spd/ct_dis)
			c_pos[i]=2*ct_pos.tgt[i]-ct_pos.pos[i]
		end
		Volume_AddSphere("position",c_pos,1)
		Volume_AddSphere("target",ct_pos.tgt,1)
		Camera_FocusVolumeWithBuffer ("position", 1, 100000, 0)
		Camera_FocusVolumeWithBuffer ("target", ct_dis, 100000, 0)	
		Volume_Delete("position")
		Volume_Delete("target")
	if ct_init>0 then
		ct_init=ct_init-1
	end
end

function Camera_RotateBegin(iDirection)
	if UI_IsScreenActive("PinYinIME")==0 then
		if (FX_SelectedShips("camera")==1) then
			cr_mover[5]=Camera_GetDistanceToSobGroup("camera")
			cr_mover[abs(iDirection)]=cr_mover[abs(iDirection)]+iDirection/abs(iDirection)
			if (Rule_Exists("Camera_Forward")==0)and(Rule_Exists("Camera_Rotate")==0)and(Rule_Exists("Camera_Track")==0)and(SobGroup_Empty("camera")==0) then
				Rule_Add("Camera_Rotate")
				Subtitle_Message("$90234", 1)
			end
		end
	end
end

function Camera_Rotate()
		Volume_Delete("position")
		local s_pos=SobGroup_GetPosition("camera")
		local c_pos={}
		c_pos[1]=cr_mover[5]*sin(cr_mover[3])*cos(cr_mover[4])+s_pos[1]
		c_pos[3]=cr_mover[5]*cos(cr_mover[3])*cos(cr_mover[4])+s_pos[3]
		c_pos[2]=cr_mover[5]*sin(cr_mover[4])+s_pos[2]
		cr_mover[3]=cr_mover[3]+0.5*cr_mover[1]
		cr_mover[4]=cr_mover[4]+0.5*cr_mover[2]
		Volume_AddSphere("position",c_pos,1)
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", cr_mover[5], 100000, 0)	
end

function Camera_TrackSelected()
	if UI_IsScreenActive("PinYinIME")==0 then
		if (Rule_Exists("Camera_Rotate")==0) then
			Camera_PosInit()
			if (Rule_Exists("Camera_Forward")==0)and(Rule_Exists("Camera_Rotate")==0)and(Rule_Exists("Camera_Track")==0) then
				if (FX_SelectedShips("CameraTrackTempGroup")==1) then
					local c_pos=Camera_GetPosition()
					cr_mover[1]=c_pos[1]
					cr_mover[2]=c_pos[2]
					cr_mover[3]=c_pos[3]
					Rule_Add("Camera_Track")
					Subtitle_Message("$90235", 1)
					local s_pos=SobGroup_GetPosition("CameraTrackTempGroup")
					cf_dis=sqrt((cr_mover[1]-s_pos[1])^2+(cr_mover[2]-s_pos[2])^2+(cr_mover[3]-s_pos[3])^2)
				end
			else
				MainUI_UserEvent( eSubtitleOk )
				Rule_Remove("Camera_Track")
				--Camera_SetVerticalFOV(70)
			end
		end
	end
end

function Camera_TrackSobGroup(iSob)
	if (Rule_Exists("Camera_Rotate")==0) then
		Camera_PosInit()
		--if (Rule_Exists("Camera_TrackSobGroup")==0) then
			--if (SobGroup_Empty("CameraTrackTempGroup")==1) then
				if (iSob~=nil) then
					SobGroup_SobGroupAdd("CameraTrackTempGroup", iSob)
				end
			--else
				local c_pos=Camera_GetPosition()
				cr_mover[1]=c_pos[1]
				cr_mover[2]=c_pos[2]
				cr_mover[3]=c_pos[3]
				if (Rule_Exists("Camera_TrackSobGroup")==0) then
					Rule_Add("Camera_TrackSobGroup")
				end
				local s_pos=SobGroup_GetPosition("CameraTrackTempGroup")
				cf_dis=sqrt((cr_mover[1]-s_pos[1])^2+(cr_mover[2]-s_pos[2])^2+(cr_mover[3]-s_pos[3])^2)
				local c_pos={}
				c_pos[1]=2*s_pos[1]-cr_mover[1]
				c_pos[2]=2*s_pos[2]-cr_mover[2]
				c_pos[3]=2*s_pos[3]-cr_mover[3]
				Volume_AddSphere("position",c_pos,1)
				Camera_FocusVolumeWithBuffer ("position", 1, 100000, 0)
				Camera_FocusSobGroupWithBuffer ("CameraTrackTempGroup", cf_dis, 100000, 0)	
				Volume_Delete("position")
			--end
		--else
		--	Rule_Remove("Camera_TrackSobGroup")
			--Camera_SetVerticalFOV(70)
		--end
	end
end

function Camera_TrackSobGroupFromPosition(iSob,iPos)
	if (Rule_Exists("Camera_Rotate")==0) then
		Camera_PosInit()
		--if (Rule_Exists("Camera_TrackFromPosition")==0) then
			--if (SobGroup_Count(iSob)>0) then
				SobGroup_SobGroupAdd("CameraTrackTempGroup", iSob)
				cr_mover[1]=iPos[1]
				cr_mover[2]=iPos[2]
				cr_mover[3]=iPos[3]
				if (Rule_Exists("Camera_TrackFromPosition")==0) then
					Rule_Add("Camera_TrackFromPosition")
				end
				local s_pos=SobGroup_GetPosition("CameraTrackTempGroup")
				cf_dis=sqrt((cr_mover[1]-s_pos[1])^2+(cr_mover[2]-s_pos[2])^2+(cr_mover[3]-s_pos[3])^2)
				local c_pos={}
				c_pos[1]=2*s_pos[1]-cr_mover[1]
				c_pos[2]=2*s_pos[2]-cr_mover[2]
				c_pos[3]=2*s_pos[3]-cr_mover[3]
				Volume_AddSphere("position",c_pos,1)
				Camera_FocusVolumeWithBuffer ("position", 1, 100000, 0)
				Camera_FocusSobGroupWithBuffer ("CameraTrackTempGroup", cf_dis, 100000, 0)	
				Volume_Delete("position")
			--end
		--else
		--	Rule_Remove("Camera_TrackFromPosition")
			--Camera_SetVerticalFOV(70)
		--end
	end
end

function Camera_GetPosition()
		local l_dis={}
		for i=1,4 do
			l_dis[i]=0.01*Camera_GetDistanceToSobGroup("camerapos"..i)
			l_dis[i]=l_dis[i]^2
		end
		l_dis[5]=(l_dis[1]+l_dis[2]+l_dis[3]-l_dis[4])/2
		local c_pos={}
		for i=1,3 do
			c_pos[i]=(1000^2+l_dis[5]-l_dis[i])/20
		end
		return c_pos
end

function Camera_PosInit()
	if (SobGroup_Exists("camerapos1")==0) then
		SobGroup_Create("camerapos1")
		SobGroup_Create("camerapos2")
		SobGroup_Create("camerapos3")
		SobGroup_Create("camerapos4")
		Volume_AddSphere("camerapos1",{100000,0,0},1)
		Volume_AddSphere("camerapos2",{0,100000,0},1)
		Volume_AddSphere("camerapos3",{0,0,100000},1)
		Volume_AddSphere("camerapos4",{100000,100000,100000},1)
		SobGroup_SpawnNewShipInSobGroup(-1, "non_invisible", "camerapos1", "camerapos1", "camerapos1")
		SobGroup_SpawnNewShipInSobGroup(-1, "non_invisible", "camerapos2", "camerapos2", "camerapos2")
		SobGroup_SpawnNewShipInSobGroup(-1, "non_invisible", "camerapos3", "camerapos3", "camerapos3")
		SobGroup_SpawnNewShipInSobGroup(-1, "non_invisible", "camerapos4", "camerapos4", "camerapos4")
		Volume_Delete("camerapos1")
		Volume_Delete("camerapos2")
		Volume_Delete("camerapos3")
		Volume_Delete("camerapos4")
	end
end

function Camera_Track()
	if (Rule_Exists("Camera_Rotate")==0)and(SobGroup_Empty("CameraTrackTempGroup")==0) then
		local c_pos=Camera_GetPosition()
		local l_dis=sqrt((cr_mover[1]-c_pos[1])^2+(cr_mover[2]-c_pos[2])^2+(cr_mover[3]-c_pos[3])^2)
		if (l_dis>16) then
			cr_mover[1]=c_pos[1]
			cr_mover[2]=c_pos[2]
			cr_mover[3]=c_pos[3]
		end
		local s_pos=SobGroup_GetPosition("CameraTrackTempGroup")
		l_dis=sqrt((cr_mover[1]-s_pos[1])^2+(cr_mover[2]-s_pos[2])^2+(cr_mover[3]-s_pos[3])^2)
		c_pos[1]=2*s_pos[1]-cr_mover[1]
		c_pos[2]=2*s_pos[2]-cr_mover[2]
		c_pos[3]=2*s_pos[3]-cr_mover[3]
		Volume_AddSphere("position",c_pos,1)
		Camera_FocusVolumeWithBuffer ("position", 1, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("CameraTrackTempGroup", l_dis, 100000, 0)	
		Volume_Delete("position")
		--Camera_SetVerticalFOV(atan(cf_dis*tan(35)/l_dis))
	else
		Rule_Remove("Camera_Track")
		--Camera_SetVerticalFOV(70)
	end
end

function Camera_TrackFromPosition()
	if (Rule_Exists("Camera_Rotate")==0)and(SobGroup_Empty("CameraTrackTempGroup")==0) then
		local s_pos=SobGroup_GetPosition("CameraTrackTempGroup")
		l_dis=sqrt((cr_mover[1]-s_pos[1])^2+(cr_mover[2]-s_pos[2])^2+(cr_mover[3]-s_pos[3])^2)
		local c_pos=Camera_GetPosition()
		c_pos[1]=2*s_pos[1]-cr_mover[1]
		c_pos[2]=2*s_pos[2]-cr_mover[2]
		c_pos[3]=2*s_pos[3]-cr_mover[3]
		Volume_AddSphere("position",c_pos,1)
		Camera_FocusVolumeWithBuffer ("position", 1, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("CameraTrackTempGroup", l_dis, 100000, 0)	
		Volume_Delete("position")
		--Camera_SetVerticalFOV(atan(cf_dis*tan(35)/l_dis))
	else
		Rule_Remove("Camera_TrackFromPosition")
		--Camera_SetVerticalFOV(70)
	end
end

function FX_SelectedShips(iGroup)
	SobGroup_Clear(iGroup)
	for iPlayer=0,Universe_PlayerCount()-1 do
		if (SobGroup_Empty(iGroup)==0) then
			break
		else
			local iShip=0
			SobGroup_Clear(iGroup)
			SobGroup_FillShipsByIndexRange(iGroup, "Player_Ships"..iPlayer, 0, 1)
			while(SobGroup_Empty(iGroup)==0)do
				if (SobGroup_Selected(iGroup)==1) then
					break
				end
				SobGroup_Clear(iGroup)
				iShip=iShip+1
				SobGroup_FillShipsByIndexRange(iGroup, "Player_Ships"..iPlayer, iShip, 1)
			end
		end
	end
	return 1-SobGroup_Empty(iGroup)
end