FXP_PlayerAI=
	{
		{
			Actor="Hgn_Expert",
			Met=0,
			Dead=0,
			Team=1,
		},
	}

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")


FXP_MissionName=Path_Text.N37

function Override_Init()
	MusicPlayer_Disable()
end