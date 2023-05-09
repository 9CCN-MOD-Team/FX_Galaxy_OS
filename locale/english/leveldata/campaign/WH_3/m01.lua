dofilepath("player:playercfg.lua")
dofilepath("locale:utf16.lua")

function TaiC_41060()
	local iText="Our fates are intertwined. I don't know where you will go next, but I have a feeling this galaxy will be seeing more of you. Until we meet again, "..conv_chatname(PlayerSetup.chatname, "soilder").."..."
	return iText
end