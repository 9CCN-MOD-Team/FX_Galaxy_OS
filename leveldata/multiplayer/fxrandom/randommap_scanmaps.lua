function FXG_scanmaps()
  _ALERT("Start map list scanning...")
  
  --以下table用于保存最终的地图列表（下标index表示玩家数）
  _randommap_fullLevelList = {}
  _randommap_fullLevelList[1] = {}
  _randommap_fullLevelList[2] = {}
  _randommap_fullLevelList[3] = {}
  _randommap_fullLevelList[4] = {}
  _randommap_fullLevelList[5] = {}
  _randommap_fullLevelList[6] = {}
  _randommap_fullLevelList[7] = {}
  _randommap_fullLevelList[8] = {}
  
  --暂存一下这几个值
  --它们可能会被之后的地图扫描覆盖，所以先存起来最后再恢复
  local _oldRoot = Root
  local _oldExtFilter = ExtFilter
  local _oldTags = Tags
  local _oldLevelList = LevelList
  
  --使用rawset以防止这些值的tagmethod已被重载
  --将这几个值先初始化为空table
  rawset(globals(), "Root", {})
  rawset(globals(), "Tags", {})
  rawset(globals(), "LevelList", {})

  --这几个值用于标识三个值是否已被读取（当三个值都被读取后，即会调用_randommap_addToLevelList）
  _randommap_Root_set = nil 
  _randommap_Tags_set = nil 
  _randommap_LevelList_set = nil 

  --创建新tag以便重载三个值的等号运算
  --注意如果tag已经创建过了就没必要再创建了
  
  
    
  _randommap_tag_Root = _randommap_tag_Root or newtag()
  _randommap_tag_Tags = _randommap_tag_Tags or newtag()
  _randommap_tag_LevelList = _randommap_tag_LevelList or newtag()
  
  --绑定新tag
  --注意！在log里可能看到类似“parameter: tag 9 was not created by `newtag'”的error记录
  --不要恐慌！这些错误是正常的且不会造成影响！
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
  
  --重载tagmethod
  settagmethod(_randommap_tag_Root, "setglobal", _randommap_setglobal_Root)
  settagmethod(_randommap_tag_Tags, "setglobal", _randommap_setglobal_Tags)
  settagmethod(_randommap_tag_LevelList, "setglobal", _randommap_setglobal_LevelList)
  
  --扫描所有地图
  doscanpath("data:leveldata/multiplayer", "*.levels")
  
  --将地图列表写入磁盘
  for index,value in _randommap_fullLevelList do
    if (writeto(index.."p_random.levellist")) then
      write("AllLevels =\n{\n")
      local mapi = 1
      --注意这里内层循环使用了while而非for index,value
      --因为这里待循环的table里有tinsert留下的value.n一项，我们并不希望将这一项也写入磁盘
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

  --恢复这四个变量的值
  rawset(globals(), "Root", _oldRoot)
  rawset(globals(), "ExtFilter", _oldExtFilter)
  rawset(globals(), "Tags", _oldTags)
  rawset(globals(), "LevelList", _oldLevelList)
end


--以下三个函数是三个变量的等号运算的重载函数
--它们将newvalue存储在对应的_randommap_data_*变量中
--并在三个值都正确读入后调用_randommap_addToLevelList
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

--当三个值都被读取后，调用此函数，检查tag是否符合要求
--再将地图按玩家数分类添进_randommap_fullLevelList中
function _randommap_addToLevelList()
  _ALERT("Adding map list")
  local mapTagList = string_split(_randommap_data_Tags, ",")
  local passTagList = string_split(Level_Pass_Tags, ",")
  --检查tag是否符合要求
  local tagmatch = nil
  --同时也要避开随机地图本身
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

--将字符串按指定字符分割成table的小函数，来自http://lua-users.org/wiki/SplitJoin ，稍有修改以适应lua4
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