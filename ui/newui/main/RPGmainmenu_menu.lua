RPGmainmenu=
{
	UpdateFunction=[[
	NewMainMenu_update.RPGmainmenu=function()
		--主菜单翻转位置标记
		mainMenuLeft = nil
		if (isPopuping) then
			UI_SetElementPosition("NewMainMenu","KaranFrame",800-iPosition-287,600*(1080-1024)/1080)
		end
	end
	]],
	UItable=
	{
		{ 
			type = "Frame", 
			name = "BackGroundFrame",
			position = 
				{ 0, 0, }, 
			size = 
				{ 800, 600, }, 
			BackgroundGraphic = 
			{ 
				size = { 800, 600, }, 
				texture = "DATA:UI/NewUI/Background/galaxy.dds", 
				textureUV = { 0, 0, 1920, 1080, },
			},
			visible = 1, 
		}, 
		{ 
			type = "Frame", 
			name = "KaranFrame",
			position = 
				{ -800*1024/1920, 600*(1080-1024)/1080, }, 
			size = 
				{ 800*1024/1920, 600*1024/1080, }, 
			BackgroundGraphic = 
			{ 
				size = { 800*1024/1920, 600*1024/1080, }, 
				texture = "DATA:UI/NewUI/Background/karan.dds", 
				textureUV = { 1024, 0, 0, 1024, },
			},
			visible = 1, 
		}, 
	}
}