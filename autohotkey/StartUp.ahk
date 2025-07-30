#Requires AutoHotkey v2.0

if(not A_IsAdmin){
    Run '*RunAs "' A_ScriptFullPath '" /restart'
    Sleep 1
    ExitApp
}

;環境変数(ショートカットで操作するウィンドウの名前)を読み込む
FilePath := A_ScriptDir . "\env.txt"

run1 := "Obsidian"
run2 := "ChatGPT"
run3 := "Brave"
run4 := "Visual Studio Code"
run5 := "terminal"

group1 := "Obsidian"
group2 := "ChatGPT"
group3 := "Brave"
group4 := "VisualStudioCode"
group5 := "terminal"

if FileExist(FilePath)
{
    FileContent := FileRead("env.txt","UTF-8")
    
	splitContent := StrSplit(FileContent,"`r`n")

	win1 := [Trim(splitContent[1]),run1,group1]
	win2 := [Trim(splitContent[2]),run2,group2]
	win3 := [Trim(splitContent[3]),run3,group3]
	win4 := [Trim(splitContent[4]),run4,group4]
	win5 := [Trim(splitContent[5]),run5,group5]
}
else
{
    win1:="Notion"
    win2:="ChatGPT"
    win3:="Google Chrome"
    win4:="Visual Studio Code"
    win5:="エクスプローラー"
    MsgBox("env.txtが見つかりません。`nexeファイルとenv.txtは同じ階層にある必要があります。`nwin1~5はデフォルトの設定になります")
}

GroupAdd "MainWindows",win1[1]
GroupAdd "MainWindows",win2[1]
GroupAdd "MainWindows",win3[1]
GroupAdd "MainWindows",win4[1]
GroupAdd "MainWindows",win5[1]

;タスクバーの高さを取得
WinGetPos ,,,&taskbarHeight,"ahk_class Shell_TrayWnd"
windowHeight := A_ScreenHeight-taskbarHeight
