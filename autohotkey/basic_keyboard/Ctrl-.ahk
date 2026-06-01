#Requires AutoHotkey v2.0
#Include Funk.ahk

#HotIf ctrl_is_held()

;1段目
;q::
w::^w  
e::End
r::^r ;app     
t::^t
y::^y
u::^u ;ファイル移動 or app
i::^i ;app 
o::Send("{End}+{Enter}") ;下に空行を入れてそこから書き始める
p::^p ;コマンドパレット or app

;2段目
a::Home
s::^s ;app  
d::Delete
f::Backspace
g::^BackSpace
h::left
j::down
k::up
l::right
sc027::^a          ; ;::Ctrl-a
         
;3段目
z::^z ;undo 
x::^x ;cut 
c::^c ;copy
v::^v ;paste
b::^b ;サイドバー開閉 or app
n::^n ;new page
m::MouseMove A_ScreenWidth/2-100,A_ScreenHeight-200 ;マウスを特定の位置に移動(どかす用)

F1::WrapWinMoveActive(A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,win1) ;win1を右半分に
F2::WrapWinMoveActive(A_ScreenWidth/2,0,A_ScreenWidth/2,windowHeight,win2) ;win2を右半分に
F3::WrapWinActive(win3,ThisHotkey)
F4::WrapWinActive(win4,ThisHotkey)
F5::WrapWinActive(win5,ThisHotkey)
F6::ChangeWin6(ThisHotkey) ;win1~5以外のウィンドウを切り替える
F7::ActiveWinMoveRight()
F8::WinMaximize "A" 
;F9
;F10
;F11
;F12

#HotIf
