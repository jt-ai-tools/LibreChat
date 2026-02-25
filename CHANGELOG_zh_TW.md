# 更新日誌 (Changelog)

本專案的所有重要變更都將記錄在此檔案中。

## [未發佈 (Unreleased)]

### ✨ 新功能

- ✨ feat: 由 **@mawburn** 在 [#7151](https://github.com/danny-avila/LibreChat/pull/7151) 實作搜索參數更新
- 🎏 feat: 由 **@benverhees** 在 [#7353](https://github.com/danny-avila/LibreChat/pull/7353) 為 Streamable HTTP 傳輸新增 MCP 支援
- 🔒 feat: 由 **@rubentalstra** 在 [#7377](https://github.com/danny-avila/LibreChat/pull/7377) 使用 Helmet 中間件新增內容安全策略 (CSP)
- ✨ feat: 由 **@danny-avila** 在 [#7421](https://github.com/danny-avila/LibreChat/pull/7421) 為 MCP 伺服器名稱新增規範化
- 📊 feat: 由 **@hofq** 在 [#3638](https://github.com/danny-avila/LibreChat/pull/3638) 改進 Helm Chart
- 🦾 feat: 由 **@danny-avila** 在 [#7509](https://github.com/danny-avila/LibreChat/pull/7509) 支援 Claude-4
- 🪨 feat: 由 **@danny-avila** 在 [#7517](https://github.com/danny-avila/LibreChat/pull/7517) 為 Claude-4 推理提供 Bedrock 支援

### 🌍 國際化 (Internationalization)

- 🌍 i18n: 由 **@rubentalstra** 在 [#7373](https://github.com/danny-avila/LibreChat/pull/7373) 新增 `丹麥語`、`捷克語` 與 `加泰隆尼亞語` 本地化支援
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#7375](https://github.com/danny-avila/LibreChat/pull/7375) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#7468](https://github.com/danny-avila/LibreChat/pull/7468) 更新最新的 translation.json 翻譯

### 🔧 修復

- 💬 fix: 由 **@berry-13** 在 [#7320](https://github.com/danny-avila/LibreChat/pull/7320) 更新 ConvoLink 組件的 aria-label 以增進無障礙性
- 🔑 fix: 由 **@danny-avila** 在 [#7337](https://github.com/danny-avila/LibreChat/pull/7337) 於類 OpenAI 配置中使用 `apiKey` 代替 `openAIApiKey`
- 🔄 fix: 由 **@mawburn** 在 [#7340](https://github.com/danny-avila/LibreChat/pull/7340) 更新 `useFocusChatEffect` 的導航邏輯以確保使用正確的搜索參數
- 🔄 fix: 由 **@danny-avila** 在 [#7400](https://github.com/danny-avila/LibreChat/pull/7400) 改進 MCP 連線清理
- 🛡️ fix: 由 **@danny-avila** 在 [#7407](https://github.com/danny-avila/LibreChat/pull/7407) 為 URL 查詢參數新增預設與驗證邏輯
- 🌘 fix: 由 **@nhtruong** 在 [#7405](https://github.com/danny-avila/LibreChat/pull/7405) 修復預覽文本在深色模式下難以辨識的問題
- 🛡️ fix: 由 **@danny-avila** 在 [#7419](https://github.com/danny-avila/LibreChat/pull/7419) 暫時移除 CSP 直到可配置為止
- 💽 fix: 由 **@sbruel** 在 [#7382](https://github.com/danny-avila/LibreChat/pull/7382) 將首頁 `/` 從靜態快取設置中排除

### ⚙️ 其他變更

- 📜 docs: 由 **@github-actions[bot]** 在 [#7290](https://github.com/danny-avila/LibreChat/pull/7290) 為 v0.7.8 版本更新更新日誌
- 📦 chore: 由 **@danny-avila** 在 [#7359](https://github.com/danny-avila/LibreChat/pull/7359) 更新 API 套件依賴
- 📜 docs: 由 **@github-actions[bot]** 在 [#7321](https://github.com/danny-avila/LibreChat/pull/7321) 更新未發佈的更新日誌
- 📜 docs: 由 **@github-actions[bot]** 在 [#7434](https://github.com/danny-avila/LibreChat/pull/7434) 更新未發佈的更新日誌
- 🛡️ chore: 由 **@danny-avila** 在 [#7454](https://github.com/danny-avila/LibreChat/pull/7454) 更新 `multer` 至 v2.0.0 以修復 CVE-2025-47935 與 CVE-2025-47944
- 📂 refactor: 由 **@danny-avila** 在 [#7471](https://github.com/danny-avila/LibreChat/pull/7471) 改進 `FileAttachment` 與檔案表單刪除
- 📊 chore: 由 **@hofq** 在 [#7512](https://github.com/danny-avila/LibreChat/pull/7512) 移除舊的 Helm Chart
- 🪖 chore: 由 **@austin-barrington** 在 [#7524](https://github.com/danny-avila/LibreChat/pull/7524) 將 helm 應用程式版本提升至 v0.7.8



---
## [v0.7.8] - 

從 v0.7.8-rc1 到 v0.7.8 的變更。

### ✨ 新功能

- ✨ feat: 由 **@berry-13** 在 [#7198](https://github.com/danny-avila/LibreChat/pull/7198) 增強觸控螢幕的表單提交
- 🔍 feat: 由 **@glowforge-opensource** 在 [#7232](https://github.com/danny-avila/LibreChat/pull/7232) 新增額外的 Tavily API 工具參數
- 🐋 feat: 由 **@technicalpickles** 在 [#7270](https://github.com/danny-avila/LibreChat/pull/7270) 在 Dockerfile 中加入 Python 以增進 MCP 相容性

### 🔧 修復

- 🔧 fix: 由 **@danny-avila** 在 [#7196](https://github.com/danny-avila/LibreChat/pull/7196) 支援 Google Gemma 與 OpenAI 推理指令
- 🛠️ fix: 由 **@danny-avila** 在 [#7210](https://github.com/danny-avila/LibreChat/pull/7210) 修復對話導航狀態
- 🔄 fix: 由 **@danny-avila** 在 [#7245](https://github.com/danny-avila/LibreChat/pull/7245) 為系統訊息新增 o 系列模型的正則表達式
- 🔖 fix: 由 **@danny-avila** 在 [#7246](https://github.com/danny-avila/LibreChat/pull/7246) 為初始 MCP SSE 連線新增自定義 Header
- 🛡️ fix: 由 **@danny-avila** 在 [#7247](https://github.com/danny-avila/LibreChat/pull/7247) 為用戶 MCP 連線深拷貝 `MCPOptions`
- 🔄 fix: 由 **@danny-avila** 在 [#7257](https://github.com/danny-avila/LibreChat/pull/7257) 修復 URL 參數競爭條件與檔案草稿持久化
- 🔄 fix: 由 **@danny-avila** 在 [#7274](https://github.com/danny-avila/LibreChat/pull/7274) 修復 Assistants 端點與次要問題
- 🔄 fix: 由 **@danny-avila** 在 [#7275](https://github.com/danny-avila/LibreChat/pull/7275) 修復與工具配合時的 Ollama Think 標籤邊緣案例

### ⚙️ 其他變更

- 📜 docs: 由 **@github-actions[bot]** 在 [#7153](https://github.com/danny-avila/LibreChat/pull/7153) 更新 v0.7.8-rc1 的更新日誌
- 🔄 refactor: 由 **@danny-avila** 在 [#7181](https://github.com/danny-avila/LibreChat/pull/7181) 管理 Artifact 的可見性
- 📦 chore: 由 **@danny-avila** 在 [#7183](https://github.com/danny-avila/LibreChat/pull/7183) 提升套件安全性
- 🌿 refactor: 由 **@danny-avila** 在 [#7189](https://github.com/danny-avila/LibreChat/pull/7189) 在隱藏時卸載 Fork 彈出視窗以提升效能
- 🧰 chore: 由 **@mawburn** 在 [#7186](https://github.com/danny-avila/LibreChat/pull/7186) 配置 ESLint 以強制執行 Prettier 格式化規則
- 🎨 style: 由 **@andresgit** 在 [#7223](https://github.com/danny-avila/LibreChat/pull/7223) 改進 LaTeX 方程式的 KaTeX 渲染
- 📝 docs: 由 **@marlonka** 在 [#7254](https://github.com/danny-avila/LibreChat/pull/7254) 更新 `.env.example` 中的 Google 模型
- 💬 refactor: 由 **@danny-avila** 在 [#7286](https://github.com/danny-avila/LibreChat/pull/7286) 更新 MCP 聊天可見性選項、Google 速率、移除 OpenAPI 插件
- 📜 docs: 由 **@github-actions[bot]** 在 [#7214](https://github.com/danny-avila/LibreChat/pull/7214) 更新未發佈的更新日誌



[查看完整的版本詳細資訊][release-v0.7.8]

[release-v0.7.8]: https://github.com/danny-avila/LibreChat/releases/tag/v0.7.8

---
## [v0.7.8-rc1] - 

從 v0.7.7 到 v0.7.8-rc1 的變更。

### ✨ 新功能

- 🔍 feat: 由 **@danny-avila** 在 [#6274](https://github.com/danny-avila/LibreChat/pull/6274) 支援 Mistral OCR API / 將檔案作為文本上傳
- 🤖 feat: 由 **@danny-avila** 在 [#6313](https://github.com/danny-avila/LibreChat/pull/6313) 支援 OpenAI Web Search 模型
- 🔗 feat: 由 **@danny-avila** 在 [#6374](https://github.com/danny-avila/LibreChat/pull/6374) 支援 Agent Chain (智慧體混合模型)
- ⌛ feat: 由 **@perweij** 在 [#6383](https://github.com/danny-avila/LibreChat/pull/6383) 為啟動緩慢的 MCP 伺服器提供 `initTimeout`
- 🚀 feat: 由 **@rubentalstra** 在 [#6142](https://github.com/danny-avila/LibreChat/pull/6142) 為檔案處理與圖像上傳整合 `S3`
- 🔒feat: 由 **@leondape** 在 [#6066](https://github.com/danny-avila/LibreChat/pull/6066) 啟用 OpenID 自動重新導向
- 🚀 feat: 由 **@rubentalstra** 在 [#6153](https://github.com/danny-avila/LibreChat/pull/6153) 為檔案處理與圖像上傳整合 `Azure Blob Storage`
- 🚀 feat: 由 **@rubentalstra** 在 [#6431](https://github.com/danny-avila/LibreChat/pull/6431) 支援在 `S3` 中使用自定義 `AWS` 端點
- 🚀 feat: 由 **@rubentalstra** 在 [#6438](https://github.com/danny-avila/LibreChat/pull/6438) 在 LDAP 身份驗證中支援 LDAP STARTTLS
- 🚀 feat: 由 **@rubentalstra** 在 [#6455](https://github.com/danny-avila/LibreChat/pull/6455) 重構 Schema 匯出並更新套件版本至 0.0.4
- 🔼 feat: 由 **@mjaverto** 在 [#6440](https://github.com/danny-avila/LibreChat/pull/6440) 為 URL 查詢參數新增自動提交
- 🛠 feat: 由 **@danny-avila** 在 [#6462](https://github.com/danny-avila/LibreChat/pull/6462) 增強 Redis 整合、速率限制器與日誌標題
- 💵 feat: 由 **@rubentalstra** 在 [#6452](https://github.com/danny-avila/LibreChat/pull/6452) 新增餘額自動充值
- 🗣️ feat: 由 **@berry-13** 在 [#6483](https://github.com/danny-avila/LibreChat/pull/6483) 支援 gpt-4o-transcribe 模型
- 🎨 feat: 由 **@berry-13** 在 [#6346](https://github.com/danny-avila/LibreChat/pull/6346) 重新整理 UI 以提升使用者體驗
- 🌍 feat: 由 **@rubentalstra** 在 [#6508](https://github.com/danny-avila/LibreChat/pull/6508) 新增匈牙利語本地化支援
- 🚀 feat: 由 **@danny-avila** 在 [#6563](https://github.com/danny-avila/LibreChat/pull/6563) 新增 Gemini 2.5 Token/上下文數值，將最大輸出提升至 64k
- 🚀 feat: 由 **@danny-avila** 在 [#6610](https://github.com/danny-avila/LibreChat/pull/6610) 增強 MCP 連線以支援多用戶
- 🚀 feat: 由 **@danny-avila** 在 [#6647](https://github.com/danny-avila/LibreChat/pull/6647) 增強 S3 URL 到期重新整理；fix: S3 檔案刪除
- 🚀 feat: 由 **@berry-13** 在 [#6625](https://github.com/danny-avila/LibreChat/pull/6625) 增強 UI 組件並重構設置
- 💬 feat: 由 **@berry-13** 在 [#6646](https://github.com/danny-avila/LibreChat/pull/6646) 將 TemporaryChat 移動至標題列
- 🚀 feat: 由 **@danny-avila** 在 [#6650](https://github.com/danny-avila/LibreChat/pull/6650) 使用模型規格 + 特定端點，限制 Agent 的提供商
- 🪙 feat: 由 **@danny-avila** 在 [#6671](https://github.com/danny-avila/LibreChat/pull/6671) 在登入時同步餘額配置
- 🔦 feat: 由 **@danny-avila** 在 [#6775](https://github.com/danny-avila/LibreChat/pull/6775) 為非 Agent 端點提供 MCP 支援
- 🗃️ feat: 由 **@danny-avila** 在 [#6790](https://github.com/danny-avila/LibreChat/pull/6790) 代碼解釋器在不同會話間的檔案持久化
- 🖥️ feat: 由 **@danny-avila** 在 [#6803](https://github.com/danny-avila/LibreChat/pull/6803) 為非 Agent 端點提供代碼解釋器 API
- ⚡ feat: 由 **@danny-avila** 在 [#6827](https://github.com/danny-avila/LibreChat/pull/6827) 自託管 Artifact 的靜態 Bundler URL
- 🐳 feat: 由 **@danny-avila** 在 [#6836](https://github.com/danny-avila/LibreChat/pull/6836) 在 Docker 構建中加入 Jemalloc 與 UV
- 🤖 feat: 由 **@danny-avila** 在 [#6880](https://github.com/danny-avila/LibreChat/pull/6880) 支援 GPT-4.1
- 👋 feat: 由 **@berry-13** 在 [#6885](https://github.com/danny-avila/LibreChat/pull/6885) 移除 Edge TTS
- feat: 由 **@berry-13** 在 [#5785](https://github.com/danny-avila/LibreChat/pull/5785) 最佳化導航
- 🗺️ feat: 由 **@peeeteeer** 在 [#6858](https://github.com/danny-avila/LibreChat/pull/6858) 為 OpenAPI 動作新增參數位置映射
- 🤖 feat: 由 **@danny-avila** 在 [#6928](https://github.com/danny-avila/LibreChat/pull/6928) 支援 `o4-mini` 與 `o3` 模型
- 🎨 feat: 由 **@danny-avila** 在 [#7079](https://github.com/danny-avila/LibreChat/pull/7079) 支援 OpenAI 圖像工具 (GPT-Image-1)
- 🗓️ feat: 由 **@danny-avila** 在 [#7123](https://github.com/danny-avila/LibreChat/pull/7123) 為提示詞與 Agent 新增特殊變數，提示詞 UI 改進

### 🌍 國際化 (Internationalization)

- 🌍 i18n: 由 **@rubentalstra** 在 [#6219](https://github.com/danny-avila/LibreChat/pull/6219) 新增泰語支援並更新翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6220](https://github.com/danny-avila/LibreChat/pull/6220) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6240](https://github.com/danny-avila/LibreChat/pull/6240) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6241](https://github.com/danny-avila/LibreChat/pull/6241) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6277](https://github.com/danny-avila/LibreChat/pull/6277) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6414](https://github.com/danny-avila/LibreChat/pull/6414) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6505](https://github.com/danny-avila/LibreChat/pull/6505) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6530](https://github.com/danny-avila/LibreChat/pull/6530) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@rubentalstra** 在 [#6669](https://github.com/danny-avila/LibreChat/pull/6669) 新增波斯語本地化支援
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#6667](https://github.com/danny-avila/LibreChat/pull/6667) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#7126](https://github.com/danny-avila/LibreChat/pull/7126) 更新最新的 translation.json 翻譯
- 🌍 i18n: 由 **@github-actions[bot]** 在 [#7148](https://github.com/danny-avila/LibreChat/pull/7148) 更新最新的 translation.json 翻譯

### 👐 無障礙設計 (Accessibility)

- 🎨 a11y: 由 **@berry-13** 在 [#6294](https://github.com/danny-avila/LibreChat/pull/6294) 更新模型規格描述文本
- 🗑️ a11y: 由 **@kangabell** 在 [#6709](https://github.com/danny-avila/LibreChat/pull/6709) 為移除檔案附件按鈕新增 Accessible Name
- ⌨️ a11y: 由 **@berry-13** 在 [#6866](https://github.com/danny-avila/LibreChat/pull/6866) 增強無障礙性與視覺一致性
- 🙌 a11y: 由 **@danny-avila** 在 [#7096](https://github.com/danny-avila/LibreChat/pull/7096) 搜索欄/對話列表焦點處理
- 👐 a11y: 由 **@danny-avila** 在 [#7147](https://github.com/danny-avila/LibreChat/pull/7147) 改進 Fork 與 SplitText 的無障礙性

### 🔧 修復

- 🐛 fix: 由 **@danny-avila** 在 [#6235](https://github.com/danny-avila/LibreChat/pull/6235) Agent/Assistant Schema 中的 Avatar 類型定義
- 🔧 fix: 由 **@rubentalstra** 在 [#6245](https://github.com/danny-avila/LibreChat/pull/6245) 修復 MeiliSearch 欄位錯誤並補救來自 #6210 的錯誤導入
- 🔏 fix: 由 **@rubentalstra** 在 [#6247](https://github.com/danny-avila/LibreChat/pull/6247) 增強雙因素身份驗證
- 🐛 fix: 由 **@sh4shii** 在 [#6248](https://github.com/danny-avila/LibreChat/pull/6248) 在 abortMiddleware 中 await saveMessage 以確保正確執行
- 🔧 fix: 由 **@danny-avila** 在 [#6298](https://github.com/danny-avila/LibreChat/pull/6298) 修復 Axios Proxy 使用並提升 `mongoose` 版本
- 🔧 fix: 由 **@KunalScriptz** 在 [#6316](https://github.com/danny-avila/LibreChat/pull/6316) 註釋掉 MCP 伺服器以解決服務運行問題
- 🔧 fix: 由 **@danny-avila** 在 [#6406](https://github.com/danny-avila/LibreChat/pull/6406) 更新 Token 計算與映射，MCP `env` 初始化
- 🐞 fix: 由 **@danny-avila** 在 [#6408](https://github.com/danny-avila/LibreChat/pull/6408) Agent "重新發送" 訊息附件 + 來源圖示樣式
- 🐛 fix: 由 **@Odrec** 在 [#6392](https://github.com/danny-avila/LibreChat/pull/6392) 防止重複訊息 ID 導致崩潰
- 🔐 fix: 由 **@rubentalstra** 在 [#6432](https://github.com/danny-avila/LibreChat/pull/6432) 雙因素身份驗證加密中的無效金鑰長度
- 🏗️ fix: 由 **@danny-avila** 在 [#6480](https://github.com/danny-avila/LibreChat/pull/6480) 修復 Agent Token 消耗競爭條件，擴大測試覆蓋範圍
- 🔃 fix: 由 **@danny-avila** 在 [#6501](https://github.com/danny-avila/LibreChat/pull/6501) 清除草稿、Claude 標題、移除預設 Vision 最大 Token
- 🔧 fix: 由 **@rubentalstra** 在 [#6534](https://github.com/danny-avila/LibreChat/pull/6534) 在問候語顯示中更新用戶名引用以使用 user.name
- 🔧 fix: 由 **@danny-avila** 在 [#6557](https://github.com/danny-avila/LibreChat/pull/6557) 修復具備金鑰提取的 S3 下載串流與 Vision 的 Blob Storage 編碼
- 🔧 fix: 由 **@danny-avila** 在 [#6562](https://github.com/danny-avila/LibreChat/pull/6562) Mistral `usage` 的類型嚴謹性並更新 Token 數值/窗口
- 🔧 fix: 由 **@danny-avila** 在 [#6582](https://github.com/danny-avila/LibreChat/pull/6582) 整合文本解析與 TTS Edge 初始化
- 🔧 fix: 由 **@danny-avila** 在 [#6619](https://github.com/danny-avila/LibreChat/pull/6619) 確保來自 Blob Storage 的 base64 編碼在圖像處理中持續進行
- ✉️ fix: 由 **@danny-avila** 在 [#6620](https://github.com/danny-avila/LibreChat/pull/6620) 電子郵件範本中的用戶名回退處理
- 🔧 fix: 由 **@rubentalstra** 在 [#6575](https://github.com/danny-avila/LibreChat/pull/6575) Azure Blob 整合與檔案來源引用
- 🐛 fix: 由 **@wipash** 在 [#6654](https://github.com/danny-avila/LibreChat/pull/6654) 防止 addedEndpoints 為 undefined
- 🤖 fix: 由 **@danny-avila** 在 [#6663](https://github.com/danny-avila/LibreChat/pull/6663) Gemini 2.5 Vision 支援
- 🔄 fix: 由 **@danny-avila** 在 [#6687](https://github.com/danny-avila/LibreChat/pull/6687) 增強 Avatar 與錯誤處理
- 🔧 fix: 由 **@danny-avila** 在 [#6720](https://github.com/danny-avila/LibreChat/pull/6720) 聊天中間件、Zod 轉換、自動儲存與 S3 URL 重新整理
- 🔧 fix: 由 **@danny-avila** 在 [#6726](https://github.com/danny-avila/LibreChat/pull/6726) Agent 能力檢查與移除 Agent 資源時的 DocumentDB 相容性
- 🔄 fix: 由 **@berry-13** 在 [#6707](https://github.com/danny-avila/LibreChat/pull/6707) 改進音訊 MIME 類型檢測與處理
- 🪺 fix: 由 **@danny-avila** 在 [#6774](https://github.com/danny-avila/LibreChat/pull/6774) 由於新 Schema 形狀更新角色處理
- 🗨️ fix: 由 **@berry-13** 在 [#6770](https://github.com/danny-avila/LibreChat/pull/6770) 顯示 ModelSpec 問候語
- 🔧 fix: 由 **@danny-avila** 在 [#6867](https://github.com/danny-avila/LibreChat/pull/6867) Keyv 與 Proxy 問題，以及更多的記憶體最佳化
- ✨ fix: 由 **@berry-13** 在 [#6833](https://github.com/danny-avila/LibreChat/pull/6833) 實作問候語與名稱顯示的動態文本大小
- 📝 fix: 由 **@danny-avila** 在 [#6901](https://github.com/danny-avila/LibreChat/pull/6901) Mistral OCR 圖像支援與 Azure Agent 標題
- 📢 fix: 由 **@berry-13** 在 [#6904](https://github.com/danny-avila/LibreChat/pull/6904) 無效的 `engineTTS` 與導航時的對話狀態
- 🛠️ fix: 由 **@danny-avila** 在 [#6913](https://github.com/danny-avila/LibreChat/pull/6913) 改進對話選單的無障礙性與顯示
- 🔧 fix: 由 **@danny-avila** 在 [#6925](https://github.com/danny-avila/LibreChat/pull/6925) Agent 資源表單、對話選單樣式，確保提交時清除草稿
- 🔀 fix: 由 **@danny-avila** 在 [#7040](https://github.com/danny-avila/LibreChat/pull/7040) MCP 改進、自動儲存草稿、Artifact 標記
- 🐋 fix: 由 **@danny-avila** 在 [#7132](https://github.com/danny-avila/LibreChat/pull/7132) 改進 Deepseek 相容性
- 🐙 fix: 由 **@peeeteeer** 在 [#7127](https://github.com/danny-avila/LibreChat/pull/7127) 新增 Redis Ping 間隔以防止連線中斷

### ⚙️ 其他變更

- 📦 refactor: 由 **@rubentalstra** 在 [#6210](https://github.com/danny-avila/LibreChat/pull/6210) 將資料庫模型移動至 `@librechat/data-schemas`
- 📦 chore: 由 **@danny-avila** 在 [#6222](https://github.com/danny-avila/LibreChat/pull/6222) 修補 `axios` 以應對 CVE-2025-27152
- ⚠️ refactor: 由 **@danny-avila** 在 [#6262](https://github.com/danny-avila/LibreChat/pull/6262) 為 Agent 使用 Error Content Part 而非拋出錯誤
- 🏃‍♂️ refactor: 由 **@danny-avila** 在 [#6448](https://github.com/danny-avila/LibreChat/pull/6448) 改進 Agent 執行上下文與雜項變更
- 📝 docs: 由 **@ineiti** 在 [#6442](https://github.com/danny-avila/LibreChat/pull/6442) 更新 librechat.example.yaml
- 🏃‍♂️ refactor: 由 **@danny-avila** 在 [#6477](https://github.com/danny-avila/LibreChat/pull/6477) 執行期間更多的 Agent 上下文改進
- 🔃 refactor: 由 **@danny-avila** 在 [#6509](https://github.com/danny-avila/LibreChat/pull/6509) 允許 `o1` 模型進行串流
- 🔧 chore: 由 **@rubentalstra** 在 [#6547](https://github.com/danny-avila/LibreChat/pull/6547) `Vite` 插件升級與配置最佳化
- 🔧 refactor: 由 **@danny-avila** 在 [#6553](https://github.com/danny-avila/LibreChat/pull/6553) 整合日誌、模型選擇與動作最佳化，次要修復
- 🎨 style: 由 **@berry-13** 在 [#6552](https://github.com/danny-avila/LibreChat/pull/6552) 處理 UI 重新整理的次要問題
- 🔧 refactor: 由 **@berry-13** 在 [#6578](https://github.com/danny-avila/LibreChat/pull/6578) 使用全球指標增強模型與端點配置 🌍
- 💬 style: 由 **@berry-13** 在 [#6612](https://github.com/danny-avila/LibreChat/pull/6612) 聊天 UI、問候語與訊息調整
- ⚡ refactor: 由 **@danny-avila** 在 [#6673](https://github.com/danny-avila/LibreChat/pull/6673) 餘額更新的 DocumentDB 相容性
- 🧹 chore: 由 **@rubentalstra** 在 [#6685](https://github.com/danny-avila/LibreChat/pull/6685) 更新 React hooks 的 ESLint 規則
- 🪙 chore: 由 **@RedwindA** 在 [#6731](https://github.com/danny-avila/LibreChat/pull/6731) 更新 Gemini 定價
- 🪺 refactor: 由 **@rubentalstra** 在 [#6487](https://github.com/danny-avila/LibreChat/pull/6487) 為角色嵌套權限欄位
- 📦 chore: 由 **@rubentalstra** 在 [#6482](https://github.com/danny-avila/LibreChat/pull/6482) 更新 `caniuse-lite` 依賴至 1.0.30001706 版本
- ⚙️ refactor: 由 **@danny-avila** 在 [#6752](https://github.com/danny-avila/LibreChat/pull/6752) OAuth 流程信號、類型安全、工具進度與更新套件
- 📦 chore: 由 **@dependabot[bot]** 在 [#6745](https://github.com/danny-avila/LibreChat/pull/6745) 將 vite 從 6.2.3 提升至 6.2.5
- 💾 chore: 由 **@danny-avila** 在 [#6809](https://github.com/danny-avila/LibreChat/pull/6809) 增強本地儲存處理並更新 MCP SDK
- 🤖 refactor: 由 **@danny-avila** 在 [#6850](https://github.com/danny-avila/LibreChat/pull/6850) 改進 Agent 記憶體使用、提升 Keyv、Grok 3
- 💾 refactor: 由 **@danny-avila** 在 [#6852](https://github.com/danny-avila/LibreChat/pull/6852) 增強圖像編碼記憶體與用戶端處置
- 🔁 refactor: 由 **@danny-avila** 在 [#6886](https://github.com/danny-avila/LibreChat/pull/6886) Token 事件處理並標準化 `maxTokens` 鍵名
- 🔍 refactor: 由 **@berry-13** 在 [#6903](https://github.com/danny-avila/LibreChat/pull/6903) 搜索與訊息檢索
- 🎨 style: 由 **@berry-13** 在 [#6939](https://github.com/danny-avila/LibreChat/pull/6939) 標準化下拉選單樣式並修復 z-Index 分層
- 📙 docs: 由 **@dblock** 在 [#6831](https://github.com/danny-avila/LibreChat/pull/6831) 更新 CONTRIBUTING.md
- 🧭 refactor: 由 **@danny-avila** 在 [#7094](https://github.com/danny-avila/LibreChat/pull/7094) 現代化導航欄/標題列
- 🪶 refactor: 由 **@danny-avila** 在 [#7100](https://github.com/danny-avila/LibreChat/pull/7100) 對話導航的聊天輸入焦點處理與 ChatForm 最佳化
- 🔃 refactor: 由 **@danny-avila** 在 [#7118](https://github.com/danny-avila/LibreChat/pull/7118) 精簡導航、訊息載入 UX
- 📜 docs: 由 **@github-actions[bot]** 在 [#6265](https://github.com/danny-avila/LibreChat/pull/6265) 更新未發佈的更新日誌



[查看完整的版本詳細資訊][release-v0.7.8-rc1]

[release-v0.7.8-rc1]: https://github.com/danny-avila/LibreChat/releases/tag/v0.7.8-rc1
