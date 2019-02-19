cd C:\Users\Administrator\sahi_pro\userdata\bin
findstr FAILED temp.txt
if %ERRORLEVEL%==0 (
	echo FAILED
	del temp.txt
	exit 999
)