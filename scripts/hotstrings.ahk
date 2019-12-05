#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #InstallKeybdHook
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

::btw::by the way
:*:@@1::william.bettridge.radford@gmail.com
:*:@@2::will.bt@btinernet.com
:*:;name::William Bettridge-Radford
:*:;lname::Bettridge-Radford
:*:;email::william.bettridge.radford@gmail.com
:*:;phone::07866060605
:*:;mobile::07866060605


:*:;d::
FormatTime, CurrentDateTime,, d/M/yyy h:mm tt
SendInput %CurrentDateTime%
return

; Win7 has #1 #2 #3 hotkeys builtin
; use these instead
/*
#SC029::
msgbox hello1
return
*/

