dofilepath("data:ai/default/default.lua")
function FXP_Init()
	Rule_AddInterval("CpuIsUnderAttack",1)
	lastAttackTime=0
	lastUnderAttackTime=0
	FXP_IsAttacking=0
	FXP_IsUnderAttack=0
end

function CpuIsUnderAttackLater()
		Rule_Remove("CpuIsUnderAttackLater")
		Rule_AddInterval("CpuIsUnderAttack",1)
end

function CpuIsUnderAttack()
	if (UnderAttackThreat()>75)and(2*s_selfTotalValue < s_enemyTotalValue)and(gameTime() > lastUnderAttackTime + 60)then
		FXP_IsUnderAttack = 1
		lastUnderAttackTime=gameTime()
		Rule_AddInterval("CpuIsUnderAttackLater",60)
	end
end

rawset(globals(),"attack_now_timer",nil)
attack_now_timer = function() 
	AttackNow();
	if (UnderAttackThreat() < -50) and (s_selfTotalValue > 2*s_enemyTotalValue)and(gameTime() > lastAttackTime + 60)then
		FXP_IsAttacking = 1
		lastAttackTime=gameTime()
	end
	Rule_Remove("attack_now_timer")
end

