#Requires AutoHotkey v2.0

ctrl_is_held() => GetKeyState('sc079', 'P')
shift_is_held() => GetKeyState('sc038', 'P')
alt_is_held() => GetKeyState('sc039', 'P')
win_is_held() => GetKeyState('sc07B','P')

ctrl_shift_are_held() => ctrl_is_held() and shift_is_held()