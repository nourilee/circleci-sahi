@echo off
REM First attempt at checking return codes

cd C:\Users\Administrator\sahi_pro\userdata\bin && testrunner.bat testFail.sah https://qa.launchpadrecruitsapp.com/login ie > temp.txt
findstr FAILED temp.txt
if %ERRORLEVEL%==1 EXIT 9
