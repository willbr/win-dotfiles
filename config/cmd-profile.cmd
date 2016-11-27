@echo off

if not exist "%HOME%" set HOME=%HOMEDRIVE%%HOMEPATH%
if not exist "%HOME%" set HOME=%USERPROFILE%

set EDITOR=vim


doskey /reinstall /macrofile="%HOME%\config\doskey.txt"

prompt $+$G$S

pwd

