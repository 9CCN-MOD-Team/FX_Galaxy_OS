dofilepath("data:leveldata/multiplayer/resdata/customcode_custom.lua")

function Create_X(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist(CustomGroup..shipID)
--自定义CustomCode
	if(X_CustomFunctionCreate[CustomGroup]~=nil)then
		X_CustomFunctionCreate[CustomGroup](CustomGroup, playerIndex, shipID)
	end
end

function Update_X(CustomGroup, playerIndex, shipID)
--为单位建立X系统初始化GameEvent端口
	if(SobGroup_Empty(CustomGroup..shipID)==1)and(SobGroup_GroupInGroup("X_RunningGroup",CustomGroup)==0)then
		SobGroup_SobGroupAdd(CustomGroup..shipID,CustomGroup)
		SobGroup_SobGroupAdd("X_RunningGroup",CustomGroup)
		local iPort=X_GetGameEventPort(X_InitPort)
		GameEvent_Listen(iPort,CustomGroup)
		GameEvent_Listen(iPort+1,tostring(shipID))
	end
--自定义CustomCode
	if(X_CustomFunctionUpdate[CustomGroup]~=nil)then
		X_CustomFunctionUpdate[CustomGroup](CustomGroup, playerIndex, shipID)
	end
end

function Destroy_X(CustomGroup, playerIndex, shipID)
--自定义CustomCode
	if(X_CustomFunctionDestroy[CustomGroup]~=nil)then
		X_CustomFunctionDestroy[CustomGroup](CustomGroup, playerIndex, shipID)
	end
end