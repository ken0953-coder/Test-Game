#!/bin/bash
# Tetris APK Builder Script
# 此腳本會自動安裝 Java 並編譯 APK

set -e

echo "======================================"
echo "俄羅斯方塊 APK 編譯器"
echo "======================================"

# 檢查 Java
if ! command -v java &> /dev/null; then
    echo "[錯誤] 未找到 Java"
    echo "請先安裝 Java 8 或更高版本"
    echo ""
    echo "Windows 安裝方式:"
    echo "  1. 下載 JDK: https://adoptium.net/"
    echo "  2. 安裝後重啟終端"
    echo ""
    echo "macOS 安裝方式:"
    echo "  brew install --cask temurin@17"
    echo ""
    echo "Ubuntu/Debian 安裝方式:"
    echo "  sudo apt update"
    echo "  sudo apt install openjdk-17-jdk"
    exit 1
fi

echo "[OK] Java 版本: $(java -version 2>&1 | head -1)"

# 檢查 Gradle
if ! command -v gradle &> /dev/null; then
    echo "[提示] 未找到 Gradle，將使用專案內的 Gradle Wrapper"
fi

# 進入專案目錄
cd "$(dirname "$0")/android"

echo ""
echo "[步驟 1] 同步 Capacitor..."
cd ..
npx cap sync android

echo ""
echo "[步驟 2] 編譯 APK..."
cd android
chmod +x gradlew
./gradlew assembleDebug

echo ""
echo "======================================"
echo "[成功] APK 已生成!"
echo "======================================"
echo ""
echo "APK 位置:"
echo "  android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "安裝到手機:"
echo "  adb install android/app/build/outputs/apk/debug/app-debug.apk"
echo ""