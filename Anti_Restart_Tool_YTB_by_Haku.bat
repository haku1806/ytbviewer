@ echo off

:loop_time
cls
cls
echo.
echo ===================================================
echo.
echo  	Auto Restart Tool YTBViewer by Haku
echo.
echo ===================== RUNNING =====================
echo.
echo.
Echo App YTBViewer se duoc khoi dong lai sau 13000 giay.
echo.
Echo Ban Phai Khoi Dong Auto Nay Cung Luc Voi Tool YTBViewer !!
Echo.
echo.
echo Press Ctrl-C to cancel.
echo.

cd "C:\Users\Administrator\AppData\Roaming\YTBVIEWER60\YTBVIEWER60\YTBVIEWER"
timeout /T 13000 /nobreak >nul
taskkill /IM YTBClient.exe /F
taskkill /IM YTBVIEWER.exe /F
timeout /T 10 /nobreak >nul
Start "" /b YTBClient.exe
goto :loop_time