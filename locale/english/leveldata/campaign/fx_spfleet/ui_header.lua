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

AlreadyOwned="You've owned that unit!"

buttonName={}
buttonDescribe={}
noRUMessage={}
buyMessage={}

buttonName[1]="FOX-Scouts"
buttonDescribe[1]="500RU - Efficient Scouting Squadron. Strong vs strike crafts."
noRUMessage[1]="FOX: Insufficient RUs, lenses are not ready"
buyMessage[1]="FOX: Sensor array standing by. Let's go!"


buttonName[2]="X-Lance Swarmers"
buttonDescribe[2]="2000RU - Elite Anti-Corvette Squadron."
noRUMessage[2]="[Insufficient RUs, Xangle is sleeping]"
buyMessage[2]="X: What, you're interested in modding? Just leave the battle for me poi~!"



buttonName[3]="571-Heteromorphosis Swarmers"
buttonDescribe[3]="4000RU - Elite Heavy Corvette Squadron. Can fire powerful energy burst (E key)."
noRUMessage[3]="[Insufficient RUs, U-571 squad is diving]"
buyMessage[3]="571: HW-U-571 reporting for duty sir. Where's the enemy?"



buttonName[4]="Dreadnaught-Vulcan Frigates"
buttonDescribe[4]="4500RU - Contain Five Vulcan Frigates. Elite anti-fighter squadron."
noRUMessage[4]="[Insufficient RUs, Dreadnaught refused to get up in his sweet home]"
buyMessage[4]="Dreadnaught: Dreadnaught-chan has come~! Let me show you the power of vulcan frigates!"



buttonName[5]="YO-\"Arbitrator\""
buttonDescribe[5]="6000RU - Experimental Special-Op Frigate, can active powerful area-blasting field"
noRUMessage[5]="[Insufficient RUs, probes sent to look for YO disappered]"
buyMessage[5]="YO: [BOOM!]"

buttonName[6]="Rain-Siege Drill Frigate"
buttonDescribe[6]="3000RU - High Speed Capture Frigate With Heavy Armor. Can capture other vessels."
noRUMessage[6]="[Insufficient RUs,RAIN is assembling miniature models]"
buyMessage[6]=" Rain: What? All right, Let's show them old Rain's techniques!"

buttonName[7]="LoneWolf-Kadesh Destroyer"
buttonDescribe[7]="4500RU - High Speed Light Destroyer. Elite Anti-corvette/frigate unit."
noRUMessage[7]="[Insufficient RUs, LoneWolf is playing GALGAME]"
buyMessage[7]="LongWolf: This game looks interesting, can I join you commander (>¦Ø<)o poi~?"


buttonName[8]="HW_Lover-Light Cruiser"
buttonDescribe[8]="4500RU - Multirole Capital Ship, Elite Anit-Frigate unit."
noRUMessage[8]="HW_Lover:These RU aren't even enough for filling old projects!"
buyMessage[8]="HW_Lover: I come to dig new holes!"


buttonName[9]="WeiYi-Attack Carrier"
buttonDescribe[9]="5500RU - Multirole Carrier. Can fire powerful Heavy Missile Volley."
noRUMessage[9]="[Insufficient RUs,WeiYi is playing Song of Kushan MOD]"
buyMessage[9]="WeiYi: Old WeiYi here! Feel the power of the Attack Carrier!"


buttonName[10]="SunnyCat-\"SuperNova\""
buttonDescribe[10]="5500RU - Nebula Mothership. Elite Anti-Capital Ship/Fighter unit."
noRUMessage[10]="[Insufficient RUs,Sunnycat disappeared]"
buyMessage[10]="Sunnycat: Hyperspace successful. Standing by for combat!"


buttonName[11]="WildHeart-Heavy Cruiser"
buttonDescribe[11]="5500RU - Heavy Capital Ship, Elite Anti-Capital Ship/Frigate unit."
noRUMessage[11]="[RInsufficient RUs,WildHeart is counteracting hyperspace lag]"
buyMessage[11]="WildHeart:Hyperspace entry stable. Fleet, WildHeart is joining the assault."

buttonName[12]="JELE-Heavygun Cruiser"
buttonDescribe[12]="5500RU - Heavy Capital Ship, uses heavy guns for fire suport."
noRUMessage[12]="JELE: The deal is 5500RU, I won't come with just that few!"
buyMessage[12]="JELE: Fine. I come now!"



buttonName[13]="UX-Bentusi Destroyer"
buttonDescribe[13]="6000RU - Highly Maneuverable Destroyer. Firm firepower and outstanding speed due to Bentusi's reactionless drive."
noRUMessage[13]="[Insufficient RUs, UX is trading in the Outer Limb Trade Route]"
buyMessage[13]="UX: The solar wind is clamorous today... By the way, it seems that some UXMOD's stuff are coming as well~"


buttonName[14]="TuMen-Sniper"
buttonDescribe[14]="6000RU - Long Range Fire Support Ship. Elite Anti-Capital Ship with powerful phased cannon array."
noRUMessage[14]="[Insufficient RUs, TuMen is writing concepts]"
buyMessage[14]="TuMen: Jump coordinates confirmed, please mark enemy's capital ship for me!"


buttonName[15]="Poet-Pyramid"
buttonDescribe[15]="3000RU - Area Support - Enhance friendly unit's accuracy/damage while reducing enemies' within range."
noRUMessage[15]="[Insufficient RUs, Poet is chasing with destroyers]"
buyMessage[15]="Poet: Progenitor Pyramid entering AO, Firecontrol Assistance under way."


buttonName[16]="IK-Outpost"
buttonDescribe[16]="3000RU - Combat Outpost, can dock units and have self-defensive heavy cannon turrets"
noRUMessage[16]="[Insufficient RUs, IK's tablet has no power]"
buyMessage[16]="IK: Sweet Home outpost entering battlefield."


buttonName[17]="Royal Princess"
buttonDescribe[17]="3000RU - 9CCN Strategic Shipyard. Can dock & fast repair 9CCN units."
noRUMessage[17]="WeiYi: Oh man, I won't call in the Royal Princess with only that amount of RU!"
buyMessage[17]="WeiYi: Royal Princess here! Be careful not to leave a scrath on it!"




