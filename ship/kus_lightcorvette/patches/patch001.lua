-------------------------------------------------------------
------patch001.lua-------2017��4��29��---------
--�� 9CCNMOD�� ������-���� ��д
--Ϊԭ�����ά��ͧ�޸���LatchOrientation�㣬���޸��ɼ�ʱƨ�ɳ�ǰ��
--�Լ����̲к�ʱ���ڿ�ǰ������
-------------------------------------------------------------
-------------------------------------------------------------
Patch_Priority = 3.0	
Patch_Exclusive = 0		
Patch_Ops = 					
{ 
	hp_0 = 							
	{
		root = "Root",		
		name = "Hardpoint_Gun0_Effect",
		pos = { 0, -3.5, 23 },
		rot = { 0, 0, rad(180) },
		axis = { 0, 0, 0 },
	},
	hp_1 = 							
	{
		root = "Root",		
		name = "LatchOrientation",
		pos = { 0, 50, 150 },
		rot = { rad(90), 0, rad(180) },
		axis = { 0, 0, 0 },
	},
		hp_2 = 							
		{
			root = "LatchOrientation",		
			name = "LatchOrientationUp",
			pos = { 0, 0, 10 },
			rot = { 0, 0, 0 },
			axis = { 0, 0, 0 },
		},
		hp_3 = 							
		{
			root = "LatchOrientation",		
			name = "LatchOrientationLeft",
			pos = { -10, 0, 0 },
			rot = { 0, 0, 0 },
			axis = { 0, 0, 0 },
		},
		hp_4 = 							
		{
			root = "LatchOrientation",		
			name = "LatchOrientationHeading",
			pos = { 0, 10, 0 },
			rot = { 0, 0, 0 },
			axis = { 0, 0, 0 },
		},
}
