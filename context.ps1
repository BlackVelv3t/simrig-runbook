# context.ps1
# Run this on the simrig PC (Gengar) at the start of a new AI session.
# Paste the full output to Claude along with the runbook.
#
# Usage:  .\context.ps1
# (If blocked by execution policy: powershell -ExecutionPolicy Bypass -File .\context.ps1)

Write-Host "===== SIMRIG CONTEXT =====" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date)`n"

Write-Host "--- System ---" -ForegroundColor Yellow
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, OSArchitecture, LastBootUpTime | Format-List
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors | Format-List
Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | ForEach-Object { "Total RAM: {0:N2} GB" -f ($_.Sum / 1GB) }

Write-Host "`n--- GPU ---" -ForegroundColor Yellow
Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion, CurrentHorizontalResolution, CurrentVerticalResolution | Format-List

Write-Host "`n--- Connected Displays ---" -ForegroundColor Yellow
Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | ForEach-Object {
    $name = ($_.UserFriendlyName | Where-Object { $_ -ne 0 } | ForEach-Object { [char]$_ }) -join ""
    Write-Host "Display: $name"
}

Write-Host "`n--- Display Config Files (MultiMonitorTool) ---" -ForegroundColor Yellow
$displayConfigPath = "C:\Users\danan\Tools\Display Config"
if (Test-Path $displayConfigPath) {
    Get-ChildItem $displayConfigPath | Select-Object Name, LastWriteTime
} else {
    Write-Host "Path not found: $displayConfigPath"
}

Write-Host "`n--- MultiMonitorTool ---" -ForegroundColor Yellow
$mmtPath = "C:\Users\danan\Tools\multimonitortool\MultiMonitorTool.exe"
if (Test-Path $mmtPath) {
    Write-Host "Found: $mmtPath"
    (Get-Item $mmtPath).VersionInfo | Select-Object FileVersion, ProductVersion
} else {
    Write-Host "NOT FOUND: $mmtPath"
}

Write-Host "`n--- Installed Sim Software (relevant matches) ---" -ForegroundColor Yellow
$keywords = @("Flight Simulator", "MSFS", "Euro Truck", "Farming Simulator", "Assetto Corsa", "DCS", "vPilot", "Little Navmap", "OBS")
$installed = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* -ErrorAction SilentlyContinue |
    Where-Object { $_.DisplayName }
$installed | Where-Object {
    $dn = $_.DisplayName
    ($keywords | Where-Object { $dn -like "*$_*" }).Count -gt 0
} | Select-Object DisplayName, DisplayVersion | Sort-Object DisplayName | Format-Table -AutoSize

Write-Host "`n--- Stream Deck ---" -ForegroundColor Yellow
Get-Process -Name "StreamDeck" -ErrorAction SilentlyContinue | Select-Object Name, Id, StartTime

Write-Host "`n--- Git Status (simrig-runbook repo) ---" -ForegroundColor Yellow
$repoPath = "C:\Users\danan\Tools\Shadowlab & GIT\simrig-runbook"
if (Test-Path $repoPath) {
    Push-Location $repoPath
    git status
    git log --oneline -5
    Pop-Location
} else {
    Write-Host "Repo not found at: $repoPath (adjust path once cloned)"
}

Write-Host "`n===== END CONTEXT =====" -ForegroundColor Cyan
