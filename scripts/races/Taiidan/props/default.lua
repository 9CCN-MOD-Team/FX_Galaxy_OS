-- Taiidan

Number_Properties_Priority = 1.0

Number_Properties = {
	cfg_race_is_playable = 1.0,
	cfg_race_index_sort = 1.0,
	cfg_race_select_weight = 1.001,
	cfg_race_is_random = 0.0,
	
	cfg_hyperspace_effect_time = 9.5,
	cfg_buildable_subsystems = 1.0,
	cfg_advanced_research = 1.0,
	cfg_bc_can_upgrade = 1.0,
	
	persona_class_demand_fighter = 0.35,
	persona_class_demand_corvette = 0.35,
	persona_class_demand_frigate = 0.5,
	persona_class_demand_platform = -0.5,
		
	raceID = 4,
}

String_Properties_Priority = 1.0

SelfRace_ScriptsPath = "data:scripts/races/Taiidan/scripts/"

String_Properties = {
	cfg_hyperspace_effect_fx = "hyperspace_gate",
	cfg_hyperspace_effect_audio = [[etg/special/SPECIAL_ABILITIES_HYPERSPACE_IN]],
	
	path_build = SelfRace_ScriptsPath.."build.lua",
	path_research = SelfRace_ScriptsPath.."research.lua",
	
	path_ai = SelfRace_ScriptsPath.."ai.lua",
	path_ai_special = SelfRace_ScriptsPath.."ai_special.lua",
	path_ai_research = SelfRace_ScriptsPath.."ai_upgrades.lua",
	path_ai_subsystems = SelfRace_ScriptsPath.."ai_subsystems.lua",
	path_ai_build = SelfRace_ScriptsPath.."ai_build.lua",
	
	path_crate_locate = SelfRace_ScriptsPath.."crate_locate.lua",
	path_crate_ships = SelfRace_ScriptsPath.."crate_ships.lua",
	
	def_type_mothership = "tai_mothership",
	def_type_carrier = "tai_carrier",
	def_type_scout = "tai_scout",
}
