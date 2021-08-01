Kad_FuelPodEffectRange=2000

function Start_SupportPod(CustomGroup, playerIndex, shipID)  
	--SobGroup_CreateSubSystem(CustomGroup, "kad_module_firecontrol")
	SobGroup_CreateIfNotExist("SupportPodGroup"..shipID)
	SobGroup_CreateIfNotExist("SupportPodTempGroup")
	SobGroup_Clear("SupportPodGroup"..shipID)
	SobGroup_Clear("SupportPodTempGroup")
	SobGroup_SetSwitchOwnerFlag("SupportPodGroup"..shipID, 0)
	local iSupportTarget={"kad_swarmer","kad_assaultswarmer","kad_lanceswarmer","kad_lanceswarmer1","kad_advancedswarmer","kad_advancedassaultswarmer"}
	Player_FillShipsByTheseTypes("SupportPodTempGroup", playerIndex, iSupportTarget)
	SobGroup_FillProximitySobGroup("SupportPodGroup"..shipID, "SupportPodTempGroup", CustomGroup, Kad_FuelPodEffectRange)
	SobGroup_SetMadState(CustomGroup, "DockPathOpen")
end

function Do_SupportPod(CustomGroup, playerIndex, shipID)
	SobGroup_AbilityActivate("SupportPodGroup"..shipID, AB_UseSpecialWeaponsInNormalAttack, 1)
	FX_StartEvent("SupportPodGroup"..shipID, "Accelerate")
end

function Finish_SupportPod(CustomGroup, playerIndex, shipID)	
	SobGroup_AbilityActivate("SupportPodGroup"..shipID, AB_UseSpecialWeaponsInNormalAttack, 0)
	--SobGroup_AbilityActivate(CustomGroup, AB_Custom, 0)
	SobGroup_SetHardPointHealth(CustomGroup, "Generic 1", 0)
	SobGroup_SetMadState(CustomGroup, "DockPathClosed")
	FX_StopEvent("SupportPodGroup"..shipID, "Accelerate")
end

function Player_FillShipsByTheseTypes(iSob,iPlayer,tShipType)
	SobGroup_Clear(iSob)
	SobGroup_CreateIfNotExist("FillPlayerShipsByTypeTempGroup")
	for index,itype in tShipType do
		SobGroup_Clear("FillPlayerShipsByTypeTempGroup")
		Player_FillShipsByType("FillPlayerShipsByTypeTempGroup", iPlayer, itype)
		SobGroup_SobGroupAdd(iSob,"FillPlayerShipsByTypeTempGroup")
	end
end