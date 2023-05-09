dofilepath("player:playercfg.lua")
dofilepath("locale:utf16.lua")

function TaiC_41060()
	local iText="我们的命运紧密地交织在了一起，我不知道你接下来会前往何处，但我有预感这个银河会愈发注意到你的存在，那么再会吧，"..conv_chatname(PlayerSetup.chatname, "军士").."..."
	return iText
end