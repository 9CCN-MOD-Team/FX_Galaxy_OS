-------------------------------------------------------------
-------------Debug.lua-----------2016��02��27��--------------
--�� 9CCNMOD�� ������-���� ��д
--����ļ���������FX MOD��Ϊ�˷�����Զ����õ�һЩ�����ͺ���
--���ű�������ͨ�����ļ���ͷ���� dofilepath("data:scripts/debug.lua")�����ø��ļ�
--���󼴿�ͨ���ж�FX_debug��ֵ���жϵ�ǰ�Ƿ�Ϊ����ģʽ,�Ӷ�ȷ���Ƿ�ִ��һЩ����Ϸ��Լ���Ĵ���
--ͬʱҲ����ͨ��dout(sString)���������������Ϣ��ͨ��derr(sString)���������������Ϣ
-------------------------------------------------------------
-------------------------------------------------------------

--debugģʽ�ȼ����ã�0��ʾ������κ�dout��derr��1��ʾ���������derr�������dout��2��ʾ���������dout��derr
--����ʽ�����İ汾�н�������Ϊ1
FX_debug = 1
-------------------------------------------------------------

if (FX_debug) then
	if (FX_debug>1) then
		dout = function(sString)
			_ALERT("FX Debug Information: "..sString)
		end
	else
		dout = function(sString)
		end
	end
	if (FX_debug>0) then
		derr=function(sString)
			_ALERT("!FX MOD Error!: "..sString)
		end
	else
		derr=function(sString)
		end
	end
else
	dout=function(sString)
	end
	derr=function(sString)
	end
end