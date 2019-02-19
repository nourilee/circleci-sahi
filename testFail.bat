@echo off

findstr FAILED C:\temp\testSmoke.log
if %ERRORLEVEL%==0 (
	echo %ERRORLEVEL%
	del C:\temp\testSmoke.log
	exit 1
)