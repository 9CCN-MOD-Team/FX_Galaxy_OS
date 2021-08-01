function DegToRad(angle)	
	return
	angle * ((2 * 3.141592653589) / 360)
end

AttackStyleName = FaceTarget

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	--	Once past this amount * the weapon range the ship will stop and turn it's side to the target
	inRangeFactor = 0.85,
	-- once in range and facing the target we will slide around maintaining heading until we are more 
	-- then this multiplied by our range from the target, then we will fly normally to catch up
	slideDistanceMultiplier = 1.5,
	tooSlowSpeed = 3,
	tooFastMultiplier = 1.4,
	facingAngle = 180,
	-- when doing a move attack we will break off after we get further than this multiplied by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	tryToMatchHeight = 0,
	tryToGetAboveTarget = 0,
	-- delays for the things the attack style can do (in seconds)
	flyToTargetBecauseItsFarOutOfRangeDelay = 0,
	flyToTargetBecauseItsMovingAwayDelay = 1,
	stopAndFaceTheTargetDelay = 1,
	flyToAboveTheTargetDelay = 1,
	-- done every turn that the ship is in range and sitting still
	RandomActions = 
	{
		{
			Type = InterpolateTarget,
			Weighting = 10,
		},
		{
			Type = PickNewTarget,
			Weighting = 10,
		},
		{
			Type = NoAction,
			Weighting = 200,
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(2.5),
			maxParam = DegToRad(4),
			Weighting = 1,
		},
	},
	BeingAttackedActions = {},
	FiringActions = {},
}

