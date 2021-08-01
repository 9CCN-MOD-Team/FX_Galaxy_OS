
SubTitles=
{
	{{255,255,255}, 0.1, 0.1, 1,"fleetintel#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"fleetcommand#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"makaan#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"keeper#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"chimera#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"bentusi#.tga",1},
	{{255,255,255}, 0.2, 0.2, 0,"tur_carrier#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"bishop#.tga",1},
	{{200,160,255}, 0.2, 0.2, 0,"tai_scout#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"tanis#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"allships#.tga",1},
	{{200,160,255}, 0.2, 0.2, 0,"tur_scout#.tga",1},
	{{200,160,255}, 0.2, 0.2, 0,"tur_worker#.tga",1},
	{{255,255,255}, 0.2, 0.2, 0,"",0},--theme 13(0xd): default for time counters
	{{255,255,255}, 0.2, 0.2, 0,"",0},--theme 14(0xe): for close captions
	{{255,255,255}, 0.5, 0.5, 1,"fleetintel#.tga",1},--theme 15(0xf): default for location cards
	{{255,255,255}, 0.1, 0.1, 1,"kad_spod#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"kad_mpod#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"HW1_BentusiTraders#.tga",1},
	{{200,160,255}, 0.1, 0.1, 1,"HW1_Kadesh#.tga",1},
	{{255,255,255}, 0.2, 0.2, 0,"tur_cruiser#.tga",1},
	{{255,255,255}, 0.5, 0.5, 1,"kad_nebula#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"9ccn#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"HW1_Emperor#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"HW1_KharSelim#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"dreadnaught#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"allships_vaygr#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"cmdstation_vaygr#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"vaygr#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"tai_assaultfrigate#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"tai_carrier#.tga",1},
	{{255,255,255}, 0.1, 0.1, 1,"tai_battleship#.tga",1},
}

dofilepath("data:leveldata/campaign/tutorial/RPG/script/code_campaign.lua")
dofilepath("player:AutoSave.lua")
	for iCampaignName,iCampaign in DTM4Campaign do
		if(iCampaign.Map=="All")or(MissionData==iCampaign.Map)then
			dofilepath("data:leveldata/campaign/tutorial/RPG/script/campaign/"..iCampaignName..".lua")
		end
	end
iTheme=1
while(SubTitles[iTheme]~=nil)do
	addTheme(iTheme-1, SubTitles[iTheme][1], SubTitles[iTheme][2], SubTitles[iTheme][3], SubTitles[iTheme][4],SubTitles[iTheme][5],SubTitles[iTheme][6])
	iTheme=iTheme+1
end
--addTheme(32, {255,255,255}, 0.1, 0.1, 0, "",0)
----------------------------------------------------------------------
--addRegion(regionNumber, textName, iconName)

--region 0: for NIS's
addRegion( 0, "Region0_Text", "", "" )
--region 1: for messages over the letterbox bar at the top of the screen
addRegion( 1, "Region1_Text", "Region1_Icon", "Region1_TextNarrow" )
--region 2: for close captions
addRegion( 2, "Region2_Text", "", "" )
--region 3: for location cards (centred on the screen)
addRegion( 3, "Region3_Text", "", "" )
-- region 4: for time counter
addRegion( 4, "Region4_Text", "", "" )
-- region 5: for general messages
addRegion( 5, "Region5_Text", "", "" )
-- region 6: letter box for animatics
addRegion( 6, "Region6_Text", "", "" )
