#Requires AutoHotkey v2.0
#Include ../common/Function.ahk

sc03A::Tab          ;capslockをtabに
sc070::WrapReload   ;カタカナひらがなローマ字キーをReloadに
Shift::sc073        ;shiftキーを\キーに
^::\                ;^キーと¥キーの入れ替え
\::^
sc027::-            ; ;キーを-に
/:::

#SuspendExempt
RControl::WrapSuspend
#SuspendExempt false

;FIXME 修飾キー同士のリマップはこのファイルに書くべきではないかも
;TODO もっと美しい処理にしたい 
;Alt単押し::IME
;Alt長押し::Shift
;他の修飾キー+Shiftキーのリマップ
Shift:=Map()

*sc038:: {
    SendInput "{Shift Down}"
    SinglePress("LAlt","{sc029}",Shift)
}

*sc038 up::{
    SendInput "{Shift Up}"
}

;無変換 単押し::Win
;無変換 長押し::Space
;他の修飾キー+winキーのリマップ
LWin:=Map()
LWin["Ctrl"]:="_"
*sc07B:: {
    SendInput "{LWin Down}"
    SinglePress("sc07B","{sc039}",LWin,true)
}

;Space単押し::Esc
;Space長押し::Alt
;他の修飾キー+Altキーのリマップ
LAlt:=Map()
*sc039::{
    SendInput "{LAlt Down}"
    SinglePress("Space","{sc001}",LAlt)
}

*sc039 up::{
    SendInput "{Ctrl Down}{Ctrl Up}{LAlt Up}" 
}

;変換 単押し::Enter
;変換 長押し::Ctrl
;他の修飾キー+Ctrlキーのリマップ
Ctrl:=Map()
Ctrl["LWin"]:=";"
Ctrl["LAlt"]:="6"
*sc079::{
    SendInput "{Ctrl Down}"
    SinglePress("sc079","{Enter}",Ctrl,true)
}

*sc079 up::{
    SendInput "{Ctrl Up}"
}