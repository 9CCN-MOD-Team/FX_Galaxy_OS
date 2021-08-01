AttackStyleName = FlyRound
Data = {
  howToBreakFormation = StraightAndScatter,
  axisRotation = 5,
  maxAxisRotation = 20,
  circleSegmentAngle = 30,
  angleVariation = 0.2,
  circleHeight = -300,
  distanceFromTarget = 800,
  distanceVariation = 0.1,
  percentChanceOfCutting = 5,
  minSegmentsToCut = 1,
  maxSegmentsToCut = 1,
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
  BeingAttackedActions = {},
  FiringActions = {},
}
