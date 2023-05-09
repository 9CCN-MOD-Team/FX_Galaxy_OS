function FX_TacticalReport_CPU_Name(raceID)
  local t = {
    [-1] = "关闭",
    [0] = "人类",
    [1] = "简单",
    [2] = "标准",
    [3] = "困难",
    [4] = "专家"
  }
  return t[raceID];
end

function FX_TacticalReport_Race_Name(plaerID)
  local t = {
    Bentusi = "本图西",
    Hiigaran = "希格拉",
    Kadesh = "卡德仕",
    Keeper = "先祖",
    Kushan = "库申",
    Observer = "观察员",
    Taiidan = "泰坦",
    Turanic = "图拉尼",
    Vaygr = "维格尔",
  }
  if Player_GetLevelOfDifficulty(plaerID) == -1 then 
    --Closed Player
    return ""
  else 
    return t[Race_GetName(Player_GetRace(plaerID))]
  end
end
   