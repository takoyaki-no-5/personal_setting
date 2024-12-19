import re
from xkeysnail.transform import *

define_modmap({
	Key.KATAKANAHIRAGANA:Key.CAPSLOCK,
	Key.CAPSLOCK:Key.ESC,
	Key.YEN:Key.EQUAL,
	Key.EQUAL:Key.YEN,
	Key.LEFT_SHIFT:Key.RO,	
})

define_multipurpose_modmap({
    Key.SPACE:[Key.SPACE,Key.LEFT_CTRL],
    Key.MUHENKAN:[Key.MUHENKAN,Key.LEFT_SHIFT],
    Key.HENKAN:[Key.ENTER,Key.RIGHT_META]
})

define_keymap(None, {
	K("C-f"): K("backspace"),          
	K("C-Shift-f"):K("backspace"),
	K("C-d"):K("delete"),
	K("C-l"): Key.RIGHT,       
	K("C-h"): Key.LEFT,         
	K("C-k"): Key.UP,           
	K("C-j"): Key.DOWN,         
	K("C-Shift-l"): K("Shift-right"),
	K("C-Shift-h"): K("Shift-left"),
	K("C-Shift-k"): K("Shift-up"),
	K("C-Shift-j"): K("Shift-down"),
	K("M-b"): with_mark(K("C-left")), 
	K("M-f"): with_mark(K("C-right")),
	K("C-e"): with_mark(K("end")),
   	K("RSuper-semicolon"): K("volumedown"),
    	K("RSuper-apostrophe"): K("volumeup"),
    	K("RSuper-m"): K("mute"),
   	K("RSuper-h"): K("C-Shift-tab"),
   	K("RSuper-l"): K("C-tab"),
}, "Custom Keymap for Ctrl+H and CapsLock swap")

define_keymap(lambda wm_class:wm_class == "Google-chrome",{
	K("C-s"):K("C-l"),
	K("C-p"):K("C-w"),
	K("C-y"):K("Shift-f10"),
},"Chrome only")

define_keymap(lambda wm_class:wm_class == "Xfce4-terminal",{
	K("C-s"):K("C-l"),
},"terminal only")
