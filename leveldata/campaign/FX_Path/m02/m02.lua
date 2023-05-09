FXP_PlayerAI=
{
	{
		Actor="Tai_Standard",
		Met=0,
		Dead=0,
		Team=0,
	},
	{
		Actor="Hgn_Hard",
		Met=0,
		Dead=0,
		Team=1,
	},
}

function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==2)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")

Path_Tips = 
{
	{desc=Path_Text.S2T1},
	{desc=Path_Text.S2T2},
}


FXP_MissionName=Path_Text.N2