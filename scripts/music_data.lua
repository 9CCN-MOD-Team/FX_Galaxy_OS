--仅当sort不为nil（即游戏已开始，进入gamerule）后才运行下列代码
if (sort) then
	dofilepath("data:scripts/music_list.lua")

--	music_data_original = 
--	{
--		size = 1,
--		musics = {},
--	}
	music_data_original =
	{
		musics = {}
	}		
--
--	--将MusicList内容拷贝至music_data_original
--	for key,value in MusicList do  
--	    music_data_original.musics[music_data_original.size] = value
--	    music_data_original.size = music_data_original.size+1
--	end 
--
--	music_data_original.size = music_data_original.size-1

--将MusicList内容拷贝至music_data_original
	for key,value in MusicList do  
			tinsert(music_data_original.musics, value)
	end 

	music_data_original.size = music_data_original.musics.n
--
--	--冒泡排序，将音乐按名称字幕升序排序
--	for j = 1, music_data_original.size - 1 do
--		for i = 1, music_data_original.size - j do
--			if music_data_original.musics[i].name > music_data_original.musics[i + 1].name then
--				music_data_original.musics[i], music_data_original.musics[i + 1] = music_data_original.musics[i + 1], music_data_original.musics[i]
--			end
--		end
--	end
	sort(
		music_data_original.musics,
		function(MusicA,MusicB)
			return (MusicA.name < MusicB.name)
		end
	)
end
