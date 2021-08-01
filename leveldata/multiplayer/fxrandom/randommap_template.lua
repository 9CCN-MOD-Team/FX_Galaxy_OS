if (not playernumber) then 
  _ALERT("Error: player number undefined.")
end

if (not DefaultLevels) then 
  _ALERT("Error: default levels undefined.")
end

--尝试从存档里加载当前地图列表
AllLevels = nil
dofilepath("player:"..playernumber.."p_random.levellist")

--如果没有定义的话则加载默认定义地图列表
AllLevels = AllLevels or DefaultLevels

--计算地图列表中元素个数
local LevelSize = 0
while(AllLevels[LevelSize + 1]) do
	LevelSize = LevelSize + 1
end

--决定随机地图编号并加载
levelDesc = nil

if (LevelSize == 0) then
  --出错了，改用默认列表
  AllLevels = DefaultLevels
  while(AllLevels[LevelSize + 1]) do
  	LevelSize = LevelSize + 1
  end
end

while (not levelDesc) do
  local randomnum = random(1,LevelSize)
  dout("Use the #"..randomnum.." random map")
  dofilepath(AllLevels[randomnum])
  --如果加载失败（玩家很可能改了地图包）则改用默认列表
  if (not levelDesc) then
    dout("Random map load failed. Use default map list instead.")
    AllLevels = DefaultLevels
  end
end

--将地图名称改为“随机地图”
levelDesc = "$96328"