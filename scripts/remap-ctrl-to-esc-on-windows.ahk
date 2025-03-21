#SingleInstance Force

; 1. download and install AutoHotkey from their official website
; https://www.autohotkey.com
; 2. create a new script file and put it in your intend location
; 3. save the file and compile it to .exe
; 4. to make it start automatically with Windows 
; - press Win+R
; - Type "shell:startup" and press Enter
; - create a shortcut to your script in this folder
; below is 200ms, can set to something else

; Variables to track state
g_LastCtrlDownTime := 0
g_CtrlHeld := false

; When Ctrl is pressed
~LCtrl::
    g_LastCtrlDownTime := A_TickCount
    g_CtrlHeld := false
    return

; When Ctrl is released
~LCtrl Up::
    if (A_TickCount - g_LastCtrlDownTime < 200) and (!g_CtrlHeld)
    {
        ; Ctrl was tapped quickly, send Escape
        Send, {Escape}
    }
    return

; Monitor any key press while Ctrl is down
~*::
    if (GetKeyState("LCtrl", "P"))
    {
        g_CtrlHeld := true
    }
    return
