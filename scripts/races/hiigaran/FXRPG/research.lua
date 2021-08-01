Icon_Speed = "data:ui/newui/research/icons/speed.tga"
Icon_Health = "data:ui/newui/research/icons/health.tga"
Icon_Tech = "data:ui/newui/research/icons/tech.tga"
Icon_Ability = "data:ui/newui/research/icons/ability.tga"
Icon_Build = "data:ui/newui/research/icons/build.tga"
Icon_Attack = "data:ui/newui/research/icons/attack.tga"
Icon_Cloak = "data:ui/newui/research/icons/cloak.tga"
Icon_Emp = "data:ui/newui/research/icons/Emp.tga"
Icon_Hyperspace = "data:ui/newui/research/icons/hyperspace.tga"
Icon_ping = "data:ui/newui/research/icons/ping.tga"
Icon_Repair = "data:ui/newui/research/icons/repair.tga"
Icon_RU = "data:ui/newui/research/icons/ru.tga"
Icon_shield = "data:ui/newui/research/icons/shield.tga"
Modifier = 0
Ability = 1
AllShips = 0
Family = 1
Ship = 2
research = 
{
}
researchitemIndex=0
DTM4_ResearchItem=
{
	{
		Name="ResourceCapacityUpgrade",
		UpgradeName="ResourceCapacity",
		UpgradeValue=function(i) return 1+0.1*i end,
	},
	{
		Name="WeaponDamageUpgrade",
		UpgradeName="WeaponDamage",
		UpgradeValue=function(i) return 1+0.05*i end,
	},
	{
		Name="MaxHealthUpgrade",
		UpgradeName="MaxHealth",
		UpgradeValue=function(i) return 1+0.1*i end,
	},
	{
		Name="MaxSpeedUpgrade",
		UpgradeName="MaxSpeed",
		UpgradeValue=function(i) return 1+0.05*i end,
	},
	{
		Name="HealthRegenerationRateUpgrade",
		UpgradeName="HealthRegenerationRate",
		UpgradeValue=function(i) return 1/1+0.1*i end,
	},
	{
		Name="SecondarySensorsRangeUpgrade",
		UpgradeName="SecondarySensorsRange",
		UpgradeValue=function(i) return 1+0.1*i end,
	},
}
function DTM4_ResearchItemExample()
	local t=
  {
    --Name = "HyperspaceCostUpgrade1",
    RequiredResearch = "",
    RequiredSubSystems = "",
    Cost = 100,
    Time = 100,
    DisplayPriority = 100,
    UpgradeType = Modifier,
    TargetType = AllShips,
    --UpgradeName = "HyperspaceCost",
    --UpgradeValue = 0.8,
    TargetType = AllShips,
    Icon = Icon_Hyperspace,
  }
  return t
end

for researchIndex,researchItem in DTM4_ResearchItem do
	for i=1,10 do
		research[10*researchIndex+i-10]=DTM4_ResearchItemExample()
		research[10*researchIndex+i-10].Name=researchItem.Name..i
		research[10*researchIndex+i-10].UpgradeName=researchItem.UpgradeName
		research[10*researchIndex+i-10].UpgradeValue=researchItem.UpgradeValue(i)
	end
end
--dofilepath("data:scripts/races/AIscripts/AIReserch.lua")