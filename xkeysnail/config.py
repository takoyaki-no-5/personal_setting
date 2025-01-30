import re
from xkeysnail.transform import *

define_modmap({
})

define_multipurpose_modmap({
})

define_keymap(None, {
    K("C-Shift-backspace"): [ K("C-end") ],
    K("C-o"): [ K("end"),K("Shift-Enter") ],
	K("C-Shift-o"): [ K("home"),K("Shift-Enter"),Key.UP ],
	K("RSuper-semicolon"): K("volumedown"),
	K("RSuper-apostrophe"): K("volumeup"),
	K("RSuper-m"): K("mute"),
}, "Custom Keymap")

define_keymap(lambda wm_class:wm_class == "Google-chrome",{
	K("C-s"):K("C-l"),
},"Chrome only")

define_keymap(lambda wm_class:wm_class == "Code",{
    K("LM-h"):K("C-PAGE_UP"),
    K("LM-l"):K("C-PAGE_DOWN"),
},"Code Only")

define_keymap(lambda wm_class:wm_class != "Code",{
    K("LM-h"): K("C-Shift-tab"),
    K("LM-l"): K("C-tab"),
},"except code")

define_keymap(lambda wm_class:wm_class == "Xfce4-terminal",{
	K("C-s"):K("C-l"),
    K("C-backspace"):K("C-w"), # デフォルトの単語削除の設定を利用する
    K("C-w"):K("C-backspace"), # C-backspaceでタブ削除されるように設定する
},"terminal only")

define_keymap(lambda wm_class:wm_class != "Xfce4-terminal",{
},"excpt terminal")
