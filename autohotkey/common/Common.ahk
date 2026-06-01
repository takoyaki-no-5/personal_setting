#Requires AutoHotkey v2.0
#Include Function.ahk
#Include ../IMEv2.ahk

;todo sushimodeでも反応するようにくんだから、要観察
#HotIf WinActive("ahk_exe Obsidian.exe")
;s→ d|f|g でそれぞれ### #### ##### 
$s::{
    SendInput('s')
    sInput:=InputHook("L1 T0.4","dfg")
    sInput.OnEnd:=sInputCallback 
    sInputCallback(sInput){
        if(sInput.EndReason=="EndKey"){
            SendInput('{Backspace}')
            if(sInput.EndKey=='d'){
                SendInput('{# 3}')
            }
            else if(sInput.EndKey=='f'){
                SendInput('{# 4}')
            }
            else{
                SendInput('{# 5}')
            }
            if(IME_GET()==1){
                SendInput('{Enter}')
            }
            SendInput('{Space}')
        }else{
            SendInput(sInput.Input)
        }
    }

    Suspend ;これがないとgをおしたときにgのホットキーに触れてしまう
    ;しかしサスペンドしているせいでsを押したあとにほかのホットキーが使えない
    Sleep 1 ;Suspendの処理の負担がわからないから一応
    sInput.Start()
    sInput.Wait()
    Suspend
}

#HotIf
    
;g2回で最初の行に移動
g::{
    SendInput("g")
    if(A_PriorHotkey ==  ThisHotkey and A_Priorkey == "g" and A_TimeSincePriorHotkey > 60 and A_TimeSincePriorHotkey < 400){
        SendInput("{BackSpace 2}^{Home}")
    }
}

/*
;ff::vimのノーマルモード (IMEをOFFにしてESC)
f::{
    if(A_PriorHotkey ==  ThisHotkey and A_Priorkey == "f" and A_TimeSincePriorHotkey > 60 and A_TimeSincePriorHotkey < 400){
        WrapEscape(is_double_press:=true)
    }
    else{
        SendInput("f")
    }
}
*/

;ESC::vimのノーマルモード (IMEをOFFにしてESC)

;#HotIf WinActive("ahk_exe Obsidian.exe") or WinActive("ahk_exe Code.exe")
;    Esc::{
;        if(IME_GET()==1){
;            IME_SET(0)
;        }
;        SendInput("{Escape}")
;    }
;#HotIf  