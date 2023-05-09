function FX_TacticalReport_CPU_Name(raceID)
  local t = {
    [-1] = "�ر�",
    [0] = "����",
    [1] = "��",
    [2] = "��׼",
    [3] = "����",
    [4] = "ר��"
  }
  return t[raceID];
end

function FX_TacticalReport_Race_Name(plaerID)
  local t = {
    Bentusi = "��ͼ��",
    Hiigaran = "ϣ����",
    Kadesh = "������",
    Keeper = "����",
    Kushan = "����",
    Observer = "�۲�Ա",
    Taiidan = "̩̹",
    Turanic = "ͼ����",
    Vaygr = "ά���",
  }
  if Player_GetLevelOfDifficulty(plaerID) == -1 then 
    --Closed Player
    return ""
  else 
    return t[Race_GetName(Player_GetRace(plaerID))]
  end
end
   