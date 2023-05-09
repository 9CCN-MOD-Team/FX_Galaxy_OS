FXP_PlayerAI=
{
	{
		Actor="Kad_Standard",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Hgn_Expert",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Tur_Standard",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Vgr_Standard",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Kpr_Expert",
		Met=0,
		Dead=0,
		Team=1,
	},
}

function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==15)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")

Path_Tips = 
{
	{desc=Path_Text.S15T1},
}


FXP_MissionName=Path_Text.N15