@echo off

if not exist "%HOME%" set HOME=%HOMEDRIVE%%HOMEPATH%
if not exist "%HOME%" set HOME=%USERPROFILE%

set PATH=%PATH%;%HOME%\bin;C:\Program Files\Neovim\bin

set EDITOR=vim


doskey /reinstall /macrofile="%HOME%\config\doskey.txt"

prompt $+$G$S

pwd

