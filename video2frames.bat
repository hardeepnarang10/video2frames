@echo off
cls
cd %~pd0
set filename=
echo Enter filename in format "Video File.mp4" (including quotation marks)
set /p filename=Enter filename: 
set startchoice=
echo Set Interval: 
echo [1] Keep default (20 seconds).
echo [2] Enter own.
set /p timechoice=Enter choice: 
if %timechoice%==1 goto DEFAULT
if %timechoice%==2 goto CUSTOM
else goto INVALID

:DEFAULT
ffmpeg -i %filename% -vf fps=1/20 img%%05d.jpg
goto COMPLETE

:CUSTOM
set time=
set /p time=Enter time in seconds: 
ffmpeg -i %filename% -vf fps=1/%time% img%%05d.jpg
goto COMPLETE

:COMPLETE
echo.
echo Processing complete!
pause>nul
exit

:INVALID
echo Invalid input. Exiting...
pause>nul
exit
