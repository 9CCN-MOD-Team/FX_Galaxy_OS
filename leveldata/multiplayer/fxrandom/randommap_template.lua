if (not playernumber) then 
  _ALERT("Error: player number undefined.")
end

if (not DefaultLevels) then 
  _ALERT("Error: default levels undefined.")
end

--���ԴӴ浵����ص�ǰ��ͼ�б�
AllLevels = nil
dofilepath("player:"..playernumber.."p_random.levellist")

--���û�ж���Ļ������Ĭ�϶����ͼ�б�
AllLevels = AllLevels or DefaultLevels

--�����ͼ�б���Ԫ�ظ���
local LevelSize = 0
while(AllLevels[LevelSize + 1]) do
	LevelSize = LevelSize + 1
end

--���������ͼ��Ų�����
levelDesc = nil

if (LevelSize == 0) then
  --�����ˣ�����Ĭ���б�
  AllLevels = DefaultLevels
  while(AllLevels[LevelSize + 1]) do
  	LevelSize = LevelSize + 1
  end
end

while (not levelDesc) do
  local randomnum = random(1,LevelSize)
  dout("Use the #"..randomnum.." random map")
  dofilepath(AllLevels[randomnum])
  --�������ʧ�ܣ���Һܿ��ܸ��˵�ͼ���������Ĭ���б�
  if (not levelDesc) then
    dout("Random map load failed. Use default map list instead.")
    AllLevels = DefaultLevels
  end
end

--����ͼ���Ƹ�Ϊ�������ͼ��
levelDesc = "$96328"