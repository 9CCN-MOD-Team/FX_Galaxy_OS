FXP_PlayerAI=
{
	{
		Actor="Kpr_Hard",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Tur_Standard",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Tai_Standard",
		Met=0,
		Dead=0,
		Team=1,
	},
}

function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==7)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")


FXP_MissionName=Path_Text.N7