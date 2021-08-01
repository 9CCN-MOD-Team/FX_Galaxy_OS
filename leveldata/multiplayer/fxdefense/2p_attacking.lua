BG = {}

BG["ez01"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez01")
end

BG["ez02"] = function()
    fogSetActive(1)
		fogSetStart(10)
		fogSetEnd(9000)
		fogSetColour(0.083984, 0.123047, 0.207031, 1)
		fogSetType("linear")
		fogSetDensity(0.450000)
		setGlareIntensity(0.000000)
		setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
    loadBackground("ez02")
end

BG["ez03"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez03")
end

BG["ez04"] = function()
    fogSetActive(1)
		fogSetStart(10)
		fogSetEnd(20000)
		fogSetColour(0.376953, 0.214844, 0.064453, 1.000000)
		fogSetType("linear")
		fogSetDensity(0.225000)    
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez04")
end

BG["ez05"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez05")
end

BG["ez06"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez06")
end

BG["ez07"] = function()
	fogSetActive(0)
	loadBackground("ez07")
end

BG["ez08"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez08")
end

BG["ez09"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez09")
end

BG["ez10"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez10")
end

BG["ez11"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez11")
end

BG["ez12"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez12")
end

BG["ez13"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez13")
end

BG["ez14"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez14")
end

BG["ez15"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez15")
end

BG["ez16"] = function()
    fogSetActive(0)
    setGlareIntensity(0.0)
    setLevelShadowColour(0, 0, 0, 1)
    loadBackground("ez16")
end

BG["m01"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(9000)
	fogSetColour(0.083984, 0.123047, 0.207031, 1)
	fogSetType("linear")
	fogSetDensity(0.450000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m01")
end

BG["m02"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.376953, 0.214844, 0.064453, 1.000000)
	fogSetType("linear")
	fogSetDensity(0.225000)
	loadBackground("m02")
end

BG["m03"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.427734, 0.228516, 0.078125, 1)
	fogSetType("linear")
	fogSetDensity(0.1125)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m03")
	setDustCloudAmbient( {0.5, 0.5, 0.5, 1.0} )
end

BG["m04"] = function()
	fogSetActive(1)
	fogSetStart(800)
	fogSetEnd(18000)
	fogSetColour(0.302734, 0.160156, 0.099609, 1.000000)
	fogSetType("linear")
	fogSetDensity(0.720000)
	loadBackground("m04")
end

BG["m05"] = function()
	fogSetActive(1)
	fogSetStart(1)
	fogSetEnd(10000)
	fogSetColour(0.432031, 0.169922, 0.095703, 1.000000)
	fogSetType("linear")
	fogSetDensity(0.500000)
	loadBackground("m05")
	setDustCloudAmbient({0.600000, 0.600000, 0.600000, 1.000000})
	setNebulaAmbient({0.600000, 0.600000, 0.600000, 1.000000})
end

BG["m06"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(15000)
	fogSetColour(0.347656, 0.197266, 0.074219, 1.000000)
	fogSetType("linear")
	fogSetDensity(0.428000)
	loadBackground("m06")
end

BG["m07"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(15000)
	fogSetColour(0.347656, 0.197266, 0.074219, 1)
	fogSetType("linear")
	fogSetDensity(0.4280000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m07")
end

BG["m08"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(15000)
	fogSetColour(0.347656, 0.197266, 0.074219, 1.000000)
	fogSetType("linear")
	fogSetDensity(0.428000)
	loadBackground("m08")
	setDustCloudAmbient({0.500000, 0.500000, 0.500000, 1.000000})
end

BG["m09"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.376953, 0.214844, 0.064453, 1)
	fogSetType("linear")
	fogSetDensity(0.225)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m09")
end

BG["m10"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.427734, 0.228516, 0.136719, 1)
	fogSetType("linear")
	fogSetDensity(0.3150000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m10")
end

BG["m11"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.427734, 0.228516, 0.136719, 1)
	fogSetType("linear")
	fogSetDensity(0.2150000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m10")
end

BG["m12"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.427734, 0.228516, 0.136719, 1)
	fogSetType("linear")
	fogSetDensity(0.2150000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m12")
end

BG["m13"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.376953, 0.214844, 0.064453, 1)
	fogSetType("linear")
	fogSetDensity(0.3150000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m13")
end

BG["m14"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(15000)
	fogSetColour(0.347656, 0.197266, 0.074219, 1)
	fogSetType("linear")
	fogSetDensity(0.4280000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m14")
end

BG["m15"] = function()
	fogSetActive(1)
	fogSetStart(10)
	fogSetEnd(20000)
	fogSetColour(0.376953, 0.214844, 0.064453, 1)
	fogSetType("linear")
	fogSetDensity(0.2150000)
	setGlareIntensity(0.000000)
	setLevelShadowColour(0.000000, 0.000000, 0.000000, 1.0)
	loadBackground("m15")
end

function DetermChunk()
    addPoint("StartPos0", { 0, 0, 0,},{ 0, 0, 0, })
    addPoint("StartPos1", { 0, 0, 0,},{ 0, 0, 0, })
    addPoint("Path1", { 30000,0, 30000,},{ 0, 0, 0, })
    addPoint("Path2", {-30000,0, 30000,},{ 0, 0, 0, })
    addPoint("Path3", { 30000,0,-30000,},{ 0, 0, 0, })
    addPoint("Path4", {-30000,0,-30000,},{ 0, 0, 0, })
    addPoint("Path5", { 2000,0, 2000,},{ 0, 0, 0, })
    addPoint("Path6", {-2000,0, 2000,},{ 0, 0, 0, })
    addPoint("Path7", { 2000,0,-2000,},{ 0, 0, 0, })
    addPoint("Path8", {-2000,0,-2000,},{ 0, 0, 0, })
    addPath("Path1", "Path1", "Path5")
    addPath("Path2", "Path2", "Path6")
    addPath("Path3", "Path3", "Path7")
    addPath("Path4", "Path4", "Path8")
    addSquadron("HSI1", "rpg_inhibitor", { 20000,0, 20000}, 1, {0,315,0}, 0, 0)
    addSquadron("HSI2", "rpg_inhibitor", {-20000,0, 20000}, 1, {0,225,0}, 0, 0)
    addSquadron("HSI3", "rpg_inhibitor", { 20000,0,-20000}, 1, {0,45,0}, 0, 0)
    addSquadron("HSI4", "rpg_inhibitor", {-20000,0,-20000}, 1, {0,135,0}, 0, 0)
    addSquadron("Key", "meg_crate1", {0,0,0}, 0, {0,0,0}, 0, 1)
    addSquadron("Ben", "def_floatingcity", {0,0,0}, 0, {0,0,0}, 0, 0)
		createSOBGroup("FTemp")
		createSOBGroup("Key")
		createSOBGroup("Ben")
		createSOBGroup("HSI")
		createSOBGroup("Player_Start")
		addSphere("Player_Start", {1000,0,0}, 0)
		addToSOBGroup("Key","Key")
		addToSOBGroup("Ben","Ben")
		for i=1,4 do
			createSOBGroup("EW"..i)
			createSOBGroup("Ecapturer")
			createSOBGroup("HSI"..i)
			addToSOBGroup("HSI"..i, "HSI")
			addToSOBGroup("HSI"..i, "HSI"..i)
		end
    setWorldBoundsInner({ 0, 0, 0}, {45000, 45000, 45000, })
end

BG_List = {"ez01","ez02","ez03","ez04","ez05","ez06","ez07","ez08","ez09","ez10","ez11","ez12","ez13","ez14","ez15","ez16","m01","m02","m03","m04","m05","m06","m07","m08","m09","m10","m11","m12","m13","m14","m15",}

function NonDetermChunk()
	BG[BG_List[random(31)]]()
	setSensorsManagerCameraDistances(12000, 45000)
end