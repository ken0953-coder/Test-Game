# 🎮 俄羅斯方塊 Android APK

經典俄羅斯方塊遊戲，已打包為 Android 應用。

## 快速開始

### 方法一：使用 Android Studio（推薦）

1. **下載並安裝 Android Studio**
   - 官網：https://developer.android.com/studio
   - 免費下載，約 1GB

2. **開啟專案**
   ```
   檔案 → 開啟 → 選擇此資料夾
   路徑：C:\Users\ajleong\.hermes\workspace\tetris_game\android
   ```

3. **等待 Gradle 同步完成**
   - 首次開啟會自動下載所需元件
   - 約需 5-10 分鐘（取決於網路速度）

4. **編譯 APK**
   - 點擊選單：**Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
   - 或按快捷鍵：**Ctrl + F9**

5. **找到 APK**
   - 路徑：`android\app\build\outputs\apk\debug\app-debug.apk`
   - 大小約 15-20 MB

6. **安裝到手機**
   - 用 USB 連接手機
   - 開啟命令提示字元：
     ```cmd
     adb install android\app\build\outputs\apk\debug\app-debug.apk
     ```
   - 或在 Android Studio 中點擊 **Run** 按鈕（綠色三角形）

---

### 方法二：使用命令行（需先安裝 Java）

#### Windows
```cmd
cd C:\Users\ajleong\.hermes\workspace\tetris_game
build-apk.bat
```

#### macOS/Linux
```bash
cd ~/.hermes/workspace/tetris_game
chmod +x build-apk.sh
./build-apk.sh
```

---

## 遊戲特色

### 玩法
- 經典俄羅斯方塊規則
- 7 種標準方塊（I、J、L、O、S、T、Z）
- 隨著等級提升，下落速度加快
- 消除多行獲得更多分數

### 操作方式

**觸控操作**
- 左右滑動 → 移動方塊
- 快速下滑 → 硬降（直接落底）
- 輕滑下滑 → 軟降（加速下降）
- 雙擊 → 旋轉方塊

**螢幕按鈕**
- ← → ：左右移動
- ↻ ：旋轉
- ⬇⬇ ：硬降
- ↓ ：軟降
- ❚❚ ：暫停

**鍵盤（電腦測試用）**
- 方向鍵 ← → ↓ ：移動
- 方向鍵 ↑ ：旋轉
- 空白鍵 ：硬降
- P 鍵 ：暫停

### 評分系統
| 消除行數 | 分數 |
|---------|------|
| 1 行 | 100 × 等級 |
| 2 行 | 300 × 等級 |
| 3 行 | 500 × 等級 |
| 4 行 | 800 × 等級 |

---

## 系統需求

### 手機需求
- Android 5.0 (API 21) 以上
- 建議 2GB RAM 以上

### 電腦需求（編譯用）
- Java JDK 8 或更高版本
- Android Studio（用於編譯）
- 約 2GB 硬碟空間

---

## 檔案結構

```
tetris_game/
├── www/                      # 網頁遊戲原始碼
│   ├── index.html           # 主遊戲檔案
│   └── manifest.json        # PWA 設定
├── android/                  # Android 專案
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── java/com/example/tetris/
│   │   │   │   └── MainActivity.java
│   │   │   ├── assets/public/
│   │   │   │   └── index.html  # 遊戲檔案（已複製）
│   │   │   ├── res/          # 資源檔案
│   │   │   └── AndroidManifest.xml
│   │   └── build.gradle
│   ├── gradle/               # Gradle 配置
│   └── gradlew               # Gradle Wrapper
├── capacitor.config.json     # Capacitor 配置
├── package.json              # Node.js 依賴
├── build-apk.bat            # Windows 編譯腳本
└── build-apk.sh             # macOS/Linux 編譯腳本
```

---

## 常見問題

### Q: 編譯時出現 "JAVA_HOME not set" 錯誤
**A:** 需要設置 Java 環境變數：
- Windows：系統屬性 → 環境變數 → 新增 `JAVA_HOME` = Java 安裝路徑
- macOS/Linux：在 `~/.bashrc` 或 `~/.zshrc` 中添加：
  ```bash
  export JAVA_HOME=$(/usr/libexec/java_home)
  export PATH=$JAVA_HOME/bin:$PATH
  ```

### Q: 如何修改遊戲名稱？
**A:** 編輯 `capacitor.config.json`：
```json
{
  "appName": "你的遊戲名稱"
}
```
然後執行 `npx cap sync android`

### Q: 如何修改應用程式圖標？
**A:** 將自定義圖標放入 `android/app/src/main/res/` 對應資料夾：
- `mipmap-hdpi/ic_launcher.png` (72x72)
- `mipmap-mdpi/ic_launcher.png` (48x48)
- `mipmap-xhdpi/ic_launcher.png` (96x96)
- `mipmap-xxhdpi/ic_launcher.png` (144x144)
- `mipmap-xxxhdpi/ic_launcher.png` (192x192)

### Q: APK 太大怎麼縮減？
**A:** 可在 `android/app/build.gradle` 中啟用壓縮：
```groovy
android {
    buildTypes {
        release {
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

---

## 技術棧

- **遊戲引擎**：HTML5 Canvas + Vanilla JavaScript
- **包裝工具**：Capacitor 6.x
- **構建系統**：Gradle 8.x
- **最低支援**：Android 5.0 (API 21)

---

## 授權

本遊戲為免費開源項目，可供個人和商业使用。

---

## 聯絡資訊

如有問題，請隨時詢問！