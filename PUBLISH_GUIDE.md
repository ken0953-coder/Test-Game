# 🚀 俄羅斯方塊 - Google Play 發布指南

## ✅ 專案狀態檢查

### 已完成
- [x] HTML5 遊戲開發（Canvas + Vanilla JS）
- [x] Capacitor 6.x 包裝
- [x] Android 專案架構
- [x] 觸控操作支援
- [x] 響應式設計

### 待完成（發布前）
- [ ] Java JDK 安裝
- [ ] Android Studio 設定
- [ ] 應用程式簽署
- [ ] 輸出 AAB 檔案
- [ ] Google Play 控制台設定

---

## 📋 發布前準備清單

### 1. 開發環境要求

#### Windows 系統
```
必要軟體：
✅ Java JDK 17+ (https://adoptium.net/)
✅ Android Studio (https://developer.android.com/studio)
✅ Android SDK (Android Studio 內建安裝)
```

#### 驗證安裝
```bash
# 檢查 Java
java -version
# 應顯示: java version "17.x.x"

# 檢查 Android SDK
echo %ANDROID_HOME%
# 應顯示: C:\Users\你的帳號\AppData\Local\Android\Sdk
```

---

### 2. 修改應用程式資訊

編輯 `capacitor.config.json`：
```json
{
  "appId": "com.你的名字.tetris",
  "appName": "俄羅斯方塊",
  "webDir": "www",
  "bundledRuntimeBuild": false
}
```

** appId 格式建議：**
- 使用反域名：`com.yourcompany.tetris`
- 或使用個人域名：`name.yourname.tetris`

---

### 3. 生成應用程式圖標

Google Play 要求多種尺寸的圖標：

**推薦尺寸：**
- 512x512 (主要圖標)
- 320x320 (高解析度)
- 192x192 (標準)
- 144x144 (中解析度)
- 96x96 (低解析度)
- 72x72 (超低解析度)

**生成方式：**
1. 使用 [App Icon Generator](https://play.google.com/store/icons)
2. 或線上工具：https://icon.kitchen
3. 將生成的圖標放入 `android/app/src/main/res/mipmap-*/ic_launcher.png`

---

### 4. 編譯 Release APK/AAB

#### 方法一：Android Studio（推薦）

```
步驟：
1. 開啟 Android Studio
2. File → Open → 選擇 android 資料夾
3. 等待 Gradle 同步完成
4. Build → Generate Signed Bundle / APK
5. 選擇 APK 或 AAB
   - APK: 用於直接安裝
   - AAB: 用於 Google Play 發布（推薦）
6. 配置簽名密鑰（或建立新密鑰）
7. 選擇 release build variant
8. 點擊 Finish
```

#### 方法二：命令行

```bash
cd android
./gradlew assembleRelease
# 輸出：app/build/outputs/apk/release/app-release.apk
```

---

### 5. 應用程式簽署

Google Play 要求所有上架應用程式必須簽署。

#### 建立簽名密鑰

```bash
keytool -genkeypair -v -storetype PKCS12 \
  -keystore tetris-release.keystore \
  -alias tetris \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000
```

#### 配置簽名（在 `android/app/build.gradle`）

```groovy
android {
    signingConfigs {
        release {
            storeFile file("../tetris-release.keystore")
            storePassword "你的密碼"
            keyAlias "tetris"
            keyPassword "你的密碼"
        }
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled false
        }
    }
}
```

---

### 6. Google Play Console 設定

#### 開發者帳號
- 費用：$25（一次性）
- 網址：https://play.google.com/console
- 需要：Google 帳號 + 身份驗證

#### 建立應用程式
1. 點擊 **Create App**
2. 填寫：
   - 應用程式名稱：俄羅斯方塊
   - 語言：中文（繁體）
   - 類別：益智
3. 上傳 AAB 檔案
4. 填寫詳細資訊：
   - 描述
   - 螢幕截圖
   - 宣傳圖
   - 隱私權政策

---

## 📱 應用程式資訊模板

### 基本資訊
```
應用程式名稱：俄羅斯方塊
短標題：經典益智遊戲
描述：
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
  • 或使用螢幕按鈕操作

  經典遊戲，永不過時！
```

### 分類
- 主要分類：益智
- 次要分類：單人遊戲

### 內容分級
- 年齡層：Everyone（全齡適用）
- 內容描述：無敏感內容

---

## 🔒 隱私權政策

Google Play 要求提供隱私權政策網址。

### 簡單隱私權政策範本

```markdown
# 隱私權政策

本應用程式不會收集任何個人數據。

## 數據收集
- 本應用程式不收集、不儲存、不傳輸任何個人數據
- 所有遊戲數據僅存在於裝置本地
- 不需要網路連線

## 聯繫方式
如有疑問，請聯絡：your@email.com

最後更新：2026年8月12日
```

將此文件託管在網站上，並提供 URL 給 Google Play。

---

## 📸 截圖準備

Google Play 要求：
- 至少 2 張手機截圖
- 建議提供 4-8 張
- 尺寸：1080x1920 或 1440x2960

### 截圖內容建議
1. 遊戲主畫面
2. 遊戲進行中
3. 得分畫面
4. 遊戲結束畫面

---

## 🚀 發布流程

### Step 1: 內部測試（可選）
```
Google Play Console → 測試 → 內部測試
上傳 AAB → 添加測試人員 → 發布
```

### Step 2: 封測（可選）
```
Google Play Console → 測試 → 封測
需要至少 20 名測試人員測試 14 天
```

### Step 3: 開放測試（可選）
```
Google Play Console → 測試 → 開放測試
任何人可參與測試
```

### Step 4: 正式發布
```
Google Play Console → 發布 → 生產版本
上傳 AAB → 填寫發布資訊 → 審核 → 上架
```

---

## ⏱️ 預計時間

| 步驟 | 時間 |
|------|------|
| 環境安裝 | 30-60 分鐘 |
| 編譯測試 | 10-20 分鐘 |
| 圖標/截圖準備 | 30-60 分鐘 |
| Google Play 設定 | 20-30 分鐘 |
| 審核時間 | 1-7 天 |
| **總計** | **約 2-4 小時** |

---

## 💡 常見問題

### Q: 為什麼要用 AAB 而不是 APK？
A: AAB (Android App Bundle) 是 Google Play 推薦格式，可減少下載大小 15-25%。Google Play 會根據用戶裝置自動生成最佳化的 APK。

### Q: 簽名密鑰遗失怎麼辦？
A: 非常危險！請妥善保管。如果遺失，無法更新應用程式，需要建立新的 appId 重新上架。

### Q: 如何更新應用程式？
A: 修改程式碼 → 重新編譯 → 提高 versionCode → 上傳新版本 → 發布更新。

### Q: 審核需要多久？
A: 通常 1-3 天，高峰期間可能需 7 天。首次上架可能較慢。

### Q: 可以免費上架嗎？
A: 需要支付 $25 一次性開發者註冊費。

---

## 📞 需要的協助

如果您需要協助：
1. **安裝 Java/Android Studio** - 可remote協助
2. **設定簽名密鑰** - 提供詳細步驟
3. **準備截圖** - 可使用截圖工具
4. **撰寫隱私權政策** - 提供模板

請隨時詢問！