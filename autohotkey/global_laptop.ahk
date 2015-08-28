; Command List: http://www.autohotkey.com/docs/commands.htm
; Key List:     http://www.autohotkey.com/docs/KeyList.htm

#SingleInstance force
#NoEnv  ; Performance & future compatibility.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Initialization                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;if FileExist("config.ini") = ""
;{
;    str = 
;    (
;`; Config file for global autohotkey scripts
;[bookmarks]
;    )
;    FileAppend, %str%, config.ini
;}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Variables / Toggles                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, Tray, tip, [Ben-Notebook]`nGlobal AHK script
;SetNumLockState AlwaysOn
SendMode Input ; Superior speed & reliability
SetWorkingDir %A_ScriptDir% ; Consistent starting directory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Bindings                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Launch_Mail:: Run, C:\Program Files\Winamp\winamp.exe
;Browser_Search:: Run, C:\Users\User\Documents\My Dropbox
;Media_Prev:: TrayTip, Previous Disabled, -,, 1
;Media_Play_Pause:: TrayTip, Play/Pause Disabled, -,, 1
;Media_Stop:: TrayTip, Stop Disabled, -,, 1
;Media_Next:: TrayTip, Next Disabled, -,, 1

; Bind pageup/pagedown to ctrl+up/down
RCtrl & Down::Send, {PgDn}
RCtrl & Up::Send, {PgUp}

; Opens your todo list in GVim, double tap right ctrl
~RCtrl:: 
if (A_PriorHotKey = "~RCtrl" AND A_TimeSincePriorHotkey < 250) 
    ;Run, "D:\Applications\Sublime Text 3\sublime_text.exe" "D:\Dropbox\todo.txt"
	Run, "D:\Applications\Vim\vim74\gvim.exe" "D:\Dropbox\todo.txt"
KeyWait RCtrl
return

; Opens school todo list, double tap menu key (left of rctrl)
AppsKey:: 
if (A_PriorHotKey = "AppsKey" AND A_TimeSincePriorHotkey < 250) 
    ;Run, "D:\Applications\Sublime Text 3\sublime_text.exe" "D:\Dropbox\todo.txt"
	Run, "D:\Applications\Vim\vim74\gvim.exe" "D:\Dropbox\school.txt"
KeyWait AppsKey
return

; Hibernate upon double LAlt+F1
LAlt & F1::
if (A_PriorHotKey = "LAlt & F1" AND A_TimeSincePriorHotkey < 250) 
    DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
KeyWait F1
return

; Date/time hotstrings
:c0:]datetime::
GetDateTime()
return
:c0:]date::
GetDateTime(1)
return
:c0:]time:: 
GetDateTime(2)
return

; NOTE: Needs Lib/Explorer.ahk to function. Also needs autohotkey with unicode support
; Hotkey for Windows Explorer
; win+c opens cmd prompt at current location, win+v edits currently selected file
#IfWinActive ahk_class CabinetWClass
#c::CmdPromptDir()
#v::EditWithSublime()
Tab:: SendInput, !d
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Functions                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#include D:\Applications\AutoHotkey\Lib\Explorer.ahk

CmdPromptDir() {
    WinGetText, text, A
    RegExMatch(text, "Address: .*", full_path)
    full_path := RegExReplace(full_path, "^Address: ", "")
    StringSplit, array, full_path, \
    ;Run, cmd /K "%array1% & cd `"%full_path%`""
    Run, cmd /K cd /d `"%full_path%`"
}

EditWithSublime() {
    sel := Explorer_GetSelected()
    ;Run, "D:\Applications\Sublime Text 3\sublime_text.exe" `"%sel%`",,, pid
    Run, "D:\Applications\Vim\vim74\gvim.exe" `"%sel%`",,, pid
    WinWait, ahk_pid %pid%
    WinActivate, ahk_pid %pid%
}

; Returns the current datetime/date/time
GetDateTime(option=0) {
    if option = 1
        FormatTime, currDate,, yyyy/M/d
    else if option = 2
        FormatTime, currDate,, H:mm:ss
    else
        FormatTime, currDate,, yyyy/M/d H:mm:ss
    SendInput, %currDate%
}
