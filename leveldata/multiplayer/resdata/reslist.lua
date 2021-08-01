Units=
{

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
	{
		Name = "hgn_scout",
		Type = "Fighter",
		Size = 3,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"IsShipIdioStateKeyOn",1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
        			0.25,
				},                                 
				{
					"ShipIdioStateKeyTempOn",
					"Other",
					{
						{
							{"IsUnderAttack",1},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					1,
					20,
					200/3,
				},
			},
			Exemption =
			{
			},
		},
  	},

	{
		Name = "hgn_marinefrigate",
		Type = "Frigate",
		Size = 1,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"IsShipIdioStateKeyOn",1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
        			1,
				},                                 
				{
					"ShipIdioStateKeyTempOn",
					"Other",
					{
						{
							{"IsCapturing",1},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					1,
					20,
					200/3,
				},
			},
			Exemption =
			{
			},
		},
  	},



------------------------------------------------------------------------------------


------------------------------------------------------------------------------------
	{
		Name = "kpr_assaultfrigate",
		Type = "Frigate",
		Size = 1,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
				{
					"EffectOnly",
					"Other",
					{},
					{},
					{},
					{{"ResourceStart",},{},5,0},
					{{},{},0,0},
					{{"ResourceEnd",},{},5,0},
					{1,1,},
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "kpr_destroyer1",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic =
			{
				{
					"DroneShip",
					"Other",
					{},
					{},
					{},
					{{},{},0,0},
					{{},{},1,0},
					{{},{},0,0},
					{1,1,},
					"kpr_drone",
					2,
					{20,10},
					{3000,3000,3000,},
					1,
					1,
					{0,1,1,},
				},
				{
					"OneselfInvulnerability",
					"Other",
					{
						{
							{"DefenseFieldOpen",1,},
							{"IsControlledBy",1},
						},
						{
							{"IsShipIdioStateKeyOn",1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{"Phase_Loop",},32,0},
					{{},{},0,0},
					{1,1,},
				},
				{
					"ShipIdioStateKeyTempOn",
					"Other",
					{
						{
							{"IsUnderAttack",1,},
							{"HealthChanged",-3,},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					1,
					16,
					80,
				},
			},
			Exemption = 
			{
			},
		},
	},
------------------------------------------------------------------------------------
	{
		Name = "kus_repaircarrier",
		Type = "Capital",
		Size = 1,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
				{
					"DroneShip",
					"Other",
					{},
					{},
					{},
					{{},{},0,0},
					{{},{},1,0},
					{{},{},0,0},
					{1,1,},
					"kus_repaircorvette",
					2,
					{20,10},
					{-3000,-3000,-3000,},
					2,
					0,
					{0,2,2,},
				},
			},
			Exemption = 
			{
			},
		},
	},
------------------------------------------------------------------------------------
	{
		Name = "kad_variationswarmer",
		Type = "Fighter",
		Size = 1,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
       			{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"HealthPercentage",100},
							{"IsControlledBy",4},
						},
						{
							{"HealthPercentage",100},
							{"IsUnderAttack",0},
							{"IsControlledBy",5},
						},
						{
							{"IsControlledBy",1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 2,
					 1,
				},
       			{
					"OneselfCommand",
					"Other",
					{
						{
							{"HealthPercentage",-99},
							{"IsControlledBy",4},
						},
						{
							{"HealthPercentage",-99},
							{"IsControlledBy",5},
						},
						{
							{"IsUnderAttack",1},
							{"IsControlledBy",5},
						},
					},
					{},
					{},
					{{},{},1,0},
					{{},{},0,0},
					{{},{},1,0},
					{1,1,},
					 12,
					 0,
					 {0,0,0,},
					 0,
					 {},
					 0,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "kad_mothership",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"HasSubsystem",0,"Kad_M_Capship"},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					0.5,
				},
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"HasSubsystem",0,"Kad_M_CapshipAdvanced"},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					0.5,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "kad_mothershipdark",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"HasSubsystem",0,"Kad_M_Capship"},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					0.5,
				},
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"HasSubsystem",0,"Kad_M_CapshipAdvanced"},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					0.5,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "kad_mothershiplight",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfChangePower",
					"Other",
					{
						{
							{"IsShipIdioStateKeyOn",1},
							{"IsControlledBy",1},
						},
						{
							{"IsAttackingFamily",0,"Frigate",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"Capturer",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"SmallCapitalShip",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"BigCapitalShip",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"Mothership",},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{"ResourceStart",},{},16,0},
					{{"ResourceDo",},{},4,0},
					{{"ResourceEnd",},{},12,0},
					{1,1,},
					{"Weapon_PhasedCannon",},
					{"",},
				},
				{
					"OneselfRepair",
					"Add",
					{
						{
							{"IsCharacteristicActive",-1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					0.0064,
				},
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"HasSubsystem",0,"Kad_M_Capship"},
							{"IsCharacteristicActive",-1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					0.5,
				},
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"HasSubsystem",0,"Kad_M_CapshipAdvanced"},
							{"IsCharacteristicActive",-1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					0.5,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "kad_fuelpod",
		Type = "Frigate",
		Size = 1,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfChangePower",
					"Other",
					{
						{
							{"IsShipIdioStateKeyOn",-1},
						},
					},
					{},
					{},
					{{"ResourceStart",},{},10,0},
					{{"ResourceDo",},{},1,0},
					{{"ResourceEnd",},{},10,0},
					{1,1,},
					{"Weapon_TurretTop",},
					{"",},
				},
				{
					"OneselfSpeedChange",
					"Multiplication",
					{
						{
							{"IsShipIdioStateKeyOn",1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
        			0,
				},                                 
				{
					"DroneShip",
					"Other",
					{},
					{},
					{},
					{{},{},0,0},
					{{},{},1,0},
					{{},{},0,0},
					{1,1,},
					"KAD_lanceswarmer1",
					3,
					{10,5},
					{3000,3000,3000},
					1,
					3,
					{1,2,2},
				},
				{
					"EffectOnly",
					"Other",
					{
						{
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0,Kad_SupportPod_AI},
					{{},{},0,0},
					{1,1,},
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "kad_guardianspirit",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic = 
			{
				{
				"DroneShip",
				"Other",
				{},
				{},
				{},
				{{},{},0,0},
				{{},{},1,0},
				{{},{},0,0},
				{1,1,},
				"KAD_SuperswarmerA",
				1,
				{10,5},
				{-100,4500,4500},
				2,
				0,
				{1,2,2},
				},
				{
				"DroneShip",
				"Other",
				{},
				{},
				{},
				{{},{},0,0},
				{{},{},1,0},
				{{},{},0,0},
				{1,1,},
				"KAD_SuperswarmerB",
				1,
				{10,5},
				{-100,4500,4500},
				2,
				0,
				{1,2,2},
				},
				{
				"DroneShip",
				"Other",
				{},
				{},
				{},
				{{},{},0,0},
				{{},{},1,0},
				{{},{},0,0},
				{1,1,},
				"KAD_SuperswarmerC",
				1,
				{10,5},
				{-100,4500,4500},
				2,
				0,
				{1,2,2},
				},
				{
				"DroneShip",
				"Other",
				{},
				{},
				{},
				{{},{},0,0},
				{{},{},1,0},
				{{},{},0,0},
				{1,1,},
				"KAD_SuperswarmerD",
				1,
				{10,5},
				{-100,4500,4500},
				2,
				0,
				{1,2,2},
				},
				{
				"DroneShip",
				"Other",
				{},
				{},
				{},
				{{},{},0,0},
				{{},{},1,0},
				{{},{},0,0},
				{1,1,},
				"KAD_SuperswarmerE",
				1,
				{10,5},
				{-100,4500,4500},
				2,
				0,
				{1,2,2},
				},
				{
				"DroneShip",
				"Other",
				{},
				{},
				{},
				{{},{},0,0},
				{{},{},1,0},
				{{},{},0,0},
				{1,1,},
				"KAD_SuperswarmerF",
				1,
				{10,5},
				{-100,4500,4500},
				2,
				0,
				{1,2,2},
				},
			},
			Exemption =
			{
			},
		},
	},
------------------------------------------------------------------------------------
	{
		Name = "tai_missiledestroyer",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability = 
		{
			Characteristic =
			{
				{
					"OneselfChangePower",
					"Other",
					{
						{
							{"IsShipIdioStateKeyOn",1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					{"Weapon_MissileLeftTop","Weapon_MissileLeftBottom","Weapon_MissileRightTop","Weapon_MissileRightBottom",},
					{},--{"Weapon_Missile",},
				},                                 
				{
					"ShipIdioStateKeyTempOn",
					"Other",
					{
						{
							{"IsAttackingFamily",0,"Capturer",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"SmallCapitalShip",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"BigCapitalShip",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"Mothership",},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					1,
					10,
					100,
				},
			},
			Exemption =
			{
			},
		},
	},
------------------------------------------------------------------------------------
	{
		Name = "tur_missilecorvette",
		Type = "Corvette",
		Size = 1,
		LifeBarType = 1,
 		Ability =
		{
			Characteristic =
			{
      	{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"IsAttackingFamily",0,"Capturer",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"Frigate",},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 25,
					 1,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "tur_torpedocorvette",
		Type = "Corvette",
		Size = 1,
		LifeBarType = 1,
 		Ability =
		{
			Characteristic =
			{
				{
					"OneselfSpeedChange",
					"Add",
					{
						{
							{"IsShipIdioStateKeyOn",1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
        	1,
				},                                 
       	{
					"OneselfCommand",
					"Other",
					{
						{
							{"IsShipIdioStateKeyOn",1,},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},1,0},
					{{},{},0,0},
					{{},{},1,0},
					{1,1,},
					 9,
					 0,
					 {1,1,0,},
					 0,
					 {},
					 0,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "tur_carrier",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfChangePower",
					"Other",
					{
						{
							{"IsShipIdioStateKeyOn",1},
						},
					},
					{},
					{},
					{{"ResourceStart",},{},4,0},
					{{"ResourceDo",},{},1,0},
					{{"ResourceEnd",},{},4,0},
					{1,1,},
					{"Weapon_MissilePod",},
					{},
				},
				{
					"OneselfChangePower",
					"Other",
					{
						{
							{"HasSubsystem",0,"Tur_AC_HeavyMissile"},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					{"Weapon_heavymissile","Weapon_LaserSight01","Weapon_LaserSight02",},
					{},
				},
				{
					"ShipIdioStateKeyTempOn",
					"Other",
					{
						{
							{"IsControlledBy",-1},
							{"HasSubsystem",0,"Tur_AC_HeavyMissile"},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					1,
					12,
					120,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "tur_heavycruiser",
		Type = "Capital",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"HardpointHealth","Generic 1",0},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 25,
					 0,
				},
				{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"HardpointHealth","Generic 2",0},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 13,
					 0,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "tur_ionarrayfrigate",
		Type = "Frigate",
		Size = 1,
		LifeBarType = 2,
		Ability =
		{
			Characteristic =
			{
       			{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"HealthPercentage",-50},
							{"IsControlledBy",4},
						},
						{
							{"HealthPercentage",-50},
							{"IsControlledBy",5},
						},
						{
							{"IsControlledBy",1},
						},
						{
							{"IsControlledBy",2},
						},
						{
							{"IsControlledBy",3},
						},
					},
					{
						{"scoutCloakTech",}
					},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 5,
					 1,
				},
       			{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"IsCloaked",1},
							{"IsControlledBy",-1},
						},
					},
					{
						{"scoutCloakTech",}
					},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 2,
					 0,
				},
			},
			Exemption =
			{
			},
		},
	},
	{
		Name = "tur_SiegeDrillfrigate",
		Type = "Frigate",
		Size = 1,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
				{
					"OneselfChangePower",
					"Other",
					{
						{
							{"IsCapturingAndLatched",1,},
							{"Tactic",1,},
							{"IsControlledBy",1},
						},
						{
							{"IsCapturingAndLatched",1,},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{"ResourceStart",},{"E_Open",},1,0},
					{{"ResourceDo",},{"E_Shocking",},6.25,0},
					{{"ResourceEnd",},{},1,0},
					{1,1,},
					{"Weapon_PodLauncher",},
					{},
				},
			},
			Exemption =
			{
			},
		},
	},
	----------------------------------------------------------
	{
		Name = "ben_corvette",
		Type = "Corvette",
		Size = 1,
		LifeBarType = 1,
		Ability =
		{
			Characteristic =
			{
       	{
					"OneselfCommand",
					"Other",
					{
						{
							{"HealthPercentage",-20},
							{"IsControlledBy",4},
						},
						{
							{"HealthPercentage",-20},
							{"IsControlledBy",5},
						},
					},
					{},
					{},
					{{},{},1,0},
					{{},{},0,0},
					{{},{},1,0},
					{1,1,},
					 9,
					 0,
					 {1,1,0,},
					 0,
					 {},
					 0,
				},
				{
					"ShipIdioStateKeyTempOn",
					"Other",
					{
						{
							{"IsAttackingFamily",0,"Frigate",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"Capturer",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"SmallCapitalShip",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"BigCapitalShip",},
							{"IsControlledBy",-1},
						},
						{
							{"IsAttackingFamily",0,"Mothership",},
							{"IsControlledBy",-1},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					1,
					60,
					0.1,
				},
				{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"IsAttacking",0,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 21,
					 1,
				},
				{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"IsShipIdioStateKeyOn",1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 25,
					 1,
				},
				{
					"OneselfShipAbility",
					"Other",
					{
						{
							{"IsShipIdioStateKeyOn",1,},
						},
					},
					{},
					{},
					{{},{},0,0},
					{{},{},0,0},
					{{},{},0,0},
					{1,1,},
					 20,
					 0,
				},
			},
			Exemption =
			{
			},
		},
	},
}

UnitReplacementList = 
{
}

DustCloudList = 
{
}

NebulaCloudList = 
{
}

BarDisplayOnOff = 1
SPingStringVersion = "CS"
OverBarShieldDisplayOnOff = 1
OverBarArmorDisplayOnOff = 1
OverBarFuelDisplayOnOff = 1
OverBarLevelDisplayOnOff = 1
SelectedBarShieldDisplayOnOff = 1
SelectedBarArmorDisplayOnOff = 1

LevelExperienceList = 
{
}

ScheduledShipAbilityMaxNumber = 20
