@echo off
pushd "%~dp0"

"C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\signtool" sign ^
    /f C:\SSL\bdzc_win.pfx ^
    /p Metal1 ^
    /n "BDZC-WIN" ^
    /tr http://timestamp.digicert.com?alg=sha256 ^
    /td SHA256 ^
    /fd SHA256 ^
    WslSetup.exe

:exit
popd
@echo on