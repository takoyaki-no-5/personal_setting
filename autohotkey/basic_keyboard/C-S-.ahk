#Requires AutoHotkey v2.0
#Include Funk.ahk
#Include modes\Mause.ahk

#HotIf ctrl_shift_are_held()
;1段目
;q
;w
e::+End
;r
;t
;y
;u
i::^+i ;ブラウザなどの検証
o::Send("{Home}+{Enter}{up}") ;上に空行を入れて書き始める

;2段目
;capslock
a::+Home
s::^+s ;appごとのkey 
d::^+d ;appごとのkey
f::^+f ;appごとのkey
g::^End    ;最終行に移動
h::+left
j::+down
k::+up
l::+right
sc027::F2 ; ;::アクティブファイルの名前変更など

;3段目
z::PrintScreen ;アクティブウィンドウをスクショ
;c
v::^+v
x:: ScreenShotMode(() => Send("^{PrintScreen}")) ;領域を指定してスクショ
;b
n::^+n ;フォルダ作成 or app
;m
;,
;.
;/

F1::WrapWinMoveActive(0,0,A_ScreenWidth/2,windowHeight,win1) ;win1を左半分に
F2::WrapWinMoveActive(0,0,A_ScreenWidth/2,windowHeight,win2) ;win2を左半分に
F7::ActiveWinMoveLeft()
#HotIf