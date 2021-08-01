--Function=
--{
--		°≠°≠
--		{<FunctionName>,<FunctionParameter>,},
--		°≠°≠
--}

XTechFunction = {}
--FunctionName: "GainRU"
--Give player <FunctionParameter> RU when the technology is researched
XTechFunction["GainRU"]=function(iPlayer,Parameter,iTime,iTechnology)--PlayerIndex£¨FunctionParameter£¨Time£¨TechnologyIndex
	Player_SetRU(iPlayer,Player_GetRU(iPlayer)+Parameter)
end

--Ω–Õ£FunctionReset¿‡ø∆ºº
function XEndTech(iPlayerIndex,iTechnology)
	TechnologyTimeCountDown[iPlayerIndex + 1][iTechnology]=-1
end