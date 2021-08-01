X_InitPort=1000
X_GlobalKeyPort=2000
X_ShipKeyPort=3000

--获取GameEvent端口(InitPort可用：X_InitPort/X_GlobalKeyPort/X_ShipKeyPort)
function X_GetGameEventPort(InitPort)
	local iPort=1
	while(GameEvent_IsListening(InitPort+2*iPort-1)~="")do
		iPort=iPort+1
	end
	return InitPort+2*iPort-1
end
--设置ShipIdioStateKey
function xSetShipIdioStateKeyFromCustomCode(iShip,iKeyNumber,iKey)
	local iPort=X_GetGameEventPort(X_ShipKeyPort)
	if(iKey=="On")then
		GameEvent_Listen(iPort,tostring(iKeyNumber))
		GameEvent_Listen(iPort+1,tostring(iShip))
	else
		GameEvent_Listen(iPort,tostring(iKeyNumber))
		GameEvent_Listen(iPort+1,tostring((-1)*iShip))
	end
end
--设置GlobalStateKey
function xSetGlobalStateKeyFromCustomCode(iKeyNumber,iKey)
	local iPort=X_GetGameEventPort(X_GlobalKeyPort)
	GameEvent_Listen(iPort,tostring(iKeyNumber))
	GameEvent_Listen(iPort+1,iKey)
end
--切换ShipIdioStateKey
function xSwitchShipIdioStateKeyFromCustomCode(iShip,iKeyNumber)
	local iPort=X_GetGameEventPort(X_ShipKeyPort)
	GameEvent_Listen(iPort,tostring((-1)*iKeyNumber))
	GameEvent_Listen(iPort+1,tostring(iShip))
end