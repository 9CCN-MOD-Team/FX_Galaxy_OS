dofilepath("data:leveldata/multiplayer/resdata/customcode_custom.lua")
dofilepath("data:scripts/camerashake.lua")


function Create_Common(CustomGroup, playerIndex, shipID)
--�Զ���CustomCode
	if(X_CustomFunctionCreate[CustomGroup]~=nil)then
		X_CustomFunctionCreate[CustomGroup](CustomGroup, playerIndex, shipID)
	end
end

function Update_Common(CustomGroup, playerIndex, shipID)
--�Զ���CustomCode
	if(X_CustomFunctionUpdate[CustomGroup]~=nil)then
		X_CustomFunctionUpdate[CustomGroup](CustomGroup, playerIndex, shipID)
	end
end

function Destroy_Common(CustomGroup, playerIndex, shipID)
	shockwave(playerIndex,CustomGroup)	
--�Զ���CustomCode
	if(X_CustomFunctionDestroy[CustomGroup]~=nil)then
		X_CustomFunctionDestroy[CustomGroup](CustomGroup, playerIndex, shipID)
	end
end
