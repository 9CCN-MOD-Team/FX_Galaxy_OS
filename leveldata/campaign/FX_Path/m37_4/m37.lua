FXP_PlayerAI=
	{
		{
			Actor="Hgn_Expert",
			Met=0,
			Dead=0,
			Team=1,
		},
	}
function Path_Achievement()
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")


FXP_MissionName=Path_Text.N37

function Override_Init()
	MusicPlayer_Disable()
	Rule_AddInterval("FXP_Switch",10)
end
function FXP_Switch()
	SobGroup_SwitchOwner("meg_tanis",1)
	if (SobGroup_OwnedBy("meg_tanis")==1) then
		Rule_Remove("FXP_Switch")
		Rule_AddInterval("FXP_Switch",1)
	end
end