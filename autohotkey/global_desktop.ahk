; Command List: http://www.autohotkey.com/docs/commands.htm
; Key List:     http://www.autohotkey.com/docs/KeyList.htm

#SingleInstance force
#NoEnv  ; Performance & future compatibility.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Variables / Toggles                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, Tray, tip, [Ben-Desktop]`nGlobal AHK script
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

; Opens your todo list in GVim
~RCtrl:: 
if (A_PriorHotKey = "~RCtrl" AND A_TimeSincePriorHotkey < 250) 
	Run, "D:\Applications\Vim\vim74\gvim.exe" "D:\Dropbox\todo.txt"
	;Run, "D:\Applications\Sublime Text 3\sublime_text.exe" "D:\Dropbox\todo.txt"
KeyWait RCtrl
return

AppsKey:: 
if (A_PriorHotKey = "AppsKey" AND A_TimeSincePriorHotkey < 250) 
	Run, "D:\Applications\Vim\vim74\gvim.exe" "D:\Dropbox\school.txt"
	;Run, "D:\Applications\Sublime Text 3\sublime_text.exe" "D:\Dropbox\school.txt"
KeyWait RCtrl
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

::]loremipsum::
SendInput Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
return

; Hotkey for Windows Explorer
#IfWinActive ahk_class CabinetWClass
#c::CmdPromptDir()
#v::EditWithGVim()
Tab:: SendInput, !d
#IfWinActive

; cmd
#IfWinActive ahk_class ConsoleWindowClass
^V::SendInput {Raw}%clipboard%
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Functions                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#include D:\Applications\AutoHotkey\Lib\Explorer.ahk

CmdPromptDir() {
    ControlGetText, _Path, toolbarwindow322, ahk_class CabinetWClass
    StringReplace, _Path, _Path, % "Address: ",% ""
    Run %comspec%, %_Path%
}

EditWithGVim() {
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
