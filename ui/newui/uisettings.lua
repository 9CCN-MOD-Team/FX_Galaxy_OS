-- This file contains all the UIScreens that will be loaded on
--  startup of the app and on startup of the game.

-- Currently the UI only supports one style sheet, support for multiple stylesheets may
--  be supported in the future if needed.
StyleSheets = {
	HW2StyleSheet = {
		filename = "DATA:\\UI\\NewUI\\Styles\\HWRMStyles.lua",
	},
}

-- These screens will be loaded in order of listing...
FrontEndScreens = {
	;
	{
		name = "Background",
		filename = "DATA:\\UI\\NewUI\\Main\\Background.lua",
		activated = 0,
	},
	{
		name = "Achievement",
		filename = "DATA:\\UI\\NewUI\\Achievement.lua",
		activated = 0,
		--type = "Achievement",
	},
	{ 
	--ս���ܽ�ҳ��
		name = "TacticalReport", 
		filename = "DATA:\\UI\\NewUI\\TacticalReport.lua", 
		activated = 0, 
	}, 
	
	-- This is the name identifier for the screen.
	{
		-- This is the LuaScript that has the code for the screen
		name = "NewMainMenu",
		filename = "DATA:\\UI\\NewUI\\Main\\NewMainMenu.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "MainMenu",  -- Type of menu (default is UIScreen)
	},
		
	{
		name = "UserProfile",
		filename = "DATA:\\UI\\NewUI\\SinglePlayer\\SPUserProfile.lua",
		activated = 0,
		type = "UserProfile",
	},
	
	{
		name = "NewProfile",
		filename = "DATA:\\UI\\NewUI\\SinglePlayer\\SPNewProfile.lua",
		activated = 0,
		type = "NewProfile",
	},
	
	{
		name = "MissionSelect",
		filename = "DATA:\\UI\\NewUI\\Shared\\MissionSelect.lua",
		activated = 0,
		type = "SPMissionSelect",
	},
	
	{
		name = "PlayerSetup",
		filename = "DATA:\\UI\\NewUI\\Shared\\PlayerSetup.lua",
		activated = 0,
		type = "PlayerSetup",
	},
	
	{
		name = "EmblemSelect",
		filename = "DATA:\\UI\\NewUI\\Shared\\EmblemSelect.lua",
		activated = 0,
		type = "EmblemSelect",
	},
	
	{
		name = "LobbyScreen",
		filename = "DATA:\\UI\\NewUI\\GameRoom.lua",
		activated = 0,
		type = "LobbyScreen",
	},	

	{
		name = "GameTypeInfo",
		filename = "DATA:\\UI\\NewUI\\Shared\\GameTypeInfo.lua",
		activated = 0,
		type = "GameTypeInfo",
	},
	
	{
		name = "CreateGameScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\CreateGameScreen.lua",
		activated = 0,
		type = "CreateGameScreen",
	},		

	{
		name = "LobbyTitleRoom",
		filename = "DATA:\\UI\\NewUI\\ServerLobby.lua",
		activated = 0,
		type = "LobbyTitleRoom",
	},		

	--{
	--	name = "PasswordScreen",
	--	filename = "DATA:\\UI\\NewUI\\Shared\\PasswordScreen.lua",
	--	activated = 0,
	--},	

	{
		name = "Stats",
		filename = "DATA:\\UI\\NewUI\\Stats.lua",
		activated = 0,
		type = "Statistics",
	},
	
	{
		name = "GameSetup",
		filename = "DATA:\\UI\\NewUI\\Shared\\GameSetup.lua",		
		activated = 0,
		type = "GameSetup",
	},
	
	{
		name = "DirectConnection", -- req'd for ConnectionType
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\DirectConnection.lua",
		activated = 0,
		type = "DirectConnectionScreen",
	},
	{
		name = "IPConnect", -- req'd for ConnectionType
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\IPConnect.lua",
		activated = 0,
		type = "UIDialog",
	},	
	
	-- Warning: DirectConnection and IPConnect must be loaded before this screen
	{
		name = "ConnectionType",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\ConnectionType.lua",
		activated = 0,
		type = "ConnectionType",
	},
	{
		name = "BetaPopupScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\BetaPopupScreen.lua",
		activated = 0,
		type = "BetaPopupScreen",
	},
	--{
	--	name = "StyleSheetTestScreen",
	--	filename = "DATA:\\UI\\NewUI\\Styles\\StyleSheetTestScreen.lua",
	--	activated = 0,
	--},
	{
		name = "FEGameOptions",
		filename = "DATA:\\UI\\NewUI\\FEGameOptions.lua",
		activated = 0,
		type = "FEGameOptions",
	},
	{
		name = "GameInfoScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\GameInfoScreen.lua",
		activated = 0,
		type = "GameInfoScreen",
	},	
	{
		name = "GameFilterScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\GameFilterScreen.lua",
		activated = 0,
		type = "GameFilterScreen",
	},	
		
	-- DIALOGS
	{
		name = "YesNoDialog",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		type = "UIDialog",
	},
	{
		name = "ErrorMessage",
		filename = "DATA:\\UI\\NewUI\\ErrorMessage.lua",
		activated = 0,
		type = "ErrorMessage",
	},
	{
		name = "WaitMessage",
		filename = "DATA:\\UI\\NewUI\\WaitMessage.lua",
		activated = 0,
		type = "WaitMessage",
	},
	
	{
		name = "SaveLoadDialog",
		filename = "DATA:\\UI\\NewUI\\Shared\\SaveLoadDialog.lua",
		activated = 0,
		type = "SaveLoadDialog",
	},

	{
		name = "SubtitleScreen",
		filename = "DATA:\\UI\\NewUI\\Subtitle.lua",
		activated = 0,
		type = "SubtitleScreen",
	},

	{
		name = "PlayMoviesScreen",
		filename = "DATA:\\UI\\NewUI\\PlayMoviesScreen.lua",
		activated = 0,
		type = "PlayMoviesScreen",
	},
		
	{
		-- This is the LuaScript that has the code for the screen
		name = "PropertyEditorScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\PropertyEditorScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "PropertyEditorScreen",  -- Type of menu (default is UIScreen)
	},
	{
		-- This is the LuaScript that has the code for the screen
		name = "FEChatScreen",
		filename = "DATA:\\UI\\NewUI\\Multiplayer\\FEChatScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "FEChatScreen",  -- Type of menu (default is UIScreen)
	},
--9CCNԭ��
  {
    name = "Draft",
    filename = "DATA:\\UI\\NewUI\\Draft\\Draft.lua",
    activated = 0,
    type = "UIScreen",
  },
--����
  {
    name = "Story",
    filename = "DATA:\\UI\\NewUI\\story.lua",
    activated = 0,
    type = "UIScreen",
  },
}

TransientScreens = {
	;

	{
		name = "LoadingScreen",
		filename = "DATA:UI/NewUI/LoadingScreen.lua",
		activated = 0,
	},	
	
}

GameScreens = {
	;
	{
		name = "Pointer",
		filename = "DATA:\\UI\\NewUI\\Pointer.lua",
		type = "Pointer",
		activated = 1,
	},
	{
		name = "GenericScreen",
		filename = "DATA:\\UI\\NewUI\\Generic.lua",
		activated = 0,
	},	
	--{
	--	name = "ResourceStatsMenu",
	--	filename = "DATA:\\UI\\NewUI\\Resource.lua",
	--	activated = 0,
	--},	
	{
		name = "PlayerDestroyedScreen",
		filename = "DATA:\\UI\\NewUI\\PlayerDestroyedScreen.lua",
		activated = 0,		
	},
	{
		name = "UnitCapInfoPopup",
		type = "UnitCapInfoPopup",
		filename = "DATA:\\UI\\NewUI\\UnitCapInfoPopup.lua",
		activated = 0,
	},
	{
		name = "OBInfo",
		filename = "DATA:\\UI\\NewUI\\OBInfo.lua",
		activated = 0,
	},
	
	{
		name = "UnitsMenu",
		filename = "DATA:\\UI\\NewUI\\Units.lua",
		activated = 0,
	},
	
	{
		name = "ObjectivesList",
		filename = "DATA:\\UI\\NewUI\\ObjectivesList.lua",
		activated = 0,
		type = "ObjectivesList",
	},
	
	-- Build menu must be loaded before the research menu
	{
		name = "NewBuildMenu",
		filename = "DATA:\\UI\\NewUI\\Build\\FinalBuild.lua",
		activated = 0,
		type = "FinalBuildMenu",	
	},
	
	{
		name = "NewLaunchMenu",
		filename = "DATA:\\UI\\NewUI\\NewLaunch.lua",
		activated = 0,
		type = "NewLaunchMenu",
	},
	
	{
		name = "NewResearchMenu",
		filename = "DATA:\\UI\\NewUI\\Research\\Research.lua",
		activated = 0,
		type = "NewResearchMenu",		
	},
	
	{
		name = "BuildInfo",
		filename = "DATA:\\UI\\NewUI\\Build\\BuildInfo.lua",
		activated = 0,
		type = "BuildInfo",
	},
	
	{
		name = "ResearchInfo",
		filename = "DATA:\\UI\\NewUI\\Research\\ResearchInfo.lua",
		activated = 0,
		type = "ResearchInfo",
	},	
	
	{
		name = "NewTaskbar",
		filename = "DATA:\\UI\\NewUI\\NewTaskbar.lua",
		activated = 0,
		type = "NewTaskbar",
	},
	{
		name = "NewTaskbarRecover",
		filename = "DATA:\\UI\\NewUI\\NewTaskbar.lua",
		activated = 0,		
	},
	{
		name = "ResourceMenu",
		filename = "DATA:\\UI\\NewUI\\Resource.lua",
		activated = 0,
		type = "ResourceMenu",
	},	
	{
		name = "EventsScreen",
		filename = "DATA:\\UI\\NewUI\\EventsScreen.lua",
		activated = 0,
		type = "EventsScreen",
	},	

	{
		name = "RightClickMenu",
		filename = "DATA:\\UI\\NewUI\\RightClickMenu.lua",
		activated = 0,
		type = "RightClickMenu",
	},
	{
		name = "RightClickRadialMenu",
		filename = "DATA:\\UI\\NewUI\\RightClickRadialMenu.lua",
		activated = 0,
		type = "RightClickRadialMenu",
	},
	{
		name = "DiplomacyScreen",
		filename = "DATA:\\UI\\NewUI\\DiplomacyScreen.lua",
		activated = 0,
		type = "DiplomacyScreen",
	},
	
	{
		name = "InGameMenu",
		filename = "DATA:\\UI\\NewUI\\InGameMenu.lua",
		activated = 0,
		type = "GameMenu",
	},
	
	{
		name = "FleetMenu",
		filename = "DATA:\\UI\\NewUI\\FleetMenu.lua",
		activated = 0,
	},
	
	{	
		name = "TacticsMenu",
		filename = "DATA:\\UI\\NewUI\\TacticsMenu.lua",
		activated = 0,
	},
	
	{
		name = "StrikeGroupsMenu",
		filename = "DATA:\\UI\\NewUI\\StrikeGroupsMenu.lua",
		activated = 0,
	},
	
	{
		name = "BuildQueueMenu",
		filename = "DATA:\\UI\\NewUI\\BuildQueueMenu.lua",
		activated = 0,
		type = "BuildQueueMenu",
	},
	
	{
		name = "ChatScreen",
		filename = "DATA:\\UI\\NewUI\\ChatScreen.lua",
		activated = 0,
		type = "ChatScreen",
	},
	
	{
		name = "ChatFloating",
		filename = "DATA:\\UI\\NewUI\\ChatFloating.lua",
		activated = 1,
	},
	
	{
		name = "PlayerLaggingScreen",
		filename = "DATA:\\UI\\NewUI\\PlayerLaggingScreen.lua",
		activated = 0,
		type = "PlayerLaggingScreen",
	},
	
	{
		name = "SMFiltersMenu",
		filename = "DATA:\\UI\\NewUI\\SMFiltersMenu.lua",
		activated = 0,
		type = "SMFiltersMenu",
	},
	
	{
		name = "SpeechRecall",
		filename = "DATA:\\UI\\NewUI\\SpeechRecall.lua",
		activated = 0,
		type = "SpeechRecall",
	},
	
	{
		name = "PauseScreen",
		filename = "DATA:\\UI\\NewUI\\Shared\\PauseScreen.lua",
		activated = 0,
	},
	
	{
		name = "InGameOptions",
		filename = "DATA:\\UI\\NewUI\\InGameOptions.lua",
		activated = 0,
		type = "InGameOptions",
	},
	
	{
		name = "SaveLoadDialog",
		filename = "DATA:\\UI\\NewUI\\Shared\\SaveLoadDialog.lua",
		activated = 0,
		type = "SaveLoadDialog",
	},
	
	{
		name = "GameOverScreen",
		filename = "DATA:\\UI\\NewUI\\GameOverScreen.lua",
		activated = 0,
		type = "GameOverScreen",
	},	
	{
		name = "bentusidialog",
		filename = "DATA:\\UI\\NewUI\\BentusiDialog.lua",
		activated = 0,
	},	

	{
		name = "PlaybackMenu",
		filename = "DATA:\\UI\\NewUI\\Playback\\PlaybackMenu.lua",
		activated = 0,
		type = "PlaybackMenu",
	},
	
	{
		name = "NotForPublicDisplay",
		filename = "DATA:\\UI\\NewUI\\NotForPublicDisplay.lua",
		activated = 0,
		--type = "NotForPublicDisplay",
	},	
	
	{
		name = "SubtitleScreen",
		filename = "DATA:\\UI\\NewUI\\Subtitle.lua",
		activated = 0,
		type = "SubtitleScreen",
	},

	{
		name = "SubtitleInputScreen",
		filename = "DATA:\\UI\\NewUI\\SubtitleInput.lua",
		activated = 0,
	},


	-- DIALOGS
	{
		name = "YesNoDialog",
		filename = "DATA:\\UI\\NewUI\\YesNoDialog.lua",
		activated = 0,
		type = "UIDialog",
	},	
	{
		name = "ErrorMessage",
		filename = "DATA:\\UI\\NewUI\\ErrorMessage.lua",
		activated = 0,
		type = "ErrorMessage",
	},
	{
		name = "ConfirmStarGate",
		filename = "DATA:\\UI\\NewUI\\ConfirmStarGate.lua",
		activated = 0,
	},
	{
		name = "GateMenu1",
		filename = "DATA:\\UI\\NewUI\\GateMenu1.lua",
		activated = 0,
	},
	{
		name = "GateMenu2",
		filename = "DATA:\\UI\\NewUI\\GateMenu2.lua",
		activated = 0,
	},
	{
		name = "ModMenu",
		filename = "DATA:\\UI\\NewUI\\ModMenu.lua",
		activated = 0,
	},
	{
		name = "MusicMenu",
		filename = "DATA:\\UI\\NewUI\\MusicPlayer.lua",
		activated = 0,
	},
	{
		name = "MusicListMenu",
		filename = "DATA:\\UI\\NewUI\\MusicList.lua",
		activated = 0,
	},
	{
		name = "GoodsMenu",
		filename = "DATA:\\UI\\NewUI\\GoodsMenu.lua",
		activated = 0,
	},
	{
		name = "TradeMenu",
		filename = "DATA:\\UI\\NewUI\\TradeMenu.lua",
		activated = 0,
	},
	{
		name = "TradeMenu2",
		filename = "DATA:\\UI\\NewUI\\TradeMenu2.lua",
		activated = 0,
	},
	{
		name = "RPGSkill",
		filename = "DATA:\\UI\\NewUI\\RPGSkill.lua",
		activated = 0,
	},
	{
		name = "ChooseTypeMenu",
		filename = "DATA:\\UI\\NewUI\\typechoose.lua",
		activated = 0,
	},
	{
		name = "ChangeTypeMenu",
		filename = "DATA:\\UI\\NewUI\\typechange.lua",
		activated = 0,
	},
	{
		name = "BuyShipConfirmMenu",
		filename = "DATA:\\UI\\NewUI\\BuyShipConfirm.lua",
		activated = 0,
	},
	{
		name = "GoodLoadMenu",
		filename = "DATA:\\UI\\NewUI\\GoodLoad.lua",
		activated = 0,
	},
	{
		name = "FXLF_FleetMenu",
		filename = "DATA:\\UI\\NewUI\\LF_FleetBuy.lua",
		activated = 0,
	},
	{
		name = "AIContact",
		filename = "DATA:\\UI\\NewUI\\AIContact.lua",
		activated = 0,
	},
	---- Debug Screens -----
	{
		name = "DebugScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\DebugScreen.lua",
		activated = 0,
	},	

	{
		-- This is the LuaScript that has the code for the screen
		name = "PropertyEditorScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\PropertyEditorScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "PropertyEditorScreen",  -- Type of menu (default is UIScreen)
	},
	{
		-- This is the LuaScript that has the code for the screen
		name = "GameBalanceScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\GameBalanceScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "GameBalanceScreen",  -- Type of menu (default is UIScreen)
	},
	{
		-- This is the LuaScript that has the code for the screen
		name = "DeveloperScreen",
		filename = "DATA:\\UI\\NewUI\\Developer\\DeveloperScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "DeveloperScreen",  -- Type of menu (default is UIScreen)
	},
	{
		-- This is the LuaScript that has the code for the screen
		name = "InGameModScreen",
		filename = "DATA:\\UI\\NewUI\\Modder\\InGameModScreen.lua",
		activated =0, -- Activate on front end startup (default is zero)
		type = "InGameModScreen",  -- Type of menu (default is UIScreen)
	},
	{ 
	--DT MOD �����ؿ����ÿ���������Ļ����
		name = "LocationMenu", 
		filename = "DATA:\\UI\\NewUI\\Location.lua", 
		activated = 0, 
	}, 
	{ 
	--LW���뷨����
		name = "PinYinIME", 
		filename = "DATA:\\UI\\NewUI\\LW_PinYinIME.lua", 
		activated = 0, 
	}, 
	{
		name = "Achievement",
		filename = "DATA:\\UI\\NewUI\\Achievement.lua",
		activated = 0,
		--type = "Achievement",
	},
	{
		name = "SubtitleScreen2",
		filename = "DATA:\\UI\\NewUI\\Subtitle2.lua",
		activated = 0,
		--type = "SubtitleScreen",
	},
}
