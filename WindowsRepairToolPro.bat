@echo off

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
echo %GREEN%            Windows Repair Tool Pro v1.1%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Optimize OS
echo %WHITE%[2]%RESET% Disk Tools
echo %WHITE%[3]%RESET% Advanced Tools
echo %WHITE%[4]%RESET% Repair OS
echo %WHITE%[5]%RESET% Security
echo %WHITE%[6]%RESET% CHK Update
echo %WHITE%[7]%RESET% About
echo %RED%[0]%RESET% Exit
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p choice=%YELLOW%Enter your choice: %RESET%

if "%choice%"=="1" goto menu_optimize
if "%choice%"=="2" goto menu_disk
if "%choice%"=="3" goto menu_advanced
if "%choice%"=="4" goto menu_repair
if "%choice%"=="5" goto menu_security
if "%choice%"=="6" goto UPDATE
if "%choice%"=="7" goto about
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
echo %WHITE%[7]%RESET% Restart to Safe Mode
echo %WHITE%[8]%RESET% Debloat Windows (Remove Junk Apps)
echo %WHITE%[9]%RESET% Clean Old Windows Updates (Windows.old)
echo %WHITE%[10]%RESET% Clean Crash Dumps Files
echo %WHITE%[11]%RESET% Show WI-FI Password
echo %WHITE%[12]%RESET% Disable Windows Update
echo %WHITE%[13]%RESET% Enable Windows Update
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p adv_choice=%YELLOW%Enter your choice: %RESET%
if "%adv_choice%"=="1" goto winget_update
if "%adv_choice%"=="2" goto ultimate_perf
if "%adv_choice%"=="3" goto restore_balanced
if "%adv_choice%"=="4" goto shutdown
if "%adv_choice%"=="5" goto cancelshutdown
if "%adv_choice%"=="6" goto bios
if "%adv_choice%"=="7" goto safemode
if "%adv_choice%"=="8" goto debloat
if "%adv_choice%"=="9" goto clean_updates
if "%adv_choice%"=="10" goto clean_dumps
if "%adv_choice%"=="11" goto wifi_pwd
if "%adv_choice%"=="12" goto disable_updates
if "%adv_choice%"=="13" goto enable_updates
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
echo %WHITE%[4]%RESET% Disable Telemetry (Windows Tracking)
echo %WHITE%[5]%RESET% Fix Windows Defender
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p sec_choice=%YELLOW%Enter your choice: %RESET%
if "%sec_choice%"=="1" goto quickscan
if "%sec_choice%"=="2" goto fullscan
if "%sec_choice%"=="3" goto firewall_reset
if "%sec_choice%"=="4" goto telemetry
if "%sec_choice%"=="5" goto fix_defender
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
echo %WHITE%Checking system image health, please wait...%RESET%
echo.
cmd /c "DISM /Online /Cleanup-Image /RestoreHealth"
echo.
echo %GREEN%[✓] DISM Process Finished.%RESET%
echo.
pause
goto menu_optimize

:comp_cleanup
cls
echo %GREEN%Component Store Cleanup (Deep Repair)...%RESET%
echo %WHITE%Cleaning component store, please wait...%RESET%
echo.
cmd /c "DISM /Online /Cleanup-Image /StartComponentCleanup"
echo.
echo %GREEN%[✓] Cleanup Completed.%RESET%
echo.
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

:safemode
cls
echo %YELLOW%Preparing to boot into Safe Mode...%RESET%
echo %RED%[!] IMPORTANT: To return to Normal Mode later, you will need to open CMD and type:%RESET%
echo %WHITE%bcdedit /deletevalue {current} safeboot%RESET%
echo.
pause
bcdedit /set {current} safeboot minimal
shutdown /r /t 60
goto menu_advanced

:debloat
cls
echo %YELLOW%Removing unnecessary default Windows apps (Debloat)...%RESET%
powershell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *skypeapp* | Remove-AppxPackage"
echo %GREEN%[✓] Windows Debloat Completed.%RESET%
pause
goto menu_advanced

:telemetry
cls
echo %YELLOW%Disabling Windows Telemetry and Data Collection...%RESET%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
echo %GREEN%[✓] Telemetry and Tracking disabled successfully.%RESET%
pause
goto menu_security

:clean_updates
cls
echo %YELLOW%Cleaning up old Windows Updates (Deep Clean)...%RESET%
echo %WHITE%This process might take a long time. Please do not close the window...%RESET%
echo.

cmd /c "DISM /online /Cleanup-Image /StartComponentCleanup /ResetBase"

echo.
if exist "C:\Windows.old" (
    echo %YELLOW%Removing Windows.old folder...%RESET%
    rd /s /q "C:\Windows.old"
)

echo.
echo %GREEN%[✓] Updates Cleanup Completed Successfully.%RESET%
echo.
pause
goto menu_advanced

:wifi_pwd
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%             Saved Wi-Fi Passwords%RESET%
echo %CYAN%====================================================%RESET%
echo.
powershell -Command "netsh wlan show profiles | Select-String 'All User Profile' | ForEach-Object { $profile = $_.ToString().Split(':')[1].Trim(); $pass = (netsh wlan show profile name=$profile key=clear | Select-String 'Key Content' | ForEach-Object { $_.ToString().Split(':')[1].Trim() }); [PSCustomObject]@{ 'Wi-Fi Name' = $profile; 'Password' = $pass } } | Format-Table -AutoSize"
echo.
pause
goto menu_advanced

:fix_defender
cls
echo %YELLOW%Repairing and Resetting Windows Defender...%RESET%
powershell -Command "Get-AppxPackage *Microsoft.Windows.SecHealthUI* | Reset-AppxPackage"
echo %GREEN%[✓] Windows Defender has been reset successfully.%RESET%
pause
goto menu_security

:clean_dumps
cls
echo %YELLOW%Cleaning Windows Crash Dumps and Error Logs...%RESET%
del /f /q /s %systemroot%\Minidump\* >nul 2>&1
del /f /q /s %systemroot%\MEMORY.DMP >nul 2>&1
del /f /q /s %systemroot%\Logs\CBS\* >nul 2>&1
echo %GREEN%[✓] Crash Dumps and System Logs cleaned!%RESET%
pause
goto menu_advanced

:disable_updates
cls
echo %YELLOW%Disabling Windows Update services and registry keys...%RESET%
echo.

net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
net stop dosvc >nul 2>&1
net stop WaaSMedicSvc >nul 2>&1

sc config wuauserv start= disabled >nul 2>&1
sc config bits start= disabled >nul 2>&1
sc config dosvc start= disabled >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bits" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dosvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1

echo %GREEN%[✓] Windows Update fully disabled.%RESET%
echo.
pause
goto menu_advanced

:enable_updates
cls
echo %YELLOW%Enabling Windows Update services...%RESET%
echo.

reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bits" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dosvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 3 /f >nul 2>&1

reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul 2>&1

sc config wuauserv start= demand >nul 2>&1
net start wuauserv >nul 2>&1
sc config bits start= delayed-auto >nul 2>&1
net start bits >nul 2>&1
sc config dosvc start= delayed-auto >nul 2>&1
net start dosvc >nul 2>&1

echo %GREEN%[✓] Windows Update services have been restored to default.%RESET%
echo.
pause
goto menu_advanced

:UPDATE
cls
echo =========================================
echo           CHECKING FOR UPDATES
echo =========================================
echo.

setlocal EnableDelayedExpansion

set CURRENT_VERSION=1.1

set VERSION_URL=https://raw.githubusercontent.com/newmatrix/WinRTP/main/Version.txt
set TOOL_URL=https://raw.githubusercontent.com/newmatrix/WinRTP/main/WindowsRepairToolPro.bat

set TEMP_VERSION=%temp%\Version.txt
set NEW_FILE=%temp%\WindowsRepairToolPro_New.bat
set UPDATER=%temp%\Updater.bat

powershell -Command "(New-Object Net.WebClient).DownloadFile('%VERSION_URL%', '%TEMP_VERSION%')" >nul 2>&1

if exist "%TEMP_VERSION%" (

    set ONLINE_VERSION=

    for /f "delims=" %%i in ('type "%TEMP_VERSION%"') do (
        set ONLINE_VERSION=%%i
    )

    set ONLINE_VERSION=!ONLINE_VERSION: =!

    echo Current Version : %CURRENT_VERSION%
    echo New version found: !ONLINE_VERSION!
    echo.

    if "!ONLINE_VERSION!"=="%CURRENT_VERSION%" (

        echo You already have the latest version.
        echo.
        pause
        goto MENU
    )

    echo.
    echo Downloading update...
    echo.

    powershell -Command "(New-Object Net.WebClient).DownloadFile('%TOOL_URL%', '%NEW_FILE%')" >nul 2>&1

    if exist "%NEW_FILE%" (

        echo Creating updater...
        echo.

        (
        echo @echo off
        echo timeout /t 2 ^>nul
        echo copy /y "%NEW_FILE%" "%~f0" ^>nul
        echo start "" "%~f0"
        echo del "%NEW_FILE%" ^>nul 2^>^&1
        echo del "%%~f0" ^>nul 2^>^&1
        ) > "%UPDATER%"

        echo Update installed successfully!
        echo Restarting tool...
        timeout /t 2 >nul

        start "" "%UPDATER%"

        exit
    )
)

echo Failed to check for updates.
pause
goto MENU

:about
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%                 About Developer%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Developer:%RESET% Hesham Taha
echo %WHITE%YouTube:%RESET% Hesham Taha
echo %WHITE%Facebook:%RESET% Hesham Taha Official
echo %WHITE%Version:%RESET% 1.1
echo.

echo %YELLOW%Opening links...%RESET%

timeout /t 2 >nul

start "" "https://www.youtube.com/@heshamtaha1"
start "" "https://facebook.com/HeshamTahaOfficial"

pause
goto menu
