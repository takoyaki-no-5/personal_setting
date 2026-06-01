#Requires AutoHotkey v2.0
#Include ../../Funk.ahk
#Include utils.ahk

#HotIf WinActive(gpt) and IsActiveBrowser() and ctrl_is_held() 
x::^k  ; チャット検索
n::^+o ; 新規チャット
b::^+s ; サイドバー開閉
#HotIf 

#HotIf IsActiveBrowser() and ctrl_is_held()
s::^l ;検索ゾーンにフォーカス
p::^j ;ダウンロード
sc03A::Send("{Tab 2}") ;^capsloc::タブ2回
r::SwitchLanguage() ;brave翻訳
#HotIf

