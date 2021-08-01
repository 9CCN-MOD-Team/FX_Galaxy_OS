dofilepath("data:leveldata/campaign/fxlf_1/fxlf_1/res/LF_Header.lua")


LF_Ally_Fighter_Table={}
LF_Ally_Fighter_Table[1]={"hgn_interceptor","hgn_attackbomber"}
LF_Ally_Fighter_Table[2]={"hgn_interceptor","hgn_attackbomber","hgn_attackbomberelite"}
LF_Ally_Fighter_Table[3]={"hgn_interceptor","hgn_attackbomber","hgn_attackbomberelite"}
LF_Ally_Fighter_Table[4]={"hgn_interceptor","hgn_attackbomber","hgn_attackbomberelite"}
LF_Ally_Fighter_Table[5]={}
LF_Ally_Fighter_Table[6]={}
LF_Ally_Fighter_Table[7]={}
LF_Ally_Fighter_Table[8]={"hgn_interceptor","hgn_attackbomber","hgn_attackbomberelite"}

LF_L1_Size={2,3,3,3,0,0,0,3}

LF_Ally_Corvette_Table={}
LF_Ally_Corvette_Table[1]={}
LF_Ally_Corvette_Table[2]={"hgn_assaultcorvetteelite"}
LF_Ally_Corvette_Table[3]={"hgn_assaultcorvetteelite","hgn_pulsarcorvette"}
LF_Ally_Corvette_Table[4]={"tur_missilecorvette","tur_missilecorvette"}
LF_Ally_Corvette_Table[5]={"kad_advancedassaultswarmer","kad_advancedassaultswarmer"}
LF_Ally_Corvette_Table[6]={"hgn_assaultcorvetteelite","hgn_pulsarcorvette"}
LF_Ally_Corvette_Table[7]={"hgn_assaultcorvetteelite","hgn_pulsarcorvette"}
LF_Ally_Corvette_Table[8]={"hgn_assaultcorvetteelite","hgn_pulsarcorvette"}

LF_L2_Size={0,1,2,2,2,2,2,2}

LF_Ally_Frigate_Table={}
LF_Ally_Frigate_Table[1]={}
LF_Ally_Frigate_Table[2]={"hgn_assaultfrigate"}
LF_Ally_Frigate_Table[3]={"hgn_assaultfrigate","hgn_torpedofrigate"}
LF_Ally_Frigate_Table[4]={"hgn_assaultfrigate","hgn_torpedofrigate","hgn_ioncannonfrigate"}
LF_Ally_Frigate_Table[5]={"hgn_assaultfrigate","hgn_torpedofrigate","hgn_ioncannonfrigate"}
LF_Ally_Frigate_Table[6]={"hgn_assaultfrigate","hgn_torpedofrigate","hgn_ioncannonfrigate","kus_assaultfrigate","tai_assaultfrigate","kus_ioncannonfrigate","tai_ioncannonfrigate","vgr_artilleryfrigate_m15"}
LF_Ally_Frigate_Table[7]={"hgn_assaultfrigate","hgn_torpedofrigate","hgn_ioncannonfrigate","kus_assaultfrigate","tai_assaultfrigate","kus_ioncannonfrigate","tai_ioncannonfrigate","vgr_artilleryfrigate_m15"}
LF_Ally_Frigate_Table[8]={"hgn_assaultfrigate","hgn_torpedofrigate","hgn_ioncannonfrigate","kus_assaultfrigate","tai_assaultfrigate","kus_ioncannonfrigate","tai_ioncannonfrigate","vgr_artilleryfrigate_m15"}

LF_L3_Size={0,1,2,3,3,8,8,8}

LF_Ally_Capital_Table={}
LF_Ally_Capital_Table[1]={}
LF_Ally_Capital_Table[2]={}
LF_Ally_Capital_Table[3]={"hgn_carrier","hgn_destroyer"}
LF_Ally_Capital_Table[4]={"hgn_carrier","hgn_destroyer","kus_destroyer"}
LF_Ally_Capital_Table[5]={"hgn_destroyer","kus_destroyer"}
LF_Ally_Capital_Table[6]={"hgn_destroyer","kus_destroyer","tai_destroyer"}
LF_Ally_Capital_Table[7]={"hgn_destroyer","kus_destroyer","tai_destroyer","kus_heavycruiser","tai_heavycruiser"}
LF_Ally_Capital_Table[8]={"hgn_lightcruiser","kus_destroyer","tai_destroyer","kus_heavycruiser","tai_heavycruiser"}

LF_L4_Size={0,0,2,3,2,3,5,5}

LF_Ally_SuperCap_Table={}
LF_Ally_SuperCap_Table[1]={}
LF_Ally_SuperCap_Table[2]={}
LF_Ally_SuperCap_Table[3]={}
LF_Ally_SuperCap_Table[4]={"kus_missiledestroyer_9ccn"}
LF_Ally_SuperCap_Table[5]={"kus_missiledestroyer_9ccn"}
LF_Ally_SuperCap_Table[6]={"kus_missiledestroyer_9ccn"}
LF_Ally_SuperCap_Table[7]={"kus_missiledestroyer_9ccn","kad_battlecruiser_m15"}
LF_Ally_SuperCap_Table[8]={"hgn_battlecruiser","kad_battlecruiser_m15","hgn_lightcruiser"}




LF_L5_Size={0,0,0,1,1,1,2,3}




WAVE_Ally_Size={}

WAVE_Ally_Size[1]={3,3,0,0,0}
WAVE_Ally_Size[2]={3,2,3,0,0}
WAVE_Ally_Size[3]={5,2,2,1,0}
WAVE_Ally_Size[4]={5,6,1,2,1}
WAVE_Ally_Size[5]={0,8,3,3,2}
WAVE_Ally_Size[6]={0,4,6,2,1}
WAVE_Ally_Size[7]={0,3,6,2,1}
WAVE_Ally_Size[8]={5,3,8,2,3}




function WAVE_Spawn_Ally(index)

 SobGroup_Create("REINFORCEMENT"..index)
--Spawn FIGHTER

  if LF_L1_Size[index]~=0 then
    for i=1,WAVE_Ally_Size[index][1] do 
    local roll=random(1,LF_L1_Size[index])
    SobGroup_SpawnNewShipInSobGroup(0, LF_Ally_Fighter_Table[index][roll], "RF_"..index.."_Sqad"..i, "REINFORCEMENT"..index, "vol_JUMP")
    end
  end
--Spawn CORVETTE

  if LF_L2_Size[index]~=0 then
    for i=1,WAVE_Ally_Size[index][2] do 
    local roll=random(1,LF_L2_Size[index])  
    SobGroup_SpawnNewShipInSobGroup(0, LF_Ally_Corvette_Table[index][roll], "RC_"..index.."_Sqad"..i, "REINFORCEMENT"..index, "vol_JUMP")
    end
  end

--Spawn FRIGATE

  if LF_L3_Size[index]~=0 then
    for i=1,WAVE_Ally_Size[index][3] do 
    local roll=random(1,LF_L3_Size[index])
    SobGroup_SpawnNewShipInSobGroup(0, LF_Ally_Frigate_Table[index][roll], "RFF_"..index.."_Sqad"..i, "REINFORCEMENT"..index, "vol_JUMP")
    end
  end

--Spawn Capital

  if LF_L4_Size[index]~=0 then
    for i=1,WAVE_Ally_Size[index][4] do 
    local roll=random(1,LF_L4_Size[index])
    SobGroup_SpawnNewShipInSobGroup(0, LF_Ally_Capital_Table[index][roll], "RCa_"..index.."_Sqad"..i, "REINFORCEMENT"..index, "vol_JUMP")
    end
  end
--Spawn SuperCapital

  if LF_L5_Size[index]~=0 then
    for i=1,WAVE_Ally_Size[index][5] do 
    local roll=random(1,LF_L5_Size[index])
    SobGroup_SpawnNewShipInSobGroup(0, LF_Ally_SuperCap_Table[index][roll], "RSC_"..index.."_Sqad"..i, "REINFORCEMENT"..index, "vol_JUMP")
    end
  end



--    SobGroup_Despawn("REINFORCEMENT"..index)
    --SobGroup_ExitHyperSpace("REINFORCEMENT"..index,"vol_START")
 --   SobGroup_ParadeSobGroup("REINFORCEMENT"..index, "MARK_NCCN", 1)


end
