GameRulesName = "Single Player"
Description = "No description"
SaveGameVersion = 1.0
SinglePlayer = 1

ExtFilter = "rules_sp,rules_generic,rules_sp_generic"

Race_Paths = "FXRPG"

Race_Pass_Tags = ""

Directories =
{
    AI = "data:AI\\",
}

GameSetupOptions =
{
	-- resource mulitplier
    {
        name = "resources",
		locName = "$3240",
		tooltip = "$3232",
		default = 1,
    visible = 1,
		choices =
		{
			"$3241", "0.5",
			"$3242", "1.0",
			"$3243", "2.0",
		},
	},
	
	-- unitcap option
    {
    	name = "unitcaps",
			locName = "$3214",
			tooltip = "$3234",
			default = 0,
      visible = 1,
			choices =
			{
				"$3215", "Normal"
			},
	},
	
	-- starting resource option
    {
        name = "resstart",
		locName = "$3205",
		tooltip = "$3232",
		default = 0,
        visible = 1,
		choices =
		{
			"$3206", "750",
			"$3207", "2000",
			"$3208", "0",
		},
	},
	
	-- lock team option
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
	
	-- start location option
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
}

