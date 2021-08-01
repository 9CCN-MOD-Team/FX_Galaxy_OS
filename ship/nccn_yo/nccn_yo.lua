function Create_YO(CustomGroup, playerIndex, shipID)  

local sob_position1=SobGroup_GetPosition(CustomGroup)
Volume_AddSphere("LAST_EXP_"..shipID,{sob_position1[1],sob_position1[2],sob_position1[3],}, 100)
FX_PlayEffect("great_explosion","LAST_EXP_"..shipID,0.7)
Volume_Delete("LAST_EXP_"..shipID)

end

function Update_YO(CustomGroup, playerIndex, shipID)  

--local Tac_Now=SobGroup_GetTactics(CustomGroup)
local Tac_Now=SobGroup_GetROE(CustomGroup)

if Tac_Now==0 then

  local sob_position2=SobGroup_GetPosition(CustomGroup)

  local rand_eps1={}
  local rand_eps2={}
  local rand_eps3={}

  for i=1,10 do

    local tmp_explosion={}
    local Time_NOW=Universe_GameTime()
    rand_eps1[i]= random(0,Time_NOW+5000)
    rand_eps2[i]= random(0,Time_NOW+5000)
    rand_eps3[i]= random(0,Time_NOW+5000)

    rand_eps1[i]= mod(rand_eps1[i],5000)
    rand_eps2[i]= mod(rand_eps2[i],5000)
    rand_eps3[i]= mod(rand_eps3[i],5000)

    tmp_explosion[1]=rand_eps1[i]-2500
    tmp_explosion[2]=rand_eps2[i]-2500
    tmp_explosion[3]=rand_eps3[i]-2500

    local exp_pos={}
    exp_pos[1]=sob_position2[1]+(tmp_explosion[1]*0.35)
    exp_pos[2]=sob_position2[2]+(tmp_explosion[2]*0.35)
    exp_pos[3]=sob_position2[3]+(tmp_explosion[3]*0.35)
  --  _ALERT("I:"..i..exp_pos[1].."_"..exp_pos[2].."_"..exp_pos[3])
    Volume_AddSphere("LAST_EXP_"..shipID..i, {exp_pos[1],exp_pos[2],exp_pos[3],}, 100)
    --FX_PlayEffect("dmg_cloud_explosion_large","LAST_EXP_"..shipID..i,20)
    FX_PlayEffect("dmg_cloud_main_explosion_combo","LAST_EXP_"..shipID..i,20)

    FX_StartEvent(CustomGroup,"SFX")
    --FX_PlayEffect("great_explosion","LAST_EXP_"..shipID..i,0.7)
 
    Volume_Delete("LAST_EXP_"..shipID..i)
  end

local iPlayer=0
local iPlayerCount = Universe_PlayerCount()

while(iPlayer < iPlayerCount) do--循环每个玩家
  SobGroup_DoDamageProximitySobGroup(CustomGroup, iPlayer,3000, 1600)
  iPlayer = iPlayer +1
end

end

end


function Destroy_YO(CustomGroup, playerIndex, shipID)  
local sob_position3=SobGroup_GetPosition(CustomGroup)
Volume_AddSphere("LAST_EXP_"..shipID,{sob_position3[1],sob_position3[2],sob_position3[3],}, 100)
FX_PlayEffect("great_explosion","LAST_EXP_"..shipID,2)
Volume_Delete("LAST_EXP_"..shipID)


local iPlayer=0
local iPlayerCount = Universe_PlayerCount()

while(iPlayer < iPlayerCount) do--循环每个玩家
  SobGroup_DoDamageProximitySobGroup(CustomGroup, iPlayer,30000, 5000)
  iPlayer = iPlayer +1
end


end

