@echo off
echo Applying registry changes...

:: Enable News and Interests
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests" /v value /t REG_DWORD /d 1 /f

:: Remove News and Interests policy
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /f

:: Fix Notification Bell
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowNotificationIcon /t REG_DWORD /d 1 /f

:: Chrome Policies
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ProxyMode /t REG_SZ /d "system" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v IncognitoModeAvailability /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v AllowDeletingBrowserHistory /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v DeveloperToolsAvailability /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ExtensionDeveloperModeSettings /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ForceYouTubeRestrict /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v BrowserSignin /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v BlockExternalExtensions /t REG_DWORD /d 0 /f
reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v RestrictSigninToPattern /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v NewTabPageLocation /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ExtensionInstallBlocklist /t REG_SZ /d "kkbmdgjggcdajckdlbngdjonpchpaiea" /f

:: Windows Store Policies
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RequirePrivateStoreOnly /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\WindowsStore" /v RequirePrivateStoreOnly /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 0 /f

echo Registry changes applied successfully.

copy /Y "C:\Program Files\BraveSoftware\Brave-Browser\brave.exe" "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"

pause
