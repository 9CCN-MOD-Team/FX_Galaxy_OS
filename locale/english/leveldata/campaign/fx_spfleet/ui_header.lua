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

AlreadyOwned="你已拥有此单位！"

buttonName={}
buttonDescribe={}
noRUMessage={}
buyMessage={}

buttonName[1]="FOX-伴随者侦察机"
buttonDescribe[1]="500RU - 高效大范围侦察大队，兼具防空能力"
noRUMessage[1]="FOX:资源不足，镜头尚未备妥"
buyMessage[1]="FOX：感应器已就绪，让我们上吧！ "


buttonName[2]="X-巨噬细胞"
buttonDescribe[2]="2000RU - 高效反护航艇战机大队"
noRUMessage[2]="[RU不足，X大熟睡中]"
buyMessage[2]="X：什么，你要做MOD？这里交给我吧poi~！"



buttonName[3]="571-变异细胞"
buttonDescribe[3]="4000RU - 重型精英护航艇中队，拥有强大的聚能扫射武器"
noRUMessage[3]="[RU不足，571中队潜航中]"
buyMessage[3]="571：HW-U-571向您报到。敌人在哪儿呢？"



buttonName[4]="无畏-火神护卫舰"
buttonDescribe[4]="4500RU - 火神护卫舰编队，高效区域防空"
noRUMessage[4]="[RU不足，无畏赖在乡港里不肯出来]"
buyMessage[4]="无畏：小无畏酱登场！让你们看看火神护卫舰编组的厉害！"



buttonName[5]="YO-审判者试验舰"
buttonDescribe[5]="6000RU - 实验中的特殊护卫舰，可开启区域爆炸场"
noRUMessage[5]="[RU不足，派去寻找YO的探测器消失了]"
buyMessage[5]="YO：[轰——！]"

buttonName[6]="Rain-破城登陆舰"
buttonDescribe[6]="3000RU - 高速重装登陆舰，用于捕获其它舰只"
noRUMessage[6]="[RU不足，RAIN在拼装钢普拉]"
buyMessage[6]=" Rain：啥？好吧，让你看看老Rain的本事！"

buttonName[7]="孤狼-卡德仕驱逐舰"
buttonDescribe[7]="4500RU - 轻型高速驱逐舰，高效反制护航艇/护卫舰"
noRUMessage[7]="[RU不足，孤狼在推GAL]"
buyMessage[7]="孤狼：看上去这个游戏好好玩的样子，提督能带我玩一玩吗o(>ω<)o ？"


buttonName[8]="教主-战术巡洋舰"
buttonDescribe[8]="4500RU - 多功能主力舰，高效反制护卫舰"
noRUMessage[8]="教主：就这点RU，填坑都不够！"
buyMessage[8]="教主：我来挖坑啦！"


buttonName[9]="唯一-攻击运载舰"
buttonDescribe[9]="5500RU - 多功能航母，可进行重火力导弹齐射"
noRUMessage[9]="[RU不足，唯一在玩库申之歌]"
buyMessage[9]="唯一：老唯一登场！让你们看看攻运的厉害！"


buttonName[10]="翼-光之云母"
buttonDescribe[10]="5500RU - 星云母舰，高效反主力舰/战机"
noRUMessage[10]="[RU不足，翼消失了]"
buyMessage[10]="翼：跳跃完成，准备进入战斗！"


buttonName[11]="WildHeart-重型巡洋舰"
buttonDescribe[11]="5500RU - 重型主力舰，高效反制护卫舰、主力舰"
noRUMessage[11]="[RU不足-WildHeart在倒时差]"
buyMessage[11]="WildHeart:Hyperspace entry stable. Fleet, WildHeart is joining the assault."

buttonName[12]="Jele-重炮巡洋舰"
buttonDescribe[12]="5500RU - 重型主力舰，使用重炮进行火力支援"
noRUMessage[12]="JELE：说好了5500RU的，这么点钱就想拉我入坑？"
buyMessage[12]="JELE：好好好，我来了！"



buttonName[13]="UX-本图西驱逐舰"
buttonDescribe[13]="6000RU - 高机动驱逐舰，拥有持续的火力和惊人的速度"
noRUMessage[13]="[RU不足，UX正在外环贸易线做生意]"
buyMessage[13]="UX：太阳风有些喧嚣啊……对了，好像UXMOD的啥玩意儿也在靠近这里哦？"


buttonName[14]="图门-狙击舰"
buttonDescribe[14]="6000RU - 长程火力支援舰，以强大的定向能主炮高效反制主力舰"
noRUMessage[14]="[RU不足，图门在写设定]"
buyMessage[14]="图门：跃出坐标确认，请为我标记敌军主力目标！"


buttonName[15]="诗人-金字塔"
buttonDescribe[15]="3000RU - 区域支援——增加范围内友军、降低敌军的火力/命中率"
noRUMessage[15]="[RU不足，诗人正在追逐驱逐舰]"
buyMessage[15]="诗人：先祖金字塔进入战场，开始进行火控增益"


buttonName[16]="IK-乡港"
buttonDescribe[16]="3000RU - 战斗要塞，可停泊各种舰船并拥有自卫能力"
noRUMessage[16]="[RU不足，IK的数位板没电了]"
buyMessage[16]="IK：乡港进入战场。"


buttonName[17]="唯一公主号"
buttonDescribe[17]="3000RU - 9CCN战略船坞，可高效停泊、维修全部9CCN单位"
noRUMessage[17]="唯一：去去去，这么点RU我是不会拿出公主号的！"
buyMessage[17]="唯一：唯一公主号来啦，可小心点别把漆刮花了！"




