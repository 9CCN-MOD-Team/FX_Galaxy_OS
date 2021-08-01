--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Hgn Carrier Parade formation
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- format   slot-name   vector-offset    vector-heading  vector-direction of growth     size-of-growth (set to 0 if want default)
-- offset determines offset from center of formation
-- heading determines heading, use { 0,0,1 } for forward
-- direction of growth determines how new formations will grow out
-- size of growth determines how spaced out additional formations are.  Set to 0 for default
-- one slot MUST be called "misc", leftovers will get put here

-- left
paradeSlot("vgr_hyperspace_platform_hq",{0, 0, 0},		{0,0,1}, {1,0,0},      0);                -- grows right
paradeSlot("misc",                      {0, 0, 1500},		{0,0,1}, {1,0,0},      0);                -- grows right
