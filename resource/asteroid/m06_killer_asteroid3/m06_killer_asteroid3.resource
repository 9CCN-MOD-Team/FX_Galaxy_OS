NewResourceTypeM06_Killer_Asteroid3 = StartAsteroidConfig()
NewResourceTypeM06_Killer_Asteroid3.displayedName="2508"
NewResourceTypeM06_Killer_Asteroid3.sobDescription="2509"
NewResourceTypeM06_Killer_Asteroid3.maxhealth=10000
NewResourceTypeM06_Killer_Asteroid3.regentime=0
NewResourceTypeM06_Killer_Asteroid3.nlips=0.000025
NewResourceTypeM06_Killer_Asteroid3.nlipsRange=150000
NewResourceTypeM06_Killer_Asteroid3.nlipsFar=0.0000025
NewResourceTypeM06_Killer_Asteroid3.nlipsFarRange=150000
NewResourceTypeM06_Killer_Asteroid3.SMRepresentation="HardDot"
NewResourceTypeM06_Killer_Asteroid3.meshRenderLimit=35000
NewResourceTypeM06_Killer_Asteroid3.dotRenderLimit=45000
NewResourceTypeM06_Killer_Asteroid3.visibleInSecondary=1
NewResourceTypeM06_Killer_Asteroid3.minLOD=0.25
NewResourceTypeM06_Killer_Asteroid3.upLOD=20000
NewResourceTypeM06_Killer_Asteroid3.downLOD=20015
NewResourceTypeM06_Killer_Asteroid3.minimumZoomFactor=0.68
NewResourceTypeM06_Killer_Asteroid3.selectionSizeMin=0
NewResourceTypeM06_Killer_Asteroid3.selectionSizeMax=0
NewResourceTypeM06_Killer_Asteroid3.selectionPriority=50
NewResourceTypeM06_Killer_Asteroid3.relativeMoveFactor=4
NewResourceTypeM06_Killer_Asteroid3.useEngagementRanges=0
NewResourceTypeM06_Killer_Asteroid3.pixelSize=2
NewResourceTypeM06_Killer_Asteroid3.pixelColour={0.65, 0.58, 0.46, 1.0}
NewResourceTypeM06_Killer_Asteroid3.pixelColourDepleted={0.5, 0.4, 0.3, 1.0}
NewResourceTypeM06_Killer_Asteroid3.resourceValue=0
NewResourceTypeM06_Killer_Asteroid3.blobRadius=0
NewResourceTypeM06_Killer_Asteroid3.maxVelocity=10000
NewResourceTypeM06_Killer_Asteroid3.maxAngularVelocity=0.15
NewResourceTypeM06_Killer_Asteroid3.linearFriction=0.5
NewResourceTypeM06_Killer_Asteroid3.angularFriction=0.5
NewResourceTypeM06_Killer_Asteroid3.mass=400000
NewResourceTypeM06_Killer_Asteroid3.Ixx=100
NewResourceTypeM06_Killer_Asteroid3.Iyy=100
NewResourceTypeM06_Killer_Asteroid3.Izz=100
NewResourceTypeM06_Killer_Asteroid3.DockFamily="Resource"
NewResourceTypeM06_Killer_Asteroid3.AvoidanceFamily="SmallRock"
NewResourceTypeM06_Killer_Asteroid3.AttackFamily="Resource"
NewResourceTypeM06_Killer_Asteroid3.ArmourFamily="ResourceArmour"
NewResourceTypeM06_Killer_Asteroid3.CollisionFamily="Small"
NewResourceTypeM06_Killer_Asteroid3.DisplayFamily="Resource"
setCollisionDamageToModifier(NewResourceTypeM06_Killer_Asteroid3, "Ship", 2.25)
setCollisionDamageFromModifier(NewResourceTypeM06_Killer_Asteroid3, "Ship", 1)

SpawnAsteroidOnDeath(NewResourceTypeM06_Killer_Asteroid3, "Asteroid_4_piece01", 1, 0,0,0,30, -55,0,-25,0,  0,0,0,30,  0,0,-8,3)
SpawnAsteroidOnDeath(NewResourceTypeM06_Killer_Asteroid3, "Asteroid_4_piece02", 1, 0,0,0,30, 35,0,0,0,     0,0,0,30,  8,0,0,3)
SpawnAsteroidOnDeath(NewResourceTypeM06_Killer_Asteroid3, "Asteroid_4_piece03", 1, 0,0,0,30, -75,0,25,0,   0,0,0,30,  -8,0,0,3)
resourceAttackMode(NewResourceTypeM06_Killer_Asteroid3, RegularAttack)
NewResourceTypeM06_Killer_Asteroid3.sobDieTime=1.5

