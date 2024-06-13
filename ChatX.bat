@echo off
setlocal enabledelayedexpansion

set "sharedFile=\\server\share\Messages.txt"

:: Loop to continuously prompt for messages
:MessageLoop
cls
echo ---------------------------------------
echo Welcome to Shared Message System
echo ---------------------------------------
echo.
echo Enter your message (Type 'exit' to quit):
set /p userInput="> "

if /i "%userInput%"=="exit" (
    echo Exiting...
    timeout /t 2 >nul
    exit /b
)

:: Get the current username
for /f "tokens=*" %%a in ('whoami') do set "username=%%a"

:: Format message with username and timestamp
set "timestamp=%date% %time%"
echo [%timestamp%] !username!: !userInput! >> "%sharedFile%"

echo.
echo Message sent!
pause
goto MessageLoop
