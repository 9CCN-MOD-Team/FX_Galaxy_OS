-----------------------------------
--通用家园重制版AI脚本
--作者：萨尤克教主
--cpumiliitary.lua
--version 1.08
--2019.09.29
-----------------------------------


function CpuMilitary_Init()
	sg_Delay=Rules_GetSettingNumber("cpuplayers", 2)
	sg_moreEnemies = 0
	sg_militaryRand = Rand(100)
	if (Override_MilitaryInit~=nil) then
		Override_MilitaryInit()
	end
end

function CpuMilitary_Process()
	local numEnemies = PlayersAlive( player_enemy )
	local numAllies = PlayersAlive( player_ally )
	sg_moreEnemies = numEnemies - numAllies
	Logic_military_groupvars();
	Logic_military_attackrules();
	Logic_military_setattacktimer();
end

function Logic_military_groupvars()	
	if (sg_moreEnemies > 0 and s_selfTotalValue < s_enemyTotalValue*2) then
		cp_minSquadGroupSize = cp_minSquadGroupSize + (2*sg_ScaleComp)
		cp_minSquadGroupValue = cp_minSquadGroupValue + (75*sg_ScaleComp)
	elseif (s_militaryStrength > (120*sg_ScaleComp)) then
		cp_minSquadGroupSize = 3*sg_ScaleComp
		cp_minSquadGroupValue = 120*sg_ScaleComp
	end
end

function Logic_military_attackrules()
	if (g_LOD == 0) then
		if (gameTime() > 20*60 and s_militaryStrength > 0) then
			cp_attackPercent = 100
		end
		if (s_selfTotalValue*2 < s_enemyTotalValue and s_selfTotalValue > 150) then
			cp_attackPercent = 0
		end
	end
end
	
function attack_now_timer()	
	AttackNow();
	Rule_Remove("attack_now_timer")
end

function Logic_military_setattacktimer() 
		local cpuplayers_delay = 1
		
		if sg_Delay==1 then
			cpuplayers_delay = 2			
		elseif sg_Delay == 3 then
			cpuplayers_delay = 0.5			
		elseif sg_Delay == 4 then
			cpuplayers_delay = Rand(4)/2
		end
		
		local timedelay = 180	
		local wavedelay = 100 + sg_militaryRand * 0.6
		if (g_LOD==1) then
			timedelay = 120
			wavedelay = 80 + sg_militaryRand * 0.5
		end
		if (g_LOD==2) then
			timedelay = 60
			wavedelay = 60 + sg_militaryRand * 0.4
		end
		if (g_LOD>2) then
			timedelay = 0
			wavedelay = 40 + sg_militaryRand * 0.3
		end
		timedelay = timedelay * cpuplayers_delay
		wavedelay = wavedelay * cpuplayers_delay
		local gametime = gameTime()
		if (gametime >= timedelay or HaveBeenAttacked()==1) then
			if (Rule_Exists("attack_now_timer") == 0)and(sg_Delay~=0) then
				Rule_AddInterval("attack_now_timer", wavedelay )
			end
		end
	--end
end