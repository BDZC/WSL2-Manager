@echo off
pushd "%~dp0"

for %%v in (*.exe;*.dll;*.cpl;*.ocx) do "C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\signtool" sign ^
    /f C:\SSL\BDZC_WIN_NOPW.PFX ^
    /n "BDZC-WIN" ^
    /tr http://timestamp.digicert.com?alg=sha256 ^
    /td SHA256 ^
    /fd SHA256 ^
    "%%v"

%windir%\System32\WindowsPowerShell\v1.0\powershell -Command Get-ChildItem . ^| Where { $_.Name -ne 'Publish.cmd' } ^| Compress-Archive -DestinationPath .\WslManager.zip

%windir%\explorer.exe /select,%~dp0WslManager.zip

:exit
popd
@echo on