$usrname = 'Administrator'
$password = Read-Host -Prompt 'Nhap pass VPS cua ban'
Write-Output "Dang doi pass VPS thanh: $password"
net user Administrator $password
Write-Output "Done..."
DO
{
    Write-Output "1. Auto RestartVPS for YTBViewer"
    Write-Output "2. Youtube Auto View"
    Write-Output "3. Disabled All Startup"
    Write-Output "4. Khong"
    $type = Read-Host -Prompt 'Nhap lua chon cua ban:'
    If ($type -eq '1') {
    Write-Output 'Ban da chon Auto RestartVPS for YTBViewer'
    Write-Output "Dang tao file startup Auto RestartVPS for YTBViewer"
    taskkill /IM Auto_Restart_VPS_ToolYTB.exe /F
    taskkill /IM Anti_Restart_VPS_ToolYTB.exe /F
    Remove-Item -Path C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\Startup
    Copy-Item -Path C:\Users\Administrator\Desktop\Auto_Restart_VPS_ToolYTB.exe -Destination C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\Startup
    }
    ElseIf ($type -eq '2') {
    Write-Output 'Ban da chon Youtube Auto View'
    Write-Output "Dang tao file startup cho Youtube Auto View"
    Remove-Item -Path C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\Startup
    Copy-Item -Path C:\Users\Administrator\Desktop\"YouTube Auto Viewer.lnk" -Destination C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\Startup
    }
    ElseIf ($type -eq '0') {
    Write-Output 'Ban da chon Anti RestartVPS for YTBViewer'
    Write-Output "Dang tao file startup Anti RestartVPS for YTBViewer"
    taskkill /IM Auto_Restart_VPS_ToolYTB.exe /F
    taskkill /IM Anti_Restart_VPS_ToolYTB.exe /F
    Remove-Item -Path C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\Startup
    Copy-Item -Path C:\Users\Administrator\Videos\Anti_Restart_VPS_ToolYTB.exe -Destination C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\Startup
    }
    ElseIf ($type -eq '3') {
    Write-Output 'Disabled All Startup'
    Remove-Item -Path C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\"Start Menu"\Programs\Startup
    }
    ElseIf ($type -eq '4') {
    Write-Output 'Ban da chon khong'
    }
    Else {
    'Ban nhap sai, vui long nhap lai'
    }
} While (($type -ne '1') -AND ($type -ne '2') -AND ($type -ne '3') -AND ($type -ne '4') -AND ($type -ne '0'))

Write-Output "Tao file startup thanh cong"
Write-Output "Dang cau hinh cac chuc nang can thiet de auto login Radmin"
$RegistryLocation = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
Set-ItemProperty $RegistryLocation -Name 'AutoAdminLogon' -Value '1'
Set-ItemProperty $RegistryLocation -Name 'DefaultUsername' -Value "$usrname"
Set-ItemProperty $RegistryLocation -Name 'DefaultPassword' -Value "$password"
Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask -Verbose
Uninstall-WindowsFeature -Name Windows-Defender
powercfg /change monitor-timeout-ac 0
sc.exe config wuauserv start=disabled
sc.exe stop wuauserv
Write-Output "Done..."
Write-Output "VPS se duoc khoi dong lai trong 15s"
Restart-Computer