cd C:\Users\Administrator\Documents\GitHub\circleci-sahi\ && git fetch origin
xcopy /s C:\Users\Administrator\Documents\GitHub\circleci-sahi\scripts C:\Users\Administrator\sahi_pro\userdata\scripts

cd C:\Users\Administrator\sahi_pro\userdata\bin && testrunner.bat testSmoke.suite https://qa.launchpadrecruitsapp.com/login ie