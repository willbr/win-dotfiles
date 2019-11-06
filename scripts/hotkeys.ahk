#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #InstallKeybdHook
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!o::
;EnvGet, USERPROFILE, USERPROFILE
;Run %A_ComSpec% /k "%USERPROFILE%\config\cmd-profile.cmd"
EnvGet, windir, windir
Run %windir%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -NoExit -Command "& 'C:\Users\wjbr\Anaconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\Users\wjbr\Anaconda3' "
;  "& 'C:\Users\wjbr\Anaconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\Users\wjbr\Anaconda3' "
return

^!i::
Run Notepad
return

