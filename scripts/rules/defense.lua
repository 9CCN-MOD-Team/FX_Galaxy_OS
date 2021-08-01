GUID = { 110, 91, 157, 190, 18, 23, 250, 78, 144, 20, 41, 246, 181, 128, 214, 12, }
GameRulesName = "$11500"
Description = "$11501"
SaveGameVersion = 1.0
SinglePlayer = 0

ExtFilter = "rules_fx_defense"

Race_Paths = "DeathmatchFX2"

Level_Pass_Tags = "fx_defense"
Race_Pass_Tags = "race_fx_defense,race_fx_random_defense"

GameSetupOptions = 
{ 
    { 
        name = "resources", 
        locName = "$3240", 
        tooltip = "$3239", 
        default = 0, 
        visible = 0, 
        choices = 
            { "$3243", "2.0", }, 
    }, 
    { 
        name = "unitcaps", 
        locName = "$3214", 
        tooltip = "$3234", 
        default = 0, 
        visible = 0, 
        choices = 
            { "$2313", "normal", }, 
    }, 
    { 
        name = "resstart", 
        locName = "$3205", 
        tooltip = "$3232", 
        default = 0, 
        visible = 0, 
        choices = 
            { "$3209", "5000", }, 
    }, 
    { 
        name = "lockteams", 
        locName = "$3220", 
        tooltip = "$3235", 
        default = 0, 
        visible = 0, 
        choices = 
            { "$3222", "no", "$3221", "yes", },
    }, 
    { 
        name = "startlocation", 
        locName = "$3225", 
        tooltip = "$3237", 
        default = 0, 
        visible = 0, 
        choices = 
            { "$3226", "random", "$3227", "fixed", }, 
    }, 
    {
        name = "BountyRate",
        locName = "$11502",
        tooltip = "$11503",
        default = 2,
        visible = 1,
        choices = { "$11504",  "0.55", "$11505", "0.6", "$11506", "0.65", "$11507", "0.7", "$11508", "0.75"}, 
    },
    {
        name = "Def_Dif",
        locName = "$11509",
        tooltip = "$11510",
        default = 1,
        visible = 1,
        choices = { "$11511",  "0.8", "$11512", "1", "$11513", "1.2", "$11514", "1.5"}, 
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

dofilepath("data:scripts/rules/defense/defense.lua")