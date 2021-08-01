AttackStyleName = MoveToTargetAndShoot
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 0.8,
  happilySameHeight = 50,
  m_tooLongOutOfRange = 2.5,
  moveAttackMaxDistanceMultiplier = 1.2,
  maxTimeToSpendTryingToMatchHeight = 4,
  flyToTargetBecauseItsFarOutOfRangeDelay = 0.5,
  flyToSameHeightAsTargetDelay = 2,
  flyToAboveTheTargetDelay = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 55,
    },
    {
      Type = InterpolateTarget,
      Weighting = 4,
    },
    {
      Type = NoAction,
      Weighting = 1,
    },
  },
  BeingAttackedActions = {},
  FiringActions = {},
}
