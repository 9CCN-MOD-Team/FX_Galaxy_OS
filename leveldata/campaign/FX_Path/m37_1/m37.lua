FXP_PlayerAI=
	{
		{
			Actor="Tai_Expert",
			Met=0,
			Dead=0,
			Team=1,
		},
	}

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")


FXP_MissionName=Path_Text.N37

function Override_Init()
	Rule_AddInterval("Freeze_TaiMS",15)
	MusicPlayer_Disable()
	SobGroup_Create("TAI_Mothership_FXP")
end

function Freeze_TaiMS()
	if Path37==1 then
		Player_FillShipsByType("TAI_Mothership_FXP", 1, "Tai_Mothership")
		SobGroup_AbilityActivate("TAI_Mothership_FXP", AB_Move, 0)
		Rule_Remove("Freeze_TaiMS")
	end
end