mainrule_flag = 1

function mainrule_updating()		
		if mainrule_flag == 1 then
				objectivePrimary = Objective_Add("$3005", OT_Primary)
				Objective_AddDescription(objectivePrimary, "$3006")
				--Subtitle_Message_Handler("$3007", 2, "data:sound\\speech\\allships\\emperor\\CHALLENGE_DESTROYMOTHERSHIPS_2", Universe_CurrentPlayer())		
				mainrule_flag = 0
		end		
		local playerIndex = 0
		local playerCount = Universe_PlayerCount()
		while (playerIndex < playerCount) do
				if (Player_IsAlive(playerIndex) == 1 and Player_HasShipWithBuildQueue(playerIndex) == 0) then
						if(playerIndex~=Universe_CurrentPlayer())then
							Player_Kill(playerIndex)
							FXP_PlayerDie(playerIndex)
						else
							FXP_PlayerDead=1
						end
				end
				playerIndex = playerIndex+1
		end
		local numAlive = 0
		local numEnemies = 0
		local FXP_GameOver = 1
		playerIndex = 0
		while (playerIndex < playerCount) do
				if (Player_IsAlive(playerIndex) == 1) then
						local otherPlayerIndex = 0
						while (otherPlayerIndex < playerCount) do
								if (AreAllied(playerIndex, otherPlayerIndex) == 0) then
										if (Player_IsAlive(otherPlayerIndex) == 1) then
												FXP_GameOver = 0
										else
												numEnemies = numEnemies + 1
										end
								end
								otherPlayerIndex = otherPlayerIndex + 1
						end
						numAlive = numAlive + 1
				end
				playerIndex = playerIndex + 1
		end
		if (FXP_PlayerDead==1)then
				FXP_GameOver = 1
		elseif(numEnemies == 0 and numAlive > 0) then
				FXP_GameOver = 0
		end
		if (FXP_GameOver == 1) then
				Rule_AddInterval("FXP_WaitForEnd",5)
				if(FXP_PlayerDead==0)then
					FXP_PlayerWin()
				else
					FXP_PlayerLose()
				end
				Rule_Remove("mainrule_updating")
		end
end

function FXP_WaitForEnd()
	--if(Rule_Exists("FXP_SendingMessage")==0)and(FXP_MessageCheck()==1)then
		if(FXP_PlayerDead==0)then
			Event_Start("PlayerWin")
		else
			Event_Start("PlayerLose")
		end
		Rule_Remove("FXP_WaitForEnd")
	--end
end
