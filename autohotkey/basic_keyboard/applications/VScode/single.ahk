#Requires AutoHotkey v2.0
#Include ../../Funk.ahk
#Include utils.ahk

#HotIf win_is_held() and WinActive(vscode)
;タブ移動
h::Send("^{PgUp}")
l::Send("^{PgDn}")
#HotIf

#HotIf ctrl_is_held() and WinActive(vscode)
p::^+p ;コマンドパレット
s::^F5 ;実行
x::^p  ;ファイルに移動
/::^/  ;複数行コメントアウト
#HotIf

