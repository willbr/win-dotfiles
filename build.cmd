@echo off

call :make_links bin
call :make_links config

exit /b 0


:make_links
    set _targetDir=%userprofile%\%1
    if not exist %_targetDir% mkdir %_targetDir%
    for %%a in (%1\*.*) do (
        call :make_link %_targetDir%\%%~nxa %%~fpa
    )
    exit /b 0


:make_link link target
    if exist %1 (
        echo error; file already exists: %1
    ) else (
        rem fix: hardlink makes doskey work
        mklink /h %1 %2 
    )
    exit /b 0

