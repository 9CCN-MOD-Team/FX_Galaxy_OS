JumpPlatformTime={}
JumpPlatformDelayTime=45
JumpPlatformRadius=3000

function Create_ben_jumpfieldplatform(CustomGroup, playerIndex, shipID)	
	JumpPlatformTime[shipID]=0
	SobGroup_CreateIfNotExist("Ben_JumpTempGroup_"..playerIndex.."_"..shipID)
end

function Update_ben_jumpfieldplatform(CustomGroup, playerIndex, shipID)	
	if(JumpPlatformTime[shipID]==0)then
		if(SobGroup_AreAllInRealSpace(CustomGroup)==0)then
			Player_FillProximitySobGroup("Ben_JumpTempGroup_"..playerIndex.."_"..shipID, playerIndex, CustomGroup, JumpPlatformRadius)
			SobGroup_RemoveType("Ben_JumpTempGroup_"..playerIndex.."_"..shipID, CustomGroup)
			SobGroup_RemoveType("Ben_JumpTempGroup_"..playerIndex.."_"..shipID, "ben_cargobarge")
			SobGroup_SetInvulnerability(CustomGroup, 1)
			SobGroup_EnterHyperSpaceOffMap("Ben_JumpTempGroup_"..playerIndex.."_"..shipID)
			SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)
			JumpPlatformTime[shipID]=-1
		end
	elseif(JumpPlatformTime[shipID]==-1)then
		if(SobGroup_AreAllInHyperspace(CustomGroup)==1)then
			JumpPlatformTime[shipID]=Universe_GameTime()+JumpPlatformDelayTime
		end
	else
		if(SobGroup_AreAllInHyperspace(CustomGroup)==0)and(SobGroup_AreAllInHyperspace("Ben_JumpTempGroup_"..playerIndex.."_"..shipID)==1)then
			SobGroup_ExitHyperSpaceSobGroup("Ben_JumpTempGroup_"..playerIndex.."_"..shipID, CustomGroup, JumpPlatformRadius)
			SobGroup_SetInvulnerability(CustomGroup, 0)
		end
		if(Universe_GameTime()>=JumpPlatformTime[shipID])then
			JumpPlatformTime[shipID]=0
			SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 1)
		end
	end
end

function Destroy_ben_jumpfieldplatform(CustomGroup, playerIndex, shipID)	
end