:: merge-all-dates.bat
:: RepairZwiftFIT Package
:: Author: Al Udell
:: Revised: March 9, 2023

@echo off

::set current directory to the location of this script
@pushd %~dp0

:: Pause on error
if NOT ["%errorlevel%"]==["0"] pause

::Set Zwift and QZ FIT file locations
set Zwiftfolder=%USERPROFILE%\Documents\Zwift\Activities
set QZfolder=c:\temp\qdomyos-zwift

echo.
echo Merging Zwift and QZ FIT files ...

set /a count = 0
setlocal EnableDelayedExpansion

:: iterate through QZ FIT files
for /f "eol=| delims=" %%q in ('dir "%QZfolder%\*.fit" /b /s /a-d /o-d /tw ^| findstr /vi 1qz ^| findstr /vi 0qz') do (
  :: get file date
  for %%i in ("%%q") do (  
    set datetime=%%~ti
    set date=!datetime:~0,10!
  )
  echo.
  echo Date: !date!
  echo QZ file: %%~nxq 
  set /a count += 1

  :: iterate through Zwift FIT files
  for /f "eol=| delims=" %%z in ('dir "%Zwiftfolder%\*.fit" /b /s /a-d /o-d /tw ^| findstr /vi inProgress') do (
    for /f "tokens=1-3 delims=/ " %%a in ('dir "%%z" /tw ^| findstr !date!') do (
      echo - Zwift file: %%~nxz
      :: merge FIT files
      qz-zwift-merge.jar -g "%%q" -z "%%z" -o "%cd%\merged\%%~nz.merged.!count!%%~xz" -f
    )
  )
)

:: delete merge FIT files less than 1kb size
rem echo.
for /f "eol=| delims=" %%a in ('dir "%cd%\merged\*merged*.fit" /b /s /a-d /o-d /tw') do (
  rem file: echo %%a
  for %%i in ("%%a") do (
    rem echo filesize: %%~zi
    if %%~zi LSS 1024 del "%%a">nul
  )
)

endlocal
echo.
pause
exit /b 0
