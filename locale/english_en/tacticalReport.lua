function FX_TacticalReport_CPU_Name(raceID)
  local t = {
    [-1] = "Closed",
    [0] = "Human",
    [1] = "Easy",
    [2] = "Standard",
    [3] = "Hard",
    [4] = "Expert"
  }
  return t[raceID];
end

function FX_TacticalReport_Race_Name(plaerID)
  local t = {
    Bentusi = "Bentusi ",
    Hiigaran = "Hiigaran ",
    Kadesh = "Kadeshi ",
    Keeper = "Progenitor ",
    Kushan = "Kushan ",
    Observer = "Observer ",
    Taiidan = "Taiidan ",
    Turanic = "Turanic ",
    Vaygr = "Vaygr ",
  }
  if Player_GetLevelOfDifficulty(plaerID) == -1 then 
    --Closed Player
    return ""
  else 
    return t[Race_GetName(Player_GetRace(plaerID))]
  end
end
