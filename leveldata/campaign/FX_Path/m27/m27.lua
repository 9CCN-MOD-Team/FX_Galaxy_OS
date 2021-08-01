FXP_PlayerAI=
{
	{
		Actor="Vgr_Standard",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Hgn_Standard",
		Met=0,
		Dead=0,
		Team=2,
	},
	{
		Actor="Kpr_Standard",
		Met=0,
		Dead=0,
		Team=2,
	},
	{
		Actor="Tur_Expert",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Kad_Standard",
		Met=0,
		Dead=0,
		Team=1,
	},
}

function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==27)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")


FXP_MissionName=Path_Text.N27