#Requires AutoHotkey v2.0
#Include ../../Funk.ahk
#Include utils.ahk

#HotIf WinActive(gpt) and IsActiveBrowser() and ctrl_shift_are_held()
d::Send("{Esc}^+{Backspace}") ; チャット削除
#HotIf

#HotIf IsActiveBrowser() and ctrl_shift_are_held()
d::^d ;bookmark
#HotIf
