dofilepath("locale:version.txt")
function LW_findres(sResFileName)
	local dirs = {
		unpacked = "data:do_not_pack_this/",
		installer = "data:../DataWorkshopMODs/FXG/",
		installer_beta = "data:../DataWorkshopMODs/FXGbeta/",
		workshop_entest = "data:../../../../workshop/content/244160/917176628/", 
		workshop_cntest = "data:../../../../workshop/content/244160/917174167/", 
		workshop_enbeta = "data:../../../../workshop/content/244160/430491982/", 
		workshop_en = "data:../../../../workshop/content/244160/423694988/",
		workshop_cn = "data:../../../../workshop/content/244160/419150214/",
	}
	return dirs[FX_Galaxy_Pack_Version]..sResFileName
end