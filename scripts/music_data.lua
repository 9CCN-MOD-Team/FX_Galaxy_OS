--����sort��Ϊnil������Ϸ�ѿ�ʼ������gamerule������������д���
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
--	--��MusicList���ݿ�����music_data_original
--	for key,value in MusicList do  
--	    music_data_original.musics[music_data_original.size] = value
--	    music_data_original.size = music_data_original.size+1
--	end 
--
--	music_data_original.size = music_data_original.size-1

--��MusicList���ݿ�����music_data_original
	for key,value in MusicList do  
			tinsert(music_data_original.musics, value)
	end 

	music_data_original.size = music_data_original.musics.n
--
--	--ð�����򣬽����ְ�������Ļ��������
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
