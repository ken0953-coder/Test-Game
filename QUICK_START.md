# 🚀 俄羅斯方塊 - Google Play 發布檢查清單

## ✅ 專案狀態

### 已完成項目
| 項目 | 狀態 | 說明 |
|------|------|------|
| 遊戲開發 | ✅ 完成 | HTML5 Canvas + Vanilla JS |
| 觸控操作 | ✅ 完成 | 滑動 + 按鍵雙重支援 |
| Android 專案 | ✅ 完成 | Capacitor 6.x 架構 |
| 應用程式圖標 | ✅ 完成 | 6種尺寸 (48-192px) |
| 隱私權政策 | ✅ 完成 | 內建模板 |
| 遊戲描述 | ✅ 完成 | 繁體中文 |

### 待完成項目（發布前）
| 項目 | 狀態 | 建議動作 |
|------|------|----------|
| Java JDK | ⏳ 需安裝 | 下載 https://adoptium.net/ |
| Android Studio | ⏳ 需安裝 | 下載 https://developer.android.com/studio |
| 簽名密鑰 | ⏳ 需建立 | 使用 keytool 命令 |
| Release APK/AAB | ⏳ 需編譯 | Android Studio Build |
| Google Play 帳號 | ⏳ 需註冊 | $25 一次性費用 |

---

## 📋 快速發布步驟

### 步驟 1：安裝必要工具（約 30 分鐘）

```bash
# 1. 安裝 Java JDK 17
# 下載：https://adoptium.net/
# 選擇: JDK 17 LTS (Long Term Support)

# 2. 安裝 Android Studio  
# 下載：https://developer.android.com/studio
# 內建包含 Android SDK

# 3. 驗證安裝
java -version
# 應顯示: java version "17.x.x"
```

### 步驟 2：開啟專案並編譯（約 10 分鐘）

1. **開啟 Android Studio**
   - File → Open
   - 選擇資料夾：`C:\Users\ajleong\.hermes\workspace\tetris_game\android`

2. **等待 Gradle 同步**
   - 首次開啟會下載依賴套件
   - 底部狀態列顯示 "Gradle sync finished"

3. **編譯 Release APK**
   - Build → Generate Signed Bundle / APK
   - 選擇 APK
   - 建立新密鑰或選擇已有密鑰

### 步驟 3：Google Play 上架（約 30 分鐘）

1. **註冊開發者帳號**
   - 網址：https://play.google.com/console
   - 費用：$25（一次性）
   - 需要：Google 帳號 + 身份驗證

2. **建立應用程式**
   - 點擊 "Create App"
   - 填寫：
     - 應用程式名稱：俄羅斯方塊
     - 預設語言：中文（繁體）
     - 類別：益智

3. **上傳應用程式**
   - 生產版本 → 創建版本
   - 上傳 AAB 檔案
   - 填寫應用程式資訊

---

## 📱 應用程式資訊

### 基本設定
```
應用程式名稱：俄羅斯方塊
簡短標題：經典益智遊戲
應用程式描述：
  體驗最經典的俄羅斯方塊遊戲！

  ✨ 遊戲特色：
  • 經典 10x20 標準棋盤
  • 7 種經典方塊類型
  • 流暢的觸控操作
  • 霓虹風格視覺效果
  • 等級遞增難度
  • 即時得分統計

  🎮 操作說明：
  • 左右滑動：移動方塊
  • 快速下滑：硬降
  • 雙擊：旋轉方塊

  經典遊戲，永不過時！

分類：益智
內容分級：Everyone（全齡適用）
免費：是
```

### 截圖需求
- 最少 2 張
- 建議 4-8 張
- 尺寸：1080x1920（手機直向）
- 內容：遊戲主畫面、進行中、得分、結束

---

## 🔐 簽名密鑰建立（重要！）

```bash
# 在 cmd 或 PowerShell 執行
cd C:\Users\ajleong\.hermes\workspace\tetris_game

# 建立簽名密鑰
keytool -genkeypair -v -storetype PKCS12 \
  -keystore tetris-release.keystore \
  -alias tetris \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -storepass YourPassword123 \
  -keypass YourPassword123

# 將 .keystore 檔案移至 android/app/ 目錄
# 並在 build.gradle 中配置簽名
```

⚠️ **重要提醒：**
- 妥善保管 `.keystore` 檔案
- 遺失密鑰將無法更新應用程式
- 建議備份到雲端硬碟

---

## 📊 發布流程圖

```
┌─────────────────┐
│  安裝 Java/JDK  │
└────────┬────────┘
         ▼
┌─────────────────┐
│  安裝 Android   │
│     Studio      │
└────────┬────────┘
         ▼
┌─────────────────┐
│  開啟專案專案   │
│  (android/)     │
└────────┬────────┘
         ▼
┌─────────────────┐
│  建立簽名密鑰   │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Generate       │
│  Signed Bundle  │
│     / APK       │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Google Play    │
│   Console       │
│   建立應用程式  │
└────────┬────────┘
         ▼
┌─────────────────┐
│  上傳 AAB 檔案  │
└────────┬────────┘
         ▼
┌─────────────────┐
│  填寫發布資訊   │
│  (描述/截圖等) │
└────────┬────────┘
         ▼
┌─────────────────┐
│  提交審核       │
└────────┬────────┘
         ▼
┌─────────────────┐
│  上架成功！🎉   │
└─────────────────┘
```

---

## ⏱️ 預計時間

| 階段 | 時間 | 備註 |
|------|------|------|
| 環境安裝 | 30-60 分鐘 | 首次需下載 |
| 專案開啟 | 5-10 分鐘 | Gradle 同步 |
| 簽名設定 | 10 分鐘 | 一次性 |
| 編譯打包 | 10-20 分鐘 | 依電腦效能 |
| Google Play 設定 | 20-30 分鐘 | 填寫資訊 |
| 審核時間 | 1-7 天 | 首次較慢 |
| **總計** | **約 2-4 小時** | 不含審核 |

---

## 💡 快速開始命令

如果您已有 Java 和 Android Studio，可直接執行：

```cmd
cd C:\Users\ajleong\.hermes\workspace\tetris_game
build-apk.bat
```

這會自動：
1. 同步 Capacitor
2. 編譯 Debug APK
3. 提示安裝位置

---

## 🆘 需要協助？

如需協助以下任何步驟，請告訴我：

1. **安裝 Java JDK** - 提供詳細步驟
2. **設定 Android Studio** - Remote 協助
3. **建立簽名密鑰** - 逐步指引
4. **準備截圖** - 使用截圖工具
5. **撰寫上架資訊** - 提供模板

隨時詢問！