#Requires AutoHotkey v2.0
#UseHook true
;#SingleInstance Force 配布では使わない方が良いかも
#Include Function.ahk
#Include StartUp.ahk
#Include Common.ahk

; Ctrl + Alt + Enter でアクティブウィンドウをボーダーレス全画面 ⇄ 元に戻す
;FIXME 機能おかしい
^F7::
{
    winID := WinExist("A")
    style := WinGetStyle(winID)

    if (style & 0xC00000) {
        ; タイトルバーと枠を削
        WinSetStyle(style & ~0xC00000, winID)
        ; 画面いっぱいに移動・サイズ変更
        WinMove(0, 0, A_ScreenWidth, A_ScreenHeight, winID)
    } else {
        ; 枠を戻す
        WinSetStyle(style | 0xC00000, winID)
        WinRestore(winID)
    }
}


;非修飾キーのリマップ
sc03A::Tab      ;capslockをtabに
;+sc03A::&      ;shift+capslockを&に shiftのリマップの場所に記述
sc070::WrapReload ;カタカナひらがなローマ字キーをReloadに
Shift::sc073    ;shiftキーを\キーに
^::\            ;^キーと¥キーの入れ替え
\::^
sc027::- ; ;キーを-に
/:::
;!/::/

#SuspendExempt
    RControl::WrapSuspend
#SuspendExempt false

;修飾キーのリマップ
;Altキーを単押しで変換キー、長押しでShiftキーにする
;他のキー+shiftキーのリマップ
Shift:=Map()
*sc038:: {
    SendInput "{Shift Down}"
    SinglePress("LAlt","{sc029}",Shift)
}

*sc038 up::{
    SendInput "{Shift Up}"
}

;無変換キーを単押しでWin、長押しでspaceキーにする
;他の修飾キー+winキーのリマップ
LWin:=Map()
LWin["Ctrl"]:="_"
*sc07B:: {
    SendInput "{LWin Down}"
    SinglePress("sc07B","{sc039}",LWin,true)
}

*sc07B up::{
    SendInput "{Ctrl Down}{Ctrl Up}{LWin Up}" ;winキーはデフォルトで単押しの挙動があるのでctrlキーを押して単押しじゃなくする
}

;spaceを単押しでEsc,長押しでAltキー
;他の修飾キー+Altキーのリマップ
LAlt:=Map()
*sc039::{
    SendInput "{LAlt Down}"
    SinglePress("Space","{sc001}",LAlt)
}

*sc039 up::{
    SendInput "{Ctrl Down}{Ctrl Up}{LAlt Up}" 
}

;変換キーを単押しでEnterキー、長押しでCtrlキー
;他の修飾キー+ctrlキーのリマップ
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

;修飾キー(長押し)と修飾キー(単押し)のリマップ

;shiftキーリマップ

;ctrlキーショートカット
*^f::ModifierdKey("{Backspace}")	;backspace 
*^d::ModifierdKey("{Delete}")		;delete
^h::ModifierdKey("{left}")		;上下左右キー
^j::ModifierdKey("{down}")	 
^k::ModifierdKey("{up}")
^l::ModifierdKey("{right}")
^+h::ModifierdKey("+{left}")
^+j::ModifierdKey("+{down}") 
^+k::ModifierdKey("+{up}")  
^+l::ModifierdKey("+{right}")  
;^u::ModifierdKey("{up 2}")
;^n::ModifierdKey("{down 4}")
^a::ModifierdKey("{Home}")     ;Home
^+a::ModifierdKey("+{Home}")    
^e::ModifierdKey("{End}")		;End
^+e::ModifierdKey("+{End}")
^+g::ModifierdKey("^{End}")    ;最終行に移動
^o::ModifierdKey("{End}+{Enter}") ;下に空行を入れてそこから書き始める
^+o::ModifierdKey("{Home}+{Enter}{up}") ;上に空行を入れて書き始める
;^g::ModifierdKey("^{Backspace}")  ;単語単位で削除
^p::ModifierdKey("{AppsKey}")     ;右クリックメニューの起動
^m::MouseMove A_ScreenWidth/2-100,A_ScreenHeight-200 ;mouse移動
^sc027::ModifierdKey("^a")
^F10::RunAnotherHotkey('keyball39.ahk')

;winキーショートカット
#sc03A::+/ ;Capslockで?
#h::ModifierdKey("^+{tab}")   ;hでctrl+shift+tab
#l::ModifierdKey("^{tab}")    ;でctrl+tab
;vscodeはこのコマンドでタブ移動するらしい
#HotIf WinActive("ahk_exe Code.exe")
    #h::ModifierdKey("^{PgUp}")
    #l::ModifierdKey("^{PgDn}")
#HotIf
#HotIf WinActive("GitHub")
    #h::ModifierdKey("^{PgUp}")
    #l::ModifierdKey("^{PgDn}")
#HotIf
#HotIf !WinActive("ahk_exe WindowsTerminal.exe")
    ^g::^BackSpace
#HotIf WinActive("ahk_exe WindowsTerminal.exe")
    ^s::^l
    ^w::^BackSpace
    ^g::^w
#HotIf
#HotIf WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe brave.exe") ;Chromeがアクティブの時はctrl+sをctrl+lにする
    ^s::ModifierdKey("^l")
#HotIf

#u::ModifierdKey("{LWin}")
#w::WinClose("A")   ;wでウィンドウを閉じる
;画面サイズ変更
#s::WinMaximize "A" ;最大
#a::{
    WinRestore "A"
    WinMove 0,0,A_ScreenWidth/2,windowHeight,"A" ;eで画面左半分表示
}
#e::{
    WinRestore "A" 
    winmove A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,"A" ;rで画面右半分表示
}

;aでwin1を左半分に開く、sで右半分に開く
#c::WrapWinMoveActive(0,0,A_ScreenWidth/2,windowHeight,win1)
#v::WrapWinMoveActive(A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,win1)
;dでwin2を左半分、fで右半分に開く
#d::WrapWinMoveActive(0,0,A_ScreenWidth/2,windowHeight,win2)
#f::WrapWinMoveActive(A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,win2)
;ウィンドウアクティブ
#n::WrapWinActive(win3,ThisHotkey)
#i::WrapWinActive(win4,ThisHotkey)
#o::WrapWinActive(win5,ThisHotkey)

;;でwin1~5以外のウィンドウを切り替える
#sc027::ChangeWin6(ThisHotkey)

;音量操作
;#m::ModifierdKey("{Volume_Mute}")  
;#sc027::ModifierdKey("{Volume_Down}") 
;#sc028::ModifierdKey("{Volume_Up}")	
;スクロール
#j::{
    WinGetClientPos ,,&width,&height,"A"
    MouseMove width*3/5,height*2/5
    ModifierdKey("{WheelDown}")
}
#k::{
    WinGetClientPos ,,&width,&height,"A"
    MouseMove width*3/5,height*2/5
    ModifierdKey("{WheelUp}")
}

;Altキーショートカット
!q::!
!w::"
!e::#
!r::$
!t::%
!y::'
!u::(
!i::)
!o::~
!p::[
!sc027::] ; ;キーを]キーに
!/::/
!z::\
!,::+
!c::+[
!v::+]
!x::+\
!sc03A::& ;CapsLockで&キー
!n::@
!m::*
!b::^
!.::`
!a::1
!s::2
!d::3
!f::4
!g::5
;!変換キー::6
!h::7
!j::8
!k::9
!l::0


;3つ同時押しの場合のエラーハンドリング
;例えば、無変換+Space+qを送ろうとしたらパソコンは無変換+Space+無変換を受け取っていた
TRIPLE_PRESS_ERROR:="このキーは使えません`n多分キーボードの問題です`nメンブレンキーボードを使っている場合は3つ同時押しのキーで使えないキーがある可能性があります`nこのコマンドは我慢してください`n`n※3つ同時押しをしていないのにこのメッセージが出た場合はわかりません。`n報告してもらえると助かります"

^+sc07B::MsgBox(TRIPLE_PRESS_ERROR)

^+sc079::MsgBox(TRIPLE_PRESS_ERROR)

