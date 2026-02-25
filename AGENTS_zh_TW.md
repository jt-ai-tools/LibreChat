# LibreChat

## 專案概覽

LibreChat 是一個採用 Monorepo 結構的專案，包含以下關鍵工作區 (Workspaces)：

| 工作區 | 語言 | 端 | 依賴 | 用途 |
|---|---|---|---|---|
| `/api` | JS (遺留) | 後端 | `packages/api`, `packages/data-schemas`, `packages/data-provider`, `@librechat/agents` | Express 伺服器 —— 在此盡量減少變更 |
| `/packages/api` | **TypeScript** | 後端 | `packages/data-schemas`, `packages/data-provider` | 新的後端代碼存放處 (僅限 TS，由 `/api` 消耗) |
| `/packages/data-schemas` | TypeScript | 後端 | `packages/data-provider` | 資料庫模型/綱要 (Schemas)，可供後端專案共享 |
| `/packages/data-provider` | TypeScript | 共享 | — | 共享的 API 類型、端點、資料服務 —— 同時供前端與後端使用 |
| `/client` | TypeScript/React | 前端 | `packages/data-provider`, `packages/client` | 前端單頁面應用程式 (SPA) |
| `/packages/client` | TypeScript | 前端 | `packages/data-provider` | 共享的前端公用程式 (Utilities) |

`@librechat/agents` (主要的後端依賴，同團隊開發) 的原始碼位於 `/home/danny/agentus`。

---

## 工作區界限

- **所有新的後端代碼必須在 `/packages/api` 中使用 TypeScript 編寫**。
- 將 `/api` 的變更降至最低 (僅作為呼叫 `/packages/api` 的薄 JS 封裝層)。
- 資料庫特定的共享邏輯放在 `/packages/data-schemas` 中。
- 前端/後端共享的 API 邏輯 (端點、類型、資料服務) 放在 `/packages/data-provider` 中。
- 從專案根目錄構建 data-provider：`npm run build:data-provider`。

---

## 代碼風格 (Code Style)

### 結構與清晰度

- **絕不嵌套 (Never-nesting)**：採用提早返回 (Early returns)、扁平代碼、最小化縮進。將複雜操作拆解為命名良好的輔助函數。
- **函數式優先**：優先使用純函數、不可變資料，使用 `map`/`filter`/`reduce` 代替命令式迴圈。僅在能明顯改善領域建模或狀態封裝時才使用物件導向 (OOP)。
- **除非絕對必要，否則不使用動態導入 (Dynamic imports)**。

### DRY (Don't Repeat Yourself)

- 將重複邏輯提取到公用函數中。
- 為 UI 模式編寫可重用的 Hooks / 高階組件。
- 使用參數化輔助函數而非近乎重複的函數。
- 為重複值定義常量；使用配置物件而非重複的初始化代碼。
- 共享驗證器、集中式錯誤處理、業務規則的單一事實來源。
- 使用擴展自共同基礎定義的介面/類型建構共享類型系統。
- 為外部 API 交互提供抽象層。

### 迭代與性能

- **盡量減少迴圈** —— 特別是對於像訊息陣列 (Message arrays) 這樣在整個代碼庫中頻繁迭代的共享資料結構。在大規模運行時，每一次額外的遍歷都會累積成本。
- 盡可能將順序性的 O(n) 操作合併為單次遍歷；如果工作可以合併，絕不對同一個集合進行兩次迴圈。
- 選擇能減少迭代需求的資料結構 (例如：使用 `Map`/`Set` 進行查找，而非 `Array.find`/`Array.includes`)。
- 避免不必要的物件創建；考慮空間與時間的權衡。
- 防止記憶體洩漏：謹慎使用閉包 (Closures)，妥善處置資源/事件監聽器，避免循環引用。

### 類型安全 (Type Safety)

- **絕不使用 `any`**。為所有參數、返回值和變數定義明確類型。
- **限制使用 `unknown`** —— 避免使用 `unknown`, `Record<string, unknown>`, 以及 `as unknown as T` 類型斷言。`Record<string, unknown>` 通常暗示缺失了明確的類型定義。
- **不要重複定義類型** —— 在定義新類型之前，先檢查專案中是否已存在 (特別是 `packages/data-provider`)。重複使用並擴展現有類型，而非創建冗餘定義。
- 適當使用聯合類型 (Union types)、泛型 (Generics) 和介面 (Interfaces)。
- 必須解決所有 TypeScript 和 ESLint 的警告/錯誤 —— 不要留下未處理的診斷資訊。

### 註釋與文件

- 編寫自我解釋型代碼；不使用敘述性的行內註釋來解釋代碼行為。
- 僅針對複雜/非顯而易見的邏輯，或為了在公共 API 上提供 Intellisense 而編寫 JSDoc。
- 簡短文件使用單行 JSDoc，複雜案例使用多行。
- 除非絕對必要，否則避免使用獨立的 `//` 註釋。

### 導入順序 (Import Order)

導入分為三個部分：

1. **套件導入 (Package imports)** —— 按行長度由短到長排序 (`react` 始終排在第一位)。
2. **`import type` 導入** —— 按行長度由長到短排序 (先套件類型，後本地類型；子群組間長度重新計時)。
3. **本地/專案導入** —— 按行長度由長到短排序。

多行導入按所有行的總字元長度計算。合併來自同一模組的值導入。始終使用獨立的 `import type { ... }` —— 絕不在值導入中內聯 `type`。

### JS/TS 迴圈偏好

- **盡可能限制迴圈。** 偏向使用單次轉換，避免重新迭代相同的資料。
- 效能關鍵或依賴索引的操作使用 `for (let i = 0; ...)`。
- 簡單的陣列迭代使用 `for...of`。
- 僅在物件屬性枚舉時使用 `for...in`。

---

## 前端規則 (`client/src/**/*`)

### 本地化 (Localization)

- 所有面向用戶的文本必須使用 `useLocalize()`。
- 僅更新 `client/src/locales/en/translation.json` 中的英文鍵 (其他語言由外部自動化處理)。
- 語義化鍵前綴：`com_ui_`, `com_assistants_` 等。

### 組件 (Components)

- 所有 React 組件均使用 TypeScript，並正確導入類型。
- 使用語義化 HTML 並具備 ARIA 標籤 (`role`, `aria-label`) 以符合無障礙設計 (Accessibility)。
- 在功能目錄中對相關組件進行分組 (例如：`SidePanel/Memories/`)。
- 使用 index 檔案進行清晰的導出。

### 資料管理

- 功能 Hooks: `client/src/data-provider/[Feature]/queries.ts` → `[Feature]/index.ts` → `client/src/data-provider/index.ts`。
- 所有 API 交互均使用 React Query (`@tanstack/react-query`)；在變動 (Mutations) 時進行正確的查詢失效 (Invalidation) 處理。
- 在 `packages/data-provider/src/keys.ts` 中管理 QueryKeys 和 MutationKeys。

### Data-Provider 整合

- 端點 (Endpoints): `packages/data-provider/src/api-endpoints.ts`
- 資料服務 (Data service): `packages/data-provider/src/data-service.ts`
- 類型 (Types): `packages/data-provider/src/types/queries.ts`
- 為動態 URL 參數使用 `encodeURIComponent`。

### 性能

- 優先考慮大規模運行時的記憶體與速度效率。
- 為大數據集使用游標分頁 (Cursor pagination)。
- 使用正確的依賴陣列以避免不必要的重新渲染。
- 利用 React Query 的快取與背景重新獲取機制。

---

## 開發指令

| 指令 | 用途 |
|---|---|
| `npm run smart-reinstall` | 安裝依賴 (如果 lockfile 變更) + 透過 Turborepo 構建 |
| `npm run reinstall` | 全新安裝 —— 清除 `node_modules` 並從頭開始重新安裝 |
| `npm run backend` | 啟動後端伺服器 |
| `npm run backend:dev` | 啟動具備檔案監看功能的後端 (開發模式) |
| `npm run build` | 透過 Turborepo 構建所有編譯代碼 (並行、具快取) |
| `npm run frontend` | 順序構建所有編譯代碼 (遺留回退方案) |
| `npm run frontend:dev` | 啟動具備 HMR 的前端開發伺服器 (連接埠 3090，需啟動後端) |
| `npm run build:data-provider` | 變更後重新構建 `packages/data-provider` |

- Node.js: v20.19.0+ 或 ^22.12.0 或 >= 23.0.0
- 資料庫: MongoDB
- 後端運行於 `http://localhost:3080/`；前端開發伺服器運行於 `http://localhost:3090/`

---

## 測試

- 框架：**Jest**，按工作區執行。
- 從其工作區目錄執行測試：`cd api && npx jest <pattern>`, `cd packages/api && npx jest <pattern>` 等。
- 前端測試：在組件旁邊的 `__tests__` 目錄；使用 `test/layout-test-utils` 進行渲染。
- 涵蓋 UI/資料流的載入中 (Loading)、成功與錯誤狀態。
- 模擬 (Mock) data-provider Hooks 與外部依賴。

---

## 格式化

使用自動修復功能 (若可用) 修復所有格式 Lint 錯誤 (尾隨空格、Tab、換行、縮進)。所有 TypeScript/ESLint 的警告與錯誤**必須**被解決。
