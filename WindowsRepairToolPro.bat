@echo off

:: =========================================
:: Auto Update System - Hesham Taha
:: =========================================

set CURRENT_VERSION=1.2

set VERSION_URL=https://raw.githubusercontent.com/newmatrix/WinRTP/main/Version.txt
set TOOL_URL=https://raw.githubusercontent.com/newmatrix/WinRTP/main/WindowsRepairToolPro.bat

set TEMP_VERSION=%temp%\Version.txt
set NEW_TOOL=%temp%\WindowsRepairToolPro.bat

echo Checking for updates...

powershell -Command "(New-Object Net.WebClient).DownloadFile('%VERSION_URL%', '%TEMP_VERSION%')"

if exist "%TEMP_VERSION%" (

    set /p ONLINE_VERSION=<"%TEMP_VERSION%"

    if NOT "%ONLINE_VERSION%"=="%CURRENT_VERSION%" (

        cls
        echo =========================================
        echo          NEW UPDATE FOUND!
        echo =========================================
        echo Current Version : %CURRENT_VERSION%
        echo Latest Version  : %ONLINE_VERSION%
        echo.
        echo Downloading update...
        echo.

        powershell -Command "(New-Object Net.WebClient).DownloadFile('%TOOL_URL%', '%NEW_TOOL%')"

        if exist "%NEW_TOOL%" (

            echo Update completed successfully!
            timeout /t 2 >nul

            start "" "%NEW_TOOL%"

            exit
        )
    )
)

echo Tool is up to date.
timeout /t 1 >nul

title Windows Repair Tool Pro - Hesham Taha

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
:: MAIN MENU
:: ====================================================
:menu
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%              Windows Repair Tool Pro%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Optimize OS
echo %RED%[0]%RESET% Exit
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p choice=%YELLOW%Enter your choice: %RESET%

if "%choice%"=="1" goto menu_optimize
if "%choice%"=="2" goto menu_disk
if "%choice%"=="3" goto menu_advanced
if "%choice%"=="4" goto menu_repair
if "%choice%"=="5" goto menu_security
if "%choice%"=="6" goto about
if "%choice%"=="0" exit
goto menu

:: ====================================================
:: SUB-MENUS
:: ====================================================
:menu_optimize
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                  Optimize OS%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Run SFC Scan
echo %WHITE%[2]%RESET% Run DISM RestoreHealth
echo %WHITE%[3]%RESET% Component Store Cleanup (Deep Repair)
echo %WHITE%[4]%RESET% Clean Temporary Files
echo %WHITE%[5]%RESET% Optimize Internet ^& DNS
echo %WHITE%[6]%RESET% Run ALL Repairs
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p opt_choice=%YELLOW%Enter your choice: %RESET%
if "%opt_choice%"=="1" goto sfc
if "%opt_choice%"=="2" goto dism
if "%opt_choice%"=="3" goto comp_cleanup
if "%opt_choice%"=="4" goto clean
if "%opt_choice%"=="5" goto internet
if "%opt_choice%"=="6" goto all
if "%opt_choice%"=="0" goto menu
goto menu_optimize

:menu_disk
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                   Disk Tools%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Schedule CHKDSK Scan
echo %WHITE%[2]%RESET% Stop Schedule CHKDSK Scan
echo %WHITE%[3]%RESET% Defragment HDD / Retrim SSD [Safe]
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p disk_choice=%YELLOW%Enter your choice: %RESET%
if "%disk_choice%"=="1" goto chkdsk
if "%disk_choice%"=="2" goto cancelchk
if "%disk_choice%"=="3" goto defrag
if "%disk_choice%"=="0" goto menu
goto menu_disk

:menu_advanced
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                 Advanced Tools%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Update All Installed Programs (Winget)
echo %WHITE%[2]%RESET% Enable Ultimate Performance Mode
echo %WHITE%[3]%RESET% Restore Balanced Power Mode (Default)
echo %WHITE%[4]%RESET% Schedule Auto Shutdown
echo %WHITE%[5]%RESET% Cancel Auto Shutdown
echo %WHITE%[6]%RESET% Restart to BIOS/UEFI
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p adv_choice=%YELLOW%Enter your choice: %RESET%
if "%adv_choice%"=="1" goto winget_update
if "%adv_choice%"=="2" goto ultimate_perf
if "%adv_choice%"=="3" goto restore_balanced
if "%adv_choice%"=="4" goto shutdown
if "%adv_choice%"=="5" goto cancelshutdown
if "%adv_choice%"=="6" goto bios
if "%adv_choice%"=="0" goto menu
goto menu_advanced

:menu_repair
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                   Repair OS%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Repair Windows Update
echo %WHITE%[2]%RESET% Repair Microsoft Store
echo %WHITE%[3]%RESET% Rebuild Windows Icons
echo %WHITE%[4]%RESET% Fix Taskbar and Explorer
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p rep_choice=%YELLOW%Enter your choice: %RESET%
if "%rep_choice%"=="1" goto winupdate
if "%rep_choice%"=="2" goto store
if "%rep_choice%"=="3" goto icons
if "%rep_choice%"=="4" goto taskbar
if "%rep_choice%"=="0" goto menu
goto menu_repair

:menu_security
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                    Security%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Quick Scan
echo %WHITE%[2]%RESET% Full Scan
echo %WHITE%[3]%RESET% Reset Windows Firewall Settings
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p sec_choice=%YELLOW%Enter your choice: %RESET%
if "%sec_choice%"=="1" goto quickscan
if "%sec_choice%"=="2" goto fullscan
if "%sec_choice%"=="3" goto firewall_reset
if "%sec_choice%"=="0" goto menu
goto menu_security

:: --- FUNCTIONS ---

:sfc
cls
echo %GREEN%Running SFC Scan...%RESET%
sfc /scannow
pause
goto menu_optimize

:dism
cls
echo %GREEN%Running DISM RestoreHealth...%RESET%
DISM /Online /Cleanup-Image /RestoreHealth
pause
goto menu_optimize

:comp_cleanup
cls
echo %GREEN%Component Store Cleanup (Deep Repair)...%RESET%
DISM /Online /Cleanup-Image /StartComponentCleanup
echo.
echo %GREEN%[✓] Cleanup Completed.%RESET%
pause
goto menu_optimize

:clean
cls
echo %GREEN%Cleaning Temporary Files...%RESET%
del /q /f /s C:\Windows\Prefetch\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%temp%\*"
cleanmgr /sagerun:1
pause
goto menu_optimize

:internet
cls
echo %GREEN%Optimizing Internet & DNS...%RESET%
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
arp -d *
pause
goto menu_optimize

:all
cls
echo %YELLOW%Running Full Repair (SFC, DISM, Cleanup)...%RESET%
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
DISM /Online /Cleanup-Image /StartComponentCleanup
del /q /f /s C:\Windows\Prefetch\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%temp%\*"
cleanmgr /sagerun:1
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
arp -d *
echo.
echo %GREEN%[✓] Full Repair Completed Successfully.%RESET%
pause
goto menu_optimize

:chkdsk
cls
echo %YELLOW%Scheduling CHKDSK on next restart...%RESET%
echo y | chkdsk C: /f /r
echo %GREEN%[✓] The check is scheduled for the next restart.%RESET%
pause
goto menu_disk

:cancelchk
cls
echo %GREEN%Removing scheduled CHKDSK...%RESET%
chkntfs /x C:
echo %GREEN%[✓] The scheduling process has been cancelled.%RESET%
pause
goto menu_disk

:winget_update
set "w_choice="
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%       Software Update Center (Winget)%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Checking for available updates... Please wait.%RESET%
echo.
winget upgrade
if %errorlevel% neq 0 (
    echo.
    echo %GREEN%[✓] All your programs are up to date!%RESET%
    echo.
    pause
    goto menu_advanced
)
echo.
echo %WHITE%----------------------------------------------------%RESET%
echo [1] Update %GREEN%ALL%RESET% programs
echo [2] Update a %GREEN%SPECIFIC%RESET% program (Type ID/Name)
echo [0] Back to Advanced Tools
echo %WHITE%----------------------------------------------------%RESET%
echo.
set /p w_choice=%YELLOW%Enter choice: %RESET%
if "%w_choice%"=="1" (
    winget upgrade --all --include-unknown
    pause
    goto winget_update
)
if "%w_choice%"=="2" (
    set /p app_ref=%YELLOW%Enter App ID or Name: %RESET%
    winget upgrade --id "%app_ref%" --include-unknown || winget upgrade --name "%app_ref%" --include-unknown
    pause
    goto winget_update
)
if "%w_choice%"=="0" goto menu_advanced
goto winget_update

:ultimate_perf
cls
echo =====================================
echo   Enabling Ultimate Performance
echo =====================================
echo.

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 > temp.txt

for /f "tokens=4" %%i in ('findstr /i "GUID" temp.txt') do set GUID=%%i

powercfg /setactive %GUID%

del temp.txt

echo.
echo Ultimate Performance Mode Enabled Successfully.
echo Active GUID: %GUID%
echo.
pause
goto menu_advanced

:restore_balanced
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%Restoring Balanced Mode ^& Cleaning Up%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Activating Balanced Mode...%RESET%

powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e

echo %YELLOW%Removing Ultimate Performance profiles...%RESET%
for /f "tokens=4" %%i in ('powercfg -list ^| findstr /i "Ultimate"') do (
    powercfg -delete %%i >nul 2>&1
)

echo.
echo %GREEN%[✓] Balanced Mode Restored and Ultimate Profiles Cleaned!%RESET%
echo.
pause
goto menu_advanced

:shutdown
cls
set /p st=%YELLOW%Enter minutes: %RESET%
set /a ss=%st%*60
shutdown /s /t %ss%
pause
goto menu_advanced

:cancelshutdown
cls
shutdown /a
echo %GREEN%Shutdown canceled.%RESET%
pause
goto menu_advanced

:bios
cls
echo %RED%System will restart to BIOS in 60 seconds...%RESET%
shutdown /r /fw /t 60
pause
goto menu_advanced

:winupdate
cls
echo %YELLOW%Repairing Windows Update...%RESET%
net stop wuauserv
net stop bits
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv
net start bits
echo %GREEN%[✓] Done.%RESET%
pause
goto menu_repair

:store
cls
echo %YELLOW%Resetting Microsoft Store (Please wait)...%RESET%
wsreset.exe
pause
goto menu_repair

:icons
cls
echo %YELLOW%Rebuilding Icon Cache...%RESET%
taskkill /f /im explorer.exe
del /a /q "%localappdata%\IconCache.db"
start explorer.exe
pause
goto menu_repair

:taskbar
cls
echo %YELLOW%Fixing Taskbar...%RESET%
taskkill /f /im explorer.exe
start explorer.exe
powershell -Command "& {$manifest = (Get-AppxPackage Microsoft.Windows.ShellExperienceHost).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
pause
goto menu_repair

:defrag
cls
set /p drv=%YELLOW%Enter Drive Letter (e.g. C): %RESET%
set drv=%drv::=%
echo %YELLOW%Checking Drive Type...%RESET%
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where "DeviceID='%drv%:'" get Description /value 2^>nul') do set ddesc=%%a
powershell -Command "if ((Get-PhysicalDisk | Where-Object { (Get-Partition -DriveLetter '%drv%').DiskNumber -eq $_.DeviceNumber }).MediaType -eq 'SSD') { exit 1 } else { exit 0 }"
if %errorlevel% equ 1 (
    echo %RED%[X] SSD Detected! Defragmentation skipped to protect drive.%RESET%
) else (
    echo %GREEN%HDD Detected. Starting Defragmentation...%RESET%
    defrag %drv%: /O /U /V
)
pause
goto menu_disk

:quickscan
cls
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
pause
goto menu_security

:fullscan
cls
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
pause
goto menu_security

:firewall_reset
cls
echo %YELLOW%Resetting Firewall...%RESET%
netsh advfirewall reset
pause
goto menu_security

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
