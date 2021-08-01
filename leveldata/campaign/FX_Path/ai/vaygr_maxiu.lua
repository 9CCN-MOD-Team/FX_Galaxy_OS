dofilepath("data:ai/default/default.lua")

function CpuIsUnderAttack()
	if(HaveBeenAttacked()==1)then
		Research( FXP_BEENATTACK )
		Rule_Remove("CpuIsUnderAttack")
		Rule_AddInterval("CpuIsUnderAttackLater",60)
	end
end

function CpuIsUnderAttackLater()
		Rule_Remove("CpuIsUnderAttackLater")
		Rule_AddInterval("CpuIsUnderAttack",1)
end

function attack_now_timer()
	
	aitrace("Script:calling attack_now_timer")
	-- 
	AttackNow();
	Research( FXP_ATTACK )
	Rule_Remove("attack_now_timer")
	
end

setLevelOfDifficulty( 2 ) -- 0 = easy, 1 = standard, 2 = hard ( 0 is default )

--
-- INITIALIZATION
--
--  these functions are called once at the beginning of a level and override any variables the 'default' AI would have set. 
--  if these functions don't exist or are empty, nothing will happen. But these functions are called after the AI so they can 
--  be used to 'trump/ override' any AI set variables. These variables are used in the rules to guide/ manipulate/ constrain/ ...
-- Note: some of these variables may change by the default AI so by setting them once in the Init functions may not be enough
-- 

-- add stuff to override the initialization process
function Override_Init()

	-- global flag init
	-- setting any of these flags to 0 will turn off the named component
	
	-- attack player 0 (put in override_init)
	cp_overrideChooseEnemy = 0
	
	-- build system - this builds ships and subsystems
	sg_dobuild = 1
	
	-- research system - this does the research
	sg_doresearch = 0
	
	-- this monitors and controls military stuffs - like group size, attack percentage, etc
	sg_domilitary = 1
	
	-- this turns off the code-level resource processing (refinery, collectors, ...)
	cp_processResource = 1
	
	-- this turns off the code-level military processing (attack, guard, scout, ...)
	cp_processMilitary = 1

end

-- add stuff in here to override the build initialization (ships and subsystems)
function Override_BuildDemandInit()

	-- these are basic offsets for the demand of each of these ships classes
	-- these can be changed at anytime (there are many more classes then this)
	--sg_classPersonalityDemand[ eFighter ] = 0 --3
	--sg_classPersonalityDemand[ eCorvette ] = 1
	--sg_classPersonalityDemand[ eFrigate ] = 3 --0
	

end

function Override_ResearchInit()
    -- cp_researchDemandRange-- this hook allows you to add randomness to the choosing of the best research
end

-- override any resource variables (and/or functions)
function Override_ResourceInit()

	-- control the number of collectors the AI will produce
	-- to control the logic of 'when' these are produced I will need to add another override (let me know if you need this)
	
	--sg_minNumCollectors = 5
	--sg_maxNumCollectors = 15

	-- this var specifies how many military units are needed before the AI builds its first refinery (deprecated)
	--sg_refineryMilitaryLimit = 5
	
	-- how many collectors are needed before the first refinery-type ship is built (needs to be revisited)
	--sg_collectorMinForRefinery = 8

     --cpResourcersPerPath--每条停泊路径支持的矿船数量
     --cpNumCollectorsPerLatchPoint-- initialise the resourcers per resource latch point on a resource
     --cpMaxThreatAddedDistance--完全计算敌人总值的最大距离
     --cpMinThreatAddedDistance--完全不计敌人总值的最小距离

end

-- override any military variables (and/or functions)
function Override_MilitaryInit()
	Rule_AddInterval("CpuIsUnderAttack",1)
	
	-- set the initial attack percentage - this changes too often - don't set it here (use Process functions to do this)
	--cp_attackPercent = 100
    -- cp_minSquadGroupSize--ai进攻兵力的最小规模
     --cp_minSquadGroupValue--ai进攻兵力的最小总值
     --cp_maxGroupSize--ai进攻兵力的最大规模
     --cp_maxGroupValue--ai进攻兵力的最大总值
    -- cp_forceAttackGroupSize--ai强制进攻的兵力规模
     --cp_initThreatModifier--ai威胁评估系数
	
end

--
-- PROCESSING
--
--   if any of the following 'Override' functions are defined they will completely replaced the AI's default behaviour in the
--  corresponding area (research, building, resourcing, ...). You can use some of the default behaviour and optionally provide some
--  of your own. (Eg. let the AI build ships normally but give it a higher demand for corvettes, or minelayers, or research subsystems...)
--

-- include this function if you want to write your own demand rules for ships

--function Override_ShipDemand()

-- 	DetermineCounterDemand();
-- 	DetermineScoutDemand();
-- 	DetermineBuilderClassDemand();
-- 	DetermineSpecialDemand();	
--end

-- include this function if you want to write your own demand rules for subsystems
--function Override_SubSystemDemand()

	--CpuBuildSS_DefaultSubSystemDemandRules()
	--SubSystemDemandSet( RESEARCH, -10 )
	
	-- this is the function the generic AI uses (you could use parts of this if you choose - copy and paste from it)
	
--end