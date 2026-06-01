#Requires AutoHotkey v2.0
#Include ../IMEv2.ahk

WIN_ERROR_TXT1 := "ウィンドウ:"
WIN_ERROR_TXT2 := "が見つかりません`n`n文字列があってるか確認して下さい。`nenv.txtを変更したらその後起動しなおしてください。`n文字コードはutf-8でお願いします。`n`n`n※※※※※※※※※※※※※※`nこのエラーメッセージは`n`nウィンドウ:XXXが見つかりません`n`nの形式で送ってるので、`n`nウィンドウ:XXX`nが見つかりません`n`nとかだったら変な改行が入っちゃってるかも。`n※※※※※※※※※※※※※※"
UNEXPECTED_ERROR := "未知のバグです。報告をお願いします。"

;TODO wrapしてない コメント増やす
WrapWinMoveActive(x, y, width, height, winarr) {
    try {
        WinMove x, y, width, height, winarr[1]
        WinActivate winarr[1]
    } catch TargetError as Terr {
        Run(winarr[2], A_ScriptDir . "\..\applications_shortcut")
        ;MsgBox(WIN_ERROR_TXT1 . Terr.Extra . WIN_ERROR_TXT2)
    } catch as err {
        MsgBox(UNEXPECTED_ERROR)
    }
}

;TODO wrapしてない コメント増やす
WrapWinActive(winarr, ThisHotkey) {
    try {
        if (!WinExist(winarr[1])) {
            Run(winarr[2], A_ScriptDir . "\..\applications_shortcut")
            Sleep 1000
            ;MsgBox(WIN_ERROR_TXT1 . Terr.Extra . WIN_ERROR_TXT2)
        }
        GroupAdd winarr[3], winarr[1]
        if (A_PriorHotkey != ThisHotkey) {
            GroupActivate winarr[3], "R"

        } else {
            GroupActivate winarr[3]
        }
    } catch as err {
        MsgBox(UNEXPECTED_ERROR)
    }
}

ChatGPTActive(winarr,ThisHotkey){
    WrapWinActive(winarr,ThisHotkey)
    Sleep 10
    if(WinActive("ChatGPT")){
        Send("+{ESC}")
    }
}

priorWindow := ""
ChangeWin6(ThisHotkey) {
    global priorWindow
    try {
        if (A_PriorHotkey != ThisHotkey) {
            GroupDeactivate "MainWindows", "R"
        } else {
            GroupDeactivate "MainWindows"
        }

        tempWindow := WinGetTitle("A")
        if (A_PriorHotkey == ThisHotkey and tempWindow != priorWindow) {
            WinMoveBottom(priorWindow)
        }
        priorWindow := tempWindow
    } catch as err {
        ;MsgBox("このコマンドはまだ動作が不安定です。いつか良い感じにします。`n`n" . err.Message)
    }
}

isSuspend := false
WrapSuspend() {
    global isSuspend
    Suspend
    if (isSuspend) {
        MsgBox("AutoHotKeyを再開しました",,"T0.8")
    }
    else {
        MsgBox("AutoHotKeyを一時停止しました`n再開するには右側のctrlキーを押してください",,"T1")
    }
    isSuspend := !isSuspend
}

WrapReload() {
    MsgBox("AutoHotKeyをReloadします",,"T0.8")
    Sleep 1 ;これがないとメッセージが消えちゃう
    Reload
}

RunAnotherHotkey(filepath) {
    ;fixme 相対パスにできないの
    ;Run '*RunAs "C:\Users\kamag\Documents\programing\Autohotkey\amiti\' filename '"'
    RunAs "%A_ScriptDir%\" filepath
    MsgBox(filepath . "を起動します",,"T1")
    Sleep 1
    ExitApp
}

Scroll(down := false) {
    WinGetClientPos , , &width, &height, "A"
    MouseMove width * 3 / 5, height * 2 / 5
    if (down) {
        Send("{WheelDown}")
    } else {
        Send("{WheelUp}")
    }
}

ActiveWinMoveLeft()
{
    WinRestore "A"
    WinMove 0, 0, A_ScreenWidth / 2, windowHeight, "A"
}

ActiveWinMoveRight()
{
    WinRestore "A"
    winmove A_ScreenWidth / 2, 0, A_ScreenWidth / 2, windowHeight, "A"
}

WrapEscape(is_double_press := false) {
    if (IME_GET() == 1) {
        Send("{sc029}")
    }
    Send(is_double_press ? "{Backspace}{Escape}" : "{Escape}")
}

WrapQuestionMark() {
    Send("+/")
    if (IME_GET() == 1) {
        Send("{sc039}")
    }
}

; if文を全て突破しているのは間違いない
; timeoutは色々検証したけどよくわかんなかった
;todo keywaitの前後に修飾キーのprior変数を作っか監視する方法は?
ProcessModifierKeys(
    this_key,
    OnTap,
    modifier_and_modifier_remap,
    modifier_key_is_unrecognized_when_tapped := false
) {
    this_hot_key := A_ThisHotkey

    static timeout := 300
    pressedAt := A_TickCount
    KeyWait this_key 
    if (A_TickCount - pressedAt > timeout) {
        return
    }

    ;単押しだった場合の挙動
    is_single_press := (!modifier_key_is_unrecognized_when_tapped && A_PriorKey == this_key) || (modifier_key_is_unrecognized_when_tapped && A_PriorKey == '')
    
    if (is_single_press && this_hot_key == A_ThisHotkey)
    {
        ;todo 流石にひどい
        ;他の修飾キーが押されている状態だったら
        if (GetKeyState("sc038", "P") && modifier_and_modifier_remap.Has("Shift")) {
            Send modifier_and_modifier_remap["Shift"]
        } else if (GetKeyState("sc079", "P") && modifier_and_modifier_remap.Has("Ctrl")) {
            Send modifier_and_modifier_remap["Ctrl"]
        } else if (GetKeyState("sc07B", "P") && modifier_and_modifier_remap.Has("LWin")) {
            Send modifier_and_modifier_remap["LWin"]
        } else if (GetKeyState("sc039", "P") && modifier_and_modifier_remap.Has("LAlt")) {
            Send modifier_and_modifier_remap["LAlt"]
        } else {
            OnTap.Call()
        }
    }
}