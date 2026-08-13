@echo off
REM Tetris APK Builder Script (Windows)
REM 此腳本會自動安裝 Java 並編譯 APK

echo ======================================
echo 俄羅斯方塊 APK 編譯器
echo ======================================
echo.

REM 檢查 Java
where java >nul 2>&1
if %errorlevel% neq 0 (
    echo [錯誤] 未找到 Java
    echo.
    echo 請先安裝 Java 8 或更高版本:
    echo   1. 下載 JDK: https://adoptium.net/
    echo   2. 安裝後重啟命令提示字元
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('java -version 2^>^&1 ^| findstr /i "version"') do set JAVA_VER=%%i
echo [OK] Java 版本: %JAVA_VER%
echo.

REM 進入專案目錄
cd /d "%~dp0android"

echo [步驟 1] 同步 Capacitor...
cd ..
call npx cap sync android

echo.
echo [步驟 2] 編譯 APK...
cd android
call gradlew.bat assembleDebug

echo.
echo ======================================
echo [成功] APK 已生成!
echo ======================================
echo.
echo APK 位置:
echo   android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo 安裝到手機:
echo   adb install android\app\build\outputs\apk\debug\app-debug.apk
echo.
pause