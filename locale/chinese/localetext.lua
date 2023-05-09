LocaleText = {}
LocaleText[1] = "几天前我们给了一帮"
LocaleText[2] = "人一个全新的泛用式战术型高能活跃性粒子连续投射装置的技术资料，换了不少RU"
LocaleText[3] = "图拉尼"
LocaleText[4] = "泰坦"
LocaleText[5] = "希格拉"
LocaleText[6] = "库申"
LocaleText[7] = "第"
LocaleText[8] = "波"
LocaleText[9] = function(tIndex,pIndex,artifactNum,artifacttowin)
	local s_text=""
	if(artifacttowin==0)then
		s_text="玩家"..pIndex.."取得了一个遗物，队伍"..tIndex.."拥有遗物："..artifactNum
	else
		s_text="玩家"..pIndex.."取得了一个遗物，队伍"..tIndex.."拥有遗物："..artifactNum.."/"..artifacttowin
	end
	return s_text
end
LocaleText[10] = function(artifacttowin)
	local s_text=""
	if(artifacttowin==0)then
		s_text="遗物会在游戏时间5:00刷新，你的队伍需要在规定时间内获取最多的遗物来获得胜利"
	else
		s_text="遗物会在游戏时间5:00刷新，你的队伍需要在规定时间内获取最多的遗物或者首先获取"..artifacttowin.."个遗物来获得胜利"
	end
	return s_text
end
LocaleText[11] = "好的……"
LocaleText[12] = "卡德仕"
LocaleText[13] = "维格尔"