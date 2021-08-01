dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:leveldata/campaign/fxlf_1/fxlf_1/res/LF_Header.lua")


LF_NormalEventTable={}
LF_NormalEventTable[1]="intelevent_first"

LF_WaveIntroTable={}




TEXT_Wave_Intro={
"$100010",
"$100011",
"$100012",
"$100013",
"$100014",
"$100015",
"$100016",
"$100017"

}
TEXT_Wave_Enemy={
"敌军来袭！",
"敌军来袭！",
"敌军来袭！",
"大量敌军来袭！"

}
TEXT_Wave_Fleet={
"9CCN舰队出现1！",
"9CCN舰队出现2！",
"9CCN舰队出现3！",
"9CCN舰队出现4！"

}


TEXT_Wave_FINAL="$100018"
GAMEOVERINFO="$100019"
WININFO="$100020"


Events.intelevent_first = 
    { 
         {
            { "Universe_EnableSkip(0)", "", },
            {"Sensors_EnableCameraZoom(0)","",},
            { "Sound_SetMuteActor('Fleet')", "", }, 
            { "Sound_EnableAllSpeech( 1 )", "", }, 
            {"Camera_UseCameraPoint('camera_startpoint')", "", },
            HW2_Letterbox(1),
          },
           { HW2_Wait(4), },
            {
            HW2_LocationCardEvent("$100021", 4),
             },
           { HW2_Wait(4), },
           {
               HW2_SubTitleEvent(22, "$100022", 8), 
              {"Camera_FocusSobGroupWithBuffer('SiMuXiao',1000,1000, 2)","",}, 
            },
            { HW2_Wait(6), },
            {
               HW2_SubTitleEvent(22, "$100023", 8), 
            },
            { HW2_Wait(6), },
            {
               HW2_SubTitleEvent(22, "$100024", 9), 
            },
            { HW2_Wait(6), },
            {
              {"objRUcollectID = Objective_Add('$100025', OT_Primary)","",},
              {"Objective_AddDescription(objRUcollectID,'$100026')","",},
              {"Objective_AddDescription(objRUcollectID,'$100027')","",},
              HW2_Letterbox(0),
              {"Sensors_EnableCameraZoom(1)","",},
            },
    }

