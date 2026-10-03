$bat = "$env:TEMP\WindowsRepairToolPro.bat"

irm "https://raw.githubusercontent.com/newmatrix/WinRTP/main/WindowsRepairToolPro.bat" -OutFile $bat

Start-Process cmd.exe -Verb RunAs -ArgumentList "/c `"$bat`""