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
:: WINDOW TRANSPARENCY (optional)
:: ====================================================
set WRT_ALPHA=230
powershell -NoProfile -Command "$a=[int]$env:WRT_ALPHA; if($a -lt 76 -or $a -gt 255){$a=230}; Add-Type -Namespace Win -Name Api -MemberDefinition '[DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow(); [DllImport(\"user32.dll\")] public static extern int GetWindowLong(IntPtr h,int i); [DllImport(\"user32.dll\")] public static extern int SetWindowLong(IntPtr h,int i,int v); [DllImport(\"user32.dll\")] public static extern bool SetLayeredWindowAttributes(IntPtr h,uint k,byte a,uint f);'; $h=[Win.Api]::GetConsoleWindow(); if($h -ne [IntPtr]::Zero){$s=[Win.Api]::GetWindowLong($h,-20); [Win.Api]::SetWindowLong($h,-20,($s -bor 0x80000))|Out-Null; [Win.Api]::SetLayeredWindowAttributes($h,0,[byte]$a,2)|Out-Null}" >nul 2>&1

:: ====================================================
:: MAIN MENU
:: ====================================================
call :AUTO_UPDATE
:menu
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%            Windows Repair Tool Pro v1.7%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %GREEN%[0]%RESET% %GREEN%Create Restore Point%RESET%
echo %WHITE%[1]%RESET% Optimize OS
echo %WHITE%[2]%RESET% Disk Tools
echo %WHITE%[3]%RESET% Advanced Tools
echo %WHITE%[4]%RESET% Repair OS
echo %WHITE%[5]%RESET% Security ^& Privacy
echo %WHITE%[6]%RESET% Drivers Manager (Updates ^& Backup)
echo %WHITE%[7]%RESET% Silent Apps Installer (Winget)
echo %WHITE%[8]%RESET% Windows Maintenance Tools
echo %WHITE%[9]%RESET% User Accounts Manager
echo %WHITE%[10]%RESET% Windows Tweaks (Performance ^& UI)
echo %WHITE%[11]%RESET% Windows ^& Office Licensing %YELLOW%[NEW]%RESET%
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
if "%choice%"=="11" goto menu_windows_office

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
echo %WHITE%[1]%RESET% DISM Health Check ^& Repair
echo %WHITE%[2]%RESET% Clean Component Store (WinSxS Deep Clean)
echo %WHITE%[3]%RESET% Clean Old Windows Updates (Windows.old)
echo %WHITE%[4]%RESET% Clean Crash Dumps Files
echo %WHITE%[5]%RESET% SFC Check ^& Repair
echo %WHITE%[6]%RESET% Clean Temporary ^& Junk Files
echo %WHITE%[7]%RESET% Optimize Internet ^& DNS
echo %WHITE%[8]%RESET% Clear Event Viewer Logs
echo %WHITE%[9]%RESET% Clear Error Logs ^& Crash Reports
echo %WHITE%[10]%RESET% Clear GPU Cache (NVIDIA ^& AMD)
echo %WHITE%[11]%RESET% Deep RAM Optimizer (via RAMMap)
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %GREEN%[12]%RESET% %GREEN%Smart Quick Repair ^& Cleanup (1, 5, 6)%RESET%
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
echo %WHITE%[9]%RESET% Windows Services Diagnostic
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
if "%rep_choice%"=="9" goto services_diagnostic
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

:menu_windows_office
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%              Windows ^& Office Licensing%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %CYAN%[ WINDOWS ]%RESET%
echo %WHITE%[1]%RESET% Activate Windows with a Product Key
echo %WHITE%[2]%RESET% Change Windows Edition
echo %RED%[3]%RESET% %RED%Remove Installed Windows Product Key%RESET%
echo.
echo %CYAN%[ OFFICE ]%RESET%
echo %WHITE%[4]%RESET% Activate Office with a Volume License Key
echo %WHITE%[5]%RESET% Change Office License Type / Edition
echo %RED%[6]%RESET% %RED%Remove Detected Office Product Key(s)%RESET%
echo %RED%[7]%RESET% %RED%Uninstall Microsoft Office Completely%RESET%
echo.
echo %RED%[0]%RESET% Back to Main Menu
echo.
echo %CYAN%----------------------------------------------------%RESET%
set "wo_choice="
set /p "wo_choice=%YELLOW%Enter your choice: %RESET%"

if "%wo_choice%"=="1" goto wo_win_activate
if "%wo_choice%"=="2" goto wo_win_convert
if "%wo_choice%"=="3" goto wo_win_remove_key
if "%wo_choice%"=="4" goto wo_office_activate
if "%wo_choice%"=="5" goto wo_office_convert
if "%wo_choice%"=="6" goto wo_office_remove_key
if "%wo_choice%"=="7" goto wo_office_uninstall
if "%wo_choice%"=="0" goto menu
goto menu_windows_office

:: --- FUNCTIONS ---

:dism
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%       Windows Image Health Check ^& Repair%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%WinRTP will scan Windows before attempting any repair.%RESET%
echo.

echo %CYAN%[1/3] Running DISM CheckHealth...%RESET%
echo.

DISM /Online /Cleanup-Image /CheckHealth

if errorlevel 1 (
    echo.
    echo %RED%[X] DISM CheckHealth failed.%RESET%
    echo %YELLOW%Check DISM.log for more information.%RESET%
    echo.
    pause
    goto menu_optimize
)

echo.
echo %GREEN%[OK] Quick health check completed.%RESET%
echo.

echo %CYAN%[2/3] Running DISM ScanHealth...%RESET%
echo %WHITE%This scan may take several minutes...%RESET%
echo.

DISM /Online /Cleanup-Image /ScanHealth

if errorlevel 1 (
    echo.
    echo %RED%[X] DISM ScanHealth failed.%RESET%
    echo %YELLOW%Check DISM.log for more information.%RESET%
    echo.
    pause
    goto menu_optimize
)

echo.
echo %GREEN%[OK] Deep health scan completed.%RESET%
echo.

set "IMAGE_HEALTH="

for /f "usebackq delims=" %%H in (`powershell.exe -NoProfile -Command ^
    "$r = Repair-WindowsImage -Online -CheckHealth -ErrorAction SilentlyContinue; if($r){$r.ImageHealthState}"`) do (
    set "IMAGE_HEALTH=%%H"
)

if /I "%IMAGE_HEALTH%"=="Healthy" (
    echo %CYAN%====================================================%RESET%
    echo %GREEN%             Windows Image is Healthy%RESET%
    echo %CYAN%====================================================%RESET%
    echo.
    echo %GREEN%[OK] No component store corruption was detected.%RESET%
    echo %WHITE%RestoreHealth is not required.%RESET%
    echo.
    pause
    goto menu_optimize
)

if /I "%IMAGE_HEALTH%"=="Repairable" (
    echo %YELLOW%[!] Component store corruption was detected.%RESET%
    echo %WHITE%WinRTP will now start RestoreHealth automatically.%RESET%
    echo.
    echo %CYAN%[3/3] Running DISM RestoreHealth...%RESET%
    echo.

    DISM /Online /Cleanup-Image /RestoreHealth

    if errorlevel 1 (
        echo.
        echo %RED%[X] DISM RestoreHealth failed.%RESET%
        echo %YELLOW%Windows could not complete the repair.%RESET%
        echo %WHITE%Check C:\Windows\Logs\DISM\dism.log for details.%RESET%
        echo.
        pause
        goto menu_optimize
    )

    echo.
    echo %GREEN%[OK] Windows image repair completed successfully.%RESET%
    echo.
    echo %WHITE%Running final health verification...%RESET%
    echo.

    DISM /Online /Cleanup-Image /CheckHealth

    set "FINAL_HEALTH="
    for /f "usebackq delims=" %%H in (`powershell.exe -NoProfile -Command "$r = Repair-WindowsImage -Online -CheckHealth -ErrorAction SilentlyContinue; if($r){$r.ImageHealthState}"`) do (
        set "FINAL_HEALTH=%%H"
    )

    echo.
    if /I "%FINAL_HEALTH%"=="Healthy" (
        echo %GREEN%[OK] Repair verified: Windows image is now Healthy.%RESET%
    ) else (
        echo %YELLOW%[!] Repair finished, but the image may still need attention.%RESET%
        echo %WHITE%Check C:\Windows\Logs\DISM\dism.log for details.%RESET%
    )
    echo.
    pause
    goto menu_optimize
)

if /I "%IMAGE_HEALTH%"=="NonRepairable" (
    echo %CYAN%====================================================%RESET%
    echo %RED%          Windows Image Cannot Be Repaired%RESET%
    echo %CYAN%====================================================%RESET%
    echo.
    echo %RED%[X] Severe component store corruption was detected.%RESET%
    echo %YELLOW%DISM reports that the image is non-repairable.%RESET%
    echo.
    echo %WHITE%RestoreHealth will NOT be started automatically.%RESET%
    echo %WHITE%You may need a Windows repair install or another repair source.%RESET%
    echo.
    pause
    goto menu_optimize
)

echo %YELLOW%[!] WinRTP could not determine the Windows image health state.%RESET%
echo %WHITE%No automatic repair was started for safety.%RESET%
echo.
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
echo %GREEN%[OK] Cleanup Completed Successfully.%RESET%
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

echo %GREEN%[OK] Updates Cleanup Completed Successfully.%RESET%
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
echo %GREEN%[OK] Crash Dumps and System Logs cleaned!%RESET%
pause
goto menu_optimize

:sfc
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%             Smart SFC Check ^& Repair%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%WinRTP will check Windows system files first.%RESET%
echo %WHITE%Repair will only start if problems are detected.%RESET%
echo.

echo %CYAN%[1/2] Checking Windows system files...%RESET%
echo %WHITE%No changes will be made during this scan.%RESET%
echo.

sfc /verifyonly

set "SFC_STATE=30"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -TypeDefinition 'using System; using System.Text; using System.Runtime.InteropServices; public static class WinRTPConsole { [StructLayout(LayoutKind.Sequential)] public struct COORD { public short X; public short Y; } [StructLayout(LayoutKind.Sequential)] public struct SMALL_RECT { public short Left; public short Top; public short Right; public short Bottom; } [StructLayout(LayoutKind.Sequential)] public struct INFO { public COORD dwSize; public COORD dwCursorPosition; public short wAttributes; public SMALL_RECT srWindow; public COORD dwMaximumWindowSize; } [DllImport(\"kernel32.dll\")] public static extern IntPtr GetStdHandle(int n); [DllImport(\"kernel32.dll\")] public static extern bool GetConsoleScreenBufferInfo(IntPtr h, out INFO i); [DllImport(\"kernel32.dll\", CharSet=CharSet.Unicode)] public static extern bool ReadConsoleOutputCharacter(IntPtr h, StringBuilder b, uint len, COORD c, out uint n); }'; $h=[WinRTPConsole]::GetStdHandle(-11); $i=New-Object WinRTPConsole+INFO; if(-not [WinRTPConsole]::GetConsoleScreenBufferInfo($h,[ref]$i)){exit 30}; $w=[int]$i.dwSize.X; $y=[int]$i.dwCursorPosition.Y; $start=[Math]::Max(0,$y-40); $len=($y-$start+1)*$w; $b=New-Object System.Text.StringBuilder $len; $c=New-Object WinRTPConsole+COORD; $c.X=0; $c.Y=[int16]$start; [uint32]$read=0; if(-not [WinRTPConsole]::ReadConsoleOutputCharacter($h,$b,[uint32]$len,$c,[ref]$read)){exit 30}; $t=$b.ToString(); if($t -match 'Windows Resource Protection did not find any integrity violations'){exit 10}else{exit 20}"

set "SFC_STATE=%ERRORLEVEL%"

echo.
echo %WHITE%Analyzing scan result...%RESET%
echo.

if "%SFC_STATE%"=="10" goto smart_sfc_healthy
goto smart_sfc_repair


:smart_sfc_healthy
echo %CYAN%====================================================%RESET%
echo %GREEN%              System Files Are Healthy%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %GREEN%[OK] No integrity violations were detected.%RESET%
echo %WHITE%SFC /Scannow is not required.%RESET%
echo.
pause
goto menu_optimize


:smart_sfc_repair
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Integrity Violations Detected%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%[!] The verification result was not clean.%RESET%
echo %WHITE%WinRTP will now start SFC /Scannow automatically.%RESET%
echo.
echo %CYAN%[2/2] Running SFC /Scannow...%RESET%
echo %WHITE%Please wait. This process may take several minutes.%RESET%
echo.

sfc /scannow

echo.
echo %CYAN%====================================================%RESET%
echo %GREEN%              SFC /Scannow Finished%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Review the Windows Resource Protection result shown above.%RESET%
echo.
pause
goto menu_optimize

:clean
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%        Smart Clean: Temporary ^& Junk Files%RESET%
echo %CYAN%====================================================%RESET%
echo.

for /f "usebackq delims=" %%F in (`powershell -NoProfile -Command "(Get-PSDrive -Name $env:systemdrive.Substring(0,1)).Free"`) do set "SPACE_BEFORE=%%F"

echo %WHITE%Cleaning temporary and junk files, please wait...%RESET%
echo.

del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
for /d %%p in ("C:\Windows\Temp\*") do rmdir /s /q "%%p" >nul 2>&1

del /q /f /s "%temp%\*" >nul 2>&1
for /d %%p in ("%temp%\*") do rmdir /s /q "%%p" >nul 2>&1

del /q /f /s "%systemdrive%\Windows.old\*" >nul 2>&1
rmdir /s /q "%systemdrive%\Windows.old" >nul 2>&1

del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\INetCache\*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\WER\*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\CrashDumps\*" >nul 2>&1
del /q /f /s "%windir%\Logs\CBS\*" >nul 2>&1
del /q /f /s "%windir%\SoftwareDistribution\Download\*" >nul 2>&1

cleanmgr /sagerun:1 >nul 2>&1

for /f "usebackq delims=" %%F in (`powershell -NoProfile -Command "(Get-PSDrive -Name $env:systemdrive.Substring(0,1)).Free"`) do set "SPACE_AFTER=%%F"

for /f "usebackq delims=" %%R in (`powershell -NoProfile -Command "'{0:N2}' -f (([Int64]%SPACE_AFTER% - [Int64]%SPACE_BEFORE%) / 1GB)"`) do set "FREED_GB=%%R"
for /f "usebackq delims=" %%R in (`powershell -NoProfile -Command "'{0:N2}' -f ([Int64]%SPACE_AFTER% / 1GB)"`) do set "REMAINING_GB=%%R"

echo.
echo %CYAN%====================================================%RESET%
echo %GREEN%              Cleaning Completed Successfully%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Space freed:%RESET%     %GREEN%%FREED_GB% GB%RESET%
echo %WHITE%Remaining free space on %systemdrive%%RESET%  %CYAN%%REMAINING_GB% GB%RESET%
echo.
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
echo %GREEN%[OK] Internet and DNS Optimized Successfully!%RESET%
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
echo %GREEN%[OK] All Event Logs Cleared Successfully!%RESET%
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
echo %GREEN%[OK] Delivery Optimization Cache Cleaned Successfully!%RESET%
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
echo %GREEN%[OK] GPU Cache Cleared Successfully!%RESET%
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

set "RAMMAP_DIR=C:\WinRTP"
set "RAMMAP_EXE=%RAMMAP_DIR%\rammap64.exe"

if not exist "%RAMMAP_EXE%" (
    echo %WHITE%RAMMap tool is not found on your system.%RESET%
    echo %YELLOW%Creating folder and downloading RAMMap...%RESET%

    if not exist "%RAMMAP_DIR%" mkdir "%RAMMAP_DIR%"

    curl -s -L -o "%RAMMAP_EXE%" "https://live.sysinternals.com/rammap64.exe"

    if exist "%RAMMAP_EXE%" (
        echo %GREEN%[OK] RAMMap downloaded successfully!%RESET%
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
    echo %GREEN%[OK] Standby List Emptied Successfully!%RESET%
    pause
    goto rammap_menu
)

if "%ram_choice%"=="2" (
    echo.
    echo %YELLOW%Emptying Working Sets...%RESET%
    "C:\WinRTP\rammap64.exe" -accepteula -Ew
    echo %GREEN%[OK] Working Sets Emptied Successfully!%RESET%
    pause
    goto rammap_menu
)

if "%ram_choice%"=="3" (
    echo.
    echo %YELLOW%Running full cleanup...%RESET%
    "C:\WinRTP\rammap64.exe" -accepteula -Ew
    "C:\WinRTP\rammap64.exe" -accepteula -Et
    echo %GREEN%[OK] Full cleanup completed!%RESET%
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
    
    echo %GREEN%[OK] Auto-RAM Cleanup Enabled Successfully!%RESET%
    echo %WHITE%Your RAM will now be optimized automatically every hour in the background.%RESET%
    pause
    goto rammap_menu
)

if "%ram_choice%"=="5" (
    echo.
    echo %YELLOW%Stopping and Removing Auto-RAM Cleanup Task...%RESET%
    
    schtasks /delete /tn "WinRTP_AutoRAM" /f >nul 2>&1
    if exist "C:\WinRTP\AutoRAMClean.bat" del /f /q "C:\WinRTP\AutoRAMClean.bat" >nul 2>&1
    
    echo %GREEN%[OK] Auto-RAM Cleanup Disabled Successfully!%RESET%
    pause
    goto rammap_menu
)

goto rammap_menu

:quick_optimize
cls

echo %CYAN%====================================================%RESET%
echo %YELLOW%            [1/3] Checking Windows Image%RESET%
echo %CYAN%====================================================%RESET%
echo.

DISM /Online /Cleanup-Image /CheckHealth

if errorlevel 1 (
    echo.
    echo %RED%[X] DISM CheckHealth failed. Skipping DISM step.%RESET%
    echo.
    goto q_after_dism
)

DISM /Online /Cleanup-Image /ScanHealth

if errorlevel 1 (
    echo.
    echo %RED%[X] DISM ScanHealth failed. Skipping DISM step.%RESET%
    echo.
    goto q_after_dism
)

set "Q_IMAGE_HEALTH="

for /f "usebackq delims=" %%H in (`powershell.exe -NoProfile -Command ^
    "$r = Repair-WindowsImage -Online -CheckHealth -ErrorAction SilentlyContinue; if($r){$r.ImageHealthState}"`) do (
    set "Q_IMAGE_HEALTH=%%H"
)

if /I "%Q_IMAGE_HEALTH%"=="Healthy" (
    echo.
    echo %GREEN%[OK] No component store corruption was detected.%RESET%
)

if /I "%Q_IMAGE_HEALTH%"=="Repairable" (
    echo.
    echo %YELLOW%[!] Component store corruption detected. Repairing...%RESET%
    echo.
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo %GREEN%[OK] DISM repair finished.%RESET%
)

if /I "%Q_IMAGE_HEALTH%"=="NonRepairable" (
    echo.
    echo %RED%[X] Severe corruption detected. DISM cannot fix this automatically.%RESET%
)

:q_after_dism
echo.

echo %CYAN%====================================================%RESET%
echo %YELLOW%            [2/3] Checking System Files%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Checking Windows system files...%RESET%
echo.

sfc /verifyonly

echo.
echo %WHITE%Analyzing SFC result...%RESET%
echo.

set "Q_SFC_STATE=30"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -TypeDefinition 'using System; using System.Text; using System.Runtime.InteropServices; public static class WinRTPConsole { [StructLayout(LayoutKind.Sequential)] public struct COORD { public short X; public short Y; } [StructLayout(LayoutKind.Sequential)] public struct SMALL_RECT { public short Left; public short Top; public short Right; public short Bottom; } [StructLayout(LayoutKind.Sequential)] public struct INFO { public COORD dwSize; public COORD dwCursorPosition; public short wAttributes; public SMALL_RECT srWindow; public COORD dwMaximumWindowSize; } [DllImport(\"kernel32.dll\")] public static extern IntPtr GetStdHandle(int n); [DllImport(\"kernel32.dll\")] public static extern bool GetConsoleScreenBufferInfo(IntPtr h, out INFO i); [DllImport(\"kernel32.dll\", CharSet=CharSet.Unicode)] public static extern bool ReadConsoleOutputCharacter(IntPtr h, StringBuilder b, uint len, COORD c, out uint n); }'; $h=[WinRTPConsole]::GetStdHandle(-11); $i=New-Object WinRTPConsole+INFO; if(-not [WinRTPConsole]::GetConsoleScreenBufferInfo($h,[ref]$i)){exit 30}; $w=[int]$i.dwSize.X; $y=[int]$i.dwCursorPosition.Y; $start=[Math]::Max(0,$y-40); $len=($y-$start+1)*$w; $b=New-Object System.Text.StringBuilder $len; $c=New-Object WinRTPConsole+COORD; $c.X=0; $c.Y=[int16]$start; [uint32]$read=0; if(-not [WinRTPConsole]::ReadConsoleOutputCharacter($h,$b,[uint32]$len,$c,[ref]$read)){exit 30}; $t=$b.ToString(); if($t -match 'Windows Resource Protection did not find any integrity violations'){exit 10}else{exit 20}"

set "Q_SFC_STATE=%ERRORLEVEL%"

if "%Q_SFC_STATE%"=="10" goto q_sfc_healthy
goto q_sfc_repair


:q_sfc_healthy
echo.
echo %GREEN%[OK] No integrity violations were detected.%RESET%
echo %WHITE%SFC /Scannow is not required.%RESET%
echo.
goto q_after_sfc


:q_sfc_repair
echo.
echo %YELLOW%[!] System file problems were detected.%RESET%
echo %WHITE%WinRTP will now run SFC /Scannow automatically.%RESET%
echo.
echo %CYAN%Running SFC /Scannow...%RESET%
echo %WHITE%Please wait. This process may take several minutes.%RESET%
echo.

sfc /scannow

echo.
echo %GREEN%[OK] SFC /Scannow finished.%RESET%
echo %WHITE%Review the Windows Resource Protection result shown above.%RESET%
echo.
goto q_after_sfc


:q_after_sfc
echo.

echo %CYAN%====================================================%RESET%
echo %YELLOW%            [3/3] Cleaning Junk Files%RESET%
echo %CYAN%====================================================%RESET%
echo.

for /f "usebackq delims=" %%F in (`powershell -NoProfile -Command "(Get-PSDrive -Name $env:systemdrive.Substring(0,1)).Free"`) do set "Q_SPACE_BEFORE=%%F"

del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
for /d %%p in ("C:\Windows\Temp\*") do rmdir /s /q "%%p" >nul 2>&1

del /q /f /s "%temp%\*" >nul 2>&1
for /d %%p in ("%temp%\*") do rmdir /s /q "%%p" >nul 2>&1

del /q /f /s "%systemdrive%\Windows.old\*" >nul 2>&1
rmdir /s /q "%systemdrive%\Windows.old" >nul 2>&1

del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\INetCache\*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\WER\*" >nul 2>&1
del /q /f /s "%LOCALAPPDATA%\CrashDumps\*" >nul 2>&1
del /q /f /s "%windir%\Logs\CBS\*" >nul 2>&1
del /q /f /s "%windir%\SoftwareDistribution\Download\*" >nul 2>&1

cleanmgr /sagerun:1 >nul 2>&1

for /f "usebackq delims=" %%F in (`powershell -NoProfile -Command "(Get-PSDrive -Name $env:systemdrive.Substring(0,1)).Free"`) do set "Q_SPACE_AFTER=%%F"

for /f "usebackq delims=" %%R in (`powershell -NoProfile -Command "'{0:N2}' -f (([Int64]%Q_SPACE_AFTER% - [Int64]%Q_SPACE_BEFORE%) / 1GB)"`) do set "Q_FREED_GB=%%R"

echo.
echo %GREEN%[OK] Space freed: %Q_FREED_GB% GB%RESET%
echo.

echo %CYAN%====================================================%RESET%
echo %GREEN%     Smart Quick Repair ^& Cleanup Completed!%RESET%
echo %CYAN%====================================================%RESET%
echo %GREEN%Review the results above for details of each step.%RESET%
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
echo %GREEN%[OK] The check is scheduled for the next restart.%RESET%
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
    "    Write-Host '    [OK] No Scheduled Scans.' -ForegroundColor Green " ^
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

echo %GREEN%[OK] The scheduling process has been cancelled successfully.%RESET%
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
if "%defrag_drv%"=="0" goto menu_disk
set "defrag_drv=%defrag_drv::=%"

echo.
echo %YELLOW%Optimizing Drive %defrag_drv%: ... Please wait.%RESET%
defrag %defrag_drv%: /O /U /V
echo.
echo %GREEN%[OK] Disk Optimization Completed Successfully!%RESET%
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
echo %GREEN%[OK] Free space on Drive %wipe_drv%: wiped successfully!%RESET%
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
echo %GREEN%[OK] Speed test completed successfully!%RESET%
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
echo %GREEN%[OK] All files on Drive %usb_drv%: are now visible and rescued!%RESET%
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
echo %GREEN%[OK] Write Protection removed successfully from Drive %wp_drv%:%RESET%
echo %WHITE%Note: If the issue persists, the USB drive might be physically damaged.%RESET%
pause
goto menu_disk

:winget_update
call :ensure_winget
set "w_choice="
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%       Software Update Center (Winget)%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Checking for available updates... Please wait.%RESET%
echo.
winget upgrade --source winget
if %errorlevel% neq 0 (
    echo.
    echo %GREEN%[OK] All your programs are up to date!%RESET%
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
    winget upgrade --all --include-unknown --source winget
    pause
    goto winget_update
)
if "%w_choice%"=="2" goto winget_update_specific
if "%w_choice%"=="0" goto menu_advanced
goto winget_update

:winget_update_specific
set /p app_ref=%YELLOW%Enter App ID or Name: %RESET%
winget upgrade --id "%app_ref%" --include-unknown --source winget || winget upgrade --name "%app_ref%" --include-unknown --source winget
pause
goto winget_update

:ultimate_perf
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%         Enabling Ultimate Performance Mode%RESET%
echo %CYAN%====================================================%RESET%
echo.
set "GUID="
for /f "delims=" %%i in ('powershell -NoProfile -Command "(powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Select-String -Pattern '[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}').Matches.Value"') do set "GUID=%%i"

if "%GUID%"=="" (
    echo %RED%[X] Failed to create the power scheme.%RESET%
    pause
    goto menu_advanced
)

powercfg /setactive %GUID% >nul 2>&1
if not exist "C:\WinRTP" mkdir "C:\WinRTP" >nul 2>&1
echo %GUID%>> "C:\WinRTP\UltimateGUIDs.txt"

echo %GREEN%[OK] Ultimate Performance Mode Enabled Successfully!%RESET%
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
if exist "C:\WinRTP\UltimateGUIDs.txt" (
    for /f "delims=" %%i in (C:\WinRTP\UltimateGUIDs.txt) do (
        powercfg -delete %%i >nul 2>&1
    )
    del /q "C:\WinRTP\UltimateGUIDs.txt" >nul 2>&1
)

echo.
echo %GREEN%[OK] Balanced Mode Restored and Custom Profiles Cleaned!%RESET%
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
echo %GREEN%[OK] PC will shutdown in %st% minutes.%RESET%
pause
goto menu_advanced

:cancelshutdown
cls
shutdown /a >nul 2>&1
echo %GREEN%[OK] Scheduled shutdown canceled.%RESET%
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
echo %GREEN%[OK] Windows Debloat Completed Successfully.%RESET%
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

echo %GREEN%[OK] Windows Update fully disabled.%RESET%
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

echo %GREEN%[OK] Windows Update services have been restored to default.%RESET%
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

echo %GREEN%[OK] Gaming Cache Cleaned Successfully!%RESET%
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
powershell -NoProfile -Command "$key = (Get-WmiObject -Query 'select * from SoftwareLicensingService').OA3xOriginalProductKey; if ($key) { Write-Host '    [OK] OEM Key Found: ' -NoNewline -ForegroundColor Green; Write-Host $key -ForegroundColor Yellow; $path = [Environment]::GetFolderPath('Desktop') + '\Windows_OEM_Key.txt'; $key | Out-File -FilePath $path; Write-Host '    [OK] A copy has been saved to your Desktop (Windows_OEM_Key.txt)' -ForegroundColor Cyan } else { Write-Host '    [!] No OEM Key found in BIOS/UEFI. (You might be using a Retail key or Digital License)' -ForegroundColor Red }"
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
    echo %GREEN%[OK] Added Successfully! Right-click any file/folder to see it.%RESET%
    pause
    goto context_menu_mgr
)
if "%ctx_ch%"=="2" (
    echo.
    echo %YELLOW%Removing "Take Ownership" from registry...%RESET%
    reg delete "HKCR\*\shell\runas" /f >nul 2>&1
    reg delete "HKCR\Directory\shell\runas" /f >nul 2>&1
    echo %GREEN%[OK] Removed Successfully!%RESET%
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
powershell -NoProfile -Command "$events = Get-EventLog -LogName System -Source BugCheck -Newest 5 -ErrorAction SilentlyContinue; if ($events) { Write-Host 'Recent crashes found:' -ForegroundColor Red; foreach ($e in $events) { Write-Host ('Date: ' + $e.TimeGenerated) -ForegroundColor Cyan; Write-Host ('Info: ' + $e.Message) -ForegroundColor Yellow; Write-Host '----------------------------------------------------' } } else { Write-Host '    [OK] Great News! No recent Blue Screen crashes found in the Event Log.' -ForegroundColor Green }"
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
    echo %GREEN%[OK] Full System Backup Completed Successfully!%RESET%
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
set "psCommand=Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.OpenFileDialog; $f.Filter = 'Executable Files (*.exe)|*.exe'; $f.Title = 'Select the program to BLOCK'; $f.ShowHelp = $true; $f.ShowDialog() | Out-Null; $f.FileName"

set "app_path="
for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "%psCommand%"`) do set "app_path=%%I"

if "%app_path%"=="" (
    echo %RED%[X] No file selected. Going back to menu...%RESET%
    pause
    goto menu_firewall_manager
)

for %%F in ("%app_path%") do set "app_name=%%~nxF"

echo %YELLOW%Blocking "%app_name%" in Windows Firewall...%RESET%
netsh advfirewall firewall add rule name="WinRTP_Block_%app_name%" dir=out action=block program="%app_path%" >nul 2>&1
netsh advfirewall firewall add rule name="WinRTP_Block_%app_name%" dir=in action=block program="%app_path%" >nul 2>&1

echo %GREEN%[OK] Success! Internet access is permanently blocked for: %app_name%%RESET%
pause
goto menu_firewall_manager

:fw_unblock
echo.
echo %YELLOW%Opening file picker... Please select the program (.exe) to UNBLOCK.%RESET%
set "psCommand=Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.OpenFileDialog; $f.Filter = 'Executable Files (*.exe)|*.exe'; $f.Title = 'Select the program to UNBLOCK'; $f.ShowHelp = $true; $f.ShowDialog() | Out-Null; $f.FileName"

set "app_path="
for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "%psCommand%"`) do set "app_path=%%I"

if "%app_path%"=="" (
    echo %RED%[X] No file selected. Going back to menu...%RESET%
    pause
    goto menu_firewall_manager
)

for %%F in ("%app_path%") do set "app_name=%%~nxF"

echo %YELLOW%Unblocking "%app_name%" in Windows Firewall...%RESET%
netsh advfirewall firewall delete rule name="WinRTP_Block_%app_name%" >nul 2>&1

echo %GREEN%[OK] Success! Internet access is restored for: %app_name%%RESET%
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
echo %GREEN%[OK] Windows Update Deep Reset Completed Successfully!%RESET%
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
echo %GREEN%[OK] Microsoft Store and Default Apps Repaired!%RESET%
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
echo %GREEN%[OK] Icons and Thumbnails Cache Rebuilt Successfully!%RESET%
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
echo %GREEN%[OK] Taskbar, Search, and Explorer Reset Successfully!%RESET%
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

echo %GREEN%[OK] Audio Services Restarted.%RESET%
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

echo %GREEN%[OK] Bluetooth Services Restarted Successfully!%RESET%
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

echo %GREEN%[OK] Print Queue Cleared and Services Restarted!%RESET%
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

echo %GREEN%[OK] Core Windows Services Restarted Successfully!%RESET%
echo.
pause
goto menu_repair

:services_diagnostic
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%          Windows Services Diagnostic%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Checking important Windows services...%RESET%
echo %WHITE%No changes will be made to your system.%RESET%
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$names=@('RpcSs','DcomLaunch','RpcEptMapper','EventLog','PlugPlay','Power','Schedule','ProfSvc','Winmgmt','CryptSvc','Dhcp','Dnscache','BITS','wuauserv','TrustedInstaller','WinDefend','mpssvc','Spooler','WlanSvc','bthserv'); $ok=0;$warn=0;$idle=0;$missing=0; Write-Host ('{0,-24} {1,-12} {2,-10} {3}' -f 'SERVICE','STATUS','STARTUP','RESULT') -ForegroundColor Cyan; Write-Host ('-'*68) -ForegroundColor DarkGray; foreach($n in $names){ $s=Get-CimInstance Win32_Service -Filter ('Name='''+$n+'''') -ErrorAction SilentlyContinue; if(-not $s){Write-Host ('{0,-24} {1,-12} {2,-10} {3}' -f $n,'N/A','N/A','Not Installed') -ForegroundColor DarkGray; $missing++; continue}; if($s.State -eq 'Running'){Write-Host ('{0,-24} {1,-12} {2,-10} {3}' -f $n,$s.State,$s.StartMode,'OK') -ForegroundColor Green; $ok++} elseif($s.StartMode -eq 'Disabled'){Write-Host ('{0,-24} {1,-12} {2,-10} {3}' -f $n,$s.State,$s.StartMode,'ATTENTION') -ForegroundColor Red; $warn++} elseif($s.StartMode -eq 'Auto'){Write-Host ('{0,-24} {1,-12} {2,-10} {3}' -f $n,$s.State,$s.StartMode,'ATTENTION') -ForegroundColor Red; $warn++} else {Write-Host ('{0,-24} {1,-12} {2,-10} {3}' -f $n,$s.State,$s.StartMode,'IDLE') -ForegroundColor Yellow; $idle++}}; Write-Host ''; Write-Host '============================================================' -ForegroundColor Cyan; Write-Host ('Running / OK : '+$ok) -ForegroundColor Green; Write-Host ('Idle / Manual: '+$idle) -ForegroundColor Yellow; Write-Host ('Needs Attention: '+$warn) -ForegroundColor Red; Write-Host ('Not Available : '+$missing) -ForegroundColor DarkGray; Write-Host '============================================================' -ForegroundColor Cyan"

echo.
echo %WHITE%Status Guide:%RESET%
echo %GREEN%[OK]%RESET%      Service is currently running.
echo %YELLOW%[IDLE]%RESET%    Manual service is stopped and may start when needed.
echo %RED%[ATTENTION]%RESET% Automatic service is stopped or service is disabled.
echo %WHITE%[N/A]%RESET%     Service is not installed or not available on this PC.
echo.
echo %YELLOW%Note:%RESET% %WHITE%Some Manual services normally stay stopped until Windows needs them.%RESET%
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
echo %GREEN%[OK] Quick Scan Completed!%RESET%
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
echo %GREEN%[OK] Full Scan Completed!%RESET%
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
echo %GREEN%[OK] Defender Protection History Cleared!%RESET%
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
echo %GREEN%[OK] Windows Defender Services and Engine Repaired Successfully!%RESET%
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
echo %GREEN%[OK] Windows Firewall Reset to Defaults Successfully!%RESET%
pause
goto menu_security

:reset_hosts
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%                Resetting Hosts File%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%Fixes internet redirects caused by malware or bad configs.%RESET%
echo.
copy /y "%windir%\System32\drivers\etc\hosts" "%windir%\System32\drivers\etc\hosts.WinRTP.bak" >nul 2>&1
echo # Copyright (c) 1993-2009 Microsoft Corp. > %windir%\System32\drivers\etc\hosts
echo # This is a default HOSTS file. >> %windir%\System32\drivers\etc\hosts
echo 127.0.0.1 localhost >> %windir%\System32\drivers\etc\hosts
echo ::1 localhost >> %windir%\System32\drivers\etc\hosts
echo %GREEN%[OK] Hosts File Reset to Default Successfully!%RESET%
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
echo %GREEN%[OK] Telemetry and Tracking disabled successfully.%RESET%
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
echo %GREEN%[OK] Telemetry and Tracking services restored to default.%RESET%
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
    echo %GREEN%[OK] All drivers updated successfully!%RESET%
    pause
    goto menu_drivers
)

echo.
echo %YELLOW%Preparing to install the selected driver...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module PSWindowsUpdate -ErrorAction SilentlyContinue; $idx = [int]'%drv_sel%' - 1; $updates = Get-WindowsUpdate; [array]$drivers = $updates | Where-Object { $_.Categories -match 'Driver' -or $_.Title -match 'Driver' }; if ($drivers[$idx]) { Write-Host \"Installing: $($drivers[$idx].Title)\" -ForegroundColor Yellow; Install-WindowsUpdate -UpdateID $drivers[$idx].UpdateID -AcceptAll -AutoReboot:$false } else { Write-Host 'Invalid Selection' -ForegroundColor Red }"
echo.
echo %GREEN%[OK] Selected driver installation attempt completed.%RESET%
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
    echo %GREEN%[OK] Drivers Backup Created Successfully!%RESET%
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
echo %GREEN%[OK] Drivers Restoration Process Completed!%RESET%
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
    echo %GREEN%[OK] Driver %target_driver% Uninstalled and Deleted Successfully!%RESET%
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
    echo %GREEN%[OK] Restore Point [WinRTP_Auto_Backup] Created Successfully!%RESET%
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
powershell -NoProfile -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Set-DnsClientServerAddress -ServerAddresses ('1.1.1.1','1.0.0.1')" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[OK] Cloudflare DNS Applied Successfully!%RESET%
pause
goto change_dns

:set_google
echo.
echo %YELLOW%Applying Google DNS...%RESET%
powershell -NoProfile -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Set-DnsClientServerAddress -ServerAddresses ('8.8.8.8','8.8.4.4')" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[OK] Google DNS Applied Successfully!%RESET%
pause
goto change_dns

:set_quad9
echo.
echo %YELLOW%Applying Quad9 Secure DNS...%RESET%
powershell -NoProfile -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Set-DnsClientServerAddress -ServerAddresses ('9.9.9.9','149.112.112.112')" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[OK] Quad9 Secure DNS Applied Successfully!%RESET%
pause
goto change_dns

:set_adguard
echo.
echo %YELLOW%Applying AdGuard DNS (Ad-Block)...%RESET%
powershell -NoProfile -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Set-DnsClientServerAddress -ServerAddresses ('94.140.14.14','94.140.15.15')" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[OK] AdGuard DNS Applied! Ads will be blocked.%RESET%
pause
goto change_dns

:set_default
echo.
echo %YELLOW%Restoring Default DNS Settings (DHCP)...%RESET%
powershell -NoProfile -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Set-DnsClientServerAddress -ResetServerAddresses" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo.
echo %GREEN%[OK] DNS Restored to Default Successfully!%RESET%
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
echo %CYAN%[B] Backup Installed Apps List (Export)%RESET%
echo %CYAN%[R] Restore Apps From Backup (Import)%RESET%
echo %RED%[0] Back to Main Menu%RESET%
echo.
echo %CYAN%----------------------------------------------------%RESET%
set /p "app_ch=%YELLOW%Choose Option Number: %RESET%"

if "%app_ch%"=="0" goto menu
if /i "%app_ch%"=="a" goto install_all_apps
if /i "%app_ch%"=="s" goto search_install_app
if /i "%app_ch%"=="b" goto backup_apps_list
if /i "%app_ch%"=="r" goto restore_apps_list
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

:backup_apps_list
call :ensure_winget
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%          Backing Up Installed Apps List%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Enter the full path where you want to save the backup file.%RESET%
echo %WHITE%Example: %CYAN%D:\%RESET%
echo %WHITE%Leave empty to use the default location.%RESET%
echo.
set /p "backup_path=%YELLOW%Save Path: %RESET%"

if "%backup_path%"=="" set "backup_path=C:\WinRTP\apps_backup.json"

if "%backup_path:~-1%"==":" set "backup_path=%backup_path%\"

if "%backup_path:~-1%"=="\" (
    set "backup_path=%backup_path%apps_backup.json"
) else (
    echo %backup_path%| findstr /i /e "\.json" >nul
    if errorlevel 1 set "backup_path=%backup_path%\apps_backup.json"
)

for %%F in ("%backup_path%") do set "backup_dir=%%~dpF"
if not exist "%backup_dir%" mkdir "%backup_dir%" >nul 2>&1

echo.
echo %YELLOW%Exporting your installed apps list, please wait...%RESET%
winget export -o "%backup_path%" --accept-source-agreements >nul 2>&1

if exist "%backup_path%" (
    echo.
    echo %GREEN%[OK] Backup saved successfully to:%RESET%
    echo %WHITE%%backup_path%%RESET%
) else (
    echo.
    echo %RED%[X] Backup failed. Please check the path and your internet connection.%RESET%
)
echo.
pause
goto menu_apps

:restore_apps_list
call :ensure_winget
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%          Restoring Apps From Backup%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %WHITE%Enter the full path of the backup file to restore from.%RESET%
echo %WHITE%Example: %CYAN%D:\Backups\apps_backup.json%RESET%
echo %WHITE%Leave empty to use the default location.%RESET%
echo.
set /p "restore_path=%YELLOW%Backup File Path: %RESET%"

if "%restore_path%"=="" set "restore_path=C:\WinRTP\apps_backup.json"

if "%restore_path:~-1%"==":" set "restore_path=%restore_path%\"

if "%restore_path:~-1%"=="\" (
    set "restore_path=%restore_path%apps_backup.json"
) else (
    echo %restore_path%| findstr /i /e "\.json" >nul
    if errorlevel 1 set "restore_path=%restore_path%\apps_backup.json"
)

if not exist "%restore_path%" (
    echo.
    echo %RED%[X] No backup file found at:%RESET%
    echo %WHITE%%restore_path%%RESET%
    echo.
    pause
    goto menu_apps
)

echo.
echo %YELLOW%Installing all apps from your backup list...%RESET%
echo %WHITE%This may take a while depending on how many apps you have.%RESET%
echo.
winget import -i "%restore_path%" --accept-source-agreements --accept-package-agreements

echo.
echo %GREEN%[OK] Restore process completed!%RESET%
echo %WHITE%Please check above for any apps that failed to install.%RESET%
pause
goto menu_apps

:install_core_runtimes
call :ensure_winget
cls
echo %CYAN%====================================================%RESET%
echo %YELLOW%      Installing ALL Core ^& Legacy Runtimes%RESET%
echo %CYAN%====================================================%RESET%
echo %WHITE%This will install: Modern ^& Legacy Visual C++, DirectX,%RESET%
echo %WHITE%.NET 8, WebView2, XNA Framework, and Java JRE.%RESET%
echo.
echo %RED%[!] Please wait, this might take up to 10 minutes...%RESET%
echo.

set "fail_count=0"
for %%r in (Microsoft.VCRedist.2015+.x64 Microsoft.VCRedist.2015+.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2012.x64 Microsoft.VCRedist.2012.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2010.x86 Microsoft.DirectX Microsoft.DotNet.DesktopRuntime.8 Microsoft.EdgeWebView2Runtime Microsoft.XNARedist Oracle.JavaRuntimeEnvironment) do call :install_pkg %%r

echo.
if %fail_count% equ 0 (
    echo %GREEN%[OK] All Core and Legacy Runtimes Installed Successfully!%RESET%
    echo %WHITE%Your PC is now ready for most games and heavy software.%RESET%
) else (
    echo %YELLOW%[!] Finished, but some packages failed to install. Failed count: %fail_count%%RESET%
    echo %WHITE%Check your internet connection and try again.%RESET%
)
pause
goto menu_apps

:install_silent
call :ensure_winget
echo.
echo %YELLOW%Installing %app_id% Silently... Please wait...%RESET%
winget install --id "%app_id%" --silent --accept-source-agreements --accept-package-agreements --source winget
if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[OK] Installed Successfully!%RESET%
) else (
    echo.
    echo %RED%[X] Failed to install or already installed.%RESET%
)
pause
goto menu_apps

:install_all_apps
call :ensure_winget
cls
echo %YELLOW%Installing All Basic Apps (Chrome, IDM, VLC, WinRAR, 7-Zip)...%RESET%
echo %WHITE%This will take a few minutes, please don't close the window...%RESET%
echo.
set "fail_count=0"
for %%g in (Google.Chrome Tonec.InternetDownloadManager VideoLAN.VLC RARLab.WinRAR 7zip.7zip) do call :install_pkg %%g

echo.
if %fail_count% equ 0 (
    echo %GREEN%[OK] All Basic Apps Installed Successfully!%RESET%
) else (
    echo %YELLOW%[!] Finished, but some apps failed to install. Failed count: %fail_count%%RESET%
    echo %WHITE%Check your internet connection and try again.%RESET%
)
pause
goto menu_apps


:apps_uninstaller_wizard
call :ensure_winget
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
    echo %GREEN%[OK] %un_app_id% Uninstalled and Cleaned Successfully!%RESET%
) else (
    echo.
    echo %RED%[X] Failed to uninstall. Please make sure you copied the Name/ID correctly.%RESET%
)
pause
goto menu_apps


:apps_updater_wizard
call :ensure_winget
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%             Applications Updater Wizard%RESET%
echo %CYAN%====================================================%RESET%
echo.
echo %YELLOW%Checking for available updates... Please wait...%RESET%
echo.

winget upgrade --source winget
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
    winget upgrade --all --silent --accept-source-agreements --accept-package-agreements --source winget
    echo.
    echo %GREEN%[OK] Bulk Update Process Completed!%RESET%
    pause
    goto menu_apps
)

if "%up_choice%"=="2" goto apps_updater_single
goto apps_updater_wizard

:apps_updater_single
echo.
echo %WHITE%Please copy and paste the %GREEN%ID%WHITE% of the app you want to update from the list above.%RESET%
echo %WHITE%Example: %CYAN%Google.Chrome%RESET%
echo.
set /p "single_up_id=%YELLOW%Enter App ID: %RESET%"

if "%single_up_id%"=="" goto apps_updater_wizard

echo.
echo %YELLOW%Updating %single_up_id% Silently...%RESET%
winget upgrade --id "%single_up_id%" --silent --accept-source-agreements --accept-package-agreements --source winget
if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[OK] %single_up_id% Updated Successfully!%RESET%
) else (
    echo.
    echo %RED%[X] Failed to update. Please check if the ID is correct.%RESET%
)
pause
goto apps_updater_wizard

:search_install_app
call :ensure_winget
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

winget search "%custom_app%" --source winget
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
winget install --id "%app_id_choice%" --silent --accept-source-agreements --accept-package-agreements --source winget

if %errorlevel% equ 0 (
    echo.
    echo %GREEN%[OK] %app_id_choice% Installed Successfully!%RESET%
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
    echo %GREEN%[OK] User '%new_usr%' created successfully!%RESET%
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
    echo %GREEN%[OK] User '%del_usr%' deleted successfully!%RESET%
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
    echo %GREEN%[OK] Success! User '%old_name%' is now named '%new_name%'.%RESET%
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
    echo %GREEN%[OK] Password changed successfully for '%target_usr%'!%RESET%
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
    echo %GREEN%[OK] Success! User '%admin_usr%' is now an Administrator.%RESET%
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
    echo %GREEN%[OK] Success! User '%std_usr%' is now a Standard User.%RESET%
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

echo %GREEN%[OK] User '%hide_usr%' is now hidden from the login screen!%RESET%
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

echo %GREEN%[OK] User '%unhide_usr%' is now visible on the login screen again!%RESET%
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
    echo %GREEN%[OK] Account '%status_usr%' is now FROZEN and Disabled.%RESET%
    echo.
    pause
    goto menu_users
)
if "%status_ch%"=="2" (
    net user "%status_usr%" /active:yes >nul 2>&1
    echo.
    echo %GREEN%[OK] Account '%status_usr%' is now ACTIVE and Enabled.%RESET%
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
    echo %GREEN%[OK] Built-in Administrator is now ENABLED!%RESET%
    echo.
    pause
    goto menu_users
)
if "%admin_ch%"=="2" (
    net user "%BuiltInAdmin%" /active:no >nul 2>&1
    echo.
    echo %GREEN%[OK] Built-in Administrator is now DISABLED!%RESET%
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
echo %GREEN%[OK] UI is now snappier!%RESET%
pause
goto menu_tweaks

:tweak_win11_menu
echo.
echo %YELLOW%Restoring Classic Right-Click Context Menu...%RESET%
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo %GREEN%[OK] Classic Menu Restored!%RESET%
pause
goto menu_tweaks

:tweak_lock_screen
echo.
echo %YELLOW%Disabling Windows Lock Screen...%RESET%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f >nul 2>&1
echo %GREEN%[OK] Lock screen disabled. Windows will now boot directly to the password prompt.%RESET%
pause
goto menu_tweaks

:tweak_visuals
echo.
echo %YELLOW%Disabling Heavy Visual Effects (Best Performance Mode)...%RESET%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
echo %GREEN%[OK] Visual effects optimized for maximum performance!%RESET%
pause
goto menu_tweaks

:tweak_network
echo.
echo %YELLOW%Disabling Network Throttling ^& Gaming Responsiveness...%RESET%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[OK] Network restrictions lifted. Ping optimized!%RESET%
pause
goto menu_tweaks

:tweak_bing
echo.
echo %YELLOW%Disabling Bing Web Search in Start Menu...%RESET%
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo %GREEN%[OK] Local search is now blazing fast without internet results!%RESET%
pause
goto menu_tweaks

:tweak_sysmain
echo.
echo %YELLOW%Disabling SysMain (Superfetch) Service...%RESET%
sc config "SysMain" start=disabled >nul 2>&1
net stop "SysMain" >nul 2>&1
echo %GREEN%[OK] SysMain Disabled. 100%% Disk Usage issues should be resolved.%RESET%
pause
goto menu_tweaks

:tweak_gamedvr
echo.
echo %YELLOW%Disabling Game DVR ^& Background Recording...%RESET%
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[OK] Game DVR Disabled. Stuttering in games should be reduced!%RESET%
pause
goto menu_tweaks

:tweak_mouse
echo.
echo %YELLOW%Disabling Mouse Acceleration (Enhance Pointer Precision)...%RESET%
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul 2>&1
echo %GREEN%[OK] Mouse Acceleration Disabled. You now have 100%% Raw Aim Input!%RESET%
pause
goto menu_tweaks

:tweak_hibernation
echo.
echo %YELLOW%Disabling Hibernation...%RESET%
powercfg -h off >nul 2>&1
echo %GREEN%[OK] Hibernation Disabled. Gigabytes of disk space freed up!%RESET%
pause
goto menu_tweaks

:tweak_vbs
echo.
echo %YELLOW%Disabling Virtualization-Based Security (VBS) ^& Memory Integrity...%RESET%
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[OK] VBS Disabled! Expect higher FPS in Windows 11.%RESET%
pause
goto menu_tweaks

:tweak_power
echo.
echo %YELLOW%Enabling Ultimate Performance Power Plan...%RESET%
set "GUID="
for /f "delims=" %%a in ('powershell -NoProfile -Command "(powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Select-String -Pattern '[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}').Matches.Value"') do set "GUID=%%a"
if not "%GUID%"=="" (
    powercfg -setactive %GUID% >nul 2>&1
    if not exist "C:\WinRTP" mkdir "C:\WinRTP" >nul 2>&1
    echo %GUID%>> "C:\WinRTP\UltimateGUIDs.txt"
)
echo %GREEN%[OK] Ultimate Performance Mode Enabled!%RESET%
pause
goto menu_tweaks

:tweak_stickykeys
echo.
echo %YELLOW%Disabling Sticky Keys ^& Filter Keys...%RESET%
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f >nul 2>&1
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f >nul 2>&1
echo %GREEN%[OK] Sticky Keys Disabled. Mash your Shift key safely!%RESET%
pause
goto menu_tweaks

:tweak_p2p
echo.
echo %YELLOW%Disabling P2P Windows Updates (Delivery Optimization)...%RESET%
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f >nul 2>&1
echo %GREEN%[OK] P2P Updates Disabled! Windows will no longer upload updates from your PC.%RESET%
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
set "GUID="
for /f "delims=" %%a in ('powershell -NoProfile -Command "(powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Select-String -Pattern '[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}').Matches.Value"') do set "GUID=%%a"
if not "%GUID%"=="" (
    powercfg -setactive %GUID% >nul 2>&1
    if not exist "C:\WinRTP" mkdir "C:\WinRTP" >nul 2>&1
    echo %GUID%>> "C:\WinRTP\UltimateGUIDs.txt"
)

echo %GREEN%[OK] ALL Recommended Tweaks Applied Successfully!%RESET%
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
if exist "C:\WinRTP\UltimateGUIDs.txt" (
    for /f "delims=" %%i in (C:\WinRTP\UltimateGUIDs.txt) do (
        powercfg -delete %%i >nul 2>&1
    )
    del /q "C:\WinRTP\UltimateGUIDs.txt" >nul 2>&1
)

taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo %GREEN%[OK] All Windows Defaults Restored Successfully!%RESET%
echo %WHITE%(Note: Please restart your PC to ensure all services return to normal).%RESET%
pause
goto menu_tweaks


:wo_win_activate
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%                 Activate Windows%RESET%
echo %CYAN%====================================================%RESET%
echo.

call :wo_show_windows_summary

echo.
set "WO_WINKEY="
set /p "WO_WINKEY=%YELLOW%Enter your Windows product key (B=Back): %RESET%"

if /i "%WO_WINKEY%"=="B" goto menu_windows_office
if not defined WO_WINKEY goto menu_windows_office

echo.
choice /c YN /n /m "Activate Windows now? (Y=Activate / N=Cancel): "

if errorlevel 2 goto wo_win_cancel_activation

echo.
echo %YELLOW%Installing Windows product key...%RESET%
echo.

<nul set /p "=%GREEN%"
cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %WO_WINKEY%
set "WO_IPK_RESULT=%ERRORLEVEL%"
<nul set /p "=%RESET%"

if not "%WO_IPK_RESULT%"=="0" (
    echo.
    echo %RED%[X] Windows rejected the product key.%RESET%
    echo %YELLOW%The key may be invalid or not compatible with this Windows edition.%RESET%
    echo.
    set "WO_WINKEY="
    pause
    goto menu_windows_office
)

echo %YELLOW%Activating Windows...%RESET%
echo.

cscript //nologo "%windir%\system32\slmgr.vbs" /ato
set "WO_ATO_RESULT=%ERRORLEVEL%"


if not "%WO_ATO_RESULT%"=="0" (
    echo %RED%[X] Windows activation did not complete successfully.%RESET%
    echo %YELLOW%The product key is installed, but Windows could not activate it.%RESET%
    echo.
) else (
    echo %GREEN%[OK] Windows activation command completed.%RESET%
    echo.
)

echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Updated Windows License Details:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

call :wo_show_windows_summary

set "WO_WINKEY="
set "WO_IPK_RESULT="
set "WO_ATO_RESULT="

echo.
pause
goto menu_windows_office


:wo_win_cancel_activation
echo.
echo %YELLOW%Activation cancelled.%RESET%
echo %WHITE%The existing Windows key/license was not changed.%RESET%

set "WO_WINKEY="

echo.
pause
goto menu_windows_office

:wo_win_convert
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%              Change Windows Edition%RESET%
echo %CYAN%====================================================%RESET%
echo.

call :wo_show_current_edition

set "WO_BEFORE_SKU=%WO_CURRENT_SKU%"
set "WO_BEFORE_NAME=%WO_CURRENT_NAME%"

echo.

set "WO_TARGETS_FILE=%TEMP%\WinRTP_windows_targets_%RANDOM%.txt"
set "WO_TARGET_COUNT=0"
set "WO_TARGET_ID="
set "WO_TARGET_NAME="
set "WO_WINKEY="

dism /online /Get-TargetEditions > "%WO_TARGETS_FILE%" 2>&1

echo %CYAN%Available Target Editions:%RESET%
echo.

for /f "tokens=4" %%E in ('findstr /i /c:"Target Edition :" "%WO_TARGETS_FILE%"') do call :wo_add_target %%E

del /q "%WO_TARGETS_FILE%" >nul 2>&1

if "%WO_TARGET_COUNT%"=="0" (
    echo %YELLOW%[!] No built-in target editions with official public keys were found.%RESET%
)

echo.
echo %YELLOW%[C]%RESET% Use Custom Product Key
echo %RED%[0]%RESET% Back
echo.

set "WO_TARGET_CHOICE="
set /p "WO_TARGET_CHOICE=%YELLOW%Choose target number or C: %RESET%"

if /i "%WO_TARGET_CHOICE%"=="C" goto wo_custom_edition_key
if "%WO_TARGET_CHOICE%"=="0" goto menu_windows_office

call set "WO_TARGET_ID=%%WO_OPTION_%WO_TARGET_CHOICE%_ID%%"
call set "WO_TARGET_NAME=%%WO_OPTION_%WO_TARGET_CHOICE%_NAME%%"
call set "WO_WINKEY=%%WO_OPTION_%WO_TARGET_CHOICE%_KEY%%"

if not defined WO_WINKEY goto wo_invalid_target

echo.
echo %WHITE%Selected Target:%RESET% %GREEN%%WO_TARGET_NAME%%RESET%
echo.
echo %YELLOW%The matching Microsoft public KMS client key will be applied automatically.%RESET%
echo.

choice /c YN /n /m "Apply this edition change now? (Y/N): "

if errorlevel 2 goto wo_conversion_cancelled

echo.
echo %YELLOW%Starting Windows edition change...%RESET%
echo.

changepk.exe /ProductKey %WO_WINKEY%
set "WO_CHANGE_RESULT=%ERRORLEVEL%"

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Edition after the attempt:%RESET%
echo %CYAN%----------------------------------------------------%RESET%

call :wo_show_current_edition

if /i "%WO_CURRENT_SKU%"=="%WO_TARGET_ID%" (
    echo %GREEN%[OK] Windows edition changed successfully.%RESET%
	echo.
    echo %WHITE%Previous Edition:%RESET% %WO_BEFORE_NAME%
    echo %WHITE%New Edition:%RESET% %GREEN%%WO_CURRENT_NAME%%RESET%
) else (
    if not "%WO_CHANGE_RESULT%"=="0" (
        echo.
        echo %RED%[X] The product key is not compatible with this edition change.%RESET%
        echo %WHITE%Windows remains on:%RESET% %GREEN%%WO_BEFORE_NAME%%RESET%
    ) else (
        echo.
        echo %YELLOW%[!] The Windows edition has not changed yet.%RESET%
        echo %YELLOW%A restart may be required to complete the edition change.%RESET%
        echo %WHITE%Current Edition:%RESET% %GREEN%%WO_CURRENT_NAME%%RESET%
    )
)

echo.
call :wo_show_windows_summary

set "WO_WINKEY="
set "WO_TARGET_ID="
set "WO_TARGET_NAME="
set "WO_TARGET_CHOICE="
set "WO_CHANGE_RESULT="
set "WO_BEFORE_SKU="
set "WO_BEFORE_NAME="

echo.
pause
goto menu_windows_office

:wo_custom_edition_key
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%             Custom Windows Product Key%RESET%
echo %CYAN%====================================================%RESET%
echo.

call :wo_show_current_edition

echo.
echo %WHITE%Enter your own Windows product key.%RESET%
echo %YELLOW%Windows will determine whether the key supports an edition change.%RESET%
echo.

set "WO_CUSTOM_KEY="
set /p "WO_CUSTOM_KEY=%YELLOW%Product Key (B=Back): %RESET%"

if not defined WO_CUSTOM_KEY goto wo_win_convert

powershell.exe -NoProfile -Command "$k=$env:WO_CUSTOM_KEY; if($k -ieq 'B'){exit 2}; if($k -match '^[A-Za-z0-9]{5}(-[A-Za-z0-9]{5}){4}$'){exit 0}; exit 1" >nul 2>&1
set "WO_CUSTOM_CHECK=%ERRORLEVEL%"

if "%WO_CUSTOM_CHECK%"=="2" (
    set "WO_CUSTOM_KEY="
    set "WO_CUSTOM_CHECK="
    goto wo_win_convert
)

if not "%WO_CUSTOM_CHECK%"=="0" (
    echo.
    echo %RED%[X] Invalid product key format.%RESET%
    echo %YELLOW%Expected: XXXXX-XXXXX-XXXXX-XXXXX-XXXXX%RESET%
    echo.
    set "WO_CUSTOM_KEY="
    set "WO_CUSTOM_CHECK="
    pause
    goto wo_custom_edition_key
)

set "WO_CUSTOM_CHECK="

echo.
echo %WHITE%The product key format is correct.%RESET%
echo %YELLOW%Windows will decide whether the key is valid and compatible with this edition.%RESET%
echo.

choice /c YN /n /m "Apply this product key and attempt edition change? (Y/N): "

if errorlevel 2 (
    set "WO_CUSTOM_KEY="
    goto wo_win_convert
)

echo.
echo %YELLOW%Applying custom Windows product key...%RESET%
echo.

changepk.exe /ProductKey %WO_CUSTOM_KEY%
set "WO_CHANGE_RESULT=%ERRORLEVEL%"

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Windows Edition After The Attempt:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

call :wo_show_current_edition

if /i not "%WO_CURRENT_SKU%"=="%WO_BEFORE_SKU%" (
    echo %GREEN%[OK] Windows edition changed successfully.%RESET%
    echo.
    echo %WHITE%Previous Edition:%RESET% %WO_BEFORE_NAME%
    echo %WHITE%New Edition:%RESET% %GREEN%%WO_CURRENT_NAME%%RESET%
) else (
    if not "%WO_CHANGE_RESULT%"=="0" (
        echo %RED%[X] The product key is not compatible with the current Windows edition.%RESET%
		echo.
        echo %WHITE%No edition change was made.%RESET%
        echo %WHITE%Windows remains on:%RESET% %GREEN%%WO_BEFORE_NAME%%RESET%
    ) else (
        echo.
        echo %YELLOW%[!] The Windows edition has not changed yet.%RESET%
        echo %YELLOW%A restart may be required to complete the edition change.%RESET%
        echo %WHITE%Current Edition:%RESET% %GREEN%%WO_CURRENT_NAME%%RESET%
    )
)

echo.
call :wo_show_windows_summary

set "WO_CUSTOM_KEY="
set "WO_CHANGE_RESULT="
set "WO_BEFORE_SKU="
set "WO_BEFORE_NAME="

echo.
pause
goto menu_windows_office

:wo_invalid_target
echo.
echo %RED%[X] Invalid choice. No key was applied.%RESET%

set "WO_TARGET_ID="
set "WO_WINKEY="
set "WO_TARGET_NAME="
set "WO_TARGET_CHOICE="

echo.
pause
goto menu_windows_office


:wo_conversion_cancelled
echo.
echo %YELLOW%Edition change cancelled. No key was applied.%RESET%

set "WO_TARGET_ID="
set "WO_WINKEY="
set "WO_TARGET_NAME="
set "WO_TARGET_CHOICE="

echo.
pause
goto menu_windows_office

:wo_add_target
set "WO_CANDIDATE_ID=%~1"

call :wo_map_target

if not defined WO_WINKEY exit /b

if /i "%WO_CURRENT_SKU:~0,4%"=="Core" if not "%WO_CANDIDATE_ID%"=="ProfessionalEducation" if not "%WO_CANDIDATE_ID%"=="ProfessionalEducationN" if not "%WO_CANDIDATE_ID%"=="Education" if not "%WO_CANDIDATE_ID%"=="EducationN" exit /b

set /a WO_TARGET_COUNT+=1

call set "WO_OPTION_%WO_TARGET_COUNT%_ID=%WO_CANDIDATE_ID%"
call set "WO_OPTION_%WO_TARGET_COUNT%_NAME=%WO_TARGET_NAME%"
call set "WO_OPTION_%WO_TARGET_COUNT%_KEY=%WO_WINKEY%"

echo %WHITE%[%WO_TARGET_COUNT%]%RESET% %WO_TARGET_NAME%

exit /b

:wo_map_target
set "WO_TARGET_NAME="
set "WO_WINKEY="

if /i "%WO_CANDIDATE_ID%"=="Professional" set "WO_TARGET_NAME=Windows Pro"
if /i "%WO_CANDIDATE_ID%"=="Professional" set "WO_WINKEY=W269N-WFGWX-YVC9B-4J6C9-T83GX"

if /i "%WO_CANDIDATE_ID%"=="ProfessionalN" set "WO_TARGET_NAME=Windows Pro N"
if /i "%WO_CANDIDATE_ID%"=="ProfessionalN" set "WO_WINKEY=MH37W-N47XK-V7XM9-C7227-GCQG9"

if /i "%WO_CANDIDATE_ID%"=="ProfessionalWorkstation" set "WO_TARGET_NAME=Windows Pro for Workstations"
if /i "%WO_CANDIDATE_ID%"=="ProfessionalWorkstation" set "WO_WINKEY=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"

if /i "%WO_CANDIDATE_ID%"=="ProfessionalWorkstationN" set "WO_TARGET_NAME=Windows Pro for Workstations N"
if /i "%WO_CANDIDATE_ID%"=="ProfessionalWorkstationN" set "WO_WINKEY=9FNHH-K3HBT-3W4TD-6383H-6XYWF"

if /i "%WO_CANDIDATE_ID%"=="ProfessionalEducation" set "WO_TARGET_NAME=Windows Pro Education"
if /i "%WO_CANDIDATE_ID%"=="ProfessionalEducation" set "WO_WINKEY=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y"

if /i "%WO_CANDIDATE_ID%"=="ProfessionalEducationN" set "WO_TARGET_NAME=Windows Pro Education N"
if /i "%WO_CANDIDATE_ID%"=="ProfessionalEducationN" set "WO_WINKEY=YVWGF-BXNMC-HTQYQ-CPQ99-66QFC"

if /i "%WO_CANDIDATE_ID%"=="Education" set "WO_TARGET_NAME=Windows Education"
if /i "%WO_CANDIDATE_ID%"=="Education" set "WO_WINKEY=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"

if /i "%WO_CANDIDATE_ID%"=="EducationN" set "WO_TARGET_NAME=Windows Education N"
if /i "%WO_CANDIDATE_ID%"=="EducationN" set "WO_WINKEY=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"

if /i "%WO_CANDIDATE_ID%"=="Enterprise" set "WO_TARGET_NAME=Windows Enterprise"
if /i "%WO_CANDIDATE_ID%"=="Enterprise" set "WO_WINKEY=NPPR9-FWDCX-D2C8J-H872K-2YT43"

if /i "%WO_CANDIDATE_ID%"=="EnterpriseN" set "WO_TARGET_NAME=Windows Enterprise N"
if /i "%WO_CANDIDATE_ID%"=="EnterpriseN" set "WO_WINKEY=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"

if /i "%WO_CANDIDATE_ID%"=="EnterpriseG" set "WO_TARGET_NAME=Windows Enterprise G"
if /i "%WO_CANDIDATE_ID%"=="EnterpriseG" set "WO_WINKEY=YYVX9-NTFWV-6MDM3-9PT4T-4M68B"

if /i "%WO_CANDIDATE_ID%"=="EnterpriseGN" set "WO_TARGET_NAME=Windows Enterprise G N"
if /i "%WO_CANDIDATE_ID%"=="EnterpriseGN" set "WO_WINKEY=44RPN-FTY23-9VTTB-MP9BX-T84FV"

if /i "%WO_CANDIDATE_ID%"=="EnterpriseS" set "WO_TARGET_NAME=Windows Enterprise LTSC"
if /i "%WO_CANDIDATE_ID%"=="EnterpriseS" set "WO_WINKEY=M7XTQ-FN8P6-TTKYV-9D4CC-J462D"

if /i "%WO_CANDIDATE_ID%"=="EnterpriseSN" set "WO_TARGET_NAME=Windows Enterprise N LTSC"
if /i "%WO_CANDIDATE_ID%"=="EnterpriseSN" set "WO_WINKEY=92NFX-8DJQP-P6BBQ-THF9C-7CG2H"

exit /b

:wo_office_convert
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%        Change Office License Type / Edition%RESET%
echo %CYAN%====================================================%RESET%
echo.

set "WO_OFFICE_PRODUCT_IDS="

for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Inventory\Office\16.0" /v OfficeProductReleaseIds 2^>nul ^| findstr /i "OfficeProductReleaseIds"') do (
    set "WO_OFFICE_PRODUCT_IDS=%%B"
)

if not defined WO_OFFICE_PRODUCT_IDS (
    for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds 2^>nul ^| findstr /i "ProductReleaseIds"') do (
        set "WO_OFFICE_PRODUCT_IDS=%%B"
    )
)

if not defined WO_OFFICE_PRODUCT_IDS (
    echo %RED%[X] Could not detect a supported Click-to-Run Office installation.%RESET%
    echo.
    echo %YELLOW%This feature currently supports Click-to-Run Office installations only.%RESET%
    echo.
    pause
    goto menu_windows_office
)

echo %GREEN%[OK] Microsoft Office installation detected.%RESET%
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Detected Office Product ID(s):%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.
echo %GREEN%%WO_OFFICE_PRODUCT_IDS%%RESET%
echo.

set "WO_OFFICE_LICENSE_TYPE=Unknown"
set "WO_OFFICE_HAS_VOLUME="
set "WO_OFFICE_HAS_RETAIL="

echo(%WO_OFFICE_PRODUCT_IDS%| findstr /i "Volume" >nul && set "WO_OFFICE_HAS_VOLUME=1"
echo(%WO_OFFICE_PRODUCT_IDS%| findstr /i "Retail" >nul && set "WO_OFFICE_HAS_RETAIL=1"

if defined WO_OFFICE_HAS_VOLUME set "WO_OFFICE_LICENSE_TYPE=Volume"
if defined WO_OFFICE_HAS_RETAIL set "WO_OFFICE_LICENSE_TYPE=Retail"

if defined WO_OFFICE_HAS_VOLUME if defined WO_OFFICE_HAS_RETAIL set "WO_OFFICE_LICENSE_TYPE=Mixed"

echo %WHITE%Detected License Type:%RESET% %GREEN%%WO_OFFICE_LICENSE_TYPE%%RESET%
echo.

call :wo_build_office_conversion_list

if "%WO_OFFICE_MATCH_COUNT%"=="0" (
    echo %YELLOW%[!] No direct Retail/Volume conversion is configured for the detected Office products.%RESET%
    echo.
    echo %WHITE%Detected Product IDs:%RESET%
    echo %GREEN%%WO_OFFICE_PRODUCT_IDS%%RESET%
    echo.
    echo %RED%[0]%RESET% Back
    echo.
    pause
    goto menu_windows_office
)

echo %CYAN%Available Conversion(s):%RESET%
echo.

for /l %%N in (1,1,%WO_OFFICE_MATCH_COUNT%) do call :wo_print_office_conversion %%N

echo.
echo %RED%[0]%RESET% Back
echo.

set "WO_OFFICE_CONVERT_CHOICE="
set /p "WO_OFFICE_CONVERT_CHOICE=%YELLOW%Choose an option: %RESET%"

if "%WO_OFFICE_CONVERT_CHOICE%"=="0" goto menu_windows_office

set "WO_OFFICE_VALID_CHOICE="

for /l %%N in (1,1,%WO_OFFICE_MATCH_COUNT%) do (
    if "%WO_OFFICE_CONVERT_CHOICE%"=="%%N" set "WO_OFFICE_VALID_CHOICE=1"
)

if not defined WO_OFFICE_VALID_CHOICE goto wo_office_convert

call :wo_select_office_conversion "%WO_OFFICE_CONVERT_CHOICE%"

if not defined WO_OFFICE_TARGET_ID goto wo_office_convert

goto wo_office_convert_confirm

:wo_office_convert_confirm
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%           Office Conversion Confirmation%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Current Product:%RESET% %GREEN%%WO_OFFICE_SOURCE_ID%%RESET%
echo %WHITE%Target Product:%RESET% %GREEN%%WO_OFFICE_TARGET_ID%%RESET%
echo.

echo %YELLOW%No changes have been made yet.%RESET%
echo.

choice /c YN /n /m "Start Office conversion now? (Y/N): "

if errorlevel 2 goto wo_office_convert
if errorlevel 1 goto wo_office_convert_prepare

:wo_office_convert_prepare
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%            Preparing Office Conversion%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Current Product:%RESET% %GREEN%%WO_OFFICE_SOURCE_ID%%RESET%
echo %WHITE%Target Product:%RESET% %GREEN%%WO_OFFICE_TARGET_ID%%RESET%
set "WO_OFFICE_PLATFORM="
set "WO_OFFICE_ARCH="

for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v Platform 2^>nul ^| findstr /i "Platform"') do (
    set "WO_OFFICE_PLATFORM=%%B"
)

if /i "%WO_OFFICE_PLATFORM%"=="x64" set "WO_OFFICE_ARCH=64"
if /i "%WO_OFFICE_PLATFORM%"=="x86" set "WO_OFFICE_ARCH=32"

if not defined WO_OFFICE_ARCH (
    echo.
    echo %RED%[X] Could not detect the installed Office architecture.%RESET%
    echo.
    pause
    goto wo_office_convert
)

echo %WHITE%Office Architecture:%RESET% %GREEN%%WO_OFFICE_ARCH%-bit%RESET%
echo.
set "WO_OFFICE_EXCLUDE_LIST="

echo(%WO_OFFICE_SOURCE_ID%| findstr /i /b "ProPlus" >nul
if errorlevel 1 goto wo_office_build_xml
set "WO_OFFICE_ROOT="

if "%WO_OFFICE_ARCH%"=="64" if exist "%ProgramFiles%\Microsoft Office\root\Office16" set "WO_OFFICE_ROOT=%ProgramFiles%\Microsoft Office\root\Office16"
if "%WO_OFFICE_ARCH%"=="32" if exist "%ProgramFiles(x86)%\Microsoft Office\root\Office16" set "WO_OFFICE_ROOT=%ProgramFiles(x86)%\Microsoft Office\root\Office16"
if not defined WO_OFFICE_ROOT if exist "%ProgramFiles%\Microsoft Office\root\Office16" set "WO_OFFICE_ROOT=%ProgramFiles%\Microsoft Office\root\Office16"

if not defined WO_OFFICE_ROOT (
    echo.
    echo %RED%[X] Could not locate the installed Office applications.%RESET%
    echo.
    pause
    goto wo_office_convert
)

set "WO_HAS_WORD="
set "WO_HAS_EXCEL="
set "WO_HAS_POWERPOINT="
set "WO_HAS_OUTLOOK="
set "WO_HAS_ACCESS="
set "WO_HAS_ONENOTE="
set "WO_HAS_PUBLISHER="
set "WO_HAS_LYNC="

if exist "%WO_OFFICE_ROOT%\WINWORD.EXE" set "WO_HAS_WORD=1"
if exist "%WO_OFFICE_ROOT%\EXCEL.EXE" set "WO_HAS_EXCEL=1"
if exist "%WO_OFFICE_ROOT%\POWERPNT.EXE" set "WO_HAS_POWERPOINT=1"
if exist "%WO_OFFICE_ROOT%\OUTLOOK.EXE" set "WO_HAS_OUTLOOK=1"
if exist "%WO_OFFICE_ROOT%\MSACCESS.EXE" set "WO_HAS_ACCESS=1"
if exist "%WO_OFFICE_ROOT%\ONENOTE.EXE" set "WO_HAS_ONENOTE=1"
if exist "%WO_OFFICE_ROOT%\MSPUB.EXE" set "WO_HAS_PUBLISHER=1"
if exist "%WO_OFFICE_ROOT%\LYNC.EXE" set "WO_HAS_LYNC=1"

set "WO_OFFICE_EXCLUDE_LIST="

if not defined WO_HAS_WORD set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% Word"
if not defined WO_HAS_EXCEL set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% Excel"
if not defined WO_HAS_POWERPOINT set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% PowerPoint"
if not defined WO_HAS_OUTLOOK set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% Outlook"
if not defined WO_HAS_ACCESS set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% Access"
if not defined WO_HAS_ONENOTE set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% OneNote"
if not defined WO_HAS_PUBLISHER set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% Publisher"
if not defined WO_HAS_LYNC set "WO_OFFICE_EXCLUDE_LIST=%WO_OFFICE_EXCLUDE_LIST% Lync"

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Installed Office Apps Before Conversion:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

if defined WO_HAS_WORD echo %GREEN%[OK]%RESET% Word
if defined WO_HAS_EXCEL echo %GREEN%[OK]%RESET% Excel
if defined WO_HAS_POWERPOINT echo %GREEN%[OK]%RESET% PowerPoint
if defined WO_HAS_OUTLOOK echo %GREEN%[OK]%RESET% Outlook
if defined WO_HAS_ACCESS echo %GREEN%[OK]%RESET% Access
if defined WO_HAS_ONENOTE echo %GREEN%[OK]%RESET% OneNote
if defined WO_HAS_PUBLISHER echo %GREEN%[OK]%RESET% Publisher
if defined WO_HAS_LYNC echo %GREEN%[OK]%RESET% Skype for Business

echo.
echo %CYAN%Apps that will NOT be installed:%RESET%
echo.

if defined WO_OFFICE_EXCLUDE_LIST (
    for %%A in (%WO_OFFICE_EXCLUDE_LIST%) do echo %YELLOW%[-]%RESET% %%A
) else (
    echo %YELLOW%None%RESET%
)

echo.
:wo_office_build_xml
set "WO_OFFICE_XML=%TEMP%\WinRTP_Office_Convert_%RANDOM%.xml"

(
echo ^<Configuration^>
echo   ^<Add OfficeClientEdition="%WO_OFFICE_ARCH%" Channel="%WO_OFFICE_TARGET_CHANNEL%" AllowCdnFallback="TRUE"^>
echo     ^<Product ID="%WO_OFFICE_TARGET_ID%"^>
echo       ^<Language ID="MatchInstalled" TargetProduct="%WO_OFFICE_SOURCE_ID%" /^>
) > "%WO_OFFICE_XML%"

if defined WO_OFFICE_EXCLUDE_LIST (
    for %%A in (%WO_OFFICE_EXCLUDE_LIST%) do (
        >> "%WO_OFFICE_XML%" echo       ^<ExcludeApp ID="%%A" /^>
    )
)

(
echo     ^</Product^>
echo   ^</Add^>
echo   ^<Remove All="FALSE"^>
echo     ^<Product ID="%WO_OFFICE_SOURCE_ID%" /^>
echo   ^</Remove^>
echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
echo ^</Configuration^>
) >> "%WO_OFFICE_XML%"

echo %GREEN%[OK] Office conversion configuration created.%RESET%
echo.
echo %WHITE%Configuration File:%RESET%
echo %GREEN%%WO_OFFICE_XML%%RESET%
echo.
set "WO_ODT_DIR=%TEMP%\WinRTP_ODT_%RANDOM%"
set "WO_ODT_PACKAGE=%WO_ODT_DIR%\OfficeDeploymentTool.exe"
set "WO_ODT_SETUP=%WO_ODT_DIR%\setup.exe"

if not exist "%WO_ODT_DIR%" mkdir "%WO_ODT_DIR%"
where winget >nul 2>&1

if errorlevel 1 (
    echo.
    echo %RED%[X] Windows Package Manager ^(winget^) was not found.%RESET%
    echo %YELLOW%Office Deployment Tool could not be downloaded automatically.%RESET%
    echo.
	
	call :wo_cleanup_office_temp
	
    pause
    goto wo_office_convert
)

echo.
echo %YELLOW%Downloading the latest Office Deployment Tool from Microsoft...%RESET%
echo.

winget download --id Microsoft.OfficeDeploymentTool --exact --download-directory "%WO_ODT_DIR%" --accept-package-agreements --accept-source-agreements --disable-interactivity

if errorlevel 1 (
    echo.
    echo %RED%[X] Failed to download Office Deployment Tool.%RESET%
    echo.

    call :wo_cleanup_office_temp

    pause
    goto wo_office_convert
)

set "WO_ODT_PACKAGE="

for /f "delims=" %%F in ('dir /b /a-d "%WO_ODT_DIR%\Office Deployment Tool_*.exe" 2^>nul') do (
    set "WO_ODT_PACKAGE=%WO_ODT_DIR%\%%F"
)

if not defined WO_ODT_PACKAGE (
    echo.
    echo %RED%[X] Office Deployment Tool package was not found after download.%RESET%
    echo.

    call :wo_cleanup_office_temp

    pause
    goto wo_office_convert
)

echo.
echo %GREEN%[OK] Office Deployment Tool downloaded successfully.%RESET%
echo.
echo %YELLOW%Extracting Office Deployment Tool...%RESET%
echo.

"%WO_ODT_PACKAGE%" /quiet /passive /extract:"%WO_ODT_DIR%"

if not exist "%WO_ODT_SETUP%" (
    echo.
    echo %RED%[X] Failed to extract Office Deployment Tool.%RESET%
    echo %YELLOW%setup.exe was not found after extraction.%RESET%
    echo.

    call :wo_cleanup_office_temp

    pause
    goto wo_office_convert
)

echo %GREEN%[OK] Office Deployment Tool extracted successfully.%RESET%
echo.
echo %WHITE%Setup File:%RESET%
echo %GREEN%%WO_ODT_SETUP%%RESET%
echo.
echo.

echo %YELLOW%Starting Office conversion...%RESET%
echo.
echo %WHITE%Please keep this window open until the process finishes.%RESET%
echo.

"%WO_ODT_SETUP%" /configure "%WO_OFFICE_XML%"
set "WO_ODT_RESULT=%ERRORLEVEL%"

echo.

if not "%WO_ODT_RESULT%"=="0" (
    echo %RED%[X] Office Deployment Tool returned an error.%RESET%
    echo %WHITE%Exit Code:%RESET% %WO_ODT_RESULT%
    echo.
) else (
    echo %GREEN%[OK] Office Deployment Tool finished the configuration process.%RESET%
    echo.
)
echo.

call :wo_cleanup_office_temp

pause
goto wo_office_convert

:wo_office_uninstall
cls
echo %CYAN%====================================================%RESET%
echo %RED%          Uninstall Microsoft Office Completely%RESET%
echo %CYAN%====================================================%RESET%
echo.

set "WO_UNINSTALL_PRODUCT_IDS="

for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Inventory\Office\16.0" /v OfficeProductReleaseIds 2^>nul ^| findstr /i "OfficeProductReleaseIds"') do (
    set "WO_UNINSTALL_PRODUCT_IDS=%%B"
)

if not defined WO_UNINSTALL_PRODUCT_IDS (
    for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v ProductReleaseIds 2^>nul ^| findstr /i "ProductReleaseIds"') do (
        set "WO_UNINSTALL_PRODUCT_IDS=%%B"
    )
)

if not defined WO_UNINSTALL_PRODUCT_IDS (
    echo %YELLOW%[!] No supported Click-to-Run Office installation was detected.%RESET%
    echo.
    pause
    goto menu_windows_office
)

echo %GREEN%[OK] Microsoft Office installation detected.%RESET%
echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Detected Office Product ID(s):%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.
echo %GREEN%%WO_UNINSTALL_PRODUCT_IDS%%RESET%
echo.

echo %RED%WARNING:%RESET%
echo %WHITE%This option will completely remove Microsoft Office Click-to-Run products.%RESET%
echo %WHITE%This may also remove installed Project and Visio Click-to-Run products.%RESET%
echo.
echo %YELLOW%Your personal documents will not be intentionally deleted.%RESET%
echo.

choice /c YN /n /m "Continue with complete Office removal? (Y/N): "

if errorlevel 2 goto menu_windows_office
if errorlevel 1 goto wo_office_uninstall_prepare


:wo_office_uninstall_prepare
cls
echo %CYAN%====================================================%RESET%
echo %RED%             Preparing Office Removal%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Detected Product(s):%RESET%
echo %GREEN%%WO_UNINSTALL_PRODUCT_IDS%%RESET%
echo.

set "WO_UNINSTALL_XML=%TEMP%\WinRTP_Office_Uninstall_%RANDOM%.xml"

(
echo ^<Configuration^>
echo   ^<Remove All="TRUE" /^>
echo ^</Configuration^>
) > "%WO_UNINSTALL_XML%"

echo %GREEN%[OK] Office removal configuration created.%RESET%
echo.
echo %WHITE%Configuration File:%RESET%
echo %GREEN%%WO_UNINSTALL_XML%%RESET%
echo.

set "WO_UNINSTALL_ODT_DIR=%TEMP%\WinRTP_ODT_Uninstall_%RANDOM%"
set "WO_UNINSTALL_ODT_PACKAGE="
set "WO_UNINSTALL_ODT_SETUP=%WO_UNINSTALL_ODT_DIR%\setup.exe"

if not exist "%WO_UNINSTALL_ODT_DIR%" mkdir "%WO_UNINSTALL_ODT_DIR%"

where winget >nul 2>&1

if errorlevel 1 (
    echo.
    echo %RED%[X] Windows Package Manager ^(winget^) was not found.%RESET%
    echo %YELLOW%Office Deployment Tool could not be downloaded automatically.%RESET%
    echo.

    call :wo_cleanup_office_temp

    pause
    goto menu_windows_office
)

echo %YELLOW%Downloading the latest Office Deployment Tool from Microsoft...%RESET%
echo.

winget download --id Microsoft.OfficeDeploymentTool --exact --download-directory "%WO_UNINSTALL_ODT_DIR%" --accept-package-agreements --accept-source-agreements --disable-interactivity

if errorlevel 1 (
    echo.
    echo %RED%[X] Failed to download Office Deployment Tool.%RESET%
    echo.

    call :wo_cleanup_office_temp

    pause
    goto menu_windows_office
)

for /f "delims=" %%F in ('dir /b /a-d "%WO_UNINSTALL_ODT_DIR%\Office Deployment Tool_*.exe" 2^>nul') do (
    set "WO_UNINSTALL_ODT_PACKAGE=%WO_UNINSTALL_ODT_DIR%\%%F"
)

if not defined WO_UNINSTALL_ODT_PACKAGE (
    echo.
    echo %RED%[X] Office Deployment Tool package was not found after download.%RESET%
    echo.

    call :wo_cleanup_office_temp

    pause
    goto menu_windows_office
)

echo.
echo %GREEN%[OK] Office Deployment Tool downloaded successfully.%RESET%
echo.
echo %YELLOW%Extracting Office Deployment Tool...%RESET%
echo.

"%WO_UNINSTALL_ODT_PACKAGE%" /quiet /passive /extract:"%WO_UNINSTALL_ODT_DIR%"

if not exist "%WO_UNINSTALL_ODT_SETUP%" (
    echo.
    echo %RED%[X] Failed to extract Office Deployment Tool.%RESET%
    echo %YELLOW%setup.exe was not found after extraction.%RESET%
    echo.

    call :wo_cleanup_office_temp

    pause
    goto menu_windows_office
)

echo %GREEN%[OK] Office Deployment Tool extracted successfully.%RESET%
echo.
echo %WHITE%Setup File:%RESET%
echo %GREEN%%WO_UNINSTALL_ODT_SETUP%%RESET%
echo.

echo.

echo.
echo %RED%Starting complete Microsoft Office removal...%RESET%
echo.
echo %WHITE%Please keep this window open until the process finishes.%RESET%
echo.

pushd "%WO_UNINSTALL_ODT_DIR%"
setup.exe /configure "%WO_UNINSTALL_XML%"
set "WO_UNINSTALL_RESULT=%ERRORLEVEL%"
popd

echo.

if not "%WO_UNINSTALL_RESULT%"=="0" (
    echo %RED%[X] Office Deployment Tool returned an error during removal.%RESET%
    echo %WHITE%Exit Code:%RESET% %WO_UNINSTALL_RESULT%
    echo.
) else (
    echo %GREEN%[OK] Office Deployment Tool finished the removal process.%RESET%
    echo.
)

call :wo_cleanup_office_temp

pause
goto menu_windows_office

:wo_cleanup_office_temp

if defined WO_OFFICE_XML if exist "%WO_OFFICE_XML%" (
    del /q "%WO_OFFICE_XML%" >nul 2>&1
)

if defined WO_ODT_DIR if exist "%WO_ODT_DIR%" (
    rd /s /q "%WO_ODT_DIR%" >nul 2>&1
)

if defined WO_UNINSTALL_XML if exist "%WO_UNINSTALL_XML%" (
    del /q "%WO_UNINSTALL_XML%" >nul 2>&1
)

if defined WO_UNINSTALL_ODT_DIR if exist "%WO_UNINSTALL_ODT_DIR%" (
    rd /s /q "%WO_UNINSTALL_ODT_DIR%" >nul 2>&1
)

set "WO_OFFICE_XML="
set "WO_ODT_DIR="
set "WO_ODT_PACKAGE="
set "WO_ODT_SETUP="

set "WO_UNINSTALL_XML="
set "WO_UNINSTALL_ODT_DIR="
set "WO_UNINSTALL_ODT_PACKAGE="
set "WO_UNINSTALL_ODT_SETUP="

exit /b

:wo_build_office_conversion_list

for /l %%N in (1,1,50) do (
    set "WO_MAP_SRC_%%N="
    set "WO_MAP_TGT_%%N="
    set "WO_MAP_NAME_%%N="
    set "WO_MAP_CHANNEL_%%N="
)

set /a WO_OFFICE_MATCH_COUNT=0

for %%I in (%WO_OFFICE_PRODUCT_IDS:,= %) do call :wo_register_office_conversion "%%~I"

exit /b

:wo_add_office_conversion

set /a WO_OFFICE_MATCH_COUNT+=1

set "WO_MAP_SRC_%WO_OFFICE_MATCH_COUNT%=%~1"
set "WO_MAP_TGT_%WO_OFFICE_MATCH_COUNT%=%~2"
set "WO_MAP_NAME_%WO_OFFICE_MATCH_COUNT%=%~3"
set "WO_MAP_CHANNEL_%WO_OFFICE_MATCH_COUNT%=%~4"

exit /b

:wo_register_office_conversion

set "WO_MAP_TEST_ID=%~1"

call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProPlus2019" "Office 2019 Professional Plus" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Access2019" "Access 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Excel2019" "Excel 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Outlook2019" "Outlook 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "PowerPoint2019" "PowerPoint 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProjectPro2019" "Project Professional 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProjectStd2019" "Project Standard 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Publisher2019" "Publisher 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "VisioPro2019" "Visio Professional 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "VisioStd2019" "Visio Standard 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Word2019" "Word 2019" "PerpetualVL2019"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "SkypeforBusiness2019" "Skype for Business 2019" "PerpetualVL2019"

call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProPlus2021" "Office 2021 Professional Plus" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Access2021" "Access 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Excel2021" "Excel 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Outlook2021" "Outlook 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "PowerPoint2021" "PowerPoint 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProjectPro2021" "Project Professional 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProjectStd2021" "Project Standard 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Publisher2021" "Publisher 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "VisioPro2021" "Visio Professional 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "VisioStd2021" "Visio Standard 2021" "PerpetualVL2021"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Word2021" "Word 2021" "PerpetualVL2021"

call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProPlus2024" "Office 2024 Professional Plus" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Access2024" "Access 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Excel2024" "Excel 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Outlook2024" "Outlook 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "PowerPoint2024" "PowerPoint 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProjectPro2024" "Project Professional 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "ProjectStd2024" "Project Standard 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "VisioPro2024" "Visio Professional 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "VisioStd2024" "Visio Standard 2024" "PerpetualVL2024"
call :wo_match_office_pair "%WO_MAP_TEST_ID%" "Word2024" "Word 2024" "PerpetualVL2024"

exit /b


:wo_match_office_pair

if /i "%~1"=="%~2Volume" (
    call :wo_add_office_conversion "%~1" "%~2Retail" "%~3 Retail" "Current"
)

if /i "%~1"=="%~2Retail" (
    call :wo_add_office_conversion "%~1" "%~2Volume" "%~3 Volume" "%~4"
)

exit /b

:wo_print_office_conversion

set "WO_MAP_PRINT_NAME="
call set "WO_MAP_PRINT_NAME=%%WO_MAP_NAME_%~1%%"

echo %WHITE%[%~1]%RESET% %WO_MAP_PRINT_NAME%

exit /b

:wo_select_office_conversion

set "WO_OFFICE_SOURCE_ID="
set "WO_OFFICE_TARGET_ID="
set "WO_OFFICE_TARGET_NAME="
set "WO_OFFICE_TARGET_CHANNEL="

call set "WO_OFFICE_SOURCE_ID=%%WO_MAP_SRC_%~1%%"
call set "WO_OFFICE_TARGET_ID=%%WO_MAP_TGT_%~1%%"
call set "WO_OFFICE_TARGET_NAME=%%WO_MAP_NAME_%~1%%"
call set "WO_OFFICE_TARGET_CHANNEL=%%WO_MAP_CHANNEL_%~1%%"

exit /b

:wo_office_activate
cls
echo %CYAN%====================================================%RESET%
echo %GREEN%             Activate Microsoft Office%RESET%
echo %CYAN%====================================================%RESET%
echo.

call :wo_find_ospp

if not defined WO_OSPP goto wo_no_ospp

echo %GREEN%[OK] Office licensing script found:%RESET%
echo %WHITE%"%WO_OSPP%"%RESET%
echo.

echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Detected Installed Office License Details:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

cscript //nologo "%WO_OSPP%" /dstatus

echo.
echo %WHITE%OSPP.VBS applies to supported volume-licensed Office versions.%RESET%
echo %YELLOW%Microsoft 365 Apps/subscription activation is not handled by OSPP.VBS.%RESET%
echo.

set "WO_OFFICEKEY="
set /p "WO_OFFICEKEY=%YELLOW%Enter your Office volume-license key (B=Back): %RESET%"

if /i "%WO_OFFICEKEY%"=="B" goto menu_windows_office
if not defined WO_OFFICEKEY goto menu_windows_office

echo.
echo %YELLOW%Installing Office product key...%RESET%
echo.

cscript //nologo "%WO_OSPP%" /inpkey:%WO_OFFICEKEY%

echo.

choice /c YN /n /m "Activate Office now? (Y=Activate / N=Cancel): "

if errorlevel 2 goto wo_office_cancel_activation

echo.
echo %YELLOW%Activating Microsoft Office...%RESET%
echo.

cscript //nologo "%WO_OSPP%" /act

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Updated Office License Details:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

cscript //nologo "%WO_OSPP%" /dstatus

set "WO_OFFICEKEY="

echo.
pause
goto menu_windows_office


:wo_office_cancel_activation
echo.

choice /c YN /n /m "Confirm cancel and remove the just-entered Office key? (Y/N): "

if errorlevel 2 goto wo_office_cancel_declined

set "WO_LAST5=%WO_OFFICEKEY:~-5%"

echo.
echo %YELLOW%Removing Office key ending in %WO_LAST5%...%RESET%
echo.

cscript //nologo "%WO_OSPP%" /unpkey:%WO_LAST5%

echo.
echo %GREEN%The just-entered Office key was removed locally.%RESET%
echo.
echo %WHITE%Current Office License Status:%RESET%
echo.

cscript //nologo "%WO_OSPP%" /dstatus

set "WO_OFFICEKEY="
set "WO_LAST5="

echo.
pause
goto menu_windows_office


:wo_office_cancel_declined
echo.
echo %YELLOW%Removal declined.%RESET%
echo %WHITE%The key remains installed; activation was not attempted.%RESET%
echo.

cscript //nologo "%WO_OSPP%" /dstatus

set "WO_OFFICEKEY="

echo.
pause
goto menu_windows_office

:wo_win_remove_key
cls
echo %CYAN%====================================================%RESET%
echo %RED%         Remove Installed Windows Product Key%RESET%
echo %CYAN%====================================================%RESET%
echo.

call :wo_show_windows_summary

echo.
echo %YELLOW%WARNING:%RESET%
echo %WHITE%This removes the installed Windows product key locally.%RESET%
echo %WHITE%A digital license may still activate Windows automatically.%RESET%
echo.

choice /c YN /n /m "Remove the installed Windows key now? (Y/N): "

if errorlevel 2 goto menu_windows_office

echo.
echo %YELLOW%Removing Windows product key...%RESET%
echo.

cscript //nologo "%windir%\system32\slmgr.vbs" /upk

echo.
cscript //nologo "%windir%\system32\slmgr.vbs" /cpky

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Windows License Status After Removal:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

call :wo_show_windows_summary

echo.
pause
goto menu_windows_office

:wo_office_remove_key
cls
echo %CYAN%====================================================%RESET%
echo %RED%         Remove Detected Office Product Keys%RESET%
echo %CYAN%====================================================%RESET%
echo.

call :wo_find_ospp

if not defined WO_OSPP goto wo_no_ospp

echo %WHITE%Current Office Licenses and Installed Key Suffixes:%RESET%
echo.

cscript //nologo "%WO_OSPP%" /dstatus

echo.
echo %RED%WARNING:%RESET%
echo %WHITE%This attempts to remove all detected Office volume-license keys locally.%RESET%
echo %WHITE%It does NOT revoke the license from Microsoft or your organization.%RESET%
echo.

choice /c YN /n /m "Remove detected Office key(s) now? (Y/N): "

if errorlevel 2 goto menu_windows_office

set "WO_FOUND_OFFICE_KEY="

for /f "tokens=8" %%K in ('cscript //nologo "%WO_OSPP%" /dstatus ^| findstr /i /c:"Last 5 characters of installed product key:"') do (
    set "WO_FOUND_OFFICE_KEY=1"
    echo.
    echo Removing detected Office key ending in %%K...
    cscript //nologo "%WO_OSPP%" /unpkey:%%K
)

if not defined WO_FOUND_OFFICE_KEY (
    echo.
    echo %YELLOW%No matching installed Office key suffix was detected by OSPP.VBS.%RESET%
)

echo.
echo %CYAN%----------------------------------------------------%RESET%
echo %WHITE%Office License Status After Removal Attempt:%RESET%
echo %CYAN%----------------------------------------------------%RESET%
echo.

cscript //nologo "%WO_OSPP%" /dstatus

echo.
pause
goto menu_windows_office

:wo_no_ospp
echo.
echo %RED%[X] Could not find OSPP.VBS in common Office installation folders.%RESET%
echo.
echo %WHITE%The OSPP route is for supported volume-licensed Office versions.%RESET%
echo %YELLOW%Microsoft 365 Apps/subscription activation is managed in the Office app.%RESET%
echo.

pause
goto menu_windows_office

:wo_find_ospp
set "WO_OSPP="

if exist "%ProgramFiles%\Microsoft Office\root\Office16\OSPP.VBS" set "WO_OSPP=%ProgramFiles%\Microsoft Office\root\Office16\OSPP.VBS"

if not defined WO_OSPP if exist "%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPP.VBS" set "WO_OSPP=%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPP.VBS"

if not defined WO_OSPP if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" set "WO_OSPP=%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS"

if not defined WO_OSPP if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" set "WO_OSPP=%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS"

if not defined WO_OSPP if exist "%ProgramFiles%\Microsoft Office\Office15\OSPP.VBS" set "WO_OSPP=%ProgramFiles%\Microsoft Office\Office15\OSPP.VBS"

if not defined WO_OSPP if exist "%ProgramFiles(x86)%\Microsoft Office\Office15\OSPP.VBS" set "WO_OSPP=%ProgramFiles(x86)%\Microsoft Office\Office15\OSPP.VBS"

exit /b

:wo_show_current_edition
set "WO_CURRENT_SKU="
set "WO_CURRENT_NAME="

for /f "tokens=3" %%E in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID ^| findstr /i "EditionID"') do set "WO_CURRENT_SKU=%%E"

set "WO_CURRENT_NAME=%WO_CURRENT_SKU%"

if /i "%WO_CURRENT_SKU%"=="Core" set "WO_CURRENT_NAME=Home"
if /i "%WO_CURRENT_SKU%"=="CoreSingleLanguage" set "WO_CURRENT_NAME=Home Single Language"
if /i "%WO_CURRENT_SKU%"=="CoreCountrySpecific" set "WO_CURRENT_NAME=Home China"

if /i "%WO_CURRENT_SKU%"=="Professional" set "WO_CURRENT_NAME=Pro"
if /i "%WO_CURRENT_SKU%"=="ProfessionalN" set "WO_CURRENT_NAME=Pro N"

if /i "%WO_CURRENT_SKU%"=="ProfessionalEducation" set "WO_CURRENT_NAME=Pro Education"
if /i "%WO_CURRENT_SKU%"=="ProfessionalEducationN" set "WO_CURRENT_NAME=Pro Education N"

if /i "%WO_CURRENT_SKU%"=="ProfessionalWorkstation" set "WO_CURRENT_NAME=Pro for Workstations"
if /i "%WO_CURRENT_SKU%"=="ProfessionalWorkstationN" set "WO_CURRENT_NAME=Pro for Workstations N"

if /i "%WO_CURRENT_SKU%"=="Enterprise" set "WO_CURRENT_NAME=Enterprise"
if /i "%WO_CURRENT_SKU%"=="EnterpriseN" set "WO_CURRENT_NAME=Enterprise N"

if /i "%WO_CURRENT_SKU%"=="EnterpriseS" set "WO_CURRENT_NAME=Enterprise LTSC"
if /i "%WO_CURRENT_SKU%"=="EnterpriseSN" set "WO_CURRENT_NAME=Enterprise N LTSC"

if /i "%WO_CURRENT_SKU%"=="Education" set "WO_CURRENT_NAME=Education"
if /i "%WO_CURRENT_SKU%"=="EducationN" set "WO_CURRENT_NAME=Education N"

if not defined WO_CURRENT_NAME set "WO_CURRENT_NAME=Unknown"

echo %WHITE%Current Edition:%RESET% %GREEN%%WO_CURRENT_NAME%%RESET%

exit /b

:wo_show_windows_summary
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv | findstr /i /c:"Name:" /c:"Description:" /c:"Product Key Channel:" /c:"License Status:"

if errorlevel 1 (
    echo %YELLOW%Windows license summary unavailable.%RESET%
    echo %WHITE%Check Settings ^> System ^> Activation.%RESET%
)

exit /b

:about
cls

echo %CYAN%====================================================%RESET%
echo %GREEN%                 About Developer%RESET%
echo %CYAN%====================================================%RESET%
echo.

echo %WHITE%Developer:%RESET% Hesham Taha
echo %WHITE%YouTube:%RESET% Hesham Taha
echo %WHITE%Facebook:%RESET% Hesham Taha Official
echo %WHITE%Version:%RESET% 1.7
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

:ensure_winget
where winget >nul 2>&1
if %errorlevel% equ 0 goto :eof

echo %YELLOW%Winget (App Installer) is not found on this system.%RESET%
echo %YELLOW%Attempting to install it automatically, please wait...%RESET%

echo %WHITE%Installing dependencies (1/3): VCLibs...%RESET%
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx' -OutFile '%temp%\VCLibs.appx'; Add-AppxPackage -Path '%temp%\VCLibs.appx'" >nul 2>&1

echo %WHITE%Installing dependencies (2/3): UI.Xaml...%RESET%
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx' -OutFile '%temp%\UIXaml.appx'; Add-AppxPackage -Path '%temp%\UIXaml.appx'" >nul 2>&1

echo %WHITE%Installing App Installer (3/3)...%RESET%
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/microsoft/winget-cli/releases/download/v1.7.11132/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' -OutFile '%temp%\AppInstaller.msixbundle'; Add-AppxPackage -Path '%temp%\AppInstaller.msixbundle'" >nul 2>&1

where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%[X] Failed to install Winget automatically.%RESET%
    echo %WHITE%Please install "App Installer" manually from the Microsoft Store, then try again.%RESET%
    pause
    goto menu
) else (
    echo %GREEN%[OK] Winget installed successfully!%RESET%
)
goto :eof

:install_pkg
echo %YELLOW%Installing: %~1...%RESET%
winget install --id "%~1" --silent --accept-source-agreements --accept-package-agreements --source winget >nul 2>&1
set "pkg_rc=%errorlevel%"
if "%pkg_rc%"=="0" goto :eof
if "%pkg_rc%"=="-1978335135" goto :eof
if "%pkg_rc%"=="-1978335189" goto :eof
set /a fail_count+=1
echo %RED%    [X] Failed: %~1%RESET%
goto :eof

:AUTO_UPDATE
setlocal EnableDelayedExpansion

set CURRENT_VERSION=1.7
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
