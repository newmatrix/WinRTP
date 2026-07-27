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
call :AUTO_UPDATE
:menu
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%            Windows Repair Tool Pro v1.5%RESET%
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
echo %WHITE%[8]%RESET% Windows Maintenance Tools
echo %WHITE%[9]%RESET% User Accounts Manager
echo %WHITE%[10]%RESET% Windows Tweaks (Performance ^& UI)
echo.
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
if "%choice%"=="8" goto menu_maintenance
if "%choice%"=="9" goto menu_users
if "%choice%"=="10" goto menu_tweaks

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
echo %WHITE%[2]%RESET% Clean Component Store (WinSxS Deep Clean)
echo %WHITE%[3]%RESET% Clean Old Windows Updates (Windows.old)
echo %WHITE%[4]%RESET% Clean Crash Dumps Files
echo %WHITE%[5]%RESET% Run SFC Scan
echo %WHITE%[6]%RESET% Clean Temporary ^& Junk Files
echo %WHITE%[7]%RESET% Optimize Internet ^& DNS
echo %WHITE%[8]%RESET% Clear Event Viewer Logs
echo %WHITE%[9]%RESET% Clear Error Logs ^& Crash Reports
echo %WHITE%[10]%RESET% Clear GPU Cache (NVIDIA ^& AMD)
echo %WHITE%[11]%RESET% Deep RAM Optimizer (via RAMMap)
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[12]%RESET% %GREEN%Safe and quick cleaning (1, 5, 6, 7)%RESET%
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
if "%opt_choice%"=="8" goto clean_events
if "%opt_choice%"=="9" goto clean_delivery
if "%opt_choice%"=="10" goto clear_gpu_cache
if "%opt_choice%"=="11" goto rammap_optimizer
if "%opt_choice%"=="12" goto quick_optimize
if "%opt_choice%"=="0" goto menu
goto menu_optimize

:menu_disk
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                   Disk Tools%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Schedule CHKDSK Scan
echo %WHITE%[2]%RESET% Stop Scheduled CHKDSK Scan
echo %WHITE%[3]%RESET% Smart Disk Optimization (Defrag / TRIM)
echo %WHITE%[4]%RESET% Check Disk Health (S.M.A.R.T Status)
echo %WHITE%[5]%RESET% View Disk Storage Information
echo %YELLOW%[6]%RESET% %YELLOW%Secure Wipe Free Space (Anti-Recovery)%RESET%
echo %WHITE%[7]%RESET% Disk Speed Test (Benchmark)
echo %WHITE%[8]%RESET% USB/Drive Virus Rescue (Unhide Files)
echo %WHITE%[9]%RESET% USB Write Protection Fixer (Deep Fix)
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p disk_choice=%YELLOW%Enter your choice: %RESET%

if "%disk_choice%"=="1" goto chkdsk
if "%disk_choice%"=="2" goto cancelchk
if "%disk_choice%"=="3" goto defrag
if "%disk_choice%"=="4" goto smart_check
if "%disk_choice%"=="5" goto disk_info
if "%disk_choice%"=="6" goto secure_wipe
if "%disk_choice%"=="7" goto disk_speed
if "%disk_choice%"=="8" goto usb_rescue
if "%disk_choice%"=="9" goto write_protect_fix
if "%disk_choice%"=="0" goto menu
goto menu_disk

:menu_advanced
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                 Advanced Tools%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %GREEN%[1]%RESET% %GREEN%Enable Ultimate Performance%RESET%     
echo %RED%[2]%RESET% %RED%Restore Balanced Mode%RESET%           
echo %WHITE%[3]%RESET% Schedule Auto Shutdown           
echo %WHITE%[4]%RESET% Cancel Auto Shutdown             
echo %WHITE%[5]%RESET% Restart to BIOS/UEFI            
echo %RED%[6]%RESET% %RED%Restart to Safe Mode %RESET%
echo %GREEN%[7]%RESET% %GREEN%Back to Normal Windows %RESET%          
echo %WHITE%[8]%RESET% Debloat Windows (Remove Junk)
echo %WHITE%[9]%RESET% Show WI-FI Passwords
echo %RED%[10]%RESET% %RED%Disable Windows Update%RESET%
echo %GREEN%[11]%RESET% %GREEN%Enable Windows Update%RESET%
echo %WHITE%[12]%RESET% Change Internet DNS (Gaming)
echo %WHITE%[13]%RESET% Clean Gamers Cache (Steam, EA..)
echo %WHITE%[14]%RESET% Extract Original Windows Key (OEM)
echo %WHITE%[15]%RESET% Context Menu Manager (Right-Click Tools)
echo %WHITE%[16]%RESET% BSOD Log Analyzer (Blue Screen)
echo %YELLOW%[17]%RESET% %YELLOW%Full System Backup (OS, Apps ^& Drivers)%RESET%
echo %YELLOW%[18]%RESET% %YELLOW%Block App Internet Access%RESET%
echo.
echo %RED%[0]%RESET% Back to Main Menu
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p adv_choice=%YELLOW%Enter your choice: %RESET%

if "%adv_choice%"=="1" goto ultimate_perf
if "%adv_choice%"=="2" goto restore_balanced
if "%adv_choice%"=="3" goto shutdown
if "%adv_choice%"=="4" goto cancelshutdown
if "%adv_choice%"=="5" goto bios
if "%adv_choice%"=="6" goto safemode
if "%adv_choice%"=="7" goto normalmode
if "%adv_choice%"=="8" goto debloat
if "%adv_choice%"=="9" goto wifi_pwd
if "%adv_choice%"=="10" goto disable_updates
if "%adv_choice%"=="11" goto enable_updates
if "%adv_choice%"=="12" goto change_dns
if "%adv_choice%"=="13" goto clean_gamers_cache
if "%adv_choice%"=="14" goto extract_oem_key
if "%adv_choice%"=="15" goto context_menu_mgr
if "%adv_choice%"=="16" goto bsod_analyzer
if "%adv_choice%"=="17" goto full_system_backup
if "%adv_choice%"=="18" goto menu_firewall_manager
if "%adv_choice%"=="0" goto menu
goto menu_advanced

:menu_repair
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                   Repair OS%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Deep Repair Windows Update
echo %WHITE%[2]%RESET% Repair Store ^& Default Apps
echo %WHITE%[3]%RESET% Rebuild Icons ^& Thumbnails
echo %WHITE%[4]%RESET% Fix Taskbar, Search ^& Explorer
echo %WHITE%[5]%RESET% Fix Audio Services
echo %WHITE%[6]%RESET% Fix Bluetooth Services
echo %WHITE%[7]%RESET% Fix Printer ^& Spooler
echo %WHITE%[8]%RESET% Restart Core Services
echo.
echo %RED%[0]%RESET% Back to Main Menu
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p rep_choice=%YELLOW%Enter your choice: %RESET%

if "%rep_choice%"=="1" goto winupdate
if "%rep_choice%"=="2" goto store_apps
if "%rep_choice%"=="3" goto icons_thumbs
if "%rep_choice%"=="4" goto taskbar_search
if "%rep_choice%"=="5" goto fix_audio
if "%rep_choice%"=="6" goto fix_bluetooth
if "%rep_choice%"=="7" goto fix_printer
if "%rep_choice%"=="8" goto restart_services
if "%rep_choice%"=="0" goto menu
goto menu_repair

:menu_security
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%               Security ^& Privacy%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Quick Virus Scan          
echo %WHITE%[2]%RESET% Full Virus Scan           
echo %YELLOW%[3]%RESET% %YELLOW%Offline Virus Scan (Rootkits, Trojan) (Restart require)%RESET%        
echo %WHITE%[4]%RESET% Clear Defender History    
echo %WHITE%[5]%RESET% Deep Repair Windows Defender
echo %WHITE%[6]%RESET% Reset Windows Firewall
echo %WHITE%[7]%RESET% Reset Hosts File (Fix Network)
echo %RED%[8]%RESET% %RED%Disable Windows Telemetry%RESET%
echo %GREEN%[9]%RESET% %GREEN%Enable Windows Telemetry%RESET%
echo.
echo %RED%[0]%RESET% Back to Main Menu
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p sec_choice=%YELLOW%Enter your choice: %RESET%

if "%sec_choice%"=="1" goto quickscan
if "%sec_choice%"=="2" goto fullscan
if "%sec_choice%"=="3" goto offlinescan
if "%sec_choice%"=="4" goto clear_defender_history
if "%sec_choice%"=="5" goto fix_defender
if "%sec_choice%"=="6" goto firewall_reset
if "%sec_choice%"=="7" goto reset_hosts
if "%sec_choice%"=="8" goto disable_telemetry
if "%sec_choice%"=="9" goto enable_telemetry
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

:menu_maintenance
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%             Windows Maintenance Tools%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Task Manager             %WHITE%[16]%RESET% Temp Folder
echo %WHITE%[2]%RESET% Services Manager         %WHITE%[17]%RESET% Advanced System Settings
echo %WHITE%[3]%RESET% Device Manager           %WHITE%[18]%RESET% Windows Memory Diagnostic
echo %WHITE%[4]%RESET% Disk Cleanup             %WHITE%[19]%RESET% Disk Management
echo %WHITE%[5]%RESET% MSCONFIG                 %WHITE%[20]%RESET% Computer Management
echo %WHITE%[6]%RESET% Registry Editor          %WHITE%[21]%RESET% Group Policy (gpedit)
echo %WHITE%[7]%RESET% Startup Apps Folder      %WHITE%[22]%RESET% Power Options
echo %WHITE%[8]%RESET% Resource Monitor         %WHITE%[23]%RESET% Sound Control Panel
echo %WHITE%[9]%RESET% Event Viewer             %WHITE%[24]%RESET% Network Connections
echo %WHITE%[10]%RESET% Reliability Monitor     %WHITE%[25]%RESET% Task Scheduler
echo %WHITE%[11]%RESET% Windows Tools           %WHITE%[26]%RESET% Advanced Firewall (wf.msc)
echo %WHITE%[12]%RESET% Programs and Features   %WHITE%[27]%RESET% Local Users ^& Groups
echo %WHITE%[13]%RESET% Network Reset           %WHITE%[28]%RESET% User Accounts (netplwiz)
echo %WHITE%[14]%RESET% DirectX Diagnostic      %WHITE%[29]%RESET% Performance Monitor
echo %WHITE%[15]%RESET% System Information      %WHITE%[30]%RESET% Windows Update Settings
echo.
echo %RED%[0]%RESET% Back to Main Menu
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p maintenance_choice=%YELLOW%Enter your choice: %RESET%

if "%maintenance_choice%"=="1" goto open_taskmgr
if "%maintenance_choice%"=="2" goto open_services
if "%maintenance_choice%"=="3" goto open_devicemgr
if "%maintenance_choice%"=="4" goto open_diskcleanup
if "%maintenance_choice%"=="5" goto open_msconfig
if "%maintenance_choice%"=="6" goto open_regedit
if "%maintenance_choice%"=="7" goto open_startup
if "%maintenance_choice%"=="8" goto open_resmon
if "%maintenance_choice%"=="9" goto open_eventviewer
if "%maintenance_choice%"=="10" goto open_reliability
if "%maintenance_choice%"=="11" goto open_wintools
if "%maintenance_choice%"=="12" goto open_programs
if "%maintenance_choice%"=="13" goto open_networkreset
if "%maintenance_choice%"=="14" goto open_dxdiag
if "%maintenance_choice%"=="15" goto open_sysinfo
if "%maintenance_choice%"=="16" goto open_temp
if "%maintenance_choice%"=="17" goto open_advancedsys
if "%maintenance_choice%"=="18" goto open_memorydiag
if "%maintenance_choice%"=="19" goto open_diskmgmt
if "%maintenance_choice%"=="20" goto open_compmgmt
if "%maintenance_choice%"=="21" goto open_gpedit
if "%maintenance_choice%"=="22" goto open_powercfg
if "%maintenance_choice%"=="23" goto open_soundcpl
if "%maintenance_choice%"=="24" goto open_ncpa
if "%maintenance_choice%"=="25" goto open_taskschd
if "%maintenance_choice%"=="26" goto open_firewall
if "%maintenance_choice%"=="27" goto open_lusrmgr
if "%maintenance_choice%"=="28" goto open_netplwiz
if "%maintenance_choice%"=="29" goto open_perfmon
if "%maintenance_choice%"=="30" goto open_wusettings
if "%maintenance_choice%"=="0" goto menu
goto menu_maintenance

:menu_users
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%               User Accounts Manager%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Add New User Account
echo %RED%[2]%RESET% %RED%Delete User Account%RESET%
echo %YELLOW%[3]%RESET% %YELLOW%Rename User Account (Change Username)%RESET%
echo %WHITE%[4]%RESET% Change Existing User Password
echo %WHITE%[5]%RESET% Grant Administrator Privileges
echo %WHITE%[6]%RESET% Revoke Administrator Privileges (Demote to Standard)
echo %WHITE%[7]%RESET% Hide Account from Login Screen (Secret Account)
echo %WHITE%[8]%RESET% Show Hidden Account on Login Screen
echo %WHITE%[9]%RESET% Freeze / Unfreeze User Account (Disable/Enable)
echo %WHITE%[10]%RESET% Toggle Built-in Administrator (Enable/Disable)
echo %WHITE%[11]%RESET% View Detailed User Information
echo %RED%[0]%RESET% Back to Main Menu
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p usr_choice=%YELLOW%Enter your choice: %RESET%

if "%usr_choice%"=="1" goto add_user
if "%usr_choice%"=="2" goto delete_user
if "%usr_choice%"=="3" goto rename_user
if "%usr_choice%"=="4" goto change_password
if "%usr_choice%"=="5" goto grant_admin
if "%usr_choice%"=="6" goto revoke_admin
if "%usr_choice%"=="7" goto hide_account
if "%usr_choice%"=="8" goto unhide_account
if "%usr_choice%"=="9" goto toggle_user_status
if "%usr_choice%"=="10" goto toggle_builtin_admin
if "%usr_choice%"=="11" goto user_info
if "%usr_choice%"=="0" goto menu
goto menu_users

:menu_tweaks
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Windows Tweaks (Performance ^& UI)%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[1]%RESET% Reduce Menu Show Delay (Snappy UI)
echo %WHITE%[2]%RESET% Restore Classic Right-Click Menu (Windows 11)
echo %WHITE%[3]%RESET% Disable Lock Screen (Fast Boot to Password)
echo %WHITE%[4]%RESET% Disable Visual Effects (Adjust for Best Performance)
echo %WHITE%[5]%RESET% Disable Sticky Keys (No Popups While Gaming)
echo %WHITE%[6]%RESET% Disable Network Throttling (Lower Ping)
echo %WHITE%[7]%RESET% Disable Bing Search in Start Menu (Fast Search)
echo %WHITE%[8]%RESET% Disable SysMain/Superfetch (Fix 100%% Disk Usage)
echo %WHITE%[9]%RESET% Disable Game DVR / Xbox Game Bar (Fix Stuttering)
echo %WHITE%[10]%RESET% Disable Mouse Acceleration (Raw Aim Input for Gamers)
echo %WHITE%[11]%RESET% Disable Hibernation (Free up C: Drive Space)
echo %WHITE%[12]%RESET% Disable VBS / Memory Integrity (Win 11 FPS Boost)
echo %WHITE%[13]%RESET% Enable Ultimate Performance Power Plan
echo %WHITE%[14]%RESET% Disable P2P Windows Updates (Save Bandwidth ^& Lower Ping)
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[15]%RESET% %GREEN%Apply ALL Tweaks (Recommended for Gamers)%RESET%
echo %RED%[16]%RESET% %RED%Restore Windows Defaults (Undo All Tweaks)%RESET%
echo.
echo %RED%[0]%RESET% Back to Main Menu
echo.
set /p tweak_choice=%YELLOW%Enter your choice: %RESET%

if "%tweak_choice%"=="1" goto tweak_menu_delay
if "%tweak_choice%"=="2" goto tweak_win11_menu
if "%tweak_choice%"=="3" goto tweak_lock_screen
if "%tweak_choice%"=="4" goto tweak_visuals
if "%tweak_choice%"=="5" goto tweak_stickykeys
if "%tweak_choice%"=="6" goto tweak_network
if "%tweak_choice%"=="7" goto tweak_bing
if "%tweak_choice%"=="8" goto tweak_sysmain
if "%tweak_choice%"=="9" goto tweak_gamedvr
if "%tweak_choice%"=="10" goto tweak_mouse
if "%tweak_choice%"=="11" goto tweak_hibernation
if "%tweak_choice%"=="12" goto tweak_vbs
if "%tweak_choice%"=="13" goto tweak_power
if "%tweak_choice%"=="14" goto tweak_p2p
if "%tweak_choice%"=="15" goto tweak_all
if "%tweak_choice%"=="16" goto tweak_restore
if "%tweak_choice%"=="0" goto menu
goto menu_tweaks

:: --- FUNCTIONS ---

:dism
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%            Running DISM RestoreHealth%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Checking system image health, please wait...%RESET%
echo.
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo %GREEN%[✓] DISM Process Finished Successfully.%RESET%
pause
goto menu_optimize

:comp_cleanup
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%      Component Store Cleanup (Deep Repair)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Cleaning component store to free up space...%RESET%
echo.
DISM /Online /Cleanup-Image /StartComponentCleanup
echo.
echo %GREEN%[✓] Cleanup Completed Successfully.%RESET%
pause
goto menu_optimize

:clean_updates
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Cleaning up old Windows Updates%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This process might take a long time. Please wait...%RESET%
echo.
DISM /online /Cleanup-Image /StartComponentCleanup /ResetBase

if exist "C:\Windows.old" (
    echo %YELLOW%Removing Windows.old folder...%RESET%
    rd /s /q "C:\Windows.old"
)

echo %GREEN%[✓] Updates Cleanup Completed Successfully.%RESET%
echo.
pause
goto menu_optimize

:clean_dumps
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%       Cleaning Crash Dumps and Error Logs%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Scanning and deleting system dump files...%RESET%
echo.
del /f /q /s "%systemroot%\Minidump\*"
del /f /q /s "%systemroot%\MEMORY.DMP" 
del /f /q "%systemroot%\Logs\CBS\*.cab"
echo %GREEN%[✓] Crash Dumps and System Logs cleaned!%RESET%
pause
goto menu_optimize

:sfc
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%                 Running SFC Scan%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Scanning and repairing corrupted system files...%RESET%
echo.
sfc /scannow
echo.
echo %GREEN%[✓] SFC Scan Process Finished.%RESET%
pause
goto menu_optimize

:clean
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%             Cleaning Temporary Files%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Emptying Temp and Prefetch folders...%RESET%
echo.
del /q /f /s C:\Windows\Prefetch\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%temp%\*"
for /d %%p in ("%temp%\*") do rmdir /s /q "%%p"
cleanmgr /sagerun:1
echo %GREEN%[✓] Cleaning completed successfully, enjoy!%RESET%
pause
goto menu_optimize

:internet
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%             Optimizing Internet ^& DNS%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Flushing DNS and resetting network adapters...%RESET%
echo.
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
echo %GREEN%[✓] Internet and DNS Optimized Successfully!%RESET%
pause
goto menu_optimize

:clean_events
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%             Clearing Event Viewer Logs%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Emptying Windows activity logs to free up space...%RESET%
echo.
for /F "tokens=*" %%1 in ('wevtutil.exe el') DO wevtutil.exe cl "%%1"
echo %GREEN%[✓] All Event Logs Cleared Successfully!%RESET%
pause
goto menu_optimize

:clean_delivery
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Clearing Delivery Optimization Cache%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Deleting shared update files to save disk space...%RESET%
echo.
del /q /f /s "C:\Windows\SoftwareDistribution\DeliveryOptimization\*"
echo %GREEN%[✓] Delivery Optimization Cache Cleaned Successfully!%RESET%
pause
goto menu_optimize

:clear_gpu_cache
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%       GPU Shader Cache Cleaner (NVIDIA ^& AMD)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Clearing GPU cache can fix stuttering and graphical glitches.%RESET%
echo %RED%Note:%WHITE% Games might take slightly longer to load the FIRST time after this.%RESET%
echo.

echo %YELLOW%[1] Cleaning NVIDIA Cache...%RESET%
del /q /s /f "%LocalAppData%\NVIDIA\DXCache\*" >nul 2>&1
del /q /s /f "%LocalAppData%\NVIDIA\GLCache\*" >nul 2>&1
del /q /s /f "%LocalAppData%\NVIDIA Corporation\NV_Cache\*" >nul 2>&1
del /q /s /f "%ProgramData%\NVIDIA Corporation\NV_Cache\*" >nul 2>&1

echo %YELLOW%[2] Cleaning AMD Cache...%RESET%
del /q /s /f "%LocalAppData%\AMD\DxCache\*" >nul 2>&1
del /q /s /f "%LocalAppData%\AMD\GLCache\*" >nul 2>&1

echo %YELLOW%[3] Cleaning Windows DirectX Shader Cache...%RESET%
del /q /s /f "%LocalAppData%\D3DSCache\*" >nul 2>&1

echo.
echo %GREEN%[✓] GPU Cache Cleared Successfully!%RESET%
echo %WHITE%(Note: Some files in use by the system were automatically skipped)%RESET%
echo.
pause
goto menu_optimize

:rammap_optimizer
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%     Deep RAM Optimizer (Sysinternals RAMMap)%RESET%
echo %CYAN%====================================================%RESET%
echo.

if not exist "C:\Windows\rammap64.exe" (
    echo %WHITE%RAMMap tool is not found on your system.%RESET%
    echo %YELLOW%Downloading the latest version directly from Microsoft...%RESET%
    
    curl -s -L -o "C:\Windows\rammap64.exe" "https://live.sysinternals.com/rammap64.exe"
    
    if exist "C:\Windows\rammap64.exe" (
        echo %GREEN%[✓] RAMMap has been downloaded from Microsoft, you are now ready.%RESET%
    ) else (
        echo %RED%[X] Failed to download RAMMap. Please check your internet connection.%RESET%
        pause
        goto menu_optimize
    )
    echo.
)

:rammap_optimizer
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%     Deep RAM Optimizer (Sysinternals RAMMap)%RESET%
echo %CYAN%====================================================%RESET%
echo.

set "RAMMAP_DIR=C:\WinRTP"
set "RAMMAP_EXE=%RAMMAP_DIR%\rammap64.exe"

if not exist "%RAMMAP_EXE%" (
    echo %WHITE%RAMMap tool is not found on your system.%RESET%
    echo %YELLOW%Creating folder and downloading RAMMap...%RESET%

    if not exist "%RAMMAP_DIR%" mkdir "%RAMMAP_DIR%"

    curl -s -L -o "%RAMMAP_EXE%" "https://live.sysinternals.com/rammap64.exe"

    if exist "%RAMMAP_EXE%" (
        echo %GREEN%[✓] RAMMap downloaded successfully!%RESET%
    ) else (
        echo %RED%[X] Download failed. Check internet connection.%RESET%
        pause
        goto menu_optimize
    )
    echo.
)

:rammap_menu
cls
echo %WHITE%Please choose an optimization method:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[1]%RESET% Empty Standby List (Frees up cached memory)
echo %GREEN%[2]%RESET% Empty Working Sets (Forces apps to release memory)
echo %GREEN%[3]%RESET% Do Both (Maximum RAM Cleanup)
echo %CYAN%----------------------------------------------------%RESET%
echo %YELLOW%[4]%RESET% %YELLOW%Enable Auto-RAM Cleanup (Runs Silently Every 1 Hour)%RESET%
echo %RED%[5]%RESET% %RED%Disable Auto-RAM Cleanup%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo %RED%[0]%RESET% Back to Optimize Menu
echo.
set /p "ram_choice=%YELLOW%Enter your choice: %RESET%"

if "%ram_choice%"=="0" goto menu_optimize

if "%ram_choice%"=="1" (
    echo.
    echo %YELLOW%Emptying Standby List...%RESET%
    "C:\WinRTP\rammap64.exe" -accepteula -Et
    echo %GREEN%[✓] Standby List Emptied Successfully!%RESET%
    pause
    goto rammap_menu
)

if "%ram_choice%"=="2" (
    echo.
    echo %YELLOW%Emptying Working Sets...%RESET%
    "C:\WinRTP\rammap64.exe" -accepteula -Ew
    echo %GREEN%[✓] Working Sets Emptied Successfully!%RESET%
    pause
    goto rammap_menu
)

if "%ram_choice%"=="3" (
    echo.
    echo %YELLOW%Running full cleanup...%RESET%
    "C:\WinRTP\rammap64.exe" -accepteula -Ew
    "C:\WinRTP\rammap64.exe" -accepteula -Et
    echo %GREEN%[✓] Full cleanup completed!%RESET%
    pause
    goto rammap_menu
)

if "%ram_choice%"=="4" (
    echo.
    echo %YELLOW%Creating Silent Auto-Cleaner Script...%RESET%
    
    echo @echo off > "C:\WinRTP\AutoRAMClean.bat"
    echo "C:\WinRTP\rammap64.exe" -accepteula -Et >> "C:\WinRTP\AutoRAMClean.bat"
    echo "C:\WinRTP\rammap64.exe" -accepteula -Ew >> "C:\WinRTP\AutoRAMClean.bat"
    
    echo %YELLOW%Scheduling Task in Windows...%RESET%
	
    schtasks /create /tn "WinRTP_AutoRAM" /tr "C:\WinRTP\AutoRAMClean.bat" /sc hourly /mo 1 /ru SYSTEM /rl highest /f >nul 2>&1
    
    echo %GREEN%[✓] Auto-RAM Cleanup Enabled Successfully!%RESET%
    echo %WHITE%Your RAM will now be optimized automatically every hour in the background.%RESET%
    pause
    goto rammap_menu
)

if "%ram_choice%"=="5" (
    echo.
    echo %YELLOW%Stopping and Removing Auto-RAM Cleanup Task...%RESET%
    
    schtasks /delete /tn "WinRTP_AutoRAM" /f >nul 2>&1
    if exist "C:\WinRTP\AutoRAMClean.bat" del /f /q "C:\WinRTP\AutoRAMClean.bat" >nul 2>&1
    
    echo %GREEN%[✓] Auto-RAM Cleanup Disabled Successfully!%RESET%
    pause
    goto rammap_menu
)

goto rammap_menu

:quick_optimize
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%        Running Safe ^& Quick Cleaning...%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Please wait while we perform background repairs...%RESET%
echo.
DISM /Online /Cleanup-Image /RestoreHealth
timeout /t 3 /nobreak >nul
sfc /scannow
timeout /t 3 /nobreak >nul
del /q /f /s C:\Windows\Prefetch\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%temp%\*"
for /d %%p in ("%temp%\*") do rmdir /s /q "%%p"
cleanmgr /sagerun:1
timeout /t 3 /nobreak >nul
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
echo %GREEN%[✓] Full Repair ^& Optimization Completed Successfully!%RESET%
pause
goto menu_optimize

:chkdsk
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%              Schedule CHKDSK Scan%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%[!] %RED%Important Note:%RESET%
echo %WHITE%- System Drive (%GREEN%C%WHITE%): The scan will be %YELLOW%SCHEDULED%WHITE% for the next restart.%RESET%
echo %WHITE%- Other Drives (%GREEN%D, E, etc.%WHITE%): The scan will run %GREEN%IMMEDIATELY%WHITE% inside this window.%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.
echo %WHITE%Type the Drive Letter (e.g., %GREEN%C%WHITE%) to start.%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "chk_drv=%YELLOW%Your Choice: %RESET%"
set "chk_drv=%chk_drv::=%"

if "%chk_drv%"=="" goto menu_disk
if "%chk_drv%"=="0" goto menu_disk

echo.
echo %YELLOW%Scheduling CHKDSK for drive %chk_drv%: on next restart...%RESET%
echo y | chkdsk %chk_drv%: /f /r
echo.
echo %GREEN%[✓] The check is scheduled for the next restart.%RESET%
pause
goto menu_disk

:cancelchk
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%           Stop Scheduled CHKDSK Scan%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Checking system for scheduled scans...%RESET%
powershell -NoProfile -Command ^
    "$reg = (Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' 'BootExecute').BootExecute -join ' '; " ^
    "if ($reg -match '\\\?\?\\([A-Za-z]):') { " ^
    "    Write-Host '    [!] SCHEDULED SCAN DETECTED ON DRIVE: ' -NoNewline -ForegroundColor Red; " ^
    "    Write-Host ($matches[1].ToUpper() + ':') -ForegroundColor Yellow " ^
    "} else { " ^
    "    Write-Host '    [✓] No Scheduled Scans.' -ForegroundColor Green " ^
    "}"

echo.
echo %CYAN%----------------------------------------------------%RESET%

echo %WHITE%Type the Drive Letter (e.g., %GREEN%C%WHITE%) to clear its schedule.%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "chk_drv=%YELLOW%Your Choice: %RESET%"

if "%chk_drv%"=="" goto menu_disk
if "%chk_drv%"=="0" goto menu_disk

set "chk_drv=%chk_drv::=%"

echo.
echo %WHITE%Removing scheduled CHKDSK for Drive %YELLOW%%chk_drv%:%WHITE%...%RESET%
chkntfs /x %chk_drv%: >nul 2>&1

echo %GREEN%[✓] The scheduling process has been cancelled successfully.%RESET%
echo.
pause
goto menu_disk

:defrag
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%       Smart Disk Optimization (Defrag / TRIM)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Windows will automatically detect if it's an HDD (Defrag) or SSD (TRIM).%RESET%
echo.
echo %WHITE%Type the Drive Letter (e.g., %GREEN%C%WHITE%) to optimize.%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "defrag_drv=%YELLOW%Your Choice: %RESET%"
if "%defrag_drv%"=="" goto menu_disk
if "%chk_drv%"=="0" goto menu_disk

echo.
echo %YELLOW%Optimizing Drive %defrag_drv%: ... Please wait.%RESET%
defrag %defrag_drv%: /O /U /V
echo.
echo %GREEN%[✓] Disk Optimization Completed Successfully!%RESET%
pause
goto menu_disk

:smart_check
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Check Disk Health (S.M.A.R.T Status)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Checking the physical health of all connected drives...%RESET%
echo.

powershell -NoProfile -Command "Get-PhysicalDisk | Select-Object FriendlyName, HealthStatus | Format-Table -AutoSize"

echo.
echo %WHITE%If the status says %GREEN%Healthy%WHITE%, your disk is in good condition.%RESET%
echo %WHITE%If it says %RED%Warning%WHITE% or %RED%Unhealthy%WHITE%, backup your data immediately!%RESET%
echo.
pause
goto menu_disk

:disk_info
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%              Disk Storage Information%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Fetching storage details for all connected drives...%RESET%
echo %CYAN%----------------------------------------------------%RESET%

powershell -NoProfile -Command "Get-Volume | Where-Object { $_.DriveLetter } | Select-Object DriveLetter, FileSystemLabel, @{Name='Capacity(GB)';Expression={[math]::Round($_.Size/1GB, 2)}}, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.SizeRemaining/1GB, 2)}} | Sort-Object DriveLetter | Format-Table -AutoSize"

echo.
pause
goto menu_disk


:secure_wipe
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%       Secure Wipe Free Space (Anti-Recovery)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This will overwrite deleted files so they %RED%CANNOT%WHITE% be recovered.%RESET%
echo %GREEN%Note: This only affects FREE SPACE. Your current files are 100%% safe.%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

echo %WHITE%Type the Drive Letter (e.g., %GREEN%C%WHITE%) to wipe its free space.%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "wipe_drv=%YELLOW%Your Choice: %RESET%"

if "%wipe_drv%"=="" goto menu_disk
if "%wipe_drv%"=="0" goto menu_disk

set "wipe_drv=%wipe_drv::=%"

echo.
echo %RED%[!] Warning: This process might take a LONG time depending on disk size.%RESET%
echo %YELLOW%Wiping free space on Drive %wipe_drv%: ... Please wait.%RESET%
echo.

cipher /w:%wipe_drv%:

echo.
echo %GREEN%[✓] Free space on Drive %wipe_drv%: wiped successfully!%RESET%
pause
goto menu_disk

:disk_speed
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%              Disk Speed Test (Benchmark)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This will test the Read and Write speeds of your drive.%RESET%
echo.
echo %WHITE%Type the Drive Letter (e.g., %GREEN%C%WHITE%) to test.%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "speed_drv=%YELLOW%Your Choice: %RESET%"

if "%speed_drv%"=="" goto menu_disk
if "%speed_drv%"=="0" goto menu_disk
set "speed_drv=%speed_drv::=%"

echo.
echo %YELLOW%Running performance test on Drive %speed_drv%: ... Please wait.%RESET%
echo %CYAN%----------------------------------------------------%RESET%

winsat disk -drive %speed_drv%

echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[✓] Speed test completed successfully!%RESET%
pause
goto menu_disk


:usb_rescue
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%       USB/Drive Virus Rescue (Unhide Files)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Fixes drives where a virus hid all your files and created shortcuts.%RESET%
echo.

echo %WHITE%Type the Drive Letter (e.g., %GREEN%D, E%WHITE%) to rescue.%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "usb_drv=%YELLOW%Your Choice: %RESET%"

if "%usb_drv%"=="" goto menu_disk
if "%usb_drv%"=="0" goto menu_disk
set "usb_drv=%usb_drv::=%"

echo.
echo %YELLOW%Removing hidden and system attributes from Drive %usb_drv%: ...%RESET%
echo %WHITE%This may take a minute depending on the number of files.%RESET%

attrib -h -r -s /s /d %usb_drv%:\*.* >nul 2>&1

echo.
echo %GREEN%[✓] All files on Drive %usb_drv%: are now visible and rescued!%RESET%
pause
goto menu_disk

:write_protect_fix
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         USB Write Protection Fixer (Deep Fix)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Fixes "The disk is write-protected" error on USBs and SD Cards.%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

echo %WHITE%Type the USB Drive Letter (e.g., %GREEN%F, G%WHITE%) to fix.%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "wp_drv=%YELLOW%Your Choice: %RESET%"
if "%wp_drv%"=="" goto menu_disk
if "%wp_drv%"=="0" goto menu_disk
set "wp_drv=%wp_drv::=%"

echo.
echo %YELLOW%[1] Resetting Windows Storage Policies...%RESET%
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v WriteProtect /t REG_DWORD /d 0 /f >nul 2>&1

echo %YELLOW%[2] Clearing Read-Only attributes from the physical drive...%RESET%
echo select volume %wp_drv% > "%temp%\wp_fix.txt"
echo attributes disk clear readonly >> "%temp%\wp_fix.txt"
diskpart /s "%temp%\wp_fix.txt" >nul 2>&1
del "%temp%\wp_fix.txt" >nul 2>&1

echo.
echo %GREEN%[✓] Write Protection removed successfully from Drive %wp_drv%:%RESET%
echo %WHITE%Note: If the issue persists, the USB drive might be physically damaged.%RESET%
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
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Enabling Ultimate Performance Mode%RESET%
echo %CYAN%====================================================%RESET%
echo.
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 > temp.txt
for /f "tokens=4" %%i in ('findstr /i "GUID" temp.txt') do set GUID=%%i
powercfg /setactive %GUID% >nul 2>&1
del temp.txt >nul 2>&1

echo %GREEN%[✓] Ultimate Performance Mode Enabled Successfully!%RESET%
echo %WHITE%Active GUID: %GUID%%RESET%
echo.
pause
goto menu_advanced

:restore_balanced
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%      Restoring Balanced Mode ^& Cleaning Up%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Activating Balanced Mode...%RESET%
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1

echo %WHITE%Removing Ultimate Performance profiles...%RESET%
for /f "tokens=4" %%i in ('powercfg -list ^| findstr /i "Ultimate"') do (
    powercfg -delete %%i >nul 2>&1
)

echo.
echo %GREEN%[✓] Balanced Mode Restored and Custom Profiles Cleaned!%RESET%
echo.
pause
goto menu_advanced

:shutdown
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%             Schedule Auto Shutdown%RESET%
echo %CYAN%====================================================%RESET%
echo.
set /p st=%YELLOW%Enter minutes until shutdown: %RESET%
set /a ss=%st%*60
shutdown /s /t %ss%
echo.
echo %GREEN%[✓] PC will shutdown in %st% minutes.%RESET%
pause
goto menu_advanced

:cancelshutdown
cls
shutdown /a >nul 2>&1
echo %GREEN%[✓] Scheduled shutdown canceled.%RESET%
pause
goto menu_advanced

:bios
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%              Restart to BIOS / UEFI%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%System will restart to BIOS in 5 seconds...%RESET%
shutdown /r /fw /t 5
if %errorlevel% neq 0 (
    echo.
    echo %RED%[X] Your motherboard does not support restarting to BIOS from Windows.%RESET%
    echo %YELLOW%You will need to restart manually and press (DEL) or (F2).%RESET%
)
echo.
pause
goto menu_advanced

:safemode
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%             Boot into Safe Mode%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %RED%[!] IMPORTANT WARNING:%RESET%
echo %WHITE%To return to Normal Mode later, you will need to open CMD in Safe Mode and type:%RESET%
echo %YELLOW%bcdedit /deletevalue {current} safeboot%RESET%
echo.
pause
bcdedit /set {current} safeboot minimal >nul 2>&1
shutdown /r /t 5
goto menu_advanced

:normalmode
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%            Boot into Normal Mode%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Windows will boot normally after the restart.%RESET%
echo.
pause

bcdedit /deletevalue {current} safeboot >nul 2>&1
shutdown /r /t 5

goto menu_advanced

:debloat
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%   Debloating Windows (Removing Junk Default Apps)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Removing unnecessary apps... Please wait.%RESET%
echo.
powershell -Command "Get-AppxPackage *bing* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *zune* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *skypeapp* | Remove-AppxPackage" >nul 2>&1
echo %GREEN%[✓] Windows Debloat Completed Successfully.%RESET%
echo.
pause
goto menu_advanced

:wifi_pwd
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                Saved Wi-Fi Passwords%RESET%
echo %CYAN%====================================================%RESET%
echo.
powershell -Command "netsh wlan show profiles | Select-String 'All User Profile' | ForEach-Object { $profile = $_.ToString().Split(':')[1].Trim(); $pass = (netsh wlan show profile name=\"$profile\" key=clear | Select-String 'Key Content' | ForEach-Object { $_.ToString().Split(':')[1].Trim() }); [PSCustomObject]@{ 'Wi-Fi Name' = $profile; 'Password' = $pass } } | Format-Table -AutoSize"
echo.
pause
goto menu_advanced

:disable_updates
cls
echo %CYAN%====================================================%RESET%
echo %RED%          Disabling Windows Update Services%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Stopping services and modifying registry keys...%RESET%
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
echo %CYAN%====================================================%RESET%
echo %GREEN%          Enabling Windows Update Services%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Restoring services and registry keys to default...%RESET%
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

:clean_gamers_cache
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Cleaning Gaming ^& Apps Cache%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Clearing temporary cache for Steam, Epic, EA, and Discord...%RESET%
echo.
if exist "%appdata%\Discord\Cache" del /q /f /s "%appdata%\Discord\Cache\*" >nul 2>&1
if exist "%localappdata%\Steam\htmlcache" del /q /f /s "%localappdata%\Steam\htmlcache\*" >nul 2>&1
if exist "%localappdata%\EpicGamesLauncher\Saved\webcache" del /q /f /s "%localappdata%\EpicGamesLauncher\Saved\webcache\*" >nul 2>&1
if exist "%localappdata%\Electronic Arts\EA Desktop\Cache" del /q /f /s "%localappdata%\Electronic Arts\EA Desktop\Cache\*" >nul 2>&1
if exist "%programdata%\Origin\DownloadCache" del /q /f /s "%programdata%\Origin\DownloadCache\*" >nul 2>&1
del /q /f /s "%localappdata%\D3DSCache\*" >nul 2>&1

echo %GREEN%[✓] Gaming Cache Cleaned Successfully!%RESET%
echo.
pause
goto menu_advanced

:extract_oem_key
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Extract Original Windows Key (OEM)%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Extracting original Windows product key from motherboard...%RESET%
echo %CYAN%----------------------------------------------------%RESET%
powershell -NoProfile -Command "$key = (Get-WmiObject -Query 'select * from SoftwareLicensingService').OA3xOriginalProductKey; if ($key) { Write-Host '    [✓] OEM Key Found: ' -NoNewline -ForegroundColor Green; Write-Host $key -ForegroundColor Yellow; $path = [Environment]::GetFolderPath('Desktop') + '\Windows_OEM_Key.txt'; $key | Out-File -FilePath $path; Write-Host '    [✓] A copy has been saved to your Desktop (Windows_OEM_Key.txt)' -ForegroundColor Cyan } else { Write-Host '    [!] No OEM Key found in BIOS/UEFI. (You might be using a Retail key or Digital License)' -ForegroundColor Red }"
echo.
pause
goto menu_advanced

:context_menu_mgr
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%            Context Menu Manager (Right-Click)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Add useful tools to your Windows right-click menu.%RESET%
echo.
echo %WHITE%[1]%RESET% Add "Take Ownership" (Gain full access to protected files/folders)
echo %WHITE%[2]%RESET% Remove "Take Ownership"
echo %RED%[0]%RESET% Back to Advanced Tools
echo.
set /p "ctx_ch=%YELLOW%Your Choice: %RESET%"

if "%ctx_ch%"=="0" goto menu_advanced
if "%ctx_ch%"=="1" (
    echo.
    echo %YELLOW%Adding "Take Ownership" to registry...%RESET%
    reg add "HKCR\*\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f >nul 2>&1
    reg add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f >nul 2>&1
    reg add "HKCR\*\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F /c /l & pause" /f >nul 2>&1
    reg add "HKCR\Directory\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f >nul 2>&1
    reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f >nul 2>&1
    reg add "HKCR\Directory\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t /c /l /q & pause" /f >nul 2>&1
    echo %GREEN%[✓] Added Successfully! Right-click any file/folder to see it.%RESET%
    pause
    goto context_menu_mgr
)
if "%ctx_ch%"=="2" (
    echo.
    echo %YELLOW%Removing "Take Ownership" from registry...%RESET%
    reg delete "HKCR\*\shell\runas" /f >nul 2>&1
    reg delete "HKCR\Directory\shell\runas" /f >nul 2>&1
    echo %GREEN%[✓] Removed Successfully!%RESET%
    pause
    goto context_menu_mgr
)
goto context_menu_mgr

:bsod_analyzer
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%           BSOD Log Analyzer (Blue Screen)%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Scanning Windows Event Viewer for recent System Crashes...%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.
powershell -NoProfile -Command "$events = Get-EventLog -LogName System -Source BugCheck -Newest 5 -ErrorAction SilentlyContinue; if ($events) { Write-Host 'Recent crashes found:' -ForegroundColor Red; foreach ($e in $events) { Write-Host ('Date: ' + $e.TimeGenerated) -ForegroundColor Cyan; Write-Host ('Info: ' + $e.Message) -ForegroundColor Yellow; Write-Host '----------------------------------------------------' } } else { Write-Host '    [✓] Great News! No recent Blue Screen crashes found in the Event Log.' -ForegroundColor Green }"
echo.
pause
goto menu_advanced

:full_system_backup
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Create Full System Image Backup%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This will backup your ENTIRE Windows (OS, Apps, Drivers, Files).%RESET%
echo %RED%[!] Requirements:%RESET%
echo %WHITE%- You MUST have a second drive or external hard disk (e.g., D:, E:).%RESET%
echo %WHITE%- It must have enough free space (e.g., 50GB to 100GB+).%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.
echo %WHITE%Type the Destination Drive Letter (e.g., %GREEN%D, E%WHITE%).%RESET%
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo.
set /p "bk_drv=%YELLOW%Your Choice: %RESET%"

if "%bk_drv%"=="" goto menu_advanced
if "%bk_drv%"=="0" goto menu_advanced

set "bk_drv=%bk_drv::=%"

echo.
echo %YELLOW%Preparing to backup System (Drive C:) to Drive %bk_drv%:\ ...%RESET%
echo %RED%[!] Please DO NOT close this window. This process will take a LONG time.%RESET%
echo.

wbadmin start backup -backupTarget:%bk_drv%: -include:C: -allCritical -quiet

if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[✓] Full System Backup Completed Successfully!%RESET%
    echo %WHITE%Your backup is safely stored on Drive %bk_drv%:%RESET%
) else (
    echo.
    echo %RED%[X] Backup Failed.%RESET%
    echo %YELLOW%Hint: Ensure you entered a valid drive letter [NOT Drive C] and have enough free space.%RESET%
)

echo.
echo %CYAN%====================================================%RESET%
echo %YELLOW%      HOW TO RESTORE THIS BACKUP IN THE FUTURE?%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Because the OS is running, you cannot restore it from here.%RESET%
echo %WHITE%To restore your PC from this backup later:%RESET%
echo %WHITE%1. Boot into Windows Recovery Environment [Advanced Startup].%RESET%
echo %WHITE%2. Go to: Troubleshoot -^> Advanced options -^> System Image Recovery.%RESET%
echo %WHITE%3. Select the backup you just created and let Windows restore it.%RESET%
echo %CYAN%====================================================%RESET%
echo.
pause
goto menu_advanced

:menu_firewall_manager
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Firewall App Blocker ^& Unblocker%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Choose an action:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[1]%RESET% Block an App from Internet
echo %GREEN%[2]%RESET% Unblock an App (Restore Internet Access)
echo %RED%[0]%RESET% Back to Security Menu
echo %CYAN%----------------------------------------------------%RESET%
set /p "fw_choice=%YELLOW%Enter your choice: %RESET%"

if "%fw_choice%"=="0" goto menu_security
if "%fw_choice%"=="1" goto fw_block
if "%fw_choice%"=="2" goto fw_unblock
goto menu_firewall_manager

:fw_block
echo.
echo %YELLOW%Opening file picker... Please select the program (.exe) to BLOCK.%RESET%
:: تشغيل كود PowerShell لفتح نافذة اختيار الملفات
set "psCommand=Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.OpenFileDialog; $f.Filter = 'Executable Files (*.exe)|*.exe'; $f.Title = 'Select the program to BLOCK'; $f.ShowHelp = $true; $f.ShowDialog() | Out-Null; $f.FileName"

set "app_path="
for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "%psCommand%"`) do set "app_path=%%I"

:: التحقق من أن المستخدم لم يغلق النافذة بدون اختيار
if "%app_path%"=="" (
    echo %RED%[X] No file selected. Going back to menu...%RESET%
    pause
    goto menu_firewall_manager
)

:: استخراج اسم البرنامج فقط من المسار الكامل
for %%F in ("%app_path%") do set "app_name=%%~nxF"

echo %YELLOW%Blocking "%app_name%" in Windows Firewall...%RESET%
:: إضافة قاعدة لمنع الاتصال الصادر والوارد
netsh advfirewall firewall add rule name="WinRTP_Block_%app_name%" dir=out action=block program="%app_path%" >nul 2>&1
netsh advfirewall firewall add rule name="WinRTP_Block_%app_name%" dir=in action=block program="%app_path%" >nul 2>&1

echo %GREEN%[✓] Success! Internet access is permanently blocked for: %app_name%%RESET%
pause
goto menu_firewall_manager

:fw_unblock
echo.
echo %YELLOW%Opening file picker... Please select the program (.exe) to UNBLOCK.%RESET%
:: تشغيل كود PowerShell لفتح نافذة اختيار الملفات
set "psCommand=Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.OpenFileDialog; $f.Filter = 'Executable Files (*.exe)|*.exe'; $f.Title = 'Select the program to UNBLOCK'; $f.ShowHelp = $true; $f.ShowDialog() | Out-Null; $f.FileName"

set "app_path="
for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "%psCommand%"`) do set "app_path=%%I"

:: التحقق من أن المستخدم لم يغلق النافذة بدون اختيار
if "%app_path%"=="" (
    echo %RED%[X] No file selected. Going back to menu...%RESET%
    pause
    goto menu_firewall_manager
)

:: استخراج اسم البرنامج فقط من المسار الكامل
for %%F in ("%app_path%") do set "app_name=%%~nxF"

echo %YELLOW%Unblocking "%app_name%" in Windows Firewall...%RESET%
:: حذف القاعدة التي قمنا بإنشائها مسبقاً باستخدام نفس الاسم
netsh advfirewall firewall delete rule name="WinRTP_Block_%app_name%" >nul 2>&1

echo %GREEN%[✓] Success! Internet access is restored for: %app_name%%RESET%
pause
goto menu_firewall_manager

:winupdate
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%            Deep Repairing Windows Update%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Stopping services and cleaning update cache...%RESET%
net stop wuauserv >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop bits >nul 2>&1
net stop msiserver >nul 2>&1

rd /s /q C:\Windows\SoftwareDistribution >nul 2>&1
rd /s /q C:\Windows\System32\catroot2 >nul 2>&1

echo %WHITE%Restarting update services...%RESET%
net start wuauserv >nul 2>&1
net start cryptSvc >nul 2>&1
net start bits >nul 2>&1
net start msiserver >nul 2>&1
UsoClient StartInteractiveScan

echo.
echo %GREEN%[✓] Windows Update Deep Reset Completed Successfully!%RESET%
pause
goto menu_repair

:store_apps
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%           Repairing Store ^& Default Apps%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This might take a minute, please wait...%RESET%
echo.
echo %YELLOW%1. Resetting Microsoft Store Cache...%RESET%
wsreset.exe
echo %YELLOW%2. Re-registering Windows Default Apps...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}" >nul 2>&1

echo.
echo %GREEN%[✓] Microsoft Store and Default Apps Repaired!%RESET%
pause
goto menu_repair

:icons_thumbs
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%            Rebuilding Icons ^& Thumbnails%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Screen might flash for a second, this is normal.%RESET%
echo.

taskkill /f /im explorer.exe >nul 2>&1
del /f /s /q /a "%localappdata%\IconCache.db" >nul 2>&1
del /f /s /q /a "%localappdata%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1
del /f /s /q /a "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
start explorer.exe

echo.
echo %GREEN%[✓] Icons and Thumbnails Cache Rebuilt Successfully!%RESET%
pause
goto menu_repair

:taskbar_search
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Fixing Taskbar, Search ^& Explorer%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Restarting critical shell processes...%RESET%
echo.

taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im SearchApp.exe >nul 2>&1
taskkill /f /im SearchUI.exe >nul 2>&1

echo %YELLOW%Re-registering Shell Experience and Cortana/Search...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage Microsoft.Windows.ShellExperienceHost | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}" >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage Microsoft.Windows.Cortana | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}" >nul 2>&1

start explorer.exe
echo.
echo %GREEN%[✓] Taskbar, Search, and Explorer Reset Successfully!%RESET%
pause
goto menu_repair

:fix_audio
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%               Fixing Audio Services%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Restarting Windows Audio endpoints...%RESET%
echo.

net stop audiosrv >nul 2>&1
net stop AudioEndpointBuilder >nul 2>&1
net start AudioEndpointBuilder >nul 2>&1
net start audiosrv >nul 2>&1

echo %GREEN%[✓] Audio Services Restarted.%RESET%
echo.
echo %WHITE%Starting Windows Audio Troubleshooter just in case...%RESET%
msdt.exe -id AudioPlaybackDiagnostic
pause
goto menu_repair

:fix_bluetooth
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%              Fixing Bluetooth Services%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Restarting Bluetooth Support Service...%RESET%
echo.

net stop bthserv >nul 2>&1
net start bthserv >nul 2>&1

echo %GREEN%[✓] Bluetooth Services Restarted Successfully!%RESET%
echo %WHITE%If your device is still not working, try unpairing and pairing it again.%RESET%
echo.
pause
goto menu_repair

:fix_printer
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%           Fixing Printer ^& Print Spooler%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Stopping Spooler and clearing stuck print jobs...%RESET%
echo.

net stop spooler >nul 2>&1
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*" >nul 2>&1
net start spooler >nul 2>&1

echo %GREEN%[✓] Print Queue Cleared and Services Restarted!%RESET%
echo.
pause
goto menu_repair

:restart_services
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Restarting Important Core Services%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Please wait...%RESET%
echo.

net stop wuauserv /y >nul 2>&1
net start wuauserv >nul 2>&1
net stop bits /y >nul 2>&1
net start bits >nul 2>&1
net stop cryptSvc /y >nul 2>&1
net start cryptSvc >nul 2>&1
net stop Winmgmt /y >nul 2>&1
net start Winmgmt >nul 2>&1

echo %GREEN%[✓] Core Windows Services Restarted Successfully!%RESET%
echo.
pause
goto menu_repair

:quickscan
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%              Windows Defender Quick Scan%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Scanning your system for active threats...%RESET%
echo.
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
echo.
echo %GREEN%[✓] Quick Scan Completed!%RESET%
pause
goto menu_security

:fullscan
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%               Windows Defender Full Scan%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Performing a deep scan of all files. This will take a while...%RESET%
echo.
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
echo.
echo %GREEN%[✓] Full Scan Completed!%RESET%
pause
goto menu_security

:offlinescan
cls
echo %CYAN%====================================================%RESET%
echo %RED%             Windows Defender Offline Scan%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This will %RED%RESTART%WHITE% your PC immediately and scan for stubborn%RESET%
echo %WHITE%malware before Windows loads.%RESET%
echo.
echo %YELLOW%Make sure you have saved all your open files and work!%RESET%
echo.
pause
powershell -Command "Start-MpWDOScan"
goto menu_security

:clear_defender_history
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Clearing Defender Protection History%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Fixes the glitch where Defender keeps warning about old threats.%RESET%
echo.
del /q /f /s "C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service\*" >nul 2>&1
echo %GREEN%[✓] Defender Protection History Cleared!%RESET%
pause
goto menu_security

:fix_defender
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Deep Repairing Windows Defender%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%1. Removing restrictions from Registry...%RESET%
reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /f >nul 2>&1
reg delete "HKLM\Software\Policies\Microsoft\Windows Advanced Threat Protection" /f >nul 2>&1

echo %WHITE%2. Restarting Security Services...%RESET%
sc config WinDefend start= auto >nul 2>&1
net start WinDefend >nul 2>&1
sc config SecurityHealthService start= auto >nul 2>&1
net start SecurityHealthService >nul 2>&1
sc config wscsvc start= auto >nul 2>&1
net start wscsvc >nul 2>&1

echo %WHITE%3. Updating Signatures to fix engine crashes...%RESET%
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate >nul 2>&1

echo %WHITE%4. Re-registering Security Interface...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage Microsoft.Windows.SecHealthUI | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}" >nul 2>&1

echo.
echo %GREEN%[✓] Windows Defender Services and Engine Repaired Successfully!%RESET%
pause
goto menu_security

:firewall_reset
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%             Resetting Windows Firewall%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Restoring default firewall rules and permissions...%RESET%
echo.
netsh advfirewall reset >nul 2>&1
echo %GREEN%[✓] Windows Firewall Reset to Defaults Successfully!%RESET%
pause
goto menu_security

:reset_hosts
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%                Resetting Hosts File%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Fixes internet redirects caused by malware or bad configs.%RESET%
echo.
echo # Copyright (c) 1993-2009 Microsoft Corp. > %windir%\System32\drivers\etc\hosts
echo # This is a default HOSTS file. >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 localhost >> %windir%\System32\drivers\etc\hosts
echo ::1 localhost >> %windir%\System32\drivers\etc\hosts
echo %GREEN%[✓] Hosts File Reset to Default Successfully!%RESET%
pause
goto menu_security

:disable_telemetry
cls
echo %CYAN%====================================================%RESET%
echo %RED%       Disabling Windows Telemetry ^& Tracking%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Stopping data collection services...%RESET%
echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
echo %GREEN%[✓] Telemetry and Tracking disabled successfully.%RESET%
pause
goto menu_security

:enable_telemetry
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%       Enabling Windows Telemetry ^& Tracking%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Restoring default data collection services...%RESET%
echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 1 /f >nul 2>&1
sc config DiagTrack start= auto >nul 2>&1
net start DiagTrack >nul 2>&1
echo %GREEN%[✓] Telemetry and Tracking services restored to default.%RESET%
pause
goto menu_security

:driver_updater
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%               Driver Update Wizard%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Checking for available Windows Update drivers... Please wait...%RESET%
echo %WHITE%This module checks Microsoft servers for core system drivers.%RESET%
echo %CYAN%Note: For the latest GPU drivers, please use official apps (NVIDIA/AMD/Intel).%RESET%
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) { Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser -ErrorAction SilentlyContinue | Out-Null; Install-Module -Name PowerShellGet -Force -SkipPublisherCheck -AllowClobber -Scope CurrentUser -ErrorAction SilentlyContinue | Out-Null; Install-Module -Name PSWindowsUpdate -Force -SkipPublisherCheck -AllowClobber -Scope CurrentUser -ErrorAction SilentlyContinue | Out-Null }" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module PSWindowsUpdate -ErrorAction SilentlyContinue; $updates = Get-WindowsUpdate; [array]$drivers = $updates | Where-Object { $_.Categories -match 'Driver' -or $_.Title -match 'Driver' }; if ($drivers.Count -gt 0) { $i = 1; foreach ($d in $drivers) { Write-Host \"[$i] $($d.Title)\"; $i++ }; exit 0 } else { Write-Host 'All drivers are fully up to date!' -ForegroundColor Green; exit 1 }"

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
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module PSWindowsUpdate -ErrorAction SilentlyContinue; $updates = Get-WindowsUpdate; [array]$drivers = $updates | Where-Object { $_.Categories -match 'Driver' -or $_.Title -match 'Driver' }; if ($drivers.Count -gt 0) { $drivers | Install-WindowsUpdate -AcceptAll -AutoReboot:$false }"
    echo.
    echo %GREEN%[✓] All drivers updated successfully!%RESET%
    pause
    goto menu_drivers
)

echo.
echo %YELLOW%Preparing to install the selected driver...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module PSWindowsUpdate -ErrorAction SilentlyContinue; $idx = [int]'%drv_sel%' - 1; $updates = Get-WindowsUpdate; [array]$drivers = $updates | Where-Object { $_.Categories -match 'Driver' -or $_.Title -match 'Driver' }; if ($drivers[$idx]) { Write-Host \"Installing: $($drivers[$idx].Title)\" -ForegroundColor Yellow; Install-WindowsUpdate -UpdateID $drivers[$idx].UpdateID -AcceptAll -AutoReboot:$false } else { Write-Host 'Invalid Selection' -ForegroundColor Red }"
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
echo.
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

set /p "backup_drv=%YELLOW%Enter Drive Letter to save backup (e.g., C, D, E): %RESET%"

if "%backup_drv%"=="0" goto menu_drivers
if "%backup_drv%"=="" goto backup_drivers

set "backup_drv=%backup_drv::=%"

set "BACKUP_PATH=%backup_drv%:\Drivers_Backup"

if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"

echo.
echo %WHITE%Please wait, this might take a minute or two...%RESET%
echo.

dism /online /export-driver /destination:"%BACKUP_PATH%"

if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[✓] Drivers Backup Created Successfully!%RESET%
    echo %WHITE%Saved to: %YELLOW%%BACKUP_PATH%%RESET%
) else (
    echo.
    echo %RED%[X] Failed to backup drivers.%RESET%
    echo %YELLOW%Hint: Ensure you entered a valid drive and have enough free space.%RESET%
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
echo.
echo %RED%[0]%RESET% %WHITE%Cancel and Back to Menu%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

set /p "restore_drv=%YELLOW%Enter Drive Letter where backup is located (e.g., C, D, E): %RESET%"

if "%restore_drv%"=="0" goto menu_drivers
if "%restore_drv%"=="" goto restore_drivers

set "restore_drv=%restore_drv::=%"

set "BACKUP_PATH=%restore_drv%:\Drivers_Backup"

if not exist "%BACKUP_PATH%" (
    echo.
    echo %RED%[X] Error: Backup folder not found at %BACKUP_PATH%%RESET%
    echo %YELLOW%Please make sure you entered the correct drive letter.%RESET%
    echo.
    pause
    goto menu_drivers
)

echo.
echo %WHITE%Windows will scan and install your backed up drivers...%RESET%
echo.

pnputil /add-driver "%BACKUP_PATH%\*.inf" /subdirs /install /reboot

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

:menu_apps
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%       Silent Applications Installer ^& Manager%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %GREEN%[1]%RESET% %GREEN%Update Installed Programs (Interactive Wizard)%RESET%
echo %GREEN%[2]%RESET% %RED%Uninstall Installed Programs (Silent Uninstaller)%RESET%
echo %GREEN%[3]%RESET% %YELLOW%Install ALL Core Runtimes (C++, DX, .NET, WebView2, etc..)%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[4]%RESET% Google Chrome                  %GREEN%[11]%RESET% WinRAR
echo %GREEN%[5]%RESET% Mozilla Firefox                %GREEN%[12]%RESET% 7-Zip
echo %GREEN%[6]%RESET% Brave Browser                  %GREEN%[13]%RESET% Steam
echo %GREEN%[7]%RESET% Internet Download Manager      %GREEN%[14]%RESET% Epic Games Launcher
echo %GREEN%[8]%RESET% Discord                        %GREEN%[15]%RESET% OBS Studio
echo %GREEN%[9]%RESET% Zoom                           %GREEN%[16]%RESET% VLC Media Player
echo %GREEN%[10]%RESET% WhatsApp Desktop              
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[S]%RESET% %CYAN%Search ^& Install Custom App (Write App Name)%RESET%
echo %YELLOW%[A] Install ALL Basic Apps (4, 7, 11, 12, 16)%RESET%
echo %RED%[0] Back to Main Menu%RESET%
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p "app_ch=%YELLOW%Choose Option Number: %RESET%"

if "%app_ch%"=="0" goto menu
if /i "%app_ch%"=="a" goto install_all_apps
if /i "%app_ch%"=="s" goto search_install_app
if "%app_ch%"=="1" goto apps_updater_wizard
if "%app_ch%"=="2" goto apps_uninstaller_wizard
if "%app_ch%"=="3" goto install_core_runtimes

if "%app_ch%"=="4" set "app_id=Google.Chrome" & goto install_silent
if "%app_ch%"=="5" set "app_id=Mozilla.Firefox" & goto install_silent
if "%app_ch%"=="6" set "app_id=XP8C9QZMS2PC1T" & goto install_silent
if "%app_ch%"=="7" set "app_id=Tonec.InternetDownloadManager" & goto install_silent
if "%app_ch%"=="8" set "app_id=Discord.Discord" & goto install_silent
if "%app_ch%"=="9" set "app_id=Zoom.Zoom" & goto install_silent
if "%app_ch%"=="10" set "app_id=WhatsApp.WhatsApp" & goto install_silent
if "%app_ch%"=="11" set "app_id=RARLab.WinRAR" & goto install_silent
if "%app_ch%"=="12" set "app_id=7zip.7zip" & goto install_silent
if "%app_ch%"=="13" set "app_id=Valve.Steam" & goto install_silent
if "%app_ch%"=="14" set "app_id=EpicGames.EpicGamesLauncher" & goto install_silent
if "%app_ch%"=="15" set "app_id=OBSProject.OBSStudio" & goto install_silent
if "%app_ch%"=="16" set "app_id=VideoLAN.VLC" & goto install_silent
goto menu_apps

:install_core_runtimes
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%      Installing ALL Core ^& Legacy Runtimes%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This will install: Modern ^& Legacy Visual C++, DirectX,%RESET%
echo %WHITE%.NET 8, WebView2, XNA Framework, and Java JRE.%RESET%
echo.
echo %RED%[!] Please wait, this might take up to 10 minutes...%RESET%
echo.

for %%r in (Microsoft.VCRedist.2015+.x64 Microsoft.VCRedist.2015+.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2012.x64 Microsoft.VCRedist.2012.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2010.x86 Microsoft.DirectX Microsoft.DotNet.DesktopRuntime.8 Microsoft.EdgeWebView2Runtime Microsoft.XNAFramework Oracle.JavaRuntimeEnvironment) do (
    echo %YELLOW%Installing: %%r...%RESET%
    winget install --id "%%r" --silent --accept-source-agreements --accept-package-agreements >nul 2>&1
)

echo.
echo %GREEN%[✓] All Core and Legacy Runtimes Installed Successfully!%RESET%
echo %WHITE%Your PC is now fully optimized for all games and heavy software.%RESET%
pause
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
set /p "un_app_id=%YELLOW%Enter App ID or Name App to UNINSTALL: %RESET%"

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

:open_taskmgr
start taskmgr
goto menu_maintenance

:open_services
start services.msc
goto menu_maintenance

:open_devicemgr
start devmgmt.msc
goto menu_maintenance

:open_diskcleanup
start cleanmgr
goto menu_maintenance

:open_msconfig
start msconfig
goto menu_maintenance

:open_regedit
start regedit
goto menu_maintenance

:open_startup
start shell:startup
goto menu_maintenance

:open_resmon
start resmon
goto menu_maintenance

:open_eventviewer
start eventvwr.msc
goto menu_maintenance

:open_reliability
start perfmon /rel
goto menu_maintenance

:open_wintools
start control admintools
goto menu_maintenance

:open_programs
start appwiz.cpl
goto menu_maintenance

:open_networkreset
start ms-settings:network-status
goto menu_maintenance

:open_dxdiag
start dxdiag
goto menu_maintenance

:open_sysinfo
start msinfo32
goto menu_maintenance

:open_temp
start %temp%
goto menu_maintenance

:open_advancedsys
start sysdm.cpl
goto menu_maintenance

:open_memorydiag
mdsched.exe
goto menu_maintenance

:open_diskmgmt
start diskmgmt.msc
goto menu_maintenance

:open_compmgmt
start compmgmt.msc
goto menu_maintenance

:open_gpedit
start gpedit.msc
goto menu_maintenance

:open_powercfg
start powercfg.cpl
goto menu_maintenance

:open_soundcpl
start mmsys.cpl
goto menu_maintenance

:open_ncpa
start ncpa.cpl
goto menu_maintenance

:open_taskschd
start taskschd.msc
goto menu_maintenance

:open_firewall
start wf.msc
goto menu_maintenance

:open_lusrmgr
start lusrmgr.msc
goto menu_maintenance

:open_netplwiz
start netplwiz
goto menu_maintenance

:open_perfmon
start perfmon.msc
goto menu_maintenance

:open_wusettings
start ms-settings:windowsupdate
goto menu_maintenance

:add_user
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%               Add New User Account%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "new_usr=%YELLOW%Enter new username (no spaces): %RESET%"

if "%new_usr%"=="0" goto menu_users
if "%new_usr%"=="" goto menu_users

set /p "new_pass=%YELLOW%Enter password (leave blank for no password): %RESET%"
echo.
echo %YELLOW%Creating user '%new_usr%'...%RESET%
net user "%new_usr%" "%new_pass%" /add >nul 2>&1

if %errorlevel% equ 0 (
    echo %GREEN%[✓] User '%new_usr%' created successfully!%RESET%
) else (
    echo %RED%[X] Failed to create user. It might already exist or the name is invalid.%RESET%
)
echo.
pause
goto menu_users


:delete_user
cls
echo %CYAN%====================================================%RESET%
echo %RED%                Delete User Account%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[!] WARNING: This action cannot be undone.%RESET%
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "del_usr=%YELLOW%Enter the username to DELETE: %RESET%"

if "%del_usr%"=="0" goto menu_users
if "%del_usr%"=="" goto menu_users

echo.
echo %YELLOW%Attempting to delete user '%del_usr%'...%RESET%
net user "%del_usr%" /delete >nul 2>&1

if %errorlevel% equ 0 (
    echo %GREEN%[✓] User '%del_usr%' deleted successfully!%RESET%
) else (
    echo %RED%[X] Failed to delete user. Make sure the name is correct.%RESET%
    echo %WHITE%Note: You cannot delete the account you are currently logged into.%RESET%
)
echo.
pause
goto menu_users


:rename_user
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%               Rename User Account%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "old_name=%YELLOW%Enter the CURRENT username: %RESET%"

if "%old_name%"=="0" goto menu_users
if "%old_name%"=="" goto menu_users

set /p "new_name=%YELLOW%Enter the NEW username: %RESET%"

if "%new_name%"=="0" goto menu_users
if "%new_name%"=="" goto menu_users

echo.
echo %YELLOW%Renaming '%old_name%' to '%new_name%'...%RESET%
wmic useraccount where name="%old_name%" rename "%new_name%" >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -Command "Rename-LocalUser -Name '%old_name%' -NewName '%new_name%'" >nul 2>&1
)

if %errorlevel% equ 0 (
    echo %GREEN%[✓] Success! User '%old_name%' is now named '%new_name%'.%RESET%
) else (
    echo %RED%[X] Failed to rename user. Make sure the current username is correct.%RESET%
)
echo.
pause
goto menu_users


:change_password
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%              Change User Password%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "target_usr=%YELLOW%Enter the username: %RESET%"

if "%target_usr%"=="0" goto menu_users
if "%target_usr%"=="" goto menu_users

set /p "target_pass=%YELLOW%Enter the NEW password (leave blank to remove): %RESET%"
echo.
echo %YELLOW%Changing password for '%target_usr%'...%RESET%
net user "%target_usr%" "%target_pass%" >nul 2>&1

if %errorlevel% equ 0 (
    echo %GREEN%[✓] Password changed successfully for '%target_usr%'!%RESET%
) else (
    echo %RED%[X] Failed. Make sure you typed the username correctly.%RESET%
)
echo.
pause
goto menu_users


:grant_admin
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Grant Administrator Privileges%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "admin_usr=%YELLOW%Enter the username to promote to Admin: %RESET%"

if "%admin_usr%"=="0" goto menu_users
if "%admin_usr%"=="" goto menu_users

echo.
echo %YELLOW%Promoting '%admin_usr%' to Administrator...%RESET%
set "AdminGroup="
for /f "delims=" %%G in ('powershell -NoProfile -Command "(Get-LocalGroup | Where-Object { $_.SID -eq 'S-1-5-32-544' }).Name"') do set "AdminGroup=%%G"

net localgroup "%AdminGroup%" "%admin_usr%" /add >nul 2>&1

if %errorlevel% equ 0 (
    echo %GREEN%[✓] Success! User '%admin_usr%' is now an Administrator.%RESET%
) else (
    echo %RED%[X] Failed. User might already be an admin, or the name is incorrect.%RESET%
)
echo.
pause
goto menu_users


:revoke_admin
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%      Revoke Administrator Privileges (Demote)%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "std_usr=%YELLOW%Enter the username to demote to Standard: %RESET%"

if "%std_usr%"=="0" goto menu_users
if "%std_usr%"=="" goto menu_users

echo.
echo %YELLOW%Removing '%std_usr%' from Administrators...%RESET%
set "AdminGroup="
for /f "delims=" %%G in ('powershell -NoProfile -Command "(Get-LocalGroup | Where-Object { $_.SID -eq 'S-1-5-32-544' }).Name"') do set "AdminGroup=%%G"

net localgroup "%AdminGroup%" "%std_usr%" /delete >nul 2>&1

if %errorlevel% equ 0 (
    echo %GREEN%[✓] Success! User '%std_usr%' is now a Standard User.%RESET%
) else (
    echo %RED%[X] Failed. User might not be an admin, or the name is incorrect.%RESET%
    echo %WHITE%Note: You cannot demote the built-in Administrator account.%RESET%
)
echo.
pause
goto menu_users


:hide_account
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Hide Account from Login Screen%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "hide_usr=%YELLOW%Enter the username to hide: %RESET%"

if "%hide_usr%"=="0" goto menu_users
if "%hide_usr%"=="" goto menu_users

echo.
echo %YELLOW%Hiding user '%hide_usr%'...%RESET%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v "%hide_usr%" /t REG_DWORD /d 0 /f >nul 2>&1

echo %GREEN%[✓] User '%hide_usr%' is now hidden from the login screen!%RESET%
echo %WHITE%Note: To login to this account, you will need to type its name manually.%RESET%
echo.
pause
goto menu_users


:unhide_account
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%        Show Hidden Account on Login Screen%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "unhide_usr=%YELLOW%Enter the username to show (unhide): %RESET%"

if "%unhide_usr%"=="0" goto menu_users
if "%unhide_usr%"=="" goto menu_users

echo.
echo %YELLOW%Restoring user '%unhide_usr%' to the login screen...%RESET%
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v "%unhide_usr%" /f >nul 2>&1

echo %GREEN%[✓] User '%unhide_usr%' is now visible on the login screen again!%RESET%
echo.
pause
goto menu_users


:toggle_user_status
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Freeze / Unfreeze User Account%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "status_usr=%YELLOW%Enter the username: %RESET%"

if "%status_usr%"=="0" goto menu_users
if "%status_usr%"=="" goto menu_users

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%[1]%RESET% Freeze Account (Disable from Login)
echo %WHITE%[2]%RESET% Unfreeze Account (Enable for Login)
echo %RED%[0]%RESET% Cancel
echo %CYAN%----------------------------------------------------%RESET%
set /p "status_ch=%YELLOW%Choose action: %RESET%"

if "%status_ch%"=="1" (
    net user "%status_usr%" /active:no >nul 2>&1
    echo.
    echo %GREEN%[✓] Account '%status_usr%' is now FROZEN and Disabled.%RESET%
    echo.
    pause
    goto menu_users
)
if "%status_ch%"=="2" (
    net user "%status_usr%" /active:yes >nul 2>&1
    echo.
    echo %GREEN%[✓] Account '%status_usr%' is now ACTIVE and Enabled.%RESET%
    echo.
    pause
    goto menu_users
)
goto menu_users


:toggle_builtin_admin
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Toggle Built-in Administrator%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Locating the exact Built-in Administrator name for your OS language...%RESET%
set "BuiltInAdmin="
for /f "delims=" %%G in ('powershell -NoProfile -Command "(Get-LocalUser | Where-Object { $_.SID -like '*-500' }).Name"') do set "BuiltInAdmin=%%G"

if "%BuiltInAdmin%"=="" (
    echo %RED%[X] Error: Could not locate the Built-in Administrator account.%RESET%
    pause
    goto menu_users
)

echo %YELLOW%Found Built-in Admin: %BuiltInAdmin%%RESET%
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%[1]%RESET% Enable Built-in Administrator
echo %WHITE%[2]%RESET% Disable Built-in Administrator
echo %RED%[0]%RESET% Cancel
echo %CYAN%----------------------------------------------------%RESET%
set /p "admin_ch=%YELLOW%Choose action: %RESET%"

if "%admin_ch%"=="1" (
    net user "%BuiltInAdmin%" /active:yes >nul 2>&1
    echo.
    echo %GREEN%[✓] Built-in Administrator is now ENABLED!%RESET%
    echo.
    pause
    goto menu_users
)
if "%admin_ch%"=="2" (
    net user "%BuiltInAdmin%" /active:no >nul 2>&1
    echo.
    echo %GREEN%[✓] Built-in Administrator is now DISABLED!%RESET%
    echo.
    pause
    goto menu_users
)
goto menu_users


:user_info
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%            Detailed User Information%RESET%
echo %CYAN%====================================================%RESET%
echo.
call :show_users_list
echo %RED%[0]%RESET% Cancel and Back
echo %CYAN%----------------------------------------------------%RESET%
set /p "info_usr=%YELLOW%Enter the username to view details: %RESET%"

if "%info_usr%"=="0" goto menu_users
if "%info_usr%"=="" goto menu_users

cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%      Report for User: %info_usr%%RESET%
echo %CYAN%====================================================%RESET%
echo.
net user "%info_usr%"
echo.
echo %CYAN%====================================================%RESET%
pause
goto menu_users

:tweak_menu_delay
echo.
echo %YELLOW%Reducing Menu Show Delay to 10ms...%RESET%
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 10 /f >nul 2>&1
echo %GREEN%[✓] UI is now snappier!%RESET%
pause
goto menu_tweaks

:tweak_win11_menu
echo.
echo %YELLOW%Restoring Classic Right-Click Context Menu...%RESET%
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo %GREEN%[✓] Classic Menu Restored!%RESET%
pause
goto menu_tweaks

:tweak_lock_screen
echo.
echo %YELLOW%Disabling Windows Lock Screen...%RESET%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f >nul 2>&1
echo %GREEN%[✓] Lock screen disabled. Windows will now boot directly to the password prompt.%RESET%
pause
goto menu_tweaks

:tweak_visuals
echo.
echo %YELLOW%Disabling Heavy Visual Effects (Best Performance Mode)...%RESET%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
echo %GREEN%[✓] Visual effects optimized for maximum performance!%RESET%
pause
goto menu_tweaks

:tweak_network
echo.
echo %YELLOW%Disabling Network Throttling ^& Gaming Responsiveness...%RESET%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[✓] Network restrictions lifted. Ping optimized!%RESET%
pause
goto menu_tweaks

:tweak_bing
echo.
echo %YELLOW%Disabling Bing Web Search in Start Menu...%RESET%
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo %GREEN%[✓] Local search is now blazing fast without internet results!%RESET%
pause
goto menu_tweaks

:tweak_sysmain
echo.
echo %YELLOW%Disabling SysMain (Superfetch) Service...%RESET%
sc config "SysMain" start=disabled >nul 2>&1
net stop "SysMain" >nul 2>&1
echo %GREEN%[✓] SysMain Disabled. 100%% Disk Usage issues should be resolved.%RESET%
pause
goto menu_tweaks

:tweak_gamedvr
echo.
echo %YELLOW%Disabling Game DVR ^& Background Recording...%RESET%
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[✓] Game DVR Disabled. Stuttering in games should be reduced!%RESET%
pause
goto menu_tweaks

:tweak_mouse
echo.
echo %YELLOW%Disabling Mouse Acceleration (Enhance Pointer Precision)...%RESET%
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul 2>&1
echo %GREEN%[✓] Mouse Acceleration Disabled. You now have 100%% Raw Aim Input!%RESET%
pause
goto menu_tweaks

:tweak_hibernation
echo.
echo %YELLOW%Disabling Hibernation...%RESET%
powercfg -h off >nul 2>&1
echo %GREEN%[✓] Hibernation Disabled. Gigabytes of disk space freed up!%RESET%
pause
goto menu_tweaks

:tweak_vbs
echo.
echo %YELLOW%Disabling Virtualization-Based Security (VBS) ^& Memory Integrity...%RESET%
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[✓] VBS Disabled! Expect higher FPS in Windows 11.%RESET%
pause
goto menu_tweaks

:tweak_power
echo.
echo %YELLOW%Enabling Ultimate Performance Power Plan...%RESET%
for /f "tokens=4" %%a in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do powercfg -setactive %%a >nul 2>&1
echo %GREEN%[✓] Ultimate Performance Mode Enabled!%RESET%
pause
goto menu_tweaks

:tweak_stickykeys
echo.
echo %YELLOW%Disabling Sticky Keys ^& Filter Keys...%RESET%
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f >nul 2>&1
echo %GREEN%[✓] Sticky Keys Disabled. Mash your Shift key safely!%RESET%
pause
goto menu_tweaks

:tweak_p2p
echo.
echo %YELLOW%Disabling P2P Windows Updates (Delivery Optimization)...%RESET%
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[✓] P2P Updates Disabled! Windows will no longer upload updates from your PC.%RESET%
pause
goto menu_tweaks

:tweak_all
echo.
echo %YELLOW%Applying ALL Performance ^& UI Tweaks... Please wait.%RESET%
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 10 /f >nul 2>&1
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
sc config "SysMain" start=disabled >nul 2>&1
net stop "SysMain" >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul 2>&1
powercfg -h off >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f >nul 2>&1
for /f "tokens=4" %%a in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do powercfg -setactive %%a >nul 2>&1

echo %GREEN%[✓] ALL Recommended Tweaks Applied Successfully!%RESET%
echo %WHITE%(Note: Please restart your PC for all changes to take full effect).%RESET%
pause
goto menu_tweaks

:tweak_restore
cls
echo %CYAN%====================================================%RESET%
echo %RED%           Restoring Windows Default Settings%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Reverting all tweaks back to their original factory state...%RESET%
echo.

reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 400 /f >nul 2>&1

reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1

reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /f >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul 2>&1

reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 510 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 126 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 62 /f >nul 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 10 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f >nul 2>&1

reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /f >nul 2>&1

reg delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /f >nul 2>&1

sc config "SysMain" start=auto >nul 2>&1
net start "SysMain" >nul 2>&1

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /f >nul 2>&1

reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f >nul 2>&1

powercfg -h on >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 1 /f >nul 2>&1

powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1

echo %WHITE%Removing Ultimate Performance profiles...%RESET%
for /f "tokens=4" %%i in ('powercfg -list ^| findstr /i "Ultimate"') do (
    powercfg -delete %%i >nul 2>&1
)

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo %GREEN%[✓] All Windows Defaults Restored Successfully!%RESET%
echo %WHITE%(Note: Please restart your PC to ensure all services return to normal).%RESET%
pause
goto menu_tweaks

:about
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%                 About Developer%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Developer:%RESET% Hesham Taha
echo %WHITE%YouTube:%RESET% Hesham Taha
echo %WHITE%Facebook:%RESET% Hesham Taha Official
echo %WHITE%Version:%RESET% 1.5
echo.

echo %YELLOW%Opening links...%RESET%

timeout /t 2 >nul

start "" "https://www.youtube.com/@heshamtaha1"
start "" "https://facebook.com/HeshamTahaOfficial"

pause
goto menu

:: --- CALL FUNCTIONS ---

:show_users_list
echo %WHITE%Current Users on this PC:%RESET%
net user | findstr /V "Command The"
echo.
exit /b

:AUTO_UPDATE
setlocal EnableDelayedExpansion

set CURRENT_VERSION=1.5
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

    if "!ONLINE_VERSION!"=="%CURRENT_VERSION%" (
        endlocal
        exit /b
    )

    powershell -Command "(New-Object Net.WebClient).DownloadFile('%TOOL_URL%', '%NEW_FILE%')" >nul 2>&1

    if exist "%NEW_FILE%" (

        (
        echo @echo off
        echo timeout /t 2 ^>nul
        echo copy /y "%NEW_FILE%" "%~f0" ^>nul
        echo start "" "%~f0"
        echo del "%NEW_FILE%" ^>nul 2^>^&1
        echo del "%%~f0" ^>nul 2^>^&1
        ) > "%UPDATER%"

        cls
        echo =========================================
        echo %YELLOW%            NEW UPDATE FOUND%RESET%
        echo =========================================
        echo.
        echo Updating tool to version [%GREEN%!ONLINE_VERSION!%RESET%]
        echo Please wait...
        echo.

        timeout /t 2 >nul
        start "" "%UPDATER%"
        exit
    )
)

endlocal
exit /b
