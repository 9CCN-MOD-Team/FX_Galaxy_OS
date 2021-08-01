function MP_NoCombat()
	if SobGroup_UnderAttack("Player_Ships"..Universe_CurrentPlayer())==1 then
		return 0
	else
		return 1
	end
end

function MP_UnderAttack()
	if SobGroup_UnderAttack("Player_Ships"..Universe_CurrentPlayer())==1 then
		return 1
	else
		return 0
	end
end

function MP_Never()
	return 0
end

function MP_Always()
	return 1
end

