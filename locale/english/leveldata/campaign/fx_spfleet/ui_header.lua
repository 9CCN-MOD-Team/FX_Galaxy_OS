function CreateFrame(sName)
	local sFRAME = 
				{
					type = "Frame",
					name = sName,
					Layout = 
					{
						pos_XY = {	x= 0, y= 0, xr="scr", yr="scr",},					
						size_WH = {w = 0, h = 0, wr = "scr", hr = "scr",},
					},
					visible = 0,
				}
    return sFRAME
end

LF_BuyCount=17

btnpressed={}
btnpressed[1]=0
btnpressed[2]=0
btnpressed[3]=0
btnpressed[4]=0
btnpressed[5]=0
btnpressed[6]=0
btnpressed[7]=0
btnpressed[8]=0
btnpressed[9]=0
btnpressed[10]=0
btnpressed[11]=0
btnpressed[12]=0
btnpressed[13]=0
btnpressed[14]=0
btnpressed[15]=0
btnpressed[16]=0
btnpressed[17]=0



BuyContent={}

BuyContent[1]="nccn_fox_ls"
BuyContent[2]="nccn_xangle_ls"
BuyContent[3]="nccn_u571"
BuyContent[4]="nccn_dreadnaught_ls"
BuyContent[5]="nccn_yo"
BuyContent[6]="nccn_rain"
BuyContent[7]="nccn_lonewolf"
BuyContent[8]="nccn_sajuuk"
BuyContent[9]="nccn_WeiYi"
BuyContent[10]="nccn_sunnycat"
BuyContent[11]="nccn_wildheart"
BuyContent[12]="nccn_jele"
BuyContent[13]="nccn_unit_x"
BuyContent[14]="nccn_TuMen"
BuyContent[15]="nccn_poet"
BuyContent[16]="nccn_ikuy"
BuyContent[17]="nccn_princess"




BuyCost={}
BuyCost[1]=500
BuyCost[2]=2000
BuyCost[3]=4000
BuyCost[4]=4500
BuyCost[5]=6000
BuyCost[6]=3000
BuyCost[7]=4500
BuyCost[8]=4500
BuyCost[9]=5500
BuyCost[10]=5500
BuyCost[11]=5500
BuyCost[12]=5500
BuyCost[13]=6000
BuyCost[14]=6000
BuyCost[15]=3000
BuyCost[16]=3000
BuyCost[17]=3000






buyOwned={}
buyOwned[1]=0
buyOwned[2]=0
buyOwned[3]=0
buyOwned[4]=0
buyOwned[5]=0
buyOwned[6]=0
buyOwned[7]=0
buyOwned[8]=0
buyOwned[9]=0
buyOwned[10]=0
buyOwned[11]=0
buyOwned[12]=0
buyOwned[13]=0
buyOwned[14]=0
buyOwned[15]=0
buyOwned[16]=0
buyOwned[17]=0

AlreadyOwned="����ӵ�д˵�λ��"

buttonName={}
buttonDescribe={}
noRUMessage={}
buyMessage={}

buttonName[1]="FOX-����������"
buttonDescribe[1]="500RU - ��Ч��Χ����ӣ���߷�������"
noRUMessage[1]="FOX:��Դ���㣬��ͷ��δ����"
buyMessage[1]="FOX����Ӧ���Ѿ������������ϰɣ� "


buttonName[2]="X-����ϸ��"
buttonDescribe[2]="2000RU - ��Ч������ͧս�����"
noRUMessage[2]="[RU���㣬X����˯��]"
buyMessage[2]="X��ʲô����Ҫ��MOD�����ｻ���Ұ�poi~��"



buttonName[3]="571-����ϸ��"
buttonDescribe[3]="4000RU - ���;�Ӣ����ͧ�жӣ�ӵ��ǿ��ľ���ɨ������"
noRUMessage[3]="[RU���㣬571�ж�Ǳ����]"
buyMessage[3]="571��HW-U-571�����������������Ķ��أ�"



buttonName[4]="��η-��������"
buttonDescribe[4]="4500RU - ����������ӣ���Ч�������"
noRUMessage[4]="[RU���㣬��η��������ﲻ�ϳ���]"
buyMessage[4]="��η��С��η���ǳ��������ǿ����������������������"



buttonName[5]="YO-���������齢"
buttonDescribe[5]="6000RU - ʵ���е����⻤�������ɿ�������ը��"
noRUMessage[5]="[RU���㣬��ȥѰ��YO��̽������ʧ��]"
buyMessage[5]="YO��[�䡪����]"

buttonName[6]="Rain-�Ƴǵ�½��"
buttonDescribe[6]="3000RU - ������װ��½�������ڲ���������ֻ"
noRUMessage[6]="[RU���㣬RAIN��ƴװ������]"
buyMessage[6]=" Rain��ɶ���ðɣ����㿴����Rain�ı��£�"

buttonName[7]="����-����������"
buttonDescribe[7]="4500RU - ���͸������𽢣���Ч���ƻ���ͧ/������"
noRUMessage[7]="[RU���㣬��������GAL]"
buyMessage[7]="���ǣ�����ȥ�����Ϸ�ú�������ӣ��ᶽ�ܴ�����һ����o(>��<)o ��"


buttonName[8]="����-ս��Ѳ��"
buttonDescribe[8]="4500RU - �๦������������Ч���ƻ�����"
noRUMessage[8]="�����������RU����Ӷ�������"
buyMessage[8]="�����������ڿ�����"


buttonName[9]="Ψһ-�������ؽ�"
buttonDescribe[9]="5500RU - �๦�ܺ�ĸ���ɽ����ػ�����������"
noRUMessage[9]="[RU���㣬Ψһ�������֮��]"
buyMessage[9]="Ψһ����Ψһ�ǳ��������ǿ������˵�������"


buttonName[10]="��-��֮��ĸ"
buttonDescribe[10]="5500RU - ����ĸ������Ч��������/ս��"
noRUMessage[10]="[RU���㣬����ʧ��]"
buyMessage[10]="����Ծ��ɣ�׼������ս����"


buttonName[11]="WildHeart-����Ѳ��"
buttonDescribe[11]="5500RU - ��������������Ч���ƻ�������������"
noRUMessage[11]="[RU����-WildHeart�ڵ�ʱ��]"
buyMessage[11]="WildHeart:Hyperspace entry stable. Fleet, WildHeart is joining the assault."

buttonName[12]="Jele-����Ѳ��"
buttonDescribe[12]="5500RU - ������������ʹ�����ڽ��л���֧Ԯ"
noRUMessage[12]="JELE��˵����5500RU�ģ���ô��Ǯ����������ӣ�"
buyMessage[12]="JELE���úúã������ˣ�"



buttonName[13]="UX-��ͼ������"
buttonDescribe[13]="6000RU - �߻������𽢣�ӵ�г����Ļ����;��˵��ٶ�"
noRUMessage[13]="[RU���㣬UX�����⻷ó����������]"
buyMessage[13]="UX��̫������Щ�������������ˣ�����UXMOD��ɶ�����Ҳ�ڿ�������Ŷ��"


buttonName[14]="ͼ��-�ѻ���"
buttonDescribe[14]="6000RU - ���̻���֧Ԯ������ǿ��Ķ��������ڸ�Ч����������"
noRUMessage[14]="[RU���㣬ͼ����д�趨]"
buyMessage[14]="ͼ�ţ�Ծ������ȷ�ϣ���Ϊ�ұ�ǵо�����Ŀ�꣡"


buttonName[15]="ʫ��-������"
buttonDescribe[15]="3000RU - ����֧Ԯ�������ӷ�Χ���Ѿ������͵о��Ļ���/������"
noRUMessage[15]="[RU���㣬ʫ������׷������]"
buyMessage[15]="ʫ�ˣ��������������ս������ʼ���л������"


buttonName[16]="IK-���"
buttonDescribe[16]="3000RU - ս��Ҫ������ͣ�����ֽ�����ӵ����������"
noRUMessage[16]="[RU���㣬IK����λ��û����]"
buyMessage[16]="IK����۽���ս����"


buttonName[17]="Ψһ������"
buttonDescribe[17]="3000RU - 9CCNս�Դ��룬�ɸ�Чͣ����ά��ȫ��9CCN��λ"
noRUMessage[17]="Ψһ��ȥȥȥ����ô��RU���ǲ����ó������ŵģ�"
buyMessage[17]="Ψһ��Ψһ��������������С�ĵ�����λ��ˣ�"




