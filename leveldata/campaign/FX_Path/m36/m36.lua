FXP_PlayerAI=
{
	{
		Actor="Tai_Hard",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Vgr_Hard",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Tur_Standard",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Kpr_Hard",
		Met=0,
		Dead=0,
		Team=2,
	},
	{
		Actor="Kad_Standard",
		Met=0,
		Dead=0,
		Team=2,
	},
}

function Path_Achievement()
		o_handle = writeto("Path37.lua")
		local ex=random(1,4)
		if (o_handle~=nil) then
			write(o_handle, "Path37 = "..ex)
			writeto()
		end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")


FXP_MissionName=Path_Text.N36