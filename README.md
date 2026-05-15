# 🎮 GOD MODE - AutoHotkey Utility Script

A blazing-fast AutoHotkey v2.0 script packed with gaming and productivity enhancements. Customize your keyboard, display modes, and typing styles with ease.

---

## ✨ Features

### 🎯 Stretch Resolution Switcher
**Hotkey:** `F7`

Toggle between native and stretched resolutions on the fly:
- **Native:** 1920×1080 @ 75Hz
- **Stretched:** 1440×1080 @ 75Hz *(customize as needed)*

Perfect for competitive gaming or content creation. Displays quick tooltips to confirm your current mode.

---

### 🔊 Volume Control
- **Alt + Mouse Wheel Up:** Volume up
- **Alt + Mouse Wheel Down:** Volume down

Quick audio adjustment without leaving your game.

---

### 😂 Emoji Shortcuts
Instant emoji insertion:
- `Ctrl+1` → 💀
- `Ctrl+2` → 🥀
- `Ctrl+3` → 💔
- `Ctrl+4` → 🔥
- `Ctrl+5` → 😭
- `Ctrl+6` → 🙏

---

### 🔤 Text Expansions
- `:*:67` → `67 IS POOP`
- `:*:69` → `69 (nice)`

Auto-expand text as you type.

---

### 💬 Typing Modes

#### Mock Mode
**Hotkey:** `Ctrl+Alt+M`

Alternate between UPPERCASE and lowercase with each keystroke. Perfect for mockingly typing in chat.

#### Wide Mode
**Hotkey:** `Ctrl+Alt+S`

Add a space after every letter. T y p e l i k e t h i s. Great for emphasis or ironic typing.

**Smart Features:**
- Works seamlessly with Shift and Caps Lock
- Respects Ctrl and Alt modifiers (passes through normally)
- Backspace correctly deletes character + space in Wide Mode

---

### ⚙️ Utilities
- `Ctrl+Alt+E` → Open Notepad
- `Ctrl+Alt+R` → Reload the script

---

## 🚀 Performance
- High process priority for minimal lag
- Optimized hotkey intervals (2000 per interval)
- Input mode for reliability

---

## 📋 Requirements
- **AutoHotkey v2.0** or later
- Windows OS
- Administrator privileges (recommended for display settings)

---

## ⚠️ Important Notes
✅ **Safe to use** - Only modifies local keyboard input, undetectable by anti-cheat  
⚠️ **Add to antivirus exceptions** - May trigger security software initially  
🎮 **Gaming-friendly** - No interaction with game memory or processes

---

## 🛠️ Customization

### Change Stretched Resolution
Edit the `F7` hotkey function:
```autohotkey
SetDisplayRes(1440, 1080, 75) ; Change these values
```

### Modify Emoji Shortcuts
Add new shortcuts in the UTILS section:
```autohotkey
^7::Send("🎯")  ; Add your own
```

### Add New Typing Modes
Extend the `UpdateTypingMode()` function to hook additional keys or create new transformation logic.

---

## 📝 License
Use freely and responsibly.

**Happy scripting! 🚀**
