dofilepath("data:scripts/debug.lua")
dofilepath("data:scripts/FX_TacticalReport_Defines.lua")
dofilepath("data:scripts/byte2str.lua")
dofilepath("locale:tacticalReport.lua")

--BGRA
function FX_TacticalBGRAInit()
  FX_TacticalReport_LineColors = {}
	for i=1, 8 do 
		FX_TacticalReport_LineColors[i] = byte2str(FX_TacticalReport_LineColors_def[i][3])..byte2str(FX_TacticalReport_LineColors_def[i][2])..byte2str(FX_TacticalReport_LineColors_def[i][1])
	end
	FX_TacticalReport_BKGColor = byte2str(FX_TacticalReport_BKGColor_def[3])..byte2str(FX_TacticalReport_BKGColor_def[2])..byte2str(FX_TacticalReport_BKGColor_def[1])
	FX_TacticalReport_CellColor = byte2str(FX_TacticalReport_CellColor_def[3])..byte2str(FX_TacticalReport_CellColor_def[2])..byte2str(FX_TacticalReport_CellColor_def[1])
	
	FX_TacticalReport_BKGColor2 = FX_TacticalReport_BKGColor..FX_TacticalReport_BKGColor
	FX_TacticalReport_BKGColor4 = FX_TacticalReport_BKGColor2..FX_TacticalReport_BKGColor2
	FX_TacticalReport_BKGColor8 = FX_TacticalReport_BKGColor4..FX_TacticalReport_BKGColor4
	FX_TacticalReport_BKGColor16 = FX_TacticalReport_BKGColor8..FX_TacticalReport_BKGColor8
	FX_TacticalReport_BKGColor32 = FX_TacticalReport_BKGColor16..FX_TacticalReport_BKGColor16
	FX_TacticalReport_BKGColor64 = FX_TacticalReport_BKGColor32..FX_TacticalReport_BKGColor32
	FX_TacticalReport_BKGColor128 = FX_TacticalReport_BKGColor64..FX_TacticalReport_BKGColor64
	FX_TacticalReport_BKGColor256 = FX_TacticalReport_BKGColor128..FX_TacticalReport_BKGColor128
	FX_TacticalReport_BKGColor512 = FX_TacticalReport_BKGColor256..FX_TacticalReport_BKGColor256
end

function Stats_TotalExtraRUs(iPlayer)
	local ruExtra=0
	local shipExtra={"hgn_interceptor","hgn_attackbomber","hgn_scout","hgn_pulsarcorvette","vgr_scout","vgr_interceptor","vgr_bomber","vgr_lancefighter","vgr_missilecorvette","vgr_lasercorvette","kad_swarmer","kad_assaultswarmer","kad_lanceswarmer","kad_advancedswarmer","kad_advancedassaultswarmer","kpr_scout","kpr_bomber","kpr_movers","tur_scout","tur_fighter","tur_attackbomber","tai_scout","tai_interceptor","tai_attackbomber","tai_lightcorvette","kus_interceptor","kus_attackbomber"}
	for Index,ShipType in shipExtra do
		local numExtra=Stats_ShipsCreated(iPlayer, GetShipId(ShipType))
		if (numExtra>0) then
			ruExtra=ruExtra+numExtra*(1-1/SobGroup_GetStaticF(ShipType,"buildBatch"))*SobGroup_GetStaticF(ShipType,"buildCost")
		end
	end
	return ruExtra
end

function FX_TacticalReport_Prepare()
	if (writeto and writeto("FX_TacticalReport_Enabled.lua") ~= nil) then
		write("FX_TacticalReport_Enabled = nil\n")
		writeto()
	end
end

function X_TacticalReportInit()
	SobGroup_Create("XTR_TempGroup")
	XTR_Output_Data = {}
	for OutputFile,OutputFunction in XTR_Output do
		XTR_Output_Data[OutputFile] = {
			data = {},
			min = nil,
			max = nil,
			num = 0
		}
	end
	FX_TacticalReport_PlayerNum = Universe_PlayerCount()
	Rule_AddInterval("X_TacticalReport",1)
	Rule_AddInterval("X_TacticalReport_CheckEnd", 1.09)
	--保证至少有两份数据以便正确绘图
	X_TacticalReport()
	X_TacticalReport()
end

function X_TacticalReport_CheckEnd()
	if Rule_Exists("waitForEnd") == 1 then 
		X_TacticalReport_End()
	end
end

function X_TacticalReport()
	for OutputFile, OutputFunction in XTR_Output do
		local t = {}
		for i = 0, FX_TacticalReport_PlayerNum - 1 do
			local value = OutputFunction(i)
			t[i + 1] = value
			if (not XTR_Output_Data[OutputFile].max) or XTR_Output_Data[OutputFile].max < value then 
				XTR_Output_Data[OutputFile].max = value
			end
			if (not XTR_Output_Data[OutputFile].min) or XTR_Output_Data[OutputFile].min > value then 
				XTR_Output_Data[OutputFile].min = value
			end
		end
		local num = XTR_Output_Data[OutputFile].num + 1
		XTR_Output_Data[OutputFile].num = num
		XTR_Output_Data[OutputFile].data[num] = t
	end
end


function X_TacticalReport_End()
	if Rule_Exists("X_TacticalReport_CheckEnd") == 1 then
		Rule_Remove("X_TacticalReport_CheckEnd")
		
		if (writeto and writeto("FX_TacticalReport_Enabled.lua") ~= nil) then
			write("FX_TacticalReport_Enabled = 1\n")
			writeto()
		end
		
		--Write csv files
		for OutputFile, OutputFunction in XTR_Output do
			if (writeto and writeto(OutputFile..".csv") ~= nil) then
				for i = 1, FX_TacticalReport_PlayerNum do
						write("P"..i..":"..Race_GetName(Player_GetRace(i-1))..",")
				end
				write("\n")
				for i = 1, XTR_Output_Data[OutputFile].num do
					for j = 1, FX_TacticalReport_PlayerNum do
						write(XTR_Output_Data[OutputFile].data[i][j]..",")
					end
					write("\n")
				end
				writeto()
			end
		end
		
		for OutputFile, OutputFunction in XTR_Output do
			FX_TacticalReport_Create(OutputFile)
		end
		
		if (writeto and writeto("FX_TacticalReport_Summary.lua") ~= nil) then
			write("PlayerNum = "..FX_TacticalReport_PlayerNum.."\n")
			write("PlayerName = {")
			for i = 0, FX_TacticalReport_PlayerNum - 1 do
				write("\"P"..(i + 1)..":"..FX_TacticalReport_Race_Name(i).."("..FX_TacticalReport_CPU_Name(Player_GetLevelOfDifficulty(i))..")\", ")
			end
			write("}\n")
			
			write("FX_TacticalReport_maxmin = {\n")
			for OutputFile, OutputFunction in XTR_Output do
				write("\t"..OutputFile.." = {")
				if XTR_Output_Data[OutputFile].max == XTR_Output_Data[OutputFile].min then 
					write("max = "..(XTR_Output_Data[OutputFile].max + 1)..", ")
				else 
					write("max = "..XTR_Output_Data[OutputFile].max..", ")
				end     
				write("min = "..XTR_Output_Data[OutputFile].min)
				write("},\n")
			end
			write("}\n")
			
			local gameTime = Universe_GameTime()
			write("GameTime = {")
			for i = 1, 10 do
				local tTime = gameTime/10 * i
				write("\""..format("%d:%02d:%02d", floor(tTime/3600), floor(mod(tTime,3600)/60), floor(mod(tTime,60))).."\", ")
			end
			write("}\n")
			writeto()
		end
	end
end
--------------------------------------------
function FX_TacticalReport_WriteTGAHeader(fileID)
	-- 1  1 byte  ID length  Length of the image ID field
	-- 2  1 byte  Color map type  Whether a color map is included
	-- 3  1 byte  Image type  Compressionand color types
	-- 4  5 bytes  Color map specification  Describes the color map
	-- 5  10 bytes  Image specification  Image dimensionsand format

	-- ID length = 0
	-- Color map type = no color map
	-- Image type = uncompressed true - color image

	write(fileID, byte2str(0), byte2str(0), byte2str(2))

	-- Color map = no color map
	write(fileID, byte2str(0), byte2str(0), byte2str(0), byte2str(0), byte2str(0))

	-- X - origin
	-- Y - origin
	write(fileID, byte2str(0), byte2str(0), byte2str(0), byte2str(0))

	-- Image width
	-- Image height
	write(
		fileID, 
		byte2str(mod(FX_TacticalReport_Width,256)), byte2str(floor(FX_TacticalReport_Width/256)),
		byte2str(mod(FX_TacticalReport_Height,256)), byte2str(floor(FX_TacticalReport_Height/256))
	)

	-- Pixel depth
	write(fileID, byte2str(FX_TacticalReport_BytePerPixel*8))

	-- Image descriptor = (alpha channel depth = (FX_TacticalReport_BytePerPixel-3)*8 )
	-- (direction = 0, 0 = left to right, bottom to top ? )
	write(fileID, byte2str((FX_TacticalReport_BytePerPixel-3)*8))
end

function FX_TacticalReport_WriteTGABKG(fileID,count)
	while count >= 512 do
		count = count - 512 
		write(fileID, FX_TacticalReport_BKGColor512)
	end
	while count >= 256 do
		count = count - 256 
		write(fileID, FX_TacticalReport_BKGColor256)
	end
	while count >= 128 do
		count = count - 128 
		write(fileID, FX_TacticalReport_BKGColor128)
	end
	while count >= 64 do
		count = count - 64 
		write(fileID, FX_TacticalReport_BKGColor64)
	end
	while count >= 32 do
		count = count - 32 
		write(fileID, FX_TacticalReport_BKGColor32)
	end
	while count >= 16 do
		count = count - 16 
		write(fileID, FX_TacticalReport_BKGColor16)
	end
	while count >= 8 do
		count = count - 8 
		write(fileID, FX_TacticalReport_BKGColor8)
	end
	while count >= 4 do
		count = count - 4 
		write(fileID, FX_TacticalReport_BKGColor4)
	end
	while count >= 2 do
		count = count - 2 
		write(fileID, FX_TacticalReport_BKGColor2)
	end
	while count >= 1 do
		count = count - 1
		write(fileID, FX_TacticalReport_BKGColor)
	end
end

function FX_TacticalReport_WriteTGAData(fileID, imgdata)
	-- 6	From image ID length field	Image ID	Optional field containing identifying information
	-- 7	From color map specification field	Color map data	Look - up table containing color map data
	-- 8	From image specification field	Image data	Stored according to the image descriptor
	
	-- image data
	local bkgCount = 0	
	for i = 0, FX_TacticalReport_Width * FX_TacticalReport_Height - 1 do
		if imgdata[i] then
			FX_TacticalReport_WriteTGABKG(fileID, bkgCount)
			bkgCount = 0
			write(fileID, imgdata[i])    
		else
			bkgCount = bkgCount + 1
			--write(fileID, FX_TacticalReport_BKGColor)
		end
	end
	FX_TacticalReport_WriteTGABKG(fileID, bkgCount)
end

function FX_TacticalReport_Rect(imgdata, x, y, w, h, color)
	for i = x, x+w-1 do 
		for j = y, y+h-1 do
			imgdata[(j*FX_TacticalReport_Width + i)] = color
		end
	end
end

function FX_TacticalReport_Draw(imgdata, valdata, ymax, ymin, valnum)
	local xperpixel = (valnum - 1) / (FX_TacticalReport_Width - FX_TacticalReport_Margin*2)
	local yperpixel
	if ymax <= ymin then 
		yperpixel = 1 / (FX_TacticalReport_Height - FX_TacticalReport_Margin*2)
	else 
		yperpixel = (ymax - ymin) / (FX_TacticalReport_Height - FX_TacticalReport_Margin*2)
	end
	for i = 1,FX_TacticalReport_PlayerNum do
		local lastY = floor((valdata[1][i] - ymin)  / yperpixel + FX_TacticalReport_Margin + 0.5)
		for x = FX_TacticalReport_Margin + 1, FX_TacticalReport_Width - FX_TacticalReport_Margin -2 do
			local xd = (x - FX_TacticalReport_Margin) * xperpixel
			local xleft = floor(xd)
			local k = (valdata[xleft + 2][i] - valdata[xleft + 1][i])
			local y = floor((k * (xd - xleft) + valdata[xleft + 1][i] - ymin) / yperpixel + FX_TacticalReport_Margin + 0.5)
			FX_TacticalReport_Rect(imgdata, x, min(lastY, y), FX_TacticalReport_LineWidth, abs(lastY - y), FX_TacticalReport_LineColors[i])
			FX_TacticalReport_Rect(imgdata, x, y, 1, FX_TacticalReport_LineWidth, FX_TacticalReport_LineColors[i])
			lastY = y
		end
	end
end

function FX_TacticalReport_Cell(imgdata, xNum, yNum)
	for i = 0,xNum do
		x = FX_TacticalReport_Margin + (FX_TacticalReport_Width - FX_TacticalReport_Margin*2)/xNum * i
		FX_TacticalReport_Rect(imgdata, x, FX_TacticalReport_Margin, 1, FX_TacticalReport_Height - FX_TacticalReport_Margin*2, FX_TacticalReport_CellColor)
	end
	for i = 0,yNum do
		y = FX_TacticalReport_Margin + (FX_TacticalReport_Height - FX_TacticalReport_Margin*2)/yNum * i
		FX_TacticalReport_Rect(imgdata, FX_TacticalReport_Margin, y, FX_TacticalReport_Width - FX_TacticalReport_Margin*2, 1, FX_TacticalReport_CellColor)
	end
end 

function FX_TacticalReport_Create(reportName) 
	local report = XTR_Output_Data[reportName]
	local imgdata = {}
	--颜色字符串必须在绘图前再初始化
	--因为存档并不能正确保存这些字符串
	FX_TacticalBGRAInit()
	FX_TacticalReport_Cell(imgdata, 10, 10)
	FX_TacticalReport_Draw(imgdata, report.data, report.max, report.min, report.num) 
	local fileID, err = openfile(reportName..".tga", "wb")
	if fileID then
		FX_TacticalReport_WriteTGAHeader(fileID)
		FX_TacticalReport_WriteTGAData(fileID, imgdata)
		closefile(fileID)
	else 
	  derr("Failed to write to `"..reportName..".tga\', error reason: "..err)
	end
end