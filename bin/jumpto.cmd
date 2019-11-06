@echo off

set _return=0
set _db=%userprofile%\config\jumpto.txt

if "%~1"=="jump" (
    call :jump %2
) else if "%~1"=="add" (
    call :add %2
) else if "%~1"=="list" (
    call :list %2
) else if "%~1"=="edit" (
    call :edit %2
) else if "%~1"=="help" (
    call :help %2
) else if "%~1"=="" (
    echo error: no command
    set _return=1
) else (
    echo error: unknown command "%~1"
    set _return=1
)

exit /b %_return%

:jump
    rem echo %0
    set _found=0
    set _needle=%~1

    if "%_needle%"=="" (
        set _needle=home
    )

    for /f "tokens=1-2 delims=;" %%a in (%_db%) do (
        if "%_needle%"=="%%a" (
            set _found=1
            pushd %%b
        )
    )
    if %_found% EQU 0 (
        echo error; alias not found: %~1
    ) else (
        pwd
    )
    exit /b 0

:add
    rem echo %0
    (echo %1;"%CD%")>>%_db%
    exit /b 0

:list
    type %_db%
    exit /b 0

:edit
    call %EDITOR% %_db%
    exit /b 0

:help
    echo %0
    exit /b 0

