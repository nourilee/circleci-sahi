@echo off

cd C:\Users\Administrator\sahi_pro\userdata\bin 
testrunner.bat testSmoke.suite https://qa.launchpadrecruitsapp.com/login ie > C:\temp\testSmoke.log

findstr FAILED C:\temp\testSmoke.log
if %ERRORLEVEL%==0 (
	echo %ERRORLEVEL%
	del C:\temp\testSmoke.log
	exit /b 999
)