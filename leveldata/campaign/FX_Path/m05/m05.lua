FXP_PlayerAI=
{
	{
		Actor="Hgn_Standard",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Tai_Easy",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Vgr_Standard",
		Met=0,
		Dead=0,
		Team=1,
	},
}

function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==5)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")

Path_Tips = 
{
	{desc=Path_Text.S5T1},
}


FXP_MissionName=Path_Text.N5