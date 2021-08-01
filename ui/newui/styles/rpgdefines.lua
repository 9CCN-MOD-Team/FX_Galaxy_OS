RPG_COLOR_BUTTON_TEXT_WHITE = {255, 255, 255, 255}
RPG_COLOR_BUTTON_TEXT_YELLOW = {255, 150, 0, 255}

--RPG_COLOR_BUTTON_BKG_DEFAULT = {41, 44, 45, 255}
RPG_COLOR_BUTTON_BKG_DEFAULT = {31, 32, 34, 255}
RPG_COLOR_BUTTON_BKG_GRAY = {119, 122, 132, 255}
RPG_COLOR_BUTTON_BKG_WHITER = {165, 169, 183, 255}
RPG_COLOR_BUTTON_BKG_YELLOW = {255, 183, 35, 255}

RPG_SURFACE_BUTTON_TEXT_YELLOW = {
  surface = "ui_multistate_tint";
  { prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "tint_0", float4 = RPG_COLOR_BUTTON_TEXT_YELLOW },
  { prop = "tint_1", float4 = RPG_COLOR_BUTTON_TEXT_YELLOW },
  { prop = "tint_2", float4 = RPG_COLOR_BUTTON_TEXT_YELLOW },
  { prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
}
RPG_SURFACE_BUTTON_TEXT_WHITE = {
  surface = "ui_multistate_tint";
  { prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "tint_0", float4 = RPG_COLOR_BUTTON_TEXT_WHITE },
  { prop = "tint_1", float4 = RPG_COLOR_BUTTON_TEXT_WHITE },
  { prop = "tint_2", float4 = RPG_COLOR_BUTTON_TEXT_WHITE },
  { prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
}


RPG_SURFACE_BUTTON_BKG = {
  surface = "ui_multistate_tint";
  { prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
  { prop = "tint_0", float4 = RPG_COLOR_BUTTON_BKG_DEFAULT },
  { prop = "tint_1", float4 = RPG_COLOR_BUTTON_BKG_GRAY },
  { prop = "tint_2", float4 = RPG_COLOR_BUTTON_BKG_WHITER },
  { prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
}

RPG_SURFACE_BUTTON_BKG_YELLOW = {
  surface = "ui_multistate_tint";
  { prop = "state0", float3 = {0, 0, 0 } },
  { prop = "state1", float3 = {0, 0, 0 } },
  { prop = "state2", float3 = {0, 0, 0 } },
  { prop = "decal", float3 = { 0, 0, 0 } },
  { prop = "tint_0", float4 = RPG_COLOR_BUTTON_BKG_DEFAULT },
  { prop = "tint_1", float4 = RPG_COLOR_BUTTON_BKG_WHITER },
  { prop = "tint_2", float4 = RPG_COLOR_BUTTON_BKG_YELLOW },
  { prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
}