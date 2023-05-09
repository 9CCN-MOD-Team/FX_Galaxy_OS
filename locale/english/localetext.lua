LocaleText = {}
LocaleText[1] = "Several days ago, we sold the technology for a new kind of PTHE particle projection device to some "
LocaleText[2] = ""
LocaleText[3] = "Turanic Raiders"
LocaleText[4] = "Taiidan"
LocaleText[5] = "Hiigarans"
LocaleText[6] = "Kushan"
LocaleText[7] = "WAVE "
LocaleText[8] = ""
LocaleText[9] = function(tIndex, pIndex,artifactNum,artifacttowin)
	local s_text=""
	if(artifacttowin==0)then
		s_text="Player"..pIndex.." has retrieved an artifact. Team "..tIndex.." Progress:"..artifactNum
	else
		s_text="Player"..pIndex.." has retrieved an artifact. Team "..tIndex.." Progress:"..artifactNum.."/"..artifacttowin
	end
	return s_text
end
LocaleText[10] = function(artifacttowin)
	local s_text=""
	if(artifacttowin==0)then
		s_text="Artifacts will spawn at 5:00, team retrieve most artifacts when the time is out win."
	else
		s_text="Artifacts will spawn at 5:00, team retrieve most artifacts when the time is out or first retrieve "..artifacttowin.." artifacts win."
	end
	return s_text
end
LocaleText[11] = "OK..."
LocaleText[12] = "Kadeshi"
LocaleText[13] = "Vaygr"