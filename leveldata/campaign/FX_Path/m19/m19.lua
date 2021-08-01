FXP_PlayerAI=
{
	{
		Actor="Hgn_Hard",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Kad_Hard",
		Met=0,
		Dead=0,
		Team=2,
	},
	{
		Actor="Tur_Hard",
		Met=0,
		Dead=0,
		Team=3,
	},
	{
		Actor="Tai_Hard",
		Met=0,
		Dead=0,
		Team=4,
	},
	{
		Actor="Kpr_Hard",
		Met=0,
		Dead=0,
		Team=5,
	},
}

function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==19)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")


FXP_MissionName=Path_Text.N19