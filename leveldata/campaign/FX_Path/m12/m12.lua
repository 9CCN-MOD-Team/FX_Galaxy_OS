FXP_PlayerAI=
{
	{
		Actor="Tai_Standard",
		Met=0,
		Dead=0,
		Team=1,
	},
	{
		Actor="Vgr_Standard",
		Met=0,
		Dead=0,
		Team=2,
	},
}

function Path_Achievement()
	local sNum=Get_FX_Achievements_Value("StarMetalScrolls")
	if(sNum+1==12)then
		Set_FX_Achievements_Value("StarMetalScrolls",sNum+1)
	end
end

dofilepath("data:leveldata/campaign/FX_Path/scripts/FX_Path.lua")

Path_Tips = 
{
	{desc=Path_Text.S12T1},
}


FXP_MissionName=Path_Text.N12