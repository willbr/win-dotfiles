#Persistent
SetBatchLines, -1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #InstallKeybdHook
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Process, Priority,, High

;ControlGetFocus, cwf, Open Password Database
;MsgBox, Control with focus = %cwf%
;ControlFocus, TKChild1, Open Password Database
;ControlFocus, TKChild9, Open Password Database
;MsgBox, Control with focus = %cwf%

wt_locked := "Password Gorilla"
wt_open_database := "Open Password Database"
wt_find := "Find"

CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    ;WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
}


focus_on_password() {
    global wt_open_database

    WinActivate, %wt_open_database%

   ControlGetPos, control_x, control_y, , , TkChild10, %wt_open_database%

   CoordMode, Mouse, Screen
   MouseGetPos, mouse_x, mouse_y    ;// grab current mouse screen position

   click_x := control_x + 5      ;// we'll click 5 pixels inside the control
   click_y := control_y + 5
   CoordMode, Mouse, Relative
   Click %click_x%, %click_y%   ;// click relative to active window (moves mouse)

   CoordMode, Mouse, Screen
   MouseMove, %mouse_x%, %mouse_y%, 0   ;// restore old mouse position
}

focus_on_locked_password() {
    global wt_locked

    WinActivate, %wt_locked%

   ControlGetPos, control_x, control_y, , , TkChild9, %wt_locked%

   CoordMode, Mouse, Screen
   MouseGetPos, mouse_x, mouse_y    ;// grab current mouse screen position

   click_x := control_x + 5      ;// we'll click 5 pixels inside the control
   click_y := control_y + 5
   CoordMode, Mouse, Relative
   Click %click_x%, %click_y%   ;// click relative to active window (moves mouse)

   CoordMode, Mouse, Screen
   MouseMove, %mouse_x%, %mouse_y%, 0   ;// restore old mouse position
}

focus_on_find_text() {
    global wt_find
    WinActivate, %wt_find%

   ControlGetPos, control_x, control_y, , , TkChild14, %wt_find%

   CoordMode, Mouse, Screen
   MouseGetPos, mouse_x, mouse_y    ;// grab current mouse screen position

   click_x := control_x + 5      ;// we'll click 5 pixels inside the control
   click_y := control_y + 5
   CoordMode, Mouse, Relative
   Click %click_x%, %click_y%   ;// click relative to active window (moves mouse)

   CoordMode, Mouse, Screen
   MouseMove, %mouse_x%, %mouse_y%, 0   ;// restore old mouse position
}

Gui +LastFound
hWnd := WinExist()

DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
Return

ShellMessage( wParam,lParam )
{
    global wt_open_database
    global wt_find
    global wt_locked

    If ( wParam = 1 ) ;  HSHELL_WINDOWCREATED := 1
    {
        WinGetTitle, Title, ahk_id %lParam%
        If  ( Title = wt_open_database ) {
            ;CenterWindow( wt_open_database )
            focus_on_password()
            ;msgbox, Password
        } else if (Title = wt_find) {
            focus_on_find_text()
            ;msgbox, Find
        } else if (Title = wt_locked) {
            ;skip
        } else {
            ;skip
        }
    }
}


^!p::
    global wt_open_database
    global wt_find
    global wt_locked

    if ( WinExist(wt_locked) ) {
	CenterWindow(%wt_locked%)
        WinActivate, %wt_locked%
        focus_on_locked_password()
    } else if ( WinExist(wt_find) ) {
        WinActivate, %wt_find%
    } else if ( WinExist(wt_open_database) ) {
        WinActivate, %wt_open_database%
    } else {
	Run "D:\apps\gorilla\gorilla1537_64.exe"
    }
   
    return
