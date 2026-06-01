#Requires AutoHotkey v2.0

isDisplayMode:=false
ModeDisplay(){
    global isDisplayMode
    if(isDisplayMode){
        MsgBox("通常モードに戻ります。",,"T1")
    }else{
        MsgBox("画面モードに移行します。",,"T1")
    }
    isDisplayMode:=!isDisplayMode
}

#HotIf isDisplayMode
; 左クリックのホットキー
LButton::
{
    static timeout := 300
    pressedAt := A_TickCount
    KeyWait("LButton")
    if (A_TickCount - pressedAt > timeout) {
        Send "{Click}"
        return
    }
    Send "^{WheelUp}"
}

RButton::
{
    Send "^{WheelDown}"
}
#HotIf 