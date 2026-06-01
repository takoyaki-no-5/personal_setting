#Requires AutoHotkey v2.0
#UseHook true
;#SingleInstance Force 配布では使わない方が良いかも
#Include StartUp.ahk
#Include Function.ahk

#Include modes\__init__.ahk

#Include applications\__double__.ahk
#Include C-S-.ahk

#Include applications\__single__.ahk
#Include Ctrl-.ahk
#Include Shift-.ahk
#Include Alt-.ahk
#Include Win-.ahk

;note なぜかcapslockはup→downの順でイベントが発生するため、upで定義している
sc03A Up::return
sc03A::Tab ;capslock::tab
sc070::WrapReload   ;カタカナひらがなローマ字::ScriptのReload
sc027::-            ; ;キーを-に
/:::
RShift::ModeDisplay

;F1
;F2
;F3
;F4 
;F5
F6::ModeMause()
F7::ModeSushida()
F8::WrapReload()
    #SuspendExempt
F9::WrapSuspend 
    #SuspendExempt false
F10::DllCall("LockWorkStation")
F11::RunAnotherHotkey('..\keyball39\KeyBall39.ahk') ;fixme commonにおけるように汎用化させる
;F12

RAlt:: WrapSuspend
#SuspendExempt false

Ctrl := Map()
Ctrl["LWin"] := ";"
Ctrl["Shift"]:="+{Enter}"
*sc079:: ProcessModifierKeys(
    this_key := "sc079",
    onTap := () => Send("{Enter}"),
    Ctrl,
    true
)

Shift := Map()
Shift["LAlt"] := "6"
*sc038:: ProcessModifierKeys(
    this_key := "LAlt",
    OnTap := () => Send("{sc029}"),
    Shift
)

LAlt:=Map()
*sc039::ProcessModifierKeys(
    this_key:="Space",
    onTap:=WrapEscape,
    LAlt
) 

LWin:=Map()
LWin["Ctrl"]:="_"

*sc07B::ProcessModifierKeys(
    this_key:="sc07B",
    OnTap:=()=> Send("{sc039}"),
    LWin,
    true
)
