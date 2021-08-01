AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 1600,
  distanceFromTargetToBreak = 850,
  safeDistanceFromTargetToDoActions = 1200,
  useTargetUp = 0,
  coordSysToUse = TargetPoint,
  horizontalMin = 0.2,
  horizontalMax = 0.6,
  horizontalFlip = 1,
  verticalMin = 0.4,
  verticalMax = 0.7,
  verticalFlip = 0,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = NoAction,
      Weighting = 2,
    },
  },
  BeingAttackedActions = {},
  FiringActions = {
    {
      Type = NoAction,
      Weighting = 25,
    },
    {
      Type = FlightManeuver,
      Weighting = 3,
      FlightManeuverName = "RollCW",
    },
    {
      Type = FlightManeuver,
      Weighting = 3,
      FlightManeuverName = "RollCCW",
    },
  },
}
