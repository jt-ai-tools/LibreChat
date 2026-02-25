# 貢獻指南 (Contributor Guidelines)

感謝所有幫助本專案成行的貢獻者！我們歡迎各種形式的貢獻，例如錯誤回報 (Bug reports)、文件改進 (Documentation improvements)、功能請求 (Feature requests) 以及代碼貢獻。

## 貢獻規範

如果您想貢獻的功能尚未獲得專案維護者的事先批准 (即該功能目前不在 [路線圖](https://github.com/users/danny-avila/projects/2) 上)，請在開始開發之前，先在討論區的 [功能請求與建議類別](https://github.com/danny-avila/LibreChat/discussions/new?category=feature-requests-suggestions) 提交請求。請求應包含具體的實作細節，包括受變更影響的應用程式區域 (如果適用，請包含設計圖)，以及任何其他可能有助於快速審查的相關資訊。然而，小規模變更、錯誤修復或文件改進則不需要提案。小規模變更和錯誤修復應關聯到一個 [Issue](https://github.com/danny-avila/LibreChat/issues)，並包含在相應的 Pull Request 中以便追蹤。

請注意，若 Pull Request 涉及未經專案維護者審查並批准的功能，可能會被拒絕。感謝您的理解與配合。

如果您想討論您希望進行的變更，請加入我們的 [Discord 社群](https://discord.librechat.ai)，您可以在那裡與其他貢獻者交流並尋求社群的指導。

## 我們的標準

我們努力在專案社群內維持一個積極且具包容性的環境。我們期望所有貢獻者遵守以下標準：

- 使用受歡迎且具包容性的語言。
- 尊重不同的觀點與經驗。
- 優雅地接受建設性的批評。
- 專注於對社群最有利的事情。
- 對其他社群成員展現同理心。

專案維護者有權利也有責任移除、編輯或拒絕不符合這些標準的評論、提交 (Commits)、代碼、Wiki 編輯、Issues 以及其他貢獻。

## 若要為本專案做出貢獻，請遵守以下準則：

## 1. 開發環境設置

1. 使用 Node.js v20.19.0+ 或 ^22.12.0 或 >= 23.0.0。
2. 執行 `npm run smart-reinstall` 安裝依賴 (使用 Turborepo)。使用 `npm run reinstall` 進行全新安裝，或使用 `npm ci` 進行基於 lockfile 的全新安裝。
3. 構建所有編譯代碼：`npm run build`。
4. 設置並執行單元測試：
    - 複製 `.env.test`：`cp api/test/.env.test.example api/test/.env.test`。
    - 執行後端單元測試：`npm run test:api`。
    - 執行前端單元測試：`npm run test:client`。
5. 設置並執行整合測試：
    - 創建 `.env`：`cp .env.example .env`。
    - 安裝 [MongoDB 社群版](https://www.mongodb.com/docs/manual/administration/install-community/)，確保 `mongosh` 能連接到您的本地實例。
    - 執行：`npx install playwright`，然後執行 `npx playwright install`。
    - 複製 `config.local`：`cp e2e/config.local.example.ts e2e/config.local.ts`。
    - 複製 `librechat.yaml`：`cp librechat.example.yaml librechat.yaml`。
    - 執行：`npm run e2e`。

## 2. 開發筆記

1. 在開始工作之前，確保您的 main 分支具備最新的提交：`npm run update`。
2. 執行 Lint 指令以查找錯誤：`npm run lint`。或者，確保 husky 的 pre-commit 檢查運作正常。
3. 在變更之後，使用 `npm run reinstall` 在當前分支重新安裝套件，並確保一切仍運作正常。
    - 在重新安裝或更新後，重新啟動 ESLint 伺服器 (在 VS Code 命令列中執行 "ESLint: Restart ESLint Server") 以及您的 IDE。
4. 在變更前後清除網頁應用的 localStorage 與 Cookie。
5. 若要檢查是否引入了錯誤，請構建所有編譯代碼：`npm run build`。
6. 執行後端單元測試：`npm run test:api`。
7. 執行前端單元測試：`npm run test:client`。
8. 執行整合測試：`npm run e2e`。

## 3. Git 工作流 (Git Workflow)

我們利用 GitFlow 工作流來管理本專案代碼庫的變更。貢獻代碼時請遵循以下一般步驟：

1. Fork 倉庫並創建一個具有描述性、以斜線命名的分支 (例如：`new/feature/x`)。
2. 實作您的變更並確保所有測試皆通過。
3. 使用帶有 GitFlow 標記的規範提交訊息來提交您的變更。提交訊息開頭應包含一個指示變更類型的標籤，例如 "feat" (新功能)、"fix" (錯誤修復)、"docs" (文件) 或 "refactor" (代碼重構)，後接變更的簡短摘要 (例如：`feat: Add new feature X to the project`)。
4. 提交 Pull Request，並對您的變更及其背後的原因進行清晰且簡要的說明。
5. 我們將審核您的 Pull Request，根據需要提供反饋，並最終將批准的變更合併到 main 分支。

## 4. 提交訊息格式 (Commit Message Format)

我們遵循提交訊息的 [語義化格式 (Semantic format)](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)。

### 範例

```
feat: add hat wobble
^--^  ^------------^
|     |
|     +-> 使用現在時態的摘要。
|
+-------> 類型：chore, docs, feat, fix, refactor, style, 或 test。
```

### 提交準則
- 盡力減少提交次數，並盡可能組織它們。瞭解 [合併提交 (Squashing commits)](https://www.freecodecamp.org/news/git-squash-commits/) 以保持整潔的歷史記錄。
- 對於那些在意透過提交次數累積統計數據的人，請遵守上述準則。因為我會對未組織及/或未格式化的提交歷史進行「合併並壓縮 (Squash and merge)」，這會將您的提交次數減少為 1 個：
```
* Update Br.tsx

* Update Es.tsx

* Update Br.tsx
```


## 5. Pull Request 流程

提交 Pull Request 時，請遵守以下準則：

- 確保在構建結束前移除任何安裝或構建依賴項。
- 更新 README.md，詳細說明介面的變更，包括新的環境變數、公開埠、有用的檔案位置以及容器參數。
- 增加任何範例檔案和 README.md 中的版本號，以反映該 Pull Request 代表的新版本。我們使用 [SemVer](http://semver.org/) 進行版本管理。

確保您的變更符合以下標準：

- 如 [上方](#2-開發筆記) 所述，所有測試皆通過。
- 代碼格式良好且符合我們的編碼標準。
- 提交歷史整潔且易於追蹤。在提交 Pull Request 之前，您可以使用 `git rebase` 或 `git merge --squash` 來清理您的提交歷史。
- Pull Request 描述清晰地概述了變更及其背後的原因。請務必包含測試該 Pull Request 的步驟。

## 6. 命名規範

對分支、標籤 (Labels) 和其他 Git 相關實體應用以下命名規範：

- **分支名稱：** 具描述性且以斜線命名 (例如：`new/feature/x`)。
- **標籤：** 具描述性且使用短橫線連接 (例如：`bug-fix`)。
- **JS/TS：** 目錄與檔案名稱：具描述性且使用 camelCase。React 檔案首字母大寫 (例如：`helperFunction.ts, ReactComponent.tsx`)。
- **文件：** 目錄與檔案名稱：具描述性且使用 snake_case (例如：`config_files.md`)。

## 7. 編碼標準

如需詳細的編碼慣例、工作區界限以及架構指導，請參閱專案根目錄下的 [`AGENTS_zh_TW.md`](../AGENTS_zh_TW.md) 檔案。它涵蓋了代碼風格、類型安全、導入順序、迭代/效能預期、前端規則、測試以及開發指令。

## 8. TypeScript 轉換

1. **原始狀態**：本專案最初完全使用 JavaScript (JS) 開發。

2. **前端**：已完全轉換為 TypeScript。

3. **後端**：
   - 遺留的 Express.js 伺服器仍以 JavaScript 形式保留在 `/api` 中。
   - 所有新的後端代碼皆在 `/packages/api` 下使用 TypeScript 編寫，該代碼經編譯後由 `/api` 消耗。
   - 共享的資料庫邏輯位於 `/packages/data-schemas` (TypeScript)。
   - 共享的前端/後端 API 類型與服務位於 `/packages/data-provider` (TypeScript)。
   - 盡量減少對 `/api` 的直接變更；優先將 TypeScript 代碼添加到 `/packages/api` 並進行導入。

## 9. 模組導入慣例 (Module Import Conventions)

導入分為三個部分 (依序)：

1. **套件導入 (Package imports)** —— 按行長度由短到長排序。
   - `react` 始終是第一個導入。
   - 多行 (堆疊式) 導入按其所有行的總字元長度進行排序。

2. **`import type` 導入** —— 按行長度由長到短排序。
   - 套件類型導入優先，隨後是本地類型導入。
   - 行長度排序在套件與本地子群組之間重置。

3. **本地/專案導入** —— 按行長度由長到短排序。
   - 多行 (堆疊式) 導入按其所有行的總字元長度進行排序。
   - 使用別名 `~` 的導入在行長度排序上與相對導入同等對待。

- 盡可能合併來自同一模組的值導入。
- 類型導入始終使用獨立的 `import type { ... }`；絕不在值導入中使用內聯 `type` 關鍵字 (例如：`import { Foo, type Bar }` 是錯誤的)。

**注意：** 當您執行 `npm run lint --fix` 或透過 pre-commit hook 時，ESLint 會自動強制執行這些導入慣例。

如需全套編碼標準，請參閱 [`AGENTS_zh_TW.md`](../AGENTS_zh_TW.md)。

---

## [回到讀我檔案](../README_zh_TW.md)
