@echo off
title Windows Repair Tool Pro - Hesham Taha
mode con: cols=80 lines=30

:: ====================================================
:: ANSI COLORS
:: ====================================================
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set RED=%ESC%[91m
set GREEN=%ESC%[92m
set YELLOW=%ESC%[93m
set BLUE=%ESC%[94m
set CYAN=%ESC%[96m
set WHITE=%ESC%[97m
set RESET=%ESC%[0m

:: ====================================================
:: AUTO RUN AS ADMIN
:: ====================================================

net session >nul 2>&1
if %errorLevel% neq 0 (

    echo Requesting Administrator Access...

    powershell -Command "Start-Process '%~f0' -Verb RunAs"

    exit /b
)

:: ====================================================
:: ADMIN CHECK
:: ====================================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    cls
    echo.
    echo %RED%[X] Please run this file as Administrator!%RESET%
    echo.
    pause
    exit
)

:: ====================================================
:: MAIN MENU
:: ====================================================
:menu
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%              Windows Repair Tool Pro%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%[1]%RESET% Run SFC Scan
echo %WHITE%[2]%RESET% Run DISM RestoreHealth
echo %WHITE%[3]%RESET% Schedule CHKDSK Scan
echo %WHITE%[4]%RESET% Clean Temporary Files
echo %WHITE%[5]%RESET% Optimize Internet ^& DNS
echo %WHITE%[6]%RESET% Run ALL Repairs
echo ============================
echo %WHITE%[7]%RESET% Schedule Auto Shutdown
echo %WHITE%[8]%RESET% Cancel Auto Shutdown
echo ============================
echo %WHITE%[9]%RESET% Repair Windows Update
echo %WHITE%[10]%RESET% About
echo %RED%[0]%RESET% Exit

echo.
set /p choice=%YELLOW%Enter your choice: %RESET%

if "%choice%"=="1" goto sfc
if "%choice%"=="2" goto dism
if "%choice%"=="3" goto chkdsk
if "%choice%"=="4" goto clean
if "%choice%"=="5" goto internet
if "%choice%"=="6" goto all
if "%choice%"=="7" goto shutdown
if "%choice%"=="8" goto cancelshutdown
if "%choice%"=="9" goto winupdate
if "%choice%"=="10" goto about
if "%choice%"=="0" exit

echo.
echo %RED%[X] Invalid choice!%RESET%
timeout /t 2 >nul
goto menu

:: ====================================================
:: SFC SCAN
:: ====================================================
:sfc
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%Running SFC Scan...%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo [SFC] %date% %time%

sfc /scannow

echo.
echo %GREEN%[✓] SFC Scan Completed.%RESET%
echo.
pause
goto menu

:: ====================================================
:: DISM
:: ====================================================
:dism
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%Running DISM RestoreHealth...%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo [DISM] %date% %time%

DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo %GREEN%[✓] DISM Completed.%RESET%
echo.
pause
goto menu

:: ====================================================
:: CHKDSK
:: ====================================================
:chkdsk
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%CHKDSK Scan Scheduler%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %YELLOW%Do you want to schedule CHKDSK scan on next restart?%RESET%
echo.
choice /c YN /m "Press Y to schedule or N to cancel"

if errorlevel 2 goto cancelchkdsk
if errorlevel 1 goto runchkdsk

:runchkdsk
cls
echo.
echo %GREEN%Scheduling CHKDSK Scan...%RESET%
echo.

echo [CHKDSK] %date% %time%

echo y | chkdsk C: /f /r

echo.
echo %GREEN%[✓] Disk Check scheduled successfully.%RESET%
echo.
pause
goto menu

:cancelchkdsk
echo.
echo %RED%[✕] CHKDSK scheduling canceled.%RESET%
echo.
pause
goto menu

:: ====================================================
:: TEMP CLEAN
:: ====================================================
:clean
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%Cleaning Temporary Files...%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo [TEMP CLEAN] %date% %time%

del /q /f /s C:\Windows\Prefetch\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%temp%\*"
cleanmgr /sagerun:1

echo.
echo %GREEN%[✓] Temporary files cleaned successfully.%RESET%
echo.
pause
goto menu

:: ====================================================
:: INTERNET OPTIMIZATION
:: ====================================================
:internet
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%Optimizing Internet & DNS...%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo [INTERNET OPTIMIZATION] %date% %time%

echo %YELLOW%[1/6] Flushing DNS Cache...%RESET%
ipconfig /flushdns

echo.
echo %YELLOW%[2/6] Releasing IP Address...%RESET%
ipconfig /release

echo.
echo %YELLOW%[3/6] Renewing IP Address...%RESET%
ipconfig /renew

echo.
echo %YELLOW%[4/6] Resetting Winsock...%RESET%
netsh winsock reset

echo.
echo %YELLOW%[5/6] Resetting TCP/IP Stack...%RESET%
netsh int ip reset

echo.
echo %YELLOW%[6/6] Clearing ARP Cache...%RESET%
arp -d *

echo.
echo %GREEN%[✓] Internet Optimization Completed.%RESET%
echo.
echo %YELLOW%[!] Restart your PC for best results.%RESET%
echo.
pause
goto menu

:: ====================================================
:: RUN ALL
:: ====================================================
:all
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%Running Full Repair Process...%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo [FULL REPAIR] %date% %time%

echo %YELLOW%[1/5] Running SFC Scan...%RESET%
sfc /scannow

echo.
echo %YELLOW%[2/5] Running DISM RestoreHealth...%RESET%
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo %YELLOW%[3/5] Scheduling CHKDSK...%RESET%
echo y | chkdsk C: /f /r

echo.
echo %YELLOW%[4/5] Cleaning Temporary Files...%RESET%

del /q /f /s C:\Windows\Prefetch\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%temp%\*"
cleanmgr /sagerun:1

echo.
echo %YELLOW%[5/5] Optimize Internet...%RESET%
echo %YELLOW%[1/6] Flushing DNS Cache...%RESET%
ipconfig /flushdns

echo.
echo %YELLOW%[2/6] Releasing IP Address...%RESET%
ipconfig /release

echo.
echo %YELLOW%[3/6] Renewing IP Address...%RESET%
ipconfig /renew

echo.
echo %YELLOW%[4/6] Resetting Winsock...%RESET%
netsh winsock reset

echo.
echo %YELLOW%[5/6] Resetting TCP/IP Stack...%RESET%
netsh int ip reset

echo.
echo %YELLOW%[6/6] Clearing ARP Cache...%RESET%
arp -d *

echo.
echo %GREEN%[✓] Full Repair Completed Successfully.%RESET%
echo.
pause
goto menu

:: ====================================================
:: SHUTDOWN TIMER
:: ====================================================
:shutdown
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%Shutdown Timer%RESET%
echo %CYAN%====================================================%RESET%
echo.

set /p shutdown_time=%YELLOW%Enter time in minutes before shutdown: %RESET%

:: Check if empty
if "%shutdown_time%"=="" (
    echo.
    echo %RED%[✕] Please enter a valid number!%RESET%
    timeout /t 2 >nul
    goto shutdown
)

:: Convert minutes to seconds
set /a seconds=%shutdown_time%*60

echo.
echo %GREEN%[✓] Your PC will shutdown after %shutdown_time% minute(s).%RESET%
echo.

shutdown /s /t %seconds%

pause
goto menu

:: ====================================================
:: CANCEL SHUTDOWN
:: ====================================================
:cancelshutdown
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%Cancel Scheduled Shutdown%RESET%
echo %CYAN%====================================================%RESET%
echo.

shutdown /a

echo.
echo %GREEN%[✓] Scheduled shutdown canceled successfully.%RESET%
echo.

pause
goto menu

:: ====================================================
:: WINDOWS UPDATE REPAIR
:: ====================================================
:winupdate
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%Repairing Windows Update...%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo [WINDOWS UPDATE REPAIR] %date% %time%
echo.

echo %YELLOW%[1/7] Stopping Windows Update Services...%RESET%
net stop wuauserv
net stop bits
net stop cryptsvc
net stop msiserver

echo.
echo %YELLOW%[2/7] Deleting SoftwareDistribution Cache...%RESET%
rd /s /q C:\Windows\SoftwareDistribution

echo.
echo %YELLOW%[3/7] Deleting Catroot2 Cache...%RESET%
rd /s /q C:\Windows\System32\catroot2

echo.
echo %YELLOW%[4/7] Flushing DNS Cache...%RESET%
ipconfig /flushdns

echo.
echo %YELLOW%[5/7] Resetting Winsock...%RESET%
netsh winsock reset

echo.
echo %YELLOW%[6/7] Restarting Windows Update Services...%RESET%
net start wuauserv
net start bits
net start cryptsvc
net start msiserver

echo.
echo %YELLOW%[7/7] Running Windows Update Scan...%RESET%
UsoClient StartScan

echo.
echo %GREEN%[✓] Windows Update Repair Completed Successfully.%RESET%
echo.
echo %YELLOW%[!] Restart your PC and check for updates again.%RESET%
echo.

pause
goto menu

:: ====================================================
:: ABOUT
:: ====================================================
:about
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%                 About Developer%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Developer:%RESET% Hesham Taha
echo %WHITE%YouTube:%RESET% Hesham Taha
echo %WHITE%Facebook:%RESET% Hesham Taha Official
echo %WHITE%Version:%RESET% 1.0
echo.

echo %YELLOW%Opening links...%RESET%

timeout /t 2 >nul

start "" "https://www.youtube.com/@heshamtaha1"
start "" "https://facebook.com/HeshamTahaOfficial"

pause
goto menu
