--�����������ж�ִ�нű�2017.09.30

CH_Chain={}
CH_Chain.Example=
	{
		CurrentEvent=0
		;
		{--1 ԭ���¼�
			Interval=1,--���м��
			Function=
			function()
				_ALERT("ִ���¼�1")
			--����
				return 2--�¼�2
			end,
		},
		{--2
			Interval=5,
			Function=
			function()
				_ALERT("ִ���¼�2")
			--����
				return 0--�����¼���
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