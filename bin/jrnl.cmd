@echo off

set _journal_dir=%userprofile%\Dropbox\docs\journal
set _template_file=%_journal_dir%\template.md

set _date_day=%DATE:~0,2%
set _date_month=%DATE:~3,2%
set _date_year=%DATE:~6,4%
REM set _date_year=4000
set _year_folder=%_journal_dir%\%_date_year%

set _todays_basename=%_date_year%-%_date_month%-%_date_day%.md
set _todays_filename=%_year_folder%\%_todays_basename%

if not exist "%_year_folder%" (
    mkdir "%_year_folder%"
) else (
    REM do nothing
)

if not exist "%_todays_filename%" (
    copy "%_template_file%" "%_todays_filename%"
) else (
    REM do nothing
)

%editor% "%_todays_filename%"

