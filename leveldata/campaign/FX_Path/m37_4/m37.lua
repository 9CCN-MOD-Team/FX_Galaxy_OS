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
	--Rule_AddInterval("Paht37_Random",1)
	MusicPlayer_Disable()
end

function Paht37_Random()
		o_handle = writeto("Path37.lua")
		local ex=random(1,4)
		if (o_handle~=nil) then
			write(o_handle, "Path37 = "..ex)
			writeto()
		end
		Rule_Remove("Paht37_Random")
end