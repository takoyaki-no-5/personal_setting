#Requires AutoHotkey v2.0

#Include Funk.ahk

#HotIf win_is_held()
;1段目
;q
w::WinClose("A") 
e::ActiveWinMoveRight()
;r     
;t
;y
u::Send("{LWin}") ;#u::スタートメニュー
i::WrapWinActive(win4,ThisHotkey)
o::WrapWinActive(win5,ThisHotkey)
;p

;2段目
sc03A::WrapQuestionMark()        ;capslock::?
a::ActiveWinMoveLeft()
s::WinMaximize "A" 
d::ChatGPTActive(win2,ThisHotkey)
f::WrapWinActive(win1,ThisHotkey)
;g
h::^+tab   
j::Scroll(down:=true)
k::Scroll()
l::^tab 
sc027::ChangeWin6(ThisHotkey) ; ;::win1~5以外のウィンドウを切り替える

;3段目
;z
;x  
;c
;v
;b
n::WrapWinActive(win3,ThisHotkey)
;m

;音量操作
;#m::ModifierdKey("{Volume_Mute}")  
;#sc027::ModifierdKey("{Volume_Down}") 
;#sc028::ModifierdKey("{Volume_Up}")	
#HotIf
