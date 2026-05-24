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
echo %GREEN%            Windows Repair Tool Pro v1.3%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %GREEN%[0]%RESET% %GREEN%Create Restore Point%RESET%
echo %WHITE%[1]%RESET% Optimize OS
echo %WHITE%[2]%RESET% Disk Tools
echo %WHITE%[3]%RESET% Advanced Tools
echo %WHITE%[4]%RESET% Repair OS
echo %WHITE%[5]%RESET% Security
echo %WHITE%[6]%RESET% Drivers Manager (Updates ^& Backup)
echo %WHITE%[7]%RESET% Silent Apps Installer (Winget)
echo.
echo %WHITE%[C]%RESET% CHK Update
echo %WHITE%[A]%RESET% About
echo %RED%[E]%RESET% Exit
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p choice=%YELLOW%Enter your choice: %RESET%

if "%choice%"=="0" goto create_restore_point
if "%choice%"=="1" goto menu_optimize
if "%choice%"=="2" goto menu_disk
if "%choice%"=="3" goto menu_advanced
if "%choice%"=="4" goto menu_repair
if "%choice%"=="5" goto menu_security
if "%choice%"=="6" goto menu_drivers
if "%choice%"=="7" goto menu_apps

if /i "%choice%"=="c" goto UPDATE
if /i "%choice%"=="a" goto about
if /i "%choice%"=="e" exit
goto menu

:: ====================================================
:: SUB-MENUS
:: ====================================================
:menu_optimize
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                    Optimize OS%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Run DISM RestoreHealth
echo %WHITE%[2]%RESET% Component Store Cleanup (Deep Repair)
echo %WHITE%[3]%RESET% Clean Old Windows Updates (Windows.old)
echo %WHITE%[4]%RESET% Clean Crash Dumps Files
echo %WHITE%[5]%RESET% Run SFC Scan
echo %WHITE%[6]%RESET% Clean Temporary Files
echo %WHITE%[7]%RESET% Optimize Internet ^& DNS
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[8]%RESET% %GREEN%Safe and quick cleaning (1, 5, 6, 7)%RESET%
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p opt_choice=%YELLOW%Enter your choice: %RESET%
if "%opt_choice%"=="1" goto dism
if "%opt_choice%"=="2" goto comp_cleanup
if "%opt_choice%"=="3" goto clean_updates
if "%opt_choice%"=="4" goto clean_dumps
if "%opt_choice%"=="5" goto sfc
if "%opt_choice%"=="6" goto clean
if "%opt_choice%"=="7" goto internet
if "%opt_choice%"=="8" goto quick_optimize
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
echo %GREEN%[1]%RESET% %GREEN%Enable Ultimate Performance Mode%RESET%
echo %RED%[2]%RESET% %RED%Restore Balanced Power Mode (Default)%RESET%
echo %WHITE%[3]%RESET% Schedule Auto Shutdown
echo %WHITE%[4]%RESET% Cancel Auto Shutdown
echo %WHITE%[5]%RESET% Restart to BIOS/UEFI
echo %WHITE%[6]%RESET% Restart to Safe Mode
echo %WHITE%[7]%RESET% Debloat Windows (Remove Junk Apps)
echo %WHITE%[8]%RESET% Show WI-FI Password
echo %GREEN%[9]%RESET% %GREEN%Enable Windows Update%RESET%%RESET%
echo %RED%[10]%RESET% %RED%Disable Windows Update%RESET%
echo %WHITE%[11]%RESET% Change Internet DNS (Gaming ^& Speed)
echo %WHITE%[12]%RESET% Clean Gamer Cashe (Steam, Epic Games, EA, Discord)
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p adv_choice=%YELLOW%Enter your choice: %RESET%
if "%adv_choice%"=="1" goto ultimate_perf
if "%adv_choice%"=="2" goto restore_balanced
if "%adv_choice%"=="3" goto shutdown
if "%adv_choice%"=="4" goto cancelshutdown
if "%adv_choice%"=="5" goto bios
if "%adv_choice%"=="6" goto safemode
if "%adv_choice%"=="7" goto debloat
if "%adv_choice%"=="8" goto wifi_pwd
if "%adv_choice%"=="9" goto enable_updates
if "%adv_choice%"=="10" goto disable_updates
if "%adv_choice%"=="11" goto change_dns
if "%adv_choice%"=="12" goto clean_gamers_cache
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
echo %GREEN%[4]%RESET% %GREEN%Enable Telemetry (Windows Tracking)%RESET%
echo %RED%[5]%RESET% %RED%Disable Telemetry (Windows Tracking)%RESET%
echo %WHITE%[6]%RESET% Fix Windows Defender
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p sec_choice=%YELLOW%Enter your choice: %RESET%
if "%sec_choice%"=="1" goto quickscan
if "%sec_choice%"=="2" goto fullscan
if "%sec_choice%"=="3" goto firewall_reset
if "%sec_choice%"=="4" goto enable_telemetry
if "%sec_choice%"=="5" goto disable_telemetry
if "%sec_choice%"=="6" goto fix_defender
if "%sec_choice%"=="0" goto menu
goto menu_security

:menu_drivers
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                 Drivers Manager%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Check ^& Install Driver Updates
echo %GREEN%[2]%RESET% %GREEN%Backup All Installed Drivers%RESET%
echo %YELLOW%[3]%RESET% %YELLOW%Restore Drivers From Backup%RESET%
echo %RED%[4]%RESET% %RED%Uninstall Specific Driver (Silent Uninstaller)%RESET%
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p drv_choice=%YELLOW%Enter your choice: %RESET%
if "%drv_choice%"=="1" goto driver_updater
if "%drv_choice%"=="2" goto backup_drivers
if "%drv_choice%"=="3" goto restore_drivers
if "%drv_choice%"=="4" goto drivers_uninstaller_wizard
if "%drv_choice%"=="0" goto menu
goto menu_drivers

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
for /d %%p in ("%temp%\*") do rmdir /s /q "%%p"
cleanmgr /sagerun:1
echo.
echo %GREEN%[✓] Cleaning completed successfully, enjoy!%RESET%
echo.
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
pause
goto menu_optimize

:quick_optimize
cls
echo %YELLOW%Running Full Repair (DISM, SFC, Temp, Internet, Cleanup)...%RESET%
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
del /q /f /s C:\Windows\Prefetch\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%temp%\*"
for /d %%p in ("%temp%\*") do rmdir /s /q "%%p"
cleanmgr /sagerun:1
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
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
net stop cryptsvc
net stop msiserver
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv
net start bits
net start cryptsvc
net start msiserver
UsoClient StartInteractiveScan
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
powershell -Command "Get-AppxPackage Microsoft.Xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *skypeapp* | Remove-AppxPackage"
echo %GREEN%[✓] Windows Debloat Completed.%RESET%
pause
goto menu_advanced

:disable_telemetry
cls
echo %YELLOW%Disabling Windows Telemetry and Data Collection...%RESET%

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1

echo.
echo %GREEN%[✓] Telemetry and Tracking disabled successfully.%RESET%
pause
goto menu_security

:enable_telemetry
cls
echo %YELLOW%Enabling Windows Telemetry and Data Collection...%RESET%
echo.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 1 /f >nul 2>&1
sc config DiagTrack start= auto >nul 2>&1
net start DiagTrack >nul 2>&1

echo.
echo %GREEN%[✓] Telemetry and Tracking services restored to default.%RESET%
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
Get-AppxPackage Microsoft.Windows.SecHealthUI | ForEach {
Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"
}
echo %GREEN%[✓] Windows Defender has been reset successfully.%RESET%
pause
goto menu_security

:clean_dumps
cls
echo %YELLOW%Cleaning Windows Crash Dumps and Error Logs...%RESET%
del /f /q /s %systemroot%\Minidump\* >nul 2>&1
del /f /q /s %systemroot%\MEMORY.DMP >nul 2>&1
del /f /q "%systemroot%\Logs\CBS\*.cab" >nul 2>&1
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
UsoClient StartInteractiveScan

echo %GREEN%[✓] Windows Update services have been restored to default.%RESET%
echo.
pause
goto menu_advanced

:driver_updater
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%               Driver Update Wizard%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Checking for available driver updates... Please wait...%RESET%
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "if (-not (Get-Module -ListAvailable -Name Get-Module -ListAvailable PSWindowsUpdate)) { Install-Module -Name Get-Module -ListAvailable PSWindowsUpdate -Force -SkipPublisherCheck -AllowClobber }" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "$updates = Get-WindowsUpdate; [array]$drivers = $updates | Where-Object { $_.Categories -match 'Driver' -or $_.Title -match 'Driver' }; if ($drivers.Count -gt 0) { $i = 1; foreach ($d in $drivers) { Write-Host \"[$i] $($d.Title)\"; $i++ }; exit 0 } else { Write-Host 'All drivers are fully up to date!' -ForegroundColor Green; exit 1 }"

if %errorlevel% equ 1 (
    echo.
    pause
    goto menu_drivers
)

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Options:%RESET%
echo %WHITE%[A]%RESET% Update %GREEN%ALL%RESET% available drivers
echo %WHITE%[0]%RESET% Back to Main Menu
echo %CYAN%----------------------------------------------------%RESET%
echo.

set /p drv_sel=%YELLOW%Enter Driver Index Number or (A) for All: %RESET%

if /i "%drv_sel%"=="0" goto menu_drivers

if /i "%drv_sel%"=="A" (
    echo.
    echo %YELLOW%Updating ALL drivers... This might take a while.%RESET%
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$updates = Get-WindowsUpdate; [array]$drivers = $updates | Where-Object { $_.Categories -match 'Driver' -or $_.Title -match 'Driver' }; if ($drivers.Count -gt 0) { $drivers | Install-WindowsUpdate -AcceptAll -AutoReboot:$false }"
    echo.
    echo %GREEN%[✓] All drivers updated successfully!%RESET%
    pause
    goto menu_drivers
)

echo.
echo %YELLOW%Preparing to install the selected driver...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass -Command "$idx = [int]'%drv_sel%' - 1; $updates = Get-WindowsUpdate; [array]$drivers = $updates | Where-Object { $_.Categories -match 'Driver' -or $_.Title -match 'Driver' }; if ($drivers[$idx]) { Write-Host \"Installing: $($drivers[$idx].Title)\" -ForegroundColor Yellow; Install-WindowsUpdate -UpdateID $drivers[$idx].UpdateID -AcceptAll -AutoReboot:$false } else { Write-Host 'Invalid Selection' -ForegroundColor Red }"
echo.
echo %GREEN%[✓] Selected driver installation attempt completed.%RESET%
echo.
pause
goto menu_drivers

:backup_drivers
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%               Drivers Backup Wizard%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Creating a complete backup of your drivers...%RESET%
echo %WHITE%Please wait, this might take a minute or two...%RESET%
echo.

if not exist "D:\Drivers_Backup" mkdir "D:\Drivers_Backup"

dism /online /export-driver /destination:"D:\Drivers_Backup"

if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[✓] Drivers Backup Created Successfully!%RESET%
    echo %WHITE%Saved to: %YELLOW%D:\Drivers_Backup%RESET%
) else (
    echo.
    echo %RED%[X] Failed to backup drivers.%RESET%
    echo %YELLOW%Hint: Ensure you have enough space on Drive D:%RESET%
)
echo.
pause
goto menu_drivers


:restore_drivers
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%               Drivers Restore Wizard%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Restoring all drivers from backup...%RESET%
echo %WHITE%Windows will scan and install your backed up drivers...%RESET%
echo.

if not exist "D:\Drivers_Backup" (
    echo %RED%[X] Error: Backup folder not found at D:\Drivers_Backup%RESET%
    echo %YELLOW%Please make sure the backup folder exists.%RESET%
    echo.
    pause
    goto menu_drivers
)

pnputil /add-driver "D:\Drivers_Backup\*.inf" /subdirs /install /reboot

echo.
echo %GREEN%[✓] Drivers Restoration Process Completed!%RESET%
echo %WHITE%If some drivers require a restart, your PC might prompt you.%RESET%
echo.
pause
goto menu_drivers

:drivers_uninstaller_wizard
cls
echo %CYAN%====================================================%RESET%
echo %RED%               Drivers Silent Uninstaller%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Loading third-party installed drivers... Please wait...%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

for /f "tokens=*" %%a in ('pnputil /enum-drivers') do (
    echo %%a
    echo %%a | findstr /i "version الإصدار Version" >nul && (
        echo %CYAN%----------------------------------------------------%RESET%
    )
)

echo.
echo %CYAN%====================================================%RESET%
echo %WHITE%Please look at the list above and find the %GREEN%Published Name%WHITE% of the driver.%RESET%
echo %WHITE%Example: %CYAN%oem12.inf%WHITE% or %CYAN%oem5.inf%RESET%
echo %RED%[0] Cancel and Back%RESET%
echo %CYAN%====================================================%RESET%
echo.
set /p "target_driver=%YELLOW%Enter Driver Published Name (e.g., oemXX.inf): %RESET%"

if "%target_driver%"=="0" goto menu_drivers
if "%target_driver%"=="" goto drivers_uninstaller_wizard

echo.
echo %RED%[!] Uninstalling and deleting driver %target_driver%...%RESET%
pnputil /delete-driver "%target_driver%" /uninstall /force
if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[✓] Driver %target_driver% Uninstalled and Deleted Successfully!%RESET%
) else (
    echo.
    echo %RED%[X] Failed to delete driver. Make sure you typed the correct oemXX.inf name.%RESET%
)
pause
goto menu_drivers

:create_restore_point
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%             System Restore Point Creator%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Creating a System Restore Point... Please wait...%RESET%
echo %WHITE%This ensures you can revert changes if anything goes wrong.%RESET%
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "Enable-ComputerRestore -Drive 'C:\'" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'WinRTP_Auto_Backup' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1

if %errorlevel% equ 0 (
    echo %GREEN%[✓] Restore Point [WinRTP_Auto_Backup] Created Successfully!%RESET%
) else (
    echo %RED%[X] Failed to create Restore Point.%RESET%
    echo %YELLOW%Hint: Ensure System Protection is enabled in Windows settings.%RESET%
)

echo.
pause
goto menu

:change_dns
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                 DNS Changer Wizard%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %GREEN%[1]%RESET% Cloudflare DNS %CYAN%(1.1.1.1 / 1.0.0.1)%RESET%    - Best for Gaming
echo %GREEN%[2]%RESET% Google DNS %CYAN%(8.8.8.8 / 8.8.4.4)%RESET%        - Best for Browsing
echo %GREEN%[3]%RESET% Quad9 DNS %CYAN%(9.9.9.9 / 149.112.112.112)%RESET% - Best for Security
echo %GREEN%[4]%RESET% AdGuard DNS %CYAN%(94.140.14.14 / 94.140.15.15)%RESET% - Best for Blocking Ads
echo %WHITE%[5]%RESET% Restore Default DNS %CYAN%(Automatic / DHCP)%RESET% - Reset to Normal
echo.
echo %RED%[0]%RESET% Back to Advanced Tools Menu
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p "dns_ch=%YELLOW%Choose DNS Option: %RESET%"

if "%dns_ch%"=="0" goto menu_advanced
if "%dns_ch%"=="1" goto set_cloudflare
if "%dns_ch%"=="2" goto set_google
if "%dns_ch%"=="3" goto set_quad9
if "%dns_ch%"=="4" goto set_adguard
if "%dns_ch%"=="5" goto set_default
goto change_dns

:set_cloudflare
echo.
echo %YELLOW%Applying Cloudflare DNS...%RESET%
netsh interface ip set dns name="Wi-Fi" source=static address=1.1.1.1 >nul 2>&1
netsh interface ip add dns name="Wi-Fi" addr=1.0.0.1 index=2 >nul 2>&1
netsh interface ip set dns name="Ethernet" source=static address=1.1.1.1 >nul 2>&1
netsh interface ip add dns name="Ethernet" addr=1.0.0.1 index=2 >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[✓] Cloudflare DNS Applied Successfully!%RESET%
pause
goto change_dns

:set_google
echo.
echo %YELLOW%Applying Google DNS...%RESET%
netsh interface ip set dns name="Wi-Fi" source=static address=8.8.8.8 >nul 2>&1
netsh interface ip add dns name="Wi-Fi" addr=8.8.4.4 index=2 >nul 2>&1
netsh interface ip set dns name="Ethernet" source=static address=8.8.8.8 >nul 2>&1
netsh interface ip add dns name="Ethernet" addr=8.8.4.4 index=2 >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[✓] Google DNS Applied Successfully!%RESET%
pause
goto change_dns

:set_quad9
echo.
echo %YELLOW%Applying Quad9 Secure DNS...%RESET%
netsh interface ip set dns name="Wi-Fi" source=static address=9.9.9.9 >nul 2>&1
netsh interface ip add dns name="Wi-Fi" addr=149.112.112.112 index=2 >nul 2>&1
netsh interface ip set dns name="Ethernet" source=static address=9.9.9.9 >nul 2>&1
netsh interface ip add dns name="Ethernet" addr=149.112.112.112 index=2 >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[✓] Quad9 Secure DNS Applied Successfully!%RESET%
pause
goto change_dns

:set_adguard
echo.
echo %YELLOW%Applying AdGuard DNS (Ad-Block)...%RESET%
netsh interface ip set dns name="Wi-Fi" source=static address=94.140.14.14 >nul 2>&1
netsh interface ip add dns name="Wi-Fi" addr=94.140.15.15 index=2 >nul 2>&1
netsh interface ip set dns name="Ethernet" source=static address=94.140.14.14 >nul 2>&1
netsh interface ip add dns name="Ethernet" addr=94.140.15.15 index=2 >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[✓] AdGuard DNS Applied! Ads will be blocked.%RESET%
pause
goto change_dns

:set_default
echo.
echo %YELLOW%Restoring Default DNS Settings (DHCP)...%RESET%
netsh interface ip set dns name="Wi-Fi" source=dhcp >nul 2>&1
netsh interface ip set dns name="Ethernet" source=dhcp >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[✓] DNS Restored to Default Successfully!%RESET%
pause
goto change_dns

:clean_gamers_cache
cls
echo %YELLOW%Cleaning Gaming & Apps Cache...%RESET%
if exist "%appdata%\Discord\Cache" del /q /f /s "%appdata%\Discord\Cache\*" >nul 2>&1
if exist "%localappdata%\Steam\htmlcache" del /q /f /s "%localappdata%\Steam\htmlcache\*" >nul 2>&1
if exist "%localappdata%\EpicGamesLauncher\Saved\webcache" del /q /f /s "%localappdata%\EpicGamesLauncher\Saved\webcache\*" >nul 2>&1
del /q /f /s "%localappdata%\D3DSCache\*" >nul 2>&1
echo %GREEN%[✓] Gaming Cache Cleaned Successfully!%RESET%
pause
goto menu_advanced

:menu_apps
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%       Silent Applications Installer ^& Manager%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %GREEN%[1]%RESET% %GREEN%Update Installed Programs (Interactive Wizard)%RESET%
echo %GREEN%[2]%RESET% %RED%Uninstall Installed Programs (Silent Uninstaller)%RESET%
echo %GREEN%[3]%RESET% %YELLOW%Microsoft .NET Framework Full%RESET%
echo %GREEN%[4]%RESET% %YELLOW%Microsoft DirectX Runtime%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[5]%RESET% Google Chrome                  %GREEN%[11]%RESET% WinRAR
echo %GREEN%[6]%RESET% Mozilla Firefox                %GREEN%[12]%RESET% 7-Zip
echo %GREEN%[7]%RESET% Internet Download Manager      %GREEN%[13]%RESET% Visual Studio Code
echo %GREEN%[8]%RESET% Discord                        %GREEN%[14]%RESET% Steam
echo %GREEN%[9]%RESET% Zoom                           %GREEN%[15]%RESET% Epic Games Launcher
echo %GREEN%[10]%RESET% WhatsApp Desktop              %GREEN%[16]%RESET% OBS Studio
echo                                    %GREEN%[17]%RESET% VLC Media Player
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[S]%RESET% %CYAN%Search ^& Install Custom App (Write App Name)%RESET%
echo %YELLOW%[A] Install ALL Basic Apps (5, 7, 11, 12, 17)%RESET%
echo %RED%[0] Back to Main Menu%RESET%
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p "app_ch=%YELLOW%Choose Option Number: %RESET%"

if "%app_ch%"=="0" goto menu
if /i "%app_ch%"=="a" goto install_all_apps
if /i "%app_ch%"=="s" goto search_install_app
if "%app_ch%"=="1" goto apps_updater_wizard
if "%app_ch%"=="2" goto apps_uninstaller_wizard

if "%app_ch%"=="3" set "app_id=Microsoft.DotNet.Framework.DeveloperPack_4" & goto install_silent
if "%app_ch%"=="4" set "app_id=Microsoft.DirectX" & goto install_silent
if "%app_ch%"=="5" set "app_id=Google.Chrome" & goto install_silent
if "%app_ch%"=="6" set "app_id=Mozilla.Firefox" & goto install_silent
if "%app_ch%"=="7" set "app_id=Tonec.InternetDownloadManager" & goto install_silent
if "%app_ch%"=="8" set "app_id=Discord.Discord" & goto install_silent
if "%app_ch%"=="9" set "app_id=Zoom.Zoom" & goto install_silent
if "%app_ch%"=="10" set "app_id=WhatsApp.WhatsApp" & goto install_silent
if "%app_ch%"=="11" set "app_id=RARLab.WinRAR" & goto install_silent
if "%app_ch%"=="12" set "app_id=7zip.7zip" & goto install_silent
if "%app_ch%"=="13" set "app_id=Microsoft.VisualStudioCode" & goto install_silent
if "%app_ch%"=="14" set "app_id=Valve.Steam" & goto install_silent
if "%app_ch%"=="15" set "app_id=EpicGames.EpicGamesLauncher" & goto install_silent
if "%app_ch%"=="16" set "app_id=OBSProject.OBSStudio" & goto install_silent
if "%app_ch%"=="17" set "app_id=VideoLAN.VLC" & goto install_silent
goto menu_apps

:install_silent
echo.
echo %YELLOW%Installing %app_id% Silently... Please wait...%RESET%
winget install --id "%app_id%" --silent --accept-source-agreements --accept-package-agreements
if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[✓] Installed Successfully!%RESET%
) else (
    echo.
    echo %RED%[X] Failed to install or already installed.%RESET%
)
pause
goto menu_apps

:install_all_apps
cls
echo %YELLOW%Installing All Basic Apps (Chrome, IDM, VLC, WinRAR, 7-Zip)...%RESET%
echo %WHITE%This will take a few minutes, please don't close the window...%RESET%
echo.
for %%g in (Google.Chrome Tonec.InternetDownloadManager VideoLAN.VLC RARLab.WinRAR 7zip.7zip) do (
    echo %YELLOW%Installing: %%g...%RESET%
    winget install --id "%%g" --silent --accept-source-agreements --accept-package-agreements >nul 2>&1
)
echo.
echo %GREEN%[✓] All Basic Apps Installed Successfully!%RESET%
pause
goto menu_apps


:apps_uninstaller_wizard
cls
echo %CYAN%====================================================%RESET%
echo %RED%             Applications Silent Uninstaller%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Loading installed applications list... Please wait...%RESET%
echo.

winget list
echo.
echo %CYAN%====================================================%RESET%
echo %WHITE%Please copy and paste the %GREEN%ID%WHITE% or %GREEN%Name%WHITE% of the app you want to delete from the list above.%RESET%
echo %WHITE%Example: %CYAN%Google.Chrome%WHITE% or %CYAN%EpicGamesLauncher%RESET%
echo %RED%[0] Cancel and Back%RESET%
echo %CYAN%====================================================%RESET%
echo.
set /p "un_app_id=%YELLOW%Enter App ID or Name to UNINSTALL: %RESET%"

if "%un_app_id%"=="0" goto menu_apps
if "%un_app_id%"=="" goto apps_uninstaller_wizard

echo.
echo %RED%[!] Uninstalling %un_app_id% from its roots... Please wait...%RESET%

winget uninstall --id "%un_app_id%" --silent --purge
if %errorlevel% neq 0 (
    winget uninstall "%un_app_id%" --silent --purge
)

if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[✓] %un_app_id% Uninstalled and Cleaned Successfully!%RESET%
) else (
    echo.
    echo %RED%[X] Failed to uninstall. Please make sure you copied the Name/ID correctly.%RESET%
)
pause
goto menu_apps


:apps_updater_wizard
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%             Applications Updater Wizard%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Checking for available updates... Please wait...%RESET%
echo.

winget upgrade
echo.
echo %CYAN%====================================================%RESET%
echo %GREEN%[1]%RESET% Update ALL Apps Automatically
echo %GREEN%[2]%RESET% Update a Specific App (By entering its ID)
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%====================================================%RESET%
echo.
set /p "up_choice=%YELLOW%Enter your choice: %RESET%"

if "%up_choice%"=="0" goto menu_apps
if "%up_choice%"=="" goto menu_apps

if "%up_choice%"=="1" (
    echo.
    echo %YELLOW%Updating ALL applications silently...%RESET%
    winget upgrade --all --silent --accept-source-agreements --accept-package-agreements
    echo.
    echo %GREEN%[✓] Bulk Update Process Completed!%RESET%
    pause
    goto menu_apps
)

if "%up_choice%"=="2" (
    echo.
    echo %WHITE%Please copy and paste the %GREEN%ID%WHITE% of the app you want to update from the list above.%RESET%
    echo %WHITE%Example: %CYAN%Google.Chrome%RESET%
    echo.
    set /p "single_up_id=%YELLOW%Enter App ID: %RESET%"
    
    if "%single_up_id%"=="" goto apps_updater_wizard
    
    echo.
    echo %YELLOW%Updating %single_up_id% Silently...%RESET%
    winget upgrade --id "%single_up_id%" --silent --accept-source-agreements --accept-package-agreements
    if %errorlevel% equ 0 (
        echo.
        echo %GREEN%[✓] %single_up_id% Updated Successfully!%RESET%
    ) else (
        echo.
        echo %RED%[X] Failed to update. Please check if the ID is correct.%RESET%
    )
    pause
)
goto apps_updater_wizard

:search_install_app
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%          Search ^& Install Custom Application%RESET%
echo %CYAN%====================================================%RESET%
echo.
set /p "custom_app=%YELLOW%Type the name of the app you want to search: %RESET%"

if "%custom_app%"=="" goto menu_apps

echo.
echo %YELLOW%Searching for "%custom_app%" in Microsoft Database...%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

winget search "%custom_app%"
if %errorlevel% neq 0 (
    echo.
    echo %RED%[X] No applications found with the name "%custom_app%".%RESET%
    pause
    goto menu_apps
)

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%To install, please copy and paste the %GREEN%ID%WHITE% of the app from the list above.%RESET%
echo %WHITE%Example: %CYAN%Google.Chrome%WHITE% or %CYAN%Brave.Brave%RESET%
echo %RED%[0] Cancel and Back%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

set /p "app_id_choice=%YELLOW%Enter the App ID to Install: %RESET%"

if "%app_id_choice%"=="0" goto menu_apps
if "%app_id_choice%"=="" goto menu_apps

echo.
echo %YELLOW%Installing %app_id_choice% Silently... Please wait...%RESET%
winget install --id "%app_id_choice%" --silent --accept-source-agreements --accept-package-agreements

if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[✓] %app_id_choice% Installed Successfully!%RESET%
) else (
    echo.
    echo %RED%[X] Failed to install. Please make sure you copied the ID correctly.%RESET%
)
pause
goto menu_apps

:UPDATE
cls
echo =========================================
echo           CHECKING FOR UPDATES
echo =========================================
echo.
setlocal EnableDelayedExpansion

set CURRENT_VERSION=1.3
set VERSION_URL=https://raw.githubusercontent.com/newmatrix/WinRTP/main/Version.txt
set TOOL_URL=https://raw.githubusercontent.com/newmatrix/WinRTP/main/WindowsRepairToolPro.bat

set TEMP_VERSION=%temp%\Version.txt
set NEW_FILE=%temp%\WindowsRepairToolPro_New.bat
set UPDATER=%temp%\Updater.bat

if exist "%TEMP_VERSION%" del "%TEMP_VERSION%" >nul 2>&1

powershell -Command "(New-Object Net.WebClient).DownloadFile('%VERSION_URL%', '%TEMP_VERSION%')" >nul 2>&1

if exist "%TEMP_VERSION%" (
    set ONLINE_VERSION=
    for /f "delims=" %%i in ('type "%TEMP_VERSION%"') do (
        set ONLINE_VERSION=%%i
    )
    set ONLINE_VERSION=!ONLINE_VERSION: =!

    if "!ONLINE_VERSION!"=="" (
        echo %RED%[X] Error: Received empty version file from server.%RESET%
        pause
        goto menu
    )

    echo Current Version : %CURRENT_VERSION%
    echo Server Version  : !ONLINE_VERSION!
    echo.

    if "!ONLINE_VERSION!"=="%CURRENT_VERSION%" (
        echo %GREEN%You already have the latest version.%RESET%
        echo.
        pause
        goto menu
    )

    echo %YELLOW%New version [!ONLINE_VERSION!] found!%RESET%
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

        echo %GREEN%Update installed successfully!%RESET%
        echo Restarting tool...
        timeout /t 2 >nul
        start "" "%UPDATER%"
        exit
    )
)

echo %RED%Failed to check for updates (Connection Error).%RESET%
pause
goto menu

:about
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%                 About Developer%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Developer:%RESET% Hesham Taha
echo %WHITE%YouTube:%RESET% Hesham Taha
echo %WHITE%Facebook:%RESET% Hesham Taha Official
echo %WHITE%Version:%RESET% 1.3
echo.

echo %YELLOW%Opening links...%RESET%

timeout /t 2 >nul

start "" "https://www.youtube.com/@heshamtaha1"
start "" "https://facebook.com/HeshamTahaOfficial"

pause
goto menu
