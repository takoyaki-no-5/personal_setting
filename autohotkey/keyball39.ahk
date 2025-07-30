#Requires AutoHotkey v2.0

#UseHook true
#SingleInstance Force
#Include StartUp.ahk
#Include Function.ahk
#Include Common.ahk

^+q::^5 ;何の目的で作ったのかわかんない
^+BackSpace::^End ;C-S-gでC-end

^o::{
    SendInput "{End}+{Enter}"
}
^+o::{
    SendInput "{Home}+{Enter}{up}"
}

;vscodeはこのコマンドでタブ移動するらしい
#HotIf WinActive("ahk_exe Code.exe")
    ^o::{
        SendInput "{End}{Enter}"
    }
    ^+o::{
        SendInput "{Home}{Enter}{up}"
    }    
    ^+tab::^PgUp
    ^tab::^PgDn
#HotIf
#HotIf WinActive("GitHub")
    ^+tab::^PgUp
    ^tab::^PgDn
#HotIf
#HotIf WinActive("ChatGPT")
    ^n::^+o
#HotIf 
#HotIf WinActive("ahk_exe EXCEL.EXE")
    +Enter::!Enter
#HotIf
#HotIf WinActive("ahk_exe WindowsTerminal.exe")
    ^s::^l
    ^w::^BackSpace
    ^BackSpace::^w
#HotIf
#HotIf WinActive("ahk_exe Obsidian.exe")
    ;+h::^!Left
    ;+l::^!Right
#HotIf
#HotIf  WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe brave.exe") ;Chromeがアクティブの時はctrl+sをctrl+lにする
    ^s::ModifierdKey("^l")
#HotIf

!w::WinClose("A")   ;wでウィンドウを閉じる
;画面サイズ変更
^F8::WinMaximize "A" ;最大
^+F7::{
    WinRestore "A"
    WinMove 0,0,A_ScreenWidth/2,windowHeight,"A" ;eで画面左半分表示
}
^F7::{
    WinRestore "A" 
    winmove A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,"A" ;rで画面右半分表示
}

;aでwin1を左半分に開く、sで右半分に開く
^+F1::WrapWinMoveActive(0,0,A_ScreenWidth/2,windowHeight,win1)
^F1::WrapWinMoveActive(A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,win1)
;dでwin2を左半分、fで右半分に開く
^+F2::WrapWinMoveActive(0,0,A_ScreenWidth/2,windowHeight,win2)
^F2::WrapWinMoveActive(A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,win2)
;ウィンドウアクティブ
^F3::WrapWinActive(win3,ThisHotkey)
^F4::WrapWinActive(win4,ThisHotkey)
^F5::WrapWinActive(win5,ThisHotkey)

;pでwin1~5以外のウィンドウを切り替える
^F6::ChangeWin6(ThisHotkey)
^F10::RunAnotherHotkey('amiti.ahk')

^+s::#+s
isJantamaMode:=false
^F11::{
    global isJantamaMode
    isJantamaMode:=!isJantamaMode
    if(isJantamaMode){
        MsgBox("片手マウスモードに入ります")
    }else{
        MsgBox("通常に戻ります")
    }
}

#HotIf isJantamaMode
j::{
    MouseClick "left",,,,,"D"
    SendInput "j"
}
j up::MouseClick "left",,,,,"U"
#HotIf
