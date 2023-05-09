function UV_Culc(iW,iH)
	local UV_Table = {512*(iW-1),256*(iH-1),512*iW,256*iH,}
	return UV_Table
end

Default = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,1),
    stretchOnDraw = 1,
  },
}
-------------------------------------------------------------------------------------------------


kus_assaultfrigate = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 0, 512, 256},
		stretchOnDraw = 1,
	},
}

kus_attackbomber = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 0, 1024, 256},
		stretchOnDraw = 1,
	},
}

kus_carrier = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1024, 0, 1536, 256},
		stretchOnDraw = 1,
	},
}

kus_defender = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 0, 2048, 256},
		stretchOnDraw = 1,
	},
}

----------------------

kus_cloakgenerator = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 256, 512, 512},
		stretchOnDraw = 1,
	},
}

kus_cryotray = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 256, 1024, 512},
		stretchOnDraw = 1,
	},
}

kus_cryotray_M03 = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 256, 1024, 512},
		stretchOnDraw = 1,
	},
}

kus_destroyer = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1024, 256, 1536, 512},
		stretchOnDraw = 1,
	},
}

kus_mine = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 256, 2048, 512},
		stretchOnDraw = 1,
	},
}

kus_Drone = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1792, 256, 2048, 512},
		stretchOnDraw = 1,
	},
}
----------------------

kus_dronefrigate = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 512, 512, 768},
		stretchOnDraw = 1,
	},
}
kus_missilefrigate=kus_dronefrigate
dtm4_dddfrigatenew=kus_dronefrigate
dtm4_dddfrigate=kus_dronefrigate
kus_gravwellgenerator = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 512, 1024, 768},
		stretchOnDraw = 1,
	},
}

kus_cloakedfighter = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1024, 512, 1536, 768},
		stretchOnDraw = 1,
	},
}

kus_heavycorvette = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 512, 2048, 768},
		stretchOnDraw = 1,
	},
}

----------------------

kus_heavycruiser = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 768, 512, 1024},
		stretchOnDraw = 1,
	},
}

kus_interceptor = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 768, 1024, 1024},
		stretchOnDraw = 1,
	},
}

kus_ioncannonfrigate = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1024, 768, 1536, 1024},
		stretchOnDraw = 1,
	},
}

kus_lightcorvette = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 768, 2048, 1024},
		stretchOnDraw = 1,
	},
}

----------------------

kus_mothership = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 1024, 512, 1280},
		stretchOnDraw = 1,
	},
}
   
kus_minelayercorvette = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 1024, 1024, 1280},
		stretchOnDraw = 1,
	},
}
kus_commandcorvette=kus_minelayercorvette
kus_missile = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1024, 1024, 1536, 1280},
		stretchOnDraw = 1,
	},
}

kus_missiledestroyer = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 1024, 2048, 1280},
		stretchOnDraw = 1,
	},
}

----------------------

kus_sensorarray = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 1280, 512, 1536},
		stretchOnDraw = 1,
	},
}

kus_multiguncorvette = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 1280, 1024, 1536},
		stretchOnDraw = 1,
	},
}

kus_targetdrone = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1024, 1280, 1536, 1536},
		stretchOnDraw = 1,
	},
}

kus_proximitysensor = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 1280, 2048, 1536},
		stretchOnDraw = 1,
	},
}

----------------------

kus_repaircorvette = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 1536, 512, 1792},
		stretchOnDraw = 1,
	},
}

kus_researchship = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 1536, 1024, 1792},
		stretchOnDraw = 1,
	},
}
       
kus_resourcecollector = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
    textureUV = UV_Culc(3,5),
    stretchOnDraw = 1,
  },
}

----------------------

kus_salvagecorvette = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 0, 1792, 512, 2048},
		stretchOnDraw = 1,
	},
}

kus_scout = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 512, 1792, 1024, 2048},
		stretchOnDraw = 1,
	},
}
       
kus_probe = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1024, 1792, 1536, 2048},
		stretchOnDraw = 1,
	},
}


kus_supportfrigate = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 1792, 2048, 2048},
		stretchOnDraw = 1,
	},
}
kus_resourcerefinery = kus_supportfrigate
kus_resourcecontroller = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_Kus_ships.dds",
		textureUV = { 1536, 1536, 2048, 1792},
		stretchOnDraw = 1,
	},
}
kus_repaircarrier = kus_resourcecontroller



--Kus_Mothership
--Kus_Scout
--kus_Interceptor
--Kus_Resourcecollector
--kus_SalvageCorvette
--kus_ResearchShip
--kus_Defender
--kus_CloakedFighter
--kus_HeavyCorvette
--kus_RepairCorvette
--kus_MinelayerCorvette
--kus_SupportFrigate
--kus_SensorArray
--kus_ProximitySensor
--kus_Probe
--kus_MissileDestroyer
--kus_GravwellGenerator
--kus_LightCorvette
--kus_DroneFrigate
--kus_CloakGenerator
--kus_Destroyer
--kus_IoncannonFrigate
--kus_HeavyCruiser


--
kus_researchship_1 = kus_researchship
kus_researchship_2 = kus_researchship
kus_researchship_3 = kus_researchship
kus_researchship_4 = kus_researchship
kus_researchship_5 = kus_researchship
kus_researchshipadv = kus_researchship
kus_researchshipadv_1 = kus_researchship
kus_researchshipadv_2 = kus_researchship
kus_researchshipadv_3 = kus_researchship
kus_researchshipadv_4 = kus_researchship
kus_researchshipadv_5 = kus_researchship
KUS_r = kus_researchship
KUS_r_Corvette = kus_researchship
Kus_r_rapidturret = kus_researchship
KUS_r_HeavyCorvette = kus_researchship
KUS_r_ioncannon = kus_researchship
KUS_r_PlasmaBombs = kus_researchship
KUS_ra = kus_researchship
KUS_ra_capship = kus_researchship
Kus_ra_gravitywell = kus_researchship
KUS_ra_heavygun = kus_researchship
KUS_ra_missile = kus_researchship
Kus_r_cloakmodule = kus_researchship
kus_drone0 = kus_Drone
kus_drone1 = kus_Drone
kus_drone2 = kus_Drone
kus_drone3 = kus_Drone
kus_drone4 = kus_Drone
kus_drone5 = kus_Drone
kus_drone6 = kus_Drone
kus_drone7 = kus_Drone
kus_drone8 = kus_Drone
kus_drone9 = kus_Drone
kus_drone10 = kus_Drone
kus_drone11 = kus_Drone
kus_drone12 = kus_Drone
kus_drone13 = kus_Drone
--taiidan







ben_bentus = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_bentusi.mres",
    textureUV = UV_Culc(4,2),
    stretchOnDraw = 1,
  },
}
ben_fighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_bentusi.mres",
    textureUV = UV_Culc(1,1),
    stretchOnDraw = 1,
  },
}
Ben_ioncannonfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_bentusi.mres",
    textureUV = UV_Culc(2,1),
    stretchOnDraw = 1,
  },
}
ben_destroyer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_bentusi.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}
ben_floatingcity = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_bentusi.mres",
    textureUV = UV_Culc(4,1),
    stretchOnDraw = 1,
  },
}
def_floatingcity = ben_floatingcity
Ben_Battleship = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_bentusi.mres",
    textureUV = UV_Culc(3,2),
    stretchOnDraw = 1,
  },
}
ben_resourcecollector = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships2.mres",
    textureUV_TL = {
      160,
      900,
    },
    textureUV_WH = {
      170,
      100,
    },
    stretchOnDraw = 1,
  },
}
TAI_Scout = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(4,3),
    stretchOnDraw = 1,
  },
}
TAI_Interceptor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(4,2),
    stretchOnDraw = 1,
  },
}
TAI_AttackBomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(4,1),
    stretchOnDraw = 1,
  },
}
TAI_heavydefender = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(4,5),
    stretchOnDraw = 1,
  },
}
TAI_defensefighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(4,4),
    stretchOnDraw = 1,
  },
}
TAI_lightcorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(2,1),
    stretchOnDraw = 1,
  },
}
TAI_heavycorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(2,2),
    stretchOnDraw = 1,
  },
}
TAI_multiguncorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(2,3),
    stretchOnDraw = 1,
  },
}
TAI_repaircorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(2,4),
    stretchOnDraw = 1,
  },
}
TAI_salcapcorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(2,5),
    stretchOnDraw = 1,
  },
}
TAI_minelayercorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(2,7),
    stretchOnDraw = 1,
  },
}
TAI_standardfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,5),
    stretchOnDraw = 1,
  },
}
TAI_supportfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,6),
    stretchOnDraw = 1,
  },
}
TAI_defensefrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,7),
    stretchOnDraw = 1,
  },
}
TAI_ioncannonfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,4),
    stretchOnDraw = 1,
  },
}
TAI_mothership = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(3,6),
    stretchOnDraw = 1,
  },
}
hgn_mothership_TAI = TAI_mothership
TAI_carrier = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,2),
    stretchOnDraw = 1,
  },
}
hgn_carrier_TAI = TAI_carrier
TAI_Destroyer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,1),
    stretchOnDraw = 1,
  },
}
tai_shipyard = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(4,6),
    stretchOnDraw = 1,
  },
}
tai_battleship = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(4,7),
    stretchOnDraw = 1,
  },
}
TAI_missiledestroyer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,3),
    stretchOnDraw = 1,
  },
}
TAI_heavycruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(3,7),
    stretchOnDraw = 1,
  },
}
TAI_researchship = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(2,8),
    stretchOnDraw = 1,
  },
}
hgn_researchship_TAI = TAI_researchship
tai_researchstation = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(3,5),
    stretchOnDraw = 1,
  },
}
TAI_cloakgenerator = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}
TAI_gravwellgenerator = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(3,2),
    stretchOnDraw = 1,
  },
}
TAI_resourcecollector = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(3,8),
    stretchOnDraw = 1,
  },
}
TAI_ResourceController = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(3,4),
    stretchOnDraw = 1,
  },
}
TAI_Probe = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships2.mres",
    textureUV_TL = {
      210,
      500,
    },
    textureUV_WH = {
      85,
      70,
    },
    stretchOnDraw = 1,
  },
}
TAI_proximitysensor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships2.mres",
    textureUV_TL = {
      280,
      505,
    },
    textureUV_WH = {
      120,
      64,
    },
    stretchOnDraw = 1,
  },
}
TAI_sensorarray = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_taiidan.mres",
    textureUV = UV_Culc(1,8),
    stretchOnDraw = 1,
  },
}
tur_scout = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(1,1),
    stretchOnDraw = 1,
  },
}
tur_fighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(1,3),
    stretchOnDraw = 1,
  },
}
tur_attackbomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(1,2),
    stretchOnDraw = 1,
  },
}
tur_torpedoCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(1,7),
    stretchOnDraw = 1,
  },
}
tur_standardcorvette = {
 LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(1,4),
    stretchOnDraw = 1,
  },
}
tur_missilecorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(1,6),
    stretchOnDraw = 1,
  },
}
tur_minelayercorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(3,3),
    stretchOnDraw = 1,
  },
}
tur_salcapcorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(1,4),
    stretchOnDraw = 1,
  },
}
tur_vulcanfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,3),
    stretchOnDraw = 1,
  },
}
tur_ionarrayfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,4),
    stretchOnDraw = 1,
  },
}
tur_SiegeDrillfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,2),
    stretchOnDraw = 1,
  },
}
tur_Energyfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,1),
    stretchOnDraw = 1,
  },
}
tur_carrier = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,5),
    stretchOnDraw = 1,
  },
}
tur_carrier_sp = tur_carrier
hgn_carrier_tur = tur_carrier
tur_shipyard = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,6),
    stretchOnDraw = 1,
  },
}
hgn_shipyard_tur = tur_shipyard
tur_missilecruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      200,
      64,
    },
    textureUV_WH = {
      188,
      64,
    },
    stretchOnDraw = 1,
  },
}
tur_heavycruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,7),
    stretchOnDraw = 1,
  },
}
tur_heavygunturret = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships1.mres",
    textureUV_TL = {
      390,
      448,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
tur_cloakgenerator = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships1.mres",
    textureUV_TL = {
      280,
      510,
    },
    textureUV_WH = {
      120,
      64,
    },
    stretchOnDraw = 1,
  },
}
tur_gravwellgenerator = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      128,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
}
tur_resourcecollector = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}
tur_Garbage = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(3,2),
    stretchOnDraw = 1,
  },
}
tur_ResourceController = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_turanic.mres",
    textureUV = UV_Culc(2,8),
    stretchOnDraw = 1,
  },
}
tur_PlanetKillerMissile = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      192,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
kad_mothership = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,8),
    stretchOnDraw = 1,
  },
}
kad_mothership1 = kad_mothership
kad_mothershipDark = kad_mothership
kad_mothershipLight = kad_mothership
hgn_mothership_kad = kad_mothership
hgn_mothershipDark_kad = kad_mothership
hgn_mothershipLight_kad = kad_mothership
kad_swarmer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(1,1),
    stretchOnDraw = 1,
  },
}
kad_swarmer1 = kad_swarmer
Kad_AssaultSwarmer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(1,3),
    stretchOnDraw = 1,
  },
}
Kad_LanceSwarmer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(1,6),
    stretchOnDraw = 1,
  },
}
Kad_LanceSwarmer1 = Kad_LanceSwarmer
Kad_AdvancedSwarmer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(1,2),
    stretchOnDraw = 1,
  },
}
Kad_AdvancedSwarmer_Drone=Kad_AdvancedSwarmer
Kad_swarmerAdvanced = Kad_AdvancedSwarmer
Kad_AdvancedAssaultSwarmer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(3,3),
    stretchOnDraw = 1,
  },
}
Kad_AdvancedAssaultSwarmer_Drone=Kad_AdvancedAssaultSwarmer
kad_Variationswarmer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(1,5),
    stretchOnDraw = 1,
  },
}
kad_Variationswarmer_Drone=kad_Variationswarmer
kad_Fuelpod = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,4),
    stretchOnDraw = 1,
  },
}
kdd_Fuelpod = kad_Fuelpod
kad_multibeamfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,2),
    stretchOnDraw = 1,
  },
}
kad_militaryfuelpod = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,3),
    stretchOnDraw = 1,
  },
}
Kad_Carrier = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,7),
    stretchOnDraw = 1,
  },
}
hgn_Carrier_Kad = Kad_Carrier
kad_guardianspirit = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(1,7),
    stretchOnDraw = 1,
  },
}
Kad_Battlecruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      0,
      64,
    },
    textureUV_WH = {
      172,
      64,
    },
    stretchOnDraw = 1,
  },
}
Kad_gunturret = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(1,8),
    stretchOnDraw = 1,
  },
}
Kad_gunturret1 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships2.mres",
    textureUV_TL = {
      395,
      485,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Kad_heavygunturret = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships2.mres",
    textureUV_TL = {
      395,
      400,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Kad_Araneid = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,5),
    stretchOnDraw = 1,
  },
}
Kad_Salvager = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,6),
    stretchOnDraw = 1,
  },
}
kad_resourcefuelpod = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(2,1),
    stretchOnDraw = 1,
  },
}
kad_Probe = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}
Kad_proximitysensor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships1.mres",
    textureUV_TL = {
      638,
      948,
    },
    textureUV_WH = {
      110,
      64,
    },
    stretchOnDraw = 1,
  },
}
KAD_Superswarmer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_kadesh.mres",
    textureUV = UV_Culc(3,2),
    stretchOnDraw = 1,
  },
}
KAD_SuperswarmerA = KAD_Superswarmer
KAD_SuperswarmerB = KAD_Superswarmer
KAD_SuperswarmerC = KAD_Superswarmer
KAD_SuperswarmerD = KAD_Superswarmer
KAD_SuperswarmerE = KAD_Superswarmer
KAD_SuperswarmerF = KAD_Superswarmer
hgn_hscore = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships1.mres",
    textureUV_TL = {
      900,
      448,
    },
    textureUV_WH = {
      120,
      64,
    },
    stretchOnDraw = 1,
  },
}
Hgn_Scout = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(2,8),
    stretchOnDraw = 1,
  },
}
Hgn_Interceptor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(2,7),
    stretchOnDraw = 1,
  },
}
Hgn_AttackBomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(2,6),
    stretchOnDraw = 1,
  },
}
Hgn_AttackBomberElite = Hgn_AttackBomber
hgn_attackdroidelite = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      600,
      192,
    },
    textureUV_WH = {
      150,
      64,
    },
    stretchOnDraw = 1,
  },
}
Hgn_AssaultCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(2,3),
    stretchOnDraw = 1,
  },
}
Hgn_AssaultCorvetteElite = Hgn_AssaultCorvette
Hgn_PulsarCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(2,5),
    stretchOnDraw = 1,
  },
}
Hgn_MultiGunCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,7),
    stretchOnDraw = 1,
  },
}
Hgn_MinelayerCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(2,2),
    stretchOnDraw = 1,
  },
}
hgn_Moverelite = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      0,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Hgn_TorpedoFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,8),
    stretchOnDraw = 1,
  },
}
Hgn_TorpedoFrigateElite = Hgn_TorpedoFrigate
Hgn_AssaultFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,5),
    stretchOnDraw = 1,
  },
}
Hgn_IonCannonFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,6),
    stretchOnDraw = 1,
  },
}
Hgn_MarineFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,7),
    stretchOnDraw = 1,
  },
}
Hgn_AssaultMarineFrigate = Hgn_MarineFrigate
Hgn_MarineFrigate2 = Hgn_MarineFrigate
Hgn_MarineFrigate_Soban = Hgn_MarineFrigate
Hgn_DefenseFieldFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(2,1),
    stretchOnDraw = 1,
  },
}
Hgn_MotherShip = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,5),
    stretchOnDraw = 1,
  },
}
Hgn_Carrier = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,3),
    stretchOnDraw = 1,
  },
}
Hgn_Shipyard = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,4),
    stretchOnDraw = 1,
  },
}
Hgn_Shipyard_Elohim = Hgn_Shipyard
Hgn_Destroyer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,4),
    stretchOnDraw = 1,
  },
}
hgn_lightcruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,6),
    stretchOnDraw = 1,
  },
}
Hgn_BattleCruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(1,2),
    stretchOnDraw = 1,
  },
}
Hgn_BadgedCruiser = Hgn_BattleCruiser
Hgn_BattleCruiserelite = Hgn_BattleCruiser
Hgn_Dreadnaught = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      600,
      64,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Hgn_DreadnaughtBerth1 = Hgn_Dreadnaught
Hgn_DreadnaughtBerth2 = Hgn_Dreadnaught
Hgn_ECMProbe = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      700,
      256,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Hgn_GunTurret = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,2),
    stretchOnDraw = 1,
  },
}
Hgn_IonTurret = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}
Hgn_Probe = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      600,
      512,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Hgn_TargetDrone = Hgn_Probe
Hgn_ProximitySensor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      700,
      320,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Hgn_ResourceCollector = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,3),
    stretchOnDraw = 1,
  },
}
Hgn_ResourceController = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_hiigara.mres",
    textureUV = UV_Culc(3,8),
    stretchOnDraw = 1,
  },
}
kpr_scout = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,1),
    stretchOnDraw = 1,
  },
}
kpr_scout1=kpr_scout
kpr_Dronelight = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships1.mres",
    textureUV_TL = {
      588,
      194,
    },
    textureUV_WH = {
      165,
      64,
    },
    stretchOnDraw = 1,
  },
}
kpr_bomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,3),
    stretchOnDraw = 1,
  },
}
kpr_Drone = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,4),
    stretchOnDraw = 1,
  },
}
Kpr_AttackDroid = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,4),
    stretchOnDraw = 1,
  },
}
Kpr_Movers = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,5),
    stretchOnDraw = 1,
  },
}
Kpr_Mover = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(4,4),
    stretchOnDraw = 1,
  },
}
kpr_CaptureMover = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,7),
    stretchOnDraw = 1,
  },
}
Kpr_Mover1 = Kpr_Mover
kpr_HeavyMover = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,6),
    stretchOnDraw = 1,
  },
}
kpr_HeavyMover1 = kpr_HeavyMover
kpr_assaultfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(2,2),
    stretchOnDraw = 1,
  },
}
kpr_ioncannonfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(4,5),
    stretchOnDraw = 1,
  },
}
kpr_Destroyerfrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(4,6),
    stretchOnDraw = 1,
  },
}
kpr_Destroyerfrigate1 = {
 LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(2,4),
    stretchOnDraw = 1,
  },
}
kpr_researchship_1 = {
 LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(4,7),
    stretchOnDraw = 1,
  },
}
kpr_researchship_2 = kpr_researchship_1
kpr_researchship_3 = kpr_researchship_1
kpr_DefenseFieldFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(4,3),
    stretchOnDraw = 1,
  },
}
kpr_Deliver = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,3),
    stretchOnDraw = 1,
  },
}
kpr_Carrier = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(1,8),
    stretchOnDraw = 1,
  },
}

kpr_BalcoraGate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}

kpr_FakeBalcoraGate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}

Kpr_Destroyer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(2,7),
    stretchOnDraw = 1,
  },
}
Kpr_Destroyer1 = Kpr_Destroyer
kpr_ArsenalShip = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(2,8),
    stretchOnDraw = 1,
  },
}
kpr_Dreadnaught = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(2,6),
    stretchOnDraw = 1,
  },
}
kpr_dreadnaught1 = kpr_Dreadnaught
Kpr_Sajuuk = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(2,5),
    stretchOnDraw = 1,
  },
}
Kpr_Sajuuks = Kpr_Sajuuk
Kpr_Sajuuk_NoSensors = Kpr_Sajuuk
kpr_energy_photonBomb = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,4),
    stretchOnDraw = 1,
  },
}
kpr_energy_photoncannon = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,5),
    stretchOnDraw = 1,
  },
}
kpr_energy_ioncannon = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,8),
    stretchOnDraw = 1,
  },
}
kpr_energy_PhasedCannon = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,7),
    stretchOnDraw = 1,
  },
}
kpr_energy_Pulsar = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,2),
    stretchOnDraw = 1,
  },
}
kpr_energy_SuperPulsar = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(3,6),
    stretchOnDraw = 1,
  },
}
kpr_ResourceCollector = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(4,1),
    stretchOnDraw = 1,
  },
}
kpr_ResourceController = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_keeper.mres",
    textureUV = UV_Culc(4,2),
    stretchOnDraw = 1,
  },
}
kpr_Probe = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships1.mres",
    textureUV_TL = {
      620,
      790,
    },
    textureUV_WH = {
      120,
      60,
    },
    stretchOnDraw = 1,
  },
}
kpr_ProximitySensor = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships1.mres",
    textureUV_TL = {
      583,
      710,
    },
    textureUV_WH = {
      150,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_Scout = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,4),
    stretchOnDraw = 1,
  },
}
Vgr_Interceptor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,2),
    stretchOnDraw = 1,
  },
}
Vgr_Bomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,1),
    stretchOnDraw = 1,
  },
}
Vgr_LanceFighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,3),
    stretchOnDraw = 1,
  },
}
Vgr_MissileCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,5),
    stretchOnDraw = 1,
  },
}
Vgr_LaserCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,8),
    stretchOnDraw = 1,
  },
}
Vgr_CommandCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,7),
    stretchOnDraw = 1,
  },
}
Vgr_MinelayerCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(1,6),
    stretchOnDraw = 1,
  },
}
Vgr_HeavyMissileFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,2),
    stretchOnDraw = 1,
  },
}

Vgr_AssaultFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,1),
    stretchOnDraw = 1,
  },
}
Vgr_ArtilleryFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,3),
    stretchOnDraw = 1,
  },
}
vgr_EWfighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,5),
    stretchOnDraw = 1,
  },
}
Vgr_InfiltratorFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,4),
    stretchOnDraw = 1,
  },
}
Vgr_MotherShip = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(3,2),
    stretchOnDraw = 1,
  },
}
Vgr_MotherShip_Makaan = Vgr_MotherShip
hgn_MotherShip_Vgr = Vgr_MotherShip
Vgr_Carrier = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(3,4),
    stretchOnDraw = 1,
  },
}
hgn_Carrier_Vgr = Vgr_Carrier
Vgr_ShipYard = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(3,1),
    stretchOnDraw = 1,
  },
}
hgn_ShipYard_Vgr = Vgr_ShipYard
Vgr_Destroyer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(3,5),
    stretchOnDraw = 1,
  },
}
Vgr_defenseCruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(3,8),
    stretchOnDraw = 1,
  },
}
hgn_defenseCruiser_Vgr = Vgr_defenseCruiser
Vgr_BattleCruiser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(3,3),
    stretchOnDraw = 1,
  },
}
hgn_BattleCruiser_Vgr = Vgr_BattleCruiser
Vgr_Dreadnaught = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      600,
      64,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_WeaponPlatform_gun = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,8),
    stretchOnDraw = 1,
  },
}
Vgr_WeaponPlatform_missile = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,7),
    stretchOnDraw = 1,
  },
}
Vgr_HyperSpace_Platform = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(2,6),
    stretchOnDraw = 1,
  },
}
Vgr_HyperSpace_Platform_hq = Vgr_HyperSpace_Platform
Vgr_ResourceCollector = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(4,2),
    stretchOnDraw = 1,
  },
}
Vgr_ResourceController = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(4,1),
    stretchOnDraw = 1,
  },
}
Vgr_Probe = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      700,
      384,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_Probe_Prox = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      600,
      320,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_Probe_ECM = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      600,
      256,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_CruiseMissile = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships_vaygr.mres",
    textureUV = UV_Culc(3,7),
    stretchOnDraw = 1,
  },
}
Vgr_HyperSpace_Inhibitor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      300,
      512,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_CommStation = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      200,
      0,
    },
    textureUV_WH = {
      117,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_PlanetKillerMissile = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      192,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Vgr_PlanetKiller = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      128,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}

Meg_Asteroid = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      704,
    },
    textureUV_WH = {
      85,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_BalcoraGate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      600,
      448,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_BalcoraGate_Chunk1 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      700,
      448,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_BalcoraGate_Chunk2 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      700,
      448,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_BalcoraGate_Chunk3 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      700,
      448,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      750,
      640,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruins_Core_3 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      900,
      0,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruins_Core_1 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      64,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruins_Core_2 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      900,
      64,
    },
    textureUV_WH = {
      100,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_1 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_10 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_11 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_2 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_3 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_4 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_5 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_6 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_7 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_8 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Bentus_Ruin_9 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      512,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Chimera = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      320,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_DreadnaughtBerth = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      448,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Foundry = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      384,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Gehenna = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      576,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_Tanis = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      256,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_TanisStructure_Medium = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      256,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_TanisStructure_Medium2 = Meg_TanisStructure_Medium
StaticContainer = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      200,
      960,
    },
    textureUV_WH = {
      203,
      64,
    },
    stretchOnDraw = 1,
  },
}
StaticContainer2 = StaticContainer
StaticContainer3 = StaticContainer
StaticContainer4 = StaticContainer
StaticContainer5 = StaticContainer
StaticContainer6 = StaticContainer
StaticContainer7 = StaticContainer
StaticContainer8 = StaticContainer
StaticContainer9 = StaticContainer
StaticContainer10 = StaticContainer
StaticContainer11 = StaticContainer
Meg_VeilChunk1 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      832,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_VeilChunk2 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      800,
      832,
    },
    textureUV_WH = {
      200,
      64,
    },
    stretchOnDraw = 1,
  },
}
Meg_FoundryDebris_Chunk1 = Meg_VeilChunk1
Meg_FoundryDebris_Chunk2 = Meg_VeilChunk1
Meg_FoundryDebris_Chunk3 = Meg_VeilChunk1
Meg_FoundryDebris_Chunk4 = Meg_VeilChunk1
Meg_FoundryDebris_Flake1 = Meg_VeilChunk1
Meg_FoundryDebris_Flake2 = Meg_VeilChunk1
Meg_FoundryDebris_Flake3 = Meg_VeilChunk1
Meg_FoundryDebris_Flake4 = Meg_VeilChunk1
Sp_Tanker = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
    textureUV_TL = {
      0,
      960,
    },
    textureUV_WH = {
      197,
      64,
    },
    stretchOnDraw = 1,
  },
}
Sp_Tanker2 = Sp_Tanker
Sp_Tanker3 = Sp_Tanker
Sp_Tanker4 = Sp_Tanker
Sp_Tanker5 = Sp_Tanker
Sp_Tanker6 = Sp_Tanker
hgn_tanker_sp = Sp_Tanker
Icon_Subsystem_CapShip = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      0,
      0,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      0,
      0,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_CapShipAdvanced = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      0,
      32,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      0,
      24,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Corvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      0,
      64,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      0,
      48,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_CorvetteMover = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      0,
      96,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      0,
      72,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Fighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      0,
      128,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      0,
      96,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_DetectHyperspace = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      96,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      32,
      72,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Frigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      0,
      160,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      0,
      120,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_FrigateAdvanced = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      0,
      192,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      0,
      144,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_CloakGenerator = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      128,
      64,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      64,
      48,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_CommStation_bottom = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      192,
      64,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      96,
      48,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_TorpedoLauncher = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      128,
      32,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      64,
      24,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_IonTurret = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      192,
      32,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      96,
      24,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_FireControl = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      192,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      32,
      144,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Hyperspace = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      160,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      32,
      120,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_ResearchAdvanced = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      128,
      128,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      64,
      96,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_HyperspaceInhibitor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      128,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      32,
      96,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_PlatformControl = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      0,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      32,
      0,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Research = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      128,
      96,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      64,
      72,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_AdvancedArray = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      32,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      32,
      24,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_DetectCloaked = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      64,
      64,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      32,
      48,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Engine = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      192,
      0,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      96,
      0,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Resource = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subsystem.mres",
    textureUV_TL = {
      128,
      192,
    },
    textureUV_WH = {
      64,
      32,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      64,
      144,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_buildspeed = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds",
    textureUV_TL = {
      2,
      345,
    },
    textureUV_WH = {
      128,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds",
    textureUV_TL = {
      65,
      164,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_photonBomb = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      0,
      68,
    },
    textureUV_WH = {
      128,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds", 
    textureUV_TL = {
      96,
      96,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
kpr_HeavyGun2 = Icon_Subsystem_photonBomb
Icon_Subsystem_IonTurret1 = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      137,
      138,
    },
    textureUV_WH = {
      144,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      96,
      24,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
kpr_HeavyGun3 = Icon_Subsystem_IonTurret1
Icon_Subsystem_PhasedCannon = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      0,
      139,
    },
    textureUV_WH = {
      128,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds", 
    textureUV_TL = {
      96,
      120,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
kpr_HeavyGun4 = Icon_Subsystem_PhasedCannon
Icon_Subsystem_KeneticTurret = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      3,
      1,
    },
    textureUV_WH = {
      144,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds", 
    textureUV_TL = {
      96,
      71,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
kpr_HeavyGun5 = Icon_Subsystem_KeneticTurret
Icon_Subsystem_superpulsar = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      0,
      210,
    },
    textureUV_WH = {
      128,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds", 
    textureUV_TL = {
      96,
      144,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
kpr_HeavyGun6 = Icon_Subsystem_superpulsar
Icon_Subsystem_Missiledefense = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      0,
      278,
    },
    textureUV_WH = {
      128,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds", 
    textureUV_TL = {
      96,
      164,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_FighterAdvanced = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      137,
      0,
    },
    textureUV_WH = {
      144,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds",
    textureUV_TL = {
      0,
      168,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_Engine1 = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds",
    textureUV_TL = {
      2,
      410,
    },
    textureUV_WH = {
      128,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\icon_subs_taskbar.mres",
    textureUV_TL = {
      96,
      0,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
Icon_Subsystem_PS = {
   LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem.dds", 
    textureUV_TL = {
      137,
      68,
    },
    textureUV_WH = {
      144,
      64,
    },
    stretchOnDraw = 1,
  },
  SmallIcon = {
    texture = "DATA:\\Ship\\Icons\\subs\\icons_subs_taskbar.dds",
    textureUV_TL = {
      32,
      168,
    },
    textureUV_WH = {
      32,
      24,
    },
    stretchOnDraw = 1,
  },
}
der_Crate = {
	LargeIcon = {
		--pixelUVCoords = 1,
		texture = "DATA:\\Ship\\Icons\\HW1_icon_misc_ships.dds",
		textureUV = { 1024, 0, 1536, 256},
		stretchOnDraw = 1,
	},
}

crate_1=der_Crate
crate_2=der_Crate
crate_3=der_Crate
crate_4=der_Crate

vgr_c_module_nuclearbomb = Icon_Subsystem_TorpedoLauncher
vgr_c_module_fighterlance = kpr_HeavyGun6
vgr_c_module_corvettelaser = kpr_HeavyGun2
vgr_c_module_frigateEW = kpr_HeavyGun4
vgr_c_module_frigateartillery = Icon_Subsystem_Missiledefense
vgr_c_module_frigateinfiltrator = kpr_HeavyGun5
vgr_ms_module_nuclearbomb = Icon_Subsystem_TorpedoLauncher
vgr_ms_module_fighterlance = kpr_HeavyGun6
vgr_ms_module_corvettelaser = kpr_HeavyGun2
vgr_ms_module_frigateEW = kpr_HeavyGun4
vgr_ms_module_frigateartillery = Icon_Subsystem_Missiledefense
vgr_ms_module_frigateinfiltrator = kpr_HeavyGun5

kpr_HeavyGun1 = kpr_HeavyGun6
kpr_HeavyGun0 = hgn_hscore
Hgn_C_Production_Fighter = Icon_Subsystem_Fighter
Hgn_MS_Production_Fighter = Icon_Subsystem_Fighter
Hgn_C_Production_Corvette = Icon_Subsystem_Corvette
Hgn_MS_Production_Corvette = Icon_Subsystem_Corvette
Hgn_C_Production_Frigate = Icon_Subsystem_Frigate
Hgn_MS_Production_Frigate = Icon_Subsystem_Frigate
Hgn_C_Production_FrigateAdvanced = Icon_Subsystem_FrigateAdvanced
Hgn_MS_Production_FrigateAdvanced = Icon_Subsystem_FrigateAdvanced
Hgn_MS_Production_CapShip = Icon_Subsystem_CapShip
Hgn_SY_Production_CapShip = Icon_Subsystem_CapShip
Hgn_MS_Production_CapShipAdvanced = Icon_Subsystem_CapShipAdvanced
hgn_sy_production_capshipadvanced = Icon_Subsystem_CapShipAdvanced
Hgn_C_Module_PlatformControl = Icon_Subsystem_PlatformControl
Hgn_MS_Module_PlatformControl = Icon_Subsystem_PlatformControl
Hgn_C_Module_Research = Icon_Subsystem_Research
Hgn_MS_Module_Research = Icon_Subsystem_Research
Hgn_C_Module_ResearchAdvanced = Icon_Subsystem_ResearchAdvanced
Hgn_MS_Module_ResearchAdvanced = Icon_Subsystem_ResearchAdvanced
Hgn_C_Module_Hyperspace = Icon_Subsystem_Hyperspace
Hgn_MS_Module_Hyperspace = Icon_Subsystem_Hyperspace
Hgn_C_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Hgn_MS_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Hgn_C_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Hgn_MS_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Hgn_C_Module_FireControl = Icon_Subsystem_FireControl
Hgn_MS_Module_FireControl = Icon_Subsystem_FireControl
Hgn_C_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Hgn_MS_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Hgn_C_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Hgn_MS_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Hgn_C_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked
Hgn_MS_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked
Hgn_MS_Production_CorvetteMover = Icon_Subsystem_CorvetteMover
Hgn_C_Engine = Icon_Subsystem_Engine
Hgn_MS_Innate_Engine = Icon_Subsystem_Engine
Hgn_SY_Innate_Engine = Icon_Subsystem_Engine
Hgn_Des_Engine = Icon_Subsystem_Engine
Hgn_C_Innate_Resource = Icon_Subsystem_Resource
Hgn_MS_Innate_Resource = Icon_Subsystem_Resource
Hgn_SY_Innate_Resource = Icon_Subsystem_Resource
Vgr_C_Production_Fighter = Icon_Subsystem_Fighter
Vgr_MS_Production_Fighter = Icon_Subsystem_Fighter
Vgr_C_Production_Corvette = Icon_Subsystem_Corvette
Vgr_MS_Production_Corvette = Icon_Subsystem_Corvette
Vgr_C_Production_Frigate = Icon_Subsystem_Frigate
Vgr_MS_Production_Frigate = Icon_Subsystem_Frigate
Vgr_C_Module_PlatformControl = Icon_Subsystem_PlatformControl
Vgr_MS_Module_PlatformControl = Icon_Subsystem_PlatformControl
Vgr_MS_Production_CapShip = Icon_Subsystem_CapShip
Vgr_SY_Production_CapShip = Icon_Subsystem_CapShipAdvanced--Icon_Subsystem_CapShip
Vgr_C_Module_Research = Icon_Subsystem_Research
Vgr_MS_Module_Research = Icon_Subsystem_Research
Vgr_C_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Vgr_MS_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Vgr_C_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Vgr_MS_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Vgr_C_Module_FireControl = Icon_Subsystem_FireControl
Vgr_MS_Module_FireControl = Icon_Subsystem_FireControl
Vgr_C_Module_Hyperspace = Icon_Subsystem_Hyperspace
Vgr_MS_Module_Hyperspace = Icon_Subsystem_Hyperspace
Vgr_C_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Vgr_MS_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Vgr_C_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Vgr_MS_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Vgr_C_Engine = Icon_Subsystem_Engine
Vgr_DC_Engine = Icon_Subsystem_Engine
Vgr_C_Innate_Engine = Icon_Subsystem_Engine
Vgr_MS_Innate_Engine = Icon_Subsystem_Engine
Vgr_SY_Innate_Engine = Icon_Subsystem_Engine
Vgr_Des_Engine = Icon_Subsystem_Engine
Vgr_C_Innate_Resource = Icon_Subsystem_Resource
Vgr_MS_Innate_Resource = Icon_Subsystem_Resource
Vgr_SY_Innate_Resource = Icon_Subsystem_Resource
VGR_frigate_gravwellgenerator = Icon_Subsystem_HyperspaceInhibitor
HGN_SHIPYARD_SPG = Hgn_Shipyard
HGN_BATTLECRUISERENGINE = Icon_Subsystem_Engine
HGN_BATTLECRUISERIONBEAMTURRET = Icon_Subsystem_IonTurret
VGR_BATTLECRUISERENGINE = Icon_Subsystem_Engine
VGR_HEAVYFUSIONMISSILELAUNCHERBC = Icon_Subsystem_TorpedoLauncher
VGR_C_MISSILEVOLLEY = Icon_Subsystem_TorpedoLauncher
VGR_HYPERSPACEINHIBITOR = Icon_Subsystem_HyperspaceInhibitor
MEG_ASTEROID_NOSUBS = Meg_Asteroid
MEG_ASTEROIDMP = Meg_Asteroid
VGR_COMMSTATION_SUBSTATION = Icon_Subsystem_CommStation_bottom
VGR_COMMSTATION_SUBSTATION_M10 = Icon_Subsystem_CommStation_bottom
KPR_DESTROYERM10 = Kpr_Destroyer
Meg_Gehenna_1 = Meg_Gehenna
Meg_Gehenna_2 = Meg_Gehenna
Meg_Gehenna_3 = Meg_Gehenna
Meg_Gehenna_4 = Meg_Gehenna
Meg_Gehenna_5 = Meg_Gehenna
Meg_Gehenna_6 = Meg_Gehenna
Meg_Gehenna_7 = Meg_Gehenna
Hgn_drone_frigate = Hgn_Torpedofrigate
Hgn_drone_frigate_2 = Hgn_Assaultfrigate
Hgn_drone_frigate_3 = Hgn_Marinefrigate
Kpr_Mover_Capture = Kpr_Mover_Capture
kpr_HyperSpace_Platform = Vgr_HyperSpace_Platform
Meg_Bentus_Ruined = Meg_Bentus_Ruin_1
hgn_BATTLECRUISERIONBEAMTURRET1 = Icon_Subsystem_IonTurret
hgn_bc_Missiledefense_turret = Icon_Subsystem_Missiledefense
hgn_bc_burstcannon_turret = Icon_Subsystem_KeneticTurret
hgn_bc_pulsararray = Icon_Subsystem_superpulsar
hgn_lbc_engine = Icon_Subsystem_Engine
hgn_lbc_smallburstcannon = Icon_Subsystem_KeneticTurret
hgn_lbc_ioncannon_turret = Icon_Subsystem_IonTurret1
Hgn_lbc_AfterburnerEngine = Icon_Subsystem_Engine1
hgn_lbc_ps = Icon_Subsystem_PS
hgn_lbc_Turret = Icon_Subsystem_PS
hgn_lbc_HeavyTurret = Icon_Subsystem_KeneticTurret
hgn_lbc_Turret_F = Icon_Subsystem_PS
hgn_lbc_HeavyTurret_F = Icon_Subsystem_KeneticTurret
vgr_dc_Missile = Icon_Subsystem_TorpedoLauncher
vgr_dc_Missiledefense_turret = Icon_Subsystem_Missiledefense
vgr_dc_FireControl = Icon_Subsystem_FireControl
Vgr_C_Module_Research1 = Icon_Subsystem_Research
Vgr_MS_Module_Research1 = Icon_Subsystem_Research
kad_m_fighter = Icon_Subsystem_Fighter
kad_m_fighteradvanced = Icon_Subsystem_FighterAdvanced
kad_m_corvette = Icon_Subsystem_Corvette
kad_m_corvetteadvanced = Icon_Subsystem_CorvetteMover
kad_m_frigate = Icon_Subsystem_Frigate
kad_m_fighter1 = Icon_Subsystem_Fighter
kad_m_fighteradvanced1 = Icon_Subsystem_FighterAdvanced
kad_m_corvette1 = Icon_Subsystem_Corvette
kad_m_corvetteadvanced1 = Icon_Subsystem_CorvetteMover
kad_m_frigate1 = Icon_Subsystem_Frigate
kad_m_capship = Icon_Subsystem_Frigate
kad_m_capship1 = Icon_Subsystem_CapShip
kad_m_capshipadvanced = Icon_Subsystem_CapShipAdvanced
kad_m_capshipadvanced1 = Icon_Subsystem_CapShipAdvanced
kad_m_hyperspace = Icon_Subsystem_Hyperspace
kad_c_hyperspace = Icon_Subsystem_Hyperspace
kad_c_Cloak = kpr_HeavyGun4--Icon_Subsystem_CloakGenerator
kad_m_cloakgenerator = Icon_Subsystem_CloakGenerator
kad_m_buildspeed = Icon_Subsystem_buildspeed
kad_m_platformcontrol = Icon_Subsystem_PlatformControl
kad_m_platformcontrol1 = Icon_Subsystem_PlatformControl
kad_m_engine = Icon_Subsystem_Engine
kad_m_ioncannon = kpr_HeavyGun4
kad_m_ioncannon1 = kpr_HeavyGun4
kad_ml_ioncannon = kpr_HeavyGun4
kad_c_fighter = Icon_Subsystem_Fighter
kad_c_Lance = Icon_Subsystem_FighterAdvanced
kad_c_PlasmaBomb = Icon_Subsystem_FighterAdvanced
kad_c_Corvette = Icon_Subsystem_Corvette
kad_c_LiquidMetal = Icon_Subsystem_CorvetteMover
kad_c_ClusterGun = Icon_Subsystem_CorvetteMover
kad_c_frigate = Icon_Subsystem_Frigate
kad_c_multibeam = Icon_Subsystem_FrigateAdvanced
kad_c_multibeam_f = Icon_Subsystem_FrigateAdvanced
kad_c_Missile = Icon_Subsystem_TorpedoLauncher
kad_c_hyperspace = Icon_Subsystem_Hyperspace
kad_c_buildspeed = Icon_Subsystem_buildspeed
kad_c_superswarmer = Icon_Subsystem_CapShip
kad_c_superswarmer_f = Icon_Subsystem_CapShip
kad_c_platformcontrol = Icon_Subsystem_PlatformControl
kad_c_platformcontrol1 = Icon_Subsystem_PlatformControl
kad_c_engine = Icon_Subsystem_Engine
tai_bb_engine = Icon_Subsystem_Engine
kad_m_Innate_Resource = Icon_Subsystem_Resource
kad_hc_engine = Icon_Subsystem_Engine
Kad_M_SensorsArray = Icon_Subsystem_AdvancedArray
Kad_M_carrierplane = Icon_Subsystem_Frigate
kad_Module_FireControl = Icon_Subsystem_FireControl
kus_Module_firecontrol = Icon_Subsystem_FireControl
tur_Module_gravwellgenerator = Icon_Subsystem_HyperspaceInhibitor
tur_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
tur_supportfrigate1 = Icon_Subsystem_TorpedoLauncher
tur_supportfrigate2 = Icon_Subsystem_IonTurret
tur_supportfrigate3 = Icon_Subsystem_photonBomb
tur_supportfrigate4 = Icon_Subsystem_CloakGenerator
tur_ac_Fighter = Icon_Subsystem_Fighter
tur_ac_Corvette = Icon_Subsystem_Corvette
tur_ac_Frigate = Icon_Subsystem_Frigate
tur_ac_PlatformControl = Icon_Subsystem_PlatformControl
tur_ac_Fighter1 = Icon_Subsystem_Fighter
tur_ac_Corvette1 = Icon_Subsystem_Corvette
tur_ac_Frigate1 = Icon_Subsystem_Frigate
tur_ac_PlatformControl1 = Icon_Subsystem_PlatformControl
tur_ac_ResearchArmour = Icon_Subsystem_Research
tur_ac_ResearchSpeed = Icon_Subsystem_Research
tur_ac_hyperspace = Icon_Subsystem_Hyperspace
tur_ac_buildspeed = Icon_Subsystem_buildspeed
tur_ac_photoncannon = Icon_Subsystem_photonBomb
tur_ac_engine = Icon_Subsystem_Engine
tur_ac_engine_sp = Icon_Subsystem_Engine
tur_ac_heavymissile = Icon_Subsystem_TorpedoLauncher
tur_ac_weapon = kpr_HeavyGun4
tur_ac_weapon_f = kpr_HeavyGun4
tur_ac_repair = Icon_Subsystem_buildspeed
tur_ac_raid = Icon_Subsystem_FireControl
tur_R_Engine = Icon_Subsystem_Engine
tur_R_turret = Icon_Subsystem_KeneticTurret
tur_R_heavygun = Icon_Subsystem_KeneticTurret
tur_R_hyperspace = Icon_Subsystem_Hyperspace
tur_R_LightWeapon = Icon_Subsystem_Research
tur_R_HeavyWeapon = Icon_Subsystem_ResearchAdvanced
tur_AS_LightWeapon = Icon_Subsystem_Research
tur_AS_HeavyWeapon = Icon_Subsystem_ResearchAdvanced
tur_as_Fighter = Icon_Subsystem_Fighter
tur_as_Corvette = Icon_Subsystem_Corvette
tur_as_Frigate = Icon_Subsystem_CapShip--Icon_Subsystem_Frigate
tur_as_CapShip = Icon_Subsystem_CapShip
tur_as_PlatformControl = Icon_Subsystem_PlatformControl
tur_as_Fighter1 = Icon_Subsystem_Fighter
tur_as_Corvette1 = Icon_Subsystem_Corvette
tur_as_Frigate1 = Icon_Subsystem_Frigate
tur_as_CapShip1 = Icon_Subsystem_CapShip
tur_as_PlatformControl1 = Icon_Subsystem_PlatformControl
tur_as_ResearchArmour = Icon_Subsystem_Research
tur_as_ResearchSpeed = Icon_Subsystem_Research
tur_as_hyperspace = Icon_Subsystem_Hyperspace
tur_as_buildspeed = Icon_Subsystem_buildspeed
tur_as_HeavyGunArray = Icon_Subsystem_KeneticTurret
Tur_AS_TurretArray = Icon_Subsystem_KeneticTurret
tur_as_Frigateadvanced = Icon_Subsystem_CloakGenerator
tur_as_FrigateCapture = Icon_Subsystem_FrigateAdvanced
tur_R_CloakProduction = Icon_Subsystem_CloakGenerator
tur_R_FrigateAdvanced = Icon_Subsystem_FrigateAdvanced
tur_as_CapShipadvanced = Icon_Subsystem_CapShipAdvanced
tur_HC_weapon = Icon_Subsystem_FireControl
tur_HC_engine = Icon_Subsystem_Engine
tur_HC_hyperspace = Icon_Subsystem_Hyperspace
TAI_AD_Engine = Icon_Subsystem_Engine
TAI_MD_engine = Icon_Subsystem_Engine
TAI_HC_engine = Icon_Subsystem_Engine
TAI_M_engine = Icon_Subsystem_Engine
TAI_M_hyperspace = Icon_Subsystem_Hyperspace
Tai_SY_engine = Icon_Subsystem_Engine
TAI_C_engine = Icon_Subsystem_Engine
TAI_c_hyperspace = Icon_Subsystem_Hyperspace
TAI_c_hyperspaceinhibitor = Icon_Subsystem_HyperspaceInhibitor
TAI_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
TAI_Module_gravwellgenerator = Icon_Subsystem_HyperspaceInhibitor
tai_r = Icon_Subsystem_Research
tai_r_fighter = Icon_Subsystem_Research
tai_r_Corvette = Icon_Subsystem_Research
tai_r_defensefighters = Icon_Subsystem_Research
tai_r_HeavyCorvette = Icon_Subsystem_Research
tai_r_multigun = Icon_Subsystem_Research
tai_r_PlasmaBombs = Icon_Subsystem_Research
tai_researchship_3 = TAI_researchship
tai_researchship_2 = TAI_researchship
tai_researchship_4 = TAI_researchship
tai_researchship_5 = TAI_researchship
tai_researchship_1 = TAI_researchship
tai_researchship_3f = TAI_researchship
tai_researchship_2f = TAI_researchship
tai_researchship_4f = TAI_researchship
tai_researchship_5f = TAI_researchship
tai_researchship_1f = TAI_researchship
tai_rs = Icon_Subsystem_Research
tai_rs_capship = Icon_Subsystem_CapShip
tai_rs_defense = Icon_Subsystem_PS
tai_rs_heavygun = Icon_Subsystem_KeneticTurret
tai_rs_ioncannon = kpr_HeavyGun4
tai_rs_missile = Icon_Subsystem_TorpedoLauncher
tai_rs_sensorarray = Icon_Subsystem_AdvancedArray
kpr_BUILD = Icon_Subsystem_Research
kpr_Hyperspace = Icon_Subsystem_Research
kpr_Core = Icon_Subsystem_Research
kpr_E_ioncannon = Icon_Subsystem_Research
kpr_E_PhasedCannon = Icon_Subsystem_Research
kpr_E_photonBomb = Icon_Subsystem_Research
kpr_E_photoncannon = Icon_Subsystem_Research
kpr_E_Pulsar = Icon_Subsystem_Research
kpr_E_SuperPulsar = Icon_Subsystem_Research
KUS_DestroyerEngine 		= Icon_Subsystem_Engine
KUS_MissileDestroyerEngine 		= Icon_Subsystem_Engine
KUS_HeavyCruiserEngine 		= Icon_Subsystem_Engine
KUS_CarrierEngine 		= Icon_Subsystem_Engine
KUS_CarrierResource				= Icon_Subsystem_Resource
KUS_MothershipEngine 		= Icon_Subsystem_Engine
KUS_MothershipResource				= Icon_Subsystem_Resource


dofilepath("data:leveldata/campaign/tutorial/RPG/Icon/ship/ShipIcon.lua")