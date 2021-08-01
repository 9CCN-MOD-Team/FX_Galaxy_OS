AttackStyleName = FlyRound
Data = {
  howToBreakFormation = StraightAndScatter,
  axisRotation = 15,
  maxAxisRotation = 20,
  circleSegmentAngle = 45,
  angleVariation = 0.2,
  circleHeight = -300,
  distanceFromTarget = -100,
  distanceVariation = 0.2,
  percentChanceOfCutting = 5,
  minSegmentsToCut = 1,
  maxSegmentsToCut = 3,
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
