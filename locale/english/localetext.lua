LocaleText = {}
LocaleText[1] = "����ǰ���Ǹ���һ��"
LocaleText[2] = "��һ��ȫ�µķ���ʽս���͸��ܻ�Ծ����������Ͷ��װ�õļ������ϣ����˲���RU"
LocaleText[3] = "ͼ����"
LocaleText[4] = "̩̹"
LocaleText[5] = "ϣ����"
LocaleText[6] = "����"
LocaleText[7] = "��"
LocaleText[8] = "��"
LocaleText[9] = function(tIndex,pIndex,artifactNum,artifacttowin)
	local s_text=""
	if(artifacttowin==0)then
		s_text="���"..pIndex.."ȡ����һ���������"..tIndex.."ӵ�����"..artifactNum
	else
		s_text="���"..pIndex.."ȡ����һ���������"..tIndex.."ӵ�����"..artifactNum.."/"..artifacttowin
	end
	return s_text
end
LocaleText[10] = function(artifacttowin)
	local s_text=""
	if(artifacttowin==0)then
		s_text="���������Ϸʱ��5:00ˢ�£���Ķ�����Ҫ�ڹ涨ʱ���ڻ�ȡ�������������ʤ��"
	else
		s_text="���������Ϸʱ��5:00ˢ�£���Ķ�����Ҫ�ڹ涨ʱ���ڻ�ȡ��������������Ȼ�ȡ"..artifacttowin.."�����������ʤ��"
	end
	return s_text
end
LocaleText[11] = "�õġ���"
LocaleText[12] = "������"
LocaleText[13] = "ά���"