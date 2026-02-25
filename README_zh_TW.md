<p align="center">
  <a href="https://librechat.ai">
    <img src="client/public/assets/logo.svg" height="256">
  </a>
  <h1 align="center">
    <a href="https://librechat.ai">LibreChat</a>
  </h1>
</p>

<p align="center">
  <a href="https://discord.librechat.ai"> 
    <img
      src="https://img.shields.io/discord/1086345563026489514?label=&logo=discord&style=for-the-badge&logoWidth=20&logoColor=white&labelColor=000000&color=blueviolet">
  </a>
  <a href="https://www.youtube.com/@LibreChat"> 
    <img
      src="https://img.shields.io/badge/YOUTUBE-red.svg?style=for-the-badge&logo=youtube&logoColor=white&labelColor=000000&logoWidth=20">
  </a>
  <a href="https://docs.librechat.ai"> 
    <img
      src="https://img.shields.io/badge/DOCS-blue.svg?style=for-the-badge&logo=read-the-docs&logoColor=white&labelColor=000000&logoWidth=20">
  </a>
  <a aria-label="Sponsors" href="https://github.com/sponsors/danny-avila">
    <img
      src="https://img.shields.io/badge/SPONSORS-brightgreen.svg?style=for-the-badge&logo=github-sponsors&logoColor=white&labelColor=000000&logoWidth=20">
  </a>
</p>

<p align="center">
<a href="https://railway.app/template/b5k2mn?referralCode=HI9hWz">
  <img src="https://railway.app/button.svg" alt="Deploy on Railway" height="30">
</a>
<a href="https://zeabur.com/templates/0X2ZY8">
  <img src="https://zeabur.com/button.svg" alt="Deploy on Zeabur" height="30"/>
</a>
<a href="https://template.cloud.sealos.io/deploy?templateName=librechat">
  <img src="https://raw.githubusercontent.com/labring-actions/templates/main/Deploy-on-Sealos.svg" alt="Deploy on Sealos" height="30">
</a>
</p>

<p align="center">
  <a href="https://www.librechat.ai/docs/translation">
    <img 
      src="https://img.shields.io/badge/dynamic/json.svg?style=for-the-badge&color=2096F3&label=locize&query=%24.translatedPercentage&url=https://api.locize.app/badgedata/4cb2598b-ed4d-469c-9b04-2ed531a8cb45&suffix=%+translated" 
      alt="翻譯進度">
  </a>
</p>


# ✨ 特色功能

- 🖥️ **UI 與體驗**：靈感源自 ChatGPT，並具備增強的設計與功能。

- 🤖 **AI 模型選擇**：
  - Anthropic (Claude), AWS Bedrock, OpenAI, Azure OpenAI, Google, Vertex AI, OpenAI Responses API (包含 Azure)
  - [自定義端點 (Custom Endpoints)](https://www.librechat.ai/docs/quick_start/custom_endpoints)：在 LibreChat 中使用任何與 OpenAI 相容的 API，無需代理伺服器。
  - 相容於 [本地與遠端 AI 提供商](https://www.librechat.ai/docs/configuration/librechat_yaml/ai_endpoints)：
    - Ollama, groq, Cohere, Mistral AI, Apple MLX, koboldcpp, together.ai,
    - OpenRouter, Helicone, Perplexity, ShuttleAI, Deepseek, Qwen 等。

- 🔧 **[代碼解釋器 (Code Interpreter) API](https://www.librechat.ai/docs/features/code_interpreter)**：
  - 在 Python, Node.js (JS/TS), Go, C/C++, Java, PHP, Rust, 與 Fortran 中進行安全、沙盒化的執行。
  - 無縫檔案處理：直接上傳、處理並下載檔案。
  - 無隱私疑慮：完全隔離且安全的執行環境。

- 🔦 **智慧體 (Agents) 與工具整合**：
  - **[LibreChat Agents](https://www.librechat.ai/docs/features/agents)**：
    - 無代碼自定義助手：構建專門的 AI 驅動助手。
    - 智慧體市場：探索並部署社群構建的智慧體。
    - 協作共享：與特定用戶和群組共享智慧體。
    - 靈活且可擴展：使用 MCP 伺服器、工具、檔案搜索、代碼執行等。
    - 相容於自定義端點、OpenAI、Azure、Anthropic、AWS Bedrock、Google、Vertex AI、Responses API 等。
    - 工具支援 [模型上下文協議 (MCP)](https://modelcontextprotocol.io/clients#librechat)。

- 🔍 **網路搜索**：
  - 搜索互聯網並檢索相關資訊以增強您的 AI 上下文。
  - 結合搜索提供商、內容抓取器和結果重排序器以獲得最佳結果。
  - **可自定義的 Jina 重排序 (Reranking)**：為重排序服務配置自定義 Jina API URL。
  - **[了解更多 →](https://www.librechat.ai/docs/features/web_search)**

- 🪄 **具備代碼組件 (Artifacts) 的生成式 UI**：
  - [Code Artifacts](https://youtu.be/GfTj7O4gmd0?si=WJbdnemZpJzBrJo3) 允許直接在聊天中創建 React、HTML 和 Mermaid 圖表。

- 🎨 **圖像生成與編輯**
  - 使用 [GPT-Image-1](https://www.librechat.ai/docs/features/image_gen#1--openai-image-tools-recommended) 進行文生圖和圖生圖。
  - 使用 [DALL-E (3/2)](https://www.librechat.ai/docs/features/image_gen#2--dalle-legacy)、[Stable Diffusion](https://www.librechat.ai/docs/features/image_gen#3--stable-diffusion-local)、[Flux](https://www.librechat.ai/docs/features/image_gen#4--flux) 或任何 [MCP 伺服器](https://www.librechat.ai/docs/features/image_gen#5--model-context-protocol-mcp) 進行文生圖。
  - 從提示詞生成精美的視覺效果，或透過單一指令改進現有圖像。

- 💾 **預設 (Presets) 與上下文管理**：
  - 創建、儲存並共享自定義預設。
  - 在聊天過程中切換 AI 端點和預設。
  - 透過對話分支編輯、重新提交並繼續訊息。
  - 與特定用戶和群組創建並共享提示詞 (Prompts)。
  - [分支訊息與對話 (Fork Messages & Conversations)](https://www.librechat.ai/docs/features/fork) 以實現進階上下文控制。

- 💬 **多模態與檔案互動**：
  - 使用 Claude 3, GPT-4.5, GPT-4o, o1, Llama-Vision, 和 Gemini 上傳並分析圖像 📸
  - 使用自定義端點、OpenAI、Azure, Anthropic, AWS Bedrock, 和 Google 與檔案聊天 🗃️

- 🌎 **多語言 UI**：
  - 英文、中文 (簡體)、中文 (繁體)、阿拉伯文、德文、西班牙文、法文、義大利文
  - 波蘭文、葡萄牙文 (PT)、葡萄牙文 (BR)、俄文、日文、瑞典文、韓文、越南文
  - 土耳其文、荷蘭文、希伯來文、加泰隆尼亞文、捷克文、丹麥文、愛沙尼亞文、波斯文
  - 芬蘭文、匈牙利文、亞美尼亞文、印尼文、喬治亞文、拉脫維亞文、泰文、維吾爾文

- 🧠 **推理 UI**：
  - 為 DeepSeek-R1 等思維鏈 (Chain-of-Thought)/推理 AI 模型提供動態推理 UI。

- 🎨 **可自定義介面**：
  - 可自定義的下拉選單與介面，適應進階用戶和新手。

- 🌊 **[可恢復串流 (Resumable Streams)](https://www.librechat.ai/docs/features/resumable_streams)**：
  - 永不遺失回應：如果連線中斷，AI 回應會自動重新連線並恢復。
  - 多分頁與多裝置同步：在多個分頁中開啟同一個聊天，或在另一個裝置上繼續。
  - 生產環境就緒：適用於從單伺服器設置到使用 Redis 的水平擴展部署。

- 🗣️ **語音與音訊**：
  - 透過語音轉文字和文字轉語音進行免持聊天。
  - 自動發送並播放音訊。
  - 支援 OpenAI, Azure OpenAI, 和 Elevenlabs。

- 📥 **匯入與匯出對話**：
  - 從 LibreChat, ChatGPT, Chatbot UI 匯入對話。
  - 將對話匯出為截圖、Markdown、文字、JSON。

- 🔍 **搜索與發現**：
  - 搜索所有訊息/對話。

- 👥 **多用戶與安全存取**：
  - 支援 OAuth2, LDAP, 與電子郵件登入的多用戶安全身份驗證。
  - 內建審核機制與 Token 消耗工具。

- ⚙️ **配置與部署**：
  - 配置代理、反向代理、Docker 以及多種部署選項。
  - 使用完全本地部署或部署在雲端。

- 📖 **開源與社群**：
  - 完全開源並在公開環境中構建。
  - 社群驅動的開發、支援與反饋。

[如需深入了解我們的功能，請參閱此處的文件](https://docs.librechat.ai/) 📚

## 🪶 使用 LibreChat 進行全方位 AI 對話

LibreChat 是一個自託管的 AI 聊天平台，將所有主要的 AI 提供商整合到單一的、以隱私為中心的介面中。

除了聊天，LibreChat 還提供 AI 智慧體、模型上下文協議 (MCP) 支援、Artifacts、代碼解釋器、自定義動作、對話搜索以及企業級多用戶身份驗證。

開源、積極開發，專為任何重視 AI 基礎設施控制權的人打造。

---

## 🌐 資源

**GitHub 倉庫：**
  - **RAG API:** [github.com/danny-avila/rag_api](https://github.com/danny-avila/rag_api)
  - **網站:** [github.com/LibreChat-AI/librechat.ai](https://github.com/LibreChat-AI/librechat.ai)

**其他：**
  - **網站:** [librechat.ai](https://librechat.ai)
  - **文件:** [librechat.ai/docs](https://librechat.ai/docs)
  - **部落格:** [librechat.ai/blog](https://librechat.ai/blog)

---

## 📝 更新日誌 (Changelog)

造訪發佈頁面與說明以獲取最新更新：
- [Releases](https://github.com/danny-avila/LibreChat/releases)
- [Changelog](https://www.librechat.ai/changelog) 

**⚠️ 在更新前，請先查閱 [更新日誌](https://www.librechat.ai/changelog) 以瞭解重大變更 (Breaking Changes)。**

---

## ⭐ Star 歷史

<p align="center">
  <a href="https://star-history.com/#danny-avila/LibreChat&Date">
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=danny-avila/LibreChat&type=Date&theme=dark" onerror="this.src='https://api.star-history.com/svg?repos=danny-avila/LibreChat&type=Date'" />
  </a>
</p>
<p align="center">
  <a href="https://trendshift.io/repositories/4685" target="_blank" style="padding: 10px;">
    <img src="https://trendshift.io/api/badge/repositories/4685" alt="danny-avila%2FLibreChat | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/>
  </a>
  <a href="https://runacap.com/ross-index/q1-24/" target="_blank" rel="noopener" style="margin-left: 20px;">
    <img style="width: 260px; height: 56px" src="https://runacap.com/wp-content/uploads/2024/04/ROSS_badge_white_Q1_2024.svg" alt="ROSS Index - Fastest Growing Open-Source Startups in Q1 2024 | Runa Capital" width="260" height="56"/>
  </a>
</p>

---

## ✨ 貢獻

歡迎任何貢獻、建議、錯誤回報與修復！

對於新功能、組件或擴展，請在發送 PR 之前開啟 Issue 並進行討論。

如果您想幫助將 LibreChat 翻譯成您的語言，我們非常歡迎您的貢獻！改進我們的翻譯不僅能讓世界各地的用戶更容易使用 LibreChat，還能提升整體用戶體驗。請查看我們的 [翻譯指南](https://www.librechat.ai/docs/translation)。

---

## 💖 本專案目前的成就歸功於所有貢獻者

<a href="https://github.com/danny-avila/LibreChat/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=danny-avila/LibreChat" />
</a>

---

## 🎉 特別鳴謝

我們感謝 [Locize](https://locize.com) 提供翻譯管理工具，支援 LibreChat 的多種語言。

<p align="center">
  <a href="https://locize.com" target="_blank" rel="noopener noreferrer">
    <img src="https://github.com/user-attachments/assets/d6b70894-6064-475e-bb65-92a9e23e0077" alt="Locize Logo" height="50">
  </a>
</p>
