AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 2000,
  distanceFromTargetToBreak = 500,
  safeDistanceFromTargetToDoActions = 800,
  coordSysToUse = Attacker,
  horizontalMin = 0.1,
  horizontalMax = 0.2,
  horizontalFlip = 1,
  verticalMin = 0.1,
  verticalMax = 0.2,
  verticalFlip = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = NoAction,
      Weighting = 9,
    },
  },
  BeingAttackedActions = {
    {
      Type = PickNewTarget,
      Weighting = 9,
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "RollCW",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "RollCCW",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "BarrelRoll",
    },
  },
  FiringActions = {},
}
