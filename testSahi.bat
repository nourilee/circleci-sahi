:: This will copy scripts from repository to the sahi directory
xcopy /s/y C:\Users\Administrator\Documents\GitHub\circleci-sahi\scripts C:\Users\Administrator\sahi_pro\userdata\scripts

:: This will execute the scripts
cd C:\Users\Administrator\sahi_pro\userdata\bin && testrunner.bat testSmoke.suite https://qa.launchpadrecruitsapp.com/login ie