dofilepath("locale:fxgui.lua")

function NameSelectedShipOninit()
	ShipNamePingIndex={}
	SobGroup_Create("SelectedShipToName")
	SobGroup_Create("NamedShip1")
end

function NameSelectedShipOnStartOrLoad()
	-- reload NewTaskbar to trigger its onLoad function 
	-- we use this to disable the rename btn in multiplayer
	UI_ReloadScreen("NewTaskbar")
end

function NameSelected()
	MainUI_SelectedShips("SelectedShipToName")
	if (SobGroup_Empty("SelectedShipToName")==0) then
		SobGroup_DeSelectAll()
		local iIndex = getNamedShipIndex("SelectedShipToName")
		local iText = "$90400"
		if (ShipNamePingIndex[iIndex]~=nil) then
			if (ShipNamePingIndex[iIndex][1]~=nil) then
				Ping_Remove(ShipNamePingIndex[iIndex][1])
			end
			if (ShipNamePingIndex[iIndex][2]~=nil)and(ShipNamePingIndex[iIndex][2]~="") then
				iText=ShipNameText[1]..ShipNamePingIndex[iIndex][2]..ShipNameText[2]
			end
		end
		PinYin_Init(iText,NameSelectedShip)
	end
end

function NameSelectedShip(iName)
	if (SobGroup_Empty("SelectedShipToName")==0) then
		local iIndex=getNamedShipIndex("SelectedShipToName")
		ShipNamePingIndex[iIndex] = {Ping_AddSobGroup("", "dtm4_name", "SelectedShipToName"),iName}
		Ping_AddDescription(ShipNamePingIndex[iIndex][1],0,iName)
	end
end

function NameSobGroup(iSob, iName)
	if (SobGroup_Empty(iSob)==0) then
		local iIndex=getNamedShipIndex(iSob)
		ShipNamePingIndex[iIndex] = {Ping_AddSobGroup("", "dtm4_name", iSob),iName}
		Ping_AddDescription(ShipNamePingIndex[iIndex][1],0,iName)
	end
end

function getNamedShipIndex(iSob)
	local iIndex=1
	while (getn(ShipNamePingIndex)>=iIndex)and(SobGroup_GroupInGroup("NamedShip"..iIndex, iSob)==0) do
		iIndex=iIndex+1
		SobGroup_CreateIfNotExist("NamedShip"..iIndex)
	end
	if (getn(ShipNamePingIndex)<iIndex) then
		SobGroup_SobGroupAdd("NamedShip"..iIndex,iSob)
		SobGroup_SetSwitchOwnerFlag("NamedShip"..iIndex,0)
	end
	return iIndex
end

