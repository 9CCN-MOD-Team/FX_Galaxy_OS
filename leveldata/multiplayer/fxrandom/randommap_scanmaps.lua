function FXG_scanmaps()
  _ALERT("Start map list scanning...")
  
  --����table���ڱ������յĵ�ͼ�б��±�index��ʾ�������
  _randommap_fullLevelList = {}
  _randommap_fullLevelList[1] = {}
  _randommap_fullLevelList[2] = {}
  _randommap_fullLevelList[3] = {}
  _randommap_fullLevelList[4] = {}
  _randommap_fullLevelList[5] = {}
  _randommap_fullLevelList[6] = {}
  _randommap_fullLevelList[7] = {}
  _randommap_fullLevelList[8] = {}
  
  --�ݴ�һ���⼸��ֵ
  --���ǿ��ܻᱻ֮��ĵ�ͼɨ�踲�ǣ������ȴ���������ٻָ�
  local _oldRoot = Root
  local _oldExtFilter = ExtFilter
  local _oldTags = Tags
  local _oldLevelList = LevelList
  
  --ʹ��rawset�Է�ֹ��Щֵ��tagmethod�ѱ�����
  --���⼸��ֵ�ȳ�ʼ��Ϊ��table
  rawset(globals(), "Root", {})
  rawset(globals(), "Tags", {})
  rawset(globals(), "LevelList", {})

  --�⼸��ֵ���ڱ�ʶ����ֵ�Ƿ��ѱ���ȡ��������ֵ������ȡ�󣬼������_randommap_addToLevelList��
  _randommap_Root_set = nil 
  _randommap_Tags_set = nil 
  _randommap_LevelList_set = nil 

  --������tag�Ա���������ֵ�ĵȺ�����
  --ע�����tag�Ѿ��������˾�û��Ҫ�ٴ�����
  
  
    
  _randommap_tag_Root = _randommap_tag_Root or newtag()
  _randommap_tag_Tags = _randommap_tag_Tags or newtag()
  _randommap_tag_LevelList = _randommap_tag_LevelList or newtag()
  
  --����tag
  --ע�⣡��log����ܿ������ơ�parameter: tag 9 was not created by `newtag'����error��¼
  --��Ҫ�ֻţ���Щ�������������Ҳ������Ӱ�죡
  _ALERT("If you see errors like \"parameter: tag 9 was not created by `newtag'\" below, do not panic. They are expected.")
  if not call(settag,{Root, _randommap_tag_Root},"x",nil) then 
    _ALERT("Recreating new tag _randommap_tag_Root..")
    _randommap_tag_Root = newtag()
    settag(Root, _randommap_tag_Root)
  end
  
  if not call(settag,{Tags, _randommap_tag_Tags},"x",nil) then 
    _ALERT("Recreating new tag _randommap_tag_Tags..")
    _randommap_tag_Tags = newtag()
    settag(Tags, _randommap_tag_Tags)
  end
  
  if not call(settag,{LevelList, _randommap_tag_LevelList},"x",nil) then 
    _ALERT("Recreating new tag _randommap_tag_LevelList..")
    _randommap_tag_LevelList = newtag()
    settag(LevelList, _randommap_tag_LevelList)
  end
  
  --����tagmethod
  settagmethod(_randommap_tag_Root, "setglobal", _randommap_setglobal_Root)
  settagmethod(_randommap_tag_Tags, "setglobal", _randommap_setglobal_Tags)
  settagmethod(_randommap_tag_LevelList, "setglobal", _randommap_setglobal_LevelList)
  
  --ɨ�����е�ͼ
  doscanpath("data:leveldata/multiplayer", "*.levels")
  
  --����ͼ�б�д�����
  for index,value in _randommap_fullLevelList do
    if (writeto(index.."p_random.levellist")) then
      write("AllLevels =\n{\n")
      local mapi = 1
      --ע�������ڲ�ѭ��ʹ����while����for index,value
      --��Ϊ�����ѭ����table����tinsert���µ�value.nһ����ǲ���ϣ������һ��Ҳд�����
      while(value[mapi]) do
        write("\t"..format("%q", value[mapi])..",\n")
        mapi = mapi + 1
      end
      write("}\n")
      writeto()
    else 
      _ALERT("Write to \""..index.."p_random.levellist\" failed!")
    end
  end 

  --�ָ����ĸ�������ֵ
  rawset(globals(), "Root", _oldRoot)
  rawset(globals(), "ExtFilter", _oldExtFilter)
  rawset(globals(), "Tags", _oldTags)
  rawset(globals(), "LevelList", _oldLevelList)
end


--�����������������������ĵȺ���������غ���
--���ǽ�newvalue�洢�ڶ�Ӧ��_randommap_data_*������
--��������ֵ����ȷ��������_randommap_addToLevelList
function _randommap_setglobal_Root(varname, oldvalue, newvalue)
  _ALERT("Got map root info: "..newvalue)
  _randommap_data_Root = newvalue
  _randommap_Root_set = 1
  
  if (_randommap_Root_set and _randommap_Tags_set and _randommap_LevelList_set) then 
    _randommap_addToLevelList()
  end 
end

function _randommap_setglobal_Tags(varname, oldvalue, newvalue)
  _ALERT("Got map tags info: "..newvalue)
  _randommap_data_Tags = newvalue
  _randommap_Tags_set = 1
    
  if (_randommap_Root_set and _randommap_Tags_set and _randommap_LevelList_set) then 
    _randommap_addToLevelList()
  end 
end

function _randommap_setglobal_LevelList(varname, oldvalue, newvalue)
  _ALERT("Got map LevelList info")
  _randommap_data_LevelList = newvalue
  _randommap_LevelList_set = 1
    
  if (_randommap_Root_set and _randommap_Tags_set and _randommap_LevelList_set) then 
    _randommap_addToLevelList()
  end 
end

--������ֵ������ȡ�󣬵��ô˺��������tag�Ƿ����Ҫ��
--�ٽ���ͼ��������������_randommap_fullLevelList��
function _randommap_addToLevelList()
  _ALERT("Adding map list")
  local mapTagList = string_split(_randommap_data_Tags, ",")
  local passTagList = string_split(Level_Pass_Tags, ",")
  --���tag�Ƿ����Ҫ��
  local tagmatch = nil
  --ͬʱҲҪ�ܿ������ͼ����
  local isRandomMap = nil
  for mIndex, mValue in mapTagList do 
    for pIndex, pValue in passTagList do 
      if (mValue == pValue) then 
        tagmatch = 1
      end
      if (mValue == "fx_random") then 
        isRandomMap = 1
      end
    end
  end
  
  if (tagmatch and (not isRandomMap) ) then 
    _ALERT("Tag match")
    for index, value in _randommap_data_LevelList do 
      tinsert(_randommap_fullLevelList[value.MaxPlayers], _randommap_data_Root.."/"..value.Name..".level")
    end
  else 
    _ALERT("Tag not match")
  end
  _ALERT("======")
  _randommap_Root_set = nil 
  _randommap_Tags_set = nil 
  _randommap_LevelList_set = nil 
end

--���ַ�����ָ���ַ��ָ��table��С����������http://lua-users.org/wiki/SplitJoin �������޸�����Ӧlua4
function string_split(str, inSplitPattern)
  local outResults = {}
  local theStart = 1
  local theSplitStart, theSplitEnd = strfind(str, inSplitPattern, theStart)
  while theSplitStart do
    tinsert(outResults, strsub(str, theStart, theSplitStart - 1))
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = strfind(str, inSplitPattern, theStart)
  end
  tinsert(outResults, strsub(str, theStart))
  return outResults
end