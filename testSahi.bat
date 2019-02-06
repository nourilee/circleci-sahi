:: This will start Git bash shell scripting
cd C:\Program Files\Git\bin && start sh.exe

:: This will execute git commands
cd C:/Users/Administrator/Documents/GitHub/circleci-sahi && git remote -v 
exit

:: This will copy scripts from repository to the sahi directory
xcopy /s C:\Users\Administrator\Documents\GitHub\circleci-sahi\scripts C:\Users\Administrator\sahi_pro\userdata\scripts

:: This will execute the scripts
cd C:\Users\Administrator\sahi_pro\userdata\bin && testrunner.bat testSmoke.suite https://qa.launchpadrecruitsapp.com/login ie