#Requires AutoHotkey v2.0
#Include ..\Funk.ahk

#HotIf isScreenShotMode and isMauseMode
f up::{
    global isScreenShotMode,isMauseMode
    isScreenShotMode:=false
    isMauseMode:=false
    MouseClick "Left",,,,,"U"
}
sc039::{
    global isScreenShotMode,isMauseMode
    isScreenShotMode:=false
    isMauseMode:=false
    Send("{Esc}")
}
#HotIf



#HotIf isMauseMode
f::MouseClick "Left",,,,,"D" ;todo SendInput "j"  これ消しても大丈夫か検証
d::MouseClick "Right",,,,,"U"

normalSpeed:=15
h::MoveWhileHeld(-normalSpeed, 0)
j::MoveWhileHeld(0, normalSpeed)
k::MoveWhileHeld(0, -normalSpeed)
l::MoveWhileHeld(normalSpeed, 0)
#HotIf


isMauseMode:=false
ModeMause(){
    global isMauseMode
    if(isMauseMode){
        MsgBox("通常に戻ります",,"T0.8")
    }else{
        MsgBox("マウスモードに入ります",,"T0.8")
    }
    isMauseMode:=!isMauseMode
}

isScreenShotMode:=false
ScreenShotMode(activateCapture){
    global isMauseMode,isScreenShotMode
    isMauseMode:=true
    isScreenShotMode:=true
    activateCapture.Call()
}

MoveWhileHeld(dx, dy) {
    this_hot_key := A_ThisHotkey ;A_THisHotkeyはループの中で変わらないように、変数に保存しておく

    MouseMove dx/3,dy/3,0,"R"
    sleep 70

    Loop 2{
        if(!GetKeyState(this_hot_key, "P")){
            return
        }
        MouseMove dx/3,dy/3,0,"R"
        sleep 40
    }

    Loop 5{
        if(!GetKeyState(this_hot_key, "P")){
            return
        }
        MouseMove dx*2/3, dy*2/3, 0, "R"
        sleep 30
    }

    while GetKeyState(this_hot_key, "P") {
        MouseMove dx, dy, 0, "R"
        Sleep 10
    }
}