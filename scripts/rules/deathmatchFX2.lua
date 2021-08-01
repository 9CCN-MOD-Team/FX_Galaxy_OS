GUID = { 110,91,157,190,18,23,250,78,144,20,41,246,181,128,214,12 }
GameRulesName = "$90010" -- Homeworld Remastered
Description = "$90011"
SaveGameVersion = 1.0
SinglePlayer = 0
ExtFilter = "rules_fx_dm"

Race_Paths = "DeathmatchFX2"

Level_Pass_Tags = "dm,fx_dm"
Race_Pass_Tags = "race_fx,race_fx_random"

GameSetupOptions =
{
    {
        name = "TacticalReport",
        locName = "$90207",
        tooltip = "$90208",
        default = 0,
        visible = 1,
        choices =
        {
            "$90039", "on",
            "$90040", "off",
        },
    },
    {
        name = "resources",
        locName = "$3240",
        tooltip = "$3239",
        default = 1,
        visible = 1,
        choices =
        {
            "$3241", "0.5",
            "$3242", "1.0",
            "$3243", "2.0",
        },
    },
    {
        name = "unitcaps",
        locName = "$3214",
        tooltip = "$3234",
        default = 0,
        visible = 1,
        choices =
        {
            "$3216", "Normal",
            "$3217", "Large",
						"$4801", "Unlimited",
        },
    },
    {
        name = "resstart",
        locName = "$3205",
        tooltip = "$3232",
        default = 0,
        visible = 1,
        choices =
        {
            "$3206", "1000",
            "$3207", "3000",
            "$3208", "10000",
            "$90028", "500000",
            "$3209", "0",
        },
    },
    {
        name = "lockteams",
        locName = "$3220",
        tooltip = "$3235",
        default = 0,
        visible = 1,
        choices =
        {
            "$3221", "yes",
            "$3222", "no",
        },
    },
    {
        name = "startlocation",
        locName = "$3225",
        tooltip = "$3237",
        default = 0,
        visible = 1,
        choices =
        {
            "$3226", "random",
            "$3227", "fixed",
        },
    },
    {
        name = "cpuplayers",
        locName = "$2984",
        tooltip = "$2985",
        default = 4,
        visible = 1,
        choices =
        {
        		"$90036",  "0",
            "$3161",  "1",
            "$3201",  "2",
            "$3160",  "3",
            "$2986",  "4",
        },
    },
    {
        name = "aicheat",
        locName = "$90037",
        tooltip = "$90038",
        default = 0,
        visible = 1,
        choices =
        {
            "$90040",  "off",
        	"$90215",  "on",
            "$90214",   "extreme",
        },
    },
    {
        name = "aiclone",
        locName = "$90216",
        tooltip = "$90217",
        default = 0,
        visible = 0,
        choices =
        {
            "$90040",  "off",
        	"$90039",  "on",
        },
    },
    {
        name = "bounties",
        locName = "$2987",
        tooltip = "$2988",
        default = 0,
        visible = 1,
        choices =
        {
            "$5455",  "0",
            "$3215",  "0.04",
            "$2989",  "0.07",
            "$3217",  "0.1",
        },
    },
    --{
        --name = "research",
        --locName = "$2961",
        --tooltip = "$2962",
        --default = 1,
        --visible = 1,
        --choices =
        --{
						--"$3184",  "0",
						--"$3183",  "1",
        --},
    --},
    {
        name = "ruinjections",
        locName = "$2990",
        tooltip = "$2991",
        default = 0,
        visible = 1,
        choices =
        {
            "$5455", "0",
            "1000", "1000",
            "2000", "2000",
            "3000", "3000",
            "5000", "5000",
            "10000", "10000",
        },
    },
    {
        name = "challenges",
        locName = "$2994",
        tooltip = "$2995",
        default = 0,
        visible = 1,
        choices =
        {
            "$3183", "0",
			"$3184", "1",            
        },
    },
		{
        name = "relics",
        locName = "$3003",
        tooltip = "$3004",
        default = 0,
        visible = 1,
        choices =
        {
            "$3183", "0",
			"$3184", "1",
        },
    },
    {
        name = "crates",
        locName = "$2996",
        tooltip = "$2997",
        default = 0,
        visible = 1,
        choices =
        {
						"$3183", "0",
            "$3184", "1",            
        },
    },
		--{
        --name = "carriersonly",
        --locName = "$2998",
        --tooltip = "$2999",
        --default = 0,
        --visible = 1,
        --choices =
        --{
            --"$3183", "0",
			--"$3184", "1",
			--"$4802", "2",	
        --},
    --},
		{
        name = "norushtime",
        locName = "$3000",
        tooltip = "$3001",
        default = 0,
        visible = 1,
        choices =
        {
            "$5455", "0",
						"$2992", "5",
            "$2993", "10",
            "$3002", "15",
        },
		},        
   	{ 
        name = "BuildingSpeed", 
        locName = "$90022", 
        tooltip = "$90023", 
        default = 0, 
        visible = 1, 
        choices = 
        { 
        		"$90025", "off", 
        		"$90024", "on", 
        }, 
    },    
   	{ 
        name = "AdviseInterval", 
        locName = "$90070", 
        tooltip = "$90071", 
        default = 0, 
        visible = 0, 
        choices = 
        { 
        		"$90075", "0", 
        		"$90072", "10", 
        		"$90073", "30", 
        		"$90074", "60", 
        }, 
    },    
}
dofilepath("data:scripts/rules/deathmatchFX2/deathmatchFX2.lua")