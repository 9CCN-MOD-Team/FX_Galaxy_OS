AttackStyleName = FaceTarget
Data = { 
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 1, 
    slideDistanceMultiplier = 1.5, 
    tooSlowSpeed = 2, 
    tooFastMultiplier = 1.4, 
    facingAngle = 0, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    tryToMatchHeight = 0, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 0, 
    flyToTargetBecauseItsMovingAwayDelay = 1, 
    stopAndFaceTheTargetDelay = 1, 
    flyToAboveTheTargetDelay = 1, 
    RandomActions = {
     }, 
    BeingAttackedActions = {
   {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "MultiBeamRollCW",
    },
    }, 
    FiringActions = { 
     {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "MultiBeamRollCCW",
    },
     {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "MultiBeamRollCW",
    },
    }, 
   }
