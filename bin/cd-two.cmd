@echo off

if "%~1"=="" (
    cd /d "%userprofile%"
) else if "%~1"=="~" (
    cd /d "%userprofile%"
) else (
    cd /d %*
)

rem pwd

