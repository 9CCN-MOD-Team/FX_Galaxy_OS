AttackStyleName = CircleStrafe
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 0.9,
  optimumRangeMultiplier = 60,
  rangeMultiplierForHeight = 0.1,
  RandomActions = {},
  BeingAttackedActions = {},
  FiringActions = {
     {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "DodgeRoll_Left_Static_Delay",
    },
     {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "DodgeRoll_Right_Static_Delay",
    },
    {
      Type = NoAction,
      Weighting = 4,
    },
  },
}
