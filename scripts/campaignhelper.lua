--教主的线性判断执行脚本2017.09.30

CH_Chain={}
CH_Chain.Example=
	{
		CurrentEvent=0
		;
		{--1 原初事件
			Interval=1,--运行间隔
			Function=
			function()
				_ALERT("执行事件1")
			--……
				return 2--事件2
			end,
		},
		{--2
			Interval=5,
			Function=
			function()
				_ALERT("执行事件2")
			--……
				return 0--结束事件链
			end,
		},
	}

function CH_ChainStart(iChain)
	Rule_AddIntervalParam("CH_ChainEvent",iChain,CH_Chain[iChain][1].Interval)
	CH_Chain[iChain].CurrentEvent=1
end

function CH_ChainEvent(iChain)
		CH_Chain[iChain].CurrentEvent=CH_Chain[iChain][CH_Chain[iChain].CurrentEvent].Function()
		Rule_RemoveParam("CH_ChainEvent",iChain)
		if (CH_Chain[iChain].CurrentEvent~=0) then
			Rule_AddIntervalParam("CH_ChainEvent",iChain,CH_Chain[iChain][CH_Chain[iChain].CurrentEvent].Interval)
		end
end