#Requires AutoHotkey v2.0

gpt:="ChatGPT"

SwitchLanguage(){
    Send("^r") 
    sleep 10
    Send("{right}")
    sleep 800
    Send("{Esc}")
    Sleep 10
}

IsActiveBrowser() {
    return WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe brave.exe")
}