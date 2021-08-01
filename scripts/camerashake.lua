function CameraShakeInit()
		Volume_AddSphere("camerashake1",{100000,0,0,},10)
		Volume_AddSphere("camerashake2",{0,100000,0,},10)
		Volume_AddSphere("camerashake3",{0,0,100000,},10)	
		Volume_AddSphere("camerashake4",{-100000,0,0,},10)
		Volume_AddSphere("camerashake5",{0,-100000,0,},10)
		Volume_AddSphere("camerashake6",{0,0,-100000,},10)		
		Rule_Add("CameraShakeCheck")
end

function shockwave(playerIndex,CustomGroup)	
	if Universe_GameTime() <= 10 then return nil end			
	if SobGroup_Empty("Player_Ships"..playerIndex) == 1 then return nil end	--avaoid crash when exit game	
	--camera shake
	local camera_distance = Camera_GetDistanceToSobGroup(CustomGroup)			
	local radius = 0
	local wave = 0
	if(SobGroup_AreAnyFromTheseAttackFamilies(CustomGroup, "SmallCapitalShip")==1)then
		radius=1500
		wave=4750
	elseif(SobGroup_AreAnyFromTheseAttackFamilies(CustomGroup, "BigCapitalShip")==1)then
		radius=1800
		wave=5700
	elseif(SobGroup_AreAnyFromTheseAttackFamilies(CustomGroup, "Mothership")==1)then
		radius=2400
		wave=7600
	elseif(SobGroup_AreAnyFromTheseAttackFamilies(CustomGroup, "Capturer")==1)then
		radius=1000
		wave=2400
	else
		return nil
	end
	if camera_distance < radius*1.9 then	--max radius 2700(destroyer) - 5760(juggernaut)	
		local camerashake_distancemultiplier = camera_distance * 0.05	--0.05/1000 -0.1/2000 - 0.288/5760
		local camerashake_effect = wave*0.1-camerashake_distancemultiplier	--wave 4750->7600 - 0.475->0.760-camerashake_distancemultiplier
		if camerashake_effect >= 1000 then camerashake_effect = 999 end	--should't happen
		if camerashake_effect <= 0 then camerashake_effect = 0 end --should't happen
		GameEvent_Listen(5000,tostring(floor(camerashake_effect)))
	end		
end


function CameraShakeCheck()
	--camera shake
	if Universe_GameTime() > 10 then		
		local camerashake_health = GameEvent_IsListening(5000)
		if camerashake_health ~="" then
			camerashake_health=tonumber(camerashake_health)/1000
			local playerIndexList = Universe_CurrentPlayer() + 1
			local r = random(1,6)	
			local camerashake_absorber = camerashake[playerIndexList] * 0.15 --0->2.25(15)	
			local camerashake_duration = floor(camerashake_health*41.5)
			local camerashake_effect = (5.0-camerashake_health*4.5)+camerashake_absorber
			if camerashake_effect <= 0 then camerashake_effect = 0 end --should't happen
			Camera_FocusVolumeWithBuffer("camerashake"..r, 1000, 1000, camerashake_effect)			
			camerashake[playerIndexList] = camerashake[playerIndexList] + 1
			if camerashake[playerIndexList] >= camerashake_duration then 					
				Camera_FocusSave()
				Camera_FocusRestore()						
				camerashake[playerIndexList] = 0
				GameEvent_UnListen(5000)
			end			
		end				
	end		
end

