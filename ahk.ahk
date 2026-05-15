#Requires AutoHotkey v2.0
#SingleInstance Force
ListLines 0
ProcessSetPriority "High"
; THIS WILL NOT GET YOU BANNED.
; It only modifies how your local keyboard input is processed, 
; and does not interact with any games or other software in a way that would be detectable as a cheat.
; Use with confidence to enhance your gaming experience!
; Undetected wont do shit its just ctrl + number for shiiz ok tyty and f7 for strech switcher and ctrl alt s for wide W I D E and ctrl alt m for mOcK
; PLEASE ADD AN EXPECTION TO YOUR ANTIVIRUS SOFTWARE, WILL GET FLAGGED.

; --- PERFORMANCE ---
A_MaxHotkeysPerInterval := 2000
A_HotkeyInterval := 2000
SendMode "Input" 

; --- GOD MODE STARTUP ---

class State {
    static Mock := false
    static Wide := false
    static AFK := false
    static Counter := 0
}

; ==============================================================================
; STRETCH RES SWITCHER (F7) - 1440x1080 <-> 1920x1080 @ 75Hz
; ==============================================================================

F7:: {
    static isNative := true
    isNative := !isNative
    
    if (isNative) {
        SetDisplayRes(1920, 1080, 75)
        QuickTip("Native (1920x1080 @ 75Hz)")
    } else {
        SetDisplayRes(1440, 1080, 75) ; Switch this to what you want
        QuickTip("STRETCHED (1440x1080 @ 75Hz)")
    }
}

SetDisplayRes(w, h, f) {
    ; 156 bytes is correct for the ANSI DEVMODE structure
    devMode := Buffer(156, 0)
    
    ; Offsets
    NumPut("UShort", 156, devMode, 36)      ; dmSize
    NumPut("UInt", 0x5C0000, devMode, 40)   ; dmFields
    NumPut("UInt", 32, devMode, 104)        ; dmBitsPerPel
    NumPut("UInt", w, devMode, 108)         ; dmPelsWidth
    NumPut("UInt", h, devMode, 112)         ; dmPelsHeight
    NumPut("UInt", f, devMode, 120)         ; dmDisplayFrequency
    
    ; We use the 'A' (ANSI) API without the DeviceName string
    result := DllCall("user32\ChangeDisplaySettingsA", "Ptr", devMode, "UInt", 0)
    
    ; THE FIX: PostMessage doesn't wait for lagging apps to reply. It just drops the broadcast and keeps moving.
    DllCall("user32\PostMessage", "Ptr", 0xFFFF, "UInt", 0x007E, "Ptr", 0, "Ptr", 0) ; wont get you banned
    
    return result
}

QuickTip(text) {
    try ToolTip(text)
    SetTimer () => ToolTip(), -2000
}

; ==============================================================================
; UTILS & MEMES
; ==============================================================================
!WheelUp::Send "{Volume_Up}"
!WheelDown::Send "{Volume_Down}"

^1::Send("💀")
^2::Send("🥀")
^3::Send("💔")
^4::Send("🔥")
^5::Send("😭")
^6::Send("🙏")
:*:67::67 IS POOP
:*:69::69 (nice)
^!e::Run("notepad.exe")
^!r::Reload()

; ==============================================================================
; MOCK & WIDE TYPING HANDLER
; ==============================================================================

UpdateTypingMode() {
    enable := State.Mock || State.Wide
    static isHooked := false
    
    if (enable == isHooked)
        return
        
    ; Dynamically hook or unhook a-z
    Loop 26 {
        char := Chr(A_Index + 96) 
        Hotkey("$*" char, HandleLetter, enable ? "On" : "Off")
    }

    ; Hook Backspace to handle the double delete in Wide Mode
    Hotkey("$*Backspace", HandleBackspace, enable ? "On" : "Off")

    isHooked := enable
}

HandleLetter(thisHotkey) {
    char := SubStr(thisHotkey, 3) ; Strip the $*
    
    ; Pass through modifiers so you aren't playing like a bot
    if GetKeyState("Control", "P") || GetKeyState("Alt", "P") {
        Send("{Blind}" char)
        return
    }

    ; Figure out native case using Shift/Caps
    isUpper := GetKeyState("Shift", "P") ^ GetKeyState("CapsLock", "T")
    if (isUpper) {
        char := StrUpper(char)
    }
    
    ; Apply Mock Mode
    if State.Mock {
        State.Counter++
        char := (Mod(State.Counter, 2) = 0) ? StrUpper(char) : StrLower(char)
    }
    
    out := char
    
    ; Apply Wide Mode
    if State.Wide {
        out .= " "
    }
        
    ; Fire it off safely
    Send("{Blind}{Text}" out)
}

HandleBackspace(thisHotkey) {
    if State.Wide {
        ; Deletes the character AND the extra space added by wide mode
        Send("{Blind}{Backspace 2}")
    } else {
        Send("{Blind}{Backspace}")
    }
}

^!m:: {
    State.Mock := !State.Mock
    UpdateTypingMode()
}

^!s:: {
    State.Wide := !State.Wide
    UpdateTypingMode()
}