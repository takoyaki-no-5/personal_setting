#Requires AutoHotkey v2.0
#Include ../../Funk.ahk
#Include utils.ahk

#HotIf ctrl_shift_are_held() and WinActive(vscode)
p::^@
#HotIf