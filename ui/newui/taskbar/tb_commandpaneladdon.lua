
BTN_CMD_TRACKBEAM			= GetCommandButton("btnTrack",			"$90127", 146,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_pulse.dds",			"MainUI_UserEventData2( eSpecialAttack, 0, 3)")
BTN_CMD_CUSTOM			= GetCommandButton(	"btnCustomActivate",	"$4941", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_missilevolley.dds",				"MainUI_UserEventData( eCustomActivate, 0 );" , "MainUI_UserEventData( eCustomDeActivate, 0 );")	
BTN_CMD_GRAVWELL		= GetCommandButton(	"btnGravWellActivate",	"$90106", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_hyperspace.dds",		"MainUI_UserEventData( eCustomActivate, 1 );" , "MainUI_UserEventData( eCustomDeActivate, 1 );")
BTN_CMD_DRONESACTIVATE	= GetCommandButton("btnDronesActivate",	"$90108", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_dronefrigate.dds",		"MainUI_UserEventData( eCustomToggle, 2 );")  
BTN_CMD_SPEEDBOOST		= GetCommandButton("btnSpeedActivate",	"$2959", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_speedburst.dds",		"MainUI_UserEventData( eCustomToggle, 3 );")   				
BTN_CMD_SWITCH	= GetCommandButton("btnSwitch",	"$90102", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_gravewellgenerator.dds",		"MainUI_UserEventData( eCustomToggle, 4 );")  
BTN_CMD_DELIVER	= GetCommandButton("btnDeliver",	"$90103", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_dronefrigate.dds",		"MainUI_UserEventData( eCustomToggle, 5 );")  
BTN_CMD_RELEASE	= GetCommandButton("btnRelease",	"$90104", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_speedburst.dds",		"MainUI_UserEventData( eCustomToggle, 6 );")  
--BTN_CMD_SUPPORT	= GetCommandButton("btnSupport",	"$90106", 168,	"DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_hyperspace.dds",		"MainUI_UserEventData( eCustomToggle, 7 );") 
BTN_CMD_KAMIKAZE = nil 
	