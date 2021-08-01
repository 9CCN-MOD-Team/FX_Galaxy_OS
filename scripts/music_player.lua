MusicKey = 0

function MP_DataInit(iLoop)
    music_data = {}
    MP_Mode = {"RepeatTrack","RepeatSingle","RandomPlay",}
    mp_loop = iLoop
    --Define the music playing mode, could be 1,2 or 3, see "MP_Mode" above
    --定义初始播放方式，可定为1,2,或3，对应关系见上面的“MP_Mode”
    UI_SetElementVisible("MusicMenu",MP_Mode[mp_loop],1)
    UI_SetButtonPressed("MusicMenu",MP_Mode[mp_loop],1)
    mp_play = 1
    music_index = 0
    m_n = 1
    m_p = 0
    ms_time = 0
    empty_music = "Data:sound/music/ambient/Empty"
    gametime = 0--Universe_GameTime()
    realtime = 0--clock()
    mt_page = 1
    m_oc = 1
end

function MusicPlayer_Oninit(Music_Data, iKey, iLoop)
	MP_DataInit(iLoop)
	music_data=Music_Data
	Rule_Add("Play_Music")
	m_page = ceil(music_data.size/8)
	MusicList_Oninit()
	UI_SetElementVisible("MusicMenu","LoadFlag",1)
	UI_SetElementVisible("NewTaskbar", "btnMP", 1)
	Rule_Add("DT_IfLoad")
	if(iKey~=0)then
		MusicKey = iKey
		UI_BindKeyEvent(iKey,"Show_MusicMenu")
	end
end

function MusicPlayer_Disable()
	UI_SetElementVisible("MusicMenu","LoadFlag",0)
	UI_SetElementVisible("NewTaskbar", "btnMP", 0)
	Rule_Remove("DT_IfLoad")
	Rule_Remove("Play_Music")
end

function MusicList_Oninit()
    for i = 1,8 do
	if (i<=min(8,music_data.size-8*(mt_page-1))) then
	    UI_SetElementVisible("MusicListMenu","MusicButton"..i,1)
	    if (i+8*mt_page<18) then
	        UI_SetTextLabelText("MusicListMenu","MusicIndex"..i,"0"..i+8*(mt_page-1))
	    else
	        UI_SetTextLabelText("MusicListMenu","MusicIndex"..i,""..i+8*(mt_page-1))
	    end
	    UI_SetTextLabelText("MusicListMenu","MusicName"..i,music_data.musics[i+8*(mt_page-1)].name)
	    if (music_data.musics[i+8*(mt_page-1)].minute < 10) then
		UI_SetTextLabelText("MusicListMenu","mMinute"..i,"0"..music_data.musics[i+8*(mt_page-1)].minute)
	    else
		UI_SetTextLabelText("MusicListMenu","mMinute"..i,""..music_data.musics[i+8*(mt_page-1)].minute)
	    end
	    if (music_data.musics[i+8*(mt_page-1)].second < 10) then
		UI_SetTextLabelText("MusicListMenu","mSecond"..i,"0"..music_data.musics[i+8*(mt_page-1)].second)
	    else
		UI_SetTextLabelText("MusicListMenu","mSecond"..i,""..music_data.musics[i+8*(mt_page-1)].second)
	    end
	else
	    UI_SetElementVisible("MusicListMenu","MusicButton"..i,0)
	end
    end
	if (mt_page==m_page) then
	    UI_SetElementEnabled("MusicListMenu","MusicNextPageButton",0)
	elseif(mt_page==1) then
	    UI_SetElementEnabled("MusicListMenu","MusicPreviousPageButton",0)
	end
	if (mt_page>1) then
	    UI_SetElementEnabled("MusicListMenu","MusicPreviousPageButton",1)
	end
	if (mt_page<m_page) then
	    UI_SetElementEnabled("MusicListMenu","MusicNextPageButton",1)
	end
end

function Watch_MusicMenu()
    if (mp_play == 1) then
	local pLength = 60*music_data.musics[music_index].minute+music_data.musics[music_index].second-floor(ms_time)
	local pMinute = floor(pLength/60)
	local pSecond = pLength-60*pMinute
	if (pMinute < 10) then
	    UI_SetTextLabelText("MusicMenu","pMinute", "0"..pMinute)
	else
	    UI_SetTextLabelText("MusicMenu","pMinute", ""..pMinute)
	end
	if (pSecond < 10) then
	    UI_SetTextLabelText("MusicMenu","pSecond", "0"..pSecond)
	else
	    UI_SetTextLabelText("MusicMenu","pSecond", ""..pSecond)
	end
	UI_SetElementSize("MusicMenu","MusicProgress", 2+ceil(1090*((pLength)/(60*music_data.musics[music_index].minute+music_data.musics[music_index].second))/7),8)
	UI_SetElementPosition("MusicMenu","MusicProFrame",ceil(1090*((pLength)/(60*music_data.musics[music_index].minute+music_data.musics[music_index].second))/7),0)
    else
	UI_SetTextLabelText("MusicMenu","pSecond", "00")
	UI_SetTextLabelText("MusicMenu","pMinute", "00")
	UI_SetElementSize("MusicMenu","MusicProgress", 2,8)
	UI_SetElementPosition("MusicMenu","MusicProFrame",0,0)
    end
    if (UI_IsNamedElementVisible("MusicListMenu","MusicNextPage")==1) then
	UI_SetElementVisible("MusicListMenu","MusicNextPage",0)
	mt_page = mt_page+1
	MusicList_Oninit()
    elseif (UI_IsNamedElementVisible("MusicListMenu","MusicPreviousPage")==1) then
	UI_SetElementVisible("MusicListMenu","MusicPreviousPage",0)
	mt_page = mt_page-1
	MusicList_Oninit()
    end
    for i=1,3 do
	if (UI_IsNamedElementVisible("MusicMenu","MusicPlayType"..i)==1)and(mp_loop~=i) then
	    UI_SetElementVisible("MusicMenu","MusicPlayType"..mp_loop,0)
	    mp_loop = i
	end
    end
    for i=1,8 do
	if (UI_IsNamedElementVisible("MusicListMenu","PlayMusic"..i)==1) then
	    UI_SetElementVisible("MusicListMenu","PlayMusic"..i,0)
	    music_index = 8*(mt_page-1) + i
	    Play_ParticularMusic()
	end
    end
    if (mp_play == 1) then
	if (UI_IsNamedElementVisible("MusicMenu","PlayButton")==1) then
	    UI_SetElementVisible("MusicMenu","StopButton",0)
	    Sound_MusicPlay(empty_music)
	    Rule_Remove("Play_Music")
	    mp_play = 0
	end
    elseif (UI_IsNamedElementVisible("MusicMenu","StopButton")==1) then
	    UI_SetElementVisible("MusicMenu","PlayButton",0)
	    Play_ParticularMusic()
	    Rule_Add("Play_Music")
	    mp_play = 1
    end
    if (UI_IsNamedElementVisible("MusicMenu","NextMusic")==1) then
	UI_SetElementVisible("MusicMenu","NextMusic",0)
	Rule_Remove("Play_Music")
	m_n = 1
	Rule_Add("Play_Music")
    end
    if (UI_IsNamedElementVisible("MusicMenu","PreviousMusic")==1) then
	UI_SetElementVisible("MusicMenu","PreviousMusic",0)
	Rule_Remove("Play_Music")
	m_p = 1
	Rule_Add("Play_Music")
    end
    for i=1,8 do
	UI_SetButtonPressed("MusicListMenu","MusicButton"..i,0)
    end
    if (music_index>8*(mt_page-1))and(music_index<=8*mt_page) then
	UI_SetButtonPressed("MusicListMenu","MusicButton"..(music_index-(mt_page-1)*8),1)
    end
end

function MP_IfLoad()
	UI_SetButtonPressed("MusicMenu",MP_Mode[mp_loop],1)
	if (music_index<10) then
	    UI_SetTextLabelText("MusicMenu","MusicIndex", "0"..music_index)
	else
	    UI_SetTextLabelText("MusicMenu","MusicIndex", ""..music_index)
	end
	UI_SetTextLabelText("MusicMenu","MusicName", music_data.musics[music_index].name)
	if (music_data.musics[music_index].minute < 10) then
	    UI_SetTextLabelText("MusicMenu","tMinute", "0"..music_data.musics[music_index].minute)
	else
	    UI_SetTextLabelText("MusicMenu","tMinute", ""..music_data.musics[music_index].minute)
	end
	if (music_data.musics[music_index].second < 10) then
	    UI_SetTextLabelText("MusicMenu","tSecond", "0"..music_data.musics[music_index].second)
	else
	    UI_SetTextLabelText("MusicMenu","tSecond", ""..music_data.musics[music_index].second)
	end
	MusicList_Oninit()
end

function Play_Music()
	--if (floor(10*Universe_GameTime()-10*gametime)<floor(10*clock()-10*realtime)) then
	--    ms_time = ms_time + gametime - Universe_GameTime()
	--else
	    ms_time = ms_time + realtime - clock()
	--end
	--gametime = Universe_GameTime()
	realtime = clock()
  if (ms_time<=0)or(m_n==1)or(m_p==1) then
		if (mp_loop ~= 3) then
	    if (m_p==1) then
				if (music_index==1) then
		    	music_index=music_data.size
				else
		    	music_index=music_index-1
				end
	    elseif (mp_loop == 1)or(m_n==1) then
				if (music_index==music_data.size) then
		    	music_index=1
				else
		    	music_index=music_index+1
				end
	    elseif (mp_loop == 2) then
				Sound_MusicPlay(empty_music)
				ms_time=60*music_data.musics[music_index].minute+music_data.musics[music_index].second+3
				Rule_AddInterval("Play_ParticularMusic",3)
				--Play_ParticularMusic()
	    end
		else
			local m_i = random(1,music_data.size)
			while (music_index==m_i)or(music_data.musics[m_i].func()==0) do
			    m_i = random(1,music_data.size)
			end
			music_index = m_i
		end
		if (m_n==1) then
			m_n = 0
		end
		if (m_p==1) then
			m_p = 0
		end
		if (Rule_Exists("Play_ParticularMusic") == 0) then
		    Play_ParticularMusic()
		end
  end
end

function Play_ParticularMusic()
	UI_SetElementVisible('MusicMenu','StopButton',1)
	Sound_MusicPlay(music_data.musics[music_index].path)
	realtime = clock()
	ms_time=60*music_data.musics[music_index].minute+music_data.musics[music_index].second
	if (music_index<10) then
	    UI_SetTextLabelText("MusicMenu","MusicIndex", "0"..music_index)
	else
	    UI_SetTextLabelText("MusicMenu","MusicIndex", ""..music_index)
	end
	UI_SetTextLabelText("MusicMenu","MusicName", music_data.musics[music_index].name)
	if (music_data.musics[music_index].minute < 10) then
	    UI_SetTextLabelText("MusicMenu","tMinute", "0"..music_data.musics[music_index].minute)
	else
	    UI_SetTextLabelText("MusicMenu","tMinute", ""..music_data.musics[music_index].minute)
	end
	if (music_data.musics[music_index].second < 10) then
	    UI_SetTextLabelText("MusicMenu","tSecond", "0"..music_data.musics[music_index].second)
	else
	    UI_SetTextLabelText("MusicMenu","tSecond", ""..music_data.musics[music_index].second)
	end
	Rule_Remove("Play_ParticularMusic")
end

function Show_MusicMenu()
	if (UI_IsNamedElementVisible("NewTaskbar", "btnMP")==1) then
		UI_SetButtonPressed("NewTaskbar", "btnMP", m_oc)
		UI_PlaySound("SFX_ButtonClick")
	    if (m_oc == 1) then
		UI_ShowScreen("MusicMenu",ePopup)
		Rule_Add("Watch_MusicMenu")
	    else
		UI_HideScreen("MusicMenu")
		Rule_Remove("Watch_MusicMenu")
	    end
	    m_oc = 1-m_oc
	end
end

function DT_IfLoad()
	if (UI_IsNamedElementVisible("MusicMenu","LoadFlag")==0) then
		dofilepath("data:scripts/music_data.lua")
		dofilepath("data:scripts/music_player.lua")
		UI_SetElementVisible("MusicMenu","LoadFlag",1)
		MP_IfLoad()
		if(MusicKey~=0)then
			UI_BindKeyEvent(MusicKey,"Show_MusicMenu")
		end
	end
	if (UI_IsNamedElementVisible("NewTaskbar", "ShowMusicMenu")==1) then
		UI_SetElementVisible("NewTaskbar", "ShowMusicMenu", 0)
		Show_MusicMenu()
	end
end