@echo off

cd C:\Users\Administrator\sahi_pro\userdata\bin && testrunner.bat testSmoke.suite https://qa.launchpadrecruitsapp.com/login ie" > C:\temp\testSmoke.log

cd C:\Users\Administrator\sahi_pro\userdata\bin
findstr FAILED C:\temp\testSmoke.log
if %ERRORLEVEL%==0 exit 999
)