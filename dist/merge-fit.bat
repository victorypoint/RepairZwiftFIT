:: RepairZwiftFIT
:: Author: Al Udell
:: Revised: March 3, 2023

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

:: get newest Zwift FIT file
for /F "eol=| delims=" %%I IN ('dir "%Zwiftfolder%\*.fit" /A-D /B /O-D /TW 2^>nul') DO SET "Zwiftfile=%%I" & goto FoundZwiftFile
echo.
echo No Zwift FIT file found!
goto :NoGo

:FoundZwiftFile
echo.
echo Zwift FIT file: "%Zwiftfolder%\%Zwiftfile%"

:: get newest QZ FIT file
for /F "eol=| delims=" %%I IN ('dir "%QZfolder%\*.fit" /A-D /B /O-D /TW 2^>nul ^| findstr /vb 1 ^| findstr /vb 0') DO SET "QZfile=%%I" & goto FoundQZFile
echo.
echo No QZ FIT file found!
goto :NoGo

:FoundQZFile
echo QZ FIT file: "%QZfolder%\%QZfile%"

:: merge FIT files
qz-zwift-merge.jar -g "%QZfolder%\%QZfile%" -z "%Zwiftfolder%\%Zwiftfile%" -o "%cd%\merged\%Zwiftfile%" -f
echo Merge FIT file: "%cd%\_merged\%Zwiftfile%"

:NoGo
::change directory back to previous stored by pushd
@popd

echo.
pause
